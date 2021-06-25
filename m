Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA8F3B4115
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 12:03:41 +0200 (CEST)
Received: from localhost ([::1]:59034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwigW-0000LA-Ug
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 06:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4M-000555-3l
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:14 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:47088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4K-0001vC-Gi
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:13 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 v20-20020a05600c2154b02901dcefb16af0so5379492wml.5
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ehB0qAlihF7k4LAF1LEURlWlaeE5Zj9aqJsWbLM6/nM=;
 b=ns3tbLZTFCaF9gWaI03iDv/PVe6/5NCRli4xXhMc7lOYevRj5WaY7CtWsjU/ZXAH1A
 lN2bUwMGqeXYTfh+8+/l5vRL7oAuIqd556k7jolMbJsyPHxnc7ijvP9DXnihQ4WryQSH
 QGR9OuvPkld1hui64SckdP+yljYRa6RISv09cQldWfDqfdzu7nSOpyRE6Ps3/OsanSia
 bxBxiqGO5TLwAugALsT/2h8SqkcKd7nW3nhQ1mmf/o5oDjGuFHmDXqm8llvxc7pmnk14
 mcRvRCFM1Jvfz1ZZDkL4WtfPoZVqLpIgGGpopWdeNFn+g7Nfzse/62+sleVMOgwhX5q/
 Pszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ehB0qAlihF7k4LAF1LEURlWlaeE5Zj9aqJsWbLM6/nM=;
 b=mRVYuNORMVn7GHbuQ6zQ+pLi325jFb0x4eXYUzZQMmzITSb717I2eDFA3mRv8gf/LN
 ZZ0sIQHalLO2kjJB6XRhNSMnDz6q0L7NtJFL9ex5yOhIjN+L7XQmIVKMBVyrLHUhtZRp
 paPBvJ6C4a4GZTbUQsdy3OYfdZm3+h7xuCTzNU8pU4l2KnO0MVD84i4RmPBlje/bjI/y
 eUs5QAXuFCHBuKbvFwXxyWEGjDcQIzGmqUnRg//TguVVAHeCtEJljMCDjnH2MAOimPCl
 kSQV17ifTRInQBiX3ZQ9IzZGw0C5ynInifGSV4IMXb722VPP3z0ddhETqwlMtQtkxErf
 n0Pg==
X-Gm-Message-State: AOAM533gi5fvPVOBpOTAdDDvp1yI07Zc43JanVmeM9oL30qT3Qkz5Udn
 DlfAlTF/Uf3dKQGs805LKL1gSVve6mK8xw==
X-Google-Smtp-Source: ABdhPJzB2W3Uyr2eL2r7hWMVCVhMoQrkt+kdKsVB+j/lkMA4/Fi+Zl3WKOBUP0QFMk7QEZvePhCFsQ==
X-Received: by 2002:a05:600c:4111:: with SMTP id
 j17mr9360772wmi.86.1624613051120; 
 Fri, 25 Jun 2021 02:24:11 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m18sm5450062wmq.45.2021.06.25.02.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:24:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/15] target/mips: Restrict some system specific declarations
 to sysemu
Date: Fri, 25 Jun 2021 11:23:22 +0200
Message-Id: <20210625092329.1529100-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625092329.1529100-1-f4bug@amsat.org>
References: <20210625092329.1529100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 043715d1e0f ("target/mips: Update ITU to utilize SAARI
and SAAR CP0 registers") declared itc_reconfigure() in public
namespace, while it is restricted to system emulation.

Similarly commit 5679479b9a1 ("target/mips: Move CP0 helpers
to sysemu/cp0.c") restricted cpu_mips_soft_irq() definition to
system emulation, but forgot to restrict its declaration.

To avoid polluting user-mode emulation with these declarations,
restrict them to sysemu. Also restrict the sysemu ITU/ITC/IRQ
fields from CPUMIPSState.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210617174323.2900831-6-f4bug@amsat.org>
---
 target/mips/cpu.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 075c24abdad..1dfe69c6c0c 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1152,13 +1152,13 @@ struct CPUMIPSState {
     CPUMIPSMVPContext *mvp;
 #if !defined(CONFIG_USER_ONLY)
     CPUMIPSTLBContext *tlb;
+    void *irq[8];
+    struct MIPSITUState *itu;
+    MemoryRegion *itc_tag; /* ITC Configuration Tags */
 #endif
 
     const mips_def_t *cpu_model;
-    void *irq[8];
     QEMUTimer *timer; /* Internal timer */
-    struct MIPSITUState *itu;
-    MemoryRegion *itc_tag; /* ITC Configuration Tags */
     target_ulong exception_base; /* ExceptionBase input to the core */
     uint64_t cp0_count_ns; /* CP0_Count clock period (in nanoseconds) */
 };
@@ -1316,12 +1316,16 @@ uint64_t cpu_mips_phys_to_kseg1(void *opaque, uint64_t addr);
 bool mips_um_ksegs_enabled(void);
 void mips_um_ksegs_enable(void);
 
+#if !defined(CONFIG_USER_ONLY)
+
 /* mips_int.c */
 void cpu_mips_soft_irq(CPUMIPSState *env, int irq, int level);
 
 /* mips_itu.c */
 void itc_reconfigure(struct MIPSITUState *tag);
 
+#endif /* !CONFIG_USER_ONLY */
+
 /* helper.c */
 target_ulong exception_resume_pc(CPUMIPSState *env);
 
-- 
2.31.1


