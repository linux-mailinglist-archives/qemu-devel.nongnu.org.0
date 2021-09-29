Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1071441C226
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:59:42 +0200 (CEST)
Received: from localhost ([::1]:40660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWNJ-0000oj-1o
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtd-00025K-JG
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:29:01 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:45985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtb-0005qy-QV
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:29:01 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MSss2-1mOPgC3Ofu-00UKBJ; Wed, 29
 Sep 2021 11:28:50 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 13/20] nubus-bridge: introduce separate NubusBridge structure
Date: Wed, 29 Sep 2021 11:28:36 +0200
Message-Id: <20210929092843.2686234-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Lg8Z1iGA3KPkCIlwHTB5bBe25wexSR15HTwS0on+TGggeJAsQ3h
 DMjbBZNhBbC99J9Oz9jyZXieEsSom/SmxumwoErIm4wMoPS4mlrflSNsbO13t0yoSHb5Z7d
 sj0DqsU4WxTyuXce9UUfiQU7xd1zhMPnC8Ve+0iornc8a+AP//YB5kUAeyGh2oWede7mq9O
 HIKR126grci6y3pm8mPFQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YH5JxX6XYmA=:fH4OBXInCUDZaPB3CWpmal
 Isk9n4/mM3DYH+KQXKX0D+V6kowaqL/CRCAekbWhuS0tT3s3VfecVLFSapPM9f548ZgDtuuZ8
 59+VXqUkMUH8co3u3s/KgjA6aA0N0+3zPRx6kFZZIMKe0v6AEDjQpgG5wD5ddnvDjyskbeDNn
 ovhCLPeF5oUYOyMONE2hFTzK86N383gHCFKHgofCGh81rtfRBavMUpYdTRPUGrKLjmKM7pn8n
 5O26D4Fe79sEeXC1jN+ovMZIrkWima9239cosWVAoDY4XztC66tL/uVh4c5vem+KaCKUDUK9i
 9qemiBIlO8fP5UH2Tu/YV1iRm6pEiwuqjPP8uyIlBWTluL32AaK5t52SIR/zMP6Ng9g6hKjqk
 uf4DTh7+EUqogOc/L8/6DWcNTqq5wDwwHPTmBIl0YNsP3hg9keuoi2zvVM7ZOfLRrRj3N5kuN
 MVHF0dWPA4TdPBC7/NKdIzwSMMo5BatUn+5pGnXqFkEBDkKjUDae+Zw6BrRYrFWA7pxvnhCBN
 nNy3/t8IwgnQIsjzkGffVX/fgUR/ZDaY0ao/Eu+ekuLl3b+cNrxUO6/EykfwSJW2pOXLVZ6bK
 TDSP5D/uNtwEPKPWFkAo+XreiC7DYescUHraD5cFrvw/06TBESOf31U1sfkjCOGkd3jGHZfxL
 ftWUKrt8CEBOtGb0KLwzMQG5iGwPPsqvHxtFJVLboTt+x9cEXjQppiFjhQvosYT0w0IIaHfcG
 SsncRjIRVmgEdMqJJGFddpKag9g8Ld2Qc2EjXw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

This is to allow the Nubus bridge to store its own additional state. Also update
the comment in the file header to reflect that nubus-bridge is not specific to
the Macintosh.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210924073808.1041-14-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/nubus/mac-nubus-bridge.h | 2 +-
 include/hw/nubus/nubus.h            | 6 ++++++
 hw/nubus/nubus-bridge.c             | 4 ++--
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
index 04451d357c50..fa454f5fbe83 100644
--- a/include/hw/nubus/mac-nubus-bridge.h
+++ b/include/hw/nubus/mac-nubus-bridge.h
@@ -20,7 +20,7 @@
 OBJECT_DECLARE_SIMPLE_TYPE(MacNubusState, MAC_NUBUS_BRIDGE)
 
 struct MacNubusState {
-    SysBusDevice sysbus_dev;
+    NubusBridge parent_obj;
 
     NubusBus *bus;
     MemoryRegion super_slot_alias;
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 9f9386afeda5..11bcc9bb3647 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -10,6 +10,7 @@
 #define HW_NUBUS_NUBUS_H
 
 #include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
 #include "exec/address-spaces.h"
 #include "qom/object.h"
 #include "qemu/units.h"
@@ -32,6 +33,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(NubusDevice, NUBUS_DEVICE)
 OBJECT_DECLARE_SIMPLE_TYPE(NubusBus, NUBUS_BUS)
 
 #define TYPE_NUBUS_BRIDGE "nubus-bridge"
+OBJECT_DECLARE_SIMPLE_TYPE(NubusBridge, NUBUS_BRIDGE);
 
 struct NubusBus {
     BusState qbus;
@@ -58,4 +60,8 @@ struct NubusDevice {
     MemoryRegion decl_rom;
 };
 
+struct NubusBridge {
+    SysBusDevice parent_obj;
+};
+
 #endif
diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
index cd8c6a91eb53..95662568c518 100644
--- a/hw/nubus/nubus-bridge.c
+++ b/hw/nubus/nubus-bridge.c
@@ -1,5 +1,5 @@
 /*
- * QEMU Macintosh Nubus
+ * QEMU Nubus
  *
  * Copyright (c) 2013-2018 Laurent Vivier <laurent@vivier.eu>
  *
@@ -22,7 +22,7 @@ static void nubus_bridge_class_init(ObjectClass *klass, void *data)
 static const TypeInfo nubus_bridge_info = {
     .name          = TYPE_NUBUS_BRIDGE,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(SysBusDevice),
+    .instance_size = sizeof(NubusBridge),
     .class_init    = nubus_bridge_class_init,
 };
 
-- 
2.31.1


