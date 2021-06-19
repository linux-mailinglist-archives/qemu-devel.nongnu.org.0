Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1123ADB3D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:17:34 +0200 (CEST)
Received: from localhost ([::1]:33602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufXB-0003dJ-Ep
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUg-0000dA-Vz
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:14:59 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:43613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUe-0002D4-AD
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:14:58 -0400
Received: by mail-pl1-x631.google.com with SMTP id v12so6328953plo.10
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+jwIdOBO2HuauixyPD0ovcZT3pv5ECKgnsaAtql7n/I=;
 b=amfjWPW9I9KgJtRnMC3EcVGWoxLVItHMgGzHgTvjVV3rlAy0tfDM1Z2+qfMYhya6IU
 6VosD7T/K/rjT6zQ3aiWrjO0peRmIu56dGwBJWl+Bq4opnTKaqjibrTzeMkSts8/4Er/
 Sdp5L2nQUzpNd1NQFBx+M+0rRi7ME8PyxI116R3TuMae8S7pWc0MwlrN8wpH1IpRPYvH
 nXls+EQQW/vjxf89bcMTf1c4nlke4DZbhH+DTBXxeFJGfDLRT9dvaz1e4KedZMto4URH
 9OI99OsHsVXEgCJKf2Es1t24q3uVaUitHDHtWi4iHwUAIPVaov5NhcrcS9njrPCvvqUR
 UTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+jwIdOBO2HuauixyPD0ovcZT3pv5ECKgnsaAtql7n/I=;
 b=r0gZxjo+3cFyHoCOZxQbo0eg9doYkc1asxfbNcF2Zki4e3g70Lgy3/aGilYVjMgHMg
 5MIdlVhnblPw9EjYzRNHwcPRN9KMf9nlAt1fb3tl9eK/FQZo+zvIeC3kIPgY6GAtgE0k
 dDutAvrAILhMwUnLgZ7Ug/595HY7dKmh4feOABF5SwrK/l3m5Q5+5pEL3q9hlvXXbtoJ
 3v++QheXfpptXrLaNRKsLue42zqBIszGjUM2dPD1brpGI1oydFxZXnabxFyiME61dNrD
 LUVfMxsVQ7eNzSsLQ8h7TqZawsXFRrUGGoWlFgh5PBplG20V4EJendE4JeMHYqsfPkgk
 KStg==
X-Gm-Message-State: AOAM532JKt+diw4EF7A/GlWczU81DpcihOGDbTmETLjuapjvycjOLahi
 hdROL4+8m+jhVaAiVPPH6c0K1eB/8XP0Vw==
X-Google-Smtp-Source: ABdhPJxE6opr3bb5hwtQvZrLlE2rApSAz7JiKwXFSWw3u+kY2LmXW7Sop1vB5BsmyC9/IGyKuUcsDQ==
X-Received: by 2002:a17:90a:4217:: with SMTP id
 o23mr28795487pjg.110.1624126495087; 
 Sat, 19 Jun 2021 11:14:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:14:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/33] accel/tcg/plugin-gen: Drop inline markers
Date: Sat, 19 Jun 2021 11:14:22 -0700
Message-Id: <20210619181452.877683-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let the compiler decide on inlining.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 7627225aef..48bd2f36f0 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -160,9 +160,8 @@ static void gen_empty_mem_helper(void)
     tcg_temp_free_ptr(ptr);
 }
 
-static inline
-void gen_plugin_cb_start(enum plugin_gen_from from,
-                         enum plugin_gen_cb type, unsigned wr)
+static void gen_plugin_cb_start(enum plugin_gen_from from,
+                                enum plugin_gen_cb type, unsigned wr)
 {
     TCGOp *op;
 
@@ -179,7 +178,7 @@ static void gen_wrapped(enum plugin_gen_from from,
     tcg_gen_plugin_cb_end();
 }
 
-static inline void plugin_gen_empty_callback(enum plugin_gen_from from)
+static void plugin_gen_empty_callback(enum plugin_gen_from from)
 {
     switch (from) {
     case PLUGIN_GEN_AFTER_INSN:
@@ -513,9 +512,8 @@ static bool op_rw(const TCGOp *op, const struct qemu_plugin_dyn_cb *cb)
     return !!(cb->rw & (w + 1));
 }
 
-static inline
-void inject_cb_type(const GArray *cbs, TCGOp *begin_op, inject_fn inject,
-                    op_ok_fn ok)
+static void inject_cb_type(const GArray *cbs, TCGOp *begin_op,
+                           inject_fn inject, op_ok_fn ok)
 {
     TCGOp *end_op;
     TCGOp *op;
-- 
2.25.1


