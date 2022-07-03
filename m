Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D1E564674
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:37:38 +0200 (CEST)
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7w2r-0001du-Vm
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vSI-0004x3-VT
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:52 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vSH-0004BZ-3D
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:50 -0400
Received: by mail-pf1-x42b.google.com with SMTP id n12so6441899pfq.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQeBQJaJ2cUJJgh8YFxOAc0hMFwb7DTvcTB5KsIPLmU=;
 b=AIncmNIgsPxl9MXSNLcvQ30eUNuW2juB8Dlnc4+xt8WBn+Pmw3TmvSNncAb/3yXXE8
 lzEmfJud6SW9Nkg1hUK8mO2M9jf3P+qEkxVWBS6PiQHeKW24sGgrddVYqhbONeW+CGdB
 Ppoz+rBHnl8Hfqfhcbjni8sXUJQ38L0fllc7GEKEgMoiXzX6EtUKW/p+BWWSFEEl2615
 NoXkuUi7okCMH8iRxMjpS1zHE5zX9RbDlJYpbYVfoLIfAjsUpjyfUX9DqfKXNEEntzAh
 5VV1L02Rd2Gpeyb5DIK0s3NugbJGrHNxBAPgB2wXKG+MIOD719DqPwiw/YgnGH3WrXXs
 btrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AQeBQJaJ2cUJJgh8YFxOAc0hMFwb7DTvcTB5KsIPLmU=;
 b=PKA4FWr+PAb1XbfqBc9zqtB7/uvjSXcrRuSefnlS+avxJgLGjyqG6jmv7lpyu/CkoH
 6yqID1t1aiN5Mms1fQbnY9i3jaeMioIMMvHNO8iH9cXBppJH48Y9Wp50NjFS+rq4vw0F
 pOvViN3w1upDTn2N59TIdHK+7wSJ5NeaX/oREfxH+DBkG95I7FT/coYzE9lys2rkn+HI
 yMwOECw+e75QXbXUEVUD33raxxW72PojzL66WqYQNUpXPLBU2F+zmfklAQhXyp91OKtV
 RNQPy3Kw3uGQJgjwDB2A26TITGMjrcqJVuuLYSj33oI1tqCgFFKrwVdajWwuwZ7/CTOR
 QgFQ==
X-Gm-Message-State: AJIora+616sa9uoD8ZdWifaBoVcBv6fEVARkiWVYGhJZwoiYF7C6T0CV
 zGBijbYWHx30r244E8aRdvc67kiYTYf+P0Op
X-Google-Smtp-Source: AGRyM1txNYatGa3tNb4XjLbL3XL8QSOd4DEQJKhWt4J9cmnUS1tyQ0/ixdY6VriFNqUfJHCEPZfjIw==
X-Received: by 2002:a63:8ac2:0:b0:411:8061:c10f with SMTP id
 y185-20020a638ac2000000b004118061c10fmr19074295pgd.262.1656838787789; 
 Sun, 03 Jul 2022 01:59:47 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056a00331000b00518764d09cdsm18777593pfb.164.2022.07.03.01.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:59:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v21 09/13] target/loongarch: Fix helper_asrtle_d/asrtgt_d
 raise wrong exception
Date: Sun,  3 Jul 2022 14:29:09 +0530
Message-Id: <20220703085913.772936-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703085913.772936-1-richard.henderson@linaro.org>
References: <20220703085913.772936-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Song Gao <gaosong@loongson.cn>

Raise EXCCODE_BCE instead of EXCCODE_ADEM for helper_asrtle_d/asrtgt_d.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220624031049.1716097-10-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.c       | 2 ++
 target/loongarch/op_helper.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index e32d4cc269..0013582a3a 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -51,6 +51,7 @@ static const char * const excp_names[] = {
     [EXCCODE_IPE] = "Instruction privilege error",
     [EXCCODE_FPE] = "Floating Point Exception",
     [EXCCODE_DBP] = "Debug breakpoint",
+    [EXCCODE_BCE] = "Bound Check Exception",
 };
 
 const char *loongarch_exception_name(int32_t exception)
@@ -176,6 +177,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
     case EXCCODE_INE:
     case EXCCODE_IPE:
     case EXCCODE_FPE:
+    case EXCCODE_BCE:
         env->CSR_BADV = env->pc;
         QEMU_FALLTHROUGH;
     case EXCCODE_ADEM:
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index d87049851f..df049cec59 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -49,14 +49,14 @@ target_ulong helper_bitswap(target_ulong v)
 void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
 {
     if (rj > rk) {
-        do_raise_exception(env, EXCCODE_ADEM, GETPC());
+        do_raise_exception(env, EXCCODE_BCE, 0);
     }
 }
 
 void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
 {
     if (rj <= rk) {
-        do_raise_exception(env, EXCCODE_ADEM, GETPC());
+        do_raise_exception(env, EXCCODE_BCE, 0);
     }
 }
 
-- 
2.34.1


