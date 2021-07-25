Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A113D4D59
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 14:26:15 +0200 (CEST)
Received: from localhost ([::1]:39138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7dCw-0003D0-99
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 08:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dBA-0000Il-L7
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:24 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dB8-0003lx-RV
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:24 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c16so2818742plh.7
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 05:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xtzZz/U5JKEQZUS0677OwXuHCf+mZlqk4XuZ1mS9HA8=;
 b=TnEvzqs2ZhBy3RuFm60C8WIKal1UhxIL5I9i43NH50fgBJ1rPrVhV506jBDPM3e8aH
 uyGNLqYy+R8QCRyQajbi3EHwX2wY5VU0Z9e/80f/cAWytfJubBn3juZTgkDD+2QmQbV5
 ivjjkQwJNN0kuCl+ZFoZayKLsp5Erds4Ju6cQjwoIrqNsKH5qvKzxDPPamgXPJXaOsaj
 WWDCGUhPRzR/JBbv/U/8X59v2UjA4ViOlAmR3ULvqRU8N6NtON66UCBUrWWrYEWbD/9P
 IydInGx8oGfGsygnBgZt+98+kgRPsVIto/D27rjNMlZrGcKskGOVufpFA8SoJJyuSEjG
 ywdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xtzZz/U5JKEQZUS0677OwXuHCf+mZlqk4XuZ1mS9HA8=;
 b=jqq7gQ7Uhjmk8/g+sJpNHMl9ArhGDdHaFDGG9fENrNkQEeeD5p057hccEhI2xreaf0
 xULmY48tUMKz9YkqO1PCsTKxla6SOQyAfVr4Bz+YRq+IDSHD5O1tZ20gLP06DyhzfrW7
 bUjL49LvqS+a7vllTSYbA0I+Bpb8T7K6U3d33bH0KmX5fIPzu34UlLsYpSpiKTg9R2Z9
 a4LoSLtyTllkl6NCCn3HysWHnd5yjVxSMCz81Q0vgHoLaox53sBc5W2gteQ0mOE54Nhz
 moBXoo9PSsG/peYcDaAkCJY39LHCIucLVtkJq0KMzcTyLVJaDQ2jK3dovS0rgWkK/D2H
 cgRQ==
X-Gm-Message-State: AOAM531RJfU3WrV9klezUrsguO5qTFMpR5lC06t+O7QW2h2+vEsuVoUh
 Gkd9NuOEz77Y+/LOHoVIv+vSQ4QfdNz6cg==
X-Google-Smtp-Source: ABdhPJwNFhThOI/ZqVT/G8nfhoWNjTd71R48grLzZVNucOFcCCTO+3rGvfyiOJuXqIvxOkkdMeVS8w==
X-Received: by 2002:a63:4e51:: with SMTP id o17mr13783774pgl.126.1627215861465; 
 Sun, 25 Jul 2021 05:24:21 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id k37sm15005093pgm.84.2021.07.25.05.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 05:24:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1? v2 2/9] accel/tcg: Remove unused variable in cpu_exec
Date: Sun, 25 Jul 2021 02:24:09 -1000
Message-Id: <20210725122416.1391332-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210725122416.1391332-1-richard.henderson@linaro.org>
References: <20210725122416.1391332-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
accel/tcg/cpu-exec.c:783:15: error: variable 'cc' set but not used \
    [-Werror,-Wunused-but-set-variable]

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index fc895cf51e..1c6f684cb0 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -853,7 +853,6 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
 
 int cpu_exec(CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     int ret;
     SyncClocks sc = { 0 };
 
@@ -887,19 +886,14 @@ int cpu_exec(CPUState *cpu)
          * that we support, but is still unfixed in clang:
          *   https://bugs.llvm.org/show_bug.cgi?id=21183
          *
-         * Reload essential local variables here for those compilers.
+         * Reload an essential local variable here for those compilers.
          * Newer versions of gcc would complain about this code (-Wclobbered),
          * so we only perform the workaround for clang.
          */
         cpu = current_cpu;
-        cc = CPU_GET_CLASS(cpu);
 #else
-        /*
-         * Non-buggy compilers preserve these locals; assert that
-         * they have the correct value.
-         */
+        /* Non-buggy compilers preserve this; assert the correct value. */
         g_assert(cpu == current_cpu);
-        g_assert(cc == CPU_GET_CLASS(cpu));
 #endif
 
 #ifndef CONFIG_SOFTMMU
-- 
2.25.1


