Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C8A2B377
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 13:48:57 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVE7c-0006yn-Oy
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 07:48:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE1q-00035k-NS
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:42:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE1p-0003JQ-RD
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:42:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49206)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE1i-0003ED-Jb; Mon, 27 May 2019 07:42:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5F9CC059B80;
	Mon, 27 May 2019 11:42:49 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C30205D723;
	Mon, 27 May 2019 11:42:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:39 +0200
Message-Id: <20190527114203.2762-4-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 27 May 2019 11:42:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 03/27] update-linux-headers: Add sve_context.h
 to asm-arm64
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jones <drjones@redhat.com>

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 scripts/update-linux-headers.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-heade=
rs.sh
index dfdfdfddcf..c97d485b08 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -99,6 +99,9 @@ for arch in $ARCHLIST; do
         cp "$tmpdir/include/asm/$header" "$output/linux-headers/asm-$arc=
h"
     done
=20
+    if [ $arch =3D arm64 ]; then
+        cp "$tmpdir/include/asm/sve_context.h" "$output/linux-headers/as=
m-arm64/"
+    fi
     if [ $arch =3D mips ]; then
         cp "$tmpdir/include/asm/sgidefs.h" "$output/linux-headers/asm-mi=
ps/"
         cp "$tmpdir/include/asm/unistd_o32.h" "$output/linux-headers/asm=
-mips/"
--=20
2.20.1


