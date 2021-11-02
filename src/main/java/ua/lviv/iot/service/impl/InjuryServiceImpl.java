package ua.lviv.iot.service.impl;

import ua.lviv.iot.dao.impl.SpeakerDaoImpl;
import ua.lviv.iot.model.Injury;

public class InjuryServiceImpl extends AbstractServiceImpl<Injury, Integer> {
    public InjuryServiceImpl() {
        super(new SpeakerDaoImpl());
    }
}
