Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA95F43276C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:18:56 +0200 (CEST)
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcY9v-0000jU-P0
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtT-0008Ap-EA
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:55 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:42944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtR-0001lB-Hz
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:54 -0400
Received: by mail-il1-x131.google.com with SMTP id y17so15965319ilb.9
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CIQatE8dg36Pa6PMFl/HPTB8wrbRocW2ZkkMxKhIlVw=;
 b=MUYqkrBlcONTIzoCC/o99WrtyePRFtkZVRtE7obuSTK9t0s0SRJeXPvX0K5dg4ZGa5
 LPGN4jYzjK30WPzTWDcq2SJuV23BFEVV8Q+ScRfob42Q2Z39C7WRapH7yPMmLXM2/+3E
 RMwL38FnNV3zZNpK2laVbFH2+GVoDUx1FNdhrS+mjgHF9ZSf2FDRoKCcBIK2nJQHmaA3
 6ruyqN7+CqPUj9NyocGw/bwJDWSSPav42FP/JV+uDknLAi2bds8U2vLTxSKWjeGYIWA0
 6c4mJfqvXQK4yEQjAkGhlaXjtlpauIZ6pguF2fFHWSqtd6jJIWqLvkaRW5jkDd3psdif
 i+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CIQatE8dg36Pa6PMFl/HPTB8wrbRocW2ZkkMxKhIlVw=;
 b=kvNBqn7g0qCyQSzFnQZ5IwTp45LZnX7RkgRUnGzxkUoFAA9zRIstXTQrYoHa8HCv8R
 sO0DjbL0rUv4XFTuj9SSDjbxiHuxJeqF+ZnstSZ0idFVm+X7bhbkbYzsmuF5Y8M7w8SS
 wHEgSan+5oWRPxNZ4TAzR6TSznj8fKv1ExJcfaU0Ep4AVXvh8oIuPk6ceKIRsaBANHRt
 SOZGszIzrS9axsVsUlSyKdW006Fiap23WGIY4o8JdmENmZnHPJmMcDx7WuBSJL2LpmM6
 3kQJovttDjdtNmXhF3BN6gdGrGgSaGYWLfUEoTKcK02wT9tU2dHE08POdQKgxuSO1aeF
 bCtw==
X-Gm-Message-State: AOAM533dgMjmNl87gTDxw8dznaxXiRNicFOtyObtuDLBZ7XIX7OyqNO8
 hktZctrXRQ0/QYdqd5tjBYm6l+JDK5w7JQ==
X-Google-Smtp-Source: ABdhPJxOvXp8qfkCuvBbGIsSpraho5+nYjPOKt1Pd1Jyr/kIOB6BPckrc52wGsJ+UNumkN3r3NVG9g==
X-Received: by 2002:a92:cd8e:: with SMTP id r14mr14661672ilb.291.1634583711808; 
 Mon, 18 Oct 2021 12:01:51 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:01:50 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 13/23] bsd-user: TARGET_RESET define is unused, remove it
Date: Mon, 18 Oct 2021 13:01:05 -0600
Message-Id: <20211018190115.5365-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/i386/target_arch_cpu.h   | 2 --
 bsd-user/x86_64/target_arch_cpu.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_cpu.h
index 978e8066af..b28602adbb 100644
--- a/bsd-user/i386/target_arch_cpu.h
+++ b/bsd-user/i386/target_arch_cpu.h
@@ -23,8 +23,6 @@
 
 #define TARGET_DEFAULT_CPU_MODEL "qemu32"
 
-#define TARGET_CPU_RESET(cpu)
-
 static inline void target_cpu_init(CPUX86State *env,
         struct target_pt_regs *regs)
 {
diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
index 5f5ee602f9..5172b230f0 100644
--- a/bsd-user/x86_64/target_arch_cpu.h
+++ b/bsd-user/x86_64/target_arch_cpu.h
@@ -23,8 +23,6 @@
 
 #define TARGET_DEFAULT_CPU_MODEL "qemu64"
 
-#define TARGET_CPU_RESET(cpu)
-
 static inline void target_cpu_init(CPUX86State *env,
         struct target_pt_regs *regs)
 {
-- 
2.32.0


