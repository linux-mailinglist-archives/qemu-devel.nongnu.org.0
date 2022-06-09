Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713DC544806
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:53:34 +0200 (CEST)
Received: from localhost ([::1]:35810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEr7-0005gK-6v
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6z-0001Rn-Je
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:54 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6u-0005vV-D4
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:53 -0400
Received: by mail-wr1-x430.google.com with SMTP id v14so5217169wra.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PJOPhcXmy6choxCt00mzWvMSiOwf3GdqrbZyGZMGfOM=;
 b=BNaNygxBqSsuoPvknhhIgp6zcO0xaKmmL202ENURdiYY/5o9X497A5P6VE2VN7phsg
 TWu63cfcVsP0OoEWXy9obQOtwwsQmxub+wjeoeaykhNsSf599VZc7cUETPcmV15Cr7Um
 BgN3LpFGLCKTJJjjf2LdLrOQu0lyvB0XwymiI1i2RKNdCZIw34hfI+pW/KIMG2K3w3xR
 AE1PgurOVj/S1a9TnUZJOehC6+7HjPu8Cswln9htodD1AteF6dZbAVwF7mwsaxk2+90s
 hu9jZLSXA7jg4vg/vy3zsN6KG/qjz7KNRbXC14kJxv9V0u4qPqTmiAcskkllPhhAgHuR
 NZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PJOPhcXmy6choxCt00mzWvMSiOwf3GdqrbZyGZMGfOM=;
 b=O7YAh9oD3h1JmjpdKMIme+gtmVRGPQItZNuhMmLuU9OXh5+DVzjxaRvwdrJoNTvL/g
 PUcZQdk4bDw/JAUW++d03H07QM5BNQGA1YS+nptYjxXNMrf27CDWy1deS4Ec8TDCdHrO
 +QALoSfSqvQtQeiYoGLuIQloQhH/urMXjGo1XiIOcwSPVneAtpM+0bePw7ZKu0hQE+Ij
 xIK1q1eYqPAQZRKh2croKPYR8XTEX1oXgrebl74MiQRfz0vUERKifVOFgjuQ5ocS+Xpm
 lHeWE0hMh2w//6OeCnCywUJpLYIANkHl8xf/TQsYr6zcruLmffJvQ0LtilabxyKsEix8
 iScg==
X-Gm-Message-State: AOAM533d4/ntD6n0clBy1bYYqkmElCI+JcVw1Y7V/X3Rx+f1yyxjcaDZ
 m8F0Os+R3dAeTR5957bkiTrx8WJGdRG3Mw==
X-Google-Smtp-Source: ABdhPJyOKZCVDU8vMFrWi9NK+oD8FrqdeETN/G+W8U36h8ALRp8WJm2YqWWTbOJkyqQTzXYpWY2QIw==
X-Received: by 2002:adf:ed82:0:b0:213:1315:1dbb with SMTP id
 c2-20020adfed82000000b0021313151dbbmr35315784wro.484.1654765547694; 
 Thu, 09 Jun 2022 02:05:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/55] xlnx-zynqmp: fix the irq mapping for the display port
 and its dma
Date: Thu,  9 Jun 2022 10:04:49 +0100
Message-Id: <20220609090537.1971756-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

When the display port has been initially implemented the device
driver wasn't using interrupts.  Now that the display port driver
waits for vblank interrupt it has been noticed that the irq mapping
is wrong.  So use the value from the linux device tree and the
ultrascale+ reference manual.

Signed-off-by: Frederic Konrad <fkonrad@amd.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220601172353.3220232-5-fkonrad@xilinx.com
[PMM: refold lines in commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xlnx-zynqmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 375309e68eb..383e177a001 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -60,10 +60,10 @@
 #define SERDES_SIZE         0x20000
 
 #define DP_ADDR             0xfd4a0000
-#define DP_IRQ              113
+#define DP_IRQ              0x77
 
 #define DPDMA_ADDR          0xfd4c0000
-#define DPDMA_IRQ           116
+#define DPDMA_IRQ           0x7a
 
 #define APU_ADDR            0xfd5c0000
 #define APU_IRQ             153
-- 
2.25.1


