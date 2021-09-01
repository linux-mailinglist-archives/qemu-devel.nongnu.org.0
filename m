Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D3F3FD1C5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 05:31:35 +0200 (CEST)
Received: from localhost ([::1]:38966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLGyM-0001rn-53
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 23:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLGul-0002uS-UQ; Tue, 31 Aug 2021 23:27:51 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:38538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLGuf-0007PX-1F; Tue, 31 Aug 2021 23:27:51 -0400
Received: by mail-pf1-x431.google.com with SMTP id s29so960129pfw.5;
 Tue, 31 Aug 2021 20:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KiJerEA0l1Mswg17/MFGeGT8EJtomWZFVBztll3kflk=;
 b=pdsvOHX2UrI1MoHztGRzHzXaam97w2oIj91hi6pcSmFZOXEQURK8X12nvBOAJn7kOG
 haXxcA9nBHgVgz/u1b3OfAeHjO1r07X+bU7TioEMRS8DXLkPTC0QoIQvWEJW95/4YXzy
 MbpnVNh0DcZANvqMO2Nxx5yHlTl5s31W3hbjNmAXZyqJgGSJb6nDT/3PNCF4ZkroUn9I
 El/bE8aw5vy4tkFLtmUzVwJoiRoL7CXH95/nDtj0jyaOssckwDXx+Bs2S3HCjAKkt02p
 zt0I6fnoO9rMnufmU0C8IIrwDcu3VXEeM+Z+OygGOY/hcDf9ZjzNBuH1gQ8ODTujwqaw
 thFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KiJerEA0l1Mswg17/MFGeGT8EJtomWZFVBztll3kflk=;
 b=l18g+e+U05Ec95fukuO+A8qQ4w5lB3qsvaJYfCk4be87twIdFfsk9xYXehU40ME50C
 ZkLUFcQt1kUwGV7IGOCqSAXxa9DE/0qhv6WGMGsgbfkD8h/v+C01o1GE+MzsS0eSUB3q
 CmRrm4K8OQrhN62wUPjh3cg7R6VCrNhF5FU9/DDIzx+3fMVmQ19fOG/zd2qdLIFeASEA
 +cpX/wNuTxiM6g+k+rU2BcctVARp1bEUr48ncTQtPsLB1MeOOK5cOvZ0naFUJTnieH8P
 5/22AorHaAMesfMStNTsgpzerEJx4ooB6ujViPKZ6TBF/DikawqmLLF1TpecXMQZah/e
 lA4w==
X-Gm-Message-State: AOAM530srTzz0arPx0oc4PPyYigrP5yCTRBBI2FbZZC23ff2ipCHYKwr
 suFueb2YZ31FfIbmJlzLhS8=
X-Google-Smtp-Source: ABdhPJyRW2DfrMV2KM/myM3MukBjJaBnMoTalyChiTdXHVyyAMcN3Ak0dHzYIBV678/SecJ6KGextQ==
X-Received: by 2002:a63:f913:: with SMTP id h19mr29449356pgi.351.1630466863081; 
 Tue, 31 Aug 2021 20:27:43 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id g2sm7174467pfo.154.2021.08.31.20.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 20:27:42 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 4/5] hw/char: cadence_uart: Convert to memop_with_attrs()
 ops
Date: Wed,  1 Sep 2021 11:27:23 +0800
Message-Id: <20210901032724.23256-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901032724.23256-1-bmeng.cn@gmail.com>
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x431.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This converts uart_read() and uart_write() to memop_with_attrs() ops.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- new patch: hw/char: cadence_uart: Convert to memop_with_attrs() ops

 hw/char/cadence_uart.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index fff8be3619..8bcf2b718a 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -411,15 +411,15 @@ static void uart_read_rx_fifo(CadenceUARTState *s, uint32_t *c)
     uart_update_status(s);
 }
 
-static void uart_write(void *opaque, hwaddr offset,
-                          uint64_t value, unsigned size)
+static MemTxResult uart_write(void *opaque, hwaddr offset,
+                              uint64_t value, unsigned size, MemTxAttrs attrs)
 {
     CadenceUARTState *s = opaque;
 
     DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value);
     offset >>= 2;
     if (offset >= CADENCE_UART_R_MAX) {
-        return;
+        return MEMTX_DECODE_ERROR;
     }
     switch (offset) {
     case R_IER: /* ier (wts imr) */
@@ -466,30 +466,34 @@ static void uart_write(void *opaque, hwaddr offset,
         break;
     }
     uart_update_status(s);
+
+    return MEMTX_OK;
 }
 
-static uint64_t uart_read(void *opaque, hwaddr offset,
-        unsigned size)
+static MemTxResult uart_read(void *opaque, hwaddr offset,
+                             uint64_t *value, unsigned size, MemTxAttrs attrs)
 {
     CadenceUARTState *s = opaque;
     uint32_t c = 0;
 
     offset >>= 2;
     if (offset >= CADENCE_UART_R_MAX) {
-        c = 0;
-    } else if (offset == R_TX_RX) {
+        return MEMTX_DECODE_ERROR;
+    }
+    if (offset == R_TX_RX) {
         uart_read_rx_fifo(s, &c);
     } else {
-       c = s->r[offset];
+        c = s->r[offset];
     }
 
     DB_PRINT(" offset:%x data:%08x\n", (unsigned)(offset << 2), (unsigned)c);
-    return c;
+    *value = c;
+    return MEMTX_OK;
 }
 
 static const MemoryRegionOps uart_ops = {
-    .read = uart_read,
-    .write = uart_write,
+    .read_with_attrs = uart_read,
+    .write_with_attrs = uart_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.25.1


