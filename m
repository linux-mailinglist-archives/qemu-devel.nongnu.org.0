Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA9929FCBC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 05:38:11 +0100 (CET)
Received: from localhost ([::1]:53182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYMAz-0005Yz-1C
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 00:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kYM9W-0004Td-Mg; Fri, 30 Oct 2020 00:36:38 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:2120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kYM9U-00016X-4k; Fri, 30 Oct 2020 00:36:38 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CMqJX32rrz6vmm;
 Fri, 30 Oct 2020 12:36:28 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 30 Oct 2020
 12:36:18 +0800
From: Xinhao Zhang <zhangxinhao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 2/3] hw/9pfs : open brace '{' following struct go on the
 same line
Date: Fri, 30 Oct 2020 12:35:14 +0800
Message-ID: <20201030043515.1030223-2-zhangxinhao1@huawei.com>
X-Mailer: git-send-email 2.29.0-rc1
In-Reply-To: <20201030043515.1030223-1-zhangxinhao1@huawei.com>
References: <20201030043515.1030223-1-zhangxinhao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=zhangxinhao1@huawei.com; helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 23:35:23
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu_oss@crudebyte.com,
 groug@kaod.org, dengkai1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix code style. Open braces for struct should go on the same line.

Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
Reported-by: Euler Robot <euler.robot@huawei.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/9pfs/9p.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 3dd1b50b1a..32df81f360 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -143,8 +143,7 @@ typedef struct {
  */
 QEMU_BUILD_BUG_ON(sizeof(P9MsgHeader) != 7);
 
-struct V9fsPDU
-{
+struct V9fsPDU {
     uint32_t size;
     uint16_t tag;
     uint8_t id;
@@ -270,8 +269,7 @@ union V9fsFidOpenState {
     void *private;
 };
 
-struct V9fsFidState
-{
+struct V9fsFidState {
     int fid_type;
     int32_t fid;
     V9fsPath path;
@@ -338,8 +336,7 @@ typedef struct {
     uint64_t path;
 } QpfEntry;
 
-struct V9fsState
-{
+struct V9fsState {
     QLIST_HEAD(, V9fsPDU) free_list;
     QLIST_HEAD(, V9fsPDU) active_list;
     V9fsFidState *fid_list;
-- 
2.29.0-rc1


