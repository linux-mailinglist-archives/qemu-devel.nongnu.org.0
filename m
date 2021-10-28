Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A4943F20A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:49:40 +0200 (CEST)
Received: from localhost ([::1]:55652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgDHH-0005GJ-R2
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCg7-0001PJ-Fe
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:11:15 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCg6-0007Wn-1b
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:11:15 -0400
Received: by mail-wr1-x433.google.com with SMTP id k7so12407304wrd.13
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m1WO0u/SxoGDMC6Uq1R89eG42XWQ5+GHGr0eB+xoS9Y=;
 b=fF5Ofo9Fr/aKo4uaGPddTcf9ujOZ+aDKfjhSiEDzog96f8Y/ADBUAJMvmeeLKxb00G
 gUDvjJQtRdxq/fLR8grfLBI/ifN3sF/siizpWjmKm/48wFH2uZduMrPkmGup/cE8FI65
 dF/3UcvjV8nrSNADgnuRPqsTUCi7Gyo7jtd99lLOBAT7jvdtE+EfPpE/3gWwne0ILRNU
 PNSLsCciB/aSaXrbAIpVd28mi0VbUZ0gSk3YJKuk4uKE+Sox1h/DaAzCiNv7fALsEc3e
 DBlrxcdE2f0FMMHBZAJbcTGne3FcUTeTqNiLmd2Pbpz6cDzgKB/nxkjPjJzfxGMssfLh
 xENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=m1WO0u/SxoGDMC6Uq1R89eG42XWQ5+GHGr0eB+xoS9Y=;
 b=SIfCj0i5SY6cChKrb0SxQe/Rdgw0HfITI1OK2lZ90us+cUycKUv8Q1JT3p6l2h9pbd
 PCvYNhlFO/e2ZCpmWFWW0aZb7fUK8qUVp0Owt18fpDZk3f8JDtTl4TGUzmenVjjO12kv
 aqM2a9M3LwEzq4ewzRisbqpHNzmkv4a/llrDZ9Fyb6Tt3U2WbEXHgFzl49J2yoXuOiTv
 lM/RVRPekDnu8u+nJ2QIsGG4/BpDXK7IL7vztOjOXgT5iCF2UjBffjdh8y//PG0e6D+o
 8g3eaYYDiuFmbGkbnlYgBH97UvRT2k5abY3IGSRqHim/DFHzUgiYtjY81yb5gbaUNp0i
 oAXw==
X-Gm-Message-State: AOAM531gfdynj9ZTuOwZ6+BqZFBk6aYa7KPH/Jcau4BLR6aD/jIqcG6L
 3aIk1qEHwhxJD7C0ksMhJ1EqHPA3+k0=
X-Google-Smtp-Source: ABdhPJyquwKl/E2HAJH98PlihVB4yyZr7lpZLHj2HwjNS2WALVMP+YMBsLI9adW8j0oesyB32ToAYA==
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr8872993wrz.20.1635455472391; 
 Thu, 28 Oct 2021 14:11:12 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g7sm5287333wrd.81.2021.10.28.14.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:11:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/32] target/mips: Remove generic MSA opcode
Date: Thu, 28 Oct 2021 23:08:41 +0200
Message-Id: <20211028210843.2120802-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All opcodes have been converted to decodetree. The generic
MSA handler is now pointless, remove it.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      | 2 --
 target/mips/tcg/msa_translate.c | 7 -------
 2 files changed, 9 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index a4c7cceb15f..124768132ba 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -257,6 +257,4 @@ BNZ                 010001 111 .. ..... ................    @bz
 
   LD                011110 .......... ..... .....   1000 .. @ldst
   ST                011110 .......... ..... .....   1001 .. @ldst
-
-  MSA               011110 --------------------------
 }
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 62aef43a6e7..a1455ca6fa7 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -761,13 +761,6 @@ TRANS(FTINT_U,  trans_msa_2rf, gen_helper_msa_ftint_u_df);
 TRANS(FFINT_S,  trans_msa_2rf, gen_helper_msa_ffint_s_df);
 TRANS(FFINT_U,  trans_msa_2rf, gen_helper_msa_ffint_u_df);
 
-static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
-{
-    gen_reserved_instruction(ctx);
-
-    return true;
-}
-
 static bool trans_msa_ldst(DisasContext *ctx, arg_msa_i *a,
                            gen_helper_piv *gen_msa_ldst)
 {
-- 
2.31.1


