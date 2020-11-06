Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB122A92F2
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 10:39:49 +0100 (CET)
Received: from localhost ([::1]:36666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kayDk-0007cr-Mn
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 04:39:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <487729e9f667644ee0d6762b24269e7758ad2e5e@lizzy.crudebyte.com>)
 id 1kayCH-0006Fz-2E
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 04:38:17 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:47391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <487729e9f667644ee0d6762b24269e7758ad2e5e@lizzy.crudebyte.com>)
 id 1kayCF-0007Bu-Br
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 04:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=XoZ2XPXVmz9CcXaU4iZPp15B80jRxnBP0iossRIbCUw=; b=HBfE4
 ENsKNQMlNJXqX9jzHjtetWNfclHgdET/u1THEMiLMCp3NPwJnBu97qh6wh8CZIdIlxbsqz1jH87AO
 f4RRtiU7sdhmurpIKJT2DY7rpysu2CGERFaJiRbmoSgIYknGN23cYidsgfAu2RA+SMaNWNCjuf5eu
 2ulT+/VZRh0CGFOzNxN2BeQjhY56baTSA76u5xU31Ku2Oc0msqngcRBds2/vImvRiOkCswcxYEOo8
 zRr0qoKyjBm6o6RYU5caG0Dl/cgQSUae+/zq+6VkNo8ZVusKQCvu+95+Jp0IKRy0fTqCX8zri17gX
 Z8oMzuR+DvkBDrOceIhlneMmGjcSg==;
Message-Id: <487729e9f667644ee0d6762b24269e7758ad2e5e.1604653990.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1604653990.git.qemu_oss@crudebyte.com>
References: <cover.1604653990.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 06 Nov 2020 10:13:10 +0100
Subject: [PULL 2/4] hw/9pfs : open brace '{' following struct go on the same
 line
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Xinhao Zhang <zhangxinhao1@huawei.com>,
 Kai Deng <dengkai1@huawei.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=487729e9f667644ee0d6762b24269e7758ad2e5e@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 04:36:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xinhao Zhang <zhangxinhao1@huawei.com>

Fix code style. Open braces for struct should go on the same line.

Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
Reported-by: Euler Robot <euler.robot@huawei.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201030043515.1030223-2-zhangxinhao1@huawei.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
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
2.20.1


