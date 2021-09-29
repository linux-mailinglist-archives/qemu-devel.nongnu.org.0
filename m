Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56FF41C21D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:57:41 +0200 (CEST)
Received: from localhost ([::1]:35772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWLM-0005s0-Lb
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtf-000292-9S
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:29:06 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:41009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtb-0005r0-Qj
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:29:03 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MRTAj-1m8kD81CHF-00NUpC; Wed, 29
 Sep 2021 11:28:51 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 14/20] mac-nubus-bridge: rename MacNubusState to MacNubusBridge
Date: Wed, 29 Sep 2021 11:28:37 +0200
Message-Id: <20210929092843.2686234-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TRnZotoJBc4fHv+JUN498gwF3x+Z+NOkgTfvIib9Y843YFmGKZX
 4YixF6Xn1ZVStW0Hnb11TVnvU2XzGzjx04upwr6tMhq2kN+/F2j0IhOwWJJV0+9wp/lKpz8
 Y+njlH2V9eo6+UMCcdNLRV1DuQEdHDoCBI+6uwQaZ1L3oGYjc8nljDq4m6dnqq81GXq1ELT
 A8YJ79sNkQ2jdALneoo8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CyaVHERBFe4=:2NDQubjdEqtCa3JTfjX/nX
 hSzkj/rhw9Go//zoRiKhdZOuSdW/B/aaFSRMrg74tvhNnaDMsiO5Lfii8ikce/7L6wRxk0W7j
 fWNUwEjwXKWkFeaRiSRoDAokmWlNLilLP9eTPRVydYcUlO0t9zpAZktvPlBypzMK9KwV2QfdP
 Ue4pnntpHfFxWhT6v8LWLb+NbChP2R17nmJupDs7gBXS5mbp1H4EBD4g3Ux9m4hpHSzvKd7Jx
 DAXyGXOywr8xEXFWFs0N2xdaeEK77Z39EqVddJskaVPxTVuHR+eqeuWgj5bd5jYcBDcKMi2TL
 y5KSwmsoZq3OwaYyp3AkStilBcc73KQKDII9c+enGAxOEKmmbknWQnrWZmEEkZoHEcgl2oi7R
 QWajafR7tUkX1OXroVDWQeIFnlWiBMwcIRgK6al9UNlPPTFbVKshpBTgWUNYxR1GfH8aqCOKK
 4uBNC3IEk8m50HZfZzpFcDicisALuft+JxCJWylAegODcRO+yjAX59+AIkaYaxZ/ToDLkAlVr
 fTRYFqZMpMmboo+BmJFD0KFGpDBdjlCS9lFfOHHysPlJLefRO5YK7sDsh4b29hb6VNRrB1w1D
 fuBNsqJp6hgXPxKOFq+cz5Go1af3zKPLreHSe0LE9WAPqr9rd0iqqXzDploiGKwMAthKQ98jq
 6NyQofHxVp5rCT39vPhBLKlSSBhAHVBF84Op3SYMSWtoFXKJ5OgXdsC0q15NxNW8Y3pdLwCi6
 GV6WN3pOUiGuvjX/sMmJSksVLCmxVtIBO92Dvw==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

This better reflects that the mac-nubus-bridge device is derived from the
nubus-bridge device, and that the structure represents the state of the bridge
device and not the Nubus itself. Also update the comment in the file header to
reflect that mac-nubus-bridge is specific to the Macintosh.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210924073808.1041-15-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/nubus/mac-nubus-bridge.h | 4 ++--
 hw/nubus/mac-nubus-bridge.c         | 8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
index fa454f5fbe83..b595e1b7ef66 100644
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
diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
index 3af4f5d396ae..e241c581b575 100644
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
 
-- 
2.31.1


