Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6BF403C9B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:37:29 +0200 (CEST)
Received: from localhost ([::1]:54122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzdg-0006Gj-Ud
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzbq-0003fR-Rc
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:34 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:60635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzbo-0003nF-LX
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:34 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MMoXE-1mgcvG3ZaO-00Ik43; Wed, 08
 Sep 2021 17:35:31 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/12] mac_via: introduce new VMStateDescription for q800 VIA1
 and VIA2
Date: Wed,  8 Sep 2021 17:35:18 +0200
Message-Id: <20210908153529.453843-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908153529.453843-1-laurent@vivier.eu>
References: <20210908153529.453843-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZjXM0ztxe7yLULyrr/qGZRWI+M6B32nvq75cKi+4f4+Ke2YFzpj
 t+RO1zfKMXvcdcQHjWL2mIWcFGYmVrqoH841Nz86j+OaymmXS0Nt6AMMQiWBSBIY41jqcTu
 JZ30WJhDzbRwN0mmOkBxoq9WuB6YMibvME0YKusxvPbVLmVrRIKng4tbe5zv+RrpcP+R13c
 RPUTc7/KLOn/yDrS9iQag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OZHWX7aRFfE=:YAWmzt2SXNPM8Dt5+1pjjH
 QS4v8E+6R1LlEOUEn1n9yG7yuYbMyAfJoskIY69TM4v9I4eSYpvob1sFEi8PC9XTCr3dQUTHf
 l1lkJoX+ZgzcqsNB9DZpsVXbHXehFb9QsMxOtfNsPtSUiAuVpwsHL89CmipMQKqg0eWNTnc7d
 AxfBip5Wy8IIn9X1IPcR5RU1s/E/VtW2v2GK1D/V7KNF8rlFGdyQ+gmozEZyXgeCDLQTM48lx
 w0ySkA6kJ7Wpx/fl22Xwl9Eo8bAVlLJzYzuJVQ4g8lsfeaS4Rqjwri7zB5RHG45cEBlI1bYnI
 MrqyMJeYt8yVrSemF6u/lP9p56Sq2VqzySKPZSDzWRZRjYJZLICW3tOrumoF3HGg0IkYj7FLe
 VLNupSe1980LGaX6iIWxMRf/TeHyQXwWA60J0ocL2lmt7uXfzZwqIfjANTrtxhmUDLSKZbfla
 m4emqpUQUJ+YHpnokeWBfWp6nRWNN8Q1gmtogzIfi12qpTFCnrkW0mnOvEc4OYH/NPWGWYrck
 CrMkLmAa/wChtAQXeewGHP5NaHRR4/rK0J22sXY6+W9vJhDQxVcSgp6SqvnyNGl7o8wpyAroj
 fEaTM3ZsKYcwPzk9n3kybmodsRlME7ElOU4Lj6bMT5aQgN/tWKiRBQjOTCgd2Yb483spkUiv4
 NYj403RABJA/1BtAzrlcHHdF866KKpldSlLA6rahrWETRpwdsUa0TaE5WGTc+LIZIIxDjZ6Kk
 5soVqAJSdFE4J98Rsjw1MsymjDjYi76YGosRng==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Move the parent mos6522 objects from vmstate_mac_via into the new VMStateDescription
structures to begin the process of splitting MacVIAState into separate VIA1 and
VIA2 devices.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210830102447.10806-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mac_via.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index ff0156db76f2..46e65058e029 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -1083,16 +1083,12 @@ static const VMStateDescription vmstate_mac_via = {
     .post_load = mac_via_post_load,
     .fields = (VMStateField[]) {
         /* VIAs */
-        VMSTATE_STRUCT(mos6522_via1.parent_obj, MacVIAState, 0, vmstate_mos6522,
-                       MOS6522State),
         VMSTATE_UINT8(mos6522_via1.last_b, MacVIAState),
         VMSTATE_BUFFER(mos6522_via1.PRAM, MacVIAState),
         VMSTATE_TIMER_PTR(mos6522_via1.one_second_timer, MacVIAState),
         VMSTATE_INT64(mos6522_via1.next_second, MacVIAState),
         VMSTATE_TIMER_PTR(mos6522_via1.sixty_hz_timer, MacVIAState),
         VMSTATE_INT64(mos6522_via1.next_sixty_hz, MacVIAState),
-        VMSTATE_STRUCT(mos6522_via2.parent_obj, MacVIAState, 0, vmstate_mos6522,
-                       MOS6522State),
         /* RTC */
         VMSTATE_UINT32(tick_offset, MacVIAState),
         VMSTATE_UINT8(data_out, MacVIAState),
@@ -1156,11 +1152,23 @@ static void mos6522_q800_via1_init(Object *obj)
                             VIA1_IRQ_NB);
 }
 
+static const VMStateDescription vmstate_q800_via1 = {
+    .name = "q800-via1",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(parent_obj, MOS6522Q800VIA1State, 0, vmstate_mos6522,
+                       MOS6522State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static void mos6522_q800_via1_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->reset = mos6522_q800_via1_reset;
+    dc->vmsd = &vmstate_q800_via1;
 }
 
 static const TypeInfo mos6522_q800_via1_type_info = {
@@ -1200,12 +1208,24 @@ static void mos6522_q800_via2_init(Object *obj)
                             VIA2_IRQ_NB);
 }
 
+static const VMStateDescription vmstate_q800_via2 = {
+    .name = "q800-via2",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(parent_obj, MOS6522Q800VIA2State, 0, vmstate_mos6522,
+                       MOS6522State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static void mos6522_q800_via2_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     MOS6522DeviceClass *mdc = MOS6522_CLASS(oc);
 
     dc->reset = mos6522_q800_via2_reset;
+    dc->vmsd = &vmstate_q800_via2;
     mdc->portB_write = mos6522_q800_via2_portB_write;
 }
 
-- 
2.31.1


