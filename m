Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920FB332ACD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:43:22 +0100 (CET)
Received: from localhost ([::1]:51032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeW1-0008RX-Jk
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdof-0005kg-Rk
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:34 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdoe-0002sf-Fd
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:33 -0500
Received: by mail-ed1-x531.google.com with SMTP id d13so20780595edp.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gHWKjcJBF2z8bEAukiKiBUIE3a11RI/Qsu47KnxKfMQ=;
 b=gtJFlNFjbUvQF3cCQBpni8Jbt3EsR31q6+Yyyv1TguFXDWQ7NWJapzfWE5rZssu+Nt
 /0qu98tLxiDPx/+Iw1zQKTB7Utzr2bDBzc2qbJ7dwZnz7EZvAeLlFuOriJKoGP+Trm/m
 J+RghFrj4tfBDe6dJvkFMaHD15PVbcSE21FU3jpanH3xuSbgeMfUFQiyS7hOqH2ZwH5z
 UdjLJmbB4LwgcLK4BgrPi0ZS+cd/+XRN1qQnbrGVdy2cA3IsJjZyfPVCHZ4q8djkkwng
 jdqmCKAp+OdXKoa1MhWnTqzM2G39HKFbmDHKhgy/0EdKpuybT1R+M9j7O5uEzRR1E96r
 tBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gHWKjcJBF2z8bEAukiKiBUIE3a11RI/Qsu47KnxKfMQ=;
 b=fKWO560qoM+WmtsWXbeM0r4eKQuzXCILKArSiB2Wq9lFIqx7hI/hZAXZsahrEOj5Xt
 KIuZC8j6HDg3TKqJrQlUt5IDpAH6Wt2TTbwOc56gwTIyjzgTcx17ta1DgoyecCo/4+pz
 aGT8bQJD6s8KHaL0MbWlS58kKjz+3dhAabgLLxvDoeQZyznVqopRn6A8KAtxwmNut+Ki
 qgHL/Oo+izfl2jhW6YyEySIeQyRT+YgqfvCJy3+8X7plgRb6f73t1EtGz3Mfw6nuneWT
 al4yNXYuHoCQRY9p/wE0zeDMwJgzkmdacDRMy/0EAmb3jZxnvmJXoav431pPn4aDcbEf
 B/Yg==
X-Gm-Message-State: AOAM533ZJn4hhI1QqTKXEMuxxizKAzs+cjXitCS2BUioTQ6BlpwW8ITh
 xWy2V7hT1Pal3/Q1PfYHF3MRfcNHqLc=
X-Google-Smtp-Source: ABdhPJxu0uf2nFfJ/mPWPvAtZdEyDTCmOeb1ncstwHXT/aCltrxfxYBqNmNuMtHk+GvtFS7ct3j+jA==
X-Received: by 2002:a05:6402:84b:: with SMTP id
 b11mr4517401edz.56.1615301907286; 
 Tue, 09 Mar 2021 06:58:27 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id eo22sm8687735ejc.0.2021.03.09.06.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:58:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 18/22] target/mips/tx79: Introduce PROT3W opcode
 (Parallel Rotate 3 Words)
Date: Tue,  9 Mar 2021 15:56:49 +0100
Message-Id: <20210309145653.743937-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x531.google.com
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

Introduce the PROT3W opcode (Parallel Rotate 3 Words).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-25-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  1 +
 target/mips/tx79_translate.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 0ea9fc95568..79001359242 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -56,6 +56,7 @@ PAND            011100 ..... ..... ..... 10010 001001   @rs_rt_rd
 PXOR            011100 ..... ..... ..... 10011 001001   @rs_rt_rd
 PEXEH           011100 00000 ..... ..... 11010 001001   @rt_rd
 PEXEW           011100 00000 ..... ..... 11110 001001   @rt_rd
+PROT3W          011100 00000 ..... ..... 11111 001001   @rt_rd
 
 # MMI3
 
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index b23e0a1b048..f1c6546d70c 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -685,3 +685,31 @@ static bool trans_PEXEW(DisasContext *ctx, arg_rtype *a)
 
     return true;
 }
+
+/* Parallel Rotate 3 Words Left */
+static bool trans_PROT3W(DisasContext *ctx, arg_rtype *a)
+{
+    TCGv_i64 ax;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+    if (a->rt == 0) {
+        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
+        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
+        return true;
+    }
+
+    ax = tcg_temp_new_i64();
+
+    tcg_gen_mov_i64(ax, cpu_gpr_hi[a->rt]);
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], ax, cpu_gpr[a->rt], 0, 32);
+
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rt], ax, 0, 32);
+    tcg_gen_rotri_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], 32);
+
+    tcg_temp_free(ax);
+
+    return true;
+}
-- 
2.26.2


