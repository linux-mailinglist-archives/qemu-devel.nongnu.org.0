Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C4B6D149E
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 03:04:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi39Q-0003FX-VF; Thu, 30 Mar 2023 21:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3_TAmZAcKCiAGKIHK9ECKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--komlodi.bounces.google.com>)
 id 1pi39O-0003Ed-9d
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:54 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3_TAmZAcKCiAGKIHK9ECKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--komlodi.bounces.google.com>)
 id 1pi39L-0006bu-Sr
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:54 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 x68-20020a628647000000b0062624c52117so9614343pfd.14
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 18:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680224510;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=aVvvr1bYSbeJf4UIVyQB9FV1A2yFNqaW2LAnOy/KAXw=;
 b=GZ7c65buXflW3TRzzcvlU/Nu2HlZDeNnvr92DE8HoWo9WE6H/O4gBrJ1J+s3QFZJUC
 ExLFdpJPqBghVv995pGVpajEw/p9l4RpAX3cvoYHRFvdcdu2Vvb469zLy3kLFbYxPHZL
 rMCbfVMvyh0HrHUPJDj0Kk0AV1tka2mMF0b9no8HC+ig1haOPYi7C7ce6btrWZSAM4m7
 Ht+mPQJhJr08ZpGksYi+Yy8MJsmfbiIZu3U8Uh4o6OHEFpdkO0Eqf9rTaND9eWWAIket
 6OmdhwSEPyuY9WZDROBhpC84ieen+QmMaT4NWKeagdKk/JuK/1FrfBZ7ryH3ltcsnmSG
 1MoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680224510;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aVvvr1bYSbeJf4UIVyQB9FV1A2yFNqaW2LAnOy/KAXw=;
 b=2djKR9+wgIAneq9r3NA/uBCW3YCjJ29cJCJsGEZzpxR5fM/sIOyzzDrXW9e8XMFdxm
 t1T9KC7rZS5+w/v8mClApojtkVCBdDz2Efrfh4zBjafVA2YrwhGKrsh1njokhJJXJDUn
 TdDJD2DBMLmKDwsjqsxOZrQwr8YeqKmMykq8ZhezdrVSXfET88gZ6aptzUBVnScD+0aX
 zp4cetw7lA13Sm+jqFYhaJGJJve+4YzeFxHR/pCqkY6udVVviWheI8SSmHtUvFKXoVSh
 AIYReS9mMKfgzoWqtQ5hvqQQMIHmQoYEDQDOU7YOYVa2JyKPT+gHJReGjyx6l5iXnC+4
 049g==
X-Gm-Message-State: AAQBX9fzzMu9n0FFYjrrc9tAjlqOCb5kFxek3tAHgK/5yD7nyzA8WZJB
 SQVHjg8fPU8Rm/pPRZWPbSc7mEowkxjJOSGrscNKyIxaCREulH38UkjW/gLOG+FGdjTzcIWd/3y
 AmuYmXsDs2ntM5wYqwRAwp9ytya5879R4dcDvPTSPPQqWgmnsd9Fgi4KQ/3cNa8M=
X-Google-Smtp-Source: AKy350ZYiPTKMX0AnCDKSH/qZqy0Sv7N3Hinb/TdIut1yXIjQZ4xIkoZ03V0S5RSNbyDGVu8EvineD9hdj/W
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a63:dc0c:0:b0:50b:dca1:b6f9 with SMTP id
 s12-20020a63dc0c000000b0050bdca1b6f9mr6920390pgg.1.1680224509998; Thu, 30 Mar
 2023 18:01:49 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:01:25 +0000
In-Reply-To: <20230331010131.1412571-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331010131.1412571-11-komlodi@google.com>
Subject: [PATCH 10/16] hw/i3c/aspeed_i3c: Add IBI handling
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3_TAmZAcKCiAGKIHK9ECKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--komlodi.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Adds handling for different IBI events that the controller can receive.
This includes:
- Handling a hot-join from a target
- Handling a secondary controller on the bus requesting to be the
  primary bus controller
- Handling an interrupt request from a target.

When receiving an IBI, the controller sets an interrupt to notify
software about what happened.
When the IBI is finished being serviced, the controller pushes the
result of the IBI and any data received from the target into the IBI
queue.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Stephen Longfield <slongfield@google.com>
---
 hw/i3c/aspeed_i3c.c         | 310 ++++++++++++++++++++++++++++++++++++
 hw/i3c/trace-events         |   2 +
 include/hw/i3c/aspeed_i3c.h |  27 ++++
 3 files changed, 339 insertions(+)

