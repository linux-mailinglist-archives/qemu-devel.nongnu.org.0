Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9806B3F8D12
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:31:01 +0200 (CEST)
Received: from localhost ([::1]:39562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJDQ-0003Wb-MD
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn9-0006KL-Rt
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:53 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn5-0000Ex-S7
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:51 -0400
Received: by mail-wr1-x436.google.com with SMTP id u16so6174602wrn.5
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Gi4ZFyDmzcI+JAkvfvygpZgorNneqYeRk7O8h/ldoXk=;
 b=pNXF/kDRkrhNQ/uzslr+lkf2Teu5WtPKmfrCKyM9e1oOUPYL1z/zskt+KsBjxyseKO
 q4NjJTGGaidaLjEu+WXTTMfWufdNYTgFgvfZVpTFbIKsoJjRC1Kcr3u3i8herUysxLCw
 wVEJEkmAbb9RIK0/QnqyTZCnM0kfqgATSpkk2o5KpodCDWTL4nKnhKHvx0qi+n0s1Qxl
 zANAw/KNGrDP+MJOnIfNnSFfvxaQo9c2xAs1B8edEWZaOpAo93nc9YwCPJBbRS5ReF7a
 U9blgKng8X6q3IIQRFVjdg6DhUs5WMjR3ACf69GXnhjoOHoKepNN3b0fJpyMVPzwShhG
 koOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gi4ZFyDmzcI+JAkvfvygpZgorNneqYeRk7O8h/ldoXk=;
 b=fdN4VmWk76fmswJc8VH/vPwQOq8lIorSO0n+B/OYKq90F/xspsH07Ld0J3g6uH4IcO
 bJQ9ijuNN61wHTnMfxaSbSxScYEpfMagkmmmnaU0UE8UlRy0Gd6S6d0urvMBv0oaZXip
 nI8HjEuZOB/HyhnHyJG3Qy1jBO8ao5t/L0M0aShmoWe9Z/XXXHdCSdT6wy+oQbFtXTsA
 FHTtu3zWBbWtqYxYYxosZBtfFofa7cjdfds82SsEdcj/tA7QS0UWVfSVkraikzOwcNdZ
 LFc4RMaKutSLGrC8CE5m0AK0zAW3zWok51pVQdUOJVp07pgDvUpgpnClOpbj3kUhF3S5
 xFCA==
X-Gm-Message-State: AOAM531xyjhUTf1FCqZMCR8+rooXGzz6ScAOc4x/jl/Xt47Dxi9T7APr
 AxNHHrGI0C3DQcAPmBjONThznEcjcIh+jg==
X-Google-Smtp-Source: ABdhPJxdMk9EBuFNerKpgMunCE8g3CL33ba2aEERdAl0zRDRxXIKDW7JidAq4mYlCxz5FGmMl7r9gw==
X-Received: by 2002:adf:fcc5:: with SMTP id f5mr5368732wrs.114.1629997426482; 
 Thu, 26 Aug 2021 10:03:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/37] hw/arm/xlnx-versal: Add unimplemented APU mmio
Date: Thu, 26 Aug 2021 18:03:06 +0100
Message-Id: <20210826170307.27733-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Tong Ho <tong.ho@xilinx.com>

Add unimplemented APU mmio region to xlnx-versal for booting
bare-metal guests built with standalone bsp, which access the
region from one of the following places:
  https://github.com/Xilinx/embeddedsw/blob/release-2020.2/lib/bsp/standalone/src/arm/ARMv8/64bit/armclang/boot.S#L139
  https://github.com/Xilinx/embeddedsw/blob/release-2020.2/lib/bsp/standalone/src/arm/ARMv8/64bit/gcc/boot.S#L183

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Tong Ho <tong.ho@xilinx.com>
Message-id: 20210823173818.201259-2-tong.ho@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-versal.h | 2 ++
 hw/arm/xlnx-versal.c         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 22a8fa5d11b..9b790517478 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -167,6 +167,8 @@ struct Versal {
 #define MM_IOU_SCNTRS_SIZE          0x10000
 #define MM_FPD_CRF                  0xfd1a0000U
 #define MM_FPD_CRF_SIZE             0x140000
+#define MM_FPD_FPD_APU              0xfd5c0000
+#define MM_FPD_FPD_APU_SIZE         0x100
 
 #define MM_PMC_SD0                  0xf1040000U
 #define MM_PMC_SD0_SIZE             0x10000
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index d60eb4fb184..547a26603a3 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -378,6 +378,8 @@ static void versal_unimp(Versal *s)
                         MM_CRL, MM_CRL_SIZE);
     versal_unimp_area(s, "crf", &s->mr_ps,
                         MM_FPD_CRF, MM_FPD_CRF_SIZE);
+    versal_unimp_area(s, "apu", &s->mr_ps,
+                        MM_FPD_FPD_APU, MM_FPD_FPD_APU_SIZE);
     versal_unimp_area(s, "crp", &s->mr_ps,
                         MM_PMC_CRP, MM_PMC_CRP_SIZE);
     versal_unimp_area(s, "iou-scntr", &s->mr_ps,
-- 
2.20.1


