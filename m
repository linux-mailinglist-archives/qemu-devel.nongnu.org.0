Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6AE4A3AE8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 00:16:21 +0100 (CET)
Received: from localhost ([::1]:43634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEJQi-0005wW-Nt
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 18:16:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEJMq-00038J-Kf; Sun, 30 Jan 2022 18:12:20 -0500
Received: from [2a00:1450:4864:20::232] (port=46805
 helo=mail-lj1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEJMn-0000vr-Ab; Sun, 30 Jan 2022 18:12:20 -0500
Received: by mail-lj1-x232.google.com with SMTP id c7so16533801ljr.13;
 Sun, 30 Jan 2022 15:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=awTWQmmNVu1OsQYeHrQ+A/19XUG6MkrMGcQv68t8Yp8=;
 b=RmnBQo7vVn1qhe5KAdWyo1nyoMneJvUcxH/HDQP9SYJkGSVrjd8wngHObjluWbqoDe
 G4uq0sEfuYMleDmLFAQc7w5x888YZrWMow7X1iFllgy2sPiPmYoII7tdxLFL0kcuHPFU
 XCx52CH22S5kBiFKB2NUbsq+09dUWexywgaxX410J/lsQX89zYCS93iPTSqpvw/+xTIL
 aDqjsr6y0/fJZyq7UyGx6S9qLSIvE7DbJsDys7FGMgi9BABiq9Q83XE2XHNtOZqOANrX
 PGqxwUtUI+FV/1MKIE6sgF21ewM1dk/1NnNHu+AHCHIOJeIDZL7G9lHwUDpWFeNu6JFd
 ceog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=awTWQmmNVu1OsQYeHrQ+A/19XUG6MkrMGcQv68t8Yp8=;
 b=SgQ1F9vaKtrQOhGDe4zerHrmZ3AwAafn5ASsp92PhvtoJ4yg6aNaHEzcHZV7h6kQYh
 h5f89Ws25LnPie0AX3Fod90tDEUkZ3Nvd0/IgHvZn/YxIabmU/YYkxyx8cSFumloZdeY
 pAfRCENKLRedH1OiLRBf0I8rTr5TYMLTJeZzAuQ7A7hI6S+SZNhzvLakrbJ3ejDBMuH3
 bDe1MXo2QkGuRzRkbdg7HZfY7MxYI0g0I3iyUTLOGx3AiBIwatSAKuNqEmVCt2K8KMr5
 MiQUAzFGQD90toIxIF/AJ8M3pOOx5cDuRb3NFiUt2h3eITe87fg2TN5Ssv6bL1WE/CiO
 YaGg==
X-Gm-Message-State: AOAM531KKeqxolPK+DPxuH1vwLokGXC7+L+AqPKRF8o4zcEs8+U1hEtp
 RKbaGq0tCqUcuGvR+ywiQc+FV2OGtwJ0qg==
X-Google-Smtp-Source: ABdhPJzC7KjzL9jgTLeq7ewXFCEWGTAIlb2biPD+/nFPH0YIe5tG+VBKsUryY0chiLdvRnC1Ok3vJA==
X-Received: by 2002:a2e:b749:: with SMTP id k9mr12146762ljo.135.1643584328595; 
 Sun, 30 Jan 2022 15:12:08 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id u18sm2568332lfg.0.2022.01.30.15.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:12:08 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/6] hw/arm/xlnx-zynqmp: Add unimplemented SERDES area
Date: Mon, 31 Jan 2022 00:12:01 +0100
Message-Id: <20220130231206.34035-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220130231206.34035-1-edgar.iglesias@gmail.com>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::232
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add unimplemented SERDES area.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/hw/arm/xlnx-zynqmp.h | 2 +-
 hw/arm/xlnx-zynqmp.c         | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 062e637fe4..99ceb8a609 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -84,7 +84,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 /*
  * Unimplemented mmio regions needed to boot some images.
  */
-#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 1
+#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 2
 
 struct XlnxZynqMPState {
     /*< private >*/
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 17305fe7b7..ba44e95899 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -51,6 +51,9 @@
 #define QSPI_IRQ            15
 #define QSPI_DMA_ADDR       0xff0f0800
 
+#define SERDES_ADDR         0xfd400000
+#define SERDES_SIZE         0x20000
+
 #define DP_ADDR             0xfd4a0000
 #define DP_IRQ              113
 
@@ -284,6 +287,7 @@ static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
         hwaddr size;
     } unimp_areas[ARRAY_SIZE(s->mr_unimp)] = {
         { .name = "apu", APU_ADDR, APU_SIZE },
+        { .name = "serdes", SERDES_ADDR, SERDES_SIZE },
     };
     unsigned int nr;
 
-- 
2.25.1


