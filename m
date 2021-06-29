Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337623B6DD8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 07:15:23 +0200 (CEST)
Received: from localhost ([::1]:57186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly65i-00089v-A3
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 01:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly64U-0006os-J8; Tue, 29 Jun 2021 01:14:06 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly64S-0001EM-N0; Tue, 29 Jun 2021 01:14:06 -0400
Received: by mail-wr1-x429.google.com with SMTP id i94so24175372wri.4;
 Mon, 28 Jun 2021 22:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ScbuV1uws/tcjQtyx9tP4Zkjz3punjNXoMsYbK2ktvg=;
 b=uuO+Wq5kulf5ube1SbhzX5Pf+rL+rBeFWni7+FL6MdF6L2318dS6Zkm5yhvOoqcFpe
 h55P5I/9OxYXmqu0FXCzSeaMWwXwAO3YtMdZ5cQodL5Z46fSgjhZ7QsmQei/ObAAobkZ
 WQzIEETMR43nJkUL/u7K/xyxOqZt4PsMkFVv8eW8XhdUzdr/sV/L4Ny2EGdQeK1pt1er
 tpOI/zU77tS4xvYxol6j5Opub81gVnPwn5x5Agnp91BxBETpWUgEYr1obdQ069JYarkp
 t4anleqw7ceQL7MUBLVuLTXuzrhvlFR6LwVZwtymtuU4vXRvuXDA0hjGR4CUaOXq28Rl
 LePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ScbuV1uws/tcjQtyx9tP4Zkjz3punjNXoMsYbK2ktvg=;
 b=WSRFdlKiDCfzHAGCIxrIDNQNn1MmzXHBjz+KO+T7MVtvVjGvprrnU6agk2I0TeeXl8
 JXRX2hVAdpt/KwU0Fk53O0I6Cxt0lEK7VIrNNDEKxCBsG8Z29orTzWbZo7GP77LOQy00
 rAMvjSNI+lhxuEGDlX8Fzb/XQMg7QYgI4TpLBMqvYQLvRiW6IPNe94AKZqrqDQ/MxskQ
 97q1nbw19xYOf96CXeE7KetHUVeahNjX96wLiT7JYjUAEDkEBpRu7svrzygL1Fc1qW52
 iUm6KqUaUv3R/r31mhtpeJWrvCMFelLN4S25M1eQFK+3GP+3FYOqrTPNBX/FHUfqetfP
 X5FQ==
X-Gm-Message-State: AOAM5306fIeoOuCrh9H3C/khs+MsqliIu58ixUxp7Tgf7DUQnjrZfV4w
 FpoHE6cyxc76yHd0LMVGe0ni5v2VsdLReQ==
X-Google-Smtp-Source: ABdhPJwFs9Pxtjo9wrFo2SOPv5SAfeFPKEyk1YdFYnV9pxAkYSURMX29dlDt5AAT51g4W/8t5h0kDA==
X-Received: by 2002:adf:e449:: with SMTP id t9mr32206138wrm.40.1624943642499; 
 Mon, 28 Jun 2021 22:14:02 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v18sm18860382wrv.24.2021.06.28.22.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 22:14:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] misc: Fix "havn't" typo
Date: Tue, 29 Jun 2021 07:14:00 +0200
Message-Id: <20210629051400.2573253-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix "havn't (make)" -> "haven't (made)" typo.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/desc-msos.c         | 2 +-
 target/s390x/translate.c   | 6 ++++--
 tcg/tcg-op.c               | 2 +-
 tcg/arm/tcg-target.c.inc   | 6 ++++--
 tcg/sparc/tcg-target.c.inc | 6 ++++--
 5 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/usb/desc-msos.c b/hw/usb/desc-msos.c
index 3a5ad7c8d0f..836e38c67e1 100644
--- a/hw/usb/desc-msos.c
+++ b/hw/usb/desc-msos.c
@@ -181,7 +181,7 @@ static int usb_desc_msos_prop(const USBDesc *desc, uint8_t *dest)
 
     if (desc->msos->Label) {
         /*
-         * Given as example in the specs.  Havn't figured yet where
+         * Given as example in the specs.  Haven't figured yet where
          * this label shows up in the windows gui.
          */
         length += usb_desc_msos_prop_str(dest+length, MSOS_REG_SZ,
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index e243624d2a6..6ac797a8a94 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -6270,8 +6270,10 @@ static void extract_field(DisasFields *o, const DisasField *f, uint64_t insn)
         abort();
     }
 
-    /* Validate that the "compressed" encoding we selected above is valid.
-       I.e. we havn't make two different original fields overlap.  */
+    /*
+     * Validate that the "compressed" encoding we selected above is valid.
+     * I.e. we haven't made two different original fields overlap.
+     */
     assert(((o->presentC >> f->indexC) & 1) == 0);
     o->presentC |= 1 << f->indexC;
     o->presentO |= 1 << f->indexO;
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index dcc2ed0bbc8..869dc6cdd29 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2695,7 +2695,7 @@ void tcg_gen_goto_tb(unsigned idx)
     /* We only support two chained exits.  */
     tcg_debug_assert(idx <= TB_EXIT_IDXMAX);
 #ifdef CONFIG_DEBUG_TCG
-    /* Verify that we havn't seen this numbered exit before.  */
+    /* Verify that we haven't seen this numbered exit before.  */
     tcg_debug_assert((tcg_ctx->goto_tb_issue_mask & (1 << idx)) == 0);
     tcg_ctx->goto_tb_issue_mask |= 1 << idx;
 #endif
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 51571432460..5882479f3d3 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2444,8 +2444,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
 static void tcg_target_init(TCGContext *s)
 {
-    /* Only probe for the platform and capabilities if we havn't already
-       determined maximum values at compile time.  */
+    /*
+     * Only probe for the platform and capabilities if we haven't already
+     * determined maximum values at compile time.
+     */
 #if !defined(use_idiv_instructions) || !defined(use_neon_instructions)
     {
         unsigned long hwcap = qemu_getauxval(AT_HWCAP);
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index a6ec94a094f..688827968b0 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -1690,8 +1690,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
 static void tcg_target_init(TCGContext *s)
 {
-    /* Only probe for the platform and capabilities if we havn't already
-       determined maximum values at compile time.  */
+    /*
+     * Only probe for the platform and capabilities if we haven't already
+     * determined maximum values at compile time.
+     */
 #ifndef use_vis3_instructions
     {
         unsigned long hwcap = qemu_getauxval(AT_HWCAP);
-- 
2.31.1


