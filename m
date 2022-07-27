Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064D5583395
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 21:29:44 +0200 (CEST)
Received: from localhost ([::1]:50366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGmj1-0004l9-2M
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 15:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGmNH-0008DN-Av; Wed, 27 Jul 2022 15:07:15 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:46374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGmNE-000527-7j; Wed, 27 Jul 2022 15:07:14 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 6766E2E20FA;
 Wed, 27 Jul 2022 22:07:03 +0300 (MSK)
Received: from localhost.localdomain (172.31.41.131-vpn.dhcp.yndx.net
 [172.31.41.131])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 lEd3EUqO2s-72OO50p5; Wed, 27 Jul 2022 22:07:02 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658948822; bh=jDJaFix2iJm+jPuI7aRxvWc8zDl/yn66dHKdXW9ez5k=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=DtbPHTQugVDr5v95smb63oX6PPyI/Cm5w2mTMZJRpQjRShsx7+UokE9JukbfSgZqa
 ms88Y98auOjQZPtNApLs06wu2WD/Fin9E3cwHbXrz0CIe5gb1bz7EGV9GJJccIwB9H
 btkJC6I8vfv2681BRQxp9m4ieVb74CVBVNdIAQkc=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@yandex-team.ru, den@openvz.org,
 stefanha@redhat.com
Subject: [PULL 2/2] iotests/131: Add parallels regression test
Date: Wed, 27 Jul 2022 22:06:35 +0300
Message-Id: <20220727190635.1024863-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727190635.1024863-1-vsementsov@yandex-team.ru>
References: <20220727190635.1024863-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

Test an allocating write to a parallels image that has a backing node.
Before HEAD^, doing so used to give me a failed assertion (when the
backing node contains only `42` bytes; the results varies with the value
chosen, for `0` bytes, for example, all I get is EIO).

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20220714132801.72464-3-hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 tests/qemu-iotests/131     | 35 ++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/131.out | 13 +++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/131 b/tests/qemu-iotests/131
index d7456cae5b..a847692b4c 100755
--- a/tests/qemu-iotests/131
+++ b/tests/qemu-iotests/131
@@ -43,7 +43,7 @@ _supported_os Linux
 
 inuse_offset=$((0x2c))
 
-size=64M
+size=$((64 * 1024 * 1024))
 CLUSTER_SIZE=64k
 IMGFMT=parallels
 _make_test_img $size
@@ -70,6 +70,39 @@ _check_test_img
 _check_test_img -r all
 { $QEMU_IO -c "read -P 0x11 64k 64k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 
+echo "== allocate with backing =="
+# Verify that allocating clusters works fine even when there is a backing image.
+# Regression test for a bug where we would pass a buffer read from the backing
+# node as a QEMUIOVector object, which could cause anything from I/O errors over
+# assertion failures to invalid reads from memory.
+
+# Clear image
+_make_test_img $size
+# Create base image
+TEST_IMG="$TEST_IMG.base" _make_test_img $size
+
+# Write some data to the base image (which would trigger an assertion failure if
+# interpreted as a QEMUIOVector)
+$QEMU_IO -c 'write -P 42 0 64k' "$TEST_IMG.base" | _filter_qemu_io
+
+# Parallels does not seem to support storing a backing filename in the image
+# itself, so we need to build our backing chain on the command line
+imgopts="driver=$IMGFMT,file.driver=$IMGPROTO,file.filename=$TEST_IMG"
+imgopts+=",backing.driver=$IMGFMT"
+imgopts+=",backing.file.driver=$IMGPROTO,backing.file.filename=$TEST_IMG.base"
+
+# Cause allocation in the top image
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT \
+    $QEMU_IO --image-opts "$imgopts" -c 'write -P 1 0 64' | _filter_qemu_io
+
+# Verify
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT \
+    $QEMU_IO --image-opts "$imgopts" \
+    -c 'read -P 1 0 64' \
+    -c "read -P 42 64 $((64 * 1024 - 64))" \
+    -c "read -P 0 64k $((size - 64 * 1024))" \
+    | _filter_qemu_io
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/131.out b/tests/qemu-iotests/131.out
index 70da03dee5..de5ef7a8f5 100644
--- a/tests/qemu-iotests/131.out
+++ b/tests/qemu-iotests/131.out
@@ -37,4 +37,17 @@ Double checking the fixed image now...
 No errors were found on the image.
 read 65536/65536 bytes at offset 65536
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== allocate with backing ==
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 64/64 bytes at offset 0
+64 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 64/64 bytes at offset 0
+64 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65472/65472 bytes at offset 64
+63.938 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 67043328/67043328 bytes at offset 65536
+63.938 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 *** done
-- 
2.25.1


