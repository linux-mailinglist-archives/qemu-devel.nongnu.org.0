Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DE8D78FF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 16:46:34 +0200 (CEST)
Received: from localhost ([::1]:47112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKO5k-0000T1-6P
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 10:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36666)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iKNoW-0007ZK-TV
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 10:28:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iKNoT-0000Qo-Cv
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 10:28:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35288)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iKNoM-0000Lh-Mw; Tue, 15 Oct 2019 10:28:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EB7D73090FC6;
 Tue, 15 Oct 2019 14:28:29 +0000 (UTC)
Received: from localhost (ovpn-117-226.ams2.redhat.com [10.36.117.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 982235E1C5;
 Tue, 15 Oct 2019 14:28:28 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 20/21] iotests: Disable data_file where it cannot be used
Date: Tue, 15 Oct 2019 16:27:28 +0200
Message-Id: <20191015142729.18123-21-mreitz@redhat.com>
In-Reply-To: <20191015142729.18123-1-mreitz@redhat.com>
References: <20191015142729.18123-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 15 Oct 2019 14:28:29 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/007 | 5 +++--
 tests/qemu-iotests/014 | 2 ++
 tests/qemu-iotests/015 | 5 +++--
 tests/qemu-iotests/026 | 5 ++++-
 tests/qemu-iotests/029 | 5 +++--
 tests/qemu-iotests/031 | 6 +++---
 tests/qemu-iotests/036 | 5 +++--
 tests/qemu-iotests/039 | 3 +++
 tests/qemu-iotests/046 | 2 ++
 tests/qemu-iotests/048 | 2 ++
 tests/qemu-iotests/051 | 5 +++--
 tests/qemu-iotests/058 | 5 +++--
 tests/qemu-iotests/060 | 6 ++++--
 tests/qemu-iotests/061 | 6 ++++--
 tests/qemu-iotests/062 | 2 +-
 tests/qemu-iotests/066 | 2 +-
 tests/qemu-iotests/067 | 6 ++++--
 tests/qemu-iotests/068 | 5 +++--
 tests/qemu-iotests/071 | 3 +++
 tests/qemu-iotests/073 | 2 ++
 tests/qemu-iotests/074 | 2 ++
 tests/qemu-iotests/080 | 5 +++--
 tests/qemu-iotests/090 | 2 ++
 tests/qemu-iotests/098 | 6 ++++--
 tests/qemu-iotests/099 | 3 ++-
 tests/qemu-iotests/103 | 5 +++--
 tests/qemu-iotests/108 | 6 ++++--
 tests/qemu-iotests/112 | 5 +++--
 tests/qemu-iotests/114 | 2 ++
 tests/qemu-iotests/121 | 3 +++
 tests/qemu-iotests/138 | 2 ++
 tests/qemu-iotests/156 | 2 ++
 tests/qemu-iotests/176 | 7 +++++--
 tests/qemu-iotests/191 | 2 ++
 tests/qemu-iotests/201 | 6 +++---
 tests/qemu-iotests/214 | 3 ++-
 tests/qemu-iotests/217 | 3 ++-
 tests/qemu-iotests/220 | 5 +++--
 tests/qemu-iotests/243 | 6 ++++--
 tests/qemu-iotests/244 | 5 +++--
 tests/qemu-iotests/250 | 2 ++
 tests/qemu-iotests/267 | 5 +++--
 42 files changed, 117 insertions(+), 52 deletions(-)

diff --git a/tests/qemu-iotests/007 b/tests/qemu-iotests/007
index 7d3544b479..160683adf8 100755
--- a/tests/qemu-iotests/007
+++ b/tests/qemu-iotests/007
@@ -41,8 +41,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto generic
 # refcount_bits must be at least 4 so we can create ten internal snapsho=
ts
-# (1 bit supports none, 2 bits support two, 4 bits support 14)
-_unsupported_imgopts 'refcount_bits=3D\(1\|2\)[^0-9]'
+# (1 bit supports none, 2 bits support two, 4 bits support 14);
+# snapshot are generally impossible with external data files
+_unsupported_imgopts 'refcount_bits=3D\(1\|2\)[^0-9]' data_file
=20
 echo
 echo "creating image"
diff --git a/tests/qemu-iotests/014 b/tests/qemu-iotests/014
index 2f728a1956..e1221c0fff 100755
--- a/tests/qemu-iotests/014
+++ b/tests/qemu-iotests/014
@@ -43,6 +43,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
+# Compression and snapshots do not work with external data files
+_unsupported_imgopts data_file
=20
 TEST_OFFSETS=3D"0 4294967296"
 TEST_OPS=3D"writev read write readv"
diff --git a/tests/qemu-iotests/015 b/tests/qemu-iotests/015
index eec5387f3d..4d8effd0ae 100755
--- a/tests/qemu-iotests/015
+++ b/tests/qemu-iotests/015
@@ -40,8 +40,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 # actually any format that supports snapshots
 _supported_fmt qcow2
 _supported_proto generic
-# Internal snapshots are (currently) impossible with refcount_bits=3D1
-_unsupported_imgopts 'refcount_bits=3D1[^0-9]'
+# Internal snapshots are (currently) impossible with refcount_bits=3D1,
+# and generally impossible with external data files
+_unsupported_imgopts 'refcount_bits=3D1[^0-9]' data_file
=20
 echo
 echo "creating image"
diff --git a/tests/qemu-iotests/026 b/tests/qemu-iotests/026
index 3430029ed6..a4aa74764f 100755
--- a/tests/qemu-iotests/026
+++ b/tests/qemu-iotests/026
@@ -49,7 +49,10 @@ _supported_cache_modes writethrough none
 # 32 and 64 bits do not work either, however, due to different leaked cl=
uster
 # count on error.
 # Thus, the only remaining option is refcount_bits=3D16.
-_unsupported_imgopts 'refcount_bits=3D\([^1]\|.\([^6]\|$\)\)'
+#
+# As for data_file, none of the refcount tests can work for it.
+_unsupported_imgopts 'refcount_bits=3D\([^1]\|.\([^6]\|$\)\)' \
+    data_file
=20
 echo "Errors while writing 128 kB"
 echo
diff --git a/tests/qemu-iotests/029 b/tests/qemu-iotests/029
index 9254ede5e5..2161a4b87a 100755
--- a/tests/qemu-iotests/029
+++ b/tests/qemu-iotests/029
@@ -42,8 +42,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto generic
 _unsupported_proto vxhs
-# Internal snapshots are (currently) impossible with refcount_bits=3D1
-_unsupported_imgopts 'refcount_bits=3D1[^0-9]'
+# Internal snapshots are (currently) impossible with refcount_bits=3D1,
+# and generally impossible with external data files
+_unsupported_imgopts 'refcount_bits=3D1[^0-9]' data_file
=20
 offset_size=3D24
 offset_l1_size=3D36
diff --git a/tests/qemu-iotests/031 b/tests/qemu-iotests/031
index c44fcf91bb..646ecd593f 100755
--- a/tests/qemu-iotests/031
+++ b/tests/qemu-iotests/031
@@ -40,9 +40,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 # This tests qcow2-specific low-level functionality
 _supported_fmt qcow2
 _supported_proto file
-# We want to test compat=3D0.10, which does not support refcount widths
-# other than 16
-_unsupported_imgopts 'refcount_bits=3D\([^1]\|.\([^6]\|$\)\)'
+# We want to test compat=3D0.10, which does not support external data
+# files or refcount widths other than 16
+_unsupported_imgopts data_file 'refcount_bits=3D\([^1]\|.\([^6]\|$\)\)'
=20
 CLUSTER_SIZE=3D65536
=20
diff --git a/tests/qemu-iotests/036 b/tests/qemu-iotests/036
index bbaf0ef45b..512598421c 100755
--- a/tests/qemu-iotests/036
+++ b/tests/qemu-iotests/036
@@ -43,8 +43,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 # This tests qcow2-specific low-level functionality
 _supported_fmt qcow2
 _supported_proto file
-# Only qcow2v3 and later supports feature bits
-_unsupported_imgopts 'compat=3D0.10'
+# Only qcow2v3 and later supports feature bits;
+# qcow2.py does not support external data files
+_unsupported_imgopts 'compat=3D0.10' data_file
=20
 echo
 echo =3D=3D=3D Image with unknown incompatible feature bit =3D=3D=3D
diff --git a/tests/qemu-iotests/039 b/tests/qemu-iotests/039
index 99563bf126..ddce48ab47 100755
--- a/tests/qemu-iotests/039
+++ b/tests/qemu-iotests/039
@@ -44,6 +44,9 @@ _supported_proto file
 _supported_os Linux
 _default_cache_mode writethrough
 _supported_cache_modes writethrough
+# Some of these test cases expect no external data file so that all
+# clusters are part of the qcow2 image and refcounted
+_unsupported_imgopts data_file
=20
 size=3D128M
=20
diff --git a/tests/qemu-iotests/046 b/tests/qemu-iotests/046
index 4e03ead7b1..a066eec605 100755
--- a/tests/qemu-iotests/046
+++ b/tests/qemu-iotests/046
@@ -38,6 +38,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
=20
 _supported_fmt qcow2
 _supported_proto file
+# data_file does not support compressed clusters
+_unsupported_imgopts data_file
=20
 CLUSTER_SIZE=3D64k
 size=3D128M
diff --git a/tests/qemu-iotests/048 b/tests/qemu-iotests/048
index a8feb76184..2af6b74b41 100755
--- a/tests/qemu-iotests/048
+++ b/tests/qemu-iotests/048
@@ -49,6 +49,8 @@ _compare()
 _supported_fmt raw qcow2 qed luks
 _supported_proto file
 _supported_os Linux
+# Using 'cp' is incompatible with external data files
+_unsupported_imgopts data_file
=20
 # Remove once all tests are fixed to use TEST_IMG_FILE
 # correctly and common.rc sets it unconditionally
diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index 9cd1d60d45..0053bad46a 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -39,8 +39,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file
 # A compat=3D0.10 image is created in this test which does not support a=
nything
-# other than refcount_bits=3D16
-_unsupported_imgopts 'refcount_bits=3D\([^1]\|.\([^6]\|$\)\)'
+# other than refcount_bits=3D16;
+# it also will not support an external data file
+_unsupported_imgopts 'refcount_bits=3D\([^1]\|.\([^6]\|$\)\)' data_file
=20
 do_run_qemu()
 {
diff --git a/tests/qemu-iotests/058 b/tests/qemu-iotests/058
index ed01115fa3..d5304bb404 100755
--- a/tests/qemu-iotests/058
+++ b/tests/qemu-iotests/058
@@ -56,8 +56,9 @@ _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
 _require_command QEMU_NBD
-# Internal snapshots are (currently) impossible with refcount_bits=3D1
-_unsupported_imgopts 'refcount_bits=3D1[^0-9]'
+# Internal snapshots are (currently) impossible with refcount_bits=3D1,
+# and generally impossible with external data files
+_unsupported_imgopts 'refcount_bits=3D1[^0-9]' data_file
=20
 nbd_snapshot_img=3D"nbd:unix:$nbd_unix_socket"
=20
diff --git a/tests/qemu-iotests/060 b/tests/qemu-iotests/060
index 92243c2edd..8ad0d7a904 100755
--- a/tests/qemu-iotests/060
+++ b/tests/qemu-iotests/060
@@ -48,8 +48,10 @@ _filter_io_error()
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
-# These tests only work for compat=3D1.1 images with refcount_bits=3D16
-_unsupported_imgopts 'compat=3D0.10' 'refcount_bits=3D\([^1]\|.\([^6]\|$=
\)\)'
+# These tests only work for compat=3D1.1 images without an external
+# data file with refcount_bits=3D16
+_unsupported_imgopts 'compat=3D0.10' data_file \
+    'refcount_bits=3D\([^1]\|.\([^6]\|$\)\)'
=20
 rt_offset=3D65536  # 0x10000 (XXX: just an assumption)
 rb_offset=3D131072 # 0x20000 (XXX: just an assumption)
diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
index b4076d8e8b..4e218798d8 100755
--- a/tests/qemu-iotests/061
+++ b/tests/qemu-iotests/061
@@ -42,8 +42,10 @@ _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
 # Conversion between different compat versions can only really work
-# with refcount_bits=3D16
-_unsupported_imgopts 'refcount_bits=3D\([^1]\|.\([^6]\|$\)\)'
+# with refcount_bits=3D16;
+# we have explicit tests for data_file here, but the whole test does
+# not work with it
+_unsupported_imgopts 'refcount_bits=3D\([^1]\|.\([^6]\|$\)\)' data_file
=20
 echo
 echo "=3D=3D=3D Testing version downgrade with zero expansion =3D=3D=3D"
diff --git a/tests/qemu-iotests/062 b/tests/qemu-iotests/062
index ac0d2a9a3b..68e52a6402 100755
--- a/tests/qemu-iotests/062
+++ b/tests/qemu-iotests/062
@@ -41,7 +41,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto generic
 # We need zero clusters and snapshots
-_unsupported_imgopts 'compat=3D0.10' 'refcount_bits=3D1[^0-9]'
+_unsupported_imgopts 'compat=3D0.10' 'refcount_bits=3D1[^0-9]' data_file
=20
 IMG_SIZE=3D64M
