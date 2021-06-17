Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F173AB341
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:07:05 +0200 (CEST)
Received: from localhost ([::1]:39464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqnY-0005t2-2U
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqbj-0000xk-27
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:51 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:34417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqbf-0005dQ-R2
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:50 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso4761300wmc.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cTmXbAZuVSJ/iAUXGS3uU1Sg/xrnfGmybw7wWkCyin8=;
 b=n5mOzI+QEg/h8yQEy2G7Yx79vFljUN7KfsGw5Tvirhh5YwQtSXCnyBCh5Au4JdnoQL
 2djrqIc8ZUi5zryKsjF7RzLZfjGM8kM4iaGhiDGf4d2rz6dsTtMul/42sJPripR9xxQY
 XBnVZBXNGo4rP6GRz8tVO4IB+vjty1PKHHDO2d7yNZxqfL2QpqcoxGlbgPsqPoEE1ZMT
 1V3btKBRJTN2DFoZrxdFGvHJGGExxJDGb9iMNYPNuGDYC+tTsH/eaME71E5A/itpir+j
 Vs1R+bEmej850VIfmuuvJRPo3BQ7qm49t5lx/y1Shj5TJzCZZuyoxH9Wh+AqyxbQeN0f
 6LKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cTmXbAZuVSJ/iAUXGS3uU1Sg/xrnfGmybw7wWkCyin8=;
 b=sdAzUG+X7c9Er8KpIxVpJ4egA4cr8HmszaLbIy+6lLqkPVFVvVELGTDmDWLSSmuvM9
 rfR724P6tXfLYf8n8rSZYCy2XKwtGDa+WJ/CNXAFsLvRz95zFj+uFT+YdF/imwfjvaJs
 4unx76B/g8B243BHwg6Ml0FPkohhv0ChTGj+OJ3FW4TuRzchop7WE3HOCsXwMjk0OGgF
 Lx3F/0iq0J7oPZcdxil7fW/y9NghksNfzVNiqqeH8fEmY20gTBOF9714dkE47E/Wskib
 71q0bzWH+HnqVbpd84jGt8yi0qMTSHLFYf3jsr+SczEITrRwzWkveXyVUZdgK+ltJlFG
 P7tQ==
X-Gm-Message-State: AOAM532364i+YF7iV1eyad9B6dou2R64wD/7YSq+468ij6WsSqX3s8qB
 WqMD+gxhWGQwiJmskiv6Pm13jHAfTIq8Bg==
X-Google-Smtp-Source: ABdhPJwwVeom4mbpOdacLMHniBDEf1Nw94Zd+2Qdz7LwchYqJZMcafxa8FAPgPfNmXxz0c5FweCbHQ==
X-Received: by 2002:a05:600c:22cf:: with SMTP id
 15mr4704358wmg.144.1623930886202; 
 Thu, 17 Jun 2021 04:54:46 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id j1sm4415717wmi.44.2021.06.17.04.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:54:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/15] hw/i2c: Introduce i2c_start_recv() and
 i2c_start_send()
Date: Thu, 17 Jun 2021 13:53:34 +0200
Message-Id: <20210617115334.2761573-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617115334.2761573-1-f4bug@amsat.org>
References: <20210617115334.2761573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To ease reviewing code using the I2C bus API, introduce the
i2c_start_recv() and i2c_start_send() helpers which don't
take the confusing 'is_recv' boolean argument.

Use these new helpers in the SMBus / AUX bus models.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i2c/i2c.h  | 24 ++++++++++++++++++++++++
 hw/i2c/core.c         | 10 ++++++++++
 hw/i2c/pm_smbus.c     |  4 ++--
 hw/i2c/smbus_master.c | 22 +++++++++++-----------
 hw/misc/auxbus.c      | 12 ++++++------
 5 files changed, 53 insertions(+), 19 deletions(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 21f2dba1bf7..5ca3b708c0b 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -88,9 +88,33 @@ int i2c_bus_busy(I2CBus *bus);
  * @address: address of the slave
  * @is_recv: indicates the transfer direction
  *
+ * When @is_recv is a known boolean constant, use the
+ * i2c_start_recv() or i2c_start_send() helper instead.
+ *
  * Returns: 0 on success, -1 on error
  */
 int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv);
