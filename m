Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A44131478
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 16:09:03 +0100 (CET)
Received: from localhost ([::1]:53160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioU06-0004y2-7M
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 10:09:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43879)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ioTbG-0006mg-9h
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:43:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ioTbF-0000Wg-0V
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:43:22 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57544
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ioTbE-0000Vh-S3
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:43:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578321800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAprYsSNKNWg+RLPE+Omr/EUEUPxWmJvi1bSvNCB3/8=;
 b=HCR0XwBrNiG2MiL38Wg/FjeYNNGy/DgIQml3Um7EWGtiBrd8IeF6EQh7RNVYqpL7MU7+/u
 oAT69F+nT+QDNhtUZgWneIdhKkMvQkQD3mEX2BpiS5QhQR5E8KEiNuFe6hnXCaNacqVIdc
 6+A8I1w7IzDRXEch8vx+VbSG1zDjOcc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-MG5gnB3gNA2MwQN6JcMdGQ-1; Mon, 06 Jan 2020 09:43:14 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1938E1089E03;
 Mon,  6 Jan 2020 14:43:13 +0000 (UTC)
Received: from localhost (ovpn-117-91.ams2.redhat.com [10.36.117.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B22E2100164D;
 Mon,  6 Jan 2020 14:43:12 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 19/34] iotests: Replace IMGOPTS='' by --no-opts
Date: Mon,  6 Jan 2020 15:41:51 +0100
Message-Id: <20200106144206.698920-20-mreitz@redhat.com>
In-Reply-To: <20200106144206.698920-1-mreitz@redhat.com>
References: <20200106144206.698920-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: MG5gnB3gNA2MwQN6JcMdGQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Message-id: 20191107163708.833192-13-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/071 | 4 ++--
 tests/qemu-iotests/174 | 2 +-
 tests/qemu-iotests/178 | 4 ++--
 tests/qemu-iotests/197 | 4 ++--
 tests/qemu-iotests/215 | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/071 b/tests/qemu-iotests/071
index fab526666b..4e31943244 100755
--- a/tests/qemu-iotests/071
+++ b/tests/qemu-iotests/071
@@ -58,7 +58,7 @@ echo
 echo "=3D=3D=3D Testing blkverify through filename =3D=3D=3D"
 echo
=20
-TEST_IMG=3D"$TEST_IMG.base" IMGOPTS=3D"" IMGFMT=3D"raw" _make_test_img $IM=
G_SIZE |\
+TEST_IMG=3D"$TEST_IMG.base" IMGFMT=3D"raw" _make_test_img --no-opts $IMG_S=
IZE |\
     _filter_imgfmt
 _make_test_img $IMG_SIZE
 $QEMU_IO -c "open -o driver=3Draw,file.driver=3Dblkverify,file.raw.filenam=
e=3D$TEST_IMG.base $TEST_IMG" \
@@ -73,7 +73,7 @@ echo
 echo "=3D=3D=3D Testing blkverify through file blockref =3D=3D=3D"
 echo
=20
-TEST_IMG=3D"$TEST_IMG.base" IMGOPTS=3D"" IMGFMT=3D"raw" _make_test_img $IM=
G_SIZE |\
+TEST_IMG=3D"$TEST_IMG.base" IMGFMT=3D"raw" _make_test_img --no-opts $IMG_S=
IZE |\
     _filter_imgfmt
 _make_test_img $IMG_SIZE
 $QEMU_IO -c "open -o driver=3Draw,file.driver=3Dblkverify,file.raw.filenam=
e=3D$TEST_IMG.base,file.test.driver=3D$IMGFMT,file.test.file.filename=3D$TE=
ST_IMG" \
diff --git a/tests/qemu-iotests/174 b/tests/qemu-iotests/174
index 0a952a73fd..e2f14a38c6 100755
--- a/tests/qemu-iotests/174
+++ b/tests/qemu-iotests/174
@@ -40,7 +40,7 @@ _unsupported_fmt raw
=20
=20
 size=3D256K
-IMGFMT=3Draw IMGKEYSECRET=3D IMGOPTS=3D _make_test_img $size | _filter_img=
fmt
+IMGFMT=3Draw IMGKEYSECRET=3D _make_test_img --no-opts $size | _filter_imgf=
mt
=20
 echo
 echo "=3D=3D reading wrong format should fail =3D=3D"
diff --git a/tests/qemu-iotests/178 b/tests/qemu-iotests/178
index 21231cadd3..75b5e8f314 100755
--- a/tests/qemu-iotests/178
+++ b/tests/qemu-iotests/178
@@ -62,8 +62,8 @@ $QEMU_IMG measure -O foo "$TEST_IMG" # unknown image file=
 format
=20
 make_test_img_with_fmt() {
     # Shadow global variables within this function
-    local IMGFMT=3D"$1" IMGOPTS=3D""
-    _make_test_img "$2"
+    local IMGFMT=3D"$1"
+    _make_test_img --no-opts "$2"
 }
=20
 qemu_io_with_fmt() {
diff --git a/tests/qemu-iotests/197 b/tests/qemu-iotests/197
index 1d4f6786db..4d3d08ad6f 100755
--- a/tests/qemu-iotests/197
+++ b/tests/qemu-iotests/197
@@ -66,8 +66,8 @@ if [ "$IMGFMT" =3D "vpc" ]; then
 fi
 _make_test_img 4G
 $QEMU_IO -c "write -P 55 3G 1k" "$TEST_IMG" | _filter_qemu_io
-IMGPROTO=3Dfile IMGFMT=3Dqcow2 IMGOPTS=3D TEST_IMG_FILE=3D"$TEST_WRAP" \
-    _make_test_img -F "$IMGFMT" -b "$TEST_IMG" | _filter_img_create
+IMGPROTO=3Dfile IMGFMT=3Dqcow2 TEST_IMG_FILE=3D"$TEST_WRAP" \
+    _make_test_img --no-opts -F "$IMGFMT" -b "$TEST_IMG" | _filter_img_cre=
ate
 $QEMU_IO -f qcow2 -c "write -z -u 1M 64k" "$TEST_WRAP" | _filter_qemu_io
=20
 # Ensure that a read of two clusters, but where one is already allocated,
diff --git a/tests/qemu-iotests/215 b/tests/qemu-iotests/215
index 2eb377d682..55a1874dcd 100755
--- a/tests/qemu-iotests/215
+++ b/tests/qemu-iotests/215
@@ -63,8 +63,8 @@ if [ "$IMGFMT" =3D "vpc" ]; then
 fi
 _make_test_img 4G
 $QEMU_IO -c "write -P 55 3G 1k" "$TEST_IMG" | _filter_qemu_io
-IMGPROTO=3Dfile IMGFMT=3Dqcow2 IMGOPTS=3D TEST_IMG_FILE=3D"$TEST_WRAP" \
-    _make_test_img -F "$IMGFMT" -b "$TEST_IMG" | _filter_img_create
+IMGPROTO=3Dfile IMGFMT=3Dqcow2 TEST_IMG_FILE=3D"$TEST_WRAP" \
+    _make_test_img --no-opts -F "$IMGFMT" -b "$TEST_IMG" | _filter_img_cre=
ate
 $QEMU_IO -f qcow2 -c "write -z -u 1M 64k" "$TEST_WRAP" | _filter_qemu_io
=20
 # Ensure that a read of two clusters, but where one is already allocated,
--=20
2.24.1


