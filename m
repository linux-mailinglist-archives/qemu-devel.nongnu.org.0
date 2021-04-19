Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A8364AA8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:37:06 +0200 (CEST)
Received: from localhost ([::1]:41226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZhh-0000Hq-QU
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQE-0006nR-3u
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:19:03 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQC-0001CQ-Ln
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:19:01 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so9268731wmq.4
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fTQ5LbmfBKa+DkChI03N3lX+fZBlTslCfIb2OafYz+c=;
 b=tvgYuzTtjo05RsirAdOmxuKSV8+x6wwgBpV9Cbj3IIkCLGff0vPgZ4wK5WKhDmxaa7
 kqFNuEtRfma0l71izVu5OKPF+2Bjat279FgV3wJ4gS3Zsqs6H6LDMJvA7u6L8ZUT9tCD
 0ILbDIqR6/YyKFgb1oXR6E6y6FIov72P0gwmW+siy+BxwHGSa84GWHZ3C2L4bKnUY+CA
 AVjbv1AEi/H1rMu1uumMx25GjJ17356vuqY4UTOOmOmMfhg7CVG95jWu7KKzdWrJlDQS
 CMmO79n4dEDfJAfhTNwHP8ed82FgJ4RyDdx9nU199SB+8477vvcMgMsiJMAE2d2+T78D
 IdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fTQ5LbmfBKa+DkChI03N3lX+fZBlTslCfIb2OafYz+c=;
 b=NEjsoRJIJjyXBZ+x1dG7b4UCEtdeYLN7ebSPJq05tMyfaTc4aBABhHVofIIjE3X8+/
 xy/IfPNsz7Na5+m/SkgMIakSF6irNWZBIFYqCNPAQNxXavxxjUwuco8cSem+x9h5gu2z
 syVGaSIKyR/WL+KdKg+PFS5bQbABn5gAM8GtrrwrZjlgvRA0RDyrIIUfKekbsle1YFXm
 Ca0VuXhC4UxvhZZizc+FdQTsXRHYXMRdzQsAgEEtqjBxMr4r97WeZBBTajaDtrJjLO09
 D69E7ZZcRR7bncgxLf5RG1H+Dgp7oGuCVhxydJJJ6cr59YFczWI1sO5uthuV/Jnxfe6H
 5Omw==
X-Gm-Message-State: AOAM533DSwvxUW8So/3PZDoSQCdQIoSAy2zTDTYerpBEsInNgbw19dkA
 ePtPQfPElPix/O51WCSEd5IIM1BHWZZWFg==
X-Google-Smtp-Source: ABdhPJwAXQEzFiWtuarEgZ+SNGdpcgPjXTR/1xEAOLiTz/kdMakXyagXWC1UijTbqfvRLj8idzxX3w==
X-Received: by 2002:a1c:7c08:: with SMTP id x8mr580525wmc.130.1618859939153;
 Mon, 19 Apr 2021 12:18:59 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c6sm1858039wmr.0.2021.04.19.12.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:18:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/30] target/mips: Turn printfpr() macro into a proper
 function
Date: Mon, 19 Apr 2021 21:18:00 +0200
Message-Id: <20210419191823.1555482-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419191823.1555482-1-f4bug@amsat.org>
References: <20210419191823.1555482-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Turn printfpr() macro into a proper function: fpu_dump_fpr().

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c | 48 ++++++++++++++++++++++-------------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 232f701b836..90ae232c8b8 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -145,44 +145,40 @@ void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val)
 
 #endif /* !CONFIG_USER_ONLY */
 
+static void fpu_dump_fpr(fpr_t *fpr, FILE *f, bool is_fpu64)
+{
+    if (is_fpu64) {
+        qemu_fprintf(f, "w:%08x d:%016" PRIx64 " fd:%13g fs:%13g psu: %13g\n",
+                     fpr->w[FP_ENDIAN_IDX], fpr->d,
+                     (double)fpr->fd,
+                     (double)fpr->fs[FP_ENDIAN_IDX],
+                     (double)fpr->fs[!FP_ENDIAN_IDX]);
+    } else {
+        fpr_t tmp;
+
+        tmp.w[FP_ENDIAN_IDX] = fpr->w[FP_ENDIAN_IDX];
+        tmp.w[!FP_ENDIAN_IDX] = (fpr + 1)->w[FP_ENDIAN_IDX];
+        qemu_fprintf(f, "w:%08x d:%016" PRIx64 " fd:%13g fs:%13g psu:%13g\n",
+                     tmp.w[FP_ENDIAN_IDX], tmp.d,
+                     (double)tmp.fd,
+                     (double)tmp.fs[FP_ENDIAN_IDX],
+                     (double)tmp.fs[!FP_ENDIAN_IDX]);
+    }
+}
+
 static void fpu_dump_state(CPUMIPSState *env, FILE *f, int flags)
 {
     int i;
     int is_fpu64 = !!(env->hflags & MIPS_HFLAG_F64);
 
-#define printfpr(fp)                                                    \
-    do {                                                                \
-        if (is_fpu64)                                                   \
-            qemu_fprintf(f, "w:%08x d:%016" PRIx64                      \
-                         " fd:%13g fs:%13g psu: %13g\n",                \
-                         (fp)->w[FP_ENDIAN_IDX], (fp)->d,               \
-                         (double)(fp)->fd,                              \
-                         (double)(fp)->fs[FP_ENDIAN_IDX],               \
-                         (double)(fp)->fs[!FP_ENDIAN_IDX]);             \
-        else {                                                          \
-            fpr_t tmp;                                                  \
-            tmp.w[FP_ENDIAN_IDX] = (fp)->w[FP_ENDIAN_IDX];              \
-            tmp.w[!FP_ENDIAN_IDX] = ((fp) + 1)->w[FP_ENDIAN_IDX];       \
-            qemu_fprintf(f, "w:%08x d:%016" PRIx64                      \
-                         " fd:%13g fs:%13g psu:%13g\n",                 \
-                         tmp.w[FP_ENDIAN_IDX], tmp.d,                   \
-                         (double)tmp.fd,                                \
-                         (double)tmp.fs[FP_ENDIAN_IDX],                 \
-                         (double)tmp.fs[!FP_ENDIAN_IDX]);               \
-        }                                                               \
-    } while (0)
-
-
     qemu_fprintf(f,
                  "CP1 FCR0 0x%08x  FCR31 0x%08x  SR.FR %d  fp_status 0x%02x\n",
                  env->active_fpu.fcr0, env->active_fpu.fcr31, is_fpu64,
                  get_float_exception_flags(&env->active_fpu.fp_status));
     for (i = 0; i < 32; (is_fpu64) ? i++ : (i += 2)) {
         qemu_fprintf(f, "%3s: ", fregnames[i]);
-        printfpr(&env->active_fpu.fpr[i]);
+        fpu_dump_fpr(&env->active_fpu.fpr[i], f, is_fpu64);
     }
-
-#undef printfpr
 }
 
 static void mips_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-- 
2.26.3