=20
diff --git a/tests/qemu-iotests/066 b/tests/qemu-iotests/066
index 00eb80d89e..0fff3e3a52 100755
--- a/tests/qemu-iotests/066
+++ b/tests/qemu-iotests/066
@@ -40,7 +40,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto generic
 # We need zero clusters and snapshots
-_unsupported_imgopts 'compat=3D0.10' 'refcount_bits=3D1[^0-9]'
+_unsupported_imgopts 'compat=3D0.10' 'refcount_bits=3D1[^0-9]' data_file
=20
 # Intentionally create an unaligned image
 IMG_SIZE=3D$((64 * 1024 * 1024 + 512))
diff --git a/tests/qemu-iotests/067 b/tests/qemu-iotests/067
index 926c79b37c..3bc6e719eb 100755
--- a/tests/qemu-iotests/067
+++ b/tests/qemu-iotests/067
@@ -32,8 +32,10 @@ status=3D1	# failure is the default!
=20
 _supported_fmt qcow2
 _supported_proto file
-# Because anything other than 16 would change the output of query-block
-_unsupported_imgopts 'refcount_bits=3D\([^1]\|.\([^6]\|$\)\)'
+# Because anything other than 16 would change the output of query-block,
+# and external data files would change the output of
+# query-named-block-ndoes
+_unsupported_imgopts 'refcount_bits=3D\([^1]\|.\([^6]\|$\)\)' data_file
=20
 do_run_qemu()
 {
diff --git a/tests/qemu-iotests/068 b/tests/qemu-iotests/068
index 65650fca9a..c8748f5b02 100755
--- a/tests/qemu-iotests/068
+++ b/tests/qemu-iotests/068
@@ -39,8 +39,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 # This tests qocw2-specific low-level functionality
 _supported_fmt qcow2
 _supported_proto generic
-# Internal snapshots are (currently) impossible with refcount_bits=3D1
-_unsupported_imgopts 'compat=3D0.10' 'refcount_bits=3D1[^0-9]'
+# Internal snapshots are (currently) impossible with refcount_bits=3D1,
+# and generally impossible with external data files
+_unsupported_imgopts 'compat=3D0.10' 'refcount_bits=3D1[^0-9]' data_file
=20
 IMG_SIZE=3D128K
=20
diff --git a/tests/qemu-iotests/071 b/tests/qemu-iotests/071
index 4e31943244..88faebcc1d 100755
--- a/tests/qemu-iotests/071
+++ b/tests/qemu-iotests/071
@@ -39,6 +39,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file
 _require_drivers blkdebug blkverify
+# blkdebug can only inject errors on bs->file, not on the data_file,
+# so thie test does not work with external data files
+_unsupported_imgopts data_file
=20
 do_run_qemu()
 {
diff --git a/tests/qemu-iotests/073 b/tests/qemu-iotests/073
index e684b1b780..903dc9c9ab 100755
--- a/tests/qemu-iotests/073
+++ b/tests/qemu-iotests/073
@@ -39,6 +39,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto generic
 _unsupported_proto vxhs
+# External data files do not support compressed clusters
+_unsupported_imgopts data_file
=20
 CLUSTER_SIZE=3D64k
 size=3D128M
diff --git a/tests/qemu-iotests/074 b/tests/qemu-iotests/074
index 62be89a0d9..db03edf0b0 100755
--- a/tests/qemu-iotests/074
+++ b/tests/qemu-iotests/074
@@ -50,6 +50,8 @@ _compare()
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
+# blkdebug can only inject errors on bs->file
+_unsupported_imgopts data_file
=20
 # Setup test basic parameters
 TEST_IMG2=3D$TEST_IMG.2
diff --git a/tests/qemu-iotests/080 b/tests/qemu-iotests/080
index b1ecafb41e..a3d13c414e 100755
--- a/tests/qemu-iotests/080
+++ b/tests/qemu-iotests/080
@@ -40,9 +40,10 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
-# - Internal snapshots are (currently) impossible with refcount_bits=3D1
+# - Internal snapshots are (currently) impossible with refcount_bits=3D1=
,
+#   and generally impossible with external data files
 # - This is generally a test for compat=3D1.1 images
-_unsupported_imgopts 'refcount_bits=3D1[^0-9]' 'compat=3D0.10'
+_unsupported_imgopts 'refcount_bits=3D1[^0-9]' data_file 'compat=3D0.10'
=20
 header_size=3D104
=20
diff --git a/tests/qemu-iotests/090 b/tests/qemu-iotests/090
index 9f8cfbb80f..1246e4f910 100755
--- a/tests/qemu-iotests/090
+++ b/tests/qemu-iotests/090
@@ -38,6 +38,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
=20
 _supported_fmt qcow2
 _supported_proto file nfs
+# External data files do not support compressed clusters
+_unsupported_imgopts data_file
=20
 IMG_SIZE=3D128K
=20
diff --git a/tests/qemu-iotests/098 b/tests/qemu-iotests/098
index 700068b328..1e29d96b3d 100755
--- a/tests/qemu-iotests/098
+++ b/tests/qemu-iotests/098
@@ -40,8 +40,10 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
=20
 _supported_fmt qcow2
 _supported_proto file
-# The code path we want to test here only works for compat=3D1.1 images
-_unsupported_imgopts 'compat=3D0.10'
+# The code path we want to test here only works for compat=3D1.1 images;
+# blkdebug can only inject errors on bs->file, so external data files
+# do not work with this test
+_unsupported_imgopts 'compat=3D0.10' data_file
=20
 for event in l1_update empty_image_prepare reftable_update refblock_allo=
c; do
=20
diff --git a/tests/qemu-iotests/099 b/tests/qemu-iotests/099
index b383c11e6a..65e8e92572 100755
--- a/tests/qemu-iotests/099
+++ b/tests/qemu-iotests/099
@@ -46,8 +46,9 @@ _supported_fmt qcow qcow2 qed vdi vhdx vmdk vpc
 _supported_proto file
 _supported_os Linux
 _require_drivers blkdebug blkverify
+# data_file would change the json:{} filenames
 _unsupported_imgopts "subformat=3DmonolithicFlat" "subformat=3DtwoGbMaxE=
xtentFlat" \
-    "subformat=3DtwoGbMaxExtentSparse"
+    "subformat=3DtwoGbMaxExtentSparse" data_file
=20
 do_run_qemu()
 {
diff --git a/tests/qemu-iotests/103 b/tests/qemu-iotests/103
index 554b9de054..8c1ebe0443 100755
--- a/tests/qemu-iotests/103
+++ b/tests/qemu-iotests/103
@@ -38,8 +38,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
=20
 _supported_fmt qcow2
 _supported_proto file nfs
-# Internal snapshots are (currently) impossible with refcount_bits=3D1
-_unsupported_imgopts 'refcount_bits=3D1[^0-9]'
+# Internal snapshots are (currently) impossible with refcount_bits=3D1,
+# and generally impossible with external data files
+_unsupported_imgopts 'refcount_bits=3D1[^0-9]' data_file
=20
 IMG_SIZE=3D64K
=20
diff --git a/tests/qemu-iotests/108 b/tests/qemu-iotests/108
index b0a6ae597b..6bbeb4f996 100755
--- a/tests/qemu-iotests/108
+++ b/tests/qemu-iotests/108
@@ -41,8 +41,10 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
-# This test directly modifies a refblock so it relies on refcount_bits b=
eing 16
-_unsupported_imgopts 'refcount_bits=3D\([^1]\|.\([^6]\|$\)\)'
+# This test directly modifies a refblock so it relies on refcount_bits b=
eing 16;
+# and the low-level modification it performs are not tuned for external =
data
+# files
+_unsupported_imgopts 'refcount_bits=3D\([^1]\|.\([^6]\|$\)\)' data_file
=20
 echo
 echo '=3D=3D=3D Repairing an image without any refcount table =3D=3D=3D'
diff --git a/tests/qemu-iotests/112 b/tests/qemu-iotests/112
index 6850225939..20ff5c224a 100755
--- a/tests/qemu-iotests/112
+++ b/tests/qemu-iotests/112
@@ -40,8 +40,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file
 # This test will set refcount_bits on its own which would conflict with =
the
-# manual setting; compat will be overridden as well
-_unsupported_imgopts refcount_bits 'compat=3D0.10'
+# manual setting; compat will be overridden as well;
+# and external data files do not work well with our refcount testing
+_unsupported_imgopts refcount_bits 'compat=3D0.10' data_file
=20
 print_refcount_bits()
 {
diff --git a/tests/qemu-iotests/114 b/tests/qemu-iotests/114
index f90a744fc0..26104fff6c 100755
--- a/tests/qemu-iotests/114
+++ b/tests/qemu-iotests/114
@@ -39,6 +39,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto generic
 _unsupported_proto vxhs
+# qcow2.py does not work too well with external data files
+_unsupported_imgopts data_file
=20
=20
 TEST_IMG=3D"$TEST_IMG.base" _make_test_img 64M
diff --git a/tests/qemu-iotests/121 b/tests/qemu-iotests/121
index 10db813d94..90ea0db737 100755
--- a/tests/qemu-iotests/121
+++ b/tests/qemu-iotests/121
@@ -39,6 +39,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
+# Refcount structures are used much differently with external data
+# files
+_unsupported_imgopts data_file
=20
 echo
 echo '=3D=3D=3D New refcount structures may not conflict with existing s=
tructures =3D=3D=3D'
diff --git a/tests/qemu-iotests/138 b/tests/qemu-iotests/138
index 66ae9d5e78..7b0bc62a74 100755
--- a/tests/qemu-iotests/138
+++ b/tests/qemu-iotests/138
@@ -40,6 +40,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
+# These refcount calculations do not work with external data files
+_unsupported_imgopts data_file
=20
 echo
 echo '=3D=3D=3D Check on an image with a multiple of 2^32 clusters =3D=3D=
=3D'
diff --git a/tests/qemu-iotests/156 b/tests/qemu-iotests/156
index 3f27db71f2..5559df63a5 100755
--- a/tests/qemu-iotests/156
+++ b/tests/qemu-iotests/156
@@ -51,6 +51,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2 qed
 _supported_proto generic
 _unsupported_proto vxhs
+# Copying files around with cp does not work with external data files
+_unsupported_imgopts data_file
=20
 # Create source disk
 TEST_IMG=3D"$TEST_IMG.backing" _make_test_img 1M
diff --git a/tests/qemu-iotests/176 b/tests/qemu-iotests/176
index 50df4c00fa..117c8b6954 100755
--- a/tests/qemu-iotests/176
+++ b/tests/qemu-iotests/176
@@ -47,8 +47,11 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
-# Persistent dirty bitmaps require compat=3D1.1
-_unsupported_imgopts 'compat=3D0.10'
+# Persistent dirty bitmaps require compat=3D1.1;
+# Internal snapshots forbid using an external data file
+# (they work with refcount_bits=3D1 here, though, because there actually
+# is no data when creating the snapshot)
+_unsupported_imgopts 'compat=3D0.10' data_file
=20
 run_qemu()
 {
diff --git a/tests/qemu-iotests/191 b/tests/qemu-iotests/191
index 23ab0ce899..b05db68141 100755
--- a/tests/qemu-iotests/191
+++ b/tests/qemu-iotests/191
@@ -43,6 +43,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
=20
 _supported_fmt qcow2
 _supported_proto file
+# An external data file would change the query-named-block-nodes output
+_unsupported_imgopts data_file
=20
 size=3D64M
=20
diff --git a/tests/qemu-iotests/201 b/tests/qemu-iotests/201
index 7abf740fe4..3a458f18a0 100755
--- a/tests/qemu-iotests/201
+++ b/tests/qemu-iotests/201
@@ -43,9 +43,9 @@ _supported_fmt qcow2
 _supported_proto generic
 _supported_os Linux
=20
-# Internal snapshots are (currently) impossible with refcount_bits=3D1
-# This was taken from test 080
-_unsupported_imgopts 'refcount_bits=3D1[^0-9]'
+# Internal snapshots are (currently) impossible with refcount_bits=3D1,
+# and generally impossible with external data files
+_unsupported_imgopts 'refcount_bits=3D1[^0-9]' data_file
=20
 size=3D64M
 _make_test_img $size
diff --git a/tests/qemu-iotests/214 b/tests/qemu-iotests/214
index 21ec8a2ad8..0f2e61280a 100755
--- a/tests/qemu-iotests/214
+++ b/tests/qemu-iotests/214
@@ -39,7 +39,8 @@ _supported_proto file
=20
 # Repairing the corrupted image requires qemu-img check to store a
 # refcount up to 3, which requires at least two refcount bits.
-_unsupported_imgopts 'refcount_bits=3D1[^0-9]'
+# External data files do not support compressed clusters.
+_unsupported_imgopts 'refcount_bits=3D1[^0-9]' data_file
=20
=20
 echo
diff --git a/tests/qemu-iotests/217 b/tests/qemu-iotests/217
index 58a78a6098..d89116ccad 100755
--- a/tests/qemu-iotests/217
+++ b/tests/qemu-iotests/217
@@ -40,7 +40,8 @@ _supported_proto file
=20
 # This test needs clusters with at least a refcount of 2 so that
 # OFLAG_COPIED is not set.  refcount_bits=3D1 is therefore unsupported.
-_unsupported_imgopts 'refcount_bits=3D1[^0-9]'
+# (As are external data files.)
+_unsupported_imgopts 'refcount_bits=3D1[^0-9]' data_file
=20
 echo
 echo '=3D=3D=3D Simulating an I/O error during snapshot deletion =3D=3D=3D=
'
diff --git a/tests/qemu-iotests/220 b/tests/qemu-iotests/220
index 3769f372cb..a88c59152b 100755
--- a/tests/qemu-iotests/220
+++ b/tests/qemu-iotests/220
@@ -37,8 +37,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
-# To use a different refcount width but 16 bits we need compat=3D1.1
-_unsupported_imgopts 'compat=3D0.10'
+# To use a different refcount width but 16 bits we need compat=3D1.1,
+# and external data files do not support compressed clusters.
+_unsupported_imgopts 'compat=3D0.10' data_file
=20
 echo "=3D=3D Creating huge file =3D=3D"
=20
diff --git a/tests/qemu-iotests/243 b/tests/qemu-iotests/243
index 3dc3b6a711..a61852f6d9 100755
--- a/tests/qemu-iotests/243
+++ b/tests/qemu-iotests/243
@@ -40,8 +40,10 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
-# External data files do not work with compat=3D0.10
-_unsupported_imgopts 'compat=3D0.10'
+# External data files do not work with compat=3D0.10, and because there
+# is an explicit case for external data files here, we cannot allow
+# the user to specify whether to use one
+_unsupported_imgopts 'compat=3D0.10' data_file
=20
 for mode in off metadata falloc full; do
=20
diff --git a/tests/qemu-iotests/244 b/tests/qemu-iotests/244
index 13263292b0..0d1efee6ef 100755
--- a/tests/qemu-iotests/244
+++ b/tests/qemu-iotests/244
@@ -41,8 +41,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
-# External data files do not work with compat=3D0.10
-_unsupported_imgopts 'compat=3D0.10'
+# External data files do not work with compat=3D0.10, and because we use
+# our own external data file, we cannot let the user specify one
+_unsupported_imgopts 'compat=3D0.10' data_file
=20
 echo
 echo "=3D=3D=3D Create and open image with external data file =3D=3D=3D"
diff --git a/tests/qemu-iotests/250 b/tests/qemu-iotests/250
index 670cf19076..9bb6b94d74 100755
--- a/tests/qemu-iotests/250
+++ b/tests/qemu-iotests/250
@@ -39,6 +39,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
+# This test does not make much sense with external data files
+_unsupported_imgopts data_file
=20
 # This test checks that qcow2_process_discards does not truncate a disca=
rd
 # request > 2G.
diff --git a/tests/qemu-iotests/267 b/tests/qemu-iotests/267
index eda45449d4..d2f0e5df59 100755
--- a/tests/qemu-iotests/267
+++ b/tests/qemu-iotests/267
@@ -41,8 +41,9 @@ _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
=20
-# Internal snapshots are (currently) impossible with refcount_bits=3D1
-_unsupported_imgopts 'refcount_bits=3D1[^0-9]'
+# Internal snapshots are (currently) impossible with refcount_bits=3D1,
+# and generally impossible with external data files
+_unsupported_imgopts 'refcount_bits=3D1[^0-9]' data_file
=20
 do_run_qemu()
 {
--=20
2.21.0


