Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4674EF238
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:07:22 +0200 (CEST)
Received: from localhost ([::1]:55712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIry-0006zx-0Q
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:07:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naIm0-0003oY-0A
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:01:12 -0400
Received: from [2a00:1450:4864:20::436] (port=46005
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naIly-0005kV-5l
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:01:11 -0400
Received: by mail-wr1-x436.google.com with SMTP id w4so4608728wrg.12
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 08:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=b/IMCq50GJawrmIsXbxL/Y8Mb/df1w5GpM6DR/upW00=;
 b=yQWm6amlY+WqqiA+kXEMXM9YBtHKUQQwvXflGDfdUGwFRICN5ASTyqFu7shRwPcZAf
 uKjINSakDVKoJ3I7aBLn7k0p/PA4A7RNAXc4/DlBEyyIotoJK9EmMBpKjm689jhbJqVT
 B7eqH3VonQHU4zAC7oq3vRt3JnQWGrns+LpK0pSQqE53iW9AhG/msOdf/325W5S30GMr
 eELhdMVCJuNfjDqJin6uzQ6M4mkucroFJ2dmmKXsrn7XLoM8sQp8IC001h+z2SNJrQaF
 jJjCGvlU6VlpQkE/j9Bs5MuajwDmrCjGBU+7InZ+tjSOLvXXIduqmk+5YWnJ693t9+Mp
 vVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b/IMCq50GJawrmIsXbxL/Y8Mb/df1w5GpM6DR/upW00=;
 b=kPfPGo9cJ+jg1zil5Fb37xr0NxAzZdlHksORAh49rK7R/Ym2kcTs1dVI1tVWRkzgtA
 GH29iBT6x/Pt7fVCvZ3234fMQWORXJJnxG5Ow6UNhzmMTy3fjWuyx1t4x7vI3egMkN7M
 +NKaxjQldfHkOp1LsRCYTT69xq2EFBYCPplG9RZHn9KVRMSJ3BNSnkU4LRaI0Qu7s40d
 f5zFi1In98Tp0NsqEFFek0VOmoFUxq3SpMR8MtGOXZfvWhe8dzh3i04Hl27BH6DUeX4U
 typAzAIGMlwo1LC0NXyURnkCG+Ha/YlBfbmNIRlSFc1b3or5f9xj0K2QRlF+X+GoqYP/
 vEUg==
X-Gm-Message-State: AOAM530bpx2kQgArgThhoXyoYlMiPL7Tgjcjmecp17NY+bkSxVgO8iGj
 2Yc+YQVWnHu7y8WK9s2I40Lxv6BO+28Y5g==
X-Google-Smtp-Source: ABdhPJwYfEe3qr/CSsO/piOyDSfSRdQDCTxBY6CHEL9AWTmkS+iRJ0sQfVTym70qXB8LzwWpP77qew==
X-Received: by 2002:adf:e604:0:b0:203:d866:f741 with SMTP id
 p4-20020adfe604000000b00203d866f741mr7962031wrm.391.1648825267143; 
 Fri, 01 Apr 2022 08:01:07 -0700 (PDT)
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c020600b0038cbb21fb00sm2084023wmi.39.2022.04.01.08.01.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 08:01:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] target/arm: Don't use DISAS_NORETURN in STXP
 !HAVE_CMPXCHG128 codegen
Date: Fri,  1 Apr 2022 16:00:55 +0100
Message-Id: <20220401150055.421608-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401150055.421608-1-peter.maydell@linaro.org>
References: <20220401150055.421608-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

In gen_store_exclusive(), if the host does not have a cmpxchg128
primitive then we generate bad code for STXP for storing two 64-bit
values.  We generate a call to the exit_atomic helper, which never
returns, and set is_jmp to DISAS_NORETURN.  However, this is
forgetting that we have already emitted a brcond that jumps over this
call for the case where we don't hold the exclusive.  The effect is
that we don't generate any code to end the TB for the
exclusive-not-held execution path, which falls into the "exit with
TB_EXIT_REQUESTED" code that gen_tb_end() emits.  This then causes an
assert at runtime when cpu_loop_exec_tb() sees an EXIT_REQUESTED TB
return that wasn't for an interrupt or icount.

In particular, you can hit this case when using the clang sanitizers
and trying to run the xlnx-versal-virt acceptance test in 'make
check-acceptance'.  This bug was masked until commit 848126d11e93ff
("meson: move int128 checks from configure") because we used to set
CONFIG_CMPXCHG128=1 and avoid the buggy codepath, but after that we
do not.

Fix the bug by not setting is_jmp.  The code after the exit_atomic
call up to the fail_label is dead, but TCG is smart enough to
eliminate it.  We do need to set 'tmp' to some valid value, though
(in the same way the exit_atomic-using code in tcg/tcg-op.c does).

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/953
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220331150858.96348-1-peter.maydell@linaro.org
---
 target/arm/translate-a64.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d1a59fad9c2..9333d7be41a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2470,7 +2470,12 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
             if (!HAVE_CMPXCHG128) {
                 gen_helper_exit_atomic(cpu_env);
-                s->base.is_jmp = DISAS_NORETURN;
+                /*
+                 * Produce a result so we have a well-formed opcode
+                 * stream when the following (dead) code uses 'tmp'.
+                 * TCG will remove the dead ops for us.
+                 */
+                tcg_gen_movi_i64(tmp, 0);
             } else if (s->be_data == MO_LE) {
                 gen_helper_paired_cmpxchg64_le_parallel(tmp, cpu_env,
                                                         cpu_exclusive_addr,
-- 
2.25.1


