Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92D433454A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:42:07 +0100 (CET)
Received: from localhost ([::1]:54626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2qU-0005yK-Pe
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK2iN-0007hi-0t
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:33:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK2iH-0006yY-7Y
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615397616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+zve30dje/9XnSdNB4el5HXg0L8IB4L2l+Yz29v9zhM=;
 b=AZxSLMU3is10lfBt+v4ZKmAWwdRLmH/GTVvEuZ01uutjOBqJZ6yJHjxKWHhAIR6yr8cQOF
 1aqi02M+WFl4LRfxWZVQY/n6oqAbzAn5tYTGVyENigA/ykIDOT0xFnRw0Q/s/W/K7zxdLd
 aSdgGaUc99C23mt63M2bkdeeZGT+4XI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-LK4Ejn5GMM2fx0PpjUnjYA-1; Wed, 10 Mar 2021 12:33:34 -0500
X-MC-Unique: LK4Ejn5GMM2fx0PpjUnjYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 883CF801817;
 Wed, 10 Mar 2021 17:33:33 +0000 (UTC)
Received: from thuth.com (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F1E860C13;
 Wed, 10 Mar 2021 17:33:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/4] usb: remove support for -usbdevice parameters
Date: Wed, 10 Mar 2021 18:33:20 +0100
Message-Id: <20210310173323.1422754-2-thuth@redhat.com>
In-Reply-To: <20210310173323.1422754-1-thuth@redhat.com>
References: <20210310173323.1422754-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
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
---
 hw/usb/bus.c        | 32 +++++++-------------------------
 hw/usb/dev-serial.c |  2 +-
 include/hw/usb.h    |  2 +-
 3 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 064f94e9c3..4b8882427d 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -312,13 +312,13 @@ typedef struct LegacyUSBFactory
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
@@ -663,27 +663,17 @@ void hmp_info_usb(Monitor *mon, const QDict *qdict)
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
@@ -707,15 +697,7 @@ USBDevice *usbdevice_create(const char *cmdline)
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
index b58c4eb908..63047d79cf 100644
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
diff --git a/include/hw/usb.h b/include/hw/usb.h
index abfbfc5284..08684bcd27 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -500,7 +500,7 @@ void usb_bus_new(USBBus *bus, size_t bus_size,
 void usb_bus_release(USBBus *bus);
 USBBus *usb_bus_find(int busnr);
 void usb_legacy_register(const char *typename, const char *usbdevice_name,
-                         USBDevice *(*usbdevice_init)(const char *params));
+                         USBDevice *(*usbdevice_init)(void));
 USBDevice *usb_new(const char *name);
 bool usb_realize_and_unref(USBDevice *dev, USBBus *bus, Error **errp);
 USBDevice *usb_create_simple(USBBus *bus, const char *name);
-- 
2.27.0


