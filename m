Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239652D2DF5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 16:14:54 +0100 (CET)
Received: from localhost ([::1]:56652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmehZ-00041b-7M
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 10:14:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmc7U-00056s-BS; Tue, 08 Dec 2020 07:29:28 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmc7R-0007oZ-QF; Tue, 08 Dec 2020 07:29:28 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CqzxK5p5Wz15Z1R;
 Tue,  8 Dec 2020 20:28:37 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Tue, 8 Dec 2020
 20:29:02 +0800
From: "zhouyang (T)" <zhouyang789@huawei.com>
To: <alex.bennee@linaro.org>
Subject: [PATCH 2/5] contrib: Fix some code style problems,
 ERROR: "foo * bar" should be "foo *bar"
Date: Tue, 8 Dec 2020 20:21:31 +0800
Message-ID: <20201208122134.3308101-3-zhouyang789@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201208122134.3308101-1-zhouyang789@huawei.com>
References: <20201208122134.3308101-1-zhouyang789@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhouyang789@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 08 Dec 2020 10:10:03 -0500
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found some style problems while check the code using checkpatch.pl.
This commit fixs the issue below:
ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: zhouyang (T) <zhouyang789@huawei.com>
---
 contrib/plugins/howvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 6e602aaccf..2f892da17d 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -235,7 +235,7 @@ static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
     (*count)++;
 }
 
-static uint64_t * find_counter(struct qemu_plugin_insn *insn)
+static uint64_t *find_counter(struct qemu_plugin_insn *insn)
 {
     int i;
     uint64_t *cnt = NULL;
-- 
2.23.0


