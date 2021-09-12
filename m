Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06897407C55
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 10:01:32 +0200 (CEST)
Received: from localhost ([::1]:57044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPKQc-0004pG-Ta
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 04:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKFi-0003Wb-I1
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 03:50:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35066
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKFf-0002nM-2W
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 03:50:13 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKFO-00034U-J4; Sun, 12 Sep 2021 08:49:58 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Sun, 12 Sep 2021 08:49:08 +0100
Message-Id: <20210912074914.22048-15-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 14/20] mac-nubus-bridge: rename MacNubusState to MacNubusBridge
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
---
 hw/nubus/mac-nubus-bridge.c         | 8 +++++---
 include/hw/nubus/mac-nubus-bridge.h | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
index 7c01c8a06b..def1d2d313 100644
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
@@ -47,7 +49,7 @@ static const TypeInfo mac_nubus_bridge_info = {
     .name          = TYPE_MAC_NUBUS_BRIDGE,
     .parent        = TYPE_NUBUS_BRIDGE,
     .instance_init = mac_nubus_bridge_init,
-    .instance_size = sizeof(MacNubusState),
+    .instance_size = sizeof(MacNubusBridge),
     .class_init    = mac_nubus_bridge_class_init,
 };
 
diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
index 7365038966..d9bb11db31 100644
--- a/include/hw/nubus/mac-nubus-bridge.h
+++ b/include/hw/nubus/mac-nubus-bridge.h
@@ -13,9 +13,9 @@
 #include "qom/object.h"
 
 #define TYPE_MAC_NUBUS_BRIDGE "mac-nubus-bridge"
-OBJECT_DECLARE_SIMPLE_TYPE(MacNubusState, MAC_NUBUS_BRIDGE)
+OBJECT_DECLARE_SIMPLE_TYPE(MacNubusBridge, MAC_NUBUS_BRIDGE)
 
-struct MacNubusState {
+struct MacNubusBridge {
     NubusBridge parent_obj;
 
     NubusBus *bus;
-- 
2.20.1


