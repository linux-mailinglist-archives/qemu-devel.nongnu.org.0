Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217A63FD423
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 09:01:51 +0200 (CEST)
Received: from localhost ([::1]:41248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLKFl-0001WW-66
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 03:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLK8F-0002Xt-LP
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 02:53:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLK8D-0000Gx-Ob
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 02:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630479236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0/8GtvRIw9/zPGmlIucFcSktbbbXfs/SYzGF2RK8+A=;
 b=hWgezJsRWyI8uMnDzLTp4KiLt0xDwZbbrbWXOQeldAndInuQnGpi0L+FLyjG7EuiexJW+/
 a49Nat682sxmGGa8X4MQYNrzC2fcr/2yezeZewfRliBvE0AwcilnI23suOR2MGonrWfEUj
 z378erddvZGWdcaGnqNpjpAwhaUkvQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-mbzShebJM_Gwbj6dXhT-rA-1; Wed, 01 Sep 2021 02:53:54 -0400
X-MC-Unique: mbzShebJM_Gwbj6dXhT-rA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBEB180198A;
 Wed,  1 Sep 2021 06:53:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7287F10495AD;
 Wed,  1 Sep 2021 06:53:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 70EB8180038E; Wed,  1 Sep 2021 08:53:42 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] hw/usb: Fix typo in comments and print
Date: Wed,  1 Sep 2021 08:53:42 +0200
Message-Id: <20210901065342.3316013-3-kraxel@redhat.com>
In-Reply-To: <20210901065342.3316013-1-kraxel@redhat.com>
References: <20210901065342.3316013-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Cai Huoqing <caihuoqing@baidu.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cai Huoqing <caihuoqing@baidu.com>

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
Message-Id: <20210730012720.2246-1-caihuoqing@baidu.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/desc.h            |  2 +-
 hw/usb/quirks-ftdi-ids.h |  4 ++--
 hw/usb/desc-msos.c       | 10 +++++-----
 hw/usb/dev-audio.c       |  4 ++--
 hw/usb/host-libusb.c     |  2 +-
 hw/usb/u2f-emulated.c    |  2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/usb/desc.h b/hw/usb/desc.h
index 4d81c68e0ef8..3ac604ecfa17 100644
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
diff --git a/hw/usb/quirks-ftdi-ids.h b/hw/usb/quirks-ftdi-ids.h
index 01aca55ca771..f3cb157d6fa1 100644
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
diff --git a/hw/usb/desc-msos.c b/hw/usb/desc-msos.c
index 836e38c67e1e..c72c65b650c7 100644
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
diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index f5cb2467929a..8748c1ba0401 100644
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
index 00f6fbb29b39..d0d46dd0a4a3 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1706,7 +1706,7 @@ static void usb_host_free_streams(USBDevice *udev, USBEndpoint **eps,
 /*
  * This is *NOT* about restoring state.  We have absolutely no idea
  * what state the host device is in at the moment and whenever it is
- * still present in the first place.  Attemping to contine where we
+ * still present in the first place.  Attempting to continue where we
  * left off is impossible.
  *
  * What we are going to do here is emulate a surprise removal of
diff --git a/hw/usb/u2f-emulated.c b/hw/usb/u2f-emulated.c
index 9151feb63d44..63cceaa5fc86 100644
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
2.31.1


