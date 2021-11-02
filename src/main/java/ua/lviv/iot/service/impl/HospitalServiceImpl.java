package ua.lviv.iot.service.impl;

import ua.lviv.iot.dao.impl.ResponseDaoImpl;
import ua.lviv.iot.model.Hospital;

public class HospitalServiceImpl extends AbstractServiceImpl<Hospital, Integer> {
    public HospitalServiceImpl() {
        super(new ResponseDaoImpl());
    }
}
