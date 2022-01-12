Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2250D48C0B8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 10:06:58 +0100 (CET)
Received: from localhost ([::1]:44912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Zaq-0006Op-Sw
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 04:06:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dario.binacchi@amarulasolutions.com>)
 id 1n7ZWG-0003n1-80
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 04:02:24 -0500
Received: from [2a00:1450:4864:20::530] (port=39788
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dario.binacchi@amarulasolutions.com>)
 id 1n7ZW6-0006wl-9z
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 04:02:04 -0500
Received: by mail-ed1-x530.google.com with SMTP id c71so7098445edf.6
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 01:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VyMgynfmdcVnbW2UDNyZwHxej55p9RLUZqkpJfptshA=;
 b=ru/Gzij0p/7XjRdt9hwvNg5ycALxeQsJ2jbAhjC1Zh18X2f6Y29K/sdMKZ1fVBLNub
 vF7NzfVOWDEvgsHp8ylp2HiZDC6z9MIhS1MBZVNZESj6vafqp0nQ5Kpp9g0n+dCdDMka
 urdrvLI/iaa/bSL02qal7+4t6J4eZXCFEvNj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VyMgynfmdcVnbW2UDNyZwHxej55p9RLUZqkpJfptshA=;
 b=vuIWXxwkhmOhclRerNmUDSypPplVuE2G6MPFER7kIkAIYJsRUQa2Ng1QJYy7iUkuMM
 Wv1plYbV37P/zFDIwn3cNBd6vdoQ8c8p9Gn2kYTFB4BLcrzHl2APhFiRFhQKgdE9xc9D
 aVisNuhv5Ip7eiSBwwjSyLwjpydEV+3d61vdvipxT5lM+uSx4Yju7IKlXVEOA/iEXYcp
 8hMr6vbOQ6QKzR9oW83y3rln4dyQdWfl9DvzkMFzGpc6SUO2DAbsM7J9Elq57geWU7WF
 zdeVz6zMcDOmUMl0wu0HGpYEy2F5aY3d1/6iKB/8UB3yUELNSh2t8M0cm4PRkrkC8eoP
 9dXA==
X-Gm-Message-State: AOAM533EFXc/WKGrq9iD0oiQ7OTEtMMNCuFRb39BerSg9Jlq8U805hW5
 8RRyKJuB+/L8/hAnjL6calzJ9CmeawiHZg==
X-Google-Smtp-Source: ABdhPJwoOsJnH1xXYrWuSR+GXFbSuhdwZfSmgxXQ9B+nSa7T9tQJIGnZx5n7xzaSmpmgCbiWoJ999w==
X-Received: by 2002:aa7:d785:: with SMTP id s5mr7854490edq.215.1641978113863; 
 Wed, 12 Jan 2022 01:01:53 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-8-210.retail.telecomitalia.it. [82.52.8.210])
 by smtp.gmail.com with ESMTPSA id 25sm4305673ejz.95.2022.01.12.01.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 01:01:53 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/usb/dev-wacom: add missing HID descriptor
Date: Wed, 12 Jan 2022 10:01:25 +0100
Message-Id: <20220112090125.381364-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=dario.binacchi@amarulasolutions.com;
 helo=mail-ed1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux need to fill up the HID descriptor in order to let the driver be
emulated. The descriptor was downloaded from [1]. The patch was tested
with evtest tool on top of qemu 5.2.0 with linux kernel 4.19.208.

[1] https://github.com/linuxwacom/wacom-hid-descriptors/tree/master/Wacom%20PenPartner

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 hw/usb/dev-wacom.c | 72 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
index ed687bc9f1eb..8323650c6a4d 100644
--- a/hw/usb/dev-wacom.c
+++ b/hw/usb/dev-wacom.c
@@ -69,6 +69,65 @@ static const USBDescStrings desc_strings = {
     [STR_SERIALNUMBER]     = "1",
 };
 
