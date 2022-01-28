Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9834A04B7
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 01:01:22 +0100 (CET)
Received: from localhost ([::1]:59956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDbBB-0007Ga-Qx
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 19:01:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafy-0000qO-Se
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:08 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=39665
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafi-0001bQ-Qd
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:05 -0500
Received: by mail-io1-xd2a.google.com with SMTP id c188so9691291iof.6
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cJUtiOr7bO9JD4Wqr53h0+Q8HUYGQ4WMAMmhjYNlvEg=;
 b=e7/hBEWrvW4iU2OGdnmnlVIgq3l0azXfD2Zw81gyn/5KVqJUcdWzHVPlXrCN3z8zMd
 kWhnFSLMaU8yrNil7yhGbhLSIJc7HEGzw69FKgjmRIgAFC3Jo1juEiAlJt4mh+1lr2qZ
 NtemYUACsAEq6XJcp9JK0/i+57g/REfFQDsylYY30p3FAt5mlEfOp5TefRlrGPVglhD+
 XuxTNjPar17hdGf90uomyZBggRn++ESoNP6dFL39xjd9AMN79IFZgjC8+wGrw8+A7wuU
 g3gmZOLn6Gj4tGu1lgrt9Ne3pPTpfQO9aP6kTWkRwofAw24gGFJO3GVWincsw4S7CfOf
 k5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cJUtiOr7bO9JD4Wqr53h0+Q8HUYGQ4WMAMmhjYNlvEg=;
 b=7RHQCzm8OyXjr70RfPA6QLwVJKIy/oh//BreX9pUOx7b20fL2PlPMA4nJ5yfxxJyhA
 OoCbM1UbE2RmaCTgaI8CWNAkoge66hLo7z4cs0jauTwnCEBB6+CwleANyffySktR04CR
 bUzNLFdYmxO7/LOGm0zjoiJW8HU/QN5Bmid/ppBtDUptRD+vq43CQinzvOWoqNfvaQmg
 mZx6W9pyj4//yl6e3ovlCWjrSopGqzwfnYnNPVu6CmShEPk7jDZr7evQKMIQb67lOBmL
 vAsZnzCfYvAxbzu7lFlWwVGXbnOF6F6Lwl8EnVwIF/MJg5dxrSwVrMoce/pzdXf7u+OS
 sjrA==
X-Gm-Message-State: AOAM5321j1g8Kt31BP5m0T77XL48Ark6AT8UTyd8YAAFqF9yRIloc+WN
 GZ6TqI8QUii41DFWIYhCCKeNt9HD+RhIAQ==
X-Google-Smtp-Source: ABdhPJzwg1/qf660rH7snJUty94BONM0l4+wget3S8bWcGgcBU51qUOB+NgMHYe8cnl8t5C/nd4wTQ==
X-Received: by 2002:a05:6638:358b:: with SMTP id
 v11mr3452895jal.224.1643412525808; 
 Fri, 28 Jan 2022 15:28:45 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:45 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 39/40] bsd-user: Rename arg name for target_cpu_reset to env
Date: Fri, 28 Jan 2022 16:28:04 -0700
Message-Id: <20220128232805.86191-40-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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


