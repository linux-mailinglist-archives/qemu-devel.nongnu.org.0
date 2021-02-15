Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8249931B6AD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:49:25 +0100 (CET)
Received: from localhost ([::1]:36838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBaVQ-0006Rn-C4
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaPJ-0000He-7c
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:43:05 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaPH-0004S6-EL
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:43:05 -0500
Received: by mail-wm1-x335.google.com with SMTP id o10so3940253wmc.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wuLIrN+cvrv8RPxrfnz+evu3tq4U+UFFBZhfiRYFFq8=;
 b=gbQQUoEmDZXZIdkr6kjQaZetX0hngC4f/0IOE/YjUSShTQO22167ygK1iiOTsS3eJH
 lE58roY7qxP5qrzefDq+/eLC2D0/2aTlQGYT9NPnGNd19JSF8vzNSRGHmvVanw+q1KZi
 2Fbhtxy4fySXAVT4Mj+rlXMZkBbsPhHIKb0afV64QYfdpIn8vH8rK1jCPTUi+V68/ZsX
 Kp0Dfh3IZyacjc5ZlI/G7z3zNDQRPpoikEpsYv76JwfrznssGcPT/SVi3q3JG3P7K9Gn
 nG36RvfwJi54rn87K7Zjwyo2S3OlUJqr/5WYNGOsJaz7PFA/uDubzltwcs2umAs129hz
 lhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wuLIrN+cvrv8RPxrfnz+evu3tq4U+UFFBZhfiRYFFq8=;
 b=D8Su2YUA1gd4CRMgJ9rtpQuoGykKUNlZW22ng1aKIRgDd6/oZrdJYLLYxic+lxkh1w
 MgGjzyta/j4weQks+mFecgGGOUic3yK6wtOV41SPlfU2281zGOQIOLRQxLYokEkaErvv
 /u4wniqEfQuUfPRhlYOTxTeu30cd5KvL3V3/OaWGSXY4rHWQjVJRrhaC5qLHLW6zW50q
 Ddb7MTvwBhNY7X6VhzdgzIWVQRkry5oN25/FLDfa7koL1OMkF4c/iPXC1e9Btc3xkBkD
 3fmvlrXjukYlkn1QtmGqvk5shXXdUvFtpibJbOuIzu1RhCSqL6VBMZQyQuIQbjHRjy6s
 l9Kg==
X-Gm-Message-State: AOAM530F0P6uDzLWckn2WWMR9JlleqXP8Gj5UxwBX99NYYxOcUGPKVo3
 se9kBfNRkKhjIFJBZOGXX1OJhg==
X-Google-Smtp-Source: ABdhPJwu/6zLB+BurHQZEaRuBAYWAUlbiPMWtdffrrAoDf7pxs+5iS8+u2DwWVbdyZhWlz3wP4Sw9A==
X-Received: by 2002:a7b:ca49:: with SMTP id m9mr1512263wml.53.1613382182081;
 Mon, 15 Feb 2021 01:43:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c18sm63693952wmk.0.2021.02.15.01.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:42:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1ABDB1FF9B;
 Mon, 15 Feb 2021 09:42:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 12/15] target/ppc: Drop use of gdb_get_float64() and ldfq_p()
Date: Mon, 15 Feb 2021 09:42:41 +0000
Message-Id: <20210215094244.12716-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215094244.12716-1-alex.bennee@linaro.org>
References: <20210215094244.12716-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20210208113428.7181-4-peter.maydell@linaro.org>
Message-Id: <20210211122750.22645-13-alex.bennee@linaro.org>

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


