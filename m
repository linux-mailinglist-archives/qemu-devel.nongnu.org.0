Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208AA50545A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 15:03:40 +0200 (CEST)
Received: from localhost ([::1]:60744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngR2Z-0001Id-7W
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 09:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <natalia.kuzmina@openvz.org>)
 id 1ngPDS-0007U7-2f
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 07:06:46 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:33342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <natalia.kuzmina@openvz.org>)
 id 1ngPDL-0005XG-Ro
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 07:06:44 -0400
Received: by mail-lf1-x133.google.com with SMTP id bu29so23706141lfb.0
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 04:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kjSLGqjWh0PuAgWNTDMEuCzgKCJdcagFaDGKk4VwhNY=;
 b=Ki6+ebtwx7j0N7TxMTS2Od9r4S1lACC1h0trYyI/reB1PpKMwlIlEjAn0Hg1sqPQCv
 7ZOnTt60n75b8oefvVrbgLIRblseqLeBqjskQcbxqb5zQhapuEJYw9Wj+bMkbLL2gW66
 kYUSBNL2GG5929t0k9mAl6rLDDc+td/Er3g6G09gBsJsc9di2FNDiDS6mpE80MhqFIR7
 B2rlh/9Ix8feLpIfxLFBFCdz7P5nI1LW0+DNSg7345+i9J1TAKgsM7NtVEws2MsfqV+F
 OaSqDXjITMtLtCVvU1amhMtMxeCuBVNsOZ+VNJB+kNfoBPBk9IIO4FpsR32hEAmTRG4Q
 lWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kjSLGqjWh0PuAgWNTDMEuCzgKCJdcagFaDGKk4VwhNY=;
 b=4vAoSg0mwPIQPMJoNPHOW2x0HD0OQohpVkcqMWDEM7U5j0Fyo1E/2rCjtew5pJz00t
 WOQIjFRA+0E4xsCUy98xcoaSK1UO3ES1lC3QQK7e6ZwWpklAyyWiiNfMkTE3rO46wRJ9
 Qix7mw+ysb+cDXBDNmz0tglZTFjTsItmUu/SKtTEps5B/TiqT05JxR/lg8058qff69bL
 JRjl0h2x+u57vqwyw6/oi5xeCE369WlCZiOLoElk3v8zdtMUHFjaNkC4AQQRvUlCcqJi
 hWoi5CZNkEztsy97/dt3O+SSXMQynrdxlJiaLh8zAJs1tjt0kLkuY361mOpZjeMvLmrU
 cLQQ==
X-Gm-Message-State: AOAM5314tgSpRhr9wJxdI3ovNxMgM7pbP3nkHI7ybXUbvsnlObpIl8z0
 MErpVOIb8Rzeq+R8K376Zj7RdgKx2bEU
X-Google-Smtp-Source: ABdhPJxeCEZbVr7OHrAtKjWktwBEgfomY1TExoDSsU2VaK2f7RVUV2kEz6NlmNI4HwgbJCtd3y4MKg==
X-Received: by 2002:a05:6512:3f04:b0:44a:8de0:15a5 with SMTP id
 y4-20020a0565123f0400b0044a8de015a5mr7688801lfa.278.1650279992594; 
 Mon, 18 Apr 2022 04:06:32 -0700 (PDT)
Received: from localhost.localdomain ([93.175.7.89])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a194315000000b00471083815c8sm580041lfa.168.2022.04.18.04.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 04:06:32 -0700 (PDT)
From: Natalia Kuzmina <natalia.kuzmina@openvz.org>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH 2/3] iotests: 314 test on duplicated clusters (parallels
 format)
Date: Mon, 18 Apr 2022 14:04:29 +0300
Message-Id: <20220418110430.319911-3-natalia.kuzmina@openvz.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418110430.319911-1-natalia.kuzmina@openvz.org>
References: <20220418110430.319911-1-natalia.kuzmina@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=natalia.kuzmina@openvz.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Apr 2022 09:01:08 -0400
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru,
 Natalia Kuzmina <natalia.kuzmina@openvz.org>, hreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reading from duplicated offset and from original offset returns
