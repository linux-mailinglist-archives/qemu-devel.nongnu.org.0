Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959B63D0938
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:51:40 +0200 (CEST)
Received: from localhost ([::1]:37138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m664x-0001ju-Jx
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vj-000567-TW
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:08 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:46955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vh-0005PF-76
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:07 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 g22-20020a17090a5796b02901763aca3df6so442863pji.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=afuaIGxukxdg3kFBtbeR3uAcd4no5gGCD1NH3Ez0XYE=;
 b=gwxPpNUeIygQY+TmfIewuTzRvomSGJZ1ismo1DWEhElVpbI6vd54UHlWmEsmItSAxu
 p9VyLxgUENKcTL7cClYJSr6tKZT7qfvfIuSzmvGMGDG0nv2rt0LPHFM7j931oTk8iHG3
 P++0H4cl4gcElzXbpo/L/1Wo07RNcqUVLf3z23g/UkMUuuSxtiDeaE9jjEUZj1UpTahC
 p52C0y9mCpDj6R0YA2T4ipuHRk9ipMFExihT5iN5kVBICOOs5DxidlC2kCEA3oFpwyGS
 NYDzsgL3lUp3AogKZRY9Us9w7EH8X/K4mYPM3NBPIZSNmTV26PkfeGPTFN6QVS5VbXQQ
 sNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=afuaIGxukxdg3kFBtbeR3uAcd4no5gGCD1NH3Ez0XYE=;
 b=m9GbCgfYYBfHF3wswJP9NX5+Z7/Ic5k1i/V4A7i6IDmjm2xgv9QLA5oj2VJ6qA3Ylh
 oatVGK0FauoAZ+Z+WC6OqMn+pmgxjjZg/KVQQQvOa6WKll3cPwusmYsSXS8wVnT6Y4Vm
 WNLQWgnKRaEz42gQl84ELNOy7Utpj1mSjSp7Td3lqcDH6rEPUTk8kjfQo5x8gQ5Chcq5
 j29QU2SlbkqMaKwrcAHzJr46vJiCGTk9B3/F+YZhGwrQNa65Qdg+bhXU0Cb54vwALNtU
 yU8jE/co06BG2sDUSiDtB61+o0rSyapLkP4H9mubB/pmS/CUEUkEujiVq7V57hmyWpKI
 Me/w==
X-Gm-Message-State: AOAM53319jceu+YgAQzRDlp+Y6W5oa04sUQItF4r6Yj30D2CMeSTACkB
 mvGKnT2f7PnGjrshWguDKfRw44AWHzMEJQ==
X-Google-Smtp-Source: ABdhPJz/2iiXFzC0qoHWsNNNsWsAVd/j1ZEOBd8ok243LQerKgHblAjrwcdTzB2jfLSrjOuhi/TLQw==
X-Received: by 2002:a17:902:e5cd:b029:12b:8d80:afc1 with SMTP id
 u13-20020a170902e5cdb029012b8d80afc1mr10169747plf.55.1626849723595; 
 Tue, 20 Jul 2021 23:42:03 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 05/23] target/hexagon: Drop checks for
 singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:37 -1000
Message-Id: <20210721064155.645508-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/translate.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 54fdcaa5e8..606fae6b06 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -71,11 +71,7 @@ static void gen_end_tb(DisasContext *ctx)
 {
     gen_exec_counters(ctx);
     tcg_gen_mov_tl(hex_gpr[HEX_REG_PC], hex_next_PC);
-    if (ctx->base.singlestep_enabled) {
-        gen_exception_raw(EXCP_DEBUG);
-    } else {
-        tcg_gen_exit_tb(NULL, 0);
-    }
+    tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -591,11 +587,7 @@ static void hexagon_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     case DISAS_TOO_MANY:
         gen_exec_counters(ctx);
         tcg_gen_movi_tl(hex_gpr[HEX_REG_PC], ctx->base.pc_next);
-        if (ctx->base.singlestep_enabled) {
-            gen_exception_raw(EXCP_DEBUG);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+        tcg_gen_exit_tb(NULL, 0);
         break;
     case DISAS_NORETURN:
         break;
-- 
2.25.1


