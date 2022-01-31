Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346414A500E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:23:31 +0100 (CET)
Received: from localhost ([::1]:49872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdD0-0004UK-A5
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:23:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnf-0004vd-F7
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:19 -0500
Received: from [2607:f8b0:4864:20::d30] (port=36668
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002gN-Eb
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:19 -0500
Received: by mail-io1-xd30.google.com with SMTP id h7so18428264iof.3
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cJUtiOr7bO9JD4Wqr53h0+Q8HUYGQ4WMAMmhjYNlvEg=;
 b=J9s/pRw9Sp+CetKctX74jNUIt2N/uz6newjRSYr/uHC1IhZhiuu9tyX/NqfQAyXpV+
 9P2KyE6Pz7Lm7yQ3LBhuwd/lj6dgNgPX+biK2WkTVnL2a1PCn1ZMINQ44v/M7NZ5/DUd
 MmEtQAnK0T4vV3CcDzhCa3XoAOJuBPUvh6tjLzHHLVsOV5B2/y39ixc2EvWLnHnBAG8O
 tYYAbygVgOcOgZ+Y4lbNza4semw3bbFUPq5+aQiVIL31z+vtB0NHYJAjBtUaacGh01oT
 RTccDJBCKqUzFLdQRUFBHdwZ5H8NXQChKzZI3nm1JhRCMgUENdniZhzNDzsqONU1GSmF
 BI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cJUtiOr7bO9JD4Wqr53h0+Q8HUYGQ4WMAMmhjYNlvEg=;
 b=BrwIf2SscZWliQeZ4wkSWPewXGAG/NnTgqGN8FcPY1Jo0ZtpILxS/s41gNfR9JlfyE
 NpRVhZ8l26fJ0N67691w6+H/HGrfKWgBDVIVSou4CZBTYg8kjkbymMj4qvZutUXCCHCH
 5MV08LMjFORer4NNIj8jXWdBjyb7qY8VTodtoktCE4hcpKXmfN+LxnKaLAQnpEbMcfO0
 XGQP2FKUR/K3eRcdNagqrYQfKuK/UEegIPXgvz9sB6RLxIvJUFZslc+sYMkfmxIxgi6W
 LW69FMzgxtc27cWQ1R7Mp37gf83GrfUzP6zgEUjrMuSEWPHMMcUZU7esyzBsG4MO+orQ
 3kbw==
X-Gm-Message-State: AOAM531qHXn6HT7Fgr0ueS7FRW3q6a2Qny8vJiUVYU+epo4hYurMM29l
 qiM2Sa7U2q3+U155M2X6omDibQ9Z6UF76w==
X-Google-Smtp-Source: ABdhPJwGIoPNCRQ/KF9ds6Xm6fJbzDuEf3hYoJTds+0eflOnl8MWD7rd2QShKo6lZ7xsojpBL/dJUg==
X-Received: by 2002:a05:6602:2b13:: with SMTP id
 p19mr2310147iov.72.1643659030073; 
 Mon, 31 Jan 2022 11:57:10 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:57:09 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 39/40] bsd-user: Rename arg name for target_cpu_reset to env
Date: Mon, 31 Jan 2022 12:56:35 -0700
Message-Id: <20220131195636.31991-40-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename the parameter name for target_cpu_reset's CPUArchState * arg from
cpu to env.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h    | 2 +-
 bsd-user/i386/target_arch_cpu.h   | 4 ++--
 bsd-user/x86_64/target_arch_cpu.h | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 2b395d5c97f..b087db48fa4 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -213,7 +213,7 @@ static inline void target_cpu_clone_regs(CPUARMState *env, target_ulong newsp)
     env->regs[0] = 0;
 }
 
-static inline void target_cpu_reset(CPUArchState *cpu)
+static inline void target_cpu_reset(CPUArchState *env)
 {
 }
 
diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_cpu.h
index 472a96689fc..3cbf69d8af2 100644
--- a/bsd-user/i386/target_arch_cpu.h
+++ b/bsd-user/i386/target_arch_cpu.h
@@ -200,9 +200,9 @@ static inline void target_cpu_clone_regs(CPUX86State *env, target_ulong newsp)
     env->regs[R_EAX] = 0;
 }
 
-static inline void target_cpu_reset(CPUArchState *cpu)
+static inline void target_cpu_reset(CPUArchState *env)
 {
-    cpu_reset(env_cpu(cpu));
+    cpu_reset(env_cpu(env));
 }
 
 #endif /* ! _TARGET_ARCH_CPU_H_ */
diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
index 14def48adb5..0a9c0f08946 100644
--- a/bsd-user/x86_64/target_arch_cpu.h
+++ b/bsd-user/x86_64/target_arch_cpu.h
@@ -238,9 +238,9 @@ static inline void target_cpu_clone_regs(CPUX86State *env, target_ulong newsp)
     env->regs[R_EAX] = 0;
 }
 
-static inline void target_cpu_reset(CPUArchState *cpu)
+static inline void target_cpu_reset(CPUArchState *env)
 {
-    cpu_reset(env_cpu(cpu));
+    cpu_reset(env_cpu(env));
 }
 
 #endif /* ! _TARGET_ARCH_CPU_H_ */
-- 
2.33.1