diff --git a/hw/i3c/aspeed_i3c.c b/hw/i3c/aspeed_i3c.c
index ffe0b21ca0..055ad3f7fd 100644
--- a/hw/i3c/aspeed_i3c.c
+++ b/hw/i3c/aspeed_i3c.c
@@ -20,6 +20,14 @@
 #include "hw/i3c/i3c.h"
 #include "hw/irq.h"
 
+/*
+ * Disable event command values. sent along with a DISEC CCC to disable certain
+ * events on targets.
+ */
+#define DISEC_HJ 0x08
+#define DISEC_CR 0x02
+#define DISEC_INT 0x01
+
 /* I3C Controller Registers */
 REG32(I3C1_REG0, 0x10)
 REG32(I3C1_REG1, 0x14)
@@ -444,6 +452,23 @@ static inline uint8_t aspeed_i3c_device_fifo_threshold_from_reg(uint8_t regval)
     return regval = regval ? (2 << regval) : 1;
 }
 
+static inline uint8_t aspeed_i3c_device_ibi_slice_size(AspeedI3CDevice *s)
+{
+    uint8_t ibi_slice_size = ARRAY_FIELD_EX32(s->regs, QUEUE_THLD_CTRL,
+                                              IBI_DATA_THLD);
+    /* The minimum supported slice size is 4 bytes. */
+    if (ibi_slice_size == 0) {
+        ibi_slice_size = 1;
+    }
+    ibi_slice_size *= sizeof(uint32_t);
+    /* maximum supported size is 63 bytes. */
+    if (ibi_slice_size >= 64) {
+        ibi_slice_size = 63;
+    }
+
+    return ibi_slice_size;
+}
+
 static void aspeed_i3c_device_update_irq(AspeedI3CDevice *s)
 {
     bool level = !!(s->regs[R_INTR_SIGNAL_EN] & s->regs[R_INTR_STATUS]);
@@ -591,6 +616,261 @@ static uint8_t aspeed_i3c_device_target_addr(AspeedI3CDevice *s,
                       DEV_DYNAMIC_ADDR);
 }
 
