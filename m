Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65973154318
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 12:31:02 +0100 (CET)
Received: from localhost ([::1]:36842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izfN7-0001l2-Ba
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 06:31:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40176)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1izfLV-0008ST-KN
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:29:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1izfLT-0001xA-6R
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:29:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43079
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1izfLT-0001uN-2L
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580988558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1Ppgvtxuqv/cQY2jtSC5bIqDJzrtCGOk93IFYtq2aQ=;
 b=gyd2FR+QVXtGM61XkC7675Kudh1f3WbZZsDfU63sGnlGgxaTp0p+3e3nnUsOTe33BU0n1w
 JUpUJq/UwBcZMdj1rqkKOEKRtkNRjYMDSCDy/Mi4iw3AHJfn2LKlxBIFi6/EZojgXD9rbM
 STF6e06bFH6PYC7tL57szvzA+se4N20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-5kfq3GsyN_K9M4d0yI73Pg-1; Thu, 06 Feb 2020 06:29:17 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D33D1835A14;
 Thu,  6 Feb 2020 11:29:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6EE05DA7D;
 Thu,  6 Feb 2020 11:29:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 31B801FCDA; Thu,  6 Feb 2020 12:29:09 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] ui: deprecate legacy -show-cursor option
Date: Thu,  6 Feb 2020 12:29:08 +0100
Message-Id: <20200206112908.5002-7-kraxel@redhat.com>
In-Reply-To: <20200206112908.5002-1-kraxel@redhat.com>
References: <20200206112908.5002-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 5kfq3GsyN_K9M4d0yI73Pg-1
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jtomko@redhat.com,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 jpewhacker@gmail.com, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: J=C3=A1n Tomko <jtomko@redhat.com>
---
 vl.c                 | 2 ++
 qemu-deprecated.texi | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/vl.c b/vl.c
index fd96d04578cd..2f8b9753b49d 100644
--- a/vl.c
+++ b/vl.c
@@ -3552,6 +3552,8 @@ int main(int argc, char **argv, char **envp)
                 no_shutdown =3D 1;
                 break;
             case QEMU_OPTION_show_cursor:
+                warn_report("The -show-cursor option is deprecated, "
+                            "use -display {sdl,gtk},show-cursor=3Don inste=
ad");
                 dpy.has_show_cursor =3D true;
                 dpy.show_cursor =3D true;
                 break;
diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index ea3e10bde398..c1444d1839bd 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -148,6 +148,11 @@ QEMU 5.0 introduced an alternative syntax to specify t=
he size of the translation
 block cache, @option{-accel tcg,tb-size=3D}.  The new syntax deprecates th=
e
 previously available @option{-tb-size} option.
=20
+@subsection -show-cursor option (since 5.0)
+
+Use @option{-display sdl,show-cursor=3Don} or
+ @option{-display gtk,show-cursor=3Don} instead.
+
 @section QEMU Machine Protocol (QMP) commands
=20
 @subsection change (since 2.5.0)
--=20
2.18.1


