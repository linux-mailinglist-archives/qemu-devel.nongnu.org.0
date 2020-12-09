Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876112D3B5A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 07:17:02 +0100 (CET)
Received: from localhost ([::1]:55968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmsmb-00027x-4w
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 01:17:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmsl5-0001ST-Me; Wed, 09 Dec 2020 01:15:27 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmsky-0007vi-FM; Wed, 09 Dec 2020 01:15:27 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CrRbT446MzhnY6;
 Wed,  9 Dec 2020 14:14:45 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Dec 2020
 14:15:03 +0800
From: zhouyang <zhouyang789@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH] fsdev: open brace '{' following struct go on the same line
Date: Wed, 9 Dec 2020 14:07:35 +0800
Message-ID: <20201209060735.2760943-1-zhouyang789@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=zhouyang789@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, alex.chen@huawei.com, qemu-devel@nongnu.org,
 hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found some style problems while check the code using checkpatch.pl.
This commit fixs the issue below:
ERROR: open brace '{' following struct go on the same line

Signed-off-by: zhouyang <zhouyang789@huawei.com>
---
 fsdev/9p-marshal.h | 12 ++++--------
 fsdev/file-op-9p.h |  3 +--
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/fsdev/9p-marshal.h b/fsdev/9p-marshal.h
index 8f3babb60a..ceaf2f521e 100644
--- a/fsdev/9p-marshal.h
+++ b/fsdev/9p-marshal.h
@@ -1,21 +1,18 @@
 #ifndef QEMU_9P_MARSHAL_H
 #define QEMU_9P_MARSHAL_H
 
-typedef struct V9fsString
-{
+typedef struct V9fsString {
     uint16_t size;
     char *data;
 } V9fsString;
 
-typedef struct V9fsQID
-{
+typedef struct V9fsQID {
     uint8_t type;
     uint32_t version;
     uint64_t path;
 } V9fsQID;
 
-typedef struct V9fsStat
-{
+typedef struct V9fsStat {
     int16_t size;
     int16_t type;
     int32_t dev;
@@ -35,8 +32,7 @@ typedef struct V9fsStat
     int32_t n_muid;
 } V9fsStat;
 
-typedef struct V9fsIattr
-{
+typedef struct V9fsIattr {
     int32_t valid;
     int32_t mode;
     int32_t uid;
diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
index d51cec2f3b..42f677cf38 100644
--- a/fsdev/file-op-9p.h
+++ b/fsdev/file-op-9p.h
@@ -110,8 +110,7 @@ typedef union V9fsFidOpenState V9fsFidOpenState;
 
 void cred_init(FsCred *);
 
-struct FileOperations
-{
+struct FileOperations {
     int (*parse_opts)(QemuOpts *, FsDriverEntry *, Error **errp);
     int (*init)(FsContext *, Error **errp);
     void (*cleanup)(FsContext *);
-- 
2.23.0


