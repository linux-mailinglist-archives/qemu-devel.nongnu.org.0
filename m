Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE65F620460
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 01:00:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osC10-0004Hg-Ed; Mon, 07 Nov 2022 18:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC0y-0004FL-Iq
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:58:52 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC0v-0001Wm-UT
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:58:51 -0500
Received: by mail-wr1-x42c.google.com with SMTP id cl5so18499577wrb.9
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5vUs7d8+PqaAE+DBpDZ/E5BEiMbZqrac7M3FLYPlREw=;
 b=ufFKXFLBzTMiFAOyoak5OR2Y0Q43M0K76RxxKowpZpXydLtsmKUYJOTwmv7znOofip
 05Bx9p7LB0mDQa9bLzC6G3JIa+OezKC910J/Ore3RLC9OUWV5xR6TUe90jc5xDMVA787
 +TDJjHpxosuCV5Lj7lMPjLgg3R2KSazsEEpx0EqVWTrUKsAl/A2Cd+Gs1W24duk4kpou
 eWiH209ZcjoSDGCTNEX4eY7fkWYRzNMdeXqGsVl34PJU1uEcGfBUW2IhvaKJhY4vbj66
 iOZQtmeOfvo5hA2PYOgDGGkaYwC4yBCUpxAno0/uu7xEibG+bz4PjfYdMDbhO3lqEtt2
 yNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5vUs7d8+PqaAE+DBpDZ/E5BEiMbZqrac7M3FLYPlREw=;
 b=ckkbPFmBsYz2Y8qEsFQCwCa0+iLM/htKX1ssjadGnN+aeeJro0xn1ncGo6qksOrzlA
 kUH5OzEQ6SKQ/Kk4Q1dE6e8k90+nq/WQMlJKte7bsfT4Qo73Q5+sf/3QqsEuq4E96G5t
 dizOl20mNw9+EogBpvXwDrFZjm9FK2ryBClhrFM8bfjL5qmXSR5/KjTVUv09+uEc6s+H
 1+YJVbaSlV/1GSrnD+QX/cjO3HY6+/K2/ZhWNRDmCfmZKwYgKyo9AzVSgzoevgAxkemB
 jx+03mEsQIQ24DgfiUb9XsQ9JthpyIo9+GmZ+hEtLFTj/jEbPhFIf/vPjp4b99UBsYTn
 6kCw==
X-Gm-Message-State: ACrzQf3YYK3XSNex5zEbzZX17GEFQes0fsU2jBwJrUZRCzeVFDnThPSy
 fqGA8rwyk000i/Uq7aAJq/AciqlOtAvYMg==
X-Google-Smtp-Source: AMsMyM4gkIXYkAFkBT5u60xxlYn2Rf9EF5XS91koadLxuyJxkAIZYP7OcUDmtr7lvyDubrhFjvYVqg==
X-Received: by 2002:a5d:4285:0:b0:236:e893:9e4a with SMTP id
 k5-20020a5d4285000000b00236e8939e4amr21890028wrq.681.1667865528423; 
 Mon, 07 Nov 2022 15:58:48 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a5d420a000000b0023682011c1dsm8461947wrq.104.2022.11.07.15.58.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 15:58:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 05/14] target/mips: Don't check COP1X for 64 bit FP mode
Date: Tue,  8 Nov 2022 00:58:13 +0100
Message-Id: <20221107235822.71458-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235822.71458-1-philmd@linaro.org>
References: <20221107235822.71458-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Some implementations (i.e. Loongson-2F) may decide to implement
a 64 bit FPU without implementing COP1X instructions.

As the eligibility of 64 bit FP instructions is already determined
by CP0St_FR, there is no need to check for COP1X again.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221102165719.190378-1-jiaxun.yang@flygoat.com>
[PMD: Add missing trailing parenthesis (buildfix)]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 4c4bd0823d..624e6b7786 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1545,7 +1545,7 @@ void check_cop1x(DisasContext *ctx)
  */
 void check_cp1_64bitmode(DisasContext *ctx)
 {
-    if (unlikely(~ctx->hflags & (MIPS_HFLAG_F64 | MIPS_HFLAG_COP1X))) {
+    if (unlikely(~ctx->hflags & MIPS_HFLAG_F64)) {
         gen_reserved_instruction(ctx);
     }
 }
-- 
2.38.1


