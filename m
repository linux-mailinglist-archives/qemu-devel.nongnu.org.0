Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8808416D18
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 09:49:17 +0200 (CEST)
Received: from localhost ([::1]:57336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTfxM-0002is-UK
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 03:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfnh-00036O-9y
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 03:39:17 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50274
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfnf-0004O0-M3
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 03:39:17 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfnV-0002uw-Er; Fri, 24 Sep 2021 08:39:08 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Fri, 24 Sep 2021 08:38:02 +0100
Message-Id: <20210924073808.1041-15-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210924073808.1041-1-mark.cave-ayland@ilande.co.uk>
References: <20210924073808.1041-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v6 14/20] mac-nubus-bridge: rename MacNubusState to
 MacNubusBridge
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This better reflects that the mac-nubus-bridge device is derived from the
nubus-bridge device, and that the structure represents the state of the bridge
device and not the Nubus itself. Also update the comment in the file header to
reflect that mac-nubus-bridge is specific to the Macintosh.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nubus/mac-nubus-bridge.c         | 8 +++++---
 include/hw/nubus/mac-nubus-bridge.h | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
index 3af4f5d396..e241c581b5 100644
--- a/hw/nubus/mac-nubus-bridge.c
+++ b/hw/nubus/mac-nubus-bridge.c
@@ -1,5 +1,7 @@
 /*
- *  Copyright (c) 2013-2018 Laurent Vivier <laurent@vivier.eu>
+ * QEMU Macintosh Nubus
+ *
+ * Copyright (c) 2013-2018 Laurent Vivier <laurent@vivier.eu>
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
@@ -13,7 +15,7 @@
 
 static void mac_nubus_bridge_init(Object *obj)
 {
-    MacNubusState *s = MAC_NUBUS_BRIDGE(obj);
+    MacNubusBridge *s = MAC_NUBUS_BRIDGE(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     s->bus = NUBUS_BUS(qbus_create(TYPE_NUBUS_BUS, DEVICE(s), NULL));
@@ -49,7 +51,7 @@ static const TypeInfo mac_nubus_bridge_info = {
     .name          = TYPE_MAC_NUBUS_BRIDGE,
     .parent        = TYPE_NUBUS_BRIDGE,
     .instance_init = mac_nubus_bridge_init,
-    .instance_size = sizeof(MacNubusState),
+    .instance_size = sizeof(MacNubusBridge),
     .class_init    = mac_nubus_bridge_class_init,
 };
 
diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
index fa454f5fbe..b595e1b7ef 100644
--- a/include/hw/nubus/mac-nubus-bridge.h
+++ b/include/hw/nubus/mac-nubus-bridge.h
@@ -17,9 +17,9 @@
 #define MAC_NUBUS_SLOT_NB    (MAC_NUBUS_LAST_SLOT - MAC_NUBUS_FIRST_SLOT + 1)
 
 #define TYPE_MAC_NUBUS_BRIDGE "mac-nubus-bridge"
-OBJECT_DECLARE_SIMPLE_TYPE(MacNubusState, MAC_NUBUS_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(MacNubusBridge, MAC_NUBUS_BRIDGE)
 
-struct MacNubusState {
+struct MacNubusBridge {
     NubusBridge parent_obj;
 
     NubusBus *bus;
-- 
2.20.1


