Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA071FA2AE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 23:21:30 +0200 (CEST)
Received: from localhost ([::1]:59288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkwXp-0002UB-4h
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 17:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuk-0003fl-21
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:41:06 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45892
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvub-0000jc-Ln
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:41:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592253656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+lvCPv6C1E96zaetBeckKEUTn1Kohd9sYRTC0BciuQI=;
 b=NOHdji+6/vrXnG59m0ZXfME7htxWAHsx1FtRX6MhLvLlsglC/u9XLQKPzsF5s19Y9THZyt
 jrBuvbMxCgGC6BI+oitpBLtqAXK/3qChmnka0wk/jrCvd4rbRtVg9VafqdwE1b9AdhBmH6
 LlUelZIFaR9DoXthywLuAzCwvKLQaVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-xYTBVtEmMxOjHeb3RsnPqQ-1; Mon, 15 Jun 2020 16:40:45 -0400
X-MC-Unique: xYTBVtEmMxOjHeb3RsnPqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64ABE1091321
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 20:40:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6330E7FE82;
 Mon, 15 Jun 2020 20:40:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E00F01132D7F; Mon, 15 Jun 2020 22:40:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 54/84] usb: usb_create() is now unused, drop
Date: Mon, 15 Jun 2020 22:39:38 +0200
Message-Id: <20200615204008.3069956-55-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 15:33:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200610053247.1583243-29-armbru@redhat.com>
---
 include/hw/usb.h | 1 -
 hw/usb/bus.c     | 8 --------
 2 files changed, 9 deletions(-)

diff --git a/include/hw/usb.h b/include/hw/usb.h
index dce16c792b..e29a37635b 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -505,7 +505,6 @@ void usb_legacy_register(const char *typename, const char *usbdevice_name,
                          USBDevice *(*usbdevice_init)(const char *params));
 USBDevice *usb_new(const char *name);
 bool usb_realize_and_unref(USBDevice *dev, USBBus *bus, Error **errp);
-USBDevice *usb_create(USBBus *bus, const char *name);
 USBDevice *usb_create_simple(USBBus *bus, const char *name);
 USBDevice *usbdevice_create(const char *cmdline);
 void usb_register_port(USBBus *bus, USBPort *port, void *opaque, int index,
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index da85b8b005..5c4d31614e 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -323,14 +323,6 @@ bool usb_realize_and_unref(USBDevice *dev, USBBus *bus, Error **errp)
     return qdev_realize_and_unref(&dev->qdev, &bus->qbus, errp);
 }
 
-USBDevice *usb_create(USBBus *bus, const char *name)
-{
-    DeviceState *dev;
-
-    dev = qdev_create(&bus->qbus, name);
-    return USB_DEVICE(dev);
-}
-
 static USBDevice *usb_try_create_simple(USBBus *bus, const char *name,
                                         Error **errp)
 {
-- 
2.26.2


