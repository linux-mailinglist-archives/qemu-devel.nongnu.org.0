Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2D531B1DD
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:17:33 +0100 (CET)
Received: from localhost ([::1]:50052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLxc-0000w8-7V
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhp-0008Ie-ID
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:14 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLho-0004a9-4d
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:13 -0500
Received: by mail-wm1-x32c.google.com with SMTP id u5so1454128wmj.0
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bI06XcKqe7voqlmnN0Ni9BCHVcOL6c8u6SgLqvaJdHk=;
 b=Zm7pmnLFU1Bwl4D7ELqV3AoaZFQZvr8I5WFqtHkXC6bEKZ1s55WzUpL8hfzZQB8gSV
 YqpBJJb+9GOkqvl7C41GLZcnh+h/YkKwLhSvkHAz6vEOMx/ZK7dF0yQgeZQVspPJR1X8
 KOYisSUdOUssgVoTTzY9FHPrWABzxNVr+wbQNcFPWime5hvkOc/yaWQFWLHLjvIU0Fnu
 Kzm3W2yT29qzisZ5bzj53hkBrOG8fEzWrVdXyjm8yDHfdOmJKXnlEjHmzu6tnEXoPkyu
 mJ3S+0tNOd0rne0A7LXWB1n1UDounF6vA4kv2QGO9qakJOsHOy0WHUgjhkyLbcM6vLXm
 FMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bI06XcKqe7voqlmnN0Ni9BCHVcOL6c8u6SgLqvaJdHk=;
 b=IX8Usn9ulR/zNe95ZCnsGmwO8khFE7sygiZxCwhI7cHJHq2idwAwcqCKEqqlyqWIpg
 4HkICldnhNbjVZeKhNEC9+iLikyW/izNTkbens/NcvGrkQivqupPGjlnHR0T8Cr0o3Dh
 e+1hW7/Tl3jAK7LmSmP/A+xcuvJ+ATuWubub1RDTh8iWYdAe7DOMF/eytQ31XVOv+9l7
 r4c6OyHNQAHfQHVZxKWxMvhdUGPnJ3s5wXzSNbWurbmyT0TG6GFvltt8h6uJmPQoBMZS
 yMj5umVy61q15+MLuJYwO7RiUdlBje3Df0IN7Yu+9mHS3c5qi87srWnhcHYia10wP6Oe
 b4yA==
X-Gm-Message-State: AOAM5322JK79Z0bf8wbTbQYqO6gb6rWz55s4TzAqUttFw/LcIJWbQfSY
 r+csfiBTDTXyxY64cFLFzRk7ZIqZdeU=
X-Google-Smtp-Source: ABdhPJwKfjnk7tT1zArmHlDM1zls0c8BFfsZytZCACcy6TBsJ0l9vqWIcHXYDrKHAapLFuNvGhTkSg==
X-Received: by 2002:a7b:c08f:: with SMTP id r15mr10864259wmh.113.1613325670286; 
 Sun, 14 Feb 2021 10:01:10 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t198sm12710979wmt.7.2021.02.14.10.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:01:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 23/42] target/mips/tx79: Introduce PEXE[HW] opcodes
 (Parallel Exchange Even)
Date: Sun, 14 Feb 2021 18:58:53 +0100
Message-Id: <20210214175912.732946-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the PEXEH (Parallel Exchange Even Halfword) and PEXEW
(Parallel Exchange Even Word) opcodes.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  2 ++
 target/mips/tx79_translate.c | 70 ++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index fbd2be569ad..0ea9fc95568 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -54,6 +54,8 @@ PEXTUW          011100 ..... ..... ..... 10010 101000   @rs_rt_rd
 PCPYLD          011100 ..... ..... ..... 01110 001001   @rs_rt_rd
 PAND            011100 ..... ..... ..... 10010 001001   @rs_rt_rd
 PXOR            011100 ..... ..... ..... 10011 001001   @rs_rt_rd
+PEXEH           011100 00000 ..... ..... 11010 001001   @rt_rd
+PEXEW           011100 00000 ..... ..... 11110 001001   @rt_rd
 
 # MMI3
 
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 47d84c465a2..59451a043a4 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -683,3 +683,73 @@ static bool trans_PINTEH(DisasContext *ctx, arg_rtype *a)
 
     return true;
 }
+
+/* Parallel Exchange Even Halfword */
+static bool trans_PEXEH(DisasContext *ctx, arg_rtype *a)
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
+    /* Lower halve */
+    tcg_gen_mov_i64(ax, cpu_gpr[a->rt]);
+    if (a->rd != a->rt) {
+        tcg_gen_mov_i64(cpu_gpr[a->rd], cpu_gpr[a->rt]);
+    }
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], ax, 32, 16);
+    tcg_gen_shri_i64(ax, ax, 32);
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], ax, 0, 16);
+
+    /* Upper halve */
+    tcg_gen_mov_i64(ax, cpu_gpr_hi[a->rt]);
+    if (a->rd != a->rt) {
+        tcg_gen_mov_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rt]);
+    }
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], ax, 32, 16);
+    tcg_gen_shri_i64(ax, ax, 32);
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], ax, 0, 16);
+
+    tcg_temp_free(ax);
+
+    return true;
+}
+
+/* Parallel Exchange Even Word */
+static bool trans_PEXEW(DisasContext *ctx, arg_rtype *a)
+{
+    TCGv_i64 ah, al;
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
+    ah = tcg_temp_new_i64();
+    al = tcg_temp_new_i64();
+
+    gen_load_gpr(ah, a->rt);
+    gen_load_gpr_hi(al, a->rt);
+
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], ah, al, 0, 32);
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], al, ah, 0, 32);
+
+    tcg_temp_free(al);
+    tcg_temp_free(ah);
+
+    return true;
+}
-- 
2.26.2


