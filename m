Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E78435A7C4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 22:21:06 +0200 (CEST)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUxcn-0004NY-6Z
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 16:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wLVwYAcKCvcudmstqdfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--venture.bounces.google.com>)
 id 1lUxWv-0008Rm-ME
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:15:10 -0400
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:50326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wLVwYAcKCvcudmstqdfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--venture.bounces.google.com>)
 id 1lUxWs-0000G8-Eq
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:15:01 -0400
Received: by mail-qk1-x749.google.com with SMTP id p133so4040857qka.17
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 13:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=/nZIqirGm/4hMePzQ47kJsD6GC6cfP2kwpUtkwbOQ3w=;
 b=nKegeAjGrvU1JWC+3iv34rFEQsL4FBeVyxvluk/nOCLCOzErkRkCH6rfRlUc4rbW8I
 4N5sYzHTLXLMZT4A/FPfAM2gx6d2X9ckUYMXnrcGxp9TA+YIIbVHruIJHA0vxswlaQJD
 Xua3LpGRZ6QlFse+BRyZ0Yao1JB8IilQQBXCW/wA/l0QDSpe5Wi6XQKx0QIP7YE5yorx
 hTtK6ved20YE2sQ62CMkwXACzTlelisYKY3rL8hBw20vUz6tW7mJuEPYOvsS5kFNsSH5
 IQO5YLbLodm6iQns//7WNS+mksE8fTlyOGBgIbzVTN/YO/FkpsQkuOPX7uhhgoobA0C9
 kw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=/nZIqirGm/4hMePzQ47kJsD6GC6cfP2kwpUtkwbOQ3w=;
 b=hz/09l2DGM2UCISZMiHr1AiIyNGzmZHPJARCurlqDyN0m9Ib10/EEoCCvvz+K8X1c3
 sgeQIKAw/CyhPCOweLIRnvqJJ9HlCf0O0OI+9B+cNcbhszn3aNtmPJKB7RFfUXVmlJRg
 +/zOqHzKG6+7Nl8/I3AmZDDDBvtcrSX051Af35+o/eE/Ua3/tTD7ADcQgVZxGeylJwRO
 BCrssZSt7iC9W2DPe4BDgpXOfvRKF8TqH4hB8MsWpyn0ODTmNN6PZJ78pn5tayWpvQkL
 ebMY+3H9OdBTgwM/drBASE99pVULKSI2z+jooDdjBXWSqcNtRprDvqhfY8+j2J+exeXc
 +gfA==
X-Gm-Message-State: AOAM5334ll96JDpB1Hm1ysKTdNauRpF+73I7Pft597QEm3Elu9vTNOL9
 W9haUp7uoqdkcu6X5JC8EwuK5wB2Gb+q
X-Google-Smtp-Source: ABdhPJwoMfk8Dsv4W53L1UAoo2xM5zah8i+/Lwp67mh+jD6JUE4+2t4JGhkPxWG6A51DC2LK8XLcJ3EC9wwD
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:ec3:6619:183b:36d8])
 (user=venture job=sendgmr) by 2002:a0c:85a5:: with SMTP id
 o34mr4211593qva.38.1617999296803; Fri, 09 Apr 2021 13:14:56 -0700 (PDT)
Date: Fri,  9 Apr 2021 13:14:42 -0700
In-Reply-To: <20210409201443.111197-1-venture@google.com>
Message-Id: <20210409201443.111197-4-venture@google.com>
Mime-Version: 1.0
References: <20210409201443.111197-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v3 3/4] hw/i2c: move search to i2c_scan_bus method
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 f4bug@amsat.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3wLVwYAcKCvcudmstqdfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--venture.bounces.google.com;
 helo=mail-qk1-x749.google.com
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

Moves the search for matching devices on an i2c bus into a separate
method.  This allows for an object that owns an I2CBus can avoid
duplicating this method.

Tested: A BMC firmware was booted to userspace and i2c devices were
detected.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/i2c/core.c        | 38 ++++++++++++++++++++++++++------------
 include/hw/i2c/i2c.h |  1 +
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index d03b0eea5c..12981cea2d 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -77,6 +77,30 @@ int i2c_bus_busy(I2CBus *bus)
     return !QLIST_EMPTY(&bus->current_devs);
 }
 
+bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast)
+{
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &bus->qbus.children, sibling) {
+        DeviceState *qdev = kid->child;
+        I2CSlave *candidate = I2C_SLAVE(qdev);
+        I2CSlaveClass *sc = I2C_SLAVE_GET_CLASS(candidate);
+
+        if (sc->match_and_add(candidate, address, broadcast,
+                              &bus->current_devs)) {
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
+        (void)i2c_scan_bus(bus, address, bus->broadcast);
         bus_scanned = true;
     }
 
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 9b8b95ff4a..45915f3303 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -87,6 +87,7 @@ void i2c_nack(I2CBus *bus);
 int i2c_send_recv(I2CBus *bus, uint8_t *data, bool send);
 int i2c_send(I2CBus *bus, uint8_t data);
 uint8_t i2c_recv(I2CBus *bus);
+bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast);
 
 /**
  * Create an I2C slave device on the heap.
-- 
2.31.1.295.g9ea45b61b8-goog


