Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DFC35A370
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:33:04 +0200 (CEST)
Received: from localhost ([::1]:47084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUu47-00044Z-Jr
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3GoBwYAcKCuUcLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com>)
 id 1lUtxT-0005RM-CK
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:26:11 -0400
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a]:49204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3GoBwYAcKCuUcLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com>)
 id 1lUtxM-0007U9-I2
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:26:11 -0400
Received: by mail-qv1-xf4a.google.com with SMTP id s8so3470994qve.16
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 09:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=O27tGi51CsQG7yDvwmP852qZ1gjQhBSmWisJIHI1BPM=;
 b=n5RRVLdHnuKNNDuRVrj+6GzER6fWinZ5BJMybprZNcJv4fWTKb7I6e0phCcbxiprfE
 iSVI3xD4xzUxSPTWLHKwxSKk9R4eRMvx4BblJi+0pDYTKIvwrVieUDb5S50iO/jIZLG7
 hvKV+T+/fQoNzQl6UKQbRmAvqClK0UYcZfm5vVR7qGpf7La7E1hLioXOUtkp+iyvyIYo
 3LIztE0GKOfll2EKtUg2mIVYr8lSDrHg0I9wBdm2Dgrcuz6IqskfAE8d8MntD/iBXgOx
 eBwaGik+CpbwJeBlbbhGJfJeAia0euXWR7V/pRifOArpSzaPnH2jY5t9oOrQBGy/MDSF
 2gKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=O27tGi51CsQG7yDvwmP852qZ1gjQhBSmWisJIHI1BPM=;
 b=HZgovUKJ6/3zydwu9tMlnZZgE0DdZe5s6OnHp0/kS6F5Lr/0kAz+mTjwy2kJbuWih6
 BF7lw0SZTB+H7QTkcaU/7SnSejv9/28pCXEIjPE0fiYJdDplFoNLpx7v3q8aJqwwAa8V
 83l5W3+H3Zf2iXxWsczcNEHU9cUH6E+YdHVoSMzUozbUZN82IRxcbiSGYqHyEZ/hQCoG
 bUU8asn6BH6YGnYmeq4x3pdYVi+ZkXksQHoaCffVKWtMBDN9vdAFeqWLJIJUqb80oXMA
 ramkYhUOnT1jTYrRkBO9gF1euzJEdPtgQkMkZzlHkA8UdeuYm8RrydIqvbVib9sDSNIO
 cCkA==
X-Gm-Message-State: AOAM533SrhBsLgK7S68onvEIiGURK83ge8yupxIqlxtbDiFEW5Lt7ZNb
 bzxGYSKaXkxJ7ToRl+9y6v95ylDGiUMF
X-Google-Smtp-Source: ABdhPJys0yF7kHS0+hVldyKNk0Krz/D0pWUJ/n+dU8bdFkkYRQV9RoAoa1hRLMUUghMZUyD5abVzkNpVpyYd
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:6985:9b01:e10b:b119])
 (user=venture job=sendgmr) by 2002:a0c:f702:: with SMTP id
 w2mr15018802qvn.0.1617985562916; Fri, 09 Apr 2021 09:26:02 -0700 (PDT)
Date: Fri,  9 Apr 2021 09:25:43 -0700
In-Reply-To: <20210409162545.3705962-1-venture@google.com>
Message-Id: <20210409162545.3705962-3-venture@google.com>
Mime-Version: 1.0
References: <20210409162545.3705962-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v2 2/4] hw/i2c: add match method for device search
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=3GoBwYAcKCuUcLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the start of an i2c transaction, the i2c bus searches its list of
children to identify which devices correspond to the address (or
broadcast).  Now the I2CSlave device has a method "match" that
encapsulates the lookup behavior. This allows the behavior to be changed
to support devices, such as i2c muxes.

Tested: A BMC firmware was booted to userspace and i2c devices were
detected.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/i2c/core.c        | 23 +++++++++++++++++++----
 include/hw/i2c/i2c.h | 11 +++++++++++
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 21ec52ac5a..d03b0eea5c 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -118,10 +118,9 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
         QTAILQ_FOREACH(kid, &bus->qbus.children, sibling) {
             DeviceState *qdev = kid->child;
             I2CSlave *candidate = I2C_SLAVE(qdev);
-            if ((candidate->address == address) || (bus->broadcast)) {
-                node = g_malloc(sizeof(struct I2CNode));
-                node->elt = candidate;
-                QLIST_INSERT_HEAD(&bus->current_devs, node, next);
+            sc = I2C_SLAVE_GET_CLASS(candidate);
+            if (sc->match_and_add(candidate, address, bus->broadcast,
+                                  &bus->current_devs)) {
                 if (!bus->broadcast) {
                     break;
                 }
@@ -290,12 +289,28 @@ I2CSlave *i2c_slave_create_simple(I2CBus *bus, const char *name, uint8_t addr)
     return dev;
 }
 
+static bool i2c_slave_match(I2CSlave *candidate, uint8_t address,
+                            bool broadcast, I2CNodeList *current_devs)
+{
+    if ((candidate->address == address) || (broadcast)) {
+        I2CNode *node = g_malloc(sizeof(struct I2CNode));
+        node->elt = candidate;
+        QLIST_INSERT_HEAD(current_devs, node, next);
+        return true;
+    }
+
+    /* Not found and not broadcast. */
+    return false;
+}
+
 static void i2c_slave_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *k = DEVICE_CLASS(klass);
+    I2CSlaveClass *sc = I2C_SLAVE_CLASS(klass);
     set_bit(DEVICE_CATEGORY_MISC, k->categories);
     k->bus_type = TYPE_I2C_BUS;
     device_class_set_props(k, i2c_props);
+    sc->match_and_add = i2c_slave_match;
 }
 
 static const TypeInfo i2c_slave_type_info = {
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 1f7c268c86..9b8b95ff4a 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -16,6 +16,7 @@ enum i2c_event {
     I2C_NACK /* Masker NACKed a receive byte.  */
 };
 
+typedef struct I2CNodeList I2CNodeList;
 
 #define TYPE_I2C_SLAVE "i2c-slave"
 OBJECT_DECLARE_TYPE(I2CSlave, I2CSlaveClass,
@@ -39,6 +40,16 @@ struct I2CSlaveClass {
      * return code is not used and should be zero.
      */
     int (*event)(I2CSlave *s, enum i2c_event event);
+
+    /*
+     * Check if this device matches the address provided.  Returns bool of
+     * true if it matches (or broadcast), and updates the device list, false
+     * otherwise.
+     *
+     * If broadcast is true, match should add the device and return true.
+     */
+    bool (*match_and_add)(I2CSlave *candidate, uint8_t address, bool broadcast,
+                          I2CNodeList *current_devs);
 };
 
 struct I2CSlave {
-- 
2.31.1.295.g9ea45b61b8-goog


