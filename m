Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D662C60A3
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 08:50:30 +0100 (CET)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiYWT-0008P2-Mj
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 02:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kiYP5-0001w5-T9
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 02:42:51 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kiYP3-00081S-OT
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 02:42:51 -0500
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Cj6610vjKz4yGJ;
 Fri, 27 Nov 2020 15:42:17 +0800 (CST)
Received: from dggemi758-chm.china.huawei.com (10.1.198.144) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 27 Nov 2020 15:42:45 +0800
Received: from localhost (10.174.187.211) by dggemi758-chm.china.huawei.com
 (10.1.198.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1913.5; Fri, 27
 Nov 2020 15:42:45 +0800
From: Zeyu Jin <jinzeyu@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [RFC PATCH 6/6] doc: Update multi-thread compression doc
Date: Fri, 27 Nov 2020 15:42:42 +0800
Message-ID: <20201127074242.2321-1-jinzeyu@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.211]
X-ClientProxiedBy: dggemi702-chm.china.huawei.com (10.3.20.101) To
 dggemi758-chm.china.huawei.com (10.1.198.144)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=jinzeyu@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: Ying Fang <fangying1@huawei.com>, qemu-devel@nongnu.org,
 Zeyu Jin <jinzeyu@huawei.com>, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Modify the doc to fit the previous changes.

Signed-off-by: Zeyu Jin <jinzeyu@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 docs/multi-thread-compression.txt | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/docs/multi-thread-compression.txt b/docs/multi-thread-compression.txt
index bb88c6bdf1..d429963cb0 100644
--- a/docs/multi-thread-compression.txt
+++ b/docs/multi-thread-compression.txt
@@ -33,14 +33,15 @@ thread compression can be used to accelerate the compression process.
 
 The decompression speed of Zlib is at least 4 times as quick as
 compression, if the source and destination CPU have equal speed,
-keeping the compression thread count 4 times the decompression
-thread count can avoid resource waste.
+and you choose Zlib as compression method, keeping the compression
+thread count 4 times the decompression thread count can avoid resource waste.
 
 Compression level can be used to control the compression speed and the
-compression ratio. High compression ratio will take more time, level 0
-stands for no compression, level 1 stands for the best compression
-speed, and level 9 stands for the best compression ratio. Users can
-select a level number between 0 and 9.
+compression ratio. High compression ratio will take more time,
+level 1 stands for the best compression speed, and higher level means higher
+compression ration. For Zlib, users can select a level number between 0 and 9,
+where level 0 stands for no compression. For Zstd, users can select a
+level number between 1 and 22.
 
 
 When to use the multiple thread compression in live migration
@@ -116,16 +117,19 @@ to support the multiple thread compression migration:
 2. Activate compression on the source:
     {qemu} migrate_set_capability compress on
 
-3. Set the compression thread count on source:
+3. Set the compression method:
+    {qemu} migrate_set_parameter compress_method zstd
+
+4. Set the compression thread count on source:
     {qemu} migrate_set_parameter compress_threads 12
 
-4. Set the compression level on the source:
+5. Set the compression level on the source:
     {qemu} migrate_set_parameter compress_level 1
 
-5. Set the decompression thread count on destination:
+6. Set the decompression thread count on destination:
     {qemu} migrate_set_parameter decompress_threads 3
 
-6. Start outgoing migration:
+7. Start outgoing migration:
     {qemu} migrate -d tcp:destination.host:4444
     {qemu} info migrate
     Capabilities: ... compress: on
@@ -136,6 +140,7 @@ The following are the default settings:
     compress_threads: 8
     decompress_threads: 2
     compress_level: 1 (which means best speed)
+    compress_method: zlib
 
 So, only the first two steps are required to use the multiple
 thread compression in migration. You can do more if the default
@@ -143,7 +148,7 @@ settings are not appropriate.
 
 TODO
 ====
-Some faster (de)compression method such as LZ4 and Quicklz can help
-to reduce the CPU consumption when doing (de)compression. If using
-these faster (de)compression method, less (de)compression threads
+Comparing to Zlib, Some faster (de)compression method such as LZ4
+and Quicklz can help to reduce the CPU consumption when doing (de)compression.
+If using these faster (de)compression method, less (de)compression threads
 are needed when doing the migration.
-- 
2.23.0


