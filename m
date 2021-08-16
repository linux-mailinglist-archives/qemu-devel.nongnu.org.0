Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41E83EDED4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 22:53:59 +0200 (CEST)
Received: from localhost ([::1]:52964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFjcM-00030x-Ux
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 16:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFjaH-0000E8-Nt
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:51:49 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFjaF-00034m-Ay
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:51:49 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 c129-20020a1c35870000b02902e6b6135279so791506wma.0
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 13:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pOcKeX6ZT7d2KDzm2dL41WJyOOGp0Wbhe9wsUhWszh8=;
 b=uT0a0B9VwcpZ1sIkrkncDmlkCtDdWui9fUzPJUNtSQVpYCUZZp7xejJa0+GojDb4R+
 9EHINpy3ozObpWs3OYRBMLG2jRD1ag2KJ9BL5KJYLiLVpryit5boKgvpi8ErOy1T7ecx
 wTPsUXWvSpZPb6klul+VUd8tnz30l2bwSw8th/wA4zP3ptkvG9aJGkkTpCyIChMfUn2P
 qkxEYqFOctupYxvUJiFlZzgPLdNuj5JWfSV63m3YATvClQ53KhGKn9OWZWG4g9Frzuzv
 Dwcw/CBHKfpmoP7XtHZ2TH3HJyLrqa3PoH5fWau+fJneKQy62fYRwEFAN1XHKKbzQHx6
 a0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pOcKeX6ZT7d2KDzm2dL41WJyOOGp0Wbhe9wsUhWszh8=;
 b=s0JO7YCgkWeZfHh320OWrUNuU8SxWjbtiIRCXF+YW9Vsz/BDeXa5/nZxIWAlLmdYRn
 gm0xiO4UyD3P4b3jneluJ2MQhEMY/ByjLsXtL0k/PHpbHqAQVeyrtauRTZ8UO3XR1R/G
 NHQw6cJsRzhHbpEYYPW0NtXFJLd0jevHFkQPTxvtITDA1Hg4sTZWnLe1hZTSKpMR7R1p
 TEziluh+5DV4BLvPkfb1s3T1CTI1KR3NhSqJsIJIZarCdm7CsZDCwy1E0vP3RWYcpSTd
 dHRVKwgxJAqVxUq0LtRc6iOiYO/0TSMcLiN6oCF+A1gPZciTlDEgs3edaxyD0GY5i6lP
 Tzbg==
X-Gm-Message-State: AOAM531JxS3ppbo2/ipeOSofxzMjv7GC8LoOMBC6z3XwImcyKmIw8OEH
 kMrA0lwRZrkVX+gN0H1f5dArtQ7qEdI=
X-Google-Smtp-Source: ABdhPJyPsVqnOwJeHdtK7E4FmwgrEbxWQ8U2AqYwvA4/PyaUhJZ7a6nuiUapDS4Xi0x5XU+T3BB9FA==
X-Received: by 2002:a05:600c:4fc6:: with SMTP id
 o6mr104610wmq.122.1629147105796; 
 Mon, 16 Aug 2021 13:51:45 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 g21sm253625wmk.8.2021.08.16.13.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 13:51:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] target/mips: Inline gen_helper_0e0i()
Date: Mon, 16 Aug 2021 22:51:05 +0200
Message-Id: <20210816205107.2051495-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816205107.2051495-1-f4bug@amsat.org>
References: <20210816205107.2051495-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gen_helper_0e0i() is one-line long and is only used twice:
simply inline it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index db7fc75d937..c515a337ebc 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1213,10 +1213,6 @@ TCGv_i64 fpu_f64[32];
 
 #include "exec/gen-icount.h"
 
-#define gen_helper_0e0i(name, arg) do {                           \
-    gen_helper_##name(cpu_env, tcg_constant_i32(arg));            \
-    } while (0)
-
 #define gen_helper_0e1i(name, arg1, arg2) do {                    \
     gen_helper_##name(cpu_env, arg1, tcg_constant_i32(arg2));     \
     } while (0)
@@ -1378,7 +1374,7 @@ void generate_exception_err(DisasContext *ctx, int excp, int err)
 
 void generate_exception(DisasContext *ctx, int excp)
 {
-    gen_helper_0e0i(raise_exception, excp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
 }
 
 void generate_exception_end(DisasContext *ctx, int excp)
@@ -14188,7 +14184,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         MIPS_INVAL("PMON / selsl");
         gen_reserved_instruction(ctx);
 #else
-        gen_helper_0e0i(pmon, sa);
+        gen_helper_pmon(cpu_env, tcg_constant_i32(sa));
 #endif
         break;
     case OPC_SYSCALL:
-- 
2.31.1


