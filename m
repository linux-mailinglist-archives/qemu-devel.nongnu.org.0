Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873049F283
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 20:40:32 +0200 (CEST)
Received: from localhost ([::1]:55719 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2gON-0008Tp-5r
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 14:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i2g8K-0003If-0o
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 14:23:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i2g8I-0005kf-Nq
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 14:23:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38902)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i2g8G-0005hS-5f; Tue, 27 Aug 2019 14:23:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 815D88AC6FF;
 Tue, 27 Aug 2019 18:23:51 +0000 (UTC)
Received: from localhost (unknown [10.40.205.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C0A95C1D6;
 Tue, 27 Aug 2019 18:23:50 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 27 Aug 2019 20:23:13 +0200
Message-Id: <20190827182313.25983-16-mreitz@redhat.com>
In-Reply-To: <20190827182313.25983-1-mreitz@redhat.com>
References: <20190827182313.25983-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Tue, 27 Aug 2019 18:23:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 15/15] iotests: Unify cache mode quoting
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nir Soffer <nirsof@gmail.com>

Quoting cache mode is not needed, and most tests use unquoted values.
Unify all test to use the same style.

Message-id: 20190827173432.7656-1-nsoffer@redhat.com
Signed-off-by: Nir Soffer <nsoffer@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/026 | 4 ++--
 tests/qemu-iotests/039 | 4 ++--
 tests/qemu-iotests/052 | 2 +-
 tests/qemu-iotests/091 | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/026 b/tests/qemu-iotests/026
index e30243608b..ffb18ab6b5 100755
--- a/tests/qemu-iotests/026
+++ b/tests/qemu-iotests/026
@@ -41,8 +41,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 # Currently only qcow2 supports rebasing
 _supported_fmt qcow2
 _supported_proto file
-_default_cache_mode "writethrough"
-_supported_cache_modes "writethrough" "none"
+_default_cache_mode writethrough
+_supported_cache_modes writethrough none
 # The refcount table tests expect a certain minimum width for refcount e=
ntries
 # (so that the refcount table actually needs to grow); that minimum is 1=
6 bits,
 # being the default refcount entry width.
diff --git a/tests/qemu-iotests/039 b/tests/qemu-iotests/039
index 0d4e963bd4..7c730d94a7 100755
--- a/tests/qemu-iotests/039
+++ b/tests/qemu-iotests/039
@@ -42,8 +42,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
-_default_cache_mode "writethrough"
-_supported_cache_modes "writethrough"
+_default_cache_mode writethrough
+_supported_cache_modes writethrough
=20
 size=3D128M
=20
diff --git a/tests/qemu-iotests/052 b/tests/qemu-iotests/052
index 6e2ecbfe21..45a140910d 100755
--- a/tests/qemu-iotests/052
+++ b/tests/qemu-iotests/052
@@ -40,7 +40,7 @@ _supported_fmt generic
 _supported_proto file
=20
 # Don't do O_DIRECT on tmpfs
-_supported_cache_modes "writeback" "writethrough" "unsafe"
+_supported_cache_modes writeback writethrough unsafe
=20
 size=3D128M
 _make_test_img $size
diff --git a/tests/qemu-iotests/091 b/tests/qemu-iotests/091
index d62ef18a02..f4b44659ae 100755
--- a/tests/qemu-iotests/091
+++ b/tests/qemu-iotests/091
@@ -46,8 +46,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
-_default_cache_mode "none"
-_supported_cache_modes "writethrough" "none" "writeback"
+_default_cache_mode none
+_supported_cache_modes writethrough none writeback
=20
 size=3D1G
=20
--=20
2.21.0


