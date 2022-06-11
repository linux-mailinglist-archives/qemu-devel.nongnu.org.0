Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894C65473E4
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:44:24 +0200 (CEST)
Received: from localhost ([::1]:56816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzybP-0000nn-Jg
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyR5-0001pp-Ks
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:44 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyR4-0006BC-76
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:43 -0400
Received: by mail-wr1-x436.google.com with SMTP id o16so1489527wra.4
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bal8ZKCqz3Fet60H5OB1zckPM9A11UHakCg63aKImjc=;
 b=FNBbzwaTMI66qoaWq43e4lIlLntyx9vNqC8fKuWpA9xZ9TNqqTPfOp8WDupka3o6S8
 A402pK18HTU2HgrpZ/gGmc3svjEhu+hl+XK9fhXNbmByFts/6a2JGNyy6m591NYzuyc9
 4+dvIHYtXmcllXK66gsIxlOf/j79kN8EFEhbTynxyV5+4tur+3SXRu4jxXhGfaLXxMhl
 mF7YIapvkHqme+mjfQS0rb9DnLl0Kd8qpYFQE9X541BGp3E1XxPrcNvbTNWtbbkc4Glj
 0itAUbKRADsmpg5piaCsoJCrI2J9atNybsMoBfcK/nq3OcUwJBvMdhHAt5Ie10EcGHkk
 zWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bal8ZKCqz3Fet60H5OB1zckPM9A11UHakCg63aKImjc=;
 b=zhSsdD3/WpCF+EfS7FA70ZG4qF6grvn09fX/BKSnIxpncW4bqiddnNvdCXede36XfP
 lTtoULXfDq2RuUxV/dyzWKj5HiDbZvDCcLqMwE93rFNLgNU9Rke5UVaB1i8fbIEej0QD
 FKsohLwNAu61+hxQs1/MC7tA7IMO9SBqhOp15+wl+JIYyzEG6aemGF6hgyjUbxbNANrF
 d3jwm5LuKfk0vhydjQGvq5x4toEZ0p6jwBcnr0zovPHdQDL/g+EKDmCga+/a4kBYEDhO
 j8pQbpZ/tXrSZWoiyNOaj0cHKCGwo0+TV1POGdvER9E8F/7X9O5HZ5RanVS+Ph0EXMTl
 mMWw==
X-Gm-Message-State: AOAM530BWbNwp+6s2BFJa1WvcbRIBUPwEpPMqkI+2dMf6CNV9hp0Cbqa
 r3NWUk5f50Tf1yeXH+VH4d33WgWqSa8=
X-Google-Smtp-Source: ABdhPJyPt4H2CoLt4ZxkUuiTSON9fgk4ILfVskN5s7NoXVgWwV0uvZJENztYuBDBmbGK8oqTZWLHlQ==
X-Received: by 2002:a5d:6283:0:b0:213:b939:826d with SMTP id
 k3-20020a5d6283000000b00213b939826dmr43591535wru.543.1654943620716; 
 Sat, 11 Jun 2022 03:33:40 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 m5-20020a056000008500b00213d75491b0sm2128554wrx.48.2022.06.11.03.33.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:33:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ni Hui <shuizhuyuanluo@126.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 05/49] target/mips: Do not treat msa INSERT as NOP when wd is
 zero
Date: Sat, 11 Jun 2022 12:32:28 +0200
Message-Id: <20220611103312.67773-6-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ni Hui <shuizhuyuanluo@126.com>

Only for msa COPY_U/COPY_S with wd zero, we treat it as NOP.

Move this special rule into COPY_U and COPY_S trans function.

Fixes: 97fe675519 ("target/mips: Convert MSA COPY_S and INSERT opcodes to decodetree")
Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220503130708.272850-4-shuizhuyuanluo@126.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 92ccc6f921..0b3dd0957c 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -603,11 +603,6 @@ static bool trans_msa_elm_fn(DisasContext *ctx, arg_msa_elm_df *a,
         return true;
     }
 
-    if (a->wd == 0) {
-        /* Treat as NOP. */
-        return true;
-    }
-
     gen_msa_elm[a->df](cpu_env,
                        tcg_constant_i32(a->wd),
                        tcg_constant_i32(a->ws),
@@ -624,6 +619,11 @@ static bool trans_msa_elm_fn(DisasContext *ctx, arg_msa_elm_df *a,
 
 static bool trans_COPY_U(DisasContext *ctx, arg_msa_elm_df *a)
 {
+    if (a->wd == 0) {
+        /* Treat as NOP. */
+        return true;
+    }
+
     static gen_helper_piii * const gen_msa_copy_u[4] = {
         gen_helper_msa_copy_u_b, gen_helper_msa_copy_u_h,
         NULL_IF_MIPS32(gen_helper_msa_copy_u_w), NULL
@@ -634,6 +634,11 @@ static bool trans_COPY_U(DisasContext *ctx, arg_msa_elm_df *a)
 
 static bool trans_COPY_S(DisasContext *ctx, arg_msa_elm_df *a)
 {
+    if (a->wd == 0) {
+        /* Treat as NOP. */
+        return true;
+    }
+
     static gen_helper_piii * const gen_msa_copy_s[4] = {
         gen_helper_msa_copy_s_b, gen_helper_msa_copy_s_h,
         gen_helper_msa_copy_s_w, NULL_IF_MIPS32(gen_helper_msa_copy_s_d)
-- 
2.36.1


