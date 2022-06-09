Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E95254474E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:24:40 +0200 (CEST)
Received: from localhost ([::1]:38004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEP9-0003QW-1A
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6u-0001Oi-Mg
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:49 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6s-0005wl-7s
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:48 -0400
Received: by mail-wr1-x436.google.com with SMTP id k16so31477811wrg.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+dO1GyIhjcUyBFfxTAYsXe9nSJnuFJi4sDNVk2x8YQE=;
 b=Frz2q1B/v2Oee7pz8TnO3n+7PUIVXhv2dUiRVEAKnrP6jDCaSphne0ycihroILnOBu
 tnvYlitbRS9xJxyx8rxYJBz4BJt5tGFb+yLnyiwMM/2bMABOZXrNbgLOmOsevOgD5wh9
 qN5Qy+NtWuZS7OZZoOHueYL3cG61PRBe+Pn2svo8hYEX5aIIZRLCt5NBBmnY2e2VrYpA
 yeceSNTugCXcSRKMkp82ABVb0tS27bDRIC5o0pyLzKgIAHiLuqeXV6OumCa8dFx0XJYa
 B/PTtD/Mm4LFMjjMz/GGNwS0G1R8aIFknZ2x50DwBCb1/Bw4i6cZ7rXHROirA2nvO58x
 UWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+dO1GyIhjcUyBFfxTAYsXe9nSJnuFJi4sDNVk2x8YQE=;
 b=4LESYi/OmcNZbZRc6XbnRLy2jLYrmdxildHlEPCOq/7OK6Mvpjb146d4Zgl8Rx+27n
 yh1u1JnnbcYWsHv0PDSpZdMuCpayyxgP1U/PzZYAgBgjo/BCccq8f1qa/m4UuLj0+Fw/
 H8vbVkNddDe/Asog2/PRFCudFj7ej7994Z3csc7FOjzCOdBmQOdtDdh4l9kBukJmV1hd
 tGl6n8rp2lrYNoOg13uez8Cg/IAgltca6RMfKSGfa9ZM0v3PrFZ8Eav/5hBIxWlhAqDK
 GOp7VXGvba2SP4ZzDJQc+s99gffkhPjqSI6lPeYzFeRuujdtcS/EPMZdrchcvMBF/iCW
 G4Fw==
X-Gm-Message-State: AOAM5313WkFVeDY0/HF8oX+r3Yzw1tJuzPVw8FEWPGhRO43i/k3qo6/j
 fcnG+t6IfsGX7BUtMoh3c0HMF4MJ2OSmIQ==
X-Google-Smtp-Source: ABdhPJxTcfvx/9dm6X0xdZ1zAUwfjcqwYKs5/xeFo6m2/7/8tKvTMp+hF50vrFKQr184ODNDPn6tvg==
X-Received: by 2002:adf:f90f:0:b0:20e:5fd4:5d06 with SMTP id
 b15-20020adff90f000000b0020e5fd45d06mr37549172wrr.371.1654765544711; 
 Thu, 09 Jun 2022 02:05:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/55] xlnx_dp: fix the wrong register size
Date: Thu,  9 Jun 2022 10:04:46 +0100
Message-Id: <20220609090537.1971756-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Frederic Konrad <fkonrad@amd.com>

The core and the vblend registers size are wrong, they should respectively be
0x3B0 and 0x1E0 according to:
  https://www.xilinx.com/htmldocs/registers/ug1087/ug1087-zynq-ultrascale-registers.html.

Let's fix that and use macros when creating the mmio region.

Fixes: 58ac482a66d ("introduce xlnx-dp")
Signed-off-by: Frederic Konrad <fkonrad@amd.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220601172353.3220232-2-fkonrad@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/display/xlnx_dp.h |  9 +++++++--
 hw/display/xlnx_dp.c         | 17 ++++++++++-------
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
index 8ab4733bb85..1ef5a89ee74 100644
--- a/include/hw/display/xlnx_dp.h
+++ b/include/hw/display/xlnx_dp.h
@@ -39,10 +39,15 @@
 #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
 #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
 
-#define DP_CORE_REG_ARRAY_SIZE              (0x3AF >> 2)
+#define DP_CORE_REG_OFFSET                  (0x0000)
+#define DP_CORE_REG_ARRAY_SIZE              (0x3B0 >> 2)
+#define DP_AVBUF_REG_OFFSET                 (0xB000)
 #define DP_AVBUF_REG_ARRAY_SIZE             (0x238 >> 2)
-#define DP_VBLEND_REG_ARRAY_SIZE            (0x1DF >> 2)
+#define DP_VBLEND_REG_OFFSET                (0xA000)
+#define DP_VBLEND_REG_ARRAY_SIZE            (0x1E0 >> 2)
+#define DP_AUDIO_REG_OFFSET                 (0xC000)
 #define DP_AUDIO_REG_ARRAY_SIZE             (0x50 >> 2)
+#define DP_CONTAINER_SIZE                   (0xC050)
 
 struct PixmanPlane {
     pixman_format_code_t format;
diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 9bb781e3125..0378570459d 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1219,19 +1219,22 @@ static void xlnx_dp_init(Object *obj)
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     XlnxDPState *s = XLNX_DP(obj);
 
-    memory_region_init(&s->container, obj, TYPE_XLNX_DP, 0xC050);
+    memory_region_init(&s->container, obj, TYPE_XLNX_DP, DP_CONTAINER_SIZE);
 
     memory_region_init_io(&s->core_iomem, obj, &dp_ops, s, TYPE_XLNX_DP
-                          ".core", 0x3AF);
-    memory_region_add_subregion(&s->container, 0x0000, &s->core_iomem);
+                          ".core", sizeof(s->core_registers));
+    memory_region_add_subregion(&s->container, DP_CORE_REG_OFFSET,
+                                &s->core_iomem);
 
     memory_region_init_io(&s->vblend_iomem, obj, &vblend_ops, s, TYPE_XLNX_DP
-                          ".v_blend", 0x1DF);
-    memory_region_add_subregion(&s->container, 0xA000, &s->vblend_iomem);
+                          ".v_blend", sizeof(s->vblend_registers));
+    memory_region_add_subregion(&s->container, DP_VBLEND_REG_OFFSET,
+                                &s->vblend_iomem);
 
     memory_region_init_io(&s->avbufm_iomem, obj, &avbufm_ops, s, TYPE_XLNX_DP
-                          ".av_buffer_manager", 0x238);
-    memory_region_add_subregion(&s->container, 0xB000, &s->avbufm_iomem);
+                          ".av_buffer_manager", sizeof(s->avbufm_registers));
+    memory_region_add_subregion(&s->container, DP_AVBUF_REG_OFFSET,
+                                &s->avbufm_iomem);
 
     memory_region_init_io(&s->audio_iomem, obj, &audio_ops, s, TYPE_XLNX_DP
                           ".audio", sizeof(s->audio_registers));
-- 
2.25.1


