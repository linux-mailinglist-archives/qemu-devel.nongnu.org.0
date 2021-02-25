Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D90323C59
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:54:26 +0100 (CET)
Received: from localhost ([::1]:52888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtgP-0008FW-LD
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEtd4-0004jM-TZ; Wed, 24 Feb 2021 07:51:00 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEtd2-0003qA-Fn; Wed, 24 Feb 2021 07:50:58 -0500
Received: by mail-pg1-x534.google.com with SMTP id o38so1364086pgm.9;
 Wed, 24 Feb 2021 04:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+UzSdyjSd904zCeIE0aTyBCjawmbJBRlBQ1EDG6ABek=;
 b=Awp7IjQCq1bsmI9jvdL+D5rmMSSvva9kk3AxpoIu6FNlMpPkMHSifRiWI9NnDw+gAq
 toq/kXRKgNljdClroTr0PuhZ5LMnL+GRTv61o6JParhwcPEJloeLIJ8cPYNfugCTEPTP
 PIx0L5MyeklqoWZGaMsZh2BB+54QYRycSbBScZp4agkC2C3u+yNh8thm1HRjzWlRLj2m
 U+h67qHpTuRDN6q8dpTkvy+4m0kqjRxjMoMvO0hp0KWxbph8D6yXsfo77GYg7g/spJmb
 E3E3MeacKXf7rRgrLx9yboDtNFvHsXLNHXRG3LWyBqsnvrVqQzgV16K6dEa5sMNni0GC
 zKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+UzSdyjSd904zCeIE0aTyBCjawmbJBRlBQ1EDG6ABek=;
 b=qeT53tUsyh8hc+DAcN9DNq2EyTZOHHtUTPUwuOT3zVO1VJZ9lWC/A3ZfUykn+Yfd03
 inCGw9iUtqhHts7VxeASzCYIZqN4UyhxcyEPNhcMWprm5l9BXkStNn+j2feIcpdG0Pr8
 igukm9qCXHbytRUWYOI/fDQ/MZOiTzHumdTVIpRFaer178Av9NM6ZnvCVa/UsoUVfcBC
 OEvnKuZXUZNlSXiCOGGgLQjiZbnpT/9cYX3fH6saxqXFSxNN8puYmLxJlwnEYKxTR9rK
 Fu0WGRaG5OOvfuQiBg6FXJ3MnPr1JAzT4Jtar8QoeoWf0ygPb97kPZl2Ol9a2oSleKtV
 Lj8g==
X-Gm-Message-State: AOAM53202coEadIrCz9SFaD365083F4cPFxyd7MeSLppptGAf2p3EUvI
 MgHy+W4QN46PQabgYBh2cMk=
X-Google-Smtp-Source: ABdhPJx76AC1nv/1Z4XhNP3obIlg/US8yV+NpNkSmnyBSWtXhWY69ZMXcqboRP3clde82GjPHC0C+w==
X-Received: by 2002:aa7:8889:0:b029:1ed:f38:4438 with SMTP id
 z9-20020aa788890000b02901ed0f384438mr29358604pfe.44.1614171054973; 
 Wed, 24 Feb 2021 04:50:54 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id e12sm2795661pjj.23.2021.02.24.04.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 04:50:54 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 4/5] hw/ssi: xilinx_spips: Clean up coding convention issues
Date: Wed, 24 Feb 2021 20:50:23 +0800
Message-Id: <20210224125024.4160-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210224125024.4160-1-bmeng.cn@gmail.com>
References: <20210224125024.4160-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x534.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

There are some coding convention warnings in xilinx_spips.c,
as reported by:

  $ ./scripts/checkpatch.pl hw/ssi/xilinx_spips.c

Let's clean them up.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

(no changes since v1)

 hw/ssi/xilinx_spips.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index a897034601..8a0cc22d42 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -176,7 +176,8 @@
     FIELD(GQSPI_FIFO_CTRL, GENERIC_FIFO_RESET, 0, 1)
 #define R_GQSPI_GFIFO_THRESH    (0x150 / 4)
 #define R_GQSPI_DATA_STS (0x15c / 4)
-/* We use the snapshot register to hold the core state for the currently
+/*
+ * We use the snapshot register to hold the core state for the currently
  * or most recently executed command. So the generic fifo format is defined
  * for the snapshot register
  */
@@ -424,7 +425,8 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)
     xlnx_zynqmp_qspips_update_ixr(s);
 }
 
-/* N way (num) in place bit striper. Lay out row wise bits (MSB to LSB)
+/*
+ * N way (num) in place bit striper. Lay out row wise bits (MSB to LSB)
  * column wise (from element 0 to N-1). num is the length of x, and dir
  * reverses the direction of the transform. Best illustrated by example:
  * Each digit in the below array is a single bit (num == 3):
@@ -637,8 +639,10 @@ static void xilinx_spips_flush_txfifo(XilinxSPIPS *s)
                 tx_rx[i] = tx;
             }
         } else {
-            /* Extract a dummy byte and generate dummy cycles according to the
-             * link state */
+            /*
+             * Extract a dummy byte and generate dummy cycles according to the
+             * link state
+             */
             tx = fifo8_pop(&s->tx_fifo);
             dummy_cycles = 8 / s->link_state;
         }
@@ -721,8 +725,9 @@ static void xilinx_spips_flush_txfifo(XilinxSPIPS *s)
             }
             break;
         case (SNOOP_ADDR):
-            /* Address has been transmitted, transmit dummy cycles now if
-             * needed */
+            /*
+             * Address has been transmitted, transmit dummy cycles now if needed
+             */
             if (s->cmd_dummies < 0) {
                 s->snoop_state = SNOOP_NONE;
             } else {
@@ -876,7 +881,7 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
 }
 
 static uint64_t xilinx_spips_read(void *opaque, hwaddr addr,
-                                                        unsigned size)
+                                  unsigned size)
 {
     XilinxSPIPS *s = opaque;
     uint32_t mask = ~0;
@@ -970,7 +975,7 @@ static uint64_t xlnx_zynqmp_qspips_read(void *opaque,
 }
 
 static void xilinx_spips_write(void *opaque, hwaddr addr,
-                                        uint64_t value, unsigned size)
+                               uint64_t value, unsigned size)
 {
     int mask = ~0;
     XilinxSPIPS *s = opaque;
@@ -1072,7 +1077,7 @@ static void xilinx_qspips_write(void *opaque, hwaddr addr,
 }
 
 static void xlnx_zynqmp_qspips_write(void *opaque, hwaddr addr,
-                                        uint64_t value, unsigned size)
+                                     uint64_t value, unsigned size)
 {
     XlnxZynqMPQSPIPS *s = XLNX_ZYNQMP_QSPIPS(opaque);
     uint32_t reg = addr / 4;
-- 
2.25.1


