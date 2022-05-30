Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34145386AF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:19:30 +0200 (CEST)
Received: from localhost ([::1]:58684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvj3B-00050Q-OI
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwV-0003yw-SM
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:32 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwF-0007I3-5S
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:31 -0400
Received: by mail-wr1-x430.google.com with SMTP id t13so15277690wrg.9
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+UENaNdgRePKc8yIYGkxEQgJhGdyFoR6NwVFah5q864=;
 b=mleU72Xv9g31tZCOuI5Nohsc8ADFO69T/+U7JJgKmC2G19kCgRivsudqz0T1o0I1Gc
 S8NEZ7Pmxcy9w4mWw6aekwyeGuytHZvA3Kwk7fjWJgLcGJm/vKrpHXa8kXGCdBgXVRTR
 b2PR3VTKniUJUioVF/Jtazu5tiZ9LHlQhUnaRpoS+AhQCcsoIWLyIr4J85TzouGlA2Mu
 GAY/dw66N572nT8UK1+BuOEnQLqVkJ72xvziQgZYKMDglRcJXNpUIyjmOD6isMgEWzpX
 Y4jUHD/umNZW6Tqo/SfxcGKhUyEq+5tHikFQdoc9oZ2rpDH9SmbK/tFNZgz5rhn/dSSb
 iCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+UENaNdgRePKc8yIYGkxEQgJhGdyFoR6NwVFah5q864=;
 b=b1j3D1AW+6n3c7hkWldgl393v/0lCHPH6hEFWxFuYR5L57A87k+/mkFbjicRZJBipu
 ERrCg3gE6Q5Msv7PFIcGKXrddkUoth1sag1hGp+IaEuey4zwJnaKuOvH7DOzxtzhTySz
 w0ZUc4ukgIZq0m2fr/5lXZYuStab5ogEHYpUIebzfwSA2l9AJgu3d/FlF1iOH1YRF/wC
 QVHqeXQkDlX+xmeOivGE6pFcelEcJzDXJcE/KHqygoLx/ffFbyoLeqbKR0bbUoreuU8N
 ES+rVDYRftq4KmxReQ7Ir4Z7guMgUCoqoTSWw6NkSl4PrJZCPzO4OP9cx+7WMvmPy7hx
 mvUQ==
X-Gm-Message-State: AOAM531RmmCXcGcI7kJR21K5yoSBq6y9kQqN0ZiGNmCYS4jvdm2silV8
 J22Vvc41BwTe22lG1/vy836KI5Pb3+voyw==
X-Google-Smtp-Source: ABdhPJwjWJatORvZxDxX4O7cw3bXCiXc1/T3yx476n0pTKA6J1mEv01pwmKWKeJ5R7llUQ73bGpENA==
X-Received: by 2002:a5d:47c5:0:b0:20e:73a0:79a0 with SMTP id
 o5-20020a5d47c5000000b0020e73a079a0mr43525665wrc.632.1653926892571; 
 Mon, 30 May 2022 09:08:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 065/117] target/arm: Use TRANS_FEAT for do_clast_general
Date: Mon, 30 May 2022 17:06:16 +0100
Message-Id: <20220530160708.726466-66-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-63-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 21c2bd099d4..f5453e99e15 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2575,15 +2575,8 @@ static bool do_clast_general(DisasContext *s, arg_rpr_esz *a, bool before)
     return true;
 }
 
-static bool trans_CLASTA_r(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_clast_general(s, a, false);
-}
-
-static bool trans_CLASTB_r(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_clast_general(s, a, true);
-}
+TRANS_FEAT(CLASTA_r, aa64_sve, do_clast_general, a, false)
+TRANS_FEAT(CLASTB_r, aa64_sve, do_clast_general, a, true)
 
 /* Compute LAST for a scalar.  */
 static TCGv_i64 do_last_scalar(DisasContext *s, int esz,
-- 
2.25.1


