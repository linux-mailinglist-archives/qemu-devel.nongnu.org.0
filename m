Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3859D3E3BFB
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 19:32:41 +0200 (CEST)
Received: from localhost ([::1]:39940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCmfA-0006r0-4p
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 13:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCmd2-0004qw-Js
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 13:30:28 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCmd1-0006P1-7s
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 13:30:28 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso12794009wmg.4
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 10:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DbONOkwC1FwLLFkqMVdsgc91Qocspy7yIt/Uw3KVeaM=;
 b=iDkN610G7qca7QkPxxnD7VhJp35uapWdfbjqaClo98N6Mlglg1bK52C01h6Lf8lnoa
 nTp1Yh3QFFdIbWk9+12/ThTTLtHNs9g1sg6QAo3d6rCStT1Ib8tOIT08q+cjRbFNUcX0
 ypxMa1yzJYL/zBSPxA/GuLM2RMOgRY7bbu4iGLxXIVlQndB07f979fwB++TnYez5BZ20
 Pd4+rAz1fQmcZNSTZDYYLYMyRinPGodUKa3MLG56nIU1218+h9uTW9qW+3P3I9p3GYKN
 3S/sHJ4pfnm2E7ZHapfM1l1o0fWtk/yALEiN0UUmdlaOfWZK3dSZVYRN8sd3WAxBeTR1
 kcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DbONOkwC1FwLLFkqMVdsgc91Qocspy7yIt/Uw3KVeaM=;
 b=Pk8fsgD5yNoPuuBCCs0UB7+lQCxPrCo8aMb70K4h+J9tBbHoFf1jxm2gNeAtPHBfFp
 Pzut9mCQkczhjWk5/uJIees+tQjLLLxHnJ/MrozWh551P/CbM8R0I5MMhX4arP/vUwdS
 Mx/LexhJ615KN7sdZwNGOkOluOoUc+SEyvxWzVclw2kO2ZP5oH4sRkJlRF6xrjgX9pv3
 hMbGxEBYcFfO72WzLncuWxsxbVuSjSJzsoBxEMag3d3OWeb1ZN9MINaaNZwFizCfZaq/
 7+INyOfHkQ1srzVwJwmMmm3xgqvzcSgbSB4Ep87S2b7wMP2sAEqug8OwCWEaT2p4FcwA
 MStg==
X-Gm-Message-State: AOAM5317z8bTiAy8rNIhhk+v1Zk/c+w+VbJNGuN0yM8OLsQqCfxn6AG3
 C5bLUtXmjDfaDCNvwL3YjIQipvtVfc4=
X-Google-Smtp-Source: ABdhPJykCkdO0POB1v9ivPKfsM9fu0Rkwf7f4mBdj+XPPNIKijYvNv/GpbrChvPOlMzrKHgf6j0rkg==
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr29838912wma.164.1628443825102; 
 Sun, 08 Aug 2021 10:30:25 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 d5sm16604650wre.77.2021.08.08.10.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 10:30:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v3 1/7] target/mips: Introduce generic TRANS() macro
 for decodetree helpers
Date: Sun,  8 Aug 2021 19:30:12 +0200
Message-Id: <20210808173018.90960-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210808173018.90960-1-f4bug@amsat.org>
References: <20210808173018.90960-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Plain copy/paste of the TRANS() macro introduced in the PPC
commit f2aabda8ac9 ("target/ppc: Move D/DS/X-form integer
loads to decodetree") to the MIPS target.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index c25fad597d5..791e3e2c7e8 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -202,4 +202,12 @@ bool decode_ext_txx9(DisasContext *ctx, uint32_t insn);
 bool decode_ext_tx79(DisasContext *ctx, uint32_t insn);
 #endif
 
+/*
+ * Helpers for implementing sets of trans_* functions.
+ * Defer the implementation of NAME to FUNC, with optional extra arguments.
+ */
+#define TRANS(NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    { return FUNC(ctx, a, __VA_ARGS__); }
+
 #endif
-- 
2.31.1


