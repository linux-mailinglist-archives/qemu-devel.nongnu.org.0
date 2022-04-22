Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A7850B4DF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:20:51 +0200 (CEST)
Received: from localhost ([::1]:53174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqPC-00055N-DO
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9l-0004LG-Ph
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9j-0002bt-D1
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:53 -0400
Received: by mail-wr1-x42a.google.com with SMTP id x18so10355180wrc.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bF2VxJju+9YWyEUIW0SitG+F9+86cJzwUXdO302ijVA=;
 b=TsNezgKtO5E0odcdgJ/9efnHdoRqShKIkrEZUfyirqxilbvHkmi9FYX3l2AfH3YoVq
 WCwYRWI9Pwq9k2tBqtNvL891j4n6kiXZRPVD+FAg6tLiHPAjBMqPvkLDxj1N3fpA0uK6
 1IorTwa3BVxi3vCLGoziQA8XTfsQhFMShKzRs9Av17YoWSCxUkkFdNVjPz5++ZwiSKC2
 8ZX8VrG4NnJfkYM9TwIKusrXTnAflv6KluaUy25Mg2Y3nDQvR4g0ILYWqIJtOBHcj17W
 tnoeSum8uRFy/vc/7nOP/L5yPxEaS1vYKC6LNe52uf+yM7h1S8nOx3vmJ9//pbKAZHUa
 ZsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bF2VxJju+9YWyEUIW0SitG+F9+86cJzwUXdO302ijVA=;
 b=UN6T8gBn1TIp2RG45xgqc9bm8so0401OY+t81T7p2P0CTR8xB9QbYvnCXoWJ5iCuok
 zFaM786TiV+e6+4wXTLbU12dYqnY2bD4K8wbqhmCZTHyJpPMSwcDldtrXe5VKs8rj0ug
 vP30rgekBa7u6ugrjoLzXmru5HGQigEy2qnPYp7Mt71yN6DqLSfOaNYvz2i3N4PWqjoV
 j1G/ksueTW+ZTOrzolWvA5XKOaycj/MF+hcp5hYNflk5H3248KeYjLzQl3JgW9kcDtyc
 n2pCyee15Vyax6Hn1qTwWGlnGUv0nohmaRoXHwvI+KDwn9mq6wY92HRX/dVZ38ZsNF/Y
 tR1A==
X-Gm-Message-State: AOAM531lmvowG+0CmpSjZQ8vu8zO3e2FOD3SwybHI1NvNVQGSEmhNrAR
 yEQGZ/ukuZ1gQKOl9595lk+Jh0JbqYuoSw==
X-Google-Smtp-Source: ABdhPJzkStkXNpxk3c1uB1M2myg7fUmQO8HOT5gczTI3UnwMdmaV8ymqLCYvlxf0v7vjBFVT52PnbQ==
X-Received: by 2002:a5d:6e87:0:b0:206:452:5b87 with SMTP id
 k7-20020a5d6e87000000b0020604525b87mr2987031wrz.473.1650621889996; 
 Fri, 22 Apr 2022 03:04:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/61] hw/intc/arm_gicv3_its: Implement VSYNC
Date: Fri, 22 Apr 2022 11:03:48 +0100
Message-Id: <20220422100432.2288247-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

The VSYNC command forces the ITS to synchronize all outstanding ITS
operations for the specified vPEID, so that subsequent writes to
GITS_TRANSLATER honour them.  The QEMU implementation is always in
sync, so for us this is a nop, like the existing SYNC command.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-18-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h |  1 +
 hw/intc/arm_gicv3_its.c  | 11 +++++++++++
 hw/intc/trace-events     |  1 +
 3 files changed, 13 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index c1467ce7263..ef1d75b3cf4 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -330,6 +330,7 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define GITS_CMD_MOVALL           0x0E
 #define GITS_CMD_DISCARD          0x0F
 #define GITS_CMD_VMOVP            0x22
+#define GITS_CMD_VSYNC            0x25
 #define GITS_CMD_VMAPP            0x29
 #define GITS_CMD_VMAPTI           0x2A
 #define GITS_CMD_VMAPI            0x2B
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 8bc93295fb5..a3f5bac5513 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1165,6 +1165,17 @@ static void process_cmdq(GICv3ITSState *s)
              */
             trace_gicv3_its_cmd_sync();
             break;
+        case GITS_CMD_VSYNC:
+            /*
+             * VSYNC also is a nop, because our implementation is always
+             * in sync.
+             */
+            if (!its_feature_virtual(s)) {
+                result = CMD_CONTINUE;
+                break;
+            }
+            trace_gicv3_its_cmd_vsync();
+            break;
         case GITS_CMD_MAPD:
             result = process_mapd(s, cmdpkt);
             break;
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index a2dd1bdb6c3..b9efe14c690 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -191,6 +191,7 @@ gicv3_its_cmd_vmapi(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t d
 gicv3_its_cmd_vmapti(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t vintid, uint32_t doorbell) "GICv3 ITS: command VMAPI DeviceID 0x%x EventID 0x%x vPEID 0x%x vINTID 0x%x Dbell_pINTID 0x%x"
 gicv3_its_cmd_vmapp(uint32_t vpeid, uint64_t rdbase, int valid, uint64_t vptaddr, uint32_t vptsize) "GICv3 ITS: command VMAPP vPEID 0x%x RDbase 0x%" PRIx64 " V %d VPT_addr 0x%" PRIx64 " VPT_size 0x%x"
 gicv3_its_cmd_vmovp(uint32_t vpeid, uint64_t rdbase) "GICv3 ITS: command VMOVP vPEID 0x%x RDbase 0x%" PRIx64
+gicv3_its_cmd_vsync(void) "GICv3 ITS: command VSYNC"
 gicv3_its_cmd_unknown(unsigned cmd) "GICv3 ITS: unknown command 0x%x"
 gicv3_its_cte_read(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table read for ICID 0x%x: valid %d RDBase 0x%x"
 gicv3_its_cte_write(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table write for ICID 0x%x: valid %d RDBase 0x%x"
-- 
2.25.1


