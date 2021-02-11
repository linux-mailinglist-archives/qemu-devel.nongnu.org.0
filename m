Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C20318ACF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:38:13 +0100 (CET)
Received: from localhost ([::1]:45852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABEa-0005dp-AK
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:38:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lABBl-0003Yi-0A
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:35:17 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lABBe-0006qi-Ig
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:35:16 -0500
Received: by mail-wr1-x42a.google.com with SMTP id m13so3967785wro.12
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JuFQ5vAHnDaon6m/CuHXMWN0xMbchoTGcLjdHzV+MRs=;
 b=dcN4mQRnZIohtn5TIUsFsFOWwxvktSNhkuFNhCsqHeEEhXkhWlJtOyWK0JbwqHvmRs
 CrP4RIpEpXqHWbYNcPnc7qnSlaB+E0G2Xqn57YA8asTZD/yfZNFrsiUXdKEl20I5kbZl
 DpoXeIR0qYfPvLAF18oMVKuwxYyOmyUl/pw/HJ5TCtO19ueGoEq3d58z7iLkZEZr8YXK
 weQuHZ4lcluI2z/ien6FX1eWZU5zh2NP3ZDaJ+71VypSC8bBL4YexjHoycwVSn5E7tWt
 PgUTdA7DsKnXl/sAeXyJlyraTuVW6Ju2/+XgzJGoAzmkqMExThFWul0SjgDMYaHFhpk6
 C+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JuFQ5vAHnDaon6m/CuHXMWN0xMbchoTGcLjdHzV+MRs=;
 b=NjXZnx9Qi/2PmqVpdycFgduvhlAg/qrEG/uPT1e3AFWB/J7pvrJgetYJ/dVxIEzxrh
 BPl3FF6JQDwXrNzOmfcVBxXNtjL6fnLaaNioWIMJRyRCowwAoF+Kg8bFHey+bR27jR0k
 SsJvsn8/MvKPtLgsJB2t+3DT7e4mRipBcF5aaRblRcDYtOEFoQV9JTLchx9sf0R8fGvZ
 w+CpnROEJ+EU+s7ZnFqvwjPs7LSq6jfJ7g6gNzGPk/BdM87IjLpckRznKyky3BaUQJn0
 pISKaqCYyfTvnG1xx7pRpbvn5Cl+kMfdV6nG/oseSV+kRTdJkSHhVBh5gyQgR4SSVqAf
 AMyg==
X-Gm-Message-State: AOAM530PwRggBv58uvsXo4dpHZH+2R3BWrOH/Zg+IXbmLMo/8Tyf6Dff
 31fV8hH8clSR3QKr4zaiErAKOQ==
X-Google-Smtp-Source: ABdhPJzR1NXlSMzyyxx7RsYfBO00Bm1WVlqe3agfL/phF/TO7JRd3eAN+A4sfWYg2wcxkxKFYNzMbQ==
X-Received: by 2002:adf:f6c3:: with SMTP id y3mr4295304wrp.24.1613046909204;
 Thu, 11 Feb 2021 04:35:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p10sm642597wrt.69.2021.02.11.04.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:35:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 31FB51FF9B;
 Thu, 11 Feb 2021 12:27:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 12/15] target/ppc: Drop use of gdb_get_float64() and
 ldfq_p()
Date: Thu, 11 Feb 2021 12:27:47 +0000
Message-Id: <20210211122750.22645-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211122750.22645-1-alex.bennee@linaro.org>
References: <20210211122750.22645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, f4bug@amsat.org, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, cota@braap.org,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>, aurelien@aurel32.net,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

We used to make a distinction between 'float64'/'float32' types and
the 'uint64_t'/'uint32_t' types, requiring special conversion
operations to go between them.  We've now dropped this distinction as
unnecessary, and the 'float*' types remain primarily for
documentation purposes when used in places like the function
prototypes of TCG helper functions.

This means that there's no need for a special gdb_get_float64()
function to write a float64 value to the GDB protocol buffer; we can
just use gdb_get_reg64().

Similarly, for reading a value out of the GDB buffer into a float64
we can use ldq_p() and need not use ldfq_p().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210208113428.7181-4-peter.maydell@linaro.org>
---
 target/ppc/gdbstub.c            | 8 ++++----
 target/ppc/translate_init.c.inc | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 01459dd31d..c28319fb97 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -130,7 +130,7 @@ int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n)
         gdb_get_regl(buf, env->gpr[n]);
     } else if (n < 64) {
         /* fprs */
-        gdb_get_float64(buf, *cpu_fpr_ptr(env, n - 32));
+        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n - 32));
     } else {
         switch (n) {
         case 64:
@@ -184,7 +184,7 @@ int ppc_cpu_gdb_read_register_apple(CPUState *cs, GByteArray *buf, int n)
         gdb_get_reg64(buf, env->gpr[n]);
     } else if (n < 64) {
         /* fprs */
-        gdb_get_float64(buf, *cpu_fpr_ptr(env, n - 32));
+        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n - 32));
     } else if (n < 96) {
         /* Altivec */
         gdb_get_reg64(buf, n - 64);
@@ -241,7 +241,7 @@ int ppc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         env->gpr[n] = ldtul_p(mem_buf);
     } else if (n < 64) {
         /* fprs */
-        *cpu_fpr_ptr(env, n - 32) = ldfq_p(mem_buf);
+        *cpu_fpr_ptr(env, n - 32) = ldq_p(mem_buf);
     } else {
         switch (n) {
         case 64:
@@ -291,7 +291,7 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
         env->gpr[n] = ldq_p(mem_buf);
     } else if (n < 64) {
         /* fprs */
-        *cpu_fpr_ptr(env, n - 32) = ldfq_p(mem_buf);
+        *cpu_fpr_ptr(env, n - 32) = ldq_p(mem_buf);
     } else {
         switch (n) {
         case 64 + 32:
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 3ec45cbc19..e7324e85cd 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -9923,7 +9923,7 @@ static int gdb_get_float_reg(CPUPPCState *env, GByteArray *buf, int n)
 {
     uint8_t *mem_buf;
     if (n < 32) {
-        gdb_get_float64(buf, *cpu_fpr_ptr(env, n));
+        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n));
         mem_buf = gdb_get_reg_ptr(buf, 8);
         ppc_maybe_bswap_register(env, mem_buf, 8);
         return 8;
@@ -9941,7 +9941,7 @@ static int gdb_set_float_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
 {
     if (n < 32) {
         ppc_maybe_bswap_register(env, mem_buf, 8);
-        *cpu_fpr_ptr(env, n) = ldfq_p(mem_buf);
+        *cpu_fpr_ptr(env, n) = ldq_p(mem_buf);
         return 8;
     }
     if (n == 32) {
-- 
2.20.1


