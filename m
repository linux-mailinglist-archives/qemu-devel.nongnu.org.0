Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCE0155586
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 11:21:57 +0100 (CET)
Received: from localhost ([::1]:53492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j00lo-0007Cd-OH
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 05:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47058)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1j00iA-0007vn-3o
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 05:18:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1j00i9-0008R6-5q
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 05:18:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33154
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1j00i9-0008QV-2Y
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 05:18:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581070688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i3cq53tpoa9+e9edeCuo1Vd1Vpo2LSWIBS8mpEz4xuc=;
 b=JWbCRCnLerafK6msaxEr1PO08JWIm5TA6P8w5xd048XnO4uVFuwxLNpWaknBM1bv2GYiw8
 5Q5JhE5YxW26Hkff0oTZpcEISrHvIDi5snw1gap9H8/jKDMgMSNGX7Y+eN1TopeTY/aOKh
 UtVdcFPFGFQSk6qYvJuD3GpxxcTBM30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-lJzSKcq6NCuUhoSQjJCGFg-1; Fri, 07 Feb 2020 05:18:06 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43BF0189F760;
 Fri,  7 Feb 2020 10:18:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3088B1001B28;
 Fri,  7 Feb 2020 10:18:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9F25331F2A; Fri,  7 Feb 2020 11:17:53 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/7] ui: drop curor_hide global variable.
Date: Fri,  7 Feb 2020 11:17:52 +0100
Message-Id: <20200207101753.25812-7-kraxel@redhat.com>
In-Reply-To: <20200207101753.25812-1-kraxel@redhat.com>
References: <20200207101753.25812-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: lJzSKcq6NCuUhoSQjJCGFg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jtomko@redhat.com,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 jpewhacker@gmail.com, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No users left.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/sysemu/sysemu.h | 1 -
 vl.c                    | 2 --
 2 files changed, 3 deletions(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 6358a324a711..7956e9054ade 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -41,7 +41,6 @@ extern const char *keyboard_layout;
 extern int win2k_install_hack;
 extern int alt_grab;
 extern int ctrl_grab;
-extern int cursor_hide;
 extern int graphic_rotate;
 extern int no_shutdown;
 extern int old_param;
diff --git a/vl.c b/vl.c
index 0a13cf2b1724..62efcd15c0bf 100644
--- a/vl.c
+++ b/vl.c
@@ -168,7 +168,6 @@ int no_hpet =3D 0;
 int fd_bootchk =3D 1;
 static int no_reboot;
 int no_shutdown =3D 0;
-int cursor_hide =3D 1;
 int graphic_rotate =3D 0;
 const char *watchdog;
 QEMUOptionRom option_rom[MAX_OPTION_ROMS];
@@ -3563,7 +3562,6 @@ int main(int argc, char **argv, char **envp)
                 no_shutdown =3D 1;
                 break;
             case QEMU_OPTION_show_cursor:
-                cursor_hide =3D 0;
                 dpy.has_show_cursor =3D true;
                 dpy.show_cursor =3D true;
                 break;
--=20
2.18.1


