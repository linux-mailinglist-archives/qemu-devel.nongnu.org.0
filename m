Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A82443F21D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:57:50 +0200 (CEST)
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgDPB-0000yV-5E
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCgW-000264-Uh
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:11:40 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCgG-0007Xm-4n
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:11:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z14so12478409wrg.6
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P1LAblF/pDominm1VDDLg2hcCX1i2Z9BiHmND8AsFws=;
 b=N3Crz0AmfhQSrBGQPqwcETPNOaA7PRyfyK/vtOW4ZtVBQwvmGftKoeiScWS4SGhAbg
 3eetTFMZ0dhquRCYaN3X+SZM3+fCgyO5ftn9Xt3+AYywLPmwy1L+vx7Eh4MoRkUE2ojg
 JLBO6DpaxQUKsmDZ+ArauZz2MGdiPOk79M+xFVSBlMquK2APq7J6W/Kcjikvtblou6Wp
 6NXgvRAw4lUiXsf1Zqk0KnnrlE38jrj21NQDDBXvC6O95RTXyv4fSBx+AbSbn9SlxQoC
 3RoW1WEUCDol2nsEa0Z9Sou2ZXLLEIfL0FZkyftbjIXRB+jl5iySQ2bdv6VZRch7tOzo
 Bckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=P1LAblF/pDominm1VDDLg2hcCX1i2Z9BiHmND8AsFws=;
 b=vivsAnDuXeIF86kga/XnGMHLhliiPqBU0O+t8fxIQhP20kc1wBYl5lpboBw1B8FDu+
 clYAYKIyShLIRynmxuSod8v8lsMQDgP+JZuk+Q7dgSV2hzbKEVhTH/fCYbhPdMdNUMjK
 MK/O4nALO4hDbG7jTbaTrwLLwCgpvKeWtZoOuo9PmkDC7rjknhFlzIqBjcr7bGmeQvMY
 /vNXEFF1mZqlJLuNblWxPNBt+S4Dr/+Kiui5mJXhIRmfTPGjH3w2PpEL9uucgxDmg//6
 vzH247anaUTrYGWXfvts/VjqLJCbxC6+/o6brawA2Zk9eU5BLMbWLqqFImoiG7dSWoUI
 BHyQ==
X-Gm-Message-State: AOAM5331XGbj93gX+DIQlXnMIrclxMKfuqsstu6docJgSI2+T7hlPInJ
 3+Gy4JXB4iidH/zHj0wIBU1aIbBWJFI=
X-Google-Smtp-Source: ABdhPJzg+CLrywdDMmGFeUZorHXJ4zDlioU3fVNhz+NnzsGewjBGpvicv3nfvdtyjgEsHHwzNnIsxQ==
X-Received: by 2002:adf:b19b:: with SMTP id q27mr8944490wra.125.1635455482012; 
 Thu, 28 Oct 2021 14:11:22 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t6sm3939777wrw.78.2021.10.28.14.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:11:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 32/32] target/mips: Adjust style in msa_translate_init()
Date: Thu, 28 Oct 2021 23:08:43 +0200
Message-Id: <20211028210843.2120802-33-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
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

While the first 'off' variable assignment is unused, it helps
to better understand the code logic. Move the assignation where
it would have been used so it is easier to compare the MSA
registers based on FPU ones versus the MSA specific registers.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index a1455ca6fa7..7576b3ed86b 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -132,13 +132,15 @@ void msa_translate_init(void)
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


