Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650F34CB0E8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:13:07 +0100 (CET)
Received: from localhost ([::1]:53372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWHR-0004u2-0t
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:13:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxj-0005it-Kb
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:43 -0500
Received: from [2a00:1450:4864:20::334] (port=54013
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxi-00087t-4x
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:43 -0500
Received: by mail-wm1-x334.google.com with SMTP id 19so1674782wmy.3
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=h5vb/qPkkLSubI4hynyldV/6P4vM61yCn9qANZFywlI=;
 b=g2CMi0meKbLswpPcw+z8PtJ1M5ABN1K2Pv3nLK7KIs3jnAHelot6UQyweEou1IST44
 zVKh45WStn5yN+M73CxDUI9URPkqF3/9Y7UZX3JgFnhy/ZYuzzfCyCrd2FcTFhQTj0Nl
 +BETLdYaMaOuEzvm4/SoBGrxmjD9++8tVswVTbpIaYEaJYIBRCjFvKTOpQS3wkfWGMU8
 poWEXSk1XJO+JPZBoX1RxjKxhQg+O1Sx/hE7tsOHloGimQmMYju89rI4gn5DP4XlcXCK
 NsQg37qf6rAnCJAj3Yb4IGuoLIF4iu2XHSQMM/XAGapHL0nfzv2hzGFozbRW6tl5Iodi
 eAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h5vb/qPkkLSubI4hynyldV/6P4vM61yCn9qANZFywlI=;
 b=DRmqTUJwva1cJVzTzTFa/Su42ijlJjoydIY2bbiZM5jP6mZPKozVU0qJRcjjtQmIzR
 SEXXwCzU9xZGrOQ3AxKnLXOvGPp9eb5HzjZntqHpFHyTJ2dwzD0eYXrkGCftrRhY+sbx
 OD3ENgaXq2flYeymk9+I20zyVj2PjohVX2ZfY4J+1iZUWmIQw+/eBjlM/39X/2Tsm1In
 aiiUbr7h1Qo2XCc4gSjYcUtimNi+QiwDKJc3Yiz9Lj6lHZocz8cqswGUK74kOV6v2Y+0
 BC/0LxSZQuH9D36YZFZ6nbdPksJkx1+anZYMFiXnuC2FDW9UZ2hGNAiVqNjc+l26Mcg5
 oRNg==
X-Gm-Message-State: AOAM532i2Ury6srnBJqLuDxUBInrDchDfp8jm9vaVLNa18wxMA51yxjV
 Uew1Yb8RKHpHDJK3mFoUjUDmMEdhywYAoA==
X-Google-Smtp-Source: ABdhPJxhTQQ3wo9S/9KKdUiS+gHuxaM10vJ8D6CjRZjY+zPAZcMMoojMkmoTn1GOceYQnKQxbOx6QQ==
X-Received: by 2002:a05:600c:190d:b0:382:f9f9:bd33 with SMTP id
 j13-20020a05600c190d00b00382f9f9bd33mr1266315wmq.155.1646254360870; 
 Wed, 02 Mar 2022 12:52:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/26] target/arm: Set TCR_EL1.TSZ for user-only
Date: Wed,  2 Mar 2022 20:52:13 +0000
Message-Id: <20220302205230.2122390-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Set this as the kernel would, to 48 bits, to keep the computation
of the address space correct for PAuth.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220301215958.157011-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index dd64d178e2e..7091684a16d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -206,10 +206,11 @@ static void arm_cpu_reset(DeviceState *dev)
                 aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
         }
         /*
+         * Enable 48-bit address space (TODO: take reserved_va into account).
          * Enable TBI0 but not TBI1.
          * Note that this must match useronly_clean_ptr.
          */
-        env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
+        env->cp15.tcr_el[1].raw_tcr = 5 | (1ULL << 37);
 
         /* Enable MTE */
         if (cpu_isar_feature(aa64_mte, cpu)) {
-- 
2.25.1


