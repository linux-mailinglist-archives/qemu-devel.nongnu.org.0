Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 125B53AB326
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:01:23 +0200 (CEST)
Received: from localhost ([::1]:52410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqi2-0003Oi-2Y
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqbX-0000OS-Qt
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:39 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqbW-0005Z2-Aa
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:39 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c5so6439371wrq.9
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DtENdvfDn6VhzVLT/89Jq/1ZlyaMFR9nNkP3jZQYETo=;
 b=sD3Nh+DpYARiEPwFRlpCqNmf1bec5ZvkJmyDTmr6ww98byox06r6/rT+qlfn46NIlS
 Ri2jSVFSiSUv2Bj6vyYcxufbUOH46pejVU9tKKWohTxT5gk2xbDYBrWMiUkxB6W9Ifdv
 2fig2fH8e9NKvH4sIM8uDMJBcQZoZi6D9mnnSCke21yKkmwbsGygX1mDTdyJcX+wwiM1
 Kb1/Yi8RP7xkFMOwlrQog+zc3oDgpjCDpeLGAFXWXniTxfR5QdQPzn7UdQeP/AmXOIms
 SWCgbaAj0/1aOJHrDcbXSzcO2Pk0RzWax59sdUvkqi7Grrh2dQ+hmDY4KX8X6b6EIY5Z
 bpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DtENdvfDn6VhzVLT/89Jq/1ZlyaMFR9nNkP3jZQYETo=;
 b=S85XK9EH0a4qQP2ONgFGkz2jfjMUNspT3kWzOubB7zHuLSKybEzjkmVU1yEicwXGPU
 ueG7GtPGZa30WmfV60fG5HjQ3KGkD8auGZDyeCg0+WHcRma725J62k6E9PSDEeVG85+c
 Qx6Mz1eE+BM5b5r017mHufJV+3/pYfSzJB7fYf8eF5Xd/eZb4GFBfr4uhmPRn3IN+oxy
 HTY/iw3KdVNdGCfJLNucmYoN+hbyZEa0jrBXhCkocrnSPho/uN8WP6mTrkIjUNpWq1FO
 92TOiF7ZvwZFw+XerIHbZ8bDwJgFh/1VU+67ZQIdB5hWqnKI8nzTW3f8pCYXiwOwJi3F
 lTAg==
X-Gm-Message-State: AOAM530xQDq6eBXD6++dJS3xQyjw32hVX4YIdebxWjLRAVfFvAK8RGJS
 P//IxcnKzgBx3aA7HaDZUQojNVOTOo5k6Q==
X-Google-Smtp-Source: ABdhPJygNMgafvbdZ+odBNFakAc30A8R3rW22k1rXCM/6V1msHnfzfalsIxEuDo6tA/+ZsP1zs2J7Q==
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr5442881wri.66.1623930876941; 
 Thu, 17 Jun 2021 04:54:36 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id w13sm4302321wmi.48.2021.06.17.04.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:54:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/15] hw/i2c: Make i2c_start_transfer() direction argument
 a boolean
Date: Thu, 17 Jun 2021 13:53:32 +0200
Message-Id: <20210617115334.2761573-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617115334.2761573-1-f4bug@amsat.org>
References: <20210617115334.2761573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Make the argument representing the direction of the transfer a
boolean type.
Rename the boolean argument as 'is_recv' to match i2c_recv_send().
Document the function prototype.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20200621145235.9E241745712@zero.eik.bme.hu>
[PMD: Split patch, added docstring]
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i2c/i2c.h | 12 +++++++++++-
 hw/i2c/core.c        |  4 ++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 2adf521b271..21f2dba1bf7 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -80,7 +80,17 @@ struct I2CBus {
 
 I2CBus *i2c_init_bus(DeviceState *parent, const char *name);
 int i2c_bus_busy(I2CBus *bus);
-int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv);
+
+/**
+ * i2c_start_transfer: start a transfer on an I2C bus.
+ *
+ * @bus: #I2CBus to be used
+ * @address: address of the slave
+ * @is_recv: indicates the transfer direction
+ *
+ * Returns: 0 on success, -1 on error
+ */
+int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv);
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
 int i2c_send(I2CBus *bus, uint8_t data);
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 6af24c9e797..6639ca8c2e0 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -115,7 +115,7 @@ bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
  * without releasing the bus.  If that fails, the bus is still
  * in a transaction.
  */
-int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
+int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
 {
     I2CSlaveClass *sc;
     I2CNode *node;
@@ -157,7 +157,7 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
 
         if (sc->event) {
             trace_i2c_event("start", s->address);
-            rv = sc->event(s, recv ? I2C_START_RECV : I2C_START_SEND);
+            rv = sc->event(s, is_recv ? I2C_START_RECV : I2C_START_SEND);
             if (rv && !bus->broadcast) {
                 if (bus_scanned) {
                     /* First call, terminate the transfer. */
-- 
2.31.1


