Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD45E2AD4F9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:29:00 +0100 (CET)
Received: from localhost ([::1]:49860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRpb-0005l7-QW
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgP-0001tR-Qf
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:29 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgN-0006o3-Gw
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:29 -0500
Received: by mail-wr1-x42b.google.com with SMTP id p1so12228442wrf.12
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IFXSLaXfL+RUut/92LcuexluyUZ9ecNXkg0uDuqM+CM=;
 b=ic1w1Q9PQ4M38Gz/Q7UDAtksxJ/fahQ/OyWXlXVQc7gb1VlJOzXZ/wuqijr+J/+FBj
 XTO9u81ryEe8sbV0V2XZlRqnVyQa4ayxzh3InwenvHvy6c0bHKx4KbO1JAvMbi97pa1Q
 Eu73bt6LbwWlAW72wC/5B1pRn/iQeQI6ZhwpozkYeNNAypgN4Z2bXm47w/NqKdI9wtum
 IgA0lnsPuzwYKvbewGLs0fv4d8H/FBb/VO8mO+bjqzfu9DcxvP744nnZ7nl4TLEq4d1r
 /Rd6XLXON5rSLaRUbl2/YC3yy3geWsCBEWI+ZDxN2x4OkqUOmDry0eR7nnZOceWF1MMZ
 k1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IFXSLaXfL+RUut/92LcuexluyUZ9ecNXkg0uDuqM+CM=;
 b=WMMSZNi8FJiy4K0kWsQqhP5HP/brCUPiMBjU7NJrFBPIlFn0yXAIUUw5d6mjrnZqvw
 U/sbalVquFRKCf05wvt7ufqM8ZlHxis9H/8mVpSU+Wu5/mNxoW6qC1mhIJYl4LIwcVaQ
 uVl1zZtQAfnfARcNFPuEs6eeZxXS6k3Icz3O1mILGK1taammmo4c5RaGHHwQWCdAnrI2
 /NFusIgiIePmNYp4+y/njnqWdOTRkz+J2zekBjLrTf9cjYbpKrVefNAMUtL4/chFwvp3
 hjziqokuuKawMdoNDoaKay0OQISZw+HiywQAo8FtT/X1wVSD66hHtMBxhYOOHhfDXhVg
 c0mA==
X-Gm-Message-State: AOAM533oA0Ji/U3fdzld/mcokx0llpGVhtHk6jzbfqy4sYe/bM26H7ru
 jCqj90caSpHrL6e6cfDhQbh1vQYTOc9hug==
X-Google-Smtp-Source: ABdhPJymgBEBjdPdLPtwew3tYE2pf6ftybjhwG2kNSJjF654bpz4f/RohO/N6/CpHmUOAzw6tB4VaA==
X-Received: by 2002:adf:f549:: with SMTP id j9mr8350067wrp.324.1605007163988; 
 Tue, 10 Nov 2020 03:19:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/16] target/arm: add spaces around operator
Date: Tue, 10 Nov 2020 11:19:04 +0000
Message-Id: <20201110111917.29539-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
References: <20201110111917.29539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xinhao Zhang <zhangxinhao1@huawei.com>

Fix code style. Operator needs spaces both sides.

Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
Message-id: 20201103114529.638233-1-zhangxinhao1@huawei.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arch_dump.c | 8 ++++----
 target/arm/arm-semi.c  | 8 ++++----
 target/arm/helper.c    | 2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 7693e17e964..01848453109 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -114,8 +114,8 @@ static int aarch64_write_elf64_prfpreg(WriteCoreDumpFunction f,
 
     for (i = 0; i < 32; ++i) {
         uint64_t *q = aa64_vfp_qreg(env, i);
-        note.vfp.vregs[2*i + 0] = cpu_to_dump64(s, q[0]);
-        note.vfp.vregs[2*i + 1] = cpu_to_dump64(s, q[1]);
+        note.vfp.vregs[2 * i + 0] = cpu_to_dump64(s, q[0]);
+        note.vfp.vregs[2 * i + 1] = cpu_to_dump64(s, q[1]);
     }
 
     if (s->dump_info.d_endian == ELFDATA2MSB) {
@@ -125,8 +125,8 @@ static int aarch64_write_elf64_prfpreg(WriteCoreDumpFunction f,
          */
         for (i = 0; i < 32; ++i) {
             uint64_t tmp = note.vfp.vregs[2*i];
-            note.vfp.vregs[2*i] = note.vfp.vregs[2*i+1];
-            note.vfp.vregs[2*i+1] = tmp;
+            note.vfp.vregs[2 * i] = note.vfp.vregs[2 * i + 1];
+            note.vfp.vregs[2 * i + 1] = tmp;
         }
     }
 
diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 8718fd01948..c1df664f7e5 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -755,7 +755,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         if (use_gdb_syscalls()) {
             arm_semi_open_guestfd = guestfd;
             ret = arm_gdb_syscall(cpu, arm_semi_open_cb, "open,%s,%x,1a4", arg0,
-                                  (int)arg2+1, gdb_open_modeflags[arg1]);
+                                  (int)arg2 + 1, gdb_open_modeflags[arg1]);
         } else {
             ret = set_swi_errno(env, open(s, open_modeflags[arg1], 0644));
             if (ret == (uint32_t)-1) {
@@ -852,7 +852,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         GET_ARG(1);
         if (use_gdb_syscalls()) {
             ret = arm_gdb_syscall(cpu, arm_semi_cb, "unlink,%s",
-                                  arg0, (int)arg1+1);
+                                  arg0, (int)arg1 + 1);
         } else {
             s = lock_user_string(arg0);
             if (!s) {
@@ -870,7 +870,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         GET_ARG(3);
         if (use_gdb_syscalls()) {
             return arm_gdb_syscall(cpu, arm_semi_cb, "rename,%s,%s",
-                                   arg0, (int)arg1+1, arg2, (int)arg3+1);
+                                   arg0, (int)arg1 + 1, arg2, (int)arg3 + 1);
         } else {
             char *s2;
             s = lock_user_string(arg0);
@@ -896,7 +896,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         GET_ARG(1);
         if (use_gdb_syscalls()) {
             return arm_gdb_syscall(cpu, arm_semi_cb, "system,%s",
-                                   arg0, (int)arg1+1);
+                                   arg0, (int)arg1 + 1);
         } else {
             s = lock_user_string(arg0);
             if (!s) {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 68545919865..11b0803df72 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12508,7 +12508,7 @@ uint32_t HELPER(usad8)(uint32_t a, uint32_t b)
     uint32_t sum;
     sum = do_usad(a, b);
     sum += do_usad(a >> 8, b >> 8);
-    sum += do_usad(a >> 16, b >>16);
+    sum += do_usad(a >> 16, b >> 16);
     sum += do_usad(a >> 24, b >> 24);
     return sum;
 }
-- 
2.20.1


