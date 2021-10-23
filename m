Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0364385C2
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:14:45 +0200 (CEST)
Received: from localhost ([::1]:58730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mePHo-0008KB-Nj
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOum-0008Cq-BS
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:56 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOug-0006M8-BQ
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:55 -0400
Received: by mail-wr1-x435.google.com with SMTP id e12so4790301wra.4
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QX0MqgtzyZKOctor19fJypxbHtnwnz4pOB3v/AvZpLk=;
 b=a9WAet9wlHs/m6yUXVfaEv9ZQHmNcINmLCfX2FwCy+oPlBiSWkaVSCIt7dk1NeuD1W
 LcQW7WIOKgE+4/y8RYJOad9vONB0qjptd8eeDTppAOg7vPlct4et5G17sUNuCoWx97d6
 4TxmHr9RYMe1RT0RY6GaaOW+I/lr3r+ixb4kqZEBG3Wl0i/YxYwrNDk/Dp/EsrwojsAD
 31O4DoHWixW6QvQOIA5xTocWei7y6IxYpdZhjI0DGn56cJPMUOWccj8UhabsfzxOo05Q
 VeNTgpfUu5m71rIxZVFVRa+uIuH6lwXSd8gSQ55OJrPZ5jmBdTVu3RKaxtvDPBa95Okl
 TSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QX0MqgtzyZKOctor19fJypxbHtnwnz4pOB3v/AvZpLk=;
 b=pOMoT6FEknO9iOPtojgmZoG+/6Y/Xx+VW4WyYn+4yjzG0zEwh85nWXsuG/m3VRSwqY
 1VTmTe5Qxn5UKwTj5aYwh2gl7lNCuXOH06xMVpNz6T5zo6tfFILpguzoBy6wntrVs+7y
 sdFfSbHBHoHlJn4asMtkznabxjqm1VQmSCRfmRsXAiRcp4xfSJuthRJa4HQx1EzraB9l
 VZRaxC2s8h7w4GZkpHJtpPOeI2055a1aekNQSouT3Bhsl3As/eb0WhIit0zkqDOWFlJ4
 evIni4b0p8145pd6lKrUse/ki0NkGTplYsdLElp+RJ9RAXxD0DO7fT1ZBwBiAsEuCL0k
 2uyw==
X-Gm-Message-State: AOAM530XnVg5Y7JvTl7WJr6FGsbBst6HR4HVDcaB81IlXvErM5MYbdst
 B+NgkSRSM27ING78srj8gbNLDVxX2aE=
X-Google-Smtp-Source: ABdhPJzwzbWy4hC6N9VL4jOhne6J1b8w6nWQ24GmtOpZ6a8lxON6prJKBAxJBSU/vKsUHrl36LVyDA==
X-Received: by 2002:a05:6000:128f:: with SMTP id
 f15mr10517415wrx.143.1635025848768; 
 Sat, 23 Oct 2021 14:50:48 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 c17sm11722128wmk.23.2021.10.23.14.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:50:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 33/33] target/mips: Adjust style in msa_translate_init()
Date: Sat, 23 Oct 2021 23:48:03 +0200
Message-Id: <20211023214803.522078-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the first 'off' variable assignment is unused, it helps
to better understand the code logic. Move the assignation where
it would have been used so it is easier to compare the MSA
registers based on FPU ones versus the MSA specific registers.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 5d8cad378e6..d196cad196b 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -80,13 +80,15 @@ void msa_translate_init(void)
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


