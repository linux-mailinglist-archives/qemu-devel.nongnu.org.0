Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AD44879E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 17:42:22 +0200 (CEST)
Received: from localhost ([::1]:48606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hctm1-0003H7-JC
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 11:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46790)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hcsiR-0003lL-Fj
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:34:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hcsiQ-0008BU-DM
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:34:35 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46872)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hcsiP-0008AY-CD
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:34:33 -0400
Received: by mail-wr1-x431.google.com with SMTP id n4so10192468wrw.13
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 07:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WgJ3ME0OmnuR5vXoFEmNb/znccvEB85oUYK/SkfReNM=;
 b=JDGyteuBzIO3dbyIaAuGqdrz+6oWE2pE2PW+qbpygxPfeh7TMUCWsPQqqatjF0pqAW
 Ov7td4gRgYCHke9GiN/RrRTQkQv3h/EMh7X7Z0V+tYz2kj6NYg3+w3Mixp+QwHYjTqYE
 iEdqUJRP1Pu4xBWiymS5gXm/1CjkJWjPo6xUVpAXgAgPihtJAGLeELx2toD0+YIcRDCB
 xdpS6PCiR2WqHy7M/F/Ino/YRu4bdeUKREzzECfyjGuaOH0ELdMIVCsQdJ8ie7EIiqM2
 sWu7zCAOi0xoxEnQXZPDsgXyr/MCiTtsZydKgKmFtv3AHAV1fojkYKqd0k+FKKnlvurN
 Pt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WgJ3ME0OmnuR5vXoFEmNb/znccvEB85oUYK/SkfReNM=;
 b=kIfArr+hlpzJ4dYrE/kcYrR/mg8P1JWr89m+ovlUPiPfX1BEG2EX0GNxYt0d8pyOO8
 W7KMJ0zho+yG4jA26VM0Jg7q7xcr5NGkgORSySzi0EX89UvD9vhIrYhladRLk0MRUo9c
 rkJS73ONwyhqy6FR/haiI0Bqbrvgs3ayqeXGufe00o+OTOpTdatWMtuRdM5+FfY6tK33
 AsH51X9x7V1tj+gez6DW5BvsBEjenMZ7RtFndeaqNf5/LDgVe2qhON6IYzwH136JgdwG
 mfJV1j3+QERhXBvno50/aYm7Ds6WdlMTX3E/tb3XL3dbj90DC+e7pNV6nulSND1NLI7m
 o2+g==
X-Gm-Message-State: APjAAAUN0lc4XxnHQqNDu+PBaXSlFvFhmxCVhTvpXX+09bF3Vw4HCGBA
 qTfu/B801SdmPAQQ9Assy44XUiW9JGlSBA==
X-Google-Smtp-Source: APXvYqxvzUnp7fzLm/7wyx5rAjZzLq0DIto9+DYkXcw3HJoUui/MD9hlLAMnYEeC58jApriC6sTqiw==
X-Received: by 2002:adf:ea92:: with SMTP id s18mr53023420wrm.257.1560782072100; 
 Mon, 17 Jun 2019 07:34:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a67sm13819985wmh.40.2019.06.17.07.34.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 07:34:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 15:34:04 +0100
Message-Id: <20190617143412.5734-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617143412.5734-1-peter.maydell@linaro.org>
References: <20190617143412.5734-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::431
Subject: [Qemu-devel] [PULL 16/24] target/arm: Stop using cpu_F0s for
 NEON_2RM_VCVT[ANPM][US]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stop using cpu_F0s for the NEON_2RM_VCVT[ANPM][US] ops.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20190613163917.28589-7-peter.maydell@linaro.org
---
 target/arm/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 243dbee8357..124045a9ef6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4181,8 +4181,7 @@ static int neon_2rm_is_float_op(int op)
      * what we are asking here is "does the code for this case in
      * the Neon for-each-pass loop use cpu_F0s?".
      */
-    return ((op >= NEON_2RM_VCVTAU && op <= NEON_2RM_VCVTMS) ||
-            op >= NEON_2RM_VRECPE_F);
+    return op >= NEON_2RM_VRECPE_F;
 }
 
 static bool neon_2rm_is_v8_op(int op)
@@ -6818,10 +6817,10 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                                                       cpu_env);
 
                             if (is_signed) {
-                                gen_helper_vfp_tosls(cpu_F0s, cpu_F0s,
+                                gen_helper_vfp_tosls(tmp, tmp,
                                                      tcg_shift, fpst);
                             } else {
-                                gen_helper_vfp_touls(cpu_F0s, cpu_F0s,
+                                gen_helper_vfp_touls(tmp, tmp,
                                                      tcg_shift, fpst);
                             }
 
-- 
2.20.1


