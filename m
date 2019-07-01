Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3601114BB3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 16:21:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNeUl-0000oA-9D
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 10:21:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNeSt-0008In-FP
	for qemu-devel@nongnu.org; Mon, 06 May 2019 10:19:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNeSs-0002de-Md
	for qemu-devel@nongnu.org; Mon, 06 May 2019 10:19:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40456)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hNeSs-0002dE-Hd
	for qemu-devel@nongnu.org; Mon, 06 May 2019 10:19:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D20CC155E0
	for <qemu-devel@nongnu.org>; Mon,  6 May 2019 14:19:33 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B55160852;
	Mon,  6 May 2019 14:19:31 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  6 May 2019 16:19:22 +0200
Message-Id: <20190506141923.12183-2-philmd@redhat.com>
In-Reply-To: <20190506141923.12183-1-philmd@redhat.com>
References: <20190506141923.12183-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 06 May 2019 14:19:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 1/2] roms: Correct the
 EDK2_BASETOOLS_OPTFLAGS variable description
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laszlo Ersek <lersek@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 1cab464136b4 we incorrectly described the
EDK2_BASETOOLS_OPTFLAGS can pass CPPFLAGS and CFLAGS
options to the EDK2 build tools, but it only expands
the CFLAGS (not to the CPPFLAGS).
Update the description to be more accurate.

Reported-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v3: Squeezed 2 spaces (Laszlo)
---
 roms/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/roms/Makefile b/roms/Makefile
index 0ce84a45ad5..ea6aec56abd 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -121,8 +121,8 @@ build-efi-roms: build-pxe-roms
 		$(patsubst %,bin-i386-efi/%.efidrv,$(pxerom_targets)) \
 		$(patsubst %,bin-x86_64-efi/%.efidrv,$(pxerom_targets))
=20
-# Build scripts can pass compiler/linker flags to the EDK2 build tools
-# via the EDK2_BASETOOLS_OPTFLAGS (CPPFLAGS and CFLAGS) and
+# Build scripts can pass compiler/linker flags to the EDK2
+# build tools via the EDK2_BASETOOLS_OPTFLAGS (CFLAGS) and
 # EDK2_BASETOOLS_LDFLAGS (LDFLAGS) environment variables.
 #
 # Example:
--=20
2.20.1


