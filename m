Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB0B7C917
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 18:46:13 +0200 (CEST)
Received: from localhost ([::1]:42998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsrjw-00031j-Ne
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 12:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51235)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hsrj4-0001hJ-Pr
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:45:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hsrj3-0000sW-Qv
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:45:18 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45347)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hsrj3-0000rs-JG
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:45:17 -0400
Received: by mail-wr1-x442.google.com with SMTP id f9so70417107wre.12
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 09:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VKH7CA7PvW2n45iUTxcQG9XbQH7DlhtsC6UTV58NGHI=;
 b=QvmF5A8nk+b7B8r2io9vc5yx9XNz7bu5ezc1cTjG86E9KJs2H4TnSJLPsFZ2Khn2Id
 x19PMcbMMn/nZmRy4Lm3rtwqmyfllTW910BgUrTx/ouRApFlO9b+4ji5weNjGhLQy5uf
 1qGs4+p/9hLEIAAjQ2yyCmcTAvQNJMBLTnZFWo5hHkRFJSzXQ79H3rIbPcLnngMVfhAv
 J4UjjrL4oI14F0xVALOM0EAZm7vgDfQxm1PkoIL7AxnYapxwQ9KImbFrb90mkcGKTNOD
 paRDFylBxMVkuOuYnJGPRTq8Yx5FosZacR7NB1fqoeu9P9yw7b6/EcfIuY//WYskNqVY
 bgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VKH7CA7PvW2n45iUTxcQG9XbQH7DlhtsC6UTV58NGHI=;
 b=jDDHUIqChl1Kz88t/YK+NZjSyLaPyJmBhYE2jBLdekRmWUVgNiWwk8v0ipiAReZ+u+
 NFRKJIg/fPbfM4FrPZ9Ms7yEnTANNgNrvdtCl6iGEswRgkRR8DIk6qhVbf88nP50UqP3
 nQe6RTVYc49DFDNDGIxxkOrNrMFCtPip0zLsOHDe5VPWXZVF8jnmwjJhc8hqZCvhdNd1
 S4+NYk60uNbu7C9H332X3+b/KUM8elGzVwJDZXrWRrt+VCyncEO2lovY5IFBDNFO0cN9
 kMxnhIT7b7gG8y7Ovz/KuyNb4Oj3UItZvqqBQQvISK+psb+90dp6UrGx3JXO/In3gG47
 phJA==
X-Gm-Message-State: APjAAAVw8b+yBy6Lv+n/mthynX/P5xctWs/aGn8r0qyoMNuPxzXaRf2g
 SF4GS4PPxZz9D5mKYHELfpxOag==
X-Google-Smtp-Source: APXvYqyz6kp4bWBu1Hw4PPAi8ROKnT/KUyLqECUC0sLfP60Oe2U1VqGkVc+hXidiO4TR6B1tXiVkFw==
X-Received: by 2002:a5d:630c:: with SMTP id i12mr47735850wru.312.1564591516472; 
 Wed, 31 Jul 2019 09:45:16 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id q10sm70580250wrf.32.2019.07.31.09.45.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 09:45:13 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 82ED21FF90;
 Wed, 31 Jul 2019 17:07:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 17:06:57 +0100
Message-Id: <20190731160719.11396-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731160719.11396-1-alex.bennee@linaro.org>
References: <20190731160719.11396-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH v4 32/54] target/ppc: fetch code with
 translator_ld
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 aaron@os.amperecomputing.com, cota@braap.org,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>, bobby.prani@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/ppc/translate.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 4a5de280365..a27b5659f46 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7864,11 +7864,9 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     LOG_DISAS("nip=" TARGET_FMT_lx " super=%d ir=%d\n",
               ctx->base.pc_next, ctx->mem_idx, (int)msr_ir);
 
-    if (unlikely(need_byteswap(ctx))) {
-        ctx->opcode = bswap32(cpu_ldl_code(env, ctx->base.pc_next));
-    } else {
-        ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
-    }
+    ctx->opcode = translator_ldl_swap(env, ctx->base.pc_next,
+                                      need_byteswap(ctx));
+
     LOG_DISAS("translate opcode %08x (%02x %02x %02x %02x) (%s)\n",
               ctx->opcode, opc1(ctx->opcode), opc2(ctx->opcode),
               opc3(ctx->opcode), opc4(ctx->opcode),
-- 
2.20.1


