Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA2635A3E7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:46:08 +0200 (CEST)
Received: from localhost ([::1]:44430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUuGl-0006eb-Ol
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3HYBwYAcKCugfOXdebOQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--venture.bounces.google.com>)
 id 1lUtxW-0005Yv-2E
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:26:14 -0400
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:53738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3HYBwYAcKCugfOXdebOQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--venture.bounces.google.com>)
 id 1lUtxS-0007VE-Op
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:26:13 -0400
Received: by mail-qt1-x84a.google.com with SMTP id u13so3385642qtv.20
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 09:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=/nZIqirGm/4hMePzQ47kJsD6GC6cfP2kwpUtkwbOQ3w=;
 b=T36F7rw/kBF+6HKCsr8xf+rfqzT1nrevkwj4jQWTvQFmZGLMSOvYOY2IQKv40/sGiD
 Bf5m8EPKhksUICsYl/HPC9BJF/SSds0E8Tj6NK2qLPqxA9QJMHXCiP0oKqXOsEMoAHmc
 EQbrarbhoI6ZJAguM5Sb12j/kIZrJe350TJL8Q86LkCmlyKkBb1sox9SQrHmmsIyQAvL
 ui8wVolRwf8RbNGCjmd4/bcT6wn04curF4doTFl4yLAAP8jenxKdd+/5VU7yxM9rGiVN
 KpaSo9ko7jNC1rujd6BaqZeoXDx7iROLYmlmCqc0NKtxIWFo6epfrbCdfXkORWmRuZoC
 YGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=/nZIqirGm/4hMePzQ47kJsD6GC6cfP2kwpUtkwbOQ3w=;
 b=G7PXdpC5OROGBJfNWaN2k6i5kNow9ahHt9+4fbOmWy0+vGSCKE6ex8syhmRquAsBrY
 9S/yZzziiKq2yExhVe5knROojAd4eqfVSunm1cqTDKgG978OyDylHjeX3FoNvs80xdP1
 LE1tZxhti6t342n3Bm5f3EUCEEoKN1MKYUozpeEHQXf1gVvn1Y8y2uBnbp9Awt+4tF/A
 /X9HrWR5DJZMATMtW/ZCRLJti3nRz/IV9VTN0xW+EK0w1ojykBS0PMsgMswaEAQvgjmm
 7OV9xYJt4njIYllzqgq691/d1L29y+9yYYmvrwCBQqP5iJ+raBW/4ITx7hDZXIUDji8V
 Sqmw==
X-Gm-Message-State: AOAM532PEzztf9TszOh2INVWdGDiWPlA5gxyStnVSqjraTPNfE1LjvDA
 oT84QNeB4ydvbLIXYnRytaioMfofYQLA
X-Google-Smtp-Source: ABdhPJzjH+3Z/j7Q7SY2mT9hVxZ+mFfs4LAsUTnoAdypM3WB0ogeUI1hcz/GKLCK1xN5zFdso5uVNvES++0N
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:6985:9b01:e10b:b119])
 (user=venture job=sendgmr) by 2002:a0c:9e17:: with SMTP id
 p23mr1897329qve.7.1617985565516; Fri, 09 Apr 2021 09:26:05 -0700 (PDT)
Date: Fri,  9 Apr 2021 09:25:44 -0700
In-Reply-To: <20210409162545.3705962-1-venture@google.com>
Message-Id: <20210409162545.3705962-4-venture@google.com>
Mime-Version: 1.0
References: <20210409162545.3705962-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v2 3/4] hw/i2c: move search to i2c_scan_bus method
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3HYBwYAcKCugfOXdebOQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--venture.bounces.google.com;
 helo=mail-qt1-x84a.google.com
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