the same data. After repairing changing either of these
blocks of data does not affect another one.

Signed-off-by: Natalia Kuzmina <natalia.kuzmina@openvz.org>
---
 tests/qemu-iotests/314                        |  88 ++++++++++++++++++
 tests/qemu-iotests/314.out                    |  36 +++++++
 .../parallels-2-duplicated-cluster.bz2        | Bin 0 -> 148 bytes
 3 files changed, 124 insertions(+)
 create mode 100755 tests/qemu-iotests/314
 create mode 100644 tests/qemu-iotests/314.out
 create mode 100644 tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2

diff --git a/tests/qemu-iotests/314 b/tests/qemu-iotests/314
new file mode 100755
index 0000000000..167b75d1af
--- /dev/null
+++ b/tests/qemu-iotests/314
@@ -0,0 +1,88 @@
+#!/usr/bin/env bash
+# group: rw auto quick
+#
+# Test qemu-img check on duplicated clusters
+#
+# Copyright (C) 2009 Red Hat, Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+# creator
+owner=natalia.kuzmina@openvz.org
+
+seq=`basename $0`
+echo "QA output created by $seq"
+
+status=1    # failure is the default!
+
+_cleanup()
+{
+    _cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+. ./common.pattern
+
+_supported_fmt parallels
+_supported_proto file
+_supported_os Linux
+
+echo
+echo "using sample corrupted image"
+echo
+_use_sample_img parallels-2-duplicated-cluster.bz2
+
+CLUSTER_SIZE=65536
+
+#read one cluster from original offset
+$QEMU_IO -c "read -P 0x11 0 $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+#read from duplicated offset (data must be the same as on original offset)
+$QEMU_IO -c "read -P 0x11 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+#change data from original offset
+$QEMU_IO -c "write -P 0x55 0 $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+#read from duplicated offset (data must be the same as on original offset)
+$QEMU_IO -c "read -P 0x55 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+echo
+echo "check and repair the image" 
+echo
+_check_test_img -r all
+echo
+
+#read one cluster from original offset
+$QEMU_IO -c "read -P 0x55 0 $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io 
+#read copied data from new offset
+$QEMU_IO -c "read -P 0x55 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io 
+#change data from original offset
+$QEMU_IO -c "write -P 0x11 0 $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+#read from new offset (fail, now this data was left unchanged)
+$QEMU_IO -c "read -P 0x11 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io 
+    
+echo
+echo
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/314.out b/tests/qemu-iotests/314.out
new file mode 100644
index 0000000000..efb138e6a1
--- /dev/null
+++ b/tests/qemu-iotests/314.out
@@ -0,0 +1,36 @@
+QA output created by 314
+
+using sample corrupted image
+
+read 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 262144
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 262144
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+check and repair the image
+
+Repairing cluster 4 is duplicated (with cluster 0)
+The following inconsistencies were found and repaired:
+
+    0 leaked clusters
+    1 corruptions
+
+Double checking the fixed image now...
+No errors were found on the image.
+
+read 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 262144
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+Pattern verification failed at offset 262144, 65536 bytes
+read 65536/65536 bytes at offset 262144
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+
+*** done
diff --git a/tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2 b/tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2
new file mode 100644
index 0000000000000000000000000000000000000000..ee8f0149b5ecffc4fdc5e2c0cf45b731610378af
GIT binary patch
literal 148
zcmZ>Y%CIzaj8qGboOfsS0tPO%`U`(O5*Pv)I2hO&I2yDPt~od`068263_Exd7-leV
zwiz(^Ft8k0sa3TsBZG0}Vv}35zt?O%VET5A+3Q2o4%bdpm~pLC^&`WR2CW6$VGH;&
vm{u|@;OhXBE0|U>d|v){U)AOQJ)h70iu-<&;S?CYW~db}a<vGU0CEKYoE$uo

literal 0
HcmV?d00001

-- 
2.25.1


