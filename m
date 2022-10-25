Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A714960D233
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 19:03:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMze-0007Kb-33; Tue, 25 Oct 2022 12:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMz1-0006ef-CF
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:55 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyf-0001QL-IF
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:48 -0400
Received: by mail-wr1-x436.google.com with SMTP id o4so13850548wrq.6
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DvesqOhV7EJhBL7AyS6aZECDQXhGGLTgIADuZfEnRis=;
 b=JtTBS6thioQuQ3+A8ybCW4frrq7RbRjQoX2uD8QRvB75FCmrh0td18e2j98l96+JbU
 JGWK9JZ9o7Mz7IXVG8gIj/th3cS0VLAhnMKHr5theWW94g6a8vMESl45oX/6Ebl38M98
 /CLg74zoRiEmlca8mrdivrR6tU33Z3oR59wdvK09tyFV1b6dgEtPPF5pubvuT3x0V3O4
 XwS6tT/UOzo8d40PABVbjNIFwBIVuE68p+R1g7bvLdXvf8PW0/FS5PMcQtAbPc5tmOMn
 1Gv6M7pYWLe93LPVInRNGQQ/8gTOVkfPTDJsG+eJypbXa0CaF5aEDnGIFnPFs+UCdXnN
 mZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DvesqOhV7EJhBL7AyS6aZECDQXhGGLTgIADuZfEnRis=;
 b=kK87JED6ZYsvOMfW30UyhZ1szUSJJ2x3CfLFDHecft8hdX9FuMV74B3+mhRU1D0Ll0
 rHNwtjb8WZragBGKF5Jq4Vstw9yYrtYH8H2R3azXyYW0jHKDLA03n8z8G65DbzsmtBOU
 y3V05zoM0MP3WTE7biyltTM92jGYaG5jYZBOKeDpkXqG3Zl98S1w/zjVYIP8mg0QRKNw
 FLiY+CDim56gMA/nfDNbqNndCi5EIRHBDbq3z0ErluQyCJwfFQWhitqVTizr33ske4S1
 pCKXg2eF8W7l4rHAN4gu3AyV+AWZ0bXqYI+1qqui9amQbC14T8SWqaBpglDqKLO3YjVF
 pUUA==
X-Gm-Message-State: ACrzQf2tAvwxsg4BrTKvw01ZjV13jM3g1vXrxzstIh5gV7EXYeowj0fa
 r2t/uhFirFoBbOTgYG1m/MBj6ZWiDqPHPQ==
X-Google-Smtp-Source: AMsMyM4nI2anJ/BvDHMTCIDc5SlewGMqqg/oOkwJdVBJan4xhwfDE37MeT/i7QwCR+tSQPiNw20txQ==
X-Received: by 2002:a05:6000:1689:b0:22e:2c03:36e7 with SMTP id
 y9-20020a056000168900b0022e2c0336e7mr27347756wrd.252.1666716023758; 
 Tue, 25 Oct 2022 09:40:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/30] riscv: re-randomize rng-seed on reboot
Date: Tue, 25 Oct 2022 17:39:47 +0100
Message-Id: <20221025163952.4131046-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20221025004327.568476-6-Jason@zx2c4.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/riscv/boot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index e82bf273388..ebd351c840d 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -30,6 +30,7 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/qtest.h"
 #include "sysemu/kvm.h"
+#include "sysemu/reset.h"
 
 #include <libfdt.h>
 
@@ -241,6 +242,8 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
 
     rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
                           &address_space_memory);
+    qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
+                        rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
 
     return fdt_addr;
 }
-- 
2.25.1


