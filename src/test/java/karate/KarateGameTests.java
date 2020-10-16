package karate;

import com.intuit.karate.junit5.Karate;

public class KarateGameTests {
	
	@Karate.Test
    Karate testGames() {
        return Karate.run("gameList","game").relativeTo(getClass());
    }
}
