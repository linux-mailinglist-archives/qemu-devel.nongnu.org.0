Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F06B591143
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 15:18:05 +0200 (CEST)
Received: from localhost ([::1]:39546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMUY7-0007by-U9
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 09:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1oMUTU-0002ov-IV
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 09:13:16 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:35757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1oMUTQ-0001gL-39
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 09:13:14 -0400
Received: by mail-lj1-x22b.google.com with SMTP id l21so925990ljj.2
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 06:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ixI1TlD3gg+it4H/Ncl3Spin19APaasX6jZ6LF0hhFg=;
 b=fxJ1nkf6BiZg51l1xsdgQNR3SBur+cY2xlpc7pLmchN5XOR2U1Pn1rATR0eUydsL8M
 iuAHiYngAYnSMyjxCrqCIdC/rHjNZMQQ7+tOzGeodusvJ34iKAcz1yk1r+XhYxYc56No
 13XTmecrMOUx5dxmPQr+PGs6LdBh4nw2KgHNuDpkVDXyCrR3wYpDWTj4uGCS3zm04pVh
 VcoyxGXCLzdzaERE+roKi7VdnruPh5BGz4ZYmRty9KOubxQ8j/sEZmliVSB5puTNPbHM
 XWel5mdOoxRhKH/4pY0uyXd3VQCiIqVrOyCJOcCvltYsAQZzInWvJG9aoHTjVvDxgfhl
 iPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ixI1TlD3gg+it4H/Ncl3Spin19APaasX6jZ6LF0hhFg=;
 b=uP6XuDYEu57U7ngQjFVIV7qULaHsILYi/xjtKfD3Y2GHiB1rka8u/qeWfwk8E4mSIs
 lcKqXcZyM4La7P+vTWABnIuN4AsIybiWRRNnuOrkx4BQdFGYRT7edMpneP+d+Wg8FWUY
 EJLOvoAA1ufiY7oGl/nDeXv2hwMMOfP7CdtaVjFVcdybJB/vi5CrsjYHoU2sDeq3L6fw
 95qtnIR7g/kUBsVXZN+cmDSAGdg8bA7FOyYPDZnUMIFVPgFCFz+E8wFg1qJsiIicEGEF
 jiVjmyLQjep6SlFU4IyCFAlA+9qE0xwxTT7vaFVb0v3eIG+vyu/y7xIIe9AuitHO4mTE
 4yaw==
X-Gm-Message-State: ACgBeo1rsuOOY6pCJrxzfvspNikHn9f0OWJI5rIv84SMPIgmeTX0tIxV
 +xfcj89pehuuxBKI03mac2IO9UiZSVA4zw==
X-Google-Smtp-Source: AA6agR7DyrGf5J9fcKw/vaWH3B5rZzoVSdtwRWHNmB+0/LA7MXkKcxLVaKaL4eMI21QOPvJrg0DfEw==
X-Received: by 2002:a05:651c:2120:b0:25e:5145:38b0 with SMTP id
 a32-20020a05651c212000b0025e514538b0mr1222012ljq.191.1660309990243; 
 Fri, 12 Aug 2022 06:13:10 -0700 (PDT)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a2eb5a8000000b0025e72aae6bdsm356151ljn.28.2022.08.12.06.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 06:13:09 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 2/2] target/riscv: fence: reconcile with specification
Date: Fri, 12 Aug 2022 15:13:04 +0200
Message-Id: <20220812131304.1674484-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812131304.1674484-1-philipp.tomsich@vrull.eu>
References: <20220812131304.1674484-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Our decoding of fence-instructions is problematic in respect to the
RISC-V ISA specification:
- rs and rd are ignored, but need to be 0
- fm is ignored

This change adjusts the decode pattern to enfore rs and rd being 0,
and validates the fm-field (together with pred/succ for FENCE.TSO) to
determine whether a reserved instruction is specified.

While the specification allows UNSPECIFIED behaviour for reserved
instructions, we now always raise an illegal instruction exception.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

---

 target/riscv/insn32.decode              |  2 +-
 target/riscv/insn_trans/trans_rvi.c.inc | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 089128c3dc..4e53df1b62 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -150,7 +150,7 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
 sra      0100000 .....    ..... 101 ..... 0110011 @r
 or       0000000 .....    ..... 110 ..... 0110011 @r
 and      0000000 .....    ..... 111 ..... 0110011 @r
-fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
+fence    fm:4 pred:4 succ:4 00000 000 00000 0001111
 fence_i  000000000000     00000 001 00000 0001111
 csrrw    ............     ..... 001 ..... 1110011 @csr
 csrrs    ............     ..... 010 ..... 1110011 @csr
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index ca8e3d1ea1..515bb3b22a 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -795,7 +795,24 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
 
 static bool trans_fence(DisasContext *ctx, arg_fence *a)
 {
-    /* FENCE is a full memory barrier. */
+    switch (a->fm) {
+    case 0b0000:
+         /* normal fence */
+         break;
+
+    case 0b0001:
+         /* FENCE.TSO requires PRED and SUCC to be RW */
+         if (a->pred != 0xb0011 || a->succ != 0b0011) {
+            return false;
+         }
+         break;
+
+    default:
+        /* reserved for future use */
+        return false;
+    }
+
+    /* We implement FENCE(.TSO) is a full memory barrier. */
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
     return true;
 }
-- 
2.34.1


