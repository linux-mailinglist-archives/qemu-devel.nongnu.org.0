Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B98186A68
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 12:53:25 +0100 (CET)
Received: from localhost ([::1]:37490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDoJ9-0000Il-IL
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 07:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51743)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jDnwx-00022L-R1
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 07:30:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1jDnwv-0001Jc-Ty
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 07:30:27 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:35870
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1jDnwv-0001EM-NW
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 07:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584358225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7J+l2f0f5/ilb8YWNAi54ox7ychi5H954THscGoohqo=;
 b=a4wL3OeQQbC309kBfc4MZNEpD7Ov2c/RDIWlNvp2xgMzSD1ySWUx+R5e1uPwQqPDE38ZNx
 TgUbHm4INm8yOTG9PCEvSaS96K/WjjCKO5jAHoqGEO0xpnUXZW39AIlVjlLOrh8BHF/8PL
 S+f/021FszzOzTpAg9aWXykFSlPgKNY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-2N1l5TA4PP6m6EW1ws-mSg-1; Mon, 16 Mar 2020 07:30:21 -0400
X-MC-Unique: 2N1l5TA4PP6m6EW1ws-mSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 608BF1005509;
 Mon, 16 Mar 2020 11:30:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-117.ams2.redhat.com
 [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18E6610016EB;
 Mon, 16 Mar 2020 11:30:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B87D49AF5; Mon, 16 Mar 2020 12:30:15 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] audio: add audiodev format=f32 option documentation
Date: Mon, 16 Mar 2020 12:30:15 +0100
Message-Id: <20200316113015.28013-7-kraxel@redhat.com>
In-Reply-To: <20200316113015.28013-1-kraxel@redhat.com>
References: <20200316113015.28013-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker R=C3=BCmelin <vr_qemu@t-online.de>

The documentaion for -audiodev format=3Df32 option was missing.

Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
Message-id: 20200308193321.20668-6-vr_qemu@t-online.de
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-options.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 1d8f852d8969..962a5ebaa67a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -551,7 +551,7 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
     "                in|out.frequency=3D frequency to use with fixed setti=
ngs\n"
     "                in|out.channels=3D number of channels to use with fix=
ed settings\n"
     "                in|out.format=3D sample format to use with fixed sett=
ings\n"
-    "                valid values: s8, s16, s32, u8, u16, u32\n"
+    "                valid values: s8, s16, s32, u8, u16, u32, f32\n"
     "                in|out.voices=3D number of voices to use\n"
     "                in|out.buffer-length=3D length of buffer in microseco=
nds\n"
     "-audiodev none,id=3Did,[,prop[=3Dvalue][,...]]\n"
@@ -647,7 +647,7 @@ SRST
     ``in|out.format=3Dformat``
         Specify the sample format to use when using fixed-settings.
         Valid values are: ``s8``, ``s16``, ``s32``, ``u8``, ``u16``,
-        ``u32``. Default is ``s16``.
+        ``u32``, ``f32``. Default is ``s16``.
=20
     ``in|out.voices=3Dvoices``
         Specify the number of voices to use. Default is 1.
--=20
2.18.2


