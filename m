Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C853ABAD4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:46:42 +0200 (CEST)
Received: from localhost ([::1]:35646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltw6D-00011T-53
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw3Y-0006ct-Tp
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:43:57 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw3X-0001K6-Bx
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:43:56 -0400
Received: by mail-wr1-x434.google.com with SMTP id c5so7692674wrq.9
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qof+yv8e9S7550YKz4Cn5HOdqyTeOFddruO/ErbyrOE=;
 b=cwrIXXp9tySunF5SKMayaYv+zyNkCsNoWd81muP5j/pERsxNuwGvzhZJERXbPezvhb
 vPQyhhJDVKxSSnoxDY0UDFXfSILDm8KV1FwfZrLieXc6W910r1Q3PyDyBkI/5amMUBKW
 6ruEJ7DlG61ehX2No4PkhIQuebEVsi/4oXQaq1P9O8MqCE8hXEJQgU9YrokDPQdPbPNl
 AaemebfLGlz9+yCeeLaymGP/SFl042Xv04JEJNr3GjmgJtUAvVj6XJanLYmaBFyfPTYP
 7XDJTV8xG/un8nLwpPXJDViTWOGHsbs1dDrgbRdG/kFFi/SNku/dOcIM2VvtXwcMOfNz
 MIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qof+yv8e9S7550YKz4Cn5HOdqyTeOFddruO/ErbyrOE=;
 b=mATSfMwFpqvi/Np/wHNJQ+2YdLUxUmMjwXED8ZU1FiiGmSPrxIjz6mgA1Rds9k2yAb
 A0XhDFvqojC6eHSZVZm2898Ul/PWVspI5ey88uZ2p8uKgS/6uwtkKHvtBLTgouEkvFHD
 qqDcmQxXlWsJNY/aR/oIrmXBu3WFBivajurgSSCdxo22C2r/LJtgdhtkTz4E24ZvXrtA
 GAKBdY6dlv2oZN7JiXHNpIStTOS45TNnQrWnx4tWIhuTyOPsNHvw0ej6PxpWoxWN52T0
 lEE+GXu4ZXt8oSRAwqckTaKpIlWjcmZ7FmvAdnijh3yHhehk1R/xNXqdRO5q8iE4Nk6U
 UZ2g==
X-Gm-Message-State: AOAM533dBwq6MIAVawNytbYVSuxWPaK19G/HKvbADsRvDyeVtqPOf0Pp
 GO99Jyzh+aiFtj4gWeVMllRw4BDjQeXGTQ==
X-Google-Smtp-Source: ABdhPJxrzJrIin1yAiluYi8B4fIS/0JforoINPnkyJ70FaFlcsxAaggY7qUuTutUQdCWMIk9BilNbg==
X-Received: by 2002:a5d:5082:: with SMTP id a2mr7276211wrt.199.1623951833796; 
 Thu, 17 Jun 2021 10:43:53 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p13sm5105040wrt.89.2021.06.17.10.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:43:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] target/mips: Remove SmartMIPS / MDMX unuseful comments
Date: Thu, 17 Jun 2021 19:43:20 +0200
Message-Id: <20210617174323.2900831-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617174323.2900831-1-f4bug@amsat.org>
References: <20210617174323.2900831-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These placeholder comments for SmartMIPS and MDMX extensions have
been added commit 3c824109da0 ("target-mips: microMIPS ASE support").
More than 11 years later it is safe to assume there won't be added
soon, so remove these unuseful comments.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index f0738daa847..47c7705f051 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -21579,14 +21579,6 @@ static int decode_nanomips_opc(CPUMIPSState *env, DisasContext *ctx)
 }
 
 
-/* SmartMIPS extension to MIPS32 */
-
-#if defined(TARGET_MIPS64)
-
-/* MDMX extension to MIPS64 */
-
-#endif
-
 /* MIPSDSP functions. */
 static void gen_mipsdsp_ld(DisasContext *ctx, uint32_t opc,
                            int rd, int base, int offset)
-- 
2.31.1


