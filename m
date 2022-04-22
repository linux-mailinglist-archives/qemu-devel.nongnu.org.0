Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA6650B4B3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:09:43 +0200 (CEST)
Received: from localhost ([::1]:32978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqEQ-0007e3-Br
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9b-0004E2-5Y
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:47 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9Y-0002ZU-9M
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id w4so10276646wrg.12
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nusE4iJqKxuXxzxUwLDY6MVU16Qz+ioLkpoA1JeR0xQ=;
 b=DVA1dWbTaTzwPJZN/KDd/Dd/1bpsQqjIKd/SdeMpwMb2bKLRkZPK9tVoB9n66h8Aqd
 /zyUFLbXWzad3idW90bRqJCHPvnqeBgE/YaQfvvR7et/1TGO4ZJrKY09FdDOhhm/vzYQ
 VOjkJ9+w0r7LnV2EDHJTE67zkkR99bdVE5KEbzx0c89bZ+9xpWzyO1Eif+h96aF1+BK9
 /WHAjNvFqggKNWPUBhazv6ugIrfQgyhmgzMjXCIpZlwUu9YVUajXN4B/3ZipqV6iTCFi
 fyPPkZM5P0eAAqUTTmfKGnE6I3LSImX3OOdN70ARgbAicZa4vmy7C4G9Lc86wxNHm6Si
 q6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nusE4iJqKxuXxzxUwLDY6MVU16Qz+ioLkpoA1JeR0xQ=;
 b=QiC7EwAWEbC2mr4JWmcSlaSvmGQkhqSE/HdKVZQuxPpSICQ3jKHPRHfaA27dt/a9Aq
 KkFoXXES92tFJioTSPWzpEUhyA9pG66eK0u9jrxUyjogrxoj2xX9YJH3GOKG+rF3foCj
 kJCv8Px9UAvwCeg15+DiRAI7p15Go48+FnNDd2GzZ5N2tVNwA62ivktKFiPVtM1zNGM8
 UQsnyhqu6LI/Ahf2/q2k7ZP9TGfjX+i60sayWeyKejOvp8Ief2O/UUHGLSHPDyeAXbBe
 osXl6nCPE8VWH5V96vrckQtn92vHad4x3pt5TeruyBXI8KS2WwBsQJHaudK3AwpbLCnZ
 NhYg==
X-Gm-Message-State: AOAM531mWK8WilTLXF8MmHSh7zrzM4VK/Jh53iJ4jyfVsssp9ybswZPQ
 AHs3WoCo2Fc9oNWxs+UaNRKj+uezd7kUUw==
X-Google-Smtp-Source: ABdhPJwepCN8SXB8wYegZnzK/W7QFxfXI2i3vmEw8TUANIZwNSVrkxkeONo+y7oJ9i0xjEsEGgdcGA==
X-Received: by 2002:adf:ebc7:0:b0:1ee:945a:ffb4 with SMTP id
 v7-20020adfebc7000000b001ee945affb4mr3050675wrn.641.1650621877103; 
 Fri, 22 Apr 2022 03:04:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/61] hw/intc/arm_gicv3: Sanity-check num-cpu property
Date: Fri, 22 Apr 2022 11:03:33 +0100
Message-Id: <20220422100432.2288247-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

In the GICv3 code we implicitly rely on there being at least one CPU
and thus at least one redistributor and CPU interface.  Sanity-check
that the property the board code sets is not zero.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-3-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 4ca5ae9bc56..90204be25b6 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -328,6 +328,10 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
                    s->num_irq, GIC_INTERNAL);
         return;
     }
+    if (s->num_cpu == 0) {
+        error_setg(errp, "num-cpu must be at least 1");
+        return;
+    }
 
     /* ITLinesNumber is represented as (N / 32) - 1, so this is an
      * implementation imposed restriction, not an architectural one,
-- 
2.25.1


