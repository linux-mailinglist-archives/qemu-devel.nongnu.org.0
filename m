Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8DC181D39
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 17:10:31 +0100 (CET)
Received: from localhost ([::1]:55176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3wE-0005SK-2v
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 12:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36287)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1jC3vK-00053C-H7
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:09:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1jC3vJ-00041Z-BQ
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:09:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45623
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1jC3vJ-0003wf-7c
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583942972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kt0Om26t2Lu2vJzAFS4iZZXRfK1mPizdDJ8/flNxEUA=;
 b=P89vNsFRlr2lPHSE552DW2ryh+X3+7XBrfy/q+j7MJzQ47ayqppVrF1z2I0KAp3O83N/LW
 E5VclvIxoyaQYF/Uahqq/t9VElxi+Pl/didSH6Y7wGQjqVdYVSVBSlfBhzj8Qc2tzsxizC
 XD1GYB35x4wAOtTSMCoIZKebm2GgExY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-yRsGyV1ANz-4ZaS2w9A7cg-1; Wed, 11 Mar 2020 12:09:30 -0400
X-MC-Unique: yRsGyV1ANz-4ZaS2w9A7cg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB03F800D55
 for <qemu-devel@nongnu.org>; Wed, 11 Mar 2020 16:09:29 +0000 (UTC)
Received: from localhost (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 573B4512F1;
 Wed, 11 Mar 2020 16:09:24 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] build-sys: do not make qemu-ga link with pixman
Date: Wed, 11 Mar 2020 17:09:23 +0100
Message-Id: <20200311160923.882474-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: pbonzini@redhat.com, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit d52c454aadcdae74506f315ebf8b58bb79a05573 ("contrib: add
vhost-user-gpu"), qemu-ga is linking with pixman.

This is because the Make-based build-system use a global namespace for
variables, and we rely on "main.o-libs" for different linking targets.

Note: this kind of variable clashing is hard to fix or prevent
currently.  meson should help, as declarations have a linear
dependency and doesn't rely so much on variables and clever tricks.

Note2: we have a lot of main.c (or other duplicated names!) in
tree. Imho, it would be annoying and a bad workaroud to rename all
those to avoid conflicts like I did here.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1811670

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 contrib/vhost-user-gpu/{main.c =3D> vhost-user-gpu.c} | 0
 contrib/vhost-user-gpu/Makefile.objs                | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename contrib/vhost-user-gpu/{main.c =3D> vhost-user-gpu.c} (100%)

diff --git a/contrib/vhost-user-gpu/main.c b/contrib/vhost-user-gpu/vhost-u=
ser-gpu.c
similarity index 100%
rename from contrib/vhost-user-gpu/main.c
rename to contrib/vhost-user-gpu/vhost-user-gpu.c
diff --git a/contrib/vhost-user-gpu/Makefile.objs b/contrib/vhost-user-gpu/=
Makefile.objs
index 6170c919e4..09296091be 100644
--- a/contrib/vhost-user-gpu/Makefile.objs
+++ b/contrib/vhost-user-gpu/Makefile.objs
@@ -1,7 +1,7 @@
-vhost-user-gpu-obj-y =3D main.o virgl.o vugbm.o
+vhost-user-gpu-obj-y =3D vhost-user-gpu.o virgl.o vugbm.o
=20
-main.o-cflags :=3D $(PIXMAN_CFLAGS) $(GBM_CFLAGS)
-main.o-libs :=3D $(PIXMAN_LIBS)
+vhost-user-gpu.o-cflags :=3D $(PIXMAN_CFLAGS) $(GBM_CFLAGS)
+vhost-user-gpu.o-libs :=3D $(PIXMAN_LIBS)
=20
 virgl.o-cflags :=3D $(VIRGL_CFLAGS) $(GBM_CFLAGS)
 virgl.o-libs :=3D $(VIRGL_LIBS)
--=20
2.25.0.rc2.1.g09a9a1a997


