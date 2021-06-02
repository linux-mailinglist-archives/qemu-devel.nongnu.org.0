Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166D539912B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 19:11:15 +0200 (CEST)
Received: from localhost ([::1]:49844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loUOg-00074S-63
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 13:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loULp-0002N7-FV; Wed, 02 Jun 2021 13:08:17 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loULo-0007WA-02; Wed, 02 Jun 2021 13:08:17 -0400
Received: by mail-ej1-x62c.google.com with SMTP id b9so4868328ejc.13;
 Wed, 02 Jun 2021 10:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s0JpD4r/szbVxXYNVJjt3lZvENP3umtwx9nKkKii9LU=;
 b=nfbZkVTf+VYrCzMA/ParUXifGSvCLcns/uBtdl1r5gborpPKpVfQKmYUI9sI7ABl8i
 sBmzh+TAazjgUk7b9PmVIbc2yzS7HIpnI7dAnbKy1IfM/o/INtg5/IsmvTz6IWMeHvkM
 cFPXpMWpxAD6EDIsJDbsdbP4B1a0qd38c+tbqe2U1+uskeWyxEnfXXRFUuweGthF2ThR
 1snAenti4awbulikfekMHYIEPkBowvZ2JTI4gebvGcrXYFYnzC1s+HCALX2vU1zZIvMy
 m2h2pP+IrzhBsvQoe9DEKBWmWDi72t2Fa6psccLWsxPlvofC7pKxPVY8VQNKLnqCC4IE
 4ZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s0JpD4r/szbVxXYNVJjt3lZvENP3umtwx9nKkKii9LU=;
 b=Npq0vEvkFV/07w12aITV5DnRttAw6wvRVa1SoYBUfzt4pVCvfNOvqV2MQBFSlQVws6
 yuN84HCnf0BHBfyu7dT8fmmML5ODlwwjWpi8Q54uAvuf+QEhjmudqIvK8h/YAifoynt1
 mJhoaEaXtK4krxZBiiqGy+iVHmaWoeBJ2DnE3MMtx7WP/A0EMomtolRIUc/XQJ5dgUTT
 CLRXTD/Kgj2Vtl/OT1NJ1orcsioTX+uMZOM8xyfO+o4KlLbvhyfQQpBHohmDz6ZSAzU+
 CGTqs2dCcZjW/jm5yvUiTp7mdHzd16Vm2uE2ty3p7MPMIiILkH0Dwjs/fTs93RxAXv3d
 MAbw==
X-Gm-Message-State: AOAM532gc5t8Wx/TV2ntjc+idd9svCTJewZ8Za7V/gRLmEmZcIR2eDoi
 ixKNS1tD+nii3X1GhU8cksfoKJ0bPxJpvw==
X-Google-Smtp-Source: ABdhPJyPvEwvD1zz6oe57L1crf5FNah6YKVksceBEBhBi9wCkJuCxIrnPlLfMvhK1D9F9HyCV7QCRQ==
X-Received: by 2002:a17:906:4d04:: with SMTP id
 r4mr16662445eju.76.1622653693584; 
 Wed, 02 Jun 2021 10:08:13 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id n26sm299281ejc.27.2021.06.02.10.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 10:08:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/mips: Fix 'Uncoditional' typo
Date: Wed,  2 Jun 2021 19:07:58 +0200
Message-Id: <20210602170759.2500248-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210602170759.2500248-1-f4bug@amsat.org>
References: <20210602170759.2500248-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: qemu-trivial@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix Uncoditional -> Unconditional typo.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index c03a8ae1fed..797eba44347 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -12238,7 +12238,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
     }
 
     if (bcond_compute == 0) {
-        /* Uncoditional compact branch */
+        /* Unconditional compact branch */
         switch (opc) {
         case OPC_JIALC:
             tcg_gen_movi_tl(cpu_gpr[31], ctx->base.pc_next + 4 + m16_lowbit);
@@ -19092,7 +19092,7 @@ static void gen_compute_imm_branch(DisasContext *ctx, uint32_t opc,
     ctx->base.is_jmp = DISAS_NORETURN;
 
     if (cond == TCG_COND_ALWAYS) {
-        /* Uncoditional compact branch */
+        /* Unconditional compact branch */
         gen_goto_tb(ctx, 0, ctx->btarget);
     } else {
         /* Conditional compact branch */
@@ -19201,7 +19201,7 @@ static void gen_compute_compact_branch_nm(DisasContext *ctx, uint32_t opc,
     }
 
     if (bcond_compute == 0) {
-        /* Uncoditional compact branch */
+        /* Unconditional compact branch */
         switch (opc) {
         case OPC_BC:
             gen_goto_tb(ctx, 0, ctx->btarget);
-- 
2.26.3


