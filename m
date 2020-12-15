Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457A02DB6D5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:02:13 +0100 (CET)
Received: from localhost ([::1]:48678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJKe-0006UP-As
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJGu-0002qt-DF
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:20 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:43328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJGs-0003c2-Q4
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:20 -0500
Received: by mail-ed1-x543.google.com with SMTP id q16so22793563edv.10
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gfAK/5l8oepBv1m9fLlqhZZJOh/VztlrVhqk0ziS8jY=;
 b=FdLu6d7skwAkLOlWHhnw6CiK9nTmqSFMQ2+f3bQKkxDBeFfIIsep4RJ4VxOZ3Yy17p
 SGAek2pKHRsx1RZHfY/x/wHRH8f30dESCnX3vmr3QoIk/GXgq/tytDYV8D8tZQHHpEHP
 6sl0NKCEuQJoTlEzGwITjQQI3hnDr8e7FSckAnVzfged+2Dv0dtlSlYKPgLd5FLt2fWf
 icL46mdmQhgYhLDRRRg7AFhiPKLdBTdLWsfb0nEPikLlNnRLt8ANtxLEPeS6IFORnamV
 Bdd+ZmX04Wlh5Fbu/j7W2Cfhz/g6WuGHhj4JYiT4yzvSx92fmBLqgGw3a5ChUkktz1gP
 OXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gfAK/5l8oepBv1m9fLlqhZZJOh/VztlrVhqk0ziS8jY=;
 b=T+RQYOA2uKlyD8Bo+lOr1Sm3TOwZ6SmPnyoSbr/C9sBuP/xQoZqGpJSexPC+PKb4m5
 0uqeWjCyYHL2+y3BGi9nyF+3iQUAcJD9E4idXyNwxoczgQiF1omhuYsEq5qQOsWGq2da
 YxHGjTBlRJrD8+iKRk+n7JIW6GHuA4UJv23iQSzVvv+1vWKd/8HWv4vHSPYsYvZhitPX
 8vqHqgW+uQBRelX/tuVbSED5tNIn8FF3BILs8Rg/HjyGsjcSDY+TW3ILIGOU+n7hbQac
 uM115AcvzUJdNmFLa11L6dgHnZBhupxhQBVbNO6zT4kxoOYemD41VlbBcOGoo2kvTUFP
 7b/A==
X-Gm-Message-State: AOAM533iXRYXd8OknYNgljA1dQleVgqWQnbhZT/VSil9zJPClGcuUOO/
 w8mz0ItsmPHrmQc4nWDr7Qs=
X-Google-Smtp-Source: ABdhPJzMV5ebQ8WKtlqOKKPT4HVLHg+DJtP96dH2LzWIIc/qEDJS0DRMCBuv96y66yLjeOVyXmrpnQ==
X-Received: by 2002:a05:6402:30ac:: with SMTP id
 df12mr32562213edb.175.1608073097456; 
 Tue, 15 Dec 2020 14:58:17 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id g18sm19135013edt.2.2020.12.15.14.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:58:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 03/24] target/mips/cpu: Introduce isa_rel6_available()
 helper
Date: Tue, 15 Dec 2020 23:57:36 +0100
Message-Id: <20201215225757.764263-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x543.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the isa_rel6_available() helper to check if the
CPU supports the Release 6 ISA.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h | 1 +
 target/mips/cpu.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 3ac21d0e9c0..c6a556efad5 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1289,6 +1289,7 @@ int cpu_mips_signal_handler(int host_signum, void *pinfo, void *puc);
 bool cpu_type_supports_cps_smp(const char *cpu_type);
 bool cpu_supports_isa(const CPUMIPSState *env, uint64_t isa_mask);
 bool cpu_type_supports_isa(const char *cpu_type, uint64_t isa);
+bool isa_rel6_available(const CPUMIPSState *env);
 
 /* Check presence of multi-threading ASE implementation */
 static inline bool ase_mt_available(CPUMIPSState *env)
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 4191c0741f4..9f082518076 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -789,6 +789,14 @@ bool cpu_supports_isa(const CPUMIPSState *env, uint64_t isa_mask)
     return (env->cpu_model->insn_flags & isa_mask) != 0;
 }
 
+bool isa_rel6_available(const CPUMIPSState *env)
+{
+    if (TARGET_LONG_BITS == 64) {
+        return cpu_supports_isa(env, ISA_MIPS64R6);
+    }
+    return cpu_supports_isa(env, ISA_MIPS32R6);
+}
+
 bool cpu_type_supports_isa(const char *cpu_type, uint64_t isa)
 {
     const MIPSCPUClass *mcc = MIPS_CPU_CLASS(object_class_by_name(cpu_type));
-- 
2.26.2


