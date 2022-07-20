Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A67157B796
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 15:36:31 +0200 (CEST)
Received: from localhost ([::1]:53320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9sM-0000aH-3Y
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 09:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1oE9q3-0006Fy-42; Wed, 20 Jul 2022 09:34:07 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:42677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1oE9q1-0002qP-7w; Wed, 20 Jul 2022 09:34:06 -0400
Received: by mail-pl1-x630.google.com with SMTP id d7so3136515plr.9;
 Wed, 20 Jul 2022 06:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7MTDbvEAPIpkUTFgAF1r39bru/i9rypwO8zET509Jqg=;
 b=mqL/mSOUH1SPT6m/OypXQC2/oN4J1oi2Ci9k9EOEF/QiCICwBi0bYqh4q1sEnPO3wR
 Fa1WAEA6dgfC53IPNQqTZgWMi89YtW6OgtR8bzYQwPUsmuQ8EbPH+1wO9C4D/MWHU3jm
 U00m7VdY42c1TvlCVCxmN/1ixRKDkfwNl2g4Sx8W1mwPe3/1yI3cF81NqXmKDotSHwp5
 IhoQnDA/xegjalnT8wJ7b35zJeDiXhWHC2yZE2dX5eCZFRd04nNHIliWoRFaCFunt7M9
 nBWavlr7coOV2Nob7PxuiQ/VZZsiVqxoZcw2tdPVUe4XibEN5qHRIajRlnf6wMjHin5c
 Zklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7MTDbvEAPIpkUTFgAF1r39bru/i9rypwO8zET509Jqg=;
 b=sDEG9bvaIDsJk0N/J+K1eEeaq5o4PZdDoaEKmMDTjyLs9BC+iTRj1CiEua/UzHG3gw
 0mF9xX8GprA3U/dn+RWVv0YITt9/4mlpd2xPLaGAtnO57THOW83kfhfPh+bXRXUh8P3j
 OlsOpDwzPpgVbbfG5xYutZ90QgNGJNGV+Z4fU+fXyX0FL1T7zcik6pAwcoyxEXX+ZvsC
 U9oHF0wIF/8HAPPGEyTG5GlMLHWyfhrCTL2nozrT7w0PsEJHof0S4mwqlNaUcXcjOCSL
 /hGcT9KbuGZBhh4VlXIPR/yK4glJAsEVBhav4WwKAty9/6n+1lQrOk/RtJLmMUhohwBv
 PoGg==
X-Gm-Message-State: AJIora8rZ3GmIEPudIF9V+rAlMGaD5gu7H86sR/TsG5N+QSktWQ9L1Qy
 UxyhCAOr0EzEKwLqrGYQJ1J4IJmbIHE=
X-Google-Smtp-Source: AGRyM1uE9LKE84iRInTZhJSOZi4Y8Y1ZT0MjCBVuaFh5pbrwGdZLQCHyh2R0GjA4kHXDFUKLmbL4nQ==
X-Received: by 2002:a17:90b:681:b0:1f2:147a:5e55 with SMTP id
 m1-20020a17090b068100b001f2147a5e55mr5434190pjz.159.1658324042581; 
 Wed, 20 Jul 2022 06:34:02 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-33-251-27.static.tpgi.com.au.
 [27.33.251.27]) by smtp.gmail.com with ESMTPSA id
 w200-20020a627bd1000000b00518e1251197sm14007936pfc.148.2022.07.20.06.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 06:34:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PATCH v3] target/ppc: Implement new wait variants
Date: Wed, 20 Jul 2022 23:33:52 +1000
Message-Id: <20220720133352.904263-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x630.google.com
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

ISA v2.06 adds new variations of wait, specified by the WC field. These
are not all compatible with the prior wait implementation, because they
add additional conditions that cause the processor to resume, which can
cause software to hang or run very slowly.

ISA v3.0 changed the wait opcode and removed the new variants (retaining
the WC field but making non-zero values reserved).

ISA v3.1 added new WC values to the new wait opcode, and added a PL
field.

This implements the new wait encoding and supports WC variants with
no-op implementations, which provides basic correctness as explained in
comments.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
v3:
- Add EXTRACT_HELPERs
- Reserved fields should be ignored, not trap.
- v3.1 defines special case of reserved PL values being treated as
  a no-op when WC=2.
- Change code organization to (hopefully) be easier to follow each
  ISA / variation.
- Tested old wait variant with Linux e6500 boot and verify that
  gen_wait is called and takes the expected path.

Thanks,
Nick

 target/ppc/internal.h  |  3 ++
 target/ppc/translate.c | 96 ++++++++++++++++++++++++++++++++++++++----
 2 files changed, 91 insertions(+), 8 deletions(-)

diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 2add128cd1..57c0a42a6b 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -168,6 +168,9 @@ EXTRACT_HELPER_SPLIT_3(DX, 10, 6, 6, 5, 16, 1, 1, 0, 0)
 /* darn */
 EXTRACT_HELPER(L, 16, 2);
 #endif
