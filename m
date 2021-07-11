Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837BF3C3F71
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:15:55 +0200 (CEST)
Received: from localhost ([::1]:45158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gnq-0006Gd-JJ
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZI-0006Wl-Sw
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:00:54 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZH-0000gw-Ff
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:00:52 -0400
Received: by mail-wm1-x32f.google.com with SMTP id w13so9968905wmc.3
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mjXB+zPeQIFAsPvYWp38CYfARqfaG/PAvXs8iGg2ke0=;
 b=RXBd+hYmH/ZaXCnpLC1xzix/ECIAAuOBeRkAsdcRIAvMwddM0bq2tscm+A5CXQZoVU
 R4DBtWlCCwCB26e6Bcg5PxDHKdF7IJotUBEkX0wUXY5HwkK7xzUpg36xUzbZ5cvhb5tQ
 y7cozkxBtUC8KkAO/N2Oq4QVPGCAjdw2IINTMXe4Y/bab3xqSlLFmO5iztvuwQ0iEYPq
 oPM4sQbg67hpW3SRJINIyyJiBTLyyPUiY1YtnQzuwDlNxTlyFMeXMj57T4VuY8toy4Ht
 OxG6JpV4h2af8apC3L3WvyWIzGypxBllPLjDixj4V4d31D16npN15dS+o+NzQc8J8Igb
 7B8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mjXB+zPeQIFAsPvYWp38CYfARqfaG/PAvXs8iGg2ke0=;
 b=tRb7048n3S2oHa93Ucraud0I8us/71xaLOwsbhdTfNKgkJkxA6+mRoJTQQ4GuRN6Rr
 GGXbUz9WvnP+oj5mA05siaD3y/q6BHoRtUa4cZLQLjOBVsrOd0+zCdCZJmxMLTbKD3eq
 tB+hxvgG2qL4xQ1XuN7kKKT5mFd25MdM+0mTWWx8+ZGC5NHfaFDKk7BulpLGXLIal6xk
 cudJTvI+d9bbw78VpMwf5A3mWsMnHXaUHUoIUzM1c+P+yrtcKjW2fO7EWkXyQh88AvaJ
 1w9nmw3HEgWUiCYze05/zdiqrqj4Wk4TgYOnBmnIn0XCZ51/dIqVrhOKBWaQGmLaOwo2
 9E4Q==
X-Gm-Message-State: AOAM531TA53Wf1oSOr/5Dss+E9abOjr4VOC3iV5k28YpgvV80NPbVmyi
 UXBB0V3hWqfw6NDYb8LJ0cFEE+6W8Tr14o3N
X-Google-Smtp-Source: ABdhPJxjIIARPSlUewWS8PuehoiSim7dJxhpNnrkTxkr5enHlSsAn9z4FOydHPBLqi5gV86hMOujFQ==
X-Received: by 2002:a05:600c:4105:: with SMTP id
 j5mr29919375wmi.49.1626037250137; 
 Sun, 11 Jul 2021 14:00:50 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id p9sm11929945wrx.59.2021.07.11.14.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:00:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/19] target/mips/tx79: Introduce PEXTUW (Parallel Extend
 Upper from Word)
Date: Sun, 11 Jul 2021 23:00:02 +0200
Message-Id: <20210711210016.2710100-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the PEXTUW opcode (Parallel Extend Upper from Word).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210309145653.743937-12-f4bug@amsat.org>
---
 target/mips/tcg/tx79.decode      |  4 ++++
 target/mips/tcg/tx79_translate.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/target/mips/tcg/tx79.decode b/target/mips/tcg/tx79.decode
index d1c07c7d901..ead5f8281e5 100644
--- a/target/mips/tcg/tx79.decode
+++ b/target/mips/tcg/tx79.decode
@@ -35,6 +35,10 @@ PSUBW           011100 ..... ..... ..... 00001 001000   @rs_rt_rd
 PSUBH           011100 ..... ..... ..... 00101 001000   @rs_rt_rd
 PSUBB           011100 ..... ..... ..... 01001 001000   @rs_rt_rd
 
+# MMI1
+
+PEXTUW          011100 ..... ..... ..... 10010 101000   @rs_rt_rd
+
 # MMI2
 
 PCPYLD          011100 ..... ..... ..... 01110 001001   @rs_rt_rd
diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index 3abd1d92e70..68c56affc4c 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -290,6 +290,36 @@ static bool trans_PNOR(DisasContext *ctx, arg_rtype *a)
  * PEXTLW  rd, rs, rt        Parallel Extend Lower from Word
  */
 
+static void gen_pextw(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 a, TCGv_i64 b)
+{
+    tcg_gen_deposit_i64(dl, b, a, 32, 32);
+    tcg_gen_shri_i64(b, b, 32);
+    tcg_gen_deposit_i64(dh, a, b, 0, 32);
+}
+
+/* Parallel Extend Upper from Word */
+static bool trans_PEXTUW(DisasContext *ctx, arg_rtype *a)
+{
+    TCGv_i64 ax, bx;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    ax = tcg_temp_new_i64();
+    bx = tcg_temp_new_i64();
+
+    gen_load_gpr_hi(ax, a->rs);
+    gen_load_gpr_hi(bx, a->rt);
+    gen_pextw(cpu_gpr[a->rd], cpu_gpr_hi[a->rd], ax, bx);
+
+    tcg_temp_free(bx);
+    tcg_temp_free(ax);
+
+    return true;
+}
+
 /*
  *     Others (16 instructions)
  *     ------------------------
-- 
2.31.1


