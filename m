Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94967410328
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 05:03:20 +0200 (CEST)
Received: from localhost ([::1]:53650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRQdL-0001h7-EI
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 23:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mRQcE-0007wH-Bk; Fri, 17 Sep 2021 23:02:10 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:41632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mRQcC-00060j-Ok; Fri, 17 Sep 2021 23:02:10 -0400
Received: by mail-ed1-x529.google.com with SMTP id z94so36812445ede.8;
 Fri, 17 Sep 2021 20:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ODIW1e/WlpCJ7pU7w8IlSXyNH8pt8umb5v+h63svJc=;
 b=W83YvmQMA9n51Y0ark6cd4SvNL7HiFLTnRngjrz/K0sx8Lb/Bth9qdNi5b3w4utcju
 ocmhKvpWKjvriKZO9vFhA1dAeWhzNnFKnqsRGMzyoTBov2/eyEuxtvVwbMTQekERKcHT
 vD9FZSPCJIgVlUF4PfmPfT6D9S56WPZ13Hy2FovUy3oqZyaOJuwN3QmzAenYgTc71r4p
 SiRQmtykXX0bj2xnPVuKRQh1u+Db9X4ojd6YrVO57LjcvbvS6Q6XvttRAnQAnzB8PT83
 j2x/drfoT+gWz2+2cT6jq1CQXPfLc1rCYwS53Xq7vhQcFtATL/W1Gh+e7i8yt2MEhmmT
 a1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ODIW1e/WlpCJ7pU7w8IlSXyNH8pt8umb5v+h63svJc=;
 b=JQ62O3BWOl7tT2Z+TyS5sM79VadkNEXH2F4M0klyy8N6/EOTHmEZo0wZm/Y/dy6mC8
 SJ0mIbYHjF6zCd6zLJRz/FY6VKq0B+ok7jgqzY9STpv/PvibrN+tnsfVDpgUyseUcz3L
 uan/JVKcV9TnEao4Z1CemJty3194Fiz23rZomwFv94kOC9FuoNf+Hss5NLaHvitYU5AO
 6JO+C5X5UPWxk9fQrZkQ17B9GoJnFCifXlit38o6Psqivd8A/ItF5M35cRffGVgXlhpk
 TIqZQDgX13vkA8mS2RhBpM8cypSGiYIdIKgddLPNTKb3hUeSHH/vIJkiEzXI7mzDKNlY
 aB3w==
X-Gm-Message-State: AOAM533Zhwkvw2c8Y85XOUjWxc0dWDD/NdsnenT6RCYTM/qo1RpBGrmy
 BV2WvUovgOoOlPCsslJ+9H8=
X-Google-Smtp-Source: ABdhPJwCc8nHEkPIBw/E8AqZySPE+AyDZ6LG7kUFwL6DKS/9a+j1pCK0JFD59JUEqo6AlDazgCQPxA==
X-Received: by 2002:aa7:c1c6:: with SMTP id d6mr16457084edp.117.1631934125878; 
 Fri, 17 Sep 2021 20:02:05 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d3sm3419367edv.87.2021.09.17.20.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 20:02:05 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: [PATCH 2/3] hw/intc: openpic: Drop Raven related codes
Date: Sat, 18 Sep 2021 11:01:48 +0800
Message-Id: <20210918030149.642398-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918030149.642398-1-bmeng.cn@gmail.com>
References: <20210918030149.642398-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windirver.com>, Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

There is no machine that uses Motorola MCP750 (aka Raven) model.
Drop the related codes.

While we are here, drop the mentioning of Intel GW80314 I/O
companion chip in the comments as it has been obsolete for years,
and correct a typo too.

Signed-off-by: Bin Meng <bin.meng@windirver.com>
---

 include/hw/ppc/openpic.h | 16 ----------------
 hw/intc/openpic.c        | 28 +---------------------------
 2 files changed, 1 insertion(+), 43 deletions(-)

diff --git a/include/hw/ppc/openpic.h b/include/hw/ppc/openpic.h
index 74ff44bff0..f89802a15c 100644
--- a/include/hw/ppc/openpic.h
+++ b/include/hw/ppc/openpic.h
@@ -21,7 +21,6 @@ enum {
 
 typedef struct IrqLines { qemu_irq irq[OPENPIC_OUTPUT_NB]; } IrqLines;
 
-#define OPENPIC_MODEL_RAVEN       0
 #define OPENPIC_MODEL_FSL_MPIC_20 1
 #define OPENPIC_MODEL_FSL_MPIC_42 2
 #define OPENPIC_MODEL_KEYLARGO    3
@@ -32,13 +31,6 @@ typedef struct IrqLines { qemu_irq irq[OPENPIC_OUTPUT_NB]; } IrqLines;
 #define OPENPIC_MAX_IRQ     (OPENPIC_MAX_SRC + OPENPIC_MAX_IPI + \
                              OPENPIC_MAX_TMR)
 
-/* Raven */
-#define RAVEN_MAX_CPU      2
-#define RAVEN_MAX_EXT     48
-#define RAVEN_MAX_IRQ     64
-#define RAVEN_MAX_TMR      OPENPIC_MAX_TMR
-#define RAVEN_MAX_IPI      OPENPIC_MAX_IPI
-
 /* KeyLargo */
 #define KEYLARGO_MAX_CPU  4
 #define KEYLARGO_MAX_EXT  64
@@ -49,14 +41,6 @@ typedef struct IrqLines { qemu_irq irq[OPENPIC_OUTPUT_NB]; } IrqLines;
 /* Timers don't exist but this makes the code happy... */
 #define KEYLARGO_TMR_IRQ  (KEYLARGO_IPI_IRQ + KEYLARGO_MAX_IPI)
 
-/* Interrupt definitions */
-#define RAVEN_FE_IRQ     (RAVEN_MAX_EXT)     /* Internal functional IRQ */
-#define RAVEN_ERR_IRQ    (RAVEN_MAX_EXT + 1) /* Error IRQ */
-#define RAVEN_TMR_IRQ    (RAVEN_MAX_EXT + 2) /* First timer IRQ */
-#define RAVEN_IPI_IRQ    (RAVEN_TMR_IRQ + RAVEN_MAX_TMR) /* First IPI IRQ */
-/* First doorbell IRQ */
-#define RAVEN_DBL_IRQ    (RAVEN_IPI_IRQ + (RAVEN_MAX_CPU * RAVEN_MAX_IPI))
-
 typedef struct FslMpicInfo {
     int max_ext;
 } FslMpicInfo;
diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 2790c6710a..23eafb32bd 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -25,12 +25,8 @@
 /*
  *
  * Based on OpenPic implementations:
- * - Intel GW80314 I/O companion chip developer's manual
  * - Motorola MPC8245 & MPC8540 user manuals.
- * - Motorola MCP750 (aka Raven) programmer manual.
- * - Motorola Harrier programmer manuel
- *
- * Serial interrupts, as implemented in Raven chipset are not supported yet.
+ * - Motorola Harrier programmer manual
  *
  */
 
@@ -1564,28 +1560,6 @@ static void openpic_realize(DeviceState *dev, Error **errp)
 
         break;
 
-    case OPENPIC_MODEL_RAVEN:
-        opp->nb_irqs = RAVEN_MAX_EXT;
-        opp->vid = VID_REVISION_1_3;
-        opp->vir = VIR_GENERIC;
-        opp->vector_mask = 0xFF;
-        opp->tfrr_reset = 4160000;
-        opp->ivpr_reset = IVPR_MASK_MASK | IVPR_MODE_MASK;
-        opp->idr_reset = 0;
-        opp->max_irq = RAVEN_MAX_IRQ;
-        opp->irq_ipi0 = RAVEN_IPI_IRQ;
-        opp->irq_tim0 = RAVEN_TMR_IRQ;
-        opp->brr1 = -1;
-        opp->mpic_mode_mask = GCR_MODE_MIXED;
-
-        if (opp->nb_cpus != 1) {
-            error_setg(errp, "Only UP supported today");
-            return;
-        }
-
-        map_list(opp, list_le, &list_count);
-        break;
-
     case OPENPIC_MODEL_KEYLARGO:
         opp->nb_irqs = KEYLARGO_MAX_EXT;
         opp->vid = VID_REVISION_1_2;
-- 
2.25.1


