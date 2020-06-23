Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEF720521E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 14:13:12 +0200 (CEST)
Received: from localhost ([::1]:59844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnhnb-0007mG-JR
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 08:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jnhHO-0003cB-0L
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 07:39:55 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jnhHL-0003SZ-KX
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 07:39:53 -0400
Received: by mail-wr1-x430.google.com with SMTP id s10so211156wrw.12
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FB/XSNfEglwQujNh4/r/UnyGLSTn6jc+2Sa/lfWdHtY=;
 b=U5f+RYOaSDCEnt9B3Xm7U7V0X0hPql0Pup6RxMCMSKg3NMPVYdo4sEK2QD2bOxebdv
 NQIJTHYmT2oGGh120V1WgmpaMjPOp3u9nw3c2p+52gTDNbFsbdAGWh31pEZ1lrxd9CX/
 NWImlwsWAOmTFxHXzcLQccwLQ9CnPvCLwwP7aAehlIfDgJxScSD71GaJ63bF8gnRXol+
 ucK/+uHDzQPycYZ/iM3vp1/VV1vUNdSYFuwa+faxMXaFHgYhRHJ5UQrEzf0mguhzJDZT
 IP8D6rKSFsmBDYsAgswG1V5EARMKLYShyDw5oVLJWKyxrft5nFDUPxIzCQdZ0lt4bSQ/
 jIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FB/XSNfEglwQujNh4/r/UnyGLSTn6jc+2Sa/lfWdHtY=;
 b=lHL0NBsY3ImQG7gkUG2eByhDe7BDBBm3U4066Yfj0cbkfDuLMicJrjz9CAGhWdQ6cC
 07KmFQxhZe1Qx60kZ8bWlj4rJv3P3bLh0zpFMpfAsGFjFgT11GhfXnhvPgAIbzzzBfOl
 fq4FpFcefHr1vnEKBYSoBAvey+7jgTeauRQkjNbGUFXYu3H3wHmeono3zx0bachwsCvt
 b6UJU8MobL8mNlLijMZHbi3eRaTEY4Twtv2QPVnfeanxo7vD54F9TlGk8rFWCVsKQBLM
 hiNBhtcDfvkNTwSFMV0GmlOFqyYnkMJX0ZEcCoonVBU1LavkpBoiz4N1QktTS63qGNdP
 /PVQ==
X-Gm-Message-State: AOAM530pHrnKA2QCY1HnWGvmEdbG/u9L/AS1UXWqvPXKmlA78KKeeSdQ
 F+vK95bM79OJN/XXMeHRGqF3l5Wd0SnhJQ==
X-Google-Smtp-Source: ABdhPJzjthd4o19XqpTtpFJTdd4sw4G1srCCEtcuBzo9gCbXU79itUYaNJq/SdB9ZPCPVSqiNpZVPA==
X-Received: by 2002:adf:db4d:: with SMTP id f13mr20906719wrj.336.1592912390110; 
 Tue, 23 Jun 2020 04:39:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m10sm4022177wru.4.2020.06.23.04.39.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 04:39:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/42] hw/arm/mps2: Add audio I2S interface as unimplemented
 device
Date: Tue, 23 Jun 2020 12:39:00 +0100
Message-Id: <20200623113904.28805-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200623113904.28805-1-peter.maydell@linaro.org>
References: <20200623113904.28805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20200617072539.32686-14-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 2f6acbf2c21..d1653a7e6e7 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -373,6 +373,7 @@ static void mps2_common_init(MachineState *machine)
                                          0x4002a000};   /* Shield1 */
         sysbus_create_simple(TYPE_ARM_SBCON_I2C, i2cbase[i], NULL);
     }
+    create_unimplemented_device("i2s", 0x40024000, 0x400);
 
     /* In hardware this is a LAN9220; the LAN9118 is software compatible
      * except that it doesn't support the checksum-offload feature.
-- 
2.20.1


