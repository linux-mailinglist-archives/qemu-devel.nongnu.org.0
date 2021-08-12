Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCB43EA354
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 13:13:00 +0200 (CEST)
Received: from localhost ([::1]:53544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE8dv-0000LT-6z
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 07:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mE8cJ-0007OC-LS
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:11:21 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mE8cI-0006ln-09
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:11:19 -0400
Received: by mail-wm1-x336.google.com with SMTP id g138so4184185wmg.4
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 04:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ggcz6ifefrwwLbHZT3YC9yosocnIv/l2pobUP+e3cTg=;
 b=njsDXT4518M7KaHjleocGCwRhLkpzyV2rr3e74Qc2FgL1L7qa5V5ATtTMeH5XNLOqL
 FK3H/Cw6VctNZu0w/ZPBSnQgppOYI9qVVL+1LdYcrnluhM6RbhdHZhJ0IYT1l4L26YND
 oHvag0Qv/mxlgbmslgpDH1X9gQ508ibhkSnEbiirQNhL9aLdV17Ydt5O/UQTXcwSdZ15
 E43fVKmkhzHL1/UEzsFYkAqWljrqIHlYzyxndx1c+MCQFeo2MGMO8hqAaY+CNtpU74nk
 oGGpyyDOtRjUyQvxcqeLPsWCz+HqQmyeJ7NMCO5OljeY0EuBSmR3FOL+4SL+CBkhd8fp
 NkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ggcz6ifefrwwLbHZT3YC9yosocnIv/l2pobUP+e3cTg=;
 b=PNwkBJrFwwTkfO9MiSk/iWiGjbRSshq2UKqs6jZNPGdsN/9hr/z00Jh123R1wWjUyK
 DY+t+MnWGzXzfK+imPhLmNUywp5mAvDLdhELL4TjWB4WAExHnR5xFWjDdLTOXBrTU7vf
 N8rhEpORrHDELoR7My/GXAPKAshE3yVjsEjvOiMAbQhgA98ZdjBCPmpuXbPxm+p219EQ
 qtz83DI4b7wXzs4mlAySt6dUxTcIg7JTA80xl7N85xet2a2L63oBAOi21vgeMrzTGwHo
 MnaXyLXC0VbZ7d6ZiE5QhswcvQ7yZQ9xJohB7aqw70KFbqdBJPZ5X9ND+X7UbdjhN61D
 BpgQ==
X-Gm-Message-State: AOAM5310M6ZahVybQy2Aa3KBx0p4Bnkvugqb99QpO/q/Ce1lJloyQVlE
 yMemF2fHqLVW93v4lJl1Qxx/c8PvScQ=
X-Google-Smtp-Source: ABdhPJwVYe5RrMblujh/pwSrk9mUDEGQ3TdXWv325PTKmYicqVK5HXmcN3FU1zb6GPewaBa21yBZag==
X-Received: by 2002:a1c:10e:: with SMTP id 14mr14724554wmb.93.1628766675963;
 Thu, 12 Aug 2021 04:11:15 -0700 (PDT)
Received: from laral.fritz.box
 (200116b82b4d700068bb3a85648165df.dip.versatel-1u1.de.
 [2001:16b8:2b4d:7000:68bb:3a85:6481:65df])
 by smtp.gmail.com with ESMTPSA id h2sm8999228wmm.33.2021.08.12.04.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 04:11:15 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Fixed size of constant for Windows
Date: Thu, 12 Aug 2021 13:10:56 +0200
Message-Id: <20210812111056.26926-1-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

~0UL has 64 bits on Linux and 32 bits on Windows.
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/512".

Reported-by: Volker Rümelin <vr_qemu@t-online.de>
Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/tcg/sysemu/misc_helper.c | 2 +-
 target/i386/tcg/sysemu/svm_helper.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 0a7a58ca9a..91b0fc916b 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -97,7 +97,7 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
         break;
     case 3:
         if ((env->efer & MSR_EFER_LMA) &&
-                (t0 & ((~0UL) << env_archcpu(env)->phys_bits))) {
+                (t0 & ((~0ULL) << env_archcpu(env)->phys_bits))) {
             cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
         }
         if (!(env->efer & MSR_EFER_LMA)) {
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 3891f4e4a8..42cd5053e5 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -290,7 +290,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     }
     new_cr3 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr3));
     if ((env->efer & MSR_EFER_LMA) &&
-            (new_cr3 & ((~0UL) << cpu->phys_bits))) {
+            (new_cr3 & ((~0ULL) << cpu->phys_bits))) {
         cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
     }
     new_cr4 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr4));
-- 
2.25.1


