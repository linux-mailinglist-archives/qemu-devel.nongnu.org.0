Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9D7144056
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 16:17:31 +0100 (CET)
Received: from localhost ([::1]:56572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itvHW-0007jq-US
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 10:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53450)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itvGA-0006xp-FD
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 10:16:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itvG5-00058S-HM
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 10:16:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49188
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itvG5-00058C-D6
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 10:16:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579619760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJ69MA94HymB7Wu/TMg3CaTPgcVavh3x5PG4KSTyato=;
 b=HK82bLfYYcPrCHheaDYWfMBqriEFICJ5hPJxDVDa5bPMDNp8G+Ub2tEJWG2J9iuxLBZ5LF
 Yyyhn9ExuSeclQ1/tU5cem6pvlbiZgfJjug0z2QNG9W2ErEzOjBQjcNzU9cEsAxKwskcvR
 qthJByIaLUKbEgnMUkPqElmiaO1zXGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-0KxASM3XMX62HpXb2MrASw-1; Tue, 21 Jan 2020 10:15:58 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8A48801E67
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 15:15:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-38.brq.redhat.com [10.40.205.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7935A60E1C;
 Tue, 21 Jan 2020 15:15:54 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] roms/edk2-funcs: Force softfloat ARM toolchain prefix on
 Debian
Date: Tue, 21 Jan 2020 16:15:42 +0100
Message-Id: <20200121151543.18538-2-philmd@redhat.com>
In-Reply-To: <20200121151543.18538-1-philmd@redhat.com>
References: <20200121151543.18538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 0KxASM3XMX62HpXb2MrASw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Debian (based) distributions currently provides 2 ARM
toolchains, documented as [1]:

* The ARM EABI (armel) port targets a range of older 32-bit ARM
  devices, particularly those used in NAS hardware and a variety
  of *plug computers.
* The newer ARM hard-float (armhf) port supports newer, more
  powerful 32-bit devices using version 7 of the ARM architecture
  specification.

For various reasons documented in [2], the EDK2 project suggests
to use the softfloat toolchain (named 'armel' by Debian).

Force the softfloat cross toolchain prefix on Debian distributions.

[1] https://www.debian.org/ports/arm/#status
[2] https://github.com/tianocore/edk2/commit/41203b9a

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 roms/edk2-funcs.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/roms/edk2-funcs.sh b/roms/edk2-funcs.sh
index 3f4485b201..cd6e4f2c82 100644
--- a/roms/edk2-funcs.sh
+++ b/roms/edk2-funcs.sh
@@ -112,6 +112,9 @@ qemu_edk2_get_cross_prefix()
      ( [ "$gcc_arch" =3D=3D i686 ] && [ "$host_arch" =3D=3D x86_64 ] ); th=
en
     # no cross-compiler needed
     :
+  elif ( [ -e /etc/debian_version ] && [ "$gcc_arch" =3D=3D arm ] ); then
+    # force soft-float cross-compiler on Debian
+    printf 'arm-linux-gnueabi-'
   else
     printf '%s-linux-gnu-\n' "$gcc_arch"
   fi
--=20
2.21.1


