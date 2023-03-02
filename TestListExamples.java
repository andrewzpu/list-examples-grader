import static org.junit.Assert.*;
import org.junit.*;

import java.beans.Transient;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

public class TestListExamples {
    @Test(timeout = 500)
    public void testMergeRightEnd() {
      List<String> left = Arrays.asList("a", "b", "c");
      List<String> right = Arrays.asList("a", "d");
      List<String> merged = ListExamples.merge(left, right);
      List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
      assertEquals(expected, merged);
    }

    @Test(timeout = 500)
    public void testFilter() {
        StringChecker ismoon = new IsMoon();
        List<String> input = Arrays.asList("moon","test","Moon");
        List<String> filtered = ListExamples.filter(input,ismoon);
        List<String> expected = Arrays.asList("moon","Moon");
        assertEquals(expected, filtered);

    }

    @Test
    public void testTrue() {
        assertTrue(true);
    }

    @Test
    public void testagain() {
        assertTrue(true);
    }
}