+static int aspeed_i3c_device_addr_table_index_from_addr(AspeedI3CDevice *s,
+                                                        uint8_t addr)
+{
+    uint8_t table_size = ARRAY_FIELD_EX32(s->regs, DEVICE_ADDR_TABLE_POINTER,
+                                          DEPTH);
+    for (uint8_t i = 0; i < table_size; i++) {
+        if (aspeed_i3c_device_target_addr(s, i) == addr) {
+            return i;
+        }
+    }
+    return -1;
+}
+
+static void aspeed_i3c_device_send_disec(AspeedI3CDevice *s)
+{
+    uint8_t ccc = I3C_CCC_DISEC;
+    if (s->ibi_data.send_direct_disec) {
+        ccc = I3C_CCCD_DISEC;
+    }
+
+    aspeed_i3c_device_send_start(s, I3C_BROADCAST, /*is_recv=*/false,
+                                 /*is_i2c=*/false);
+    aspeed_i3c_device_send_byte(s, ccc, /*is_i2c=*/false);
+    if (s->ibi_data.send_direct_disec) {
+        aspeed_i3c_device_send_start(s, s->ibi_data.disec_addr,
+                                     /*is_recv=*/false, /*is_i2c=*/false);
+    }
+    aspeed_i3c_device_send_byte(s, s->ibi_data.disec_byte, /*is_i2c=*/false);
+}
+
+static int aspeed_i3c_device_handle_hj(AspeedI3CDevice *s)
+{
+    if (ARRAY_FIELD_EX32(s->regs, IBI_QUEUE_CTRL, NOTIFY_REJECTED_HOT_JOIN)) {
+        s->ibi_data.notify_ibi_nack = true;
+    }
+
+    bool nack_and_disable = ARRAY_FIELD_EX32(s->regs, DEVICE_CTRL,
+                                             HOT_JOIN_ACK_NACK_CTRL);
+    if (nack_and_disable) {
+        s->ibi_data.ibi_queue_status = FIELD_DP32(s->ibi_data.ibi_queue_status,
+                                                  IBI_QUEUE_STATUS,
+                                                  IBI_STATUS, 1);
+        s->ibi_data.ibi_nacked = true;
+        s->ibi_data.disec_byte = DISEC_HJ;
+        return -1;
+    }
+    return 0;
+}
+
+static int aspeed_i3c_device_handle_ctlr_req(AspeedI3CDevice *s, uint8_t addr)
+{
+    if (ARRAY_FIELD_EX32(s->regs, IBI_QUEUE_CTRL, NOTIFY_REJECTED_MASTER_REQ)) {
+        s->ibi_data.notify_ibi_nack = true;
+    }
+
+    int table_offset = aspeed_i3c_device_addr_table_index_from_addr(s, addr);
+    /* Doesn't exist in the table, NACK it, don't DISEC. */
+    if (table_offset < 0) {
+        return -1;
+    }
+
+    table_offset += R_DEVICE_ADDR_TABLE_LOC1;
+    if (FIELD_EX32(s->regs[table_offset], DEVICE_ADDR_TABLE_LOC1, MR_REJECT)) {
+        s->ibi_data.ibi_queue_status = FIELD_DP32(s->ibi_data.ibi_queue_status,
+                                                  IBI_QUEUE_STATUS,
+                                                  IBI_STATUS, 1);
+        s->ibi_data.ibi_nacked = true;
+        s->ibi_data.disec_addr = addr;
+        /* Tell the requester to disable controller role requests. */
+        s->ibi_data.disec_byte = DISEC_CR;
+        s->ibi_data.send_direct_disec = true;
+        return -1;
+    }
+    return 0;
+}
+
+static int aspeed_i3c_device_handle_targ_irq(AspeedI3CDevice *s, uint8_t addr)
+{
+    if (ARRAY_FIELD_EX32(s->regs, IBI_QUEUE_CTRL, NOTIFY_REJECTED_SLAVE_IRQ)) {
+        s->ibi_data.notify_ibi_nack = true;
+    }
+
+    int table_offset = aspeed_i3c_device_addr_table_index_from_addr(s, addr);
+    /* Doesn't exist in the table, NACK it, don't DISEC. */
+    if (table_offset < 0) {
+        return -1;
+    }
+
+    table_offset += R_DEVICE_ADDR_TABLE_LOC1;
+    if (FIELD_EX32(s->regs[table_offset], DEVICE_ADDR_TABLE_LOC1, SIR_REJECT)) {
+        s->ibi_data.ibi_queue_status = FIELD_DP32(s->ibi_data.ibi_queue_status,
+                                                  IBI_QUEUE_STATUS,
+                                                  IBI_STATUS, 1);
+        s->ibi_data.ibi_nacked = true;
+        s->ibi_data.disec_addr = addr;
+        /* Tell the requester to disable interrupts. */
+        s->ibi_data.disec_byte = DISEC_INT;
+        s->ibi_data.send_direct_disec = true;
+        return -1;
+    }
+    return 0;
+}
+
+static int aspeed_i3c_device_ibi_handle(I3CBus *bus, I3CTarget *target,
+                                        uint8_t addr, bool is_recv)
+{
+    AspeedI3CDevice *s = ASPEED_I3C_DEVICE(bus->qbus.parent);
+
+    trace_aspeed_i3c_device_ibi_handle(s->id, addr, is_recv);
+    s->ibi_data.ibi_queue_status = FIELD_DP32(s->ibi_data.ibi_queue_status,
+                                              IBI_QUEUE_STATUS, IBI_ID,
+                                              (addr << 1) | is_recv);
+    /* Is this a hot join request? */
+    if (addr == I3C_HJ_ADDR) {
+        return aspeed_i3c_device_handle_hj(s);
+    }
+    /* Is secondary controller requesting access? */
+    if (addr == target->address && !is_recv) {
+        return aspeed_i3c_device_handle_ctlr_req(s, addr);
+    }
+    /* Is this a target IRQ? */
+    if (addr == target->address && is_recv) {
+        return aspeed_i3c_device_handle_targ_irq(s, addr);
+    }
+
+    /* Not sure what this is, NACK it. */
+    return -1;
+}
+
+static int aspeed_i3c_device_ibi_recv(I3CBus *bus, uint8_t data)
+{
+    AspeedI3CDevice *s = ASPEED_I3C_DEVICE(bus->qbus.parent);
+    if (fifo8_is_full(&s->ibi_data.ibi_intermediate_queue)) {
+        return -1;
+    }
+
+    fifo8_push(&s->ibi_data.ibi_intermediate_queue, data);
+    trace_aspeed_i3c_device_ibi_recv(s->id, data);
+    return 0;
+}
+
+static void aspeed_i3c_device_ibi_queue_push(AspeedI3CDevice *s)
+{
+    /* Stored value is in 32-bit chunks, convert it to byte chunks. */
+    uint8_t ibi_slice_size = aspeed_i3c_device_ibi_slice_size(s);
+    uint8_t num_slices = fifo8_num_used(&s->ibi_data.ibi_intermediate_queue) /
+                         ibi_slice_size;
+    uint8_t ibi_status_count = num_slices;
+    union {
+        uint8_t b[sizeof(uint32_t)];
+        uint32_t val32;
+    } ibi_data = {
+        .val32 = 0
+    };
+
+    /* The report was suppressed, do nothing. */
+    if (s->ibi_data.ibi_nacked && !s->ibi_data.notify_ibi_nack) {
+        ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_ST_STATUS,
+                         ASPEED_I3C_TRANSFER_STATE_IDLE);
+        ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_STATUS,
+                         ASPEED_I3C_TRANSFER_STATUS_IDLE);
+        return;
+    }
+
+    /* If we don't have any slices to push, just push the status. */
+    if (num_slices == 0) {
+        s->ibi_data.ibi_queue_status =
+             FIELD_DP32(s->ibi_data.ibi_queue_status, IBI_QUEUE_STATUS,
+                        LAST_STATUS, 1);
+        fifo32_push(&s->ibi_queue, s->ibi_data.ibi_queue_status);
+        ibi_status_count = 1;
+    }
+
+    for (uint8_t i = 0; i < num_slices; i++) {
+        /* If this is the last slice, set LAST_STATUS. */
+        if (fifo8_num_used(&s->ibi_data.ibi_intermediate_queue) <
+            ibi_slice_size) {
+            s->ibi_data.ibi_queue_status =
+                FIELD_DP32(s->ibi_data.ibi_queue_status, IBI_QUEUE_STATUS,
+                           IBI_DATA_LEN,
+                           fifo8_num_used(&s->ibi_data.ibi_intermediate_queue));
+            s->ibi_data.ibi_queue_status =
+                FIELD_DP32(s->ibi_data.ibi_queue_status, IBI_QUEUE_STATUS,
+                           LAST_STATUS, 1);
+        } else {
+            s->ibi_data.ibi_queue_status =
+                FIELD_DP32(s->ibi_data.ibi_queue_status, IBI_QUEUE_STATUS,
+                           IBI_DATA_LEN, ibi_slice_size);
+        }
+
+        /* Push the IBI status header. */
+        fifo32_push(&s->ibi_queue, s->ibi_data.ibi_queue_status);
+        /* Move each IBI byte into a 32-bit word and push it into the queue. */
+        for (uint8_t j = 0; j < ibi_slice_size; ++j) {
+            if (fifo8_is_empty(&s->ibi_data.ibi_intermediate_queue)) {
+                break;
+            }
+
+            ibi_data.b[j & 3] = fifo8_pop(&s->ibi_data.ibi_intermediate_queue);
+            /* We have 32-bits, push it to the IBI FIFO. */
+            if ((j & 0x03) == 0x03) {
+                fifo32_push(&s->ibi_queue, ibi_data.val32);
+                ibi_data.val32 = 0;
+            }
+        }
+        /* If the data isn't 32-bit aligned, push the leftover bytes. */
+        if (ibi_slice_size & 0x03) {
+            fifo32_push(&s->ibi_queue, ibi_data.val32);
+        }
+
+        /* Clear out the data length for the next iteration. */
+        s->ibi_data.ibi_queue_status = FIELD_DP32(s->ibi_data.ibi_queue_status,
+                                         IBI_QUEUE_STATUS, IBI_DATA_LEN, 0);
+    }
+
+    ARRAY_FIELD_DP32(s->regs, QUEUE_STATUS_LEVEL, IBI_BUF_BLR,
+                     fifo32_num_used(&s->ibi_queue));
+    ARRAY_FIELD_DP32(s->regs, QUEUE_STATUS_LEVEL, IBI_STATUS_CNT,
+                     ibi_status_count);
+    /* Threshold is the register value + 1. */
+    uint8_t threshold = ARRAY_FIELD_EX32(s->regs, QUEUE_THLD_CTRL,
+                                         IBI_STATUS_THLD) + 1;
+    if (fifo32_num_used(&s->ibi_queue) >= threshold) {
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, IBI_THLD, 1);
+        aspeed_i3c_device_update_irq(s);
+    }
+
+    /* State update. */
+    ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_ST_STATUS,
+                     ASPEED_I3C_TRANSFER_STATE_IDLE);
+    ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_STATUS,
+                     ASPEED_I3C_TRANSFER_STATUS_IDLE);
+}
+
+static int aspeed_i3c_device_ibi_finish(I3CBus *bus)
+{
+    AspeedI3CDevice *s = ASPEED_I3C_DEVICE(bus->qbus.parent);
+    bool nack_and_disable_hj = ARRAY_FIELD_EX32(s->regs, DEVICE_CTRL,
+                                                HOT_JOIN_ACK_NACK_CTRL);
+    if (nack_and_disable_hj || s->ibi_data.send_direct_disec) {
+        aspeed_i3c_device_send_disec(s);
+    }
+    aspeed_i3c_device_ibi_queue_push(s);
+
+    /* Clear out the intermediate values. */
+    s->ibi_data.ibi_queue_status = 0;
+    s->ibi_data.disec_addr = 0;
+    s->ibi_data.disec_byte = 0;
+    s->ibi_data.send_direct_disec = false;
+    s->ibi_data.notify_ibi_nack = false;
+    s->ibi_data.ibi_nacked = false;
+
+    return 0;
+}
+
 static uint32_t aspeed_i3c_device_intr_status_r(AspeedI3CDevice *s)
 {
     /* Only return the status whose corresponding EN bits are set. */
@@ -650,6 +930,25 @@ static uint32_t aspeed_i3c_device_pop_rx(AspeedI3CDevice *s)
     return val;
 }
 
