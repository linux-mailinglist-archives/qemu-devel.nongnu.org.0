Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD8656652E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:38:28 +0200 (CEST)
Received: from localhost ([::1]:54000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8e4h-0006lk-7q
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8e2q-0004hj-Rh
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:36:32 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:34512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8e2o-0004eT-CH
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:36:31 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 cp18-20020a17090afb9200b001ef79e8484aso4243339pjb.1
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cb/72d2FcQmj3zj3zP3mY08HLs4aMXys8/KVOUFQofg=;
 b=FEePoiCLfCyTIstv1Kchcpc/5ASJs2OWZYxbkn/ea2en6SvLp5w0gk9lbQlnRsxIaD
 Pjan+qASKdjw+ki94wRoNERlQxR4fFPB8w5grjrOV/kYp/5Ixz2nqnNp+9pzkeiU2RXH
 lnjUbw5sgsc2s1u2KCO4ZCJQgQPmoDl/LlozE6lf+NdccCZtdf5YHAsMXDavKTSKCwyB
 fAZn4rzC/0j3HaALzc5NbICwUKr16MEVxMAfYnRdxTGdCzAXrVSr0zIEoQxC7eAO7/Ab
 a9P1FBqrtOlgr6ZZiBRgxvEp2Vhv5sOXxMrai4Hv0+wx0t/MGRRivoDzCB9vsXTmo+B1
 hjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cb/72d2FcQmj3zj3zP3mY08HLs4aMXys8/KVOUFQofg=;
 b=DaBpBSxIGSmewCzlJ+FZ4F2ijMyKGPUPUFFbCxkF+aHZfNsoxc+his1YasMmD3h0T5
 WIjwtDe849JIEOFHQyOFrubjjRR1WTjRx9BLUmWEZ/HF4CoRv34kdmxc9iklBNsvXC9j
 YfcVBR34ykI+HZpgT8FglTftoN4bLsC/gsGZopCU+AyZIqhi+En5RW1GG+HnxA3d0C6e
 IrJ7Q5E52mREJ44wVrdWQKRRkCgHt0ncrsnWGbrsR0yAxot4St5DYTtxdg+kzxu5bPFx
 zIYO8/R4ZCqM4GUon402Z0AtQojsSjqPN0wSbglZ9h7RObxJO9TzR3MpT5qN8hdJJDxq
 iEzQ==
X-Gm-Message-State: AJIora91/12THGxeVAXaRkBCevQflWrNgUbPRJisXwiCtqFMgurRPBt7
 Ku67nCXrLeE7vx0B1xH8/GRFnkAELk8mUvpl
X-Google-Smtp-Source: AGRyM1uVRxfrpO0NXgFcRfuKw2+6lFCO+EImTwQVMs5m3IPSH9rqVmAGwZHcPhh+5/sEl3VjVqHc8g==
X-Received: by 2002:a17:902:9041:b0:16a:aef:7b84 with SMTP id
 w1-20020a170902904100b0016a0aef7b84mr41191109plz.124.1657010188899; 
 Tue, 05 Jul 2022 01:36:28 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 196-20020a6303cd000000b004127ad2407fsm589050pgd.51.2022.07.05.01.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 01:36:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>
Subject: [PATCH] tcg/tci: Remove CONFIG_DEBUG_TCG_INTERPRETER
Date: Tue,  5 Jul 2022 14:06:23 +0530
Message-Id: <20220705083623.1142250-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

There is nothing in this environment variable that cannot
be done better with -d flags.  There is nothing special
about TCI that warrants this hack.

Moreover, it does not compile -- remove it.

Reported-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     | 5 -----
 tcg/tci/tcg-target.c.inc | 7 -------
 2 files changed, 12 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 033e613f24..ceb36c4f7a 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -53,11 +53,6 @@
 # error Unknown pointer size for tci target
 #endif
 
-#ifdef CONFIG_DEBUG_TCG
-/* Enable debug output. */
-#define CONFIG_DEBUG_TCG_INTERPRETER
-#endif
-
 /* Optional instructions. */
 
 #define TCG_TARGET_HAS_bswap16_i32      1
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 98337c567a..f3d7441e06 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -823,13 +823,6 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 
 static void tcg_target_init(TCGContext *s)
 {
-#if defined(CONFIG_DEBUG_TCG_INTERPRETER)
-    const char *envval = getenv("DEBUG_TCG");
-    if (envval) {
-        qemu_set_log(strtol(envval, NULL, 0));
-    }
-#endif
-
     /* The current code uses uint8_t for tcg operations. */
     tcg_debug_assert(tcg_op_defs_max <= UINT8_MAX);
 
-- 
2.34.1


