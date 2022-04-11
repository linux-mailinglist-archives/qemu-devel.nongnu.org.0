Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AD24FC2E3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 19:06:05 +0200 (CEST)
Received: from localhost ([::1]:60356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndxUK-00012X-HI
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 13:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3SV5UYggKCnAkiVOchgVUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--wuhaotsh.bounces.google.com>)
 id 1ndxNN-0007w9-Gg
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:58:53 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:44639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3SV5UYggKCnAkiVOchgVUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--wuhaotsh.bounces.google.com>)
 id 1ndxNL-0004f2-Tk
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:58:53 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 d5-20020a62f805000000b0050566b4f4c0so7773531pfh.11
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 09:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=PBwivsX+CNRca4Tf4iFbEeHQqaqr2duXLo8VWx6ckBY=;
 b=Ip3XfDt6LwMxzZzBkyRC+VfpMnCBEfTIE7zkhHQP1bgV9Dg0KHGiG7HL9rr+FTjwjm
 bDj+uFskAzIzjEfykZm//ewfSWTgrUtjajYxEprErKi4nXC9N9zVUDVLVIwREyMaOPAa
 mq/nZWmp0jTQGe0oykHb0ESymX+xiOhc0mF1mV2IFjGoxii+me9ftFAyKIC1BxrklSIH
 JKADiJ/e4DjshWaNErF90Dc4cPYF9KMAgwQ3XI0JkpHLkNTF3ZP7mVOyW1hh7a243XSC
 52f3ojjGqeJ4SyecUJGjqtLTwMzzY9K/Ews3Cmjgh93+CRhCKWz6sykWWGMuhOEW9WKg
 bnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=PBwivsX+CNRca4Tf4iFbEeHQqaqr2duXLo8VWx6ckBY=;
 b=YjK0+vGnpsVlzD+pH+9QDRwvLetM8drtkUbU3g5GrfZOtJGURdNm91z6IfT8sJSVGA
 ID0PcNFcli+Cq1qllXnPlgDIGaGD1WVl6pNvO4odsV1cjS7VpMvcarUEzVpZXeynXCqQ
 deoMYbgzMQg8g51Lqlr7L75ulJ44CSc6TsSEykg058GdA+RCpJlgYthbG7PQW/3kaRpm
 KY3T6Jdsl7+Hxh2PS+0JCVhlMyADZ4zBDfxpcOB4Aqg6t8pGAbOyX5rkirjpjcIDJ+Io
 O3tLKgc6PO9TtESIRo3mMIM2QhSEPa4fPYuz6ENqtpe6bNc+cUXZcRp+WKdxml4X6j+k
 i3GQ==
X-Gm-Message-State: AOAM5335xNDTzvjU+TFfhibH/qOpnllJLBW97dIR+qECAy8cM7GrVsAk
 GGLKdXIU7QX66gA4dUKE+4JwHvdW1JQ8Fg==
X-Google-Smtp-Source: ABdhPJwgJLqZDW0P9rFAKnoaaNw0ptnwuBI17vsoBCwpGSSETnnxJKqeDBnodrnyE6yRJWc+AC2E2HL1XQKPnQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:903:244a:b0:158:558c:2227 with SMTP
 id l10-20020a170903244a00b00158558c2227mr7843714pls.121.1649696329961; Mon,
 11 Apr 2022 09:58:49 -0700 (PDT)
Date: Mon, 11 Apr 2022 09:58:41 -0700
In-Reply-To: <20220411165842.3912945-1-wuhaotsh@google.com>
Message-Id: <20220411165842.3912945-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220411165842.3912945-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
Subject: [PATCH v2 1/2] hw/misc: Add PWRON STRAP bit fields in GCR module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3SV5UYggKCnAkiVOchgVUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

Similar to the Aspeed code in include/misc/aspeed_scu.h, we define
the PWRON STRAP fields in their corresponding module for NPCM7XX.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 include/hw/misc/npcm7xx_gcr.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm7xx_gcr.h
index 13109d9d32..9419e0a7d2 100644
--- a/include/hw/misc/npcm7xx_gcr.h
+++ b/include/hw/misc/npcm7xx_gcr.h
@@ -19,6 +19,36 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 
+/*
+ * NPCM7XX PWRON STRAP bit fields
+ * 12: SPI0 powered by VSBV3 at 1.8V
+ * 11: System flash attached to BMC
+ * 10: BSP alternative pins.
+ * 9:8: Flash UART command route enabled.
+ * 7: Security enabled.
+ * 6: HI-Z state control.
+ * 5: ECC disabled.
+ * 4: Reserved
+ * 3: JTAG2 enabled.
+ * 2:0: CPU and DRAM clock frequency.
+ */
+#define NPCM7XX_PWRON_STRAP_SPI0F18                 BIT(12)
+#define NPCM7XX_PWRON_STRAP_SFAB                    BIT(11)
+#define NPCM7XX_PWRON_STRAP_BSPA                    BIT(10)
+#define NPCM7XX_PWRON_STRAP_FUP(x)                  ((x) << 8)
+#define     FUP_NORM_UART2      3
+#define     FUP_PROG_UART3      2
+#define     FUP_PROG_UART2      1
+#define     FUP_NORM_UART3      0
+#define NPCM7XX_PWRON_STRAP_SECEN                   BIT(7)
+#define NPCM7XX_PWRON_STRAP_HIZ                     BIT(6)
+#define NPCM7XX_PWRON_STRAP_ECC                     BIT(5)
+#define NPCM7XX_PWRON_STRAP_RESERVE1                BIT(4)
+#define NPCM7XX_PWRON_STRAP_J2EN                    BIT(3)
+#define NPCM7XX_PWRON_STRAP_CKFRQ(x)                (x)
+#define     CKFRQ_SKIPINIT      0x000
+#define     CKFRQ_DEFAULT       0x111
+
 /*
  * Number of registers in our device state structure. Don't change this without
  * incrementing the version_id in the vmstate.
-- 
2.35.1.1178.g4f1659d476-goog


