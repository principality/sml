package principality.me.springtest;

import org.apache.spark.sql.SparkSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringRunner;
import principality.me.sample.JavaLRSample;

@RunWith(SpringRunner.class)
public class JavaLRSampleTests {
    @Test
    public void test() throws Exception {
        JavaLRSample lrSample = new JavaLRSample();

        SparkSession spark = SparkSession.builder().appName("JavaLRSampleTests").getOrCreate();
        lrSample.run(spark, "..\\data\\mllib\\sample_linear_regression_data.txt", 10);

        spark.stop();
    }
}