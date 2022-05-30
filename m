Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA60E5386A3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:14:52 +0200 (CEST)
Received: from localhost ([::1]:49840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviyi-0007CC-0A
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwQ-0003tb-Q3
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:27 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:32840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwL-0007Lc-5F
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:22 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 o29-20020a05600c511d00b00397697f172dso202732wms.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4gTS1bWEJsIqym+/C3vEStpf2vM3YV4EhLGnvt8Rclo=;
 b=OQDYSOWS5wl8hIS9U3T1Wr1bTSsMHPqeY9nkZvlc23w9wFOgXr3JniNDqVzMICBqeD
 VXNkMqbKpdjbY+YtQGtrx/fJsfxu7UvFnyZbQMBYBqmgCJ9+BUNCJT3o2GZzsmtwDp2M
 Rj2XzI2XDYlkP9hkwtoMs+/oZU9jkbxAr82hoQsU30XBd+mFTRY01v4sZKu6uZoiufly
 bO/tD58AakKDH0KiUzcwgeyMAgUAv/rlVTYA5xz0/W5G2ZcQectHl/X/Yhkf5EqNh34x
 Elr13FDgqYCKeXRSbfLzuoipvcKtbFjfuYWu8wDLVhQPHM0NOhDTSXhrs4KWh8FqoGeD
 NgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4gTS1bWEJsIqym+/C3vEStpf2vM3YV4EhLGnvt8Rclo=;
 b=rbNLfbiGqva1+1FnUcRpMO174sA2Qhfs9ffduX8smx2cR3w2DsiogI+5M1QiPViSPE
 DFs260VP60EzPdF1WJ5j7ndEZJ3D3o/U8qoz/CLvpAX1sr5hyrgD4AMGRMLMv3KqAMKo
 kIlMoUTjevK1cK/q5b8UIgFQLXh9EhQSDne6eaBnrkJ2A8mQkQgzgnXiSFUoXcznB9uf
 Ir6fJyB2Dyp1NUfJRdnCkl4Fe4AiSt6GC7SlquW7knzorz3/ZLTR7HGBXeUqn7TjgAMR
 mqDKW0DgddM27bbOWqiEOr0C6vcBaJ8zaw8WpIi0fDtyhhshqytOK7t9uPv+i2PXRi34
 oXAA==
X-Gm-Message-State: AOAM531pYgRKJ2qMbOX1o1CwYfFtFYDiwSYEoKqK13Y2Ea79A9pRYhKn
 meJHuo2pOGD/64nTTLTVNXuqUoXWv93fGQ==
X-Google-Smtp-Source: ABdhPJxiG+IoLWpJ9dQSNxJgnbmEAHe3ASHE7x2+TldAfXAzsESgc6g1aek3p5dnkaXfJBjb5wLL6Q==
X-Received: by 2002:a7b:c00a:0:b0:397:475b:1ad7 with SMTP id
 c10-20020a7bc00a000000b00397475b1ad7mr20029604wmb.42.1653926899597; 
 Mon, 30 May 2022 09:08:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 074/117] target/arm: Reject dup_i w/ shifted byte early
Date: Mon, 30 May 2022 17:06:25 +0100
Message-Id: <20220530160708.726466-75-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Richard Henderson <richard.henderson@linaro.org>

Remove the unparsed extraction in trans_DUP_i,
which is intended to reject an 8-bit shift of
an 8-bit constant for 8-bit element.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-72-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      |  5 ++++-
 target/arm/translate-sve.c | 10 ++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 0388cce3bd9..c02da0a0829 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -787,7 +787,10 @@ WHILE_ptr       00100101 esz:2 1 rm:5 001 100 rn:5 rw:1 rd:4
 FDUP            00100101 esz:2 111 00 1110 imm:8 rd:5
 
 # SVE broadcast integer immediate (unpredicated)
-DUP_i           00100101 esz:2 111 00 011 . ........ rd:5       imm=%sh8_i8s
+{
+  INVALID       00100101 00    111 00 011 1 -------- -----
+  DUP_i         00100101 esz:2 111 00 011 . ........ rd:5       imm=%sh8_i8s
+}
 
 # SVE integer add/subtract immediate (unpredicated)
 ADD_zzi         00100101 .. 100 000 11 . ........ .....         @rdn_sh_i8u
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c0781ecf601..14faef05641 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -403,6 +403,12 @@ const uint64_t pred_esz_masks[4] = {
     0x1111111111111111ull, 0x0101010101010101ull
 };
 
+static bool trans_INVALID(DisasContext *s, arg_INVALID *a)
+{
+    unallocated_encoding(s);
+    return true;
+}
+
 /*
  *** SVE Logical - Unpredicated Group
  */
@@ -3246,13 +3252,9 @@ static bool trans_FDUP(DisasContext *s, arg_FDUP *a)
 
 static bool trans_DUP_i(DisasContext *s, arg_DUP_i *a)
 {
-    if (a->esz == 0 && extract32(s->insn, 13, 1)) {
-        return false;
-    }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         int dofs = vec_full_reg_offset(s, a->rd);
-
         tcg_gen_gvec_dup_imm(a->esz, dofs, vsz, vsz, a->imm);
     }
     return true;
-- 
2.25.1


