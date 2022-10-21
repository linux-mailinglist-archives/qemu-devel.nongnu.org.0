Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29C760718F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 10:00:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmxY-0002AZ-Bq
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:00:52 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmH8-0003B4-EY
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGz-000367-16
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:53 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGx-0005fo-Ba
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:52 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so2013371pjl.3
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ffAk/uKFmYMud8oNMjB2hkT94GX/9Rmm5gafjNWj2X0=;
 b=wNFTdlBq9+piNNR1XJEMvpJZ+1rT/udqse533tPPSRGx4/cHnV377I7kas5GLAPLBt
 ox21l0RDoe/w5weqfreggNJUACq5idqdh8pTDwi+6wxEMXkBEj0oeD54kOoJPCkn1dap
 75Hy8yBhLVh4/Ipozmwpx+kgaLI+LFyJ38m0ZcFNkcFC726W2meb5yjusoZlyvk7z6bs
 e6UySvMM9rC0cgDRthQxhqFMiqPh4pgF1bmUKwu2TkVSvJ7g++bc60hl2y7vJxnZs6tK
 OndTZ8FCoTGcSBR+DUhNTG6FyDRhJANDGE5In5diEKbhMFoQxDVkt0JvmfhNiegiAyCf
 vDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ffAk/uKFmYMud8oNMjB2hkT94GX/9Rmm5gafjNWj2X0=;
 b=Wd3gzutEr19aLaq4aDgcwxCKCcEZ1t6wRL7XhxP7Q3s4SukWmeXoS8yE06xN+SoWW9
 lvRxhD25C1FrH13aXLj1caQy5uUCPho5PMAkW43ikdhG9CtzaGxz79NX5ZCXjGGM0ukI
 KguRdlgP+c153UIDsFYP8AsGzW3VgjOLXKj932hEpb/fO37PyOPc71+lNaqaqYxQUkJV
 79GZqGVOf3k+9NOhSsg9gfHBdaEeppdpfzo7q+ExEGxbAkGIRcuseNjRlG+pdlvxUhdR
 ziaYMbO5Uk2F9k8hkXARyq9Ulc3BK5Jv7xFYaqprYGEEkkhMd2Sb72jsnYQ+5XlDrNds
 bbfA==
X-Gm-Message-State: ACrzQf14Q0WCXNVyqZbW20Drv9mIwXpF3Q7g+a4QE/4t0cER59bs69gk
 OXTy7n4Vv6cgGCXMF8LSpRUK4bJs3gYXAJbQ
X-Google-Smtp-Source: AMsMyM4Wzq8Q/rtLPXZyFSbWxGyfEG+aV9DcZsNL2XvUb5AQoBgdGvM7d76JAVRRcHKhHcaq1apq9Q==
X-Received: by 2002:a17:90b:3ec3:b0:20d:9da6:56c1 with SMTP id
 rm3-20020a17090b3ec300b0020d9da656c1mr21119024pjb.156.1666336610104; 
 Fri, 21 Oct 2022 00:16:50 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:16:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 09/36] target/sparc: Avoid TCGV_{LOW,HIGH}
Date: Fri, 21 Oct 2022 17:15:22 +1000
Message-Id: <20221021071549.2398137-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Use the official extend/extract functions instead of routines
that will shortly be internal to tcg.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 2cbbe2396a..7e9631f004 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -163,13 +163,6 @@ static inline void gen_update_fprs_dirty(DisasContext *dc, int rd)
 /* floating point registers moves */
 static TCGv_i32 gen_load_fpr_F(DisasContext *dc, unsigned int src)
 {
-#if TCG_TARGET_REG_BITS == 32
-    if (src & 1) {
-        return TCGV_LOW(cpu_fpr[src / 2]);
-    } else {
-        return TCGV_HIGH(cpu_fpr[src / 2]);
-    }
-#else
     TCGv_i32 ret = get_temp_i32(dc);
     if (src & 1) {
         tcg_gen_extrl_i64_i32(ret, cpu_fpr[src / 2]);
@@ -177,22 +170,16 @@ static TCGv_i32 gen_load_fpr_F(DisasContext *dc, unsigned int src)
         tcg_gen_extrh_i64_i32(ret, cpu_fpr[src / 2]);
     }
     return ret;
-#endif
 }
 
 static void gen_store_fpr_F(DisasContext *dc, unsigned int dst, TCGv_i32 v)
 {
-#if TCG_TARGET_REG_BITS == 32
-    if (dst & 1) {
-        tcg_gen_mov_i32(TCGV_LOW(cpu_fpr[dst / 2]), v);
-    } else {
-        tcg_gen_mov_i32(TCGV_HIGH(cpu_fpr[dst / 2]), v);
-    }
-#else
-    TCGv_i64 t = (TCGv_i64)v;
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_extu_i32_i64(t, v);
     tcg_gen_deposit_i64(cpu_fpr[dst / 2], cpu_fpr[dst / 2], t,
                         (dst & 1 ? 0 : 32), 32);
-#endif
+    tcg_temp_free_i64(t);
     gen_update_fprs_dirty(dc, dst);
 }
 
-- 
2.34.1


