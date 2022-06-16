Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB52654E0E8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 14:38:10 +0200 (CEST)
Received: from localhost ([::1]:55764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1olF-0006Yx-Aw
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 08:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o1oXm-0001cs-HY
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:24:14 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47910 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o1oXg-0000FR-Ol
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:24:13 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD08LH6tiaiNGAA--.9326S12; 
 Thu, 16 Jun 2022 20:16:17 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, laurent@vivier.eu, gaosong@loongson.cn,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v17 10/13] target/loongarch: remove unused include hw/loader.h
Date: Thu, 16 Jun 2022 20:16:08 +0800
Message-Id: <20220616121611.3316074-11-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616121611.3316074-1-gaosong@loongson.cn>
References: <20220616121611.3316074-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxD08LH6tiaiNGAA--.9326S12
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU
 =
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

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 0013582a3a..bf163a8dce 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -18,7 +18,6 @@
 #include "fpu/softfloat-helpers.h"
 #include "cpu-csr.h"
 #include "sysemu/reset.h"
-#include "hw/loader.h"
 
 const char * const regnames[32] = {
     "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
-- 
2.31.1


