Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A872833C5BF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:34:39 +0100 (CET)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLs34-0005Ys-KB
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrZk-0002qs-IF
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:04:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrZg-0000y9-2L
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615831450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aA1OmuGwGeb5S9GO0UwDSwAHfUVsIWifVjYQl8QB5Rc=;
 b=RtWLyvJZpJncieYaCxMW9F6nl4ZN1EFAt5wubrwzZhT6bMNXlPEPk8RBmldP+MWTzp72Su
 wM3Q2Pz/yKP+EL9ABwOmwZKx2OMv5ZJkCy0KlC16Jqj3MwbZbHRX54z0rCyzVx7GCYAf7M
 h+GthnoaMLaAnAStqVRsf5of4WdR6l0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-Gu4tohT7PoGeAPaIj3OF6w-1; Mon, 15 Mar 2021 14:02:50 -0400
X-MC-Unique: Gu4tohT7PoGeAPaIj3OF6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20101108BD0F;
 Mon, 15 Mar 2021 18:02:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1468620DE;
 Mon, 15 Mar 2021 18:02:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1DC7C1800637; Mon, 15 Mar 2021 19:02:41 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/13] usb: remove support for -usbdevice parameters
Date: Mon, 15 Mar 2021 19:02:29 +0100
Message-Id: <20210315180240.1597240-3-kraxel@redhat.com>
In-Reply-To: <20210315180240.1597240-1-kraxel@redhat.com>
References: <20210315180240.1597240-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, libvir-list@redhat.com,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

No device needs them anymore and in fact they're undocumented.
Remove the code.  The only change in behavior is that "-usbdevice
braille:hello" now reports an error, which is a bugfix.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210310173323.1422754-2-thuth@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/usb.h    |  2 +-
 hw/usb/bus.c        | 32 +++++++-------------------------
 hw/usb/dev-serial.c |  2 +-
 3 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/include/hw/usb.h b/include/hw/usb.h
index 9f42394efaea..436e07b30404 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -499,7 +499,7 @@ void usb_bus_new(USBBus *bus, size_t bus_size,
 void usb_bus_release(USBBus *bus);
 USBBus *usb_bus_find(int busnr);
 void usb_legacy_register(const char *typename, const char *usbdevice_name,
-                         USBDevice *(*usbdevice_init)(const char *params));
+                         USBDevice *(*usbdevice_init)(void));
 USBDevice *usb_new(const char *name);
 bool usb_realize_and_unref(USBDevice *dev, USBBus *bus, Error **errp);
 USBDevice *usb_create_simple(USBBus *bus, const char *name);
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index df7411fea8e4..07083349f51b 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -310,13 +310,13 @@ typedef struct LegacyUSBFactory
 {
     const char *name;
     const char *usbdevice_name;
-    USBDevice *(*usbdevice_init)(const char *params);
+    USBDevice *(*usbdevice_init)(void);
 } LegacyUSBFactory;
 
 static GSList *legacy_usb_factory;
 
 void usb_legacy_register(const char *typename, const char *usbdevice_name,
-                         USBDevice *(*usbdevice_init)(const char *params))
+                         USBDevice *(*usbdevice_init)(void))
 {
     if (usbdevice_name) {
         LegacyUSBFactory *f = g_malloc0(sizeof(*f));
@@ -658,27 +658,17 @@ void hmp_info_usb(Monitor *mon, const QDict *qdict)
 }
 
 /* handle legacy -usbdevice cmd line option */
-USBDevice *usbdevice_create(const char *cmdline)
+USBDevice *usbdevice_create(const char *driver)
 {
     USBBus *bus = usb_bus_find(-1 /* any */);
     LegacyUSBFactory *f = NULL;
     Error *err = NULL;
     GSList *i;
-    char driver[32];
-    const char *params;
-    int len;
     USBDevice *dev;
 
-    params = strchr(cmdline,':');
-    if (params) {
-        params++;
-        len = params - cmdline;
-        if (len > sizeof(driver))
-            len = sizeof(driver);
-        pstrcpy(driver, len, cmdline);
-    } else {
-        params = "";
-        pstrcpy(driver, sizeof(driver), cmdline);
+    if (strchr(driver, ':')) {
+        error_report("usbdevice parameters are not supported anymore");
+        return NULL;
     }
 
     for (i = legacy_usb_factory; i; i = i->next) {
@@ -702,15 +692,7 @@ USBDevice *usbdevice_create(const char *cmdline)
         return NULL;
     }
 
-    if (f->usbdevice_init) {
-        dev = f->usbdevice_init(params);
-    } else {
-        if (*params) {
-            error_report("usbdevice %s accepts no params", driver);
-            return NULL;
-        }
-        dev = usb_new(f->name);
-    }
+    dev = f->usbdevice_init ? f->usbdevice_init() : usb_new(f->name);
     if (!dev) {
         error_report("Failed to create USB device '%s'", f->name);
         return NULL;
diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index b58c4eb90822..63047d79cfd1 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -614,7 +614,7 @@ static void usb_serial_realize(USBDevice *dev, Error **errp)
     s->intr = usb_ep_get(dev, USB_TOKEN_IN, 1);
 }
 
-static USBDevice *usb_braille_init(const char *unused)
+static USBDevice *usb_braille_init(void)
 {
     USBDevice *dev;
     Chardev *cdrv;
-- 
2.29.2


