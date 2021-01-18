Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C5A2F9820
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 04:21:16 +0100 (CET)
Received: from localhost ([::1]:32812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1L6R-0007Hg-BQ
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 22:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1l1L3f-0003wB-28
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 22:18:23 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1l1L3d-0006pt-A8
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 22:18:22 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DJxlf15hzzMLb7;
 Mon, 18 Jan 2021 11:16:46 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Mon, 18 Jan 2021
 11:17:58 +0800
From: zhouyang <zhouyang789@huawei.com>
To: <alex.bennee@linaro.org>
Subject: [PATCH v3 5/5] contrib: Open brace '{' following struct go on the
 same line
Date: Mon, 18 Jan 2021 11:10:04 +0800
Message-ID: <20210118031004.1662363-6-zhouyang789@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210118031004.1662363-1-zhouyang789@huawei.com>
References: <20210118031004.1662363-1-zhouyang789@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhouyang789@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, qemu-devel@nongnu.org, zhouyang789@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found some style problems whil check the code using checkpatch.pl.
This commit fixs the issue below:
ERROR: that open brace { should be on the previous line

Signed-off-by: zhouyang <zhouyang789@huawei.com>
---
 contrib/plugins/howvec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 9d6fa33297..600f7facc1 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -145,8 +145,7 @@ typedef struct {
     int table_sz;
 } ClassSelector;
 
-static ClassSelector class_tables[] =
-{
+static ClassSelector class_tables[] = {
     { "aarch64", aarch64_insn_classes, ARRAY_SIZE(aarch64_insn_classes) },
     { "sparc",   sparc32_insn_classes, ARRAY_SIZE(sparc32_insn_classes) },
     { "sparc64", sparc64_insn_classes, ARRAY_SIZE(sparc64_insn_classes) },
-- 
2.23.0


