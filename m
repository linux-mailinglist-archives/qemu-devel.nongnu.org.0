Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2A740F41B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 10:27:41 +0200 (CEST)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR9Dg-000514-TT
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 04:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mR90Q-0005jr-Ez
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:13:58 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39412 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mR90O-0006wV-40
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:13:58 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxleUMTkRhuvoIAA--.26151S20; 
 Fri, 17 Sep 2021 16:13:41 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 18/21] default-configs: Add loongarch linux-user support
Date: Fri, 17 Sep 2021 16:12:57 +0800
Message-Id: <1631866380-31017-19-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631866380-31017-1-git-send-email-gaosong@loongson.cn>
References: <1631866380-31017-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxleUMTkRhuvoIAA--.26151S20
X-Coremail-Antispam: 1UD129KBjvdXoWrZry3XryrKw15JrWDuryxGrg_yoW3Arg_uF
 yfJr4vgFWUZryUCw10v3yrAr4ru3W8AF1ruF4DKw4xXwsFqr43t34vva1rAa4ay393urnx
 ZrWkArn5Cr10qjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 peterx@redhat.com, f4bug@amsat.org, yangxiaojuan@loongson.cn,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add loongarch64 linux-user default configs file.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
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


