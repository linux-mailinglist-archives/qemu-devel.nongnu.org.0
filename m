Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB66430CD7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 01:09:15 +0200 (CEST)
Received: from localhost ([::1]:56408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcFHG-0007ga-Ck
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 19:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2N-0004o6-IJ
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:51 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2K-0000ZN-Q2
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:51 -0400
Received: by mail-wm1-x32e.google.com with SMTP id g2so7159455wme.4
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Ipg4rEL1PD1s9Pg/ZyG3hwX3rS3qq/i9aj3O/bGivs=;
 b=eYN/K4JpcuYYkOIJQId9wHXAcgg0kdev+hCPY/k2ITLRGsSIAEl7MFsbswb/QOLtu0
 42EdAjzLqYNODGb0S+xT/ZmUrdywU1Ze3sx3gC/DbXqd7Bx4jypqe4OdTOccyEoGaTBN
 +zSggBWU8ALrfdc9Ri3lwlMgGQmhaumFJ0q7C8IOHlT+bWnLmHmw9qO9bXwVrNtf9jh7
 PEqwx6ldAK1EXaQq5Nrm6eYfjDlh1rXfxkTeed7u6jeHCegL1VxMvlUzq5QOw/V+/VNa
 DtuYHKwam2Q6bTWozmYOA1bw93d8xfhUNmieHcLgA3cHDh8LGcnDXQLS9ccZqRwH8CxQ
 lHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1Ipg4rEL1PD1s9Pg/ZyG3hwX3rS3qq/i9aj3O/bGivs=;
 b=FXZOEhZV9DS5/psUD5VCMjpIkrvw7cnEWDdHRbPq+bwsIScsTRBFFhbAfd0ZGb2mu5
 0Lt4waXc/I8Qd00jS4Tq9f4F8MyEGUZW5Or3w7rQzx07Ei4tfP9+SYP0X9GkTLqRBsxQ
 Q0Z+y+W7Y540Y6xrI2E+rzRiOcHQmOLlwtP0wPagiCDBa8v3nt3PORv4r5q6HWXojxrj
 5uzMfKc2ZUP+7q2d76u/dIN/PJ7/3ggjDUU9xNyRwibpYGb1YBAj8L5kkEGaI+q5qsld
 qozORKz9fBAMbUspR4+x2+46WqyKeSWyZKtBmVNeanMG3znsSgGnL8B0LJ9axd9XE0pm
 0HiA==
X-Gm-Message-State: AOAM5319b1+GfxES6PVDsnJRgPyjFXZ/4VSfqeqLWnIlYjEUel7dhx+3
 VrDtx36+AZ2R7p5h+Bh0WsJQUmmn+Fc=
X-Google-Smtp-Source: ABdhPJxiFwBkoj2/Gl4WPOlNP1fv0JbciIWgHQJ1JkD7uq7yvMDDZVF56o/sZyeZBl1aCsvMcLG3+g==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr26644248wmq.79.1634511227238; 
 Sun, 17 Oct 2021 15:53:47 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id n66sm10900177wmn.2.2021.10.17.15.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:53:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/17] target/mips: Fix DEXTRV_S.H DSP opcode
Date: Mon, 18 Oct 2021 00:52:40 +0200
Message-Id: <20211017225245.2618892-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While for the DEXTR_S.H opcode:

  "The shift argument is provided in the instruction."

For the DEXTRV_S.H opcode we have:

  "The five least-significant bits of register rs provide the
   shift argument, interpreted as a five-bit unsigned integer;
   the remaining bits in rs are ignored."

While 't1' contains the 'rs' register content (the shift value
for DEXTR_S.H), we need to load the value of 'rs' for DEXTRV_S.H.
We can directly use the v1_t TCG register which already contains
this shift value.

Fixes: b53371ed5d4 ("target-mips: Add ASE DSP accumulator instructions")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211013215652.1764551-1-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 5fdeb67e82b..519b00121f6 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -13796,8 +13796,7 @@ static void gen_mipsdsp_accinsn(DisasContext *ctx, uint32_t op1, uint32_t op2,
             break;
         case OPC_DEXTRV_S_H:
             tcg_gen_movi_tl(t0, v2);
-            tcg_gen_movi_tl(t1, v1);
-            gen_helper_dextr_s_h(cpu_gpr[ret], t0, t1, cpu_env);
+            gen_helper_dextr_s_h(cpu_gpr[ret], t0, v1_t, cpu_env);
             break;
         case OPC_DEXTRV_L:
             tcg_gen_movi_tl(t0, v2);
-- 
2.31.1


