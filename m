Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A143A59C31C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:43:02 +0200 (CEST)
Received: from localhost ([::1]:33354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9Zt-0005fN-Lr
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ9At-0001Az-HY
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:17:12 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ9Ap-0005SI-3g
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:17:08 -0400
Received: by mail-wr1-x435.google.com with SMTP id h24so13626594wrb.8
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Fq6BeF0OgBMMAXIU+f0655F6Gy5qXiYfyygjStThzQI=;
 b=ybgcWLebYif+tBJ6JeqjlOf6b4MHT7ieYFepBqiNgEDC/WXAhw3zWYCzi4Up4v3fT7
 IBbxCWuAcugruloARafB5v3rrBS/xUmsITLOHcN8qdoL2FDf+c/BFqyotLT4+62VqzCd
 /41qm73HhHrdOpLZVpsKcUKbiCGS1DbU5MJQP/LVKU8G43I+kCJf/uImCREeLTJIT+7z
 GLNbY8oITPsY4yiJA4faFmoACL5lnedjzBlZGidGrwsqq7iFOEUNwag3cOAFbSkvBOQT
 wQnHVrXsPHIsnaDZeyD14uUTzz2WSCElhkumu9+m4ztk/iRdQ36Ltdfm4uyzpgLzkzab
 LIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Fq6BeF0OgBMMAXIU+f0655F6Gy5qXiYfyygjStThzQI=;
 b=F7ODC+pInZB7tmyAkn94Xj8p8JvEFshhquK3MAucl2pFzxhkTFaLH8jsYdqEjCVR99
 U/B9yu8Kb5GY7h7e0a8WWlYQKxUb8752OC64OqRaSDCR23Bj0BJqwE6QBVjGzJZc87o/
 /v3Jdn1JD97J3bZwCPXXBBnU5+TMTUmd1uA/4v3QT7vzF7bcbdqFcPxz82aOzsYsQeUE
 9Sczhhq5hE07LK+JeqeAyyq1bR3ypqkPepwrQ+DllPR6BVURKfvXGTsRzJksDSgcy3/G
 EVFjAFYM24jmkW+QPrvFcCo7pNB8ni3cWEtmerfRfVrT5dpw6VXM1ObA3ZZfrY0ZNT6B
 nKmQ==
X-Gm-Message-State: ACgBeo0+y6h4CARHlvHa7hKMTVbcWzZPH+SPbNnu0PfQsxwpPkG3adgy
 K056Wtq36i5F5FqiEtlHiX1MbgHJ1NeFvg==
X-Google-Smtp-Source: AA6agR4wTbpYRTzDYiZhHZOwhbRWzx/xxvUit48oQze1V5q6x3x6cBCkjsGJIxRcX9dsT6KyUQnJ3w==
X-Received: by 2002:adf:e19b:0:b0:225:448c:9ba8 with SMTP id
 az27-20020adfe19b000000b00225448c9ba8mr6195503wrb.532.1661177557806; 
 Mon, 22 Aug 2022 07:12:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh16-20020a05600c3d1000b003a3561d4f3fsm15184908wmb.43.2022.08.22.07.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 07:12:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH v2 3/7] target/m68k: Honour -semihosting-config userspace=on
Date: Mon, 22 Aug 2022 15:12:26 +0100
Message-Id: <20220822141230.3658237-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822141230.3658237-1-peter.maydell@linaro.org>
References: <20220822141230.3658237-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Honour the commandline -semihosting-config userspace=on option,
instead of never permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled(), instead of manually checking and
always forbidding semihosting if the guest is in userspace.

(Note that target/m68k doesn't support semihosting at all
in the linux-user build.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 4b3dfec1306..a96a0340506 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -203,8 +203,7 @@ static void cf_interrupt_all(CPUM68KState *env, int is_hw)
             cf_rte(env);
             return;
         case EXCP_HALT_INSN:
-            if (semihosting_enabled(false)
-                    && (env->sr & SR_S) != 0
+            if (semihosting_enabled((env->sr & SR_S) == 0)
                     && (env->pc & 3) == 0
                     && cpu_lduw_code(env, env->pc - 4) == 0x4e71
                     && cpu_ldl_code(env, env->pc) == 0x4e7bf000) {
-- 
2.25.1


