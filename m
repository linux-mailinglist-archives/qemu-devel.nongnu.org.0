Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6328E3DB0A7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 03:29:00 +0200 (CEST)
Received: from localhost ([::1]:38450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9HKd-0002QQ-G7
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 21:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caihuoqing@baidu.com>)
 id 1m9HJM-0000oQ-Ov
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 21:27:40 -0400
Received: from mx20.baidu.com ([111.202.115.85]:50232 helo=baidu.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <caihuoqing@baidu.com>) id 1m9HJK-0003XX-8Z
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 21:27:40 -0400
Received: from BC-Mail-Ex11.internal.baidu.com (unknown [172.31.51.51])
 by Forcepoint Email with ESMTPS id 1E8237DC09D97BF63C8C;
 Fri, 30 Jul 2021 09:27:27 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex11.internal.baidu.com (172.31.51.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Fri, 30 Jul 2021 09:27:26 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 30 Jul 2021 09:27:26 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <kraxel@redhat.com>
Subject: [PATCH] hw/usb: Fix typo in comments and print
Date: Fri, 30 Jul 2021 09:27:20 +0800
Message-ID: <20210730012720.2246-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Received-SPF: pass client-ip=111.202.115.85; envelope-from=caihuoqing@baidu.com;
 helo=baidu.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cai Huoqing <caihuoqing@baidu.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix typo:
*informations  ==> information
*enougth  ==> enough
*enouth  ==> enough
*registy  ==> registry
*releated  ==> related
*Ouptut  ==> Output
*manualy  ==> manually
*Attemping  ==> Attempting
*contine  ==> continue
*tranceiver  ==> transceiver
*Tranceiver  ==> Transceiver

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 hw/usb/desc-msos.c       | 10 +++++-----
 hw/usb/desc.h            |  2 +-
 hw/usb/dev-audio.c       |  4 ++--
 hw/usb/host-libusb.c     |  2 +-
 hw/usb/quirks-ftdi-ids.h |  4 ++--
 hw/usb/u2f-emulated.c    |  2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/usb/desc-msos.c b/hw/usb/desc-msos.c
index 836e38c67e..c72c65b650 100644
--- a/hw/usb/desc-msos.c
+++ b/hw/usb/desc-msos.c
@@ -5,12 +5,12 @@
 /*
  * Microsoft OS Descriptors
  *
- * Windows tries to fetch some special descriptors with informations
+ * Windows tries to fetch some special descriptors with information
  * specifically for windows.  Presence is indicated using a special
  * string @ index 0xee.  There are two kinds of descriptors:
  *
  * compatid descriptor
- *   Used to bind drivers, if usb class isn't specific enougth.
+ *   Used to bind drivers, if usb class isn't specific enough.
  *   Used for PTP/MTP for example (both share the same usb class).
  *
  * properties descriptor
@@ -23,7 +23,7 @@
  *   HLM\SYSTEM\CurrentControlSet\Control\usbflags
  *   HLM\SYSTEM\CurrentControlSet\Enum\USB
  * Windows will complain it can't delete entries on the second one.
- * It has deleted everything it had permissions too, which is enouth
+ * It has deleted everything it had permissions too, which is enough
  * as this includes "Device Parameters".
  *
  * http://msdn.microsoft.com/en-us/library/windows/hardware/ff537430.aspx
@@ -192,8 +192,8 @@ static int usb_desc_msos_prop(const USBDesc *desc, uint8_t *dest)
     if (desc->msos->SelectiveSuspendEnabled) {
         /*
          * Signaling remote wakeup capability in the standard usb
-         * descriptors isn't enouth to make windows actually use it.
-         * This is the "Yes, we really mean it" registy entry to flip
+         * descriptors isn't enough to make windows actually use it.
+         * This is the "Yes, we really mean it" registry entry to flip
          * the switch in the windows drivers.
          */
         length += usb_desc_msos_prop_dword(dest+length,
diff --git a/hw/usb/desc.h b/hw/usb/desc.h
index 4d81c68e0e..3ac604ecfa 100644
--- a/hw/usb/desc.h
+++ b/hw/usb/desc.h
@@ -133,7 +133,7 @@ struct USBDescConfig {
     const USBDescIface        *ifs;
 };
 
-/* conceptually an Interface Association Descriptor, and releated interfaces */
+/* conceptually an Interface Association Descriptor, and related interfaces */
 struct USBDescIfaceAssoc {
     uint8_t                   bFirstInterface;
     uint8_t                   bInterfaceCount;
diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index f5cb246792..8748c1ba04 100644
--- a/hw/usb/dev-audio.c
+++ b/hw/usb/dev-audio.c
@@ -168,7 +168,7 @@ static const USBDescIface desc_iface[] = {
                     STRING_FEATURE_UNIT,        /*  u8  iFeature */
                 }
             },{
-                /* Headphone Ouptut Terminal ID3 Descriptor */
+                /* Headphone Output Terminal ID3 Descriptor */
                 .data = (uint8_t[]) {
                     0x09,                       /*  u8  bLength */
                     USB_DT_CS_INTERFACE,        /*  u8  bDescriptorType */
@@ -332,7 +332,7 @@ static const USBDescIface desc_iface_multi[] = {
                     STRING_FEATURE_UNIT,        /*  u8  iFeature */
                 }
             },{
-                /* Headphone Ouptut Terminal ID3 Descriptor */
+                /* Headphone Output Terminal ID3 Descriptor */
                 .data = (uint8_t[]) {
                     0x09,                       /*  u8  bLength */
                     USB_DT_CS_INTERFACE,        /*  u8  bDescriptorType */
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index c0f314462a..080fb73be6 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1675,7 +1675,7 @@ static void usb_host_free_streams(USBDevice *udev, USBEndpoint **eps,
 /*
  * This is *NOT* about restoring state.  We have absolutely no idea
  * what state the host device is in at the moment and whenever it is
- * still present in the first place.  Attemping to contine where we
+ * still present in the first place.  Attempting to continue where we
  * left off is impossible.
  *
  * What we are going to do here is emulate a surprise removal of
diff --git a/hw/usb/quirks-ftdi-ids.h b/hw/usb/quirks-ftdi-ids.h
index 01aca55ca7..f3cb157d6f 100644
--- a/hw/usb/quirks-ftdi-ids.h
+++ b/hw/usb/quirks-ftdi-ids.h
@@ -625,9 +625,9 @@
  * Definitions for Icom Inc. devices
  */
 #define ICOM_VID		0x0C26 /* Icom vendor ID */
-/* Note: ID-1 is a communications tranceiver for HAM-radio operators */
+/* Note: ID-1 is a communications transceiver for HAM-radio operators */
 #define ICOM_ID_1_PID		0x0004 /* ID-1 USB to RS-232 */
-/* Note: OPC is an Optional cable to connect an Icom Tranceiver */
+/* Note: OPC is an Optional cable to connect an Icom Transceiver */
 #define ICOM_OPC_U_UC_PID	0x0018 /* OPC-478UC, OPC-1122U cloning cable */
 /* Note: ID-RP* devices are Icom Repeater Devices for HAM-radio */
 #define ICOM_ID_RP2C1_PID	0x0009 /* ID-RP2C Asset 1 to RS-232 */
diff --git a/hw/usb/u2f-emulated.c b/hw/usb/u2f-emulated.c
index 9151feb63d..63cceaa5fc 100644
--- a/hw/usb/u2f-emulated.c
+++ b/hw/usb/u2f-emulated.c
@@ -307,7 +307,7 @@ static void u2f_emulated_realize(U2FKeyState *base, Error **errp)
             rc = u2f_emulated_setup_vdev_manualy(key);
         } else {
             error_setg(errp, "%s: cert, priv, entropy and counter "
-                       "parameters must be provided to manualy configure "
+                       "parameters must be provided to manually configure "
                        "the emulated device", TYPE_U2F_EMULATED);
             return;
         }
-- 
2.25.1


