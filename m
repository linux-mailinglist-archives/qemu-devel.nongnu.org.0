Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DAC35D170
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 21:49:00 +0200 (CEST)
Received: from localhost ([::1]:41316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW2YM-0001O2-Vb
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 15:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3aqN0YAcKCo0Cv4AB8vx55x2v.t537v3B-uvCv2454x4B.58x@flex--venture.bounces.google.com>)
 id 1lW2VK-0007c0-Jk
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 15:45:50 -0400
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a]:55685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3aqN0YAcKCo0Cv4AB8vx55x2v.t537v3B-uvCv2454x4B.58x@flex--venture.bounces.google.com>)
 id 1lW2VI-0006c4-KW
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 15:45:50 -0400
Received: by mail-qv1-xf4a.google.com with SMTP id c3so1782728qvz.22
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 12:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=vTNQZph+mmhx41KVFmqkH1vkW23g4F/59TyxIDVYtpA=;
 b=eI6gqLjj4kfJh7AW+txjVbqcuLDZU4IASnv7F/HPWGAI1xXDwR7WMhcS5RWNnLNtA/
 6vOf56h8EXJ6cnpZhxmOdFU7JzGVwRFHKqVSTuP5TieOvAAd/RLx6vYINHVG0m0bjrsW
 z7Ua0fsHmuJszs+DT7lSrCunMP7DMsHqShDdqvyXAqbFG7xxnM+SfMV607IEhwmf2RoU
 8U6Ck4y2hQ/2GWo4VMS/flT3bbbBh47IT1+I1Bz8YkT0DmcVt3efjS79pdHKYkvRSC8X
 Xw07HJ2fVu02lqC+1Fy6ZIVTPGZlxPSF3Xy9+wTCxxfz1yxJr8V18y61eHnIGH+NFH74
 b/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=vTNQZph+mmhx41KVFmqkH1vkW23g4F/59TyxIDVYtpA=;
 b=hl61SA1HYkIqfUtBcmQvmJh9CvwUYOLvcltsJjkpyvqopXncyL8Oq9WEvTITGa/mOr
 f4AraHBp5XQMdSJX88MCrjlbcjqC24MdwhcE0PMZRHNtxdNfvxUe7fU4XfQ5T1X/j5ts
 cFGYJAlhcEhB0p/D0iVFTqvU67m0uc9BH7DV8GVdfX2FlXwTdhjmWCEXvsD5vp2CHdiR
 BIHEQoF3QlwaY83M4sTltyym/6PJQW1mKVPlMA3u/5QW8QNqB8QgQZi/vk0Oiz24sT3D
 TjI7PCH92NywFAIWV40M8ppZDTM//Pxu2v8USqhBsEGde/bhNeJko8+/v29FxBytRNdG
 YrHA==
X-Gm-Message-State: AOAM532eLHriWNr/BYh5Smq/b6ej+CpNoNOS+JlCvs711NVCiJFYbiox
 1PO9Scwb3P8ghxjfxcZVc6FnLXdmZ6Tc
X-Google-Smtp-Source: ABdhPJzhxJ5e0CZurHf3F1cyYJ1Dpih9kwZt/qY1eV+dmSg89lhBQFVQRwjeRmc+yDdCsDpWWhfFZP+vMqX7
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:7285:fb47:eb76:b9a4])
 (user=venture job=sendgmr) by 2002:a05:6214:ca4:: with SMTP id
 s4mr29167512qvs.44.1618256746748; Mon, 12 Apr 2021 12:45:46 -0700 (PDT)
Date: Mon, 12 Apr 2021 12:45:21 -0700
In-Reply-To: <20210412194522.664594-1-venture@google.com>
Message-Id: <20210412194522.664594-4-venture@google.com>
Mime-Version: 1.0
References: <20210412194522.664594-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v4 3/4] hw/i2c: move search to i2c_scan_bus method
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=3aqN0YAcKCo0Cv4AB8vx55x2v.t537v3B-uvCv2454x4B.58x@flex--venture.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Moves the search for matching devices on an i2c bus into a separate
method.  This allows for an object that owns an I2CBus can avoid
duplicating this method.

Tested: A BMC firmware was booted to userspace and i2c devices were
detected.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/i2c/core.c        | 38 ++++++++++++++++++++++++++------------
 include/hw/i2c/i2c.h |  2 ++
 2 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index d03b0eea5c..3a7bae311d 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -77,6 +77,30 @@ int i2c_bus_busy(I2CBus *bus)
     return !QLIST_EMPTY(&bus->current_devs);
 }
 
+bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
+                  I2CNodeList *current_devs)
+{
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &bus->qbus.children, sibling) {
+        DeviceState *qdev = kid->child;
+        I2CSlave *candidate = I2C_SLAVE(qdev);
+        I2CSlaveClass *sc = I2C_SLAVE_GET_CLASS(candidate);
+
+        if (sc->match_and_add(candidate, address, broadcast, current_devs)) {
+            if (!broadcast) {
+                return true;
+            }
+        }
+    }
+
+    /*
+     * If broadcast was true, and the list was full or empty, return true. If
+     * broadcast was false, return false.
+     */
+    return broadcast;
+}
+
 /* TODO: Make this handle multiple masters.  */
 /*
  * Start or continue an i2c transaction.  When this is called for the
@@ -93,7 +117,6 @@ int i2c_bus_busy(I2CBus *bus)
  */
 int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
 {
-    BusChild *kid;
     I2CSlaveClass *sc;
     I2CNode *node;
     bool bus_scanned = false;
@@ -115,17 +138,8 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
      * terminating the previous transaction.
      */
     if (QLIST_EMPTY(&bus->current_devs)) {
-        QTAILQ_FOREACH(kid, &bus->qbus.children, sibling) {
-            DeviceState *qdev = kid->child;
-            I2CSlave *candidate = I2C_SLAVE(qdev);
-            sc = I2C_SLAVE_GET_CLASS(candidate);
-            if (sc->match_and_add(candidate, address, bus->broadcast,
-                                  &bus->current_devs)) {
-                if (!bus->broadcast) {
-                    break;
-                }
-            }
-        }
+        /* Disregard whether devices were found. */
+        (void)i2c_scan_bus(bus, address, bus->broadcast, &bus->current_devs);
         bus_scanned = true;
     }
 
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 9b8b95ff4a..ff4129ea70 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -87,6 +87,8 @@ void i2c_nack(I2CBus *bus);
 int i2c_send_recv(I2CBus *bus, uint8_t *data, bool send);
 int i2c_send(I2CBus *bus, uint8_t data);
 uint8_t i2c_recv(I2CBus *bus);
+bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
+                  I2CNodeList *current_devs);
 
 /**
  * Create an I2C slave device on the heap.
-- 
2.31.1.295.g9ea45b61b8-goog


