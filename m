Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB22458D11
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:10:58 +0100 (CET)
Received: from localhost ([::1]:48654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7Dt-0007Qq-Pc
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:10:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mp6sH-0003Rd-DI; Mon, 22 Nov 2021 05:48:38 -0500
Received: from [2a00:1450:4864:20::42f] (port=33466
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mp6sE-0008LF-R6; Mon, 22 Nov 2021 05:48:37 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d24so31912495wra.0;
 Mon, 22 Nov 2021 02:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dIS+nVVA0a5czlW4R3TS5v4DTorfKNOw8b8jVzzYR1M=;
 b=nqxxOpOZp+zc8k/M3HUVtfjxPLVWSnfM3IzT8gpfh+N9ASMFEoxIh54SNtvVzWaGox
 hAH73kAknX+P8pO+AsXCoFXZug6GSkjDtI8FlXFJQljfqTODwgJW6oRYB+Zq7RU815cR
 tfluqVGhz7cjA53+JX0SYrEzbF9AUFc2j3E7ZSLThyU78DI/brLnldk4PKaBDcJz0YG1
 ZDuwO3YdIi9uuwWzCXi3ZZJfdMPa2G20oPIkBK6N+E/rPmPvUNZ4ufgbl7+tpsFqgNZ+
 mU7TcxmHUAGdl3IXN7QFSl3gvOYVGEAYN24nDKGe9j46zHuG0tzmb/AEuBgG+NOU2050
 QD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=dIS+nVVA0a5czlW4R3TS5v4DTorfKNOw8b8jVzzYR1M=;
 b=kDt+OnX3zV1WNSJAkr1MFmSHGLzpE4TgJk7y421TEOUq7K0+MO755bDqZ4MWRxUt3a
 L+MgWOgOKXQa/KU88+bWVmdTVX2oNkhFirFem6GjDfDXz9MIQwRLuQKcIu28b0hwE9ce
 +iO5vFy9N0qLbN23c9eFk5K5I29C8iKlBGKwb3qXge+d2bAIKecmudcMopJ4+QP/a6wZ
 ueyhgXjiEdUUXyTW+l6+Cr2+cENplhWhwWrxDROj1xPiwW5KjSCTK2amu+RK0nGVUDFB
 It5xn6sV4eMnV/nH4KxcPhbbepwWUqwTzDsf8o+AvA+qCMGQiFh94U2f4M9BnAQW1piQ
 B73Q==
X-Gm-Message-State: AOAM5334BG623R9F6OK0Ifcj2D7cLScP8ruumu2BsiqtIIt4j5vkrcNu
 zXzXrSuJcdKgL+nk97VXwhKfVkIw1jQ=
X-Google-Smtp-Source: ABdhPJx1JKB3a5EZb2KiFID8NCno9bsVlxZqiKwnxxqoNVGeP77YDxvX3+Ot11oeqyuSCmn+210oXg==
X-Received: by 2002:adf:9d88:: with SMTP id p8mr36680148wre.140.1637578112937; 
 Mon, 22 Nov 2021 02:48:32 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 10sm10880343wrb.75.2021.11.22.02.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 02:48:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/misc/auxbus: Improve aux_bus_init() docstring
Date: Mon, 22 Nov 2021 11:48:31 +0100
Message-Id: <20211122104831.1052063-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mention in aux_bus_init() docstring that the AUXBus
is not simply initialized, it is also allocated.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/auxbus.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/hw/misc/auxbus.h b/include/hw/misc/auxbus.h
index b05799d2f7a..bd8612018a7 100644
--- a/include/hw/misc/auxbus.h
+++ b/include/hw/misc/auxbus.h
@@ -85,7 +85,8 @@ struct AUXSlave {
 };
 
 /**
- * aux_bus_init: Initialize an AUX bus.
+ * aux_bus_init:
+ * Create an AUX bus on the heap.
  *
  * Returns the new AUX bus created.
  *
@@ -101,7 +102,7 @@ AUXBus *aux_bus_init(DeviceState *parent, const char *name);
  */
 void aux_bus_realize(AUXBus *bus);
 
-/*
+/**
  * aux_request: Make a request on the bus.
  *
  * Returns the reply of the request.
@@ -115,7 +116,7 @@ void aux_bus_realize(AUXBus *bus);
 AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
                               uint8_t len, uint8_t *data);
 
-/*
+/**
  * aux_get_i2c_bus: Get the i2c bus for I2C over AUX command.
  *
  * Returns the i2c bus associated to this AUX bus.
@@ -124,7 +125,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
  */
 I2CBus *aux_get_i2c_bus(AUXBus *bus);
 
-/*
+/**
  * aux_init_mmio: Init an mmio for an AUX slave.
  *
  * @aux_slave The AUX slave.
@@ -132,7 +133,8 @@ I2CBus *aux_get_i2c_bus(AUXBus *bus);
  */
 void aux_init_mmio(AUXSlave *aux_slave, MemoryRegion *mmio);
 
-/* aux_map_slave: Map the mmio for an AUX slave on the bus.
+/**
+ * aux_map_slave: Map the mmio for an AUX slave on the bus.
  *
  * @dev The AUX slave.
  * @addr The address for the slave's mmio.
-- 
2.31.1


