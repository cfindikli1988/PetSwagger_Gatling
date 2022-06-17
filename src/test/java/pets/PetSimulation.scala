package pets

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef.{Simulation, openInjectionProfileFactory, rampUsers, scenario}

import scala.concurrent.duration.DurationInt
import scala.language.postfixOps

class PetSimulation extends Simulation {

  val getSinglePet = scenario("simple get").exec(karateFeature("classpath:pets/Pets.feature@name=simple"))
  val postSinglePet = scenario("basic post").exec(karateFeature("classpath:pets/Pets.feature@name=post"))

  val protocol = karateProtocol(
    "/pets" -> pauseFor("get" -> 0, "post" -> 0)
  )

  setUp(
    getSinglePet.inject(rampUsers(30) during (10 seconds)).protocols(protocol),
    postSinglePet.inject(rampUsers(30) during (10 seconds)).protocols(protocol)
  )
}