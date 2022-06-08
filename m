Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9126F542142
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:30:08 +0200 (CEST)
Received: from localhost ([::1]:48608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyoGd-0000zf-Lk
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6m-0006tI-4t
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:56 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:40747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6k-00022a-27
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:55 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 w13-20020a17090a780d00b001e8961b355dso5605591pjk.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GB8QwFJfH3hlfZTD3yMvfbRrCq2bQTobhy4HeZnGERI=;
 b=E2+lQZu4gEeyLpetu/BjgozYH5ryNjR0Ihq6Vj9hx5x7XUPw/hxuP5G6gMJSm/TDXb
 N5xijYhvxA5/lxNHrjABgY1RKHHR8YMTD7q8YiRF6zGjeL4wlQfL/m/kyoSa+vmor1q1
 KSiyYK8Y1E/SrmV07fBYc4mI32GqlqWp0ebrvv9LWZia3P29HsjcXXXHisPqiKhJt0Uo
 ObZDDfeWD1KylmfX2VoEBMoFTVHaKzUkxp4HtWmLehxetTfkgdqAfufcm/puFhif3N5g
 mgsvCZLfjl2UKYNCCoZK0tFqnPLfLDWIvqb59O3cPEjDmwR3Dt4kL+o1E5WHgKkv/wEx
 hZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GB8QwFJfH3hlfZTD3yMvfbRrCq2bQTobhy4HeZnGERI=;
 b=QhWKKZZXKHe9q6VYJ91hT1bOvjDiLhaQCjmM1ZdaS+TZmvprC8Ittf/6MtmAwpUZFt
 0tsv88/fRhb5aucIJ4gjJH92Yy7QrDPwWdJk+CN8vwSs+FBoozr9Yx1dbbNEQBxDUEj0
 pRwPquNBIJ5xRd0sLkf1TQuYBBJBzFtismu4bKftOSDqfHruDT9oOL3e6kPvthQuDeFh
 F31Yu7g5TlPoWvq4Pkt0eXpouOQbNbbqSUstafORhHzLmsdM3PX7CiuNojkXQSc2oVwh
 JGaR+8I30Lpb3zxYIK6yUrKrk8k9EncCXgN0I4OpRkKwqNSM7JDjjZUUwBI+D0hX8CJT
 VFTw==
X-Gm-Message-State: AOAM532S2wGJzyFvkuEBa4k9bJQoZjx4lKW7lqekfL1S+uvf8Q3saFSu
 lbFsC56Q9mJwjy7lvpwi8Fvcr3zz+z/+1w==
X-Google-Smtp-Source: ABdhPJwhEvW1Otilw+qaJsowjLEdsuWYCz9YN505hGPOKC8RU5nmNi7Y2sAa1GzKnGwSEW16K9j2QA==
X-Received: by 2002:a17:902:d50f:b0:166:41a8:abf5 with SMTP id
 b15-20020a170902d50f00b0016641a8abf5mr30945014plg.17.1654665590647; 
 Tue, 07 Jun 2022 22:19:50 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:c626:2f70:ac99:7c97])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170902d58800b001641244d051sm13378807plh.257.2022.06.07.22.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 22:19:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org
Subject: [PATCH v4 04/11] target/mips: Drop link syscall from semihosting
Date: Tue,  7 Jun 2022 22:19:38 -0700
Message-Id: <20220608051945.802339-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220608051945.802339-1-richard.henderson@linaro.org>
References: <20220608051945.802339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

We don't implement it with _WIN32 hosts, and the syscall
is missing from the gdb remote file i/o interface.
Since we can't implement it universally, drop it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 33221444e1..254c7fad9a 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -387,15 +387,6 @@ void mips_semihosting(CPUMIPSState *env)
         gpr[2] = write_to_file(env, gpr[4], gpr[5], gpr[6], gpr[7]);
         gpr[3] = errno_mips(errno);
         break;
-#ifndef _WIN32
-    case UHI_link:
-        GET_TARGET_STRINGS_2(p, gpr[4], p2, gpr[5]);
-        gpr[2] = link(p, p2);
-        gpr[3] = errno_mips(errno);
-        FREE_TARGET_STRING(p2, gpr[5]);
-        FREE_TARGET_STRING(p, gpr[4]);
-        break;
-#endif
     default:
         error_report("Unknown UHI operation %d", op);
         abort();
-- 
2.34.1


