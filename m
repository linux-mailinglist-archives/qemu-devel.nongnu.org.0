Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D436332A57
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:25:38 +0100 (CET)
Received: from localhost ([::1]:56644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeEr-0003hE-48
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:25:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdoI-0005PA-3Y
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:10 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:33575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdoG-0002lI-LS
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:09 -0500
Received: by mail-ej1-x62a.google.com with SMTP id jt13so28541040ejb.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ojzk+UxSXUhcgOZdi1Uf7LIU+cGA5mYtHqo7d+CsWTY=;
 b=KnAaUUH71gOXJL/zitcQflMHbqrUPrumv4DKfTbSx+vBIXV/ZFARk/SsTBfvMOvqT0
 dxtMEgF+B6O8/NnrK3my8s5yg99+z1oFN1v/XdVtI+1SwVE9j6ynQFGEFEq4cSbyyzdH
 pVNYCgF5JgxDp/wsnDvugXSKGvKNM9iMwwO7nBrW9zT1uMO0l/hSAAx2NhewhS1klIla
 gyBLQrNa8jmhoS+WUOPs02MjtjIH6loEJTUpzQ33jCPlBNkbJnEfXNlADHN49jL2zpMt
 HzmPnw9eqrva9ZWKxQbeCjF9HtDPT4ykQ7nIS45wmepu+eCEuKLM7wyIb20T+5bcS9Fu
 iKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ojzk+UxSXUhcgOZdi1Uf7LIU+cGA5mYtHqo7d+CsWTY=;
 b=kjaVriD2VrSUEpThy8BRcTw2Y9ef5lRrSInWuKXL2BvBPvCWY4xb+4lY/Vgak018bH
 ZqOHYau0D7tnH8mqyHIGyHgXsi/QHA/7SmC9Nflibjc7YY5lG5PbH9Yk1I8GVAfEYHA3
 RYVFY4RsdgVutEZM1a6brnsYzU/zgOgFh1SixtGgEvQsnjio3zQ52cWKWOXN2gc4PCVy
 eg38ZcMiw75NoTXHO8SKjwQN9gANQnvhVOei7rwascrY70iu1FyEUB/PePbfc/qm520L
 BUF1/mUFO98g+AhheIYbcyNTMSEvugvvv983snAlZI82DcDvnfBuSFtYM3Ms4a0x0uKM
 XGqA==
X-Gm-Message-State: AOAM533nhWzNhsYkjuoccRcYS01a1xIoo7WhygTH2uBoghEqRyNTDDFM
 YtHgo/iV2xBBc+RN7mubtJL+ch+hmp4=
X-Google-Smtp-Source: ABdhPJwBGxPTRPbcYvNTnWf8f3FmrCm5XzX4DMdt0g2lsxSiSuSNawLz3rdAi1YZO8tG6BKJcaZQ4Q==
X-Received: by 2002:a17:906:b6cc:: with SMTP id
 ec12mr20614724ejb.520.1615301886997; 
 Tue, 09 Mar 2021 06:58:06 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a26sm10120226edm.15.2021.03.09.06.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:58:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 14/22] target/mips/tx79: Introduce PCGT* (Parallel
 Compare for Greater Than)
Date: Tue,  9 Mar 2021 15:56:45 +0100
Message-Id: <20210309145653.743937-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
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
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the 'Parallel Compare for Greater Than' opcodes:

 - PCGTB (Parallel Compare for Greater Than Byte)
 - PCGTH (Parallel Compare for Greater Than Halfword)
 - PCGTW (Parallel Compare for Greater Than Word)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210214175912.732946-21-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  3 +++
 target/mips/tx79_translate.c | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index cfe721755ca..63fbe9694bb 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -32,8 +32,11 @@ MTLO1           011100 .....  0000000000 00000 010011   @rs
 # MMI0
 
 PSUBW           011100 ..... ..... ..... 00001 001000   @rs_rt_rd
+PCGTW           011100 ..... ..... ..... 00010 001000   @rs_rt_rd
 PSUBH           011100 ..... ..... ..... 00101 001000   @rs_rt_rd
+PCGTH           011100 ..... ..... ..... 00110 001000   @rs_rt_rd
 PSUBB           011100 ..... ..... ..... 01001 001000   @rs_rt_rd
+PCGTB           011100 ..... ..... ..... 01010 001000   @rs_rt_rd
 PEXTLW          011100 ..... ..... ..... 10010 001000   @rs_rt_rd
 PEXTLH          011100 ..... ..... ..... 10110 001000   @rs_rt_rd
 PEXTLB          011100 ..... ..... ..... 11010 001000   @rs_rt_rd
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 8dd510c2719..f0e3d8c0b66 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -285,18 +285,36 @@ static bool trans_parallel_compare(DisasContext *ctx, arg_rtype *a,
     return true;
 }
 
+/* Parallel Compare for Greater Than Byte */
+static bool trans_PCGTB(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_compare(ctx, a, TCG_COND_GE, 8);
+}
+
 /* Parallel Compare for Equal Byte */
 static bool trans_PCEQB(DisasContext *ctx, arg_rtype *a)
 {
     return trans_parallel_compare(ctx, a, TCG_COND_EQ, 8);
 }
 
+/* Parallel Compare for Greater Than Halfword */
+static bool trans_PCGTH(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_compare(ctx, a, TCG_COND_GE, 16);
+}
+
 /* Parallel Compare for Equal Halfword */
 static bool trans_PCEQH(DisasContext *ctx, arg_rtype *a)
 {
     return trans_parallel_compare(ctx, a, TCG_COND_EQ, 16);
 }
 
+/* Parallel Compare for Greater Than Word */
+static bool trans_PCGTW(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_compare(ctx, a, TCG_COND_GE, 32);
+}
+
 /* Parallel Compare for Equal Word */
 static bool trans_PCEQW(DisasContext *ctx, arg_rtype *a)
 {
-- 
2.26.2


