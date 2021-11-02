Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B3C442F7D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:54:41 +0100 (CET)
Received: from localhost ([::1]:33206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuFM-0003al-PT
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu4J-0008Lu-Fv
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:15 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu4H-0005zv-AV
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:15 -0400
Received: by mail-wr1-x429.google.com with SMTP id i5so25752091wrb.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+/Q/nSxAuHlXOdojOuByNBLGz7XClzU1ZplGkXdajAo=;
 b=GZuBFBhQl/iJ2xjJfGP0496QSXIwBGCftp52KiNCfLnNo3vRKhaeDVtkywWcPtW6Kl
 Ddv+ImPCiKsgxuyQu89+BMfBbhenG3DJzMPWVZ64JBKiaGx7fNAlMUWoYWuaNZh1bAH9
 D/bd5XTRTAn38on8aJZtcSwB8UGnh3Ht8WtQtdYyWONCX/g9znAtctLvx7JbNqUBrzHd
 mopmC5hGYilkQ+ZLGJAflxH1cfN1n8St2XH9IV2bAtQ+akzYchENbnelccAX0LY3p6Ch
 MuE0H14Dm7m+AR7SaQ0r+Lfesz/oizyK5JpdmjabApVlsVfvXcJe7Nknaa+VJBbiVlYY
 DxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+/Q/nSxAuHlXOdojOuByNBLGz7XClzU1ZplGkXdajAo=;
 b=M9ypVBuhbGlLdMIrE6oK68TNCdoOBeauF/TD50Jujx/pGlZ8pabi45d2AMiOkku2Q2
 PCqliwNyVumxht4CLywr5NtEOJ0Cst7BlSrUtdfRtSVS3BIT9ElF36xZz3/o59EygK6d
 1Mc6ZxkC2s0BquMEjkegiqXFQkgoPoDrZVlkqMa7rFc/M2G2mr/eQ8afBrYzeG3ATPr3
 kNv7Iwc+RJpGO/ElsR0y70dcYkkcV8DGu1u6uzcLSMZ06aB3dbV42QEQCUCiWzolHv4v
 LJ1+96ekO3+/14nL/ivSqv652iWbempQafSXBLHOlaHGT4E27wSoT5qaGYu4S0qM7/8e
 pAkA==
X-Gm-Message-State: AOAM532N/FLDGtlTekeABYW3HYuRUAQqdP5BGJZ9mVJUL3alcDjxRV42
 QtwlXhwbvDDboqV8Dm1Bmk56Fh+GexI=
X-Google-Smtp-Source: ABdhPJwRdJP8UPFKxxTJ3DGMMfslstX2hCU/194kof1zRYCVVWCS7/moVreSKjhdfSXqTVhFqjt0mw==
X-Received: by 2002:a5d:4d81:: with SMTP id b1mr4720753wru.366.1635860591632; 
 Tue, 02 Nov 2021 06:43:11 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o20sm2493624wmq.47.2021.11.02.06.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:43:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/41] target/mips: Adjust style in msa_translate_init()
Date: Tue,  2 Nov 2021 14:42:05 +0100
Message-Id: <20211102134240.3036524-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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

While the first 'off' variable assignment is unused, it helps
to better understand the code logic. Move the assignation where
it would have been used so it is easier to compare the MSA
registers based on FPU ones versus the MSA specific registers.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211023214803.522078-34-f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 3ef912da6b8..3aa15e147c2 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -280,13 +280,15 @@ void msa_translate_init(void)
     int i;
 
     for (i = 0; i < 32; i++) {
-        int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
+        int off;
 
         /*
          * The MSA vector registers are mapped on the
          * scalar floating-point unit (FPU) registers.
          */
+        off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
         msa_wr_d[i * 2] = fpu_f64[i];
+
         off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[1]);
         msa_wr_d[i * 2 + 1] =
                 tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2 + 1]);
-- 
2.31.1


