package ua.lviv.iot.service.impl;

import ua.lviv.iot.dao.impl.LecturerDaoImpl;
import ua.lviv.iot.model.Lecturer;

public class CallAddressServiceImpl extends AbstractServiceImpl<Lecturer, Integer> {
    public CallAddressServiceImpl() {
        super(new LecturerDaoImpl());
    }
}
