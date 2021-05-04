Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5013729FD
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 14:22:11 +0200 (CEST)
Received: from localhost ([::1]:33294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldu43-0003Vl-2G
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 08:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldtrg-0005l1-Qy
 for qemu-devel@nongnu.org; Tue, 04 May 2021 08:09:24 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldtrb-0007aD-0s
 for qemu-devel@nongnu.org; Tue, 04 May 2021 08:09:24 -0400
Received: by mail-wr1-x433.google.com with SMTP id m9so9154524wrx.3
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 05:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L/Ak9T5/Ybf7tAcf0Rd3JQPpQ3KguyaRrNYfpLxJyhc=;
 b=X9a0KimzEiDF3OWSqeIMc03RSURCRfRj96ARQ0oqSTjh0+kTfOpkLRGEyasdANTc2A
 YaHwuot6plpdZeVaVd0RvfzKx8BzjzrYk2CL6xVM3ALJyvSRKGqqpgLC3fm/WG6F7ewH
 DnyzZ6xUK6eBznRvFFKnf4J7IZFz5mcyaRgnVkNWPbyGztUlPgbyNy+0dNvNqWQXz87J
 ALClj4ua/Yl4VnhlCdz1cpyGL0r0wagqpm9ZGs32BLfVo+ds8cfRqguiGMWhNVHCTwsD
 KfXlRqJRsW0Yu16q+dUqp+AtYi2FA4m8y0zsJ09DMdmKgJHLsvEs9IRm8a4sA0L/pfF1
 uevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L/Ak9T5/Ybf7tAcf0Rd3JQPpQ3KguyaRrNYfpLxJyhc=;
 b=en7dO7FPpOjNY4/73eOUmy/Oul2Qtau+gBB1Emo0tplT3rItRFXFkkq9T+9COA+NlN
 ufcHfs9Z4UVJzG2TP9bMhTYL1I6BtqDMTITQlZ0HX3T9D55S9KU9RRC88dOvVN7Gh3L/
 v4ZjaSdYirKRmQQ0TxVkYUH7LEGMq2LH274UistG13IxBEIa6+FrC833VSSFJvqANrKt
 vSwlJGsObUKpCaIGlrETiJpe3KxddmLRlDQefjONAksOIONNYz2KvX4IsWtQefXeXtg/
 u+mJHFJdO46V/5VIvsVd9yc967EqMy+fedFm3Su9LaTb43vsRel7fSTCTcm0pAQ0bhcj
 65FA==
X-Gm-Message-State: AOAM530I/OV2TQdk3pm6AVbcROuE1+b97s2LGcZ4hVv6vz/f9280TcMH
 s/qyKxYQArQs9jTZA6L1ZtbG8g==
X-Google-Smtp-Source: ABdhPJzQeDAQfH8QV+2L9Je9VOhmV9uGnuF2rKt46i3pCLFsq2jm9VRo1Urzjp2R2GODdeW1n9m//g==
X-Received: by 2002:a5d:554a:: with SMTP id g10mr29205593wrw.174.1620130155687; 
 Tue, 04 May 2021 05:09:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g12sm2331937wmh.24.2021.05.04.05.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 05:09:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] hw/misc/mps2-scc: Add "QEMU interface" comment
Date: Tue,  4 May 2021 13:09:10 +0100
Message-Id: <20210504120912.23094-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504120912.23094-1-peter.maydell@linaro.org>
References: <20210504120912.23094-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MPS2 SCC device doesn't have any documentation of its properties;
add a "QEMU interface" format comment describing them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/misc/mps2-scc.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/hw/misc/mps2-scc.h b/include/hw/misc/mps2-scc.h
index 49d070616aa..ea261ea30d6 100644
--- a/include/hw/misc/mps2-scc.h
+++ b/include/hw/misc/mps2-scc.h
@@ -9,6 +9,18 @@
  *  (at your option) any later version.
  */
 
+/*
+ * This is a model of the Serial Communication Controller (SCC)
+ * block found in most MPS FPGA images.
+ *
+ * QEMU interface:
+ *  + sysbus MMIO region 0: the register bank
+ *  + QOM property "scc-cfg4": value of the read-only CFG4 register
+ *  + QOM property "scc-aid": value of the read-only SCC_AID register
+ *  + QOM property "scc-id": value of the read-only SCC_ID register
+ *  + QOM property array "oscclk": reset values of the OSCCLK registers
+ *    (which are accessed via the SYS_CFG channel provided by this device)
+ */
 #ifndef MPS2_SCC_H
 #define MPS2_SCC_H
 
-- 
2.20.1