+/* wait */
+EXTRACT_HELPER(WC, 21, 2);
+EXTRACT_HELPER(PL, 16, 2);
 
 /***                            Jump target decoding                       ***/
 /* Immediate address */
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 1d6daa4608..e0a835ac90 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4066,12 +4066,91 @@ static void gen_sync(DisasContext *ctx)
 /* wait */
 static void gen_wait(DisasContext *ctx)
 {
-    TCGv_i32 t0 = tcg_const_i32(1);
-    tcg_gen_st_i32(t0, cpu_env,
-                   -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
-    tcg_temp_free_i32(t0);
-    /* Stop translation, as the CPU is supposed to sleep from now */
-    gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
+    uint32_t wc;
+
+    if (ctx->insns_flags & PPC_WAIT) {
+        /* v2.03-v2.07 define an older incompatible 'wait' encoding. */
+
+        if (ctx->insns_flags2 & PPC2_PM_ISA206) {
+            /* v2.06 introduced the WC field. WC > 0 may be treated as no-op. */
+            wc = WC(ctx->opcode);
+        } else {
+            wc = 0;
+        }
+
+    } else if (ctx->insns_flags2 & PPC2_ISA300) {
+        /* v3.0 defines a new 'wait' encoding. */
+        wc = WC(ctx->opcode);
+        if (ctx->insns_flags2 & PPC2_ISA310) {
+            uint32_t pl = PL(ctx->opcode);
+
+            /* WC 1,2 may be treated as no-op. WC 3 is reserved. */
+            if (wc == 3) {
+                gen_invalid(ctx);
+                return;
+            }
+
+            /* PL 1-3 are reserved. If WC=2 then the insn is treated as noop. */
+            if (pl > 0 && wc != 2) {
+                gen_invalid(ctx);
+                return;
+            }
+
+        } else { /* ISA300 */
+            /* WC 1-3 are reserved */
+            if (wc > 0) {
+                gen_invalid(ctx);
+                return;
+            }
+        }
+
+    } else {
+        warn_report("wait instruction decoded with wrong ISA flags.");
+        gen_invalid(ctx);
+        return;
+    }
+
+    /*
+     * wait without WC field or with WC=0 waits for an exception / interrupt
+     * to occur.
+     */
+    if (wc == 0) {
+        TCGv_i32 t0 = tcg_const_i32(1);
+        tcg_gen_st_i32(t0, cpu_env,
+                       -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
+        tcg_temp_free_i32(t0);
+        /* Stop translation, as the CPU is supposed to sleep from now */
+        gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
+    }
+
+    /*
+     * Other wait types must not just wait until an exception occurs because
+     * ignoring their other wake-up conditions could cause a hang.
+     *
+     * For v2.06 and 2.07, wc=1,2,3 are architected but may be implemented as
+     * no-ops.
+     *
+     * wc=1 and wc=3 explicitly allow the instruction to be treated as a no-op.
+     *
+     * wc=2 waits for an implementation-specific condition, such could be
+     * always true, so it can be implemented as a no-op.
+     *
+     * For v3.1, wc=1,2 are architected but may be implemented as no-ops.
+     *
+     * wc=1 (waitrsv) waits for an exception or a reservation to be lost.
+     * Reservation-loss may have implementation-specific conditions, so it
+     * can be implemented as a no-op.
+     *
+     * wc=2 waits for an exception or an amount of time to pass. This
+     * amount is implementation-specific so it can be implemented as a
+     * no-op.
+     *
+     * ISA v3.1 allows for execution to resume "in the rare case of
+     * an implementation-dependent event", so in any case software must
+     * not depend on the architected resumption condition to become
+     * true, so no-op implementations should be architecturally correct
+     * (if suboptimal).
+     */
 }
 
 #if defined(TARGET_PPC64)
@@ -6852,8 +6931,9 @@ GEN_HANDLER2(stdcx_, "stdcx.", 0x1F, 0x16, 0x06, 0x00000000, PPC_64B),
 GEN_HANDLER_E(stqcx_, 0x1F, 0x16, 0x05, 0, PPC_NONE, PPC2_LSQ_ISA207),
 #endif
 GEN_HANDLER(sync, 0x1F, 0x16, 0x12, 0x039FF801, PPC_MEM_SYNC),
-GEN_HANDLER(wait, 0x1F, 0x1E, 0x01, 0x03FFF801, PPC_WAIT),
-GEN_HANDLER_E(wait, 0x1F, 0x1E, 0x00, 0x039FF801, PPC_NONE, PPC2_ISA300),
+/* ISA v3.0 changed the extended opcode from 62 to 30 */
+GEN_HANDLER(wait, 0x1F, 0x1E, 0x01, 0x039FF801, PPC_WAIT),
+GEN_HANDLER_E(wait, 0x1F, 0x1E, 0x00, 0x039CF801, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(b, 0x12, 0xFF, 0xFF, 0x00000000, PPC_FLOW),
 GEN_HANDLER(bc, 0x10, 0xFF, 0xFF, 0x00000000, PPC_FLOW),
 GEN_HANDLER(bcctr, 0x13, 0x10, 0x10, 0x00000000, PPC_FLOW),
-- 
2.35.1


