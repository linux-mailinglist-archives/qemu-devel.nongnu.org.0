Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23B443D13B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:53:11 +0200 (CEST)
Received: from localhost ([::1]:49008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfo2w-0001Df-Uc
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnN5-0006Hu-Vw
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:58 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnN4-0004sh-Gt
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:55 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 136-20020a1c008e000000b0032ccae3b331so3107389wma.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P1l+7Yd9dtqVfuQfL/1K/RHiMt86f+5uUx6E0+0+3Hk=;
 b=RV8mw4Y3C2eya65klxkkEA9Q+PiqTLLXrqrvSriyRZvA8I3hErbcLIqKtcOy7Kbfxh
 OgX5tgd1+awmGCCvrjTuH2I2X2mnWGb/pXxEXC77fgE/OB+yVI3B3HxDaEXOCMW9ay6+
 rKjm+K10BTMxgwFOs2IqoTnuJmJIMHvbhbbn7b2Xx1PSBCOyM4fJA6Udw6nKLM4H9N33
 IVDraMDnp7aR00GMq3b4CzqtDcQo/bmrZMBmFj9zgjCn+CvvhNe9DCR1TrJP3QCRtO/a
 JWPooSz5D7LfIz/DdTg21nJqjFAeZ2MMa0OeycxFnd9uac4jY2egKdd9rlBhTYTS65+o
 72Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=P1l+7Yd9dtqVfuQfL/1K/RHiMt86f+5uUx6E0+0+3Hk=;
 b=fdXX1QpiDbRIchYlhoKXlVVhhNuR6bCKFLaK0kVlymYvmVe86gnlXPH4YpSh9DRaU2
 +GZ6mso0frZFGF/EvT0awvjw5yBTbBT4fDMVUPsBKibXxST6YdyMtj2u1oEnTnNV2vFL
 bmYVFWSZ50c2fc/XBrX42oZQmW6Nlggto04L7RokwoZhhtDZcrm0DAXeoghLv3IWdihh
 90tZ+iXrrmEyXtUGdFGo5CP6Pw13gePLgrxiECPdNgDYY1cF4aNd/qcWlrwwsnTlJVm9
 ZTreqFD27fq9wfurrUxO2YKQnj1iz8E/5nynTCVp3PVyEA8z9szD90YbwHpO3PGvbXpp
 ZPTg==
X-Gm-Message-State: AOAM533usyQFD+oyYUXvujupOWa128TvfUrk63ZdXCRERDrfUriaaLPM
 vdp5kwu+w83t0GSKmy7qEAc1Mp38i/Y=
X-Google-Smtp-Source: ABdhPJzYzRxEGKzbQg5Q3OQGRTEaqAh4ef1h2MpGbVtGxOhLSU7LxGVGmKbdogkgAkRYyLvxrkVneA==
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr7290824wmh.66.1635358193219; 
 Wed, 27 Oct 2021 11:09:53 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l9sm488151wms.40.2021.10.27.11.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:09:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/32] target/mips: Remove generic MSA opcode
Date: Wed, 27 Oct 2021 20:07:28 +0200
Message-Id: <20211027180730.1551932-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
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
index f3ec195bac0..3e1b577f326 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -255,6 +255,4 @@ BNZ                 010001 111 .. ..... ................    @bz
 
   LD                011110 .......... ..... .....   1000 .. @ldst
   ST                011110 .......... ..... .....   1001 .. @ldst
-
-  MSA               011110 --------------------------
 }
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 4a2a02bd6d2..ef0e00772a6 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -765,13 +765,6 @@ TRANS_MSA(BMNZ_V,   trans_msa_vec, gen_helper_msa_bmnz_v);
 TRANS_MSA(BMZ_V,    trans_msa_vec, gen_helper_msa_bmz_v);
 TRANS_MSA(BSEL_V,   trans_msa_vec, gen_helper_msa_bsel_v);
 
-static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
-{
-    gen_reserved_instruction(ctx);
-
-    return true;
-}
-
 static bool trans_msa_ldst(DisasContext *ctx, arg_msa_ldst *a,
                            gen_helper_piv *gen_msa_ldst)
 {
-- 
2.31.1


