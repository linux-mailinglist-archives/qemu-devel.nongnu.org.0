Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1E12EE94D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:54:13 +0100 (CET)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeAW-0000Yf-96
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjt-00036d-Pf
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:41 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjr-0006Aa-OZ
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:41 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d13so7072205wrc.13
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DQ4NcLmRVy40lLGUZw2vzkfPGYpNttR3tCsf5kFmz/8=;
 b=IyXKkfNL7hGiSkGT4c/E2YerUGtsWqVoPs7ntAQbAB/la7lRak6q3Xy4FdAmnnrlyX
 yTLKIw/ZKXBLE6g+JaVbm/fO+I0iACnENjMN9YUC+Y3cBss37hOpBZa4Ffp12znPv8zc
 B/goa6jsw9so7QJyZ7ldnRr7sDCI8qoHLgOgxJHYwNXrEInL27gR8NIW49bVyAxTpe5W
 nfWygBarjnRIuk0B0pvRAWoGXx1VSuasC/Z3NxNQ1VHhtSM1bRupoB/FMuCAMjvoqBIt
 bEXnEMQBFJoOC7qQ1T1dZhyJYmAaI1DXZJofh5F3ILUaeHVNBgN94LTe766acm0SBE1A
 rkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DQ4NcLmRVy40lLGUZw2vzkfPGYpNttR3tCsf5kFmz/8=;
 b=CZvvj8E1rwnmcbsDk/0o8PLx1CYGaVPEv3AwFwCipsQ02Z1rXZoItD89Jl/ps3YVKD
 +8DyrjPo1AJW1Jx/r4XIY7vNn8xWxThtsGmfvJvMi/Kt8Ty9WDkFbePXe/3RhDhjC8rv
 KKjSYDO8vMZORfddp4jNNSTlbSXUTKnxJtx1I8/JYV4xBsGUHD7HMHdGFFznAWeRS92e
 WVz/vWu6qW7A19u/0Kf1oIeWR/fI/DwFgO8FGMFH1uLyY3KqrQu3JyZhSa48+inbVvmT
 rHLg663niQzeI8nk/gUybAPy8NZW29NdPGjyR9NPKu3hp0bRk2fDg4T6pXC6TAWFJuTc
 S3cQ==
X-Gm-Message-State: AOAM532m9hj6Kn3ycO2iOiVJxgVQ2ZZy4G+Y/oBIjuSpVXKiQZ+KTWaO
 zKvwJ4sZ/UWzojggjR1m0EqHmABcol4=
X-Google-Smtp-Source: ABdhPJzthOoRVhYBVewfdJ5SzxIvoMQCudwx3jqR+BRb0cS7J1Aphov0/3GbpoYqe8QCK8ssEDuSNA==
X-Received: by 2002:a5d:4704:: with SMTP id y4mr670512wrq.358.1610058397783;
 Thu, 07 Jan 2021 14:26:37 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id c20sm9452590wmb.38.2021.01.07.14.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:26:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/66] target/mips: Extract msa_translate_init() from
 mips_tcg_init()
Date: Thu,  7 Jan 2021 23:22:30 +0100
Message-Id: <20210107222253.20382-44-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The msa_wr_d[] registers are only initialized/used by MSA.

They are declared static. We want to move them to the new
'msa_translate.c' unit in few commits, without having to
declare them global (with extern).

Extract first the logic initialization of the MSA registers
from the generic initialization. We will later move this
function along with the MSA registers to the new C unit.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20201208003702.4088927-8-f4bug@amsat.org>
---
 target/mips/translate.h |  3 +++
 target/mips/translate.c | 33 +++++++++++++++++++--------------
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 402bc5e8846..b9cd315c7f4 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -162,4 +162,7 @@ extern TCGv bcond;
         }                                                                     \
     } while (0)
 
+/* MSA */
+void msa_translate_init(void);
+
 #endif
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 30354fee828..bb9420b9f7f 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31551,6 +31551,24 @@ void mips_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
+void msa_translate_init(void)
+{
+    int i;
+
+    for (i = 0; i < 32; i++) {
+        int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
+
+        /*
+         * The MSA vector registers are mapped on the
+         * scalar floating-point unit (FPU) registers.
+         */
+        msa_wr_d[i * 2] = fpu_f64[i];
+        off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[1]);
+        msa_wr_d[i * 2 + 1] =
+                tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2 + 1]);
+    }
+}
+
 void mips_tcg_init(void)
 {
     int i;
@@ -31566,20 +31584,7 @@ void mips_tcg_init(void)
 
         fpu_f64[i] = tcg_global_mem_new_i64(cpu_env, off, fregnames[i]);
     }
-    /* MSA */
-    for (i = 0; i < 32; i++) {
-        int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
-
-        /*
-         * The MSA vector registers are mapped on the
-         * scalar floating-point unit (FPU) registers.
-         */
-        msa_wr_d[i * 2] = fpu_f64[i];
-        off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[1]);
-        msa_wr_d[i * 2 + 1] =
-                tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2 + 1]);
-    }
-
+    msa_translate_init();
     cpu_PC = tcg_global_mem_new(cpu_env,
                                 offsetof(CPUMIPSState, active_tc.PC), "PC");
     for (i = 0; i < MIPS_DSP_ACC; i++) {
-- 
2.26.2