+
+/**
+ * i2c_start_recv: start a 'receive' transfer on an I2C bus.
+ *
+ * @bus: #I2CBus to be used
+ * @address: address of the slave
+ *
+ * Returns: 0 on success, -1 on error
+ */
+int i2c_start_recv(I2CBus *bus, uint8_t address);
+
+/**
+ * i2c_start_send: start a 'send' transfer on an I2C bus.
+ *
+ * @bus: #I2CBus to be used
+ * @address: address of the slave
+ *
+ * Returns: 0 on success, -1 on error
+ */
+int i2c_start_send(I2CBus *bus, uint8_t address);
+
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
 int i2c_send(I2CBus *bus, uint8_t data);
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 5483bf95a3e..416372ad00c 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -180,6 +180,16 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
                                                : I2C_START_SEND);
 }
 
+int i2c_start_recv(I2CBus *bus, uint8_t address)
+{
+    return i2c_do_start_transfer(bus, address, I2C_START_RECV);
+}
+
+int i2c_start_send(I2CBus *bus, uint8_t address)
+{
+    return i2c_do_start_transfer(bus, address, I2C_START_SEND);
+}
+
 void i2c_end_transfer(I2CBus *bus)
 {
     I2CSlaveClass *sc;
diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
index 06e1e5321b9..d7eae548cbc 100644
--- a/hw/i2c/pm_smbus.c
+++ b/hw/i2c/pm_smbus.c
@@ -128,14 +128,14 @@ static void smb_transaction(PMSMBus *s)
          * So at least Linux may or may not set the read bit here.
          * So just ignore the read bit for this command.
          */
-        if (i2c_start_transfer(bus, addr, 0)) {
+        if (i2c_start_send(bus, addr)) {
             goto error;
         }
         ret = i2c_send(bus, s->smb_data1);
         if (ret) {
             goto error;
         }
-        if (i2c_start_transfer(bus, addr, 1)) {
+        if (i2c_start_recv(bus, addr)) {
             goto error;
         }
         s->in_i2c_block_read = true;
diff --git a/hw/i2c/smbus_master.c b/hw/i2c/smbus_master.c
index dc43b8637d1..6a53c34e70b 100644
--- a/hw/i2c/smbus_master.c
+++ b/hw/i2c/smbus_master.c
@@ -29,7 +29,7 @@ int smbus_receive_byte(I2CBus *bus, uint8_t addr)
 {
     uint8_t data;
 
-    if (i2c_start_transfer(bus, addr, 1)) {
+    if (i2c_start_recv(bus, addr)) {
         return -1;
     }
     data = i2c_recv(bus);
@@ -40,7 +40,7 @@ int smbus_receive_byte(I2CBus *bus, uint8_t addr)
 
 int smbus_send_byte(I2CBus *bus, uint8_t addr, uint8_t data)
 {
-    if (i2c_start_transfer(bus, addr, 0)) {
+    if (i2c_start_send(bus, addr)) {
         return -1;
     }
     i2c_send(bus, data);
@@ -51,11 +51,11 @@ int smbus_send_byte(I2CBus *bus, uint8_t addr, uint8_t data)
 int smbus_read_byte(I2CBus *bus, uint8_t addr, uint8_t command)
 {
     uint8_t data;
-    if (i2c_start_transfer(bus, addr, 0)) {
+    if (i2c_start_send(bus, addr)) {
         return -1;
     }
     i2c_send(bus, command);
-    if (i2c_start_transfer(bus, addr, 1)) {
+    if (i2c_start_recv(bus, addr)) {
         i2c_end_transfer(bus);
         return -1;
     }
@@ -67,7 +67,7 @@ int smbus_read_byte(I2CBus *bus, uint8_t addr, uint8_t command)
 
 int smbus_write_byte(I2CBus *bus, uint8_t addr, uint8_t command, uint8_t data)
 {
-    if (i2c_start_transfer(bus, addr, 0)) {
+    if (i2c_start_send(bus, addr)) {
         return -1;
     }
     i2c_send(bus, command);
@@ -79,11 +79,11 @@ int smbus_write_byte(I2CBus *bus, uint8_t addr, uint8_t command, uint8_t data)
 int smbus_read_word(I2CBus *bus, uint8_t addr, uint8_t command)
 {
     uint16_t data;
-    if (i2c_start_transfer(bus, addr, 0)) {
+    if (i2c_start_send(bus, addr)) {
         return -1;
     }
     i2c_send(bus, command);
-    if (i2c_start_transfer(bus, addr, 1)) {
+    if (i2c_start_recv(bus, addr)) {
         i2c_end_transfer(bus);
         return -1;
     }
@@ -96,7 +96,7 @@ int smbus_read_word(I2CBus *bus, uint8_t addr, uint8_t command)
 
 int smbus_write_word(I2CBus *bus, uint8_t addr, uint8_t command, uint16_t data)
 {
-    if (i2c_start_transfer(bus, addr, 0)) {
+    if (i2c_start_send(bus, addr)) {
         return -1;
     }
     i2c_send(bus, command);
@@ -113,12 +113,12 @@ int smbus_read_block(I2CBus *bus, uint8_t addr, uint8_t command, uint8_t *data,
     int i;
 
     if (send_cmd) {
-        if (i2c_start_transfer(bus, addr, 0)) {
+        if (i2c_start_send(bus, addr)) {
             return -1;
         }
         i2c_send(bus, command);
     }
-    if (i2c_start_transfer(bus, addr, 1)) {
+    if (i2c_start_recv(bus, addr)) {
         if (send_cmd) {
             i2c_end_transfer(bus);
         }
@@ -149,7 +149,7 @@ int smbus_write_block(I2CBus *bus, uint8_t addr, uint8_t command, uint8_t *data,
         len = 32;
     }
 
-    if (i2c_start_transfer(bus, addr, 0)) {
+    if (i2c_start_send(bus, addr)) {
         return -1;
     }
     i2c_send(bus, command);
diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 44aa9730bc9..434ff8d910d 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -135,7 +135,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
             i2c_end_transfer(i2c_bus);
         }
 
-        if (i2c_start_transfer(i2c_bus, address, true)) {
+        if (i2c_start_recv(i2c_bus, address)) {
             ret = AUX_I2C_NACK;
             break;
         }
@@ -151,7 +151,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
             i2c_end_transfer(i2c_bus);
         }
 
-        if (i2c_start_transfer(i2c_bus, address, false)) {
+        if (i2c_start_send(i2c_bus, address)) {
             ret = AUX_I2C_NACK;
             break;
         }
@@ -179,7 +179,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
             /*
              * No transactions started..
              */
-            if (i2c_start_transfer(i2c_bus, address, false)) {
+            if (i2c_start_send(i2c_bus, address)) {
                 break;
             }
         } else if ((address != bus->last_i2c_address) ||
@@ -188,7 +188,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
              * Transaction started but we need to restart..
              */
             i2c_end_transfer(i2c_bus);
-            if (i2c_start_transfer(i2c_bus, address, false)) {
+            if (i2c_start_send(i2c_bus, address)) {
                 break;
             }
         }
@@ -210,7 +210,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
             /*
              * No transactions started..
              */
-            if (i2c_start_transfer(i2c_bus, address, true)) {
+            if (i2c_start_recv(i2c_bus, address)) {
                 break;
             }
         } else if ((address != bus->last_i2c_address) ||
@@ -219,7 +219,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
              * Transaction started but we need to restart..
              */
             i2c_end_transfer(i2c_bus);
-            if (i2c_start_transfer(i2c_bus, address, true)) {
+            if (i2c_start_recv(i2c_bus, address)) {
                 break;
             }
         }
-- 
2.31.1


