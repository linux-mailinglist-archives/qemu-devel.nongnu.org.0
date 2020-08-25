Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04F6251791
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 13:29:44 +0200 (CEST)
Received: from localhost ([::1]:42134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAX95-0006nN-Q6
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 07:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kAX5o-0000U8-IM; Tue, 25 Aug 2020 07:26:21 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:40426 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kAX5j-0006er-0W; Tue, 25 Aug 2020 07:26:20 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1006D5FB14AD8B8C8CBC;
 Tue, 25 Aug 2020 19:26:09 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Tue, 25 Aug 2020
 19:26:00 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 04/10] target/arm/translate-a64:Remove redundant statement
 in disas_simd_two_reg_misc_fp16()
Date: Tue, 25 Aug 2020 19:24:41 +0800
Message-ID: <20200825112447.126308-5-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 07:26:04
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 pannengyuan@huawei.com, qemu-arm@nongnu.org,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang static code analyzer show warning:
target/arm/translate-a64.c:13007:5: warning: Value stored to 'rd' is never read
    rd = extract32(insn, 0, 5);
    ^    ~~~~~~~~~~~~~~~~~~~~~
target/arm/translate-a64.c:13008:5: warning: Value stored to 'rn' is never read
    rn = extract32(insn, 5, 5);
    ^    ~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 target/arm/translate-a64.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c83bb85e4e..47cce160d8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13016,9 +13016,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     fpop = deposit32(opcode, 5, 1, a);
     fpop = deposit32(fpop, 6, 1, u);
 
-    rd = extract32(insn, 0, 5);
-    rn = extract32(insn, 5, 5);
-
     switch (fpop) {
     case 0x1d: /* SCVTF */
     case 0x5d: /* UCVTF */
-- 
2.23.0


