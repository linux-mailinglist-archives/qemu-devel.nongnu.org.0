Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F087B5693BD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:59:54 +0200 (CEST)
Received: from localhost ([::1]:42992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9C7l-0002A0-FF
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BML-0000gC-9m; Wed, 06 Jul 2022 16:10:55 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:36561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMH-0003eD-IZ; Wed, 06 Jul 2022 16:10:51 -0400
Received: by mail-vs1-xe32.google.com with SMTP id u187so4890570vsb.3;
 Wed, 06 Jul 2022 13:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bFGrPEFyufuCe0ts8UsTC0G5asxBBZrjsNxzl1kPsK0=;
 b=FFmzYU39CpahXlb1UsL7i9VxYaueFhca590qomvT1Hvibgcrk5JXQa5xw0jx/46ldA
 hFlBJo/RvRVEjm6twnuGS7aonZn0kCnFj2MDKnmjWEgBnihcmN27/FgQwsrWu8CUwdxa
 ly2BR7IoObk5kxBSIFEKGdzIQ/lYrj6tmNYI4beHmfpcl7lkdDFrQu6nU+/4aI8NR8TE
 OGWWGAcD0LjdHQcdqe78tGbGT66rpxjrBxp9LSBrAjSXa2BAC8xxRvsF8oFkFXKANIPn
 mEofkmKFcp/fYGYHfkeCI9btrRCMNFucX2F5yRwTivLT7Qt5dSKeAXk8QA4e0Y52NskB
 m1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bFGrPEFyufuCe0ts8UsTC0G5asxBBZrjsNxzl1kPsK0=;
 b=UjCsuDgeohvqANOlFEJcXIfG7wMjly+MLFMr0PBKOUPtB8auOjaw0kYD/XkIhL5CmM
 qXcoGQS1AY8qTuiXSNY3h7CXFdMLatEZqzCE63qH4nDUsgiswwLTn9Y3HSXbbmjk/wwV
 3RIvGDDUx2sNlF1xAB4IthLRt43Wj6zl/MhcUqSBwUVfMS0tKeC7Lau3PpO35IsHDObc
 KIQ4eZOYTrjjysN9d6d2zQTQHeOu/FkT5+aakgAizzpteaWp4g1h7SjpToMFm7BWldtK
 tm8ueTFMrrkzMRYmCGu537LB1RipidNqdP93rFI9jetSVR8vNdZ39jmvW0+o922KsbOz
 6NEw==
X-Gm-Message-State: AJIora/8NLLImcBX9EKrIxrZBUHctRojCpOM14KZvt4Abgv2x+iXu+Yx
 3t1Mifvz86O5UQDLXdYHXEq+FsZrSg8=
X-Google-Smtp-Source: AGRyM1vP2YjpQ4oMApC7Y+s57wGyrJhwr3syl3GKIX+VndqRXLaZcROtBKUbaO14AOgJYIfB/dL+SQ==
X-Received: by 2002:a05:6102:11f8:b0:356:27c5:14cb with SMTP id
 e24-20020a05610211f800b0035627c514cbmr22510915vsg.58.1657138248335; 
 Wed, 06 Jul 2022 13:10:48 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:48 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 29/34] target/ppc: implement addg6s
Date: Wed,  6 Jul 2022 17:09:41 -0300
Message-Id: <20220706200946.471114-30-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implements the following Power ISA v2.06 instruction:
addg6s: Add and Generate Sixes

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <20220629162904.105060-10-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode                   |  4 +++
 target/ppc/translate/fixedpoint-impl.c.inc | 37 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index e5770bcc16..af8ba9ca9b 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -311,6 +311,10 @@ CNTTZDM         011111 ..... ..... ..... 1000111011 -   @X
 PDEPD           011111 ..... ..... ..... 0010011100 -   @X
 PEXTD           011111 ..... ..... ..... 0010111100 -   @X
 
+## BCD Assist
+
+ADDG6S          011111 ..... ..... ..... - 001001010 -  @X
+
 ### Float-Point Load Instructions
 
 LFS             110000 ..... ..... ................     @D
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 1aab32be03..490e49cfc7 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -492,3 +492,40 @@ static bool trans_PEXTD(DisasContext *ctx, arg_X *a)
 #endif
     return true;
 }
+
+static bool trans_ADDG6S(DisasContext *ctx, arg_X *a)
+{
+    const uint64_t carry_bits = 0x1111111111111111ULL;
+    TCGv t0, t1, carry, zero = tcg_constant_tl(0);
+
+    REQUIRE_INSNS_FLAGS2(ctx, BCDA_ISA206);
+
+    t0 = tcg_temp_new();
+    t1 = tcg_const_tl(0);
+    carry = tcg_const_tl(0);
+
+    for (int i = 0; i < 16; i++) {
+        tcg_gen_shri_tl(t0, cpu_gpr[a->ra], i * 4);
+        tcg_gen_andi_tl(t0, t0, 0xf);
+        tcg_gen_add_tl(t1, t1, t0);
+
+        tcg_gen_shri_tl(t0, cpu_gpr[a->rb], i * 4);
+        tcg_gen_andi_tl(t0, t0, 0xf);
+        tcg_gen_add_tl(t1, t1, t0);
+
+        tcg_gen_andi_tl(t1, t1, 0x10);
+        tcg_gen_setcond_tl(TCG_COND_NE, t1, t1, zero);
+
+        tcg_gen_shli_tl(t0, t1, i * 4);
+        tcg_gen_or_tl(carry, carry, t0);
+    }
+
+    tcg_gen_xori_tl(carry, carry, (target_long)carry_bits);
+    tcg_gen_muli_tl(cpu_gpr[a->rt], carry, 6);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(carry);
+
+    return true;
+}
-- 
2.36.1


