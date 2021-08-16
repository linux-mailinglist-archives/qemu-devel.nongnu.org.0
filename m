Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9FB3EDEE1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 22:58:16 +0200 (CEST)
Received: from localhost ([::1]:36766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFjgV-0002gt-7Q
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 16:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFjaS-0000cb-RE
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:52:00 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFjaQ-0003DC-Bt
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:52:00 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so342113wme.1
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 13:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdZ5zuA1pHnV+y+AJTFvRv79XLVqHrg7+7oNpQDjPU8=;
 b=dLVVrnU0RBwYHrsaWDYR/vMLsV2l0s+w6Z7HN3tzyuCt2TtoFjPjAIYOXfNFvZ6pNx
 dRiXQ2eb9fdBXbPXgcaSBU15v7gTC+eSyJhoAH3lLlJbjG+uKVNS8PVJ13XDPQKveA0R
 n6yQoGJucuIWtZ3dGGiRWZF7dfIv5iuBy+Y/6FIb4GhDQ7+oluNu7RMVpUu09VUMwhMf
 U3UM/1AWH1ZxEsblmkhcfCFAPuZbgsCmt1wD+92tbgtePdBCXFO73atgVOPz3fGo7hhJ
 6J27xeI8ExXkmZEI8QC07pzrapHtx2jTWYQxX9kthQ1/xcKJupVTWXxIDHZ4b5AQ1eEY
 fU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wdZ5zuA1pHnV+y+AJTFvRv79XLVqHrg7+7oNpQDjPU8=;
 b=Q79Gk499SyU4w72+YCZywLtanKHhIRsDX1P8oOLEdpD3+1a/4gSeepMD0KZHe2v04p
 Rx9TifO4TnTd7tYeyDKmPsp7OL29peG5yXShe75no+qptAfTPJruV06qdunmaLQD8oPR
 aQqvecG1tmZB39W3zo7WoiXUcpGoNbDJNMstwXugRaYbTvtWiiFdyBSCPnEQfXGkVZTj
 JrJnYpr2bffZygQ+UpzUtv43V5AA6hIZOdzgEEnvsHnoV4qjm9M4l0C+VR1uruSumtiN
 Sp4e+OLnbBHQUhqhJsZiGWTVOGt3GqfAWosdxoeopNZuu5lXUF4I6ooxtGQ3eqYQUlAG
 pbEw==
X-Gm-Message-State: AOAM533YJPy0m4udTnp8OKY+qmMsUz/P7sgxgeM+3IXbh3XciM6IzVR6
 TKpLxHKkKmAVw7ArEFDt9CzKo9obdlA=
X-Google-Smtp-Source: ABdhPJy5wFMrItlBfs4yyjygWrGY5PcjRKtnfTdy5SZhHMmgipwdOph8Lh8uM60W5QyKf8zdbWDWMA==
X-Received: by 2002:a05:600c:364b:: with SMTP id
 y11mr50057wmq.11.1629147116790; 
 Mon, 16 Aug 2021 13:51:56 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 o10sm309778wrq.51.2021.08.16.13.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 13:51:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] target/mips: Define gen_helper() macros in translate.h
Date: Mon, 16 Aug 2021 22:51:07 +0200
Message-Id: <20210816205107.2051495-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816205107.2051495-1-f4bug@amsat.org>
References: <20210816205107.2051495-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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

To be able to split some code calling the gen_helper() macros
out of the huge translate.c, we need to define them in the
'translate.h' local header.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Will be used in following series. Can resend there as first
patch.
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


