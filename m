Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BE0127C68
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 15:20:59 +0100 (CET)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiJ9G-0003a3-2R
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 09:20:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47419)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiIhd-00044m-Ik
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:52:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiIhc-0007ZJ-3u
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:52:25 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48967
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iiIhb-0007X2-TY
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576849943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3MdcmcIGRBu7yC0nFlRdq11GjU0cBWKn+3toxrMtEyY=;
 b=OQWQI+jzWwQqu1fHqW1pGOECbKBzLB3BwjHT3mJaTtB2rBYEf54rnYMYvCv29O0Cl2wB/H
 /hgM/v3IKQtC3IZFXuV1QKnuIJsxvDnA/DDQIyQT6ChXAxz6g97svxWonPcSgq3zm6YYuk
 uguv0QMw3Hny0zr1yptCM3XhddlzlZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-Xv_ajuvEPH61b6iqCVbndw-1; Fri, 20 Dec 2019 08:52:20 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BE68185432D;
 Fri, 20 Dec 2019 13:52:19 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87D5A26FB9;
 Fri, 20 Dec 2019 13:52:14 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 36/37] qdev: remove QDEV_PROP_PTR
Date: Fri, 20 Dec 2019 17:46:00 +0400
Message-Id: <20191220134601.571905-37-marcandre.lureau@redhat.com>
In-Reply-To: <20191220134601.571905-1-marcandre.lureau@redhat.com>
References: <20191220134601.571905-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Xv_ajuvEPH61b6iqCVbndw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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

No longer used in the tree. The comment about user_creatable is still
quite relevant, but there is already a similar comment in qdev-core.h.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/core/qdev-properties.c    | 18 ------------------
 include/hw/qdev-properties.h | 22 ----------------------
 2 files changed, 40 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index ac28890e5a..6ca7697599 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -501,13 +501,6 @@ const PropertyInfo qdev_prop_string =3D {
     .set   =3D set_string,
 };
=20
-/* --- pointer --- */
-
-/* Not a proper property, just for dirty hacks.  TODO Remove it!  */
-const PropertyInfo qdev_prop_ptr =3D {
-    .name  =3D "ptr",
-};
-
 /* --- mac address --- */
=20
 /*
@@ -1165,17 +1158,6 @@ void qdev_prop_set_enum(DeviceState *dev, const char=
 *name, int value)
                             name, &error_abort);
 }
=20
-void qdev_prop_set_ptr(DeviceState *dev, const char *name, void *value)
-{
-    Property *prop;
-    void **ptr;
-
-    prop =3D qdev_prop_find(dev, name);
-    assert(prop && prop->info =3D=3D &qdev_prop_ptr);
-    ptr =3D qdev_get_prop_ptr(dev, prop);
-    *ptr =3D value;
-}
-
 static GPtrArray *global_props(void)
 {
     static GPtrArray *gp;
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 16837ab5dd..a90a9cec80 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -18,7 +18,6 @@ extern const PropertyInfo qdev_prop_size;
 extern const PropertyInfo qdev_prop_string;
 extern const PropertyInfo qdev_prop_chr;
 extern const PropertyInfo qdev_prop_tpm;
-extern const PropertyInfo qdev_prop_ptr;
 extern const PropertyInfo qdev_prop_macaddr;
 extern const PropertyInfo qdev_prop_on_off_auto;
 extern const PropertyInfo qdev_prop_losttickpolicy;
@@ -171,25 +170,6 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
 #define DEFINE_PROP_PCI_DEVFN(_n, _s, _f, _d)                   \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_pci_devfn, int32_t)
=20
-/*
- * Please avoid pointer properties.  If you must use them, you must
- * cover them in their device's class init function as follows:
- *
- * - If the property must be set, the device cannot be used with
- *   device_add, so add code like this:
- *   |* Reason: pointer property "NAME-OF-YOUR-PROP" *|
- *   DeviceClass *dc =3D DEVICE_CLASS(class);
- *   dc->user_creatable =3D false;
- *
- * - If the property may safely remain null, document it like this:
- *   |*
- *    * Note: pointer property "interrupt_vector" may remain null, thus
- *    * no need for dc->user_creatable =3D false;
- *    *|
- */
-#define DEFINE_PROP_PTR(_n, _s, _f)             \
-    DEFINE_PROP(_n, _s, _f, qdev_prop_ptr, void*)
-
 #define DEFINE_PROP_CHR(_n, _s, _f)             \
     DEFINE_PROP(_n, _s, _f, qdev_prop_chr, CharBackend)
 #define DEFINE_PROP_STRING(_n, _s, _f)             \
@@ -262,8 +242,6 @@ void qdev_prop_set_drive(DeviceState *dev, const char *=
name,
 void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
                            const uint8_t *value);
 void qdev_prop_set_enum(DeviceState *dev, const char *name, int value);
-/* FIXME: Remove opaque pointer properties.  */
-void qdev_prop_set_ptr(DeviceState *dev, const char *name, void *value);
=20
 void qdev_prop_register_global(GlobalProperty *prop);
 int qdev_prop_check_globals(void);
--=20
2.24.0.308.g228f53135a


