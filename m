Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23C111476E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 20:04:27 +0100 (CET)
Received: from localhost ([::1]:59870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icwQK-0000g3-LU
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 14:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47778)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1icwMV-0007dO-M9
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 14:00:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1icwMR-0006ZL-QB
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 14:00:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54151
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1icwMP-0006Vt-Ga
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 14:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575572417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pWqTHndHSaB17NTTzJCZJfEVxiOKpMXueQWTX8SitHM=;
 b=ge08L8hEMhrXOWDJNNzMkETqdhhVd1iJtfpmYKMvrlxL8h5HfYxyg2zafaUvQAFpzNHEdb
 7ZTXU1/CmHtta/ISiOZiHam/E3+Q+iToiZIbUFg6EHovQUqMDKAQlmBb2DvH6eKIQwWIE3
 xOi2F5h8inFw4TT2X3RJofMVutkwleY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-N8sR-gH3OqSWGDk6Dy_X6w-1; Thu, 05 Dec 2019 14:00:16 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27084804A2F;
 Thu,  5 Dec 2019 19:00:15 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-76.brq.redhat.com [10.40.205.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E1991001281;
 Thu,  5 Dec 2019 19:00:08 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 v2] roms/edk2-funcs: Force softfloat ARM toolchain
 prefix on Debian
Date: Thu,  5 Dec 2019 20:00:06 +0100
Message-Id: <20191205190006.19352-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: N8sR-gH3OqSWGDk6Dy_X6w-1
X-Mimecast-Spam-Score: 0
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
Cc: Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
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

For various reasons documented in [2], the EDK2 project recommend
to use the softfloat toolchain (named 'armel' by Debian).

Force the softfloat cross toolchain prefix on Debian distributions.

[1] https://www.debian.org/ports/arm/#status
[2] https://github.com/tianocore/edk2/commit/41203b9a

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 roms/edk2-funcs.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/roms/edk2-funcs.sh b/roms/edk2-funcs.sh
index 3f4485b201..abd6bbe1fd 100644
--- a/roms/edk2-funcs.sh
+++ b/roms/edk2-funcs.sh
@@ -112,6 +112,9 @@ qemu_edk2_get_cross_prefix()
      ( [ "$gcc_arch" =3D=3D i686 ] && [ "$host_arch" =3D=3D x86_64 ] ); th=
en
     # no cross-compiler needed
     :
+  elif ( [ -e /etc/debian_version ] && [ "$gcc_arch" =3D=3D arm ] ); then
+    # force hard-float cross-compiler on Debian
+    printf 'arm-linux-gnueabi-'
   else
     printf '%s-linux-gnu-\n' "$gcc_arch"
   fi
--=20
2.21.0


