Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA4AB610D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 12:07:22 +0200 (CEST)
Received: from localhost ([::1]:56866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAWro-0005Rk-Ie
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 06:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59628)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iAWek-00037A-Dg
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 05:53:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iAWej-0007By-DR
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 05:53:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56462)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iAWej-0007Bj-8T
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 05:53:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 95BBF368CF;
 Wed, 18 Sep 2019 09:53:48 +0000 (UTC)
Received: from localhost (unknown [10.36.118.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08F81100194E;
 Wed, 18 Sep 2019 09:53:42 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 18 Sep 2019 10:53:33 +0100
Message-Id: <20190918095335.7646-2-stefanha@redhat.com>
In-Reply-To: <20190918095335.7646-1-stefanha@redhat.com>
References: <20190918095335.7646-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 18 Sep 2019 09:53:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 1/3] audio: fix buffer-length typo in
 documentation
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <DirtY.iCE.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: f0b3d811529 ("audio: -audiodev command line option: documentation"=
)
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qemu-options.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index bbfd936d29..a4f9f74f52 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -439,7 +439,7 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
     "                in|out.format=3D sample format to use with fixed se=
ttings\n"
     "                valid values: s8, s16, s32, u8, u16, u32\n"
     "                in|out.voices=3D number of voices to use\n"
-    "                in|out.buffer-len=3D length of buffer in microsecon=
ds\n"
+    "                in|out.buffer-length=3D length of buffer in microse=
conds\n"
     "-audiodev none,id=3Did,[,prop[=3Dvalue][,...]]\n"
     "                dummy driver that discards all output\n"
 #ifdef CONFIG_AUDIO_ALSA
@@ -524,7 +524,7 @@ Valid values are: @code{s8}, @code{s16}, @code{s32}, =
@code{u8},
 @item in|out.voices=3D@var{voices}
 Specify the number of @var{voices} to use.  Default is 1.
=20
-@item in|out.buffer=3D@var{usecs}
+@item in|out.buffer-length=3D@var{usecs}
 Sets the size of the buffer in microseconds.
=20
 @end table
--=20
2.21.0


