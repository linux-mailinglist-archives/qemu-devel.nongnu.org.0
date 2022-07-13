Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43A7572B2C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 04:05:33 +0200 (CEST)
Received: from localhost ([::1]:45126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBRkq-00061z-J9
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 22:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oBRib-0004Vl-48
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 22:03:13 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56314 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oBRiY-0004cy-Ok
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 22:03:12 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx39HSJ85iYpMaAA--.17699S2; 
 Wed, 13 Jul 2022 10:02:58 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn,
 richard.henderson@linaro.org, gaosong@loongson.cn
Subject: [PATCH] qtest/machine-none: Add LoongArch support
Date: Wed, 13 Jul 2022 10:02:58 +0800
Message-Id: <20220713020258.601424-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx39HSJ85iYpMaAA--.17699S2
X-Coremail-Antispam: 1UD129KBjvdXoWrJr13trW5tFW8Aw43KF15Jwb_yoWxGwcEy3
 WftF97ursxJF45ZF18Zw4rJw1xA3W0vry2gF9xJa1Fy340gF1rGr4kKwn8Ary5ur45GrZ3
 ta1DZFyUCr1DCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the cpu_maps[] to support the LoongArch target.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 tests/qtest/machine-none-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/machine-none-test.c b/tests/qtest/machine-none-test.c
index d0f8cd9902..f92fab479f 100644
--- a/tests/qtest/machine-none-test.c
+++ b/tests/qtest/machine-none-test.c
@@ -54,6 +54,7 @@ static struct arch2cpu cpus_map[] = {
     { "riscv64", "rv64" },
     { "riscv32", "rv32" },
     { "rx", "rx62n" },
+    { "loongarch64", "la464"},
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.31.1


