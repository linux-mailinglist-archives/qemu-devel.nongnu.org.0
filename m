Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D0D3F75A9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:12:42 +0200 (CEST)
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsht-0005C0-6k
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZb-0002j0-4G
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:04:07 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZV-0002pM-RN
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:04:06 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d26so16007861wrc.0
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qVzI1/8yW4G9P7w0V2waGQ0wzqaHaicg0UPMUVVGu28=;
 b=dYKr67rf4q4Jm9JshJanp0717vE0s5iqRASpel9r9+VeLA7Ho0qT3fOR5+Zklytcp7
 Ug6TJy9R2UvvTuLYCMCQJhwxXc6U0hpdTozuAQbPvYSNG9uceJGIE/Zhui99YQWFIsXZ
 0O6ghL+Mo3UgEYjU1tn39Yj/ZH0IwN8G7d7CuFj9c7zjnzxzeJJh4XgHx71eahKBpSWp
 IFeuflVC5+wlbERqI7S11a4usPLwQglq5114d5MiV6zwgWcrIh19bfet7fGZTrJp9m0m
 63JwqGB1gKB5JQF4JWk050mwiPLBa5sUhYqXhbcnVpKQ5cPnpBadXJbGPRN+Ul+xWVUn
 1a6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qVzI1/8yW4G9P7w0V2waGQ0wzqaHaicg0UPMUVVGu28=;
 b=bVrPF1DMJh6E4lThGa8UZD+uAaXMzKjhVnIuqCF0sEnstieP4IW3oOu0FeebGgyu34
 1aD1fz0vDY5OupbqZLBIWgkD9KNUvAG+lzKj6AxESkWDRDiM5kwJ7P+ZXv0ODZgMhDyf
 uQnmwL925UJU20xXaVBxWm5TGf+Tn/DX/mtSZpq4BFTzFkMRtaQGMUYixcdzIZf9HlOT
 2yHm7KT7iQ5fq408SEI/CwP7iHid1rvPdol4CGpzP8r0OIJ2WuDKiGBp46OQ/0RG6mhs
 cSf67TRg2VoVgly9UyLOs2d5qBC3LgmBNV7sOOWU6Y8G/Vt7YReIlOe1fYCGUZRbE7Hv
 0ecg==
X-Gm-Message-State: AOAM531q+RIcwhNiihXc143aTZ+RdZ4aII6B3lvIbtU0o8uQeCt08CMN
 i1k5kc4a2J/uXj8VeyAubqJIwXEm3uU=
X-Google-Smtp-Source: ABdhPJwmNtnttktXWgOu4bIkfYYeH2mqicUOVt2uTPtHto9SqHHEN4Siql3JYqC+hoz69VsaWqMWUg==
X-Received: by 2002:a5d:4d8c:: with SMTP id b12mr17846115wru.232.1629896640329; 
 Wed, 25 Aug 2021 06:04:00 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 p18sm21326322wrt.13.2021.08.25.06.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:03:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/28] target/mips: Define gen_helper() macros in translate.h
Date: Wed, 25 Aug 2021 15:02:06 +0200
Message-Id: <20210825130211.1542338-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to split some code calling the gen_helper() macros
out of the huge translate.c, we need to define them in the
'translate.h' local header.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210816205107.2051495-9-f4bug@amsat.org>
---
 target/mips/tcg/translate.h | 12 ++++++++++++
 target/mips/tcg/translate.c | 12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index bb0a6b8d74f..eac01a81182 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -113,6 +113,18 @@ enum {
     OPC_BC1TANY4     = (0x01 << 16) | OPC_BC1ANY4,
 };
 
+#define gen_helper_0e1i(name, arg1, arg2) do { \
+    gen_helper_##name(cpu_env, arg1, tcg_constant_i32(arg2)); \
+    } while (0)
+
+#define gen_helper_1e0i(name, ret, arg1) do { \
+    gen_helper_##name(ret, cpu_env, tcg_constant_i32(arg1)); \
+    } while (0)
+
+#define gen_helper_0e2i(name, arg1, arg2, arg3) do { \
+    gen_helper_##name(cpu_env, arg1, arg2, tcg_constant_i32(arg3));\
+    } while (0)
+
 void generate_exception(DisasContext *ctx, int excp);
 void generate_exception_err(DisasContext *ctx, int excp, int err);
 void generate_exception_end(DisasContext *ctx, int excp);
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 93b72c994f2..40cb1fc9508 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1213,18 +1213,6 @@ TCGv_i64 fpu_f64[32];
 
 #include "exec/gen-icount.h"
 
-#define gen_helper_0e1i(name, arg1, arg2) do {                    \
-    gen_helper_##name(cpu_env, arg1, tcg_constant_i32(arg2));     \
-    } while (0)
-
-#define gen_helper_1e0i(name, ret, arg1) do {                     \
-    gen_helper_##name(ret, cpu_env, tcg_constant_i32(arg1));      \
-    } while (0)
-
-#define gen_helper_0e2i(name, arg1, arg2, arg3) do {              \
-    gen_helper_##name(cpu_env, arg1, arg2, tcg_constant_i32(arg3));\
-    } while (0)
-
 #define DISAS_STOP       DISAS_TARGET_0
 #define DISAS_EXIT       DISAS_TARGET_1
 
-- 
2.31.1


