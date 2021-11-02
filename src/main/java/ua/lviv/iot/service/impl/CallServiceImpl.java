package ua.lviv.iot.service.impl;

import ua.lviv.iot.dao.impl.ClusterProgramDaoImpl;
import ua.lviv.iot.model.ClusterProgram;

public class CallServiceImpl extends AbstractServiceImpl<ClusterProgram, Integer> {
    public CallServiceImpl() {
        super(new ClusterProgramDaoImpl());
    }
}
