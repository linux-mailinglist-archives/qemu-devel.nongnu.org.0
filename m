Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106616A444E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:24:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe5p-0006bR-ML; Mon, 27 Feb 2023 09:03:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5k-0006GH-J1
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:01 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5i-0007nM-Cm
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:00 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bv17so6344495wrb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CnNTwGg0MOHmmdkp5WuNV0U9bN887LNmRf50zWb625Q=;
 b=FvMEFzMD6nP31jvey53rzuudU0DLaM0R0Vcnn6OAGpsytt1sbW+ps5824Hzpub2G8V
 uM1IVbbrya90jYjjwHm8gaE/3+aTSIz2BEm05vZuJ0PptKzKD+dtpJA5g0c0yDfanvOd
 e3WvV25WRDLSAj8GujXb04mhCdyRMSsxgVw8LohnwAjfIGhREqPiCsiL8xQUXEPq28ub
 +fBCY0c35H09jm63Kuvt+mGNHZKLXG9EiLYkZF22/WgbnkRnTN91GE2Rou4MPbBB3/8P
 EaW8O9Qjlr8BBtqNZwyWdOjxgaXGHmxP/QZEWV5zXcUsJTNiq1KlJNjxWTk/GnVyZrYH
 Vqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CnNTwGg0MOHmmdkp5WuNV0U9bN887LNmRf50zWb625Q=;
 b=j57yhCdFGeVZUqEN1eD78opxmy9svNzQRXVX23iTi4CZwMBfhQPAoRGEa3dq1zekMU
 UOtqHL5hYwlkwZrUey7/nVgU9n/dgY6+OjIsHvsQMYxh99MC9cK0lKhZeuVMRnnDfXY1
 JBcYU39+B5NsX2LUSFiQ+6fp0bxrMyK+vBIDRkckSbV1lsEdGwzw3T7gNKQSxScUlf6M
 UsAFvw0lRoi9FPuEeWcVzZQbJJIk4qLMMQQpHVBfQSJLZjzP4AulRmcUL382bKxos004
 zCIQxGamYjnAqaOUyzXRgtewEErJaWkezJWtXXKj5co3RmHcuNAcdd9oZK5N4HFdbQie
 Bfjw==
X-Gm-Message-State: AO0yUKX+/Ceb2V/7CCdvRT7BrGozK/XAIOdV0WFosSur4D4mnWpdQUR2
 Jdc1dJYKA9iFUn+oR1PksNlijvtGGwLmCd9H
X-Google-Smtp-Source: AK7set+hpw/8ACRpuvzKzpv0j8bFRZxWhy7MoIJeRQXw0g/Qyztu1gCiFd6w/joLEi3JzkuoDqODwA==
X-Received: by 2002:a5d:6990:0:b0:2c7:ea8:8afc with SMTP id
 g16-20020a5d6990000000b002c70ea88afcmr14401929wru.59.1677506576457; 
 Mon, 27 Feb 2023 06:02:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a5d4a50000000b002c5526234d2sm7304998wrs.8.2023.02.27.06.02.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:02:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 017/126] target/ppc: Fix warning with clang-15
Date: Mon, 27 Feb 2023 15:00:24 +0100
Message-Id: <20230227140213.35084-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

When compiling for windows-arm64 using clang-15, it reports a sometimes
uninitialized variable. This seems to be a false positive, as a default
case guards switch expressions, preventing to return an uninitialized
value, but clang seems unhappy with assert(0) definition.

Change code to g_assert_not_reached() fix the warning.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230221153006.20300-5-pierrick.bouvier@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/dfp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index cc024316d5..5967ea07a9 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -121,7 +121,7 @@ static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
         case 3: /* use FPSCR rounding mode */
             return;
         default:
-            assert(0); /* cannot get here */
+            g_assert_not_reached();
         }
     } else { /* r == 1 */
         switch (rmc & 3) {
@@ -138,7 +138,7 @@ static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
             rnd = DEC_ROUND_HALF_DOWN;
             break;
         default:
-            assert(0); /* cannot get here */
+            g_assert_not_reached();
         }
     }
     decContextSetRounding(&dfp->context, rnd);
-- 
2.38.1


