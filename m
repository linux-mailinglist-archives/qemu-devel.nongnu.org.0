Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8AA16F8C4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 08:50:10 +0100 (CET)
Received: from localhost ([::1]:39494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6rSL-0000Ff-Lm
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 02:50:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46359)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j6rIQ-00019M-NG
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j6rIP-00031E-Fq
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:54 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40695)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j6rIP-0002zQ-8a
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:53 -0500
Received: by mail-wr1-x42b.google.com with SMTP id t3so1657236wru.7
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 23:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yA0pga7V3rNc2E3Kn75tRyKVD9rdhZJ6PsuYJbKRcmo=;
 b=Vi+IjzEMj0mRrqQgsLvPFHxXM421sRNy+ESIcb1eIYmsIqOyUbk6MkDo2BP5ObByvu
 6zm7OmVGPg/Q3BGJKCrho470SvpTS2lKaDASvrR+35zGs0+CoTcncFmGN7oEeIcgiUHH
 FKRQm0kd8jMmQgMDscpvW8ZuUxVl8xSp5Q2fq81hc7jzREkZFiUwMtczobEJnnINmbVv
 Td9Xzgqg1eX2EIeohM+bbvUoSS4TIOcta/OI+KRsgaQFyX58iUDpkWtCep1M44IpadOK
 /cXds15qNpOJgGeKi0oNM/AppSibpUXf++ujbnDvyf9zAD/aEZeBOtFFZcPP69h5zI8E
 gJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yA0pga7V3rNc2E3Kn75tRyKVD9rdhZJ6PsuYJbKRcmo=;
 b=rGhsUbtD6M1UMsJ66n5rY+DI7QTrv08GUr1Zwpajf5GKjX36uYNFNYy03CwKoPePXK
 bN857Hyx0uG6Mi+NRfxXT52S+5Lcr3Q48lhFN3pB8in9IyzfYjHMKI1biknkVGA+STE0
 k8glZWAm3xzxxIHK1eSLakjFb52H3EXc5mlp8ch1/dw3rfyuLhHOc184/ck/NkgPDirC
 LNOFxLCn/QDNTlSYL7WhVlo/EV92ywMqlOb8C4kPQEdZFYDkcRRUdiWKdFRiMKpqV0Am
 DJTTXoKJ3XxnDEsVnjC+zyjvaLIUaoUdxpcwg0jIPrafJ2rcDI+CnGbl2Bxc54hMHLBB
 oz+w==
X-Gm-Message-State: APjAAAWQFwOXhJJAbQerPExs8U2Gj3nxKWZXk4sjHRBMecQKQpibGpNy
 2u+UbP7mQTseiO/qaoyf95DSiw==
X-Google-Smtp-Source: APXvYqxV0AvHMN85MFGtO8f65KnoaSPzjGsG2NP3GZu+XwWL07vTFygWuCFNom5rTCzL9wgN6jW9wQ==
X-Received: by 2002:adf:8084:: with SMTP id 4mr4040547wrl.201.1582702792233;
 Tue, 25 Feb 2020 23:39:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g7sm2064272wrq.21.2020.02.25.23.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 23:39:48 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BA1D01FFA6;
 Wed, 26 Feb 2020 07:39:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 17/19] tcg: save vaddr temp for plugin usage
Date: Wed, 26 Feb 2020 07:39:27 +0000
Message-Id: <20200226073929.28237-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200226073929.28237-1-alex.bennee@linaro.org>
References: <20200226073929.28237-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42b
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, "Emilio G . Cota" <cota@braap.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While do_gen_mem_cb does copy (via extu_tl_i64) vaddr into a new temp
this won't help if the vaddr temp gets clobbered by the actual
load/store op. To avoid this clobbering we explicitly copy vaddr
before the op to ensure it is live my the time we do the
instrumentation.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Emilio G. Cota <cota@braap.org>
Cc: qemu-stable@nongnu.org
Message-Id: <20200225124710.14152-18-alex.bennee@linaro.org>

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 7d782002e3f..e2e25ebf7db 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2794,13 +2794,26 @@ static void tcg_gen_req_mo(TCGBar type)
     }
 }
 
+static inline TCGv plugin_prep_mem_callbacks(TCGv vaddr)
+{
+#ifdef CONFIG_PLUGIN
+    if (tcg_ctx->plugin_insn != NULL) {
+        /* Save a copy of the vaddr for use after a load.  */
+        TCGv temp = tcg_temp_new();
+        tcg_gen_mov_tl(temp, vaddr);
+        return temp;
+    }
+#endif
+    return vaddr;
+}
+
 static inline void plugin_gen_mem_callbacks(TCGv vaddr, uint16_t info)
 {
 #ifdef CONFIG_PLUGIN
-    if (tcg_ctx->plugin_insn == NULL) {
-        return;
+    if (tcg_ctx->plugin_insn != NULL) {
+        plugin_gen_empty_mem_callback(vaddr, info);
+        tcg_temp_free(vaddr);
     }
-    plugin_gen_empty_mem_callback(vaddr, info);
 #endif
 }
 
@@ -2822,6 +2835,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
         }
     }
 
+    addr = plugin_prep_mem_callbacks(addr);
     gen_ldst_i32(INDEX_op_qemu_ld_i32, val, addr, memop, idx);
     plugin_gen_mem_callbacks(addr, info);
 
@@ -2868,6 +2882,7 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
         memop &= ~MO_BSWAP;
     }
 
+    addr = plugin_prep_mem_callbacks(addr);
     gen_ldst_i32(INDEX_op_qemu_st_i32, val, addr, memop, idx);
     plugin_gen_mem_callbacks(addr, info);
 
@@ -2905,6 +2920,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
         }
     }
 
+    addr = plugin_prep_mem_callbacks(addr);
     gen_ldst_i64(INDEX_op_qemu_ld_i64, val, addr, memop, idx);
     plugin_gen_mem_callbacks(addr, info);
 
@@ -2967,6 +2983,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
         memop &= ~MO_BSWAP;
     }
 
+    addr = plugin_prep_mem_callbacks(addr);
     gen_ldst_i64(INDEX_op_qemu_st_i64, val, addr, memop, idx);
     plugin_gen_mem_callbacks(addr, info);
 
-- 
2.20.1