+static const uint8_t qemu_wacom_hid_report_descriptor[] = {
+    0x05, 0x01,      /* Usage Page (Desktop) */
+    0x09, 0x02,      /* Usage (Mouse) */
+    0xa1, 0x01,      /* Collection (Application) */
+    0x85, 0x01,      /*    Report ID (1) */
+    0x09, 0x01,      /*    Usage (Pointer) */
+    0xa1, 0x00,      /*    Collection (Physical) */
+    0x05, 0x09,      /*       Usage Page (Button) */
+    0x19, 0x01,      /*       Usage Minimum (01h) */
+    0x29, 0x03,      /*       Usage Maximum (03h) */
+    0x15, 0x00,      /*       Logical Minimum (0) */
+    0x25, 0x01,      /*       Logical Maximum (1) */
+    0x95, 0x03,      /*       Report Count (3) */
+    0x75, 0x01,      /*       Report Size (1) */
+    0x81, 0x02,      /*       Input (Data, Variable, Absolute) */
+    0x95, 0x01,      /*       Report Count (1) */
+    0x75, 0x05,      /*       Report Size (5) */
+    0x81, 0x01,      /*       Input (Constant) */
+    0x05, 0x01,      /*       Usage Page (Desktop) */
+    0x09, 0x30,      /*       Usage (X) */
+    0x09, 0x31,      /*       Usage (Y) */
+    0x09, 0x38,      /*       Usage (Wheel) */
+    0x15, 0x81,      /*       Logical Minimum (-127) */
+    0x25, 0x7f,      /*       Logical Maximum (127) */
+    0x75, 0x08,      /*       Report Size (8) */
+    0x95, 0x03,      /*       Report Count (3) */
+    0x81, 0x06,      /*       Input (Data, Variable, Relative) */
+    0x95, 0x03,      /*       Report Count (3) */
+    0x81, 0x01,      /*       Input (Constant) */
+    0xc0,            /*    End Collection */
+    0xc0,            /* End Collection */
+    0x05, 0x0d,      /* Usage Page (Digitizer) */
+    0x09, 0x01,      /* Usage (Digitizer) */
+    0xa1, 0x01,      /* Collection (Application) */
+    0x85, 0x02,      /*    Report ID (2) */
+    0xa1, 0x00,      /*    Collection (Physical) */
+    0x06, 0x00, 0xff,/*       Usage Page (ff00h), vendor-defined */
+    0x09, 0x01,      /*       Usage (01h) */
+    0x15, 0x00,      /*       Logical Minimum (0) */
+    0x26, 0xff, 0x00,/*       Logical Maximum (255) */
+    0x75, 0x08,      /*       Report Size (8) */
+    0x95, 0x07,      /*       Report Count (7) */
+    0x81, 0x02,      /*       Input (Data, Variable, Absolute) */
+    0xc0,            /*    End Collection */
+    0x09, 0x01,      /*    Usage (01h) */
+    0x85, 0x63,      /*    Report ID (99) */
+    0x95, 0x07,      /*    Report Count (7) */
+    0x81, 0x02,      /*    Input (Data, Variable, Absolute) */
+    0x09, 0x01,      /*    Usage (01h) */
+    0x85, 0x02,      /*    Report ID (2) */
+    0x95, 0x01,      /*    Report Count (1) */
+    0xb1, 0x02,      /*    Feature (Variable) */
+    0x09, 0x01,      /*    Usage (01h) */
+    0x85, 0x03,      /*    Report ID (3) */
+    0x95, 0x01,      /*    Report Count (1) */
+    0xb1, 0x02,      /*    Feature (Variable) */
+    0xc0             /* End Collection */
+};
+
 static const USBDescIface desc_iface_wacom = {
     .bInterfaceNumber              = 0,
     .bNumEndpoints                 = 1,
@@ -86,7 +145,7 @@ static const USBDescIface desc_iface_wacom = {
                 0x00,          /*  u8  country_code */
                 0x01,          /*  u8  num_descriptors */
                 USB_DT_REPORT, /*  u8  type: Report */
-                0x6e, 0,       /*  u16 len */
+                sizeof(qemu_wacom_hid_report_descriptor), 0, /*  u16 len */
             },
         },
     },
@@ -266,6 +325,17 @@ static void usb_wacom_handle_control(USBDevice *dev, USBPacket *p,
     }
 
     switch (request) {
+    case InterfaceRequest | USB_REQ_GET_DESCRIPTOR:
+        switch (value >> 8) {
+        case 0x22:
+                memcpy(data, qemu_wacom_hid_report_descriptor,
+                       sizeof(qemu_wacom_hid_report_descriptor));
+                p->actual_length = sizeof(qemu_wacom_hid_report_descriptor);
+            break;
+        default:
+            return;
+        }
+        break;
     case WACOM_SET_REPORT:
         if (s->mouse_grabbed) {
             qemu_remove_mouse_event_handler(s->eh_entry);
-- 
2.32.0


