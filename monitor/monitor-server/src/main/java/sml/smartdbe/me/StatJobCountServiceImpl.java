package sml.smartdbe.me;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings("serial")
public class StatJobCountServiceImpl extends RemoteServiceServlet implements StatJobCountService {
    @Override
    public Map<String, Integer> jobCount() throws IllegalArgumentException {
        DBHelper dbHelper = new DBHelper();
        List<Map<String, Object>> items = dbHelper.queryJobCount();

        Map<String, Integer> r = new HashMap<>();
        for (Map<String, Object> item : items) {
            r.put(item.get("jobname").toString(), Integer.parseInt(item.get("num").toString()));
        }
        return r;
    }
}
