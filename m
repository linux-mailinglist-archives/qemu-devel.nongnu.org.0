Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5084A60D1DA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:47:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMzf-0007PG-24; Tue, 25 Oct 2022 12:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMz1-0006ed-B8
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:55 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyf-0001mf-M6
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:53 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bu30so22089995wrb.8
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Zx92dKbW4mIOFyLLly74Mf4cM2iwFKImdqM4lHqQOyE=;
 b=Tr8hiPJ2AX3zJabGsiir7dVeV8v1pYsteXT8GT2b6mjuVTCQ2zv1qYpqtWZIGb8kPS
 TUsHrGfEDzYYvHkxM2SoZvk7WaTygeV9kQ+vZZjGjEGxu+cqXo+ifYavR9hyGCi6sdQH
 dcfkfzdCXrAruIUTLneFuEDpog+0SSxFb1HSzVOXzduF+nPO8uNiVYVio97eAi/7hwgh
 /S+0SR9R+CeboxrkizFhqQIIPx4Dw7QkR6UyQKqK5v502OGkqMMr/80QTfjaIR0sn43t
 NgU+kz1ktqYYaFOfHJZ+jsgXVPoljOsD02h60n64bKKbuuxnZW9UZ1Ntnrz5Y+QUgCPX
 8Gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zx92dKbW4mIOFyLLly74Mf4cM2iwFKImdqM4lHqQOyE=;
 b=aRsiklA38LrsAAM4vi4vbMcK3XfvwcEGC8LjT1JSIxWFfQa/taG1XF83JnKxtNJi0w
 cZcnfk4w/ckrmK5HwlPpMA1jFCIOZjiPuBO5j1ov0MKccTo/si9CyrmIcWvQsq9bwsum
 NAij/XJ3sbe0yBtC56RfGtSd1XIjPIZWiFH1x/nTdS99/boDItXHb8P37419g8AC76dm
 RRzd4JTPEg6mp1EqvYWcbevHIQR3j180q12w3YcBOKpe35Ehj8rfFd8cvH3SpmsPu+69
 +06Di9KN3lPhFrCbDDjyLsffclVOnSqAzk6cTyukKV0ptrXYoNVBcFGqV7cKW5N5OvWe
 rYlw==
X-Gm-Message-State: ACrzQf2T6Uv9/Zf+aSYdctvxD1rHOmXW83AUseSBcbdjvVQdK1QvrepI
 uPnMxpsgqPFtk+baYZpG30FOXsi3ZOLjNg==
X-Google-Smtp-Source: AMsMyM6FVdg4u0CudubPQX0O8RmJvxwmS9HhhkdYGOidY5Iaqy1iFT55bzK8Bl4MpCV4sTvBC2+zuA==
X-Received: by 2002:a5d:64c7:0:b0:22e:43a6:2801 with SMTP id
 f7-20020a5d64c7000000b0022e43a62801mr27167355wri.612.1666716027853; 
 Tue, 25 Oct 2022 09:40:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/30] openrisc: re-randomize rng-seed on reboot
Date: Tue, 25 Oct 2022 17:39:51 +0100
Message-Id: <20221025163952.4131046-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

When the system reboots, the rng-seed that the FDT has should be
re-randomized, so that the new boot gets a new seed. Since the FDT is in
the ROM region at this point, we add a hook right after the ROM has been
added, so that we have a pointer to that copy of the FDT.

Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-id: 20221025004327.568476-11-Jason@zx2c4.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/openrisc/boot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/openrisc/boot.c b/hw/openrisc/boot.c
index 128ccbcba24..007e80cd5a0 100644
--- a/hw/openrisc/boot.c
+++ b/hw/openrisc/boot.c
@@ -14,6 +14,7 @@
 #include "hw/openrisc/boot.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/qtest.h"
+#include "sysemu/reset.h"
 
 #include <libfdt.h>
 
@@ -111,6 +112,8 @@ uint32_t openrisc_load_fdt(void *fdt, hwaddr load_start,
 
     rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
                           &address_space_memory);
+    qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
+                        rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
 
     return fdt_addr;
 }
-- 
2.25.1


