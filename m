Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1553A127BF9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 14:51:11 +0100 (CET)
Received: from localhost ([::1]:56144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiIgP-00080g-L2
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 08:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55357)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiIbu-0002SC-Uk
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:46:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiIbt-0004iJ-Ku
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:46:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57399
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iiIbt-0004dr-Df
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576849588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WIyw2oPbq6TeMBF+9vJKPv0bzo11CTOb3s6Rch9UlmQ=;
 b=LvmzVsh2ZhIIr/xk/lIapqkjbaGxiPf0MKYoH54PUPLJKuYUqKIrD5/KwbKSuwu8KUYxxA
 RBQX7FBpwkdZEOawJtc9Ou7lYrzacTHaIOqcij7frxeIJG3O8ek52PtorjrcEXzURx7lfz
 vyOaioiUOtd6L942DShSbkA3I9JVsJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-yDq5u3kDP3i4dbfCypjUuQ-1; Fri, 20 Dec 2019 08:46:24 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97D7F8C0C6D;
 Fri, 20 Dec 2019 13:46:23 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC58E1A8E4;
 Fri, 20 Dec 2019 13:46:21 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/37] sysbus: remove unused sysbus_try_create*
Date: Fri, 20 Dec 2019 17:45:26 +0400
Message-Id: <20191220134601.571905-3-marcandre.lureau@redhat.com>
In-Reply-To: <20191220134601.571905-1-marcandre.lureau@redhat.com>
References: <20191220134601.571905-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: yDq5u3kDP3i4dbfCypjUuQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/core/sysbus.c    | 32 --------------------------------
 hw/i386/pc.c        |  1 -
 include/hw/sysbus.h |  9 +--------
 3 files changed, 1 insertion(+), 41 deletions(-)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 9e69c83aed..08b0311c5f 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -250,38 +250,6 @@ DeviceState *sysbus_create_varargs(const char *name,
     return dev;
 }
=20
-DeviceState *sysbus_try_create_varargs(const char *name,
-                                       hwaddr addr, ...)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-    va_list va;
-    qemu_irq irq;
-    int n;
-
-    dev =3D qdev_try_create(NULL, name);
-    if (!dev) {
-        return NULL;
-    }
-    s =3D SYS_BUS_DEVICE(dev);
-    qdev_init_nofail(dev);
-    if (addr !=3D (hwaddr)-1) {
-        sysbus_mmio_map(s, 0, addr);
-    }
-    va_start(va, addr);
-    n =3D 0;
-    while (1) {
-        irq =3D va_arg(va, qemu_irq);
-        if (!irq) {
-            break;
-        }
-        sysbus_connect_irq(s, n, irq);
-        n++;
-    }
-    va_end(va);
-    return dev;
-}
-
 static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent)
 {
     SysBusDevice *s =3D SYS_BUS_DEVICE(dev);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 42014b06de..a4fda69b49 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1198,7 +1198,6 @@ void pc_basic_device_init(ISABus *isa_bus, qemu_irq *=
gsi,
      * when the HPET wants to take over. Thus we have to disable the latte=
r.
      */
     if (!no_hpet && (!kvm_irqchip_in_kernel() || kvm_has_pit_state2())) {
-        /* In order to set property, here not using sysbus_try_create_simp=
le */
         hpet =3D qdev_try_create(NULL, TYPE_HPET);
         if (hpet) {
             /* For pc-piix-*, hpet's intcap is always IRQ2. For pc-q35-1.7
diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 27e80881da..2eb0484388 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -117,8 +117,7 @@ void foreach_dynamic_sysbus_device(FindSysbusDeviceFunc=
 *func, void *opaque);
 /* Legacy helper function for creating devices.  */
 DeviceState *sysbus_create_varargs(const char *name,
                                  hwaddr addr, ...);
-DeviceState *sysbus_try_create_varargs(const char *name,
-                                       hwaddr addr, ...);
+
 static inline DeviceState *sysbus_create_simple(const char *name,
                                               hwaddr addr,
                                               qemu_irq irq)
@@ -126,11 +125,5 @@ static inline DeviceState *sysbus_create_simple(const =
char *name,
     return sysbus_create_varargs(name, addr, irq, NULL);
 }
=20
-static inline DeviceState *sysbus_try_create_simple(const char *name,
-                                                    hwaddr addr,
-                                                    qemu_irq irq)
-{
-    return sysbus_try_create_varargs(name, addr, irq, NULL);
-}
=20
 #endif /* HW_SYSBUS_H */
--=20
2.24.0.308.g228f53135a


