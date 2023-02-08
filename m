Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33B968EBE3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:42:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgxc-0003jB-2C; Wed, 08 Feb 2023 04:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pPgxW-0003if-R2
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:41:46 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pPgxU-0003ql-HW
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:41:46 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Bx7epQbuNjXeoPAA--.31387S3;
 Wed, 08 Feb 2023 17:41:36 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxb+RObuNjY0wtAA--.50938S3; 
 Wed, 08 Feb 2023 17:41:35 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org, philmd@linaro.org,
 armbru@redhat.com, thuth@redhat.com, mst@redhat.com, maobibo@loongson.cn,
 yangxiaojuan@loongson.cn
Subject: [PATCH v1 2/2] loongarch: Add smbios command line option.
Date: Wed,  8 Feb 2023 17:41:33 +0800
Message-Id: <20230208094133.2945979-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230208094133.2945979-1-gaosong@loongson.cn>
References: <20230208094133.2945979-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxb+RObuNjY0wtAA--.50938S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvdXoWruw1kCF47tr48JrW5uw4Durg_yoW3GFc_Xa
 4Iy392qw4jyFZ7ur4Yqrs7ArWvg3y8uw47Way5Krn5X3WrXrn09FZ5Jry5uFnrWrWFgr1f
 JF47Xr1UJry29jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
 xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5
 37CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x
 0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
 6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
 6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

LoongArch has enabled CONFIG_SMBIOS, but didn't enable CLI '-smbios'.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 88e93c6103..2aa6709466 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2592,7 +2592,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "                specify SMBIOS type 17 fields\n"
     "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pcidev=str]\n"
     "                specify SMBIOS type 41 fields\n",
-    QEMU_ARCH_I386 | QEMU_ARCH_ARM)
+    QEMU_ARCH_I386 | QEMU_ARCH_ARM | QEMU_ARCH_LOONGARCH)
 SRST
 ``-smbios file=binary``
     Load SMBIOS entry from binary file.
-- 
2.31.1


