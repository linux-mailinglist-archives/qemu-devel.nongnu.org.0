Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAEB46839F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 10:36:29 +0100 (CET)
Received: from localhost ([::1]:50306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtRT2-0004bR-Jd
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 04:36:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mtRN3-0004X3-6O
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 04:30:18 -0500
Received: from mail.loongson.cn ([114.242.206.163]:38390 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mtRMn-0003oz-K1
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 04:30:16 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx78r1NKthpt0CAA--.6875S25; 
 Sat, 04 Dec 2021 17:29:53 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 23/26] default-configs: Add loongarch linux-user support
Date: Sat,  4 Dec 2021 17:29:22 +0800
Message-Id: <1638610165-15036-24-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
References: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9Dx78r1NKthpt0CAA--.6875S25
X-Coremail-Antispam: 1UD129KBjvdXoWrZry3Cw13tryUtFWxtw48Xrb_yoW3Crg_uF
 y3Jr4kKFWUZryUCw10v3y5Ar4ru3W8AF1ruF4DKw4xXwsFqr43t34vva18Za4ay393urnx
 XrWkJr15Cr10qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds loongarch64 linux-user default configs file.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/loongarch64-linux-user.mak | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 configs/targets/loongarch64-linux-user.mak

diff --git a/configs/targets/loongarch64-linux-user.mak b/configs/targets/loongarch64-linux-user.mak
new file mode 100644
index 0000000..5b0acfa
--- /dev/null
+++ b/configs/targets/loongarch64-linux-user.mak
@@ -0,0 +1,3 @@
+# Default configuration for loongson64-linux-user
+TARGET_ARCH=loongarch64
+TARGET_BASE_ARCH=loongarch
-- 
1.8.3.1


