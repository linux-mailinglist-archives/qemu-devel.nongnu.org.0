Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E8ED74EA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 13:27:56 +0200 (CEST)
Received: from localhost ([::1]:41524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKKza-0002R7-Qo
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 07:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56343)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iKKwZ-0000Js-3X
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 07:24:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iKKwW-0004Fx-Vb
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 07:24:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48468)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iKKwW-0004FW-Q6
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 07:24:44 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0F01010CC1FC;
 Tue, 15 Oct 2019 11:24:44 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A8C91001B07;
 Tue, 15 Oct 2019 11:24:32 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 06/15] hw/i386/pc: remove commented out code from
 x86_load_linux()
Date: Tue, 15 Oct 2019 13:23:37 +0200
Message-Id: <20191015112346.45554-7-slp@redhat.com>
In-Reply-To: <20191015112346.45554-1-slp@redhat.com>
References: <20191015112346.45554-1-slp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Tue, 15 Oct 2019 11:24:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: ehabkost@redhat.com, Sergio Lopez <slp@redhat.com>, mst@redhat.com,
 lersek@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 sgarzare@redhat.com, philmd@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow checkpatch.pl recommendation and remove commented out code from
x86_load_linux().

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/pc.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 90c2263a33..612bfe9c95 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1061,9 +1061,6 @@ static void x86_load_linux(PCMachineState *pcms,
     }
=20
     /* kernel protocol version */
-#if 0
-    fprintf(stderr, "header magic: %#x\n", ldl_p(header+0x202));
-#endif
     if (ldl_p(header + 0x202) =3D=3D 0x53726448) {
         protocol =3D lduw_p(header + 0x206);
     } else {
@@ -1155,16 +1152,6 @@ static void x86_load_linux(PCMachineState *pcms,
         prot_addr    =3D 0x100000;
     }
=20
-#if 0
-    fprintf(stderr,
-            "qemu: real_addr     =3D 0x" TARGET_FMT_plx "\n"
-            "qemu: cmdline_addr  =3D 0x" TARGET_FMT_plx "\n"
-            "qemu: prot_addr     =3D 0x" TARGET_FMT_plx "\n",
-            real_addr,
-            cmdline_addr,
-            prot_addr);
-#endif
-
     /* highest address for loading the initrd */
     if (protocol >=3D 0x20c &&
         lduw_p(header + 0x236) & XLF_CAN_BE_LOADED_ABOVE_4G) {
--=20
2.21.0


