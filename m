Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD0212627D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 13:45:38 +0100 (CET)
Received: from localhost ([::1]:40336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihvBQ-00013n-Gx
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 07:45:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35931)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ihurx-0000WK-Lg
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:25:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ihurw-0002Sr-9G
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:25:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43331
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ihurw-0002Q6-20
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 07:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576758327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+3GKEwZiRFXr5Tov7HfXS2+8rrX3kLEb/Z2Pb/Ejb/I=;
 b=jWMDglW4zrYHYVOIq38p4MCo91pxIE3TC6qDY46O3AN6Tt6tS58Ua6h/VUPdJ3u3JeDW8S
 NZwcIGBFqGEIunNBmdzspp2jqtgecirDXKfGoQeM83vctQG6LD5l2/3J0FMwBjJl3cgblj
 yel4mPNXkJol2Z0iM6OJeglBDE6sbSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-fVc58c5RMzuF-8jAN9OkxQ-1; Thu, 19 Dec 2019 07:25:26 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F9A0107ACC4
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 12:25:25 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-55.ams2.redhat.com
 [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42B2C60C18;
 Thu, 19 Dec 2019 12:25:23 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 124/132] meson: install icons
Date: Thu, 19 Dec 2019 13:23:44 +0100
Message-Id: <1576758232-12439-33-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
References: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: fVc58c5RMzuF-8jAN9OkxQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 Makefile             | 14 --------------
 ui/icons/meson.build | 13 +++++++++++++
 ui/meson.build       |  1 +
 3 files changed, 14 insertions(+), 14 deletions(-)
 create mode 100644 ui/icons/meson.build

diff --git a/Makefile b/Makefile
index 22f9883..04a7d00 100644
--- a/Makefile
+++ b/Makefile
@@ -232,8 +232,6 @@ ifeq ($(CONFIG_GUEST_AGENT),y)
 endif
 endif
=20
-ICON_SIZES=3D16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512
-
 install: all install-datadir install-localstatedir \
 =09recurse-install
 ifneq ($(vhost-user-json-y),)
@@ -242,18 +240,6 @@ ifneq ($(vhost-user-json-y),)
 =09=09$(INSTALL_DATA) $$x "$(DESTDIR)$(qemu_datadir)/vhost-user/"; \
 =09done
 endif
-=09for s in $(ICON_SIZES); do \
-=09=09mkdir -p "$(DESTDIR)$(qemu_icondir)/hicolor/$${s}/apps"; \
-=09=09$(INSTALL_DATA) $(SRC_PATH)/ui/icons/qemu_$${s}.png \
-=09=09=09"$(DESTDIR)$(qemu_icondir)/hicolor/$${s}/apps/qemu.png"; \
-=09done; \
-=09mkdir -p "$(DESTDIR)$(qemu_icondir)/hicolor/32x32/apps"; \
-=09$(INSTALL_DATA) $(SRC_PATH)/ui/icons/qemu_32x32.bmp \
-=09=09"$(DESTDIR)$(qemu_icondir)/hicolor/32x32/apps/qemu.bmp"; \
-=09mkdir -p "$(DESTDIR)$(qemu_icondir)/hicolor/scalable/apps"; \
-=09$(INSTALL_DATA) $(SRC_PATH)/ui/icons/qemu.svg \
-=09=09"$(DESTDIR)$(qemu_icondir)/hicolor/scalable/apps/qemu.svg"
-=09mkdir -p "$(DESTDIR)$(qemu_desktopdir)"
 =09$(INSTALL_DATA) $(SRC_PATH)/ui/qemu.desktop \
 =09=09"$(DESTDIR)$(qemu_desktopdir)/qemu.desktop"
 ifdef CONFIG_GTK
diff --git a/ui/icons/meson.build b/ui/icons/meson.build
new file mode 100644
index 0000000..b6e21f6
--- /dev/null
+++ b/ui/icons/meson.build
@@ -0,0 +1,13 @@
+foreach s: [16, 24, 32, 48, 64, 128, 256, 512]
+  s =3D '@0@x@0@'.format(s.to_string())
+  install_data('qemu_@0@.png'.format(s),
+               rename: 'qemu.png',
+               install_dir: config_host['qemu_icondir'] / 'hicolor' / s / =
'apps')
+endforeach
+
+install_data('qemu_32x32.bmp',
+             rename: 'qemu.bmp',
+             install_dir: config_host['qemu_icondir'] / 'hicolor' / '32x32=
' / 'apps')
+
+install_data('qemu.svg',
+             install_dir: config_host['qemu_icondir'] / 'hicolor' / 'scala=
ble' / 'apps')
diff --git a/ui/meson.build b/ui/meson.build
index 0867cdc..22923e3 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -107,5 +107,6 @@ foreach e : keymaps
 endforeach
=20
 subdir('shader')
+subdir('icons')
=20
 modules +=3D {'ui': ui_modules}
--=20
1.8.3.1



