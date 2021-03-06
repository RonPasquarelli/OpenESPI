/*******************************************************************************
 * Copyright (c) 2011, 2012 EnergyOS.Org
 *
 * Licensed by EnergyOS.Org under one or more contributor license agreements.
 * See the NOTICE file distributed with this work for additional information
 * regarding copyright ownership.  The EnergyOS.org licenses this file
 * to you under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License.  You may obtain a copy
 * of the License at:
 *  
 *   http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 *  
 ******************************************************************************
*/

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.energyos.espi.thirdparty.common;

import java.util.List;
import org.energyos.espi.thirdparty.common.AuthorizationStatus;
import org.energyos.espi.thirdparty.common.AuthorizationStatusDataOnDemand;
import org.energyos.espi.thirdparty.common.AuthorizationStatusIntegrationTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AuthorizationStatusIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AuthorizationStatusIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AuthorizationStatusIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: AuthorizationStatusIntegrationTest: @Transactional;
    
    @Autowired
    private AuthorizationStatusDataOnDemand AuthorizationStatusIntegrationTest.dod;
    
    @Test
    public void AuthorizationStatusIntegrationTest.testCountAuthorizationStatuses() {
        Assert.assertNotNull("Data on demand for 'AuthorizationStatus' failed to initialize correctly", dod.getRandomAuthorizationStatus());
        long count = AuthorizationStatus.countAuthorizationStatuses();
        Assert.assertTrue("Counter for 'AuthorizationStatus' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AuthorizationStatusIntegrationTest.testFindAuthorizationStatus() {
        AuthorizationStatus obj = dod.getRandomAuthorizationStatus();
        Assert.assertNotNull("Data on demand for 'AuthorizationStatus' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'AuthorizationStatus' failed to provide an identifier", id);
        obj = AuthorizationStatus.findAuthorizationStatus(id);
        Assert.assertNotNull("Find method for 'AuthorizationStatus' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'AuthorizationStatus' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void AuthorizationStatusIntegrationTest.testFindAllAuthorizationStatuses() {
        Assert.assertNotNull("Data on demand for 'AuthorizationStatus' failed to initialize correctly", dod.getRandomAuthorizationStatus());
        long count = AuthorizationStatus.countAuthorizationStatuses();
        Assert.assertTrue("Too expensive to perform a find all test for 'AuthorizationStatus', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<AuthorizationStatus> result = AuthorizationStatus.findAllAuthorizationStatuses();
        Assert.assertNotNull("Find all method for 'AuthorizationStatus' illegally returned null", result);
        Assert.assertTrue("Find all method for 'AuthorizationStatus' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AuthorizationStatusIntegrationTest.testFindAuthorizationStatusEntries() {
        Assert.assertNotNull("Data on demand for 'AuthorizationStatus' failed to initialize correctly", dod.getRandomAuthorizationStatus());
        long count = AuthorizationStatus.countAuthorizationStatuses();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<AuthorizationStatus> result = AuthorizationStatus.findAuthorizationStatusEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'AuthorizationStatus' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'AuthorizationStatus' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void AuthorizationStatusIntegrationTest.testFlush() {
        AuthorizationStatus obj = dod.getRandomAuthorizationStatus();
        Assert.assertNotNull("Data on demand for 'AuthorizationStatus' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'AuthorizationStatus' failed to provide an identifier", id);
        obj = AuthorizationStatus.findAuthorizationStatus(id);
        Assert.assertNotNull("Find method for 'AuthorizationStatus' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAuthorizationStatus(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'AuthorizationStatus' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AuthorizationStatusIntegrationTest.testMergeUpdate() {
        AuthorizationStatus obj = dod.getRandomAuthorizationStatus();
        Assert.assertNotNull("Data on demand for 'AuthorizationStatus' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'AuthorizationStatus' failed to provide an identifier", id);
        obj = AuthorizationStatus.findAuthorizationStatus(id);
        boolean modified =  dod.modifyAuthorizationStatus(obj);
        Integer currentVersion = obj.getVersion();
        AuthorizationStatus merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'AuthorizationStatus' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AuthorizationStatusIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'AuthorizationStatus' failed to initialize correctly", dod.getRandomAuthorizationStatus());
        AuthorizationStatus obj = dod.getNewTransientAuthorizationStatus(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'AuthorizationStatus' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'AuthorizationStatus' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'AuthorizationStatus' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void AuthorizationStatusIntegrationTest.testRemove() {
        AuthorizationStatus obj = dod.getRandomAuthorizationStatus();
        Assert.assertNotNull("Data on demand for 'AuthorizationStatus' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'AuthorizationStatus' failed to provide an identifier", id);
        obj = AuthorizationStatus.findAuthorizationStatus(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'AuthorizationStatus' with identifier '" + id + "'", AuthorizationStatus.findAuthorizationStatus(id));
    }
    
}
