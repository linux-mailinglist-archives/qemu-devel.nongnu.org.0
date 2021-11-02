Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8504444303C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:22:54 +0100 (CET)
Received: from localhost ([::1]:60268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhugf-00052r-MM
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6O-0004tt-Ix
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:25 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6M-0006M9-Ny
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:24 -0400
Received: by mail-wm1-x334.google.com with SMTP id 71so13375011wma.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I5Etaa8zIcgqaaU17Qo9AH5Dp8AYr3wzcYrvFLqw+7U=;
 b=F+qjG1XNhbAIR0xn75ds+/5R2Is3lLlYOBIZ3IHDQwb8p0sCnJmSn59UrjhWrlof4X
 Zh339WDCwqDhQFyfLJdVEGaTdiZlsQfmFOShvqASR01Qnh8BU+tNHXF07+Hf6UXT6QuZ
 4Ga7h61pX/tpI8LwvDha7kX5TvqkPt2RzaeyEfkMbUj/hs4P8MUNC2toZxZNG5xB6Yfd
 cXJZiP0V2WBN9p6hPqf50amPZGpTdlYPNxoOt05z0Y3dtebxOHYiugjdxGBhuUTk1r9w
 BE5QbXe4+KdNJ1wZ2Fj8r/NMJLLqK2PH7r6g6UlhHyjn4qlCa9VlFYWZ8F4Tv7qohSSn
 tkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=I5Etaa8zIcgqaaU17Qo9AH5Dp8AYr3wzcYrvFLqw+7U=;
 b=yGw0TGoSe4RcQLZPDJWrFgZHvN+Es7u0WIxZjVfLIOeNzwylieRQ6OsVIm1RozBjm8
 psw+W9cWGjDLxpVaFP6m6IKZDXHVVhp5nS1Jr1KcSBXLxIi9B7sHFpV5nU8SiivHIA9z
 ztcMev1a0HFSvCXypjDMRS0ynilrjeLc6w9RU0uzsmmN6VY1DxF84kNkvOMTYjVNnfgS
 GeEgi9/BeXpGAXqaqvSbSMREyUphgyk1jb4iDyHH5BK1xgps32ffYfPKsXVo5dR+WpzR
 o4pWaEFM2PSvfiTvPzODFIOubbuT6HK01lQQAbjUXgcBatDTykVb63MxbL6Wu+2pTCGA
 CpOQ==
X-Gm-Message-State: AOAM532yTAAZyqHNJibg040pDo0K+nikygCb/SZZRCTGSpCU7jO/Im+L
 Nel1DRuD5+QFxrPVClF8VXzApE1wBRM=
X-Google-Smtp-Source: ABdhPJxXpVY6CmCg9NFGa8sYZJzj5dZyYftuJ9cfGLdr2WXcOoE4WJ1Oh0CJKpZw9q0IVXETjcttvA==
X-Received: by 2002:a05:600c:ad0:: with SMTP id
 c16mr6864761wmr.176.1635860721141; 
 Tue, 02 Nov 2021 06:45:21 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 f24sm2476764wmb.33.2021.11.02.06.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:45:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/41] target/mips: Remove generic MSA opcode
Date: Tue,  2 Nov 2021 14:42:32 +0100
Message-Id: <20211102134240.3036524-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All opcodes have been converted to decodetree. The generic
MSA handler is now pointless, remove it.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-31-f4bug@amsat.org>
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
index c054a05f8ba..7576b3ed86b 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -763,13 +763,6 @@ TRANS(FTINT_U,  trans_msa_2rf, gen_helper_msa_ftint_u_df);
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


