Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C7C2FDF84
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 03:44:23 +0100 (CET)
Received: from localhost ([::1]:41818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2PxO-0001IA-J1
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 21:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Pqi-0001gS-7N
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:37:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Pqb-0003kg-Pt
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611196640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lfwXUNFg4S28XLPcx9yWsoMxYzELCyWZ1D8QSdbWJh0=;
 b=SaXimc97f3yRmHAn6L+7PWz7WlztZ7hf2PkHdt/7yd1QtOGhhuZpFKO200tNbZYkCFD93T
 9Wl/3tSK/SiNPbjaBDYjCWb1HyAB4q2IqE1dJWG5wk7L95vCmH5VhD5IjT7mCbWrK0Oqdw
 LRuevLW5QfuUJIc9z2mp7GNBduxc5DE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-NzTeTKRNM8m7YOfxz9zsLA-1; Wed, 20 Jan 2021 21:37:18 -0500
X-MC-Unique: NzTeTKRNM8m7YOfxz9zsLA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59D9880A5C4;
 Thu, 21 Jan 2021 02:37:17 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1B3A2C8FF;
 Thu, 21 Jan 2021 02:37:16 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/13] iotests: fix some whitespaces in test output files
Date: Wed, 20 Jan 2021 20:36:51 -0600
Message-Id: <20210121023657.1186241-8-eblake@redhat.com>
In-Reply-To: <20210121023657.1186241-1-eblake@redhat.com>
References: <20210121023657.1186241-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to be stricter about comparing test result with .out
files. So, fix some whitespaces now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210116134424.82867-4-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/175.out |  2 +-
 tests/qemu-iotests/271.out | 12 ++++++------
 tests/qemu-iotests/287.out | 10 +++++-----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/qemu-iotests/175.out b/tests/qemu-iotests/175.out
index 39c2ee0f6250..40a5bd1ce6c2 100644
--- a/tests/qemu-iotests/175.out
+++ b/tests/qemu-iotests/175.out
@@ -23,4 +23,4 @@ size=4096, min allocation
 == resize empty image with block_resize ==
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=0
 size=1048576, min allocation
- *** done
+*** done
diff --git a/tests/qemu-iotests/271.out b/tests/qemu-iotests/271.out
index 92deb7ebb0ea..81043ba4d77e 100644
--- a/tests/qemu-iotests/271.out
+++ b/tests/qemu-iotests/271.out
@@ -500,7 +500,7 @@ L2 entry #0: 0x8000000000050001 0000000000000001

 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
 L2 entry #1: 0x8000000000060000 00000001ffffffff
-qcow2: Marking image as corrupt: Invalid cluster entry found  (L2 offset: 0x40000, L2 index: 0x1); further corruption events will be suppressed
+qcow2: Marking image as corrupt: Invalid cluster entry found (L2 offset: 0x40000, L2 index: 0x1); further corruption events will be suppressed
 write failed: Input/output error

 ### Corrupted L2 entries - write test (unallocated) ###
@@ -515,14 +515,14 @@ L2 entry #0: 0x8000000000060000 0000000000000001

 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
 L2 entry #0: 0x0000000000000000 0000000000000001
-qcow2: Marking image as corrupt: Invalid cluster entry found  (L2 offset: 0x40000, L2 index: 0); further corruption events will be suppressed
+qcow2: Marking image as corrupt: Invalid cluster entry found (L2 offset: 0x40000, L2 index: 0); further corruption events will be suppressed
 write failed: Input/output error

 # Both 'subcluster is zero' and 'subcluster is allocated' bits set

 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
 L2 entry #1: 0x0000000000000000 0000000100000001
-qcow2: Marking image as corrupt: Invalid cluster entry found  (L2 offset: 0x40000, L2 index: 0x1); further corruption events will be suppressed
+qcow2: Marking image as corrupt: Invalid cluster entry found (L2 offset: 0x40000, L2 index: 0x1); further corruption events will be suppressed
 write failed: Input/output error

 ### Compressed cluster with subcluster bitmap != 0 - write test ###
@@ -583,7 +583,7 @@ read 524288/524288 bytes at offset 0
 read 524288/524288 bytes at offset 524288
 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Offset          Length          Mapped to       File
-0               0x80000        0               TEST_DIR/t.qcow2.base
+0               0x80000         0               TEST_DIR/t.qcow2.base
 # backing file and preallocation=falloc
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=524288 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=raw preallocation=falloc
 Image resized.
@@ -592,7 +592,7 @@ read 524288/524288 bytes at offset 0
 read 524288/524288 bytes at offset 524288
 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Offset          Length          Mapped to       File
-0               0x80000        0               TEST_DIR/t.qcow2.base
+0               0x80000         0               TEST_DIR/t.qcow2.base
 # backing file and preallocation=full
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=524288 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=raw preallocation=full
 Image resized.
@@ -601,7 +601,7 @@ read 524288/524288 bytes at offset 0
 read 524288/524288 bytes at offset 524288
 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Offset          Length          Mapped to       File
-0               0x80000        0               TEST_DIR/t.qcow2.base
+0               0x80000         0               TEST_DIR/t.qcow2.base

 ### Image resizing with preallocation and backing files ###

diff --git a/tests/qemu-iotests/287.out b/tests/qemu-iotests/287.out
index 6b9dfb4af050..49ab6a27d5b3 100644
--- a/tests/qemu-iotests/287.out
+++ b/tests/qemu-iotests/287.out
@@ -10,22 +10,22 @@ incompatible_features     []
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 incompatible_features     [3]

-=== Testing zlib with incompatible bit set  ===
+=== Testing zlib with incompatible bit set ===

 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 incompatible_features     [3]

-=== Testing zstd with incompatible bit unset  ===
+=== Testing zstd with incompatible bit unset ===

 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 incompatible_features     []

-=== Testing compression type values  ===
+=== Testing compression type values ===

 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
-   0
+0
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
-   1
+1

 === Testing simple reading and writing with zstd ===

-- 
2.30.0


