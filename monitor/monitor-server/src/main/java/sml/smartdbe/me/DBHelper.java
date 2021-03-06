package sml.smartdbe.me;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;

import java.util.List;
import java.util.Map;

public class DBHelper {
    private static final Jdbi queryJdbi = Jdbi.create(
            PropertiesUtil.prop("application.datasource.url"),
            PropertiesUtil.prop("application.datasource.username"),
            PropertiesUtil.prop("application.datasource.password"));
    private static final Handle queryHandle = queryJdbi.open();

    public List<Map<String, Object>> queryObjects(String query) {
        String sql = String.format(query);

        List<Map<String, Object>> items = queryHandle.createQuery(sql)
                .mapToMap()
                .list();

        return items;
    }
}
