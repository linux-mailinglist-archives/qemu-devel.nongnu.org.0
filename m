Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DF9203A72
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 17:15:02 +0200 (CEST)
Received: from localhost ([::1]:59898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnOA1-0005hW-Hk
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 11:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jnO6r-0000Kd-Vy
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 11:11:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38808
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jnO6p-000616-Ox
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 11:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592838702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfkMTw3gf8IVjYDyvCljQ1qYksnvvnYbFOXo27YLMdU=;
 b=Jvly9iLxZM+1eqqHZ+Dhx6a/YoZc9/NFIcVMUjTy5K3lxpEss72DDIwe3m/gxXgHoLgSbU
 baZIZq3SGKT6a/ydlPkORhj9CxbYbJzKwGi0LDMdErW4Az8eB1ACXtWMCMO9fmtU2d8npd
 S4a1u2tG4/gixkfjufaVYE4nFnPj4B8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-r00M66XJPDyZPSEDMFRsTg-1; Mon, 22 Jun 2020 11:11:06 -0400
X-MC-Unique: r00M66XJPDyZPSEDMFRsTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6D5088EA20;
 Mon, 22 Jun 2020 15:11:05 +0000 (UTC)
Received: from localhost (ovpn-114-85.ams2.redhat.com [10.36.114.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3673E10013D7;
 Mon, 22 Jun 2020 15:11:05 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/18] iotests: filter few more luks specific create options
Date: Mon, 22 Jun 2020 17:10:43 +0200
Message-Id: <20200622151059.921191-3-mreitz@redhat.com>
In-Reply-To: <20200622151059.921191-1-mreitz@redhat.com>
References: <20200622151059.921191-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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

From: Maxim Levitsky <mlevitsk@redhat.com>

This allows more tests to be able to have same output on both qcow2 luks encrypted images
and raw luks images

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Message-Id: <20200618150628.2169239-3-mreitz@redhat.com>
---
 tests/qemu-iotests/087.out       | 6 +++---
 tests/qemu-iotests/134.out       | 2 +-
 tests/qemu-iotests/158.out       | 4 ++--
 tests/qemu-iotests/188.out       | 2 +-
 tests/qemu-iotests/189.out       | 4 ++--
 tests/qemu-iotests/198.out       | 4 ++--
 tests/qemu-iotests/263.out       | 4 ++--
 tests/qemu-iotests/284.out       | 6 +++---
 tests/qemu-iotests/common.filter | 5 +----
 9 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/tests/qemu-iotests/087.out b/tests/qemu-iotests/087.out
index 2d92ea847b..b61ba638af 100644
--- a/tests/qemu-iotests/087.out
+++ b/tests/qemu-iotests/087.out
@@ -34,7 +34,7 @@ QMP_VERSION
 
 === Encrypted image QCow ===
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 encryption=on encrypt.key-secret=sec0
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 encryption=on
 Testing:
 QMP_VERSION
 {"return": {}}
@@ -46,7 +46,7 @@ QMP_VERSION
 
 === Encrypted image LUKS ===
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 encrypt.format=luks encrypt.key-secret=sec0
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
 Testing:
 QMP_VERSION
 {"return": {}}
@@ -58,7 +58,7 @@ QMP_VERSION
 
 === Missing driver ===
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 encryption=on encrypt.key-secret=sec0
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 encryption=on
 Testing: -S
 QMP_VERSION
 {"return": {}}
diff --git a/tests/qemu-iotests/134.out b/tests/qemu-iotests/134.out
index 09d46f6b17..4abc5b5f7d 100644
--- a/tests/qemu-iotests/134.out
+++ b/tests/qemu-iotests/134.out
@@ -1,5 +1,5 @@
 QA output created by 134
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 encryption=on encrypt.key-secret=sec0
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 encryption=on
 
 == reading whole image ==
 read 134217728/134217728 bytes at offset 0
diff --git a/tests/qemu-iotests/158.out b/tests/qemu-iotests/158.out
index 6def216e55..f28a17626b 100644
--- a/tests/qemu-iotests/158.out
+++ b/tests/qemu-iotests/158.out
@@ -1,6 +1,6 @@
 QA output created by 158
 == create base ==
-Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728 encryption=on encrypt.key-secret=sec0
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728 encryption=on
 
 == writing whole image ==
 wrote 134217728/134217728 bytes at offset 0
@@ -10,7 +10,7 @@ wrote 134217728/134217728 bytes at offset 0
 read 134217728/134217728 bytes at offset 0
 128 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 == create overlay ==
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/t.IMGFMT.base encryption=on encrypt.key-secret=sec0
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/t.IMGFMT.base encryption=on
 
 == writing part of a cluster ==
 wrote 1024/1024 bytes at offset 0
diff --git a/tests/qemu-iotests/188.out b/tests/qemu-iotests/188.out
index c568ef3701..5426861b18 100644
--- a/tests/qemu-iotests/188.out
+++ b/tests/qemu-iotests/188.out
@@ -1,5 +1,5 @@
 QA output created by 188
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=16777216 encrypt.format=luks encrypt.key-secret=sec0 encrypt.iter-time=10
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=16777216
 
 == reading whole image ==
 read 16777216/16777216 bytes at offset 0
diff --git a/tests/qemu-iotests/189.out b/tests/qemu-iotests/189.out
index a0b7c9c24c..bc213cbe14 100644
--- a/tests/qemu-iotests/189.out
+++ b/tests/qemu-iotests/189.out
@@ -1,6 +1,6 @@
 QA output created by 189
 == create base ==
-Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=16777216 encrypt.format=luks encrypt.key-secret=sec0 encrypt.iter-time=10
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=16777216
 
 == writing whole image ==
 wrote 16777216/16777216 bytes at offset 0
@@ -10,7 +10,7 @@ wrote 16777216/16777216 bytes at offset 0
 read 16777216/16777216 bytes at offset 0
 16 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 == create overlay ==
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=16777216 backing_file=TEST_DIR/t.IMGFMT.base encrypt.format=luks encrypt.key-secret=sec1 encrypt.iter-time=10
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=16777216 backing_file=TEST_DIR/t.IMGFMT.base
 
 == writing part of a cluster ==
 wrote 1024/1024 bytes at offset 0
diff --git a/tests/qemu-iotests/198.out b/tests/qemu-iotests/198.out
index 6280ae6eed..4b800e70db 100644
--- a/tests/qemu-iotests/198.out
+++ b/tests/qemu-iotests/198.out
@@ -1,12 +1,12 @@
 QA output created by 198
 == create base ==
-Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=16777216 encrypt.format=luks encrypt.key-secret=sec0 encrypt.iter-time=10
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=16777216
 
 == writing whole image base ==
 wrote 16777216/16777216 bytes at offset 0
 16 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 == create overlay ==
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=16777216 backing_file=TEST_DIR/t.IMGFMT.base encrypt.format=luks encrypt.key-secret=sec1 encrypt.iter-time=10
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=16777216 backing_file=TEST_DIR/t.IMGFMT.base
 
 == writing whole image layer ==
 wrote 16777216/16777216 bytes at offset 0
diff --git a/tests/qemu-iotests/263.out b/tests/qemu-iotests/263.out
index 0c982c55cb..54bfbeeff8 100644
--- a/tests/qemu-iotests/263.out
+++ b/tests/qemu-iotests/263.out
@@ -2,7 +2,7 @@ QA output created by 263
 
 testing LUKS qcow2 encryption
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 encrypt.format=luks encrypt.key-secret=sec0 encrypt.iter-time=10
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
 == reading the whole image ==
 read 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -21,7 +21,7 @@ read 982528/982528 bytes at offset 66048
 
 testing legacy AES qcow2 encryption
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 encrypt.format=aes encrypt.key-secret=sec0
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
 == reading the whole image ==
 read 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
diff --git a/tests/qemu-iotests/284.out b/tests/qemu-iotests/284.out
index 48216f5742..a929239302 100644
--- a/tests/qemu-iotests/284.out
+++ b/tests/qemu-iotests/284.out
@@ -2,7 +2,7 @@ QA output created by 284
 
 testing LUKS qcow2 encryption
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 encrypt.format=luks encrypt.key-secret=sec0 encrypt.iter-time=10
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
 
 == cluster size 512
 == checking image refcounts ==
@@ -21,7 +21,7 @@ wrote 1/1 bytes at offset 512
 
 == rechecking image refcounts ==
 No errors were found on the image.
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 encrypt.format=luks encrypt.key-secret=sec0 encrypt.iter-time=10
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
 
 == cluster size 2048
 == checking image refcounts ==
@@ -40,7 +40,7 @@ wrote 1/1 bytes at offset 2048
 
 == rechecking image refcounts ==
 No errors were found on the image.
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 encrypt.format=luks encrypt.key-secret=sec0 encrypt.iter-time=10
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
 
 == cluster size 32768
 == checking image refcounts ==
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 6cbd5ebba6..3a4becebb0 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -165,16 +165,13 @@ _filter_img_create()
         echo "$options" \
         | tr '\n' '\0' \
         | $SED -e 's/\x0$//' -e 's/ \([a-z0-9_.-]*\)=/\n\1=/g' \
-        | grep -ae "^\(fmt\\|size\\|backing\\|preallocation\\|encrypt$grep_data_file\\)" \
+        | grep -ae "^\(fmt\\|size\\|backing\\|preallocation\\|encryption$grep_data_file\\)" \
         | $SED "${filename_filters[@]}" \
             -e 's/^\(fmt\)/0-\1/' \
             -e 's/^\(size\)/1-\1/' \
             -e 's/^\(backing\)/2-\1/' \
             -e 's/^\(data_file\)/3-\1/' \
             -e 's/^\(encryption\)/4-\1/' \
-            -e 's/^\(encrypt\.format\)/5-\1/' \
-            -e 's/^\(encrypt\.key-secret\)/6-\1/' \
-            -e 's/^\(encrypt\.iter-time\)/7-\1/' \
             -e 's/^\(preallocation\)/8-\1/' \
         | sort \
         | $SED -e 's/^[0-9]-//' \
-- 
2.26.2


