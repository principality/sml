package me.smartbde.sml.commonutils.plugins.output;

import javafx.util.Pair;
import me.smartbde.sml.commonutils.AbstractPlugin;
import me.smartbde.sml.commonutils.IOutput;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SaveMode;
import org.apache.spark.sql.SparkSession;

/**
 * 格式输入要求：行格式
 */
public class FileOutput extends AbstractPlugin implements IOutput {
    @Override
    public void process(Dataset<Row> df) {
        df.write().mode(SaveMode.Overwrite).text(properties.get("path"));
    }

    /**
     * Return true and empty string if config is valid, return false and error message if config is invalid.
     */
    @Override
    public Pair<Boolean, String> checkConfig() {
        if (properties == null) {
            return new Pair<>(false, "missing config");
        }

        if (properties.get("path") != null) {
            return new Pair<>(true, "");
        }

        return new Pair<>(false, "missing config");
    }

    /**
     * Get Plugin Name.
     */
    @Override
    public String getName() {
        return "FileOutput";
    }
}