+static uint32_t aspeed_i3c_device_ibi_queue_r(AspeedI3CDevice *s)
+{
+    if (fifo32_is_empty(&s->ibi_queue)) {
+        return 0;
+    }
+
+    uint32_t val = fifo32_pop(&s->ibi_queue);
+    ARRAY_FIELD_DP32(s->regs, QUEUE_STATUS_LEVEL, IBI_BUF_BLR,
+                     fifo32_num_used(&s->ibi_queue));
+    /* Threshold is the register value + 1. */
+    uint8_t threshold = ARRAY_FIELD_EX32(s->regs, QUEUE_THLD_CTRL,
+                                         IBI_STATUS_THLD) + 1;
+    if (fifo32_num_used(&s->ibi_queue) < threshold) {
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, IBI_THLD, 0);
+        aspeed_i3c_device_update_irq(s);
+    }
+    return val;
+}
+
 static uint32_t aspeed_i3c_device_resp_queue_port_r(AspeedI3CDevice *s)
 {
     if (fifo32_is_empty(&s->resp_queue)) {
@@ -687,6 +986,9 @@ static uint64_t aspeed_i3c_device_read(void *opaque, hwaddr offset,
     case R_INTR_FORCE:
         value = 0;
         break;
+    case R_IBI_QUEUE_DATA:
+        value = aspeed_i3c_device_ibi_queue_r(s);
+        break;
     case R_INTR_STATUS:
         value = aspeed_i3c_device_intr_status_r(s);
         break;
@@ -1412,8 +1714,16 @@ static void aspeed_i3c_device_realize(DeviceState *dev, Error **errp)
     fifo32_create(&s->resp_queue, ASPEED_I3C_RESP_QUEUE_CAPACITY);
     fifo32_create(&s->tx_queue, ASPEED_I3C_TX_QUEUE_CAPACITY);
     fifo32_create(&s->rx_queue, ASPEED_I3C_RX_QUEUE_CAPACITY);
+    fifo32_create(&s->ibi_queue, ASPEED_I3C_IBI_QUEUE_CAPACITY);
+    /* Arbitrarily large enough to not be an issue. */
+    fifo8_create(&s->ibi_data.ibi_intermediate_queue,
+                  ASPEED_I3C_IBI_QUEUE_CAPACITY * 8);
 
     s->bus = i3c_init_bus(DEVICE(s), name);
+    I3CBusClass *bc = I3C_BUS_GET_CLASS(s->bus);
+    bc->ibi_handle = aspeed_i3c_device_ibi_handle;
+    bc->ibi_recv = aspeed_i3c_device_ibi_recv;
+    bc->ibi_finish = aspeed_i3c_device_ibi_finish;
 }
 
 static uint64_t aspeed_i3c_read(void *opaque, hwaddr addr, unsigned int size)
diff --git a/hw/i3c/trace-events b/hw/i3c/trace-events
index 370c08ea45..7a202b28c9 100644
--- a/hw/i3c/trace-events
+++ b/hw/i3c/trace-events
@@ -7,6 +7,8 @@ aspeed_i3c_device_read(uint32_t deviceid, uint64_t offset, uint64_t data) "I3C D
 aspeed_i3c_device_write(uint32_t deviceid, uint64_t offset, uint64_t data) "I3C Dev[%u] write: offset 0x%" PRIx64 " data 0x%" PRIx64
 aspeed_i3c_device_send(uint32_t deviceid, uint32_t num_bytes) "I3C Dev[%u] send %" PRId32 " bytes to bus"
 aspeed_i3c_device_recv_data(uint32_t deviceid, uint32_t num_bytes) "I3C Dev[%u] recv %" PRId32 " bytes from bus"
+aspeed_i3c_device_ibi_recv(uint32_t deviceid, uint8_t ibi_byte) "I3C Dev[%u] recv IBI byte 0x%" PRIx8
+aspeed_i3c_device_ibi_handle(uint32_t deviceid, uint8_t addr, bool rnw) "I3C Dev[%u] handle IBI from address 0x%" PRIx8 " RnW=%d"
 aspeed_i3c_device_pop_rx(uint32_t deviceid, uint32_t data) "I3C Dev[%u] pop 0x%" PRIx32 " from RX FIFO"
 aspeed_i3c_device_resp_queue_push(uint32_t deviceid, uint32_t data) "I3C Dev[%u] push 0x%" PRIx32 " to response queue"
 aspeed_i3c_device_push_tx(uint32_t deviceid, uint32_t data) "I3C Dev[%u] push 0x%" PRIx32 " to TX FIFO"
diff --git a/include/hw/i3c/aspeed_i3c.h b/include/hw/i3c/aspeed_i3c.h
index 55f2f45915..d2f0739b79 100644
--- a/include/hw/i3c/aspeed_i3c.h
+++ b/include/hw/i3c/aspeed_i3c.h
@@ -27,6 +27,7 @@ OBJECT_DECLARE_TYPE(AspeedI3CState, AspeedI3CClass, ASPEED_I3C)
 #define ASPEED_I3C_RESP_QUEUE_CAPACITY 0x10
 #define ASPEED_I3C_TX_QUEUE_CAPACITY   0x40
 #define ASPEED_I3C_RX_QUEUE_CAPACITY   0x40
+#define ASPEED_I3C_IBI_QUEUE_CAPACITY  0x10
 
 /* From datasheet. */
 #define ASPEED_I3C_CMD_ATTR_TRANSFER_CMD 0
@@ -146,6 +147,28 @@ typedef union AspeedI3CCmdQueueData {
     AspeedI3CAddrAssignCmd addr_assign_cmd;
 } AspeedI3CCmdQueueData;
 
+/*
+ * When we receive an IBI with data, we need to store it temporarily until
+ * the target is finished sending data. Then we can set the IBI queue status
+ * appropriately.
+ */
+typedef struct AspeedI3CDeviceIBIData {
+    /* Do we notify the user that an IBI was NACKed? */
+    bool notify_ibi_nack;
+    /* Intermediate storage of IBI_QUEUE_STATUS. */
+    uint32_t ibi_queue_status;
+    /* Temporary buffer to store IBI data from the target. */
+    Fifo8 ibi_intermediate_queue;
+    /* The address we should send a CCC_DISEC to. */
+    uint8_t disec_addr;
+    /* The byte we should send along with the CCC_DISEC. */
+    uint8_t disec_byte;
+    /* Should we send a direct DISEC CCC? (As opposed to global). */
+    bool send_direct_disec;
+    /* Was this IBI NACKed? */
+    bool ibi_nacked;
+} AspeedI3CDeviceIBIData;
+
 OBJECT_DECLARE_SIMPLE_TYPE(AspeedI3CDevice, ASPEED_I3C_DEVICE)
 typedef struct AspeedI3CDevice {
     /* <private> */
@@ -160,6 +183,10 @@ typedef struct AspeedI3CDevice {
     Fifo32 resp_queue;
     Fifo32 tx_queue;
     Fifo32 rx_queue;
+    Fifo32 ibi_queue;
+
+    /* Temporary storage for IBI data. */
+    AspeedI3CDeviceIBIData ibi_data;
 
     uint8_t id;
     uint32_t regs[ASPEED_I3C_DEVICE_NR_REGS];
-- 
2.40.0.348.gf938b09366-goog


