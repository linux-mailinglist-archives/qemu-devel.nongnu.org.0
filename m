Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892C36D14A5
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 03:05:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi39P-0003Eq-C9; Thu, 30 Mar 2023 21:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3_DAmZAcKCh8FJHGJ8DBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--komlodi.bounces.google.com>)
 id 1pi39N-0003EV-Pu
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:53 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3_DAmZAcKCh8FJHGJ8DBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--komlodi.bounces.google.com>)
 id 1pi39K-0006bY-1V
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:53 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-54629ed836aso66152017b3.10
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 18:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680224508;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=o0XGgn6W0h+/sbpah/0CqXSzbAJ5CfaCizDvxJmgxSM=;
 b=TUNUIXCoKzWY9nyHjkKMTuMN13zTdAK2uy0Ov3O+UKvlvFrz8rhOHJmE8YqVJXHJS8
 vKHijcijH4SEgT63ZdvPt6UFw8McSkHVd4ohIem+5yXFPd8GiFPcaOc+hrO3fpMi/Iam
 hsLosfxsOWeeeNb6fAuxjo8IpGOavxmuW0+JJIOhCBl0LMErV7PicWXv53aqOQPeuOz1
 Rjy1GhJKyGmfAj5SfZ3DWyoGSaVtL6YNpaN4VxaE7vwjMVthqxzlgatryYlkCHxK0Eua
 acN7INavEuzDdcvrtPylB4575P9WNPo5y5RcNRJhTEutGmetXbKOafy7RENLAYRk6yUP
 jf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680224508;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o0XGgn6W0h+/sbpah/0CqXSzbAJ5CfaCizDvxJmgxSM=;
 b=vF9JQ0LGJEyd/NsJHAyvpS6NvnCs7YT4hIDqO6wiURnAoSwTXomTWIMlptH91a8/vr
 in8SfzGtUmKbmra9qmaknWqDAYcxNkM/ASRjovoTyVSlk5uaANZZXMh+AzAG98bSC+9p
 y9ROnbsA8/eIigKHoAjn3HefJCiF4OK53J7GJwvK/y/idaOAhUSjmOMouwjKBctDXe1W
 BESLaxD+bsSrbJCy6DTLWwfYg0oucKggk0v7UusJFgLm8ACcWFsF2T08Kfm+GlTcM6bY
 qYMMGc4GMQY29qokZtESNQSiH4CbYSPI0Oxml4ev3D6T5v49IqKIhkOJLIM/VbgNxlCG
 E6Aw==
X-Gm-Message-State: AAQBX9fdeMI8vIUFXl/LmA5EI9YumuXWrPevjbE8iT0oUvPk3FriBXw0
 9tAdHtbLObjH3NfEnH8ZiUYAGQcDXuNb1ARY1s7vlSyN9W5vwFiginEbz8aJfOg4byWKcVOHYuK
 /hFLg6vrHMPxGshvsd6McStREGmpWoHhTOs39LI+iyZIJXZjHBGg3vk+Y/XwoewA=
X-Google-Smtp-Source: AKy350ZGRGj93nvUQnFwN7+vwKVDPuD0Oe9u5t/yyxVGY4VjmY1nbKKxTFnJjpIVtkoCzDBeCbLn6dzx+dQL
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a05:6902:709:b0:a67:c976:c910 with SMTP id
 k9-20020a056902070900b00a67c976c910mr12943422ybt.7.1680224508471; Thu, 30 Mar
 2023 18:01:48 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:01:24 +0000
In-Reply-To: <20230331010131.1412571-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331010131.1412571-10-komlodi@google.com>
Subject: [PATCH 09/16] hw/i3c/aspeed_i3c: Add data TX and RX
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3_DAmZAcKCh8FJHGJ8DBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--komlodi.bounces.google.com;
 helo=mail-yw1-x1149.google.com
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

This adds data and CCC transmission, reception, and the associated
queues required for data transmission and reception to happen.

The I3C controller transmits data by the user writing into a command
queue. When the queue has a command and an argument in it, the
controller starts executing the command.

The controller can execute 1 of 3 ways:
1. A larger data transfer that involves using the TX and RX queues. This
   is the most common way the controller does transactions.

2. A small data transfer that involves sending a couple bytes passed
   into the command queue argument.

3. An address assignment command. This is how the controller does
   ENTDAA. When ENTDAA succeeds in assigning an address to a target, it
   updates the controller's char table with the target's PID, BCR, and
   DCR.

The controller determines what addresses to send by looking at the index
in the device address table specified by the argument in the command
queue. ENTDAA also uses these addresses to assign to targets on the bus.

When the controller is done executing a command, it puts a response in
the response queue indicating how command execution went.

In order for the user to send and receive data to/from the controller,
the user reads/writes to a bidirectional TX/RX port.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Stephen Longfield <slongfield@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/i3c/aspeed_i3c.c         | 848 ++++++++++++++++++++++++++++++++++++
 hw/i3c/trace-events         |  10 +
 include/hw/i3c/aspeed_i3c.h | 132 ++++++
 3 files changed, 990 insertions(+)

diff --git a/hw/i3c/aspeed_i3c.c b/hw/i3c/aspeed_i3c.c
index b9aa1367d8..ffe0b21ca0 100644
--- a/hw/i3c/aspeed_i3c.c
+++ b/hw/i3c/aspeed_i3c.c
@@ -414,12 +414,183 @@ static const uint32_t ast2600_i3c_device_ro[ASPEED_I3C_DEVICE_NR_REGS] = {
     [R_SLAVE_CONFIG]                = 0xffffffff,
 };
 
+static inline bool aspeed_i3c_device_has_entdaa(AspeedI3CDevice *s)
+{
+    return ARRAY_FIELD_EX32(s->regs, HW_CAPABILITY, ENTDAA);
+}
+
+static inline bool aspeed_i3c_device_has_hdr_ts(AspeedI3CDevice *s)
+{
+    return ARRAY_FIELD_EX32(s->regs, HW_CAPABILITY, HDR_TS);
+}
+
+static inline bool aspeed_i3c_device_has_hdr_ddr(AspeedI3CDevice *s)
+{
+    return ARRAY_FIELD_EX32(s->regs, HW_CAPABILITY, HDR_DDR);
+}
+
+static inline bool aspeed_i3c_device_can_transmit(AspeedI3CDevice *s)
+{
+    /*
+     * We can only transmit if we're enabled and the resume bit is cleared.
+     * The resume bit is set on a transaction error, and software must clear it.
+     */
+    return ARRAY_FIELD_EX32(s->regs, DEVICE_CTRL, I3C_EN) &&
+           !ARRAY_FIELD_EX32(s->regs, DEVICE_CTRL, I3C_RESUME);
+}
+
+static inline uint8_t aspeed_i3c_device_fifo_threshold_from_reg(uint8_t regval)
+{
+    return regval = regval ? (2 << regval) : 1;
+}
+
 static void aspeed_i3c_device_update_irq(AspeedI3CDevice *s)
 {
     bool level = !!(s->regs[R_INTR_SIGNAL_EN] & s->regs[R_INTR_STATUS]);
     qemu_set_irq(s->irq, level);
 }
 
+static void aspeed_i3c_device_end_transfer(AspeedI3CDevice *s, bool is_i2c)
+{
+    if (is_i2c) {
+        legacy_i2c_end_transfer(s->bus);
+    } else {
+        i3c_end_transfer(s->bus);
+    }
+}
+
+static int aspeed_i3c_device_send_start(AspeedI3CDevice *s, uint8_t addr,
+                                        bool is_recv, bool is_i2c)
+{
+    int ret;
+
+    if (is_i2c) {
+        ret = legacy_i2c_start_transfer(s->bus, addr, is_recv);
+    } else {
+        ret = i3c_start_transfer(s->bus, addr, is_recv);
+    }
+    if (ret) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: NACKed on TX with addr 0x%.2x\n",
+                      object_get_canonical_path(OBJECT(s)), addr);
+        ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_ST_STATUS,
+                         ASPEED_I3C_TRANSFER_STATE_HALT);
+        ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_STATUS,
+                         ASPEED_I3C_TRANSFER_STATUS_HALT);
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, TRANSFER_ERR, 1);
+        ARRAY_FIELD_DP32(s->regs, DEVICE_CTRL, I3C_RESUME, 1);
+    }
+
+    return ret;
+}
+
+static int aspeed_i3c_device_send(AspeedI3CDevice *s, const uint8_t *data,
+                                  uint32_t num_to_send, uint32_t *num_sent,
+                                  bool is_i2c)
+{
+    int ret;
+    uint32_t i;
+
+    *num_sent = 0;
+    if (is_i2c) {
+        /* Legacy I2C must be byte-by-byte. */
+        for (i = 0; i < num_to_send; i++) {
+            ret = legacy_i2c_send(s->bus, data[i]);
+            if (ret) {
+                break;
+            }
+            (*num_sent)++;
+        }
+    } else {
+        ret = i3c_send(s->bus, data, num_to_send, num_sent);
+    }
+    if (ret) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: NACKed sending byte 0x%.2x\n",
+                      object_get_canonical_path(OBJECT(s)), data[*num_sent]);
+        ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_ST_STATUS,
+                         ASPEED_I3C_TRANSFER_STATE_HALT);
+        ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_STATUS,
+                         ASPEED_I3C_TRANSFER_STATUS_HALT);
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, TRANSFER_ERR, 1);
+        ARRAY_FIELD_DP32(s->regs, DEVICE_CTRL, I3C_RESUME, 1);
+    }
+
+    trace_aspeed_i3c_device_send(s->id, *num_sent);
+
+    return ret;
+}
+
+static int aspeed_i3c_device_send_byte(AspeedI3CDevice *s, uint8_t byte,
+                                       bool is_i2c)
+{
+    /*
+     * Ignored, the caller will know if we sent 0 or 1 bytes depending on if
+     * we were ACKed/NACKed.
+     */
+    uint32_t num_sent;
+    return aspeed_i3c_device_send(s, &byte, 1, &num_sent, is_i2c);
+}
+
+static int aspeed_i3c_device_recv_data(AspeedI3CDevice *s, bool is_i2c,
+                                       uint8_t *data, uint16_t num_to_read,
+                                       uint32_t *num_read)
+{
+    int ret;
+
+    if (is_i2c) {
+        for (uint16_t i = 0; i < num_to_read; i++) {
+            data[i] = legacy_i2c_recv(s->bus);
+        }
+        /* I2C devices can neither NACK a read, nor end transfers early. */
+        *num_read = num_to_read;
+        trace_aspeed_i3c_device_recv_data(s->id, *num_read);
+        return 0;
+    }
+    /* I3C devices can NACK if the controller sends an unsupported CCC. */
+    ret = i3c_recv(s->bus, data, num_to_read, num_read);
+    if (ret) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: NACKed receiving byte\n",
+                      object_get_canonical_path(OBJECT(s)));
+        ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_ST_STATUS,
+                         ASPEED_I3C_TRANSFER_STATE_HALT);
+        ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_STATUS,
+                         ASPEED_I3C_TRANSFER_STATUS_HALT);
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, TRANSFER_ERR, 1);
+        ARRAY_FIELD_DP32(s->regs, DEVICE_CTRL, I3C_RESUME, 1);
+    }
+
+    trace_aspeed_i3c_device_recv_data(s->id, *num_read);
+
+    return ret;
+}
+
+static inline bool aspeed_i3c_device_target_is_i2c(AspeedI3CDevice *s,
+                                                   uint16_t offset)
+{
+    uint16_t dev_index = R_DEVICE_ADDR_TABLE_LOC1 + offset;
+    return FIELD_EX32(s->regs[dev_index], DEVICE_ADDR_TABLE_LOC1,
+                   LEGACY_I2C_DEVICE);
+}
+
+static uint8_t aspeed_i3c_device_target_addr(AspeedI3CDevice *s,
+                                             uint16_t offset)
+{
+    if (offset > ASPEED_I3C_NR_DEVICES) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Device addr table offset %d out of "
+                      "bounds\n", object_get_canonical_path(OBJECT(s)), offset);
+        /* If we're out of bounds, return an address of 0. */
+        return 0;
+    }
+
+    uint16_t dev_index = R_DEVICE_ADDR_TABLE_LOC1 + offset;
+    /* I2C devices use a static address. */
+    if (aspeed_i3c_device_target_is_i2c(s, offset)) {
+        return FIELD_EX32(s->regs[dev_index], DEVICE_ADDR_TABLE_LOC1,
+                          DEV_STATIC_ADDR);
+    }
+    return FIELD_EX32(s->regs[dev_index], DEVICE_ADDR_TABLE_LOC1,
+                      DEV_DYNAMIC_ADDR);
+}
+
 static uint32_t aspeed_i3c_device_intr_status_r(AspeedI3CDevice *s)
 {
     /* Only return the status whose corresponding EN bits are set. */
@@ -454,6 +625,54 @@ static void aspeed_i3c_device_intr_force_w(AspeedI3CDevice *s, uint32_t val)
     aspeed_i3c_device_update_irq(s);
 }
 
+static uint32_t aspeed_i3c_device_pop_rx(AspeedI3CDevice *s)
+{
+    if (fifo32_is_empty(&s->rx_queue)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Tried to read RX FIFO when empty\n",
+                      object_get_canonical_path(OBJECT(s)));
+        return 0;
+    }
+
+    uint32_t val = fifo32_pop(&s->rx_queue);
+    ARRAY_FIELD_DP32(s->regs, DATA_BUFFER_STATUS_LEVEL, RX_BUF_BLR,
+                     fifo32_num_used(&s->rx_queue));
+
+    /* Threshold is 2^RX_BUF_THLD. */
+    uint8_t threshold = ARRAY_FIELD_EX32(s->regs, DATA_BUFFER_THLD_CTRL,
+                                         RX_BUF_THLD);
+    threshold = aspeed_i3c_device_fifo_threshold_from_reg(threshold);
+    if (fifo32_num_used(&s->rx_queue) < threshold) {
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, RX_THLD, 0);
+        aspeed_i3c_device_update_irq(s);
+    }
+
+    trace_aspeed_i3c_device_pop_rx(s->id, val);
+    return val;
+}
+
+static uint32_t aspeed_i3c_device_resp_queue_port_r(AspeedI3CDevice *s)
+{
+    if (fifo32_is_empty(&s->resp_queue)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Tried to read response FIFO when "
+                      "empty\n", object_get_canonical_path(OBJECT(s)));
+        return 0;
+    }
+
+    uint32_t val = fifo32_pop(&s->resp_queue);
+    ARRAY_FIELD_DP32(s->regs, QUEUE_STATUS_LEVEL, RESP_BUF_BLR,
+                     fifo32_num_used(&s->resp_queue));
+
+    /* Threshold is the register value + 1. */
+    uint8_t threshold = ARRAY_FIELD_EX32(s->regs, QUEUE_THLD_CTRL,
+                                         RESP_BUF_THLD) + 1;
+    if (fifo32_num_used(&s->resp_queue) < threshold) {
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, RESP_RDY, 0);
+        aspeed_i3c_device_update_irq(s);
+    }
+
+    return val;
+}
+
 static uint64_t aspeed_i3c_device_read(void *opaque, hwaddr offset,
                                        unsigned size)
 {
@@ -471,6 +690,12 @@ static uint64_t aspeed_i3c_device_read(void *opaque, hwaddr offset,
     case R_INTR_STATUS:
         value = aspeed_i3c_device_intr_status_r(s);
         break;
+    case R_RX_TX_DATA_PORT:
+        value = aspeed_i3c_device_pop_rx(s);
+        break;
+    case R_RESPONSE_QUEUE_PORT:
+        value = aspeed_i3c_device_resp_queue_port_r(s);
+        break;
     default:
         value = s->regs[addr];
         break;
@@ -481,6 +706,618 @@ static uint64_t aspeed_i3c_device_read(void *opaque, hwaddr offset,
     return value;
 }
 
+static void aspeed_i3c_device_resp_queue_push(AspeedI3CDevice *s,
+                                              uint8_t err, uint8_t tid,
+                                              uint8_t ccc_type,
+                                              uint16_t data_len)
+{
+    uint32_t val = 0;
+    val = FIELD_DP32(val, RESPONSE_QUEUE_PORT, ERR_STATUS, err);
+    val = FIELD_DP32(val, RESPONSE_QUEUE_PORT, TID, tid);
+    val = FIELD_DP32(val, RESPONSE_QUEUE_PORT, CCCT, ccc_type);
+    val = FIELD_DP32(val, RESPONSE_QUEUE_PORT, DL, data_len);
+    if (!fifo32_is_full(&s->resp_queue)) {
+        trace_aspeed_i3c_device_resp_queue_push(s->id, val);
+        fifo32_push(&s->resp_queue, val);
+    }
+
+    ARRAY_FIELD_DP32(s->regs, QUEUE_STATUS_LEVEL, RESP_BUF_BLR,
+                     fifo32_num_used(&s->resp_queue));
+    /* Threshold is the register value + 1. */
+    uint8_t threshold = ARRAY_FIELD_EX32(s->regs, QUEUE_THLD_CTRL,
+                                         RESP_BUF_THLD) + 1;
+    if (fifo32_num_used(&s->resp_queue) >= threshold) {
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, RESP_RDY, 1);
+        aspeed_i3c_device_update_irq(s);
+    }
+}
+
+static void aspeed_i3c_device_push_tx(AspeedI3CDevice *s, uint32_t val)
+{
+    if (fifo32_is_full(&s->tx_queue)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Tried to push to TX FIFO when "
+                      "full\n", object_get_canonical_path(OBJECT(s)));
+        return;
+    }
+
+    trace_aspeed_i3c_device_push_tx(s->id, val);
+    fifo32_push(&s->tx_queue, val);
+    ARRAY_FIELD_DP32(s->regs, DATA_BUFFER_STATUS_LEVEL, TX_BUF_EMPTY_LOC,
+                     fifo32_num_free(&s->tx_queue));
+
+    /* Threshold is 2^TX_BUF_THLD. */
+    uint8_t empty_threshold = ARRAY_FIELD_EX32(s->regs, DATA_BUFFER_THLD_CTRL,
+                                               TX_BUF_THLD);
+    empty_threshold =
+        aspeed_i3c_device_fifo_threshold_from_reg(empty_threshold);
+    if (fifo32_num_free(&s->tx_queue) < empty_threshold) {
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, TX_THLD, 0);
+        aspeed_i3c_device_update_irq(s);
+    }
+}
+
+static uint32_t aspeed_i3c_device_pop_tx(AspeedI3CDevice *s)
+{
+    if (fifo32_is_empty(&s->tx_queue)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Tried to pop from TX FIFO when "
+                      "empty\n", object_get_canonical_path(OBJECT(s)));
+        return 0;
+    }
+
+    uint32_t val = fifo32_pop(&s->tx_queue);
+    trace_aspeed_i3c_device_pop_tx(s->id, val);
+    ARRAY_FIELD_DP32(s->regs, DATA_BUFFER_STATUS_LEVEL, TX_BUF_EMPTY_LOC,
+                     fifo32_num_free(&s->tx_queue));
+
+    /* Threshold is 2^TX_BUF_THLD. */
+    uint8_t empty_threshold = ARRAY_FIELD_EX32(s->regs, DATA_BUFFER_THLD_CTRL,
+                                               TX_BUF_THLD);
+    empty_threshold =
+        aspeed_i3c_device_fifo_threshold_from_reg(empty_threshold);
+    if (fifo32_num_free(&s->tx_queue) >= empty_threshold) {
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, TX_THLD, 1);
+        aspeed_i3c_device_update_irq(s);
+    }
+    return val;
+}
+
+static void aspeed_i3c_device_push_rx(AspeedI3CDevice *s, uint32_t val)
+{
+    if (fifo32_is_full(&s->rx_queue)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Tried to push to RX FIFO when "
+                      "full\n", object_get_canonical_path(OBJECT(s)));
+        return;
+    }
+    trace_aspeed_i3c_device_push_rx(s->id, val);
+    fifo32_push(&s->rx_queue, val);
+
+    ARRAY_FIELD_DP32(s->regs, DATA_BUFFER_STATUS_LEVEL, RX_BUF_BLR,
+                     fifo32_num_used(&s->rx_queue));
+    /* Threshold is 2^RX_BUF_THLD. */
+    uint8_t threshold = ARRAY_FIELD_EX32(s->regs, DATA_BUFFER_THLD_CTRL,
+                                         RX_BUF_THLD);
+    threshold = aspeed_i3c_device_fifo_threshold_from_reg(threshold);
+    if (fifo32_num_used(&s->rx_queue) >= threshold) {
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, RX_THLD, 1);
+        aspeed_i3c_device_update_irq(s);
+    }
+}
+
+static void aspeed_i3c_device_short_transfer(AspeedI3CDevice *s,
+                                             AspeedI3CTransferCmd cmd,
+                                             AspeedI3CShortArg arg)
+{
+    uint8_t err = ASPEED_I3C_RESP_QUEUE_ERR_NONE;
+    uint8_t addr = aspeed_i3c_device_target_addr(s, cmd.dev_index);
+    bool is_i2c = aspeed_i3c_device_target_is_i2c(s, cmd.dev_index);
+    uint8_t data[4]; /* Max we can send on a short transfer is 4 bytes. */
+    uint8_t len = 0;
+    uint32_t bytes_sent; /* Ignored on short transfers. */
+
+    /* Can't do reads on a short transfer. */
+    if (cmd.rnw) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Cannot do a read on a short "
+                      "transfer\n", object_get_canonical_path(OBJECT(s)));
+        return;
+    }
+
+    if (aspeed_i3c_device_send_start(s, addr, /*is_recv=*/false, is_i2c)) {
+        err = ASPEED_I3C_RESP_QUEUE_ERR_I2C_NACK;
+        goto transfer_done;
+    }
+
+    /* Are we sending a command? */
+    if (cmd.cp) {
+        data[len] = cmd.cmd;
+        len++;
+        /*
+         * byte0 is the defining byte for a command, and is only sent if a
+         * command is present and if the command has a defining byte present.
+         * (byte_strb & 0x01) is always treated as set by the controller, and is
+         * ignored.
+         */
+        if (cmd.dbp) {
+            data[len] += arg.byte0;
+            len++;
+        }
+    }
+
+    /* Send the bytes passed in the argument. */
+    if (arg.byte_strb & 0x02) {
+        data[len] = arg.byte1;
+        len++;
+    }
+    if (arg.byte_strb & 0x04) {
+        data[len] = arg.byte2;
+        len++;
+    }
+
+    if (aspeed_i3c_device_send(s, data, len, &bytes_sent, is_i2c)) {
+        err = ASPEED_I3C_RESP_QUEUE_ERR_I2C_NACK;
+    } else {
+        /* Only go to an idle state on a successful transfer. */
+        ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_ST_STATUS,
+                         ASPEED_I3C_TRANSFER_STATE_IDLE);
+    }
+
+transfer_done:
+    if (cmd.toc) {
+        aspeed_i3c_device_end_transfer(s, is_i2c);
+    }
+    if (cmd.roc) {
+        /*
+         * ccc_type is always 0 in controller mode, data_len is 0 in short
+         * transfers.
+         */
+        aspeed_i3c_device_resp_queue_push(s, err, cmd.tid, /*ccc_type=*/0,
+                                          /*data_len=*/0);
+    }
+}
+
+/* Returns number of bytes transmitted. */
+static uint16_t aspeed_i3c_device_tx(AspeedI3CDevice *s, uint16_t num,
+                                     bool is_i2c)
+{
+    uint16_t bytes_sent = 0;
+    union {
+        uint8_t b[sizeof(uint32_t)];
+        uint32_t val;
+    } val32;
+
+    while (bytes_sent < num) {
+        val32.val = aspeed_i3c_device_pop_tx(s);
+        for (uint8_t i = 0; i < sizeof(val32.val); i++) {
+            if (aspeed_i3c_device_send_byte(s, val32.b[i], is_i2c)) {
+                return bytes_sent;
+            }
+            bytes_sent++;
+
+            /* We're not sending the full 32-bits, break early. */
+            if (bytes_sent >= num) {
+                break;
+            }
+        }
+    }
+
+    return bytes_sent;
+}
+
+/* Returns number of bytes received. */
+static uint16_t aspeed_i3c_device_rx(AspeedI3CDevice *s, uint16_t num,
+                                     bool is_i2c)
+{
+    /*
+     * Allocate a temporary buffer to read data from the target.
+     * Zero it and word-align it as well in case we're reading unaligned data.
+     */
+    g_autofree uint8_t *data = g_new0(uint8_t, num + (num & 0x03));
+    uint32_t *data32 = (uint32_t *)data;
+    /*
+     * 32-bits since the I3C API wants a 32-bit number, even though the
+     * controller can only do 16-bit transfers.
+     */
+    uint32_t num_read = 0;
+
+    /* Can NACK if the target receives an unsupported CCC. */
+    if (aspeed_i3c_device_recv_data(s, is_i2c, data, num, &num_read)) {
+        return 0;
+    }
+
+    for (uint16_t i = 0; i < num_read / 4; i++) {
+        aspeed_i3c_device_push_rx(s, *data32);
+        data32++;
+    }
+    /*
+     * If we're pushing data that isn't 32-bit aligned, push what's left.
+     * It's software's responsibility to know what bits are valid in the partial
+     * data.
+     */
+    if (num_read & 0x03) {
+        aspeed_i3c_device_push_rx(s, *data32);
+    }
+
+    return num_read;
+}
+
+static int aspeed_i3c_device_transfer_ccc(AspeedI3CDevice *s,
+                                           AspeedI3CTransferCmd cmd,
+                                           AspeedI3CTransferArg arg)
+{
+    /* CCC start is always a write. CCCs cannot be done on I2C devices. */
+    if (aspeed_i3c_device_send_start(s, I3C_BROADCAST, /*is_recv=*/false,
+                                     /*is_i2c=*/false)) {
+        return ASPEED_I3C_RESP_QUEUE_ERR_BROADCAST_NACK;
+    }
+    trace_aspeed_i3c_device_transfer_ccc(s->id, cmd.cmd);
+    if (aspeed_i3c_device_send_byte(s, cmd.cmd, /*is_i2c=*/false)) {
+        return ASPEED_I3C_RESP_QUEUE_ERR_I2C_NACK;
+    }
+
+    /* On a direct CCC, we do a restart and then send the target's address. */
+    if (CCC_IS_DIRECT(cmd.cmd)) {
+        bool is_recv = cmd.rnw;
+        uint8_t addr = aspeed_i3c_device_target_addr(s, cmd.dev_index);
+        if (aspeed_i3c_device_send_start(s, addr, is_recv, /*is_i2c=*/false)) {
+            return ASPEED_I3C_RESP_QUEUE_ERR_BROADCAST_NACK;
+        }
+    }
+
+    return ASPEED_I3C_RESP_QUEUE_ERR_NONE;
+}
+
+static void aspeed_i3c_device_transfer(AspeedI3CDevice *s,
+                                       AspeedI3CTransferCmd cmd,
+                                       AspeedI3CTransferArg arg)
+{
+    bool is_recv = cmd.rnw;
+    uint8_t err = ASPEED_I3C_RESP_QUEUE_ERR_NONE;
+    uint8_t addr = aspeed_i3c_device_target_addr(s, cmd.dev_index);
+    bool is_i2c = aspeed_i3c_device_target_is_i2c(s, cmd.dev_index);
+    uint16_t bytes_transferred = 0;
+
+    if (cmd.cp) {
+        /* We're sending a CCC. */
+        err = aspeed_i3c_device_transfer_ccc(s, cmd, arg);
+        if (err != ASPEED_I3C_RESP_QUEUE_ERR_NONE) {
+            goto transfer_done;
+        }
+    } else {
+        if (ARRAY_FIELD_EX32(s->regs, DEVICE_CTRL, I3C_BROADCAST_ADDR_INC) &&
+            is_i2c == false) {
+            if (aspeed_i3c_device_send_start(s, I3C_BROADCAST,
+                                             /*is_recv=*/false, is_i2c)) {
+                err = ASPEED_I3C_RESP_QUEUE_ERR_I2C_NACK;
+                goto transfer_done;
+            }
+        }
+        /* Otherwise we're doing a private transfer. */
+        if (aspeed_i3c_device_send_start(s, addr, is_recv, is_i2c)) {
+            err = ASPEED_I3C_RESP_QUEUE_ERR_I2C_NACK;
+            goto transfer_done;
+        }
+    }
+
+    if (is_recv) {
+        bytes_transferred = aspeed_i3c_device_rx(s, arg.data_len, is_i2c);
+    } else {
+        bytes_transferred = aspeed_i3c_device_tx(s, arg.data_len, is_i2c);
+    }
+
+    ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_ST_STATUS,
+                     ASPEED_I3C_TRANSFER_STATE_IDLE);
+
+transfer_done:
+    if (cmd.toc) {
+        aspeed_i3c_device_end_transfer(s, is_i2c);
+    }
+    if (cmd.roc) {
+        /*
+         * data_len is the number of bytes that still need to be TX'd, or the
+         * number of bytes RX'd.
+         */
+        uint16_t data_len = is_recv ? bytes_transferred : arg.data_len -
+                                                          bytes_transferred;
+        /* CCCT is always 0 in controller mode. */
+        aspeed_i3c_device_resp_queue_push(s, err, cmd.tid, /*ccc_type=*/0,
+                                          data_len);
+    }
+
+    aspeed_i3c_device_update_irq(s);
+}
+
+static void aspeed_i3c_device_transfer_cmd(AspeedI3CDevice *s,
+                                           AspeedI3CTransferCmd cmd,
+                                           AspeedI3CCmdQueueData arg)
+{
+    uint8_t arg_attr = FIELD_EX32(arg.word, COMMAND_QUEUE_PORT, CMD_ATTR);
+
+    ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CMD_TID, cmd.tid);
+
+    /* User is trying to do HDR transfers, see if we can do them. */
+    if (cmd.speed == 0x06 && !aspeed_i3c_device_has_hdr_ddr(s)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: HDR DDR is not supported\n",
+                      object_get_canonical_path(OBJECT(s)));
+        ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_ST_STATUS,
+                         ASPEED_I3C_TRANSFER_STATE_HALT);
+        return;
+    }
+    if (cmd.speed == 0x05 && !aspeed_i3c_device_has_hdr_ts(s)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: HDR TS is not supported\n",
+                      object_get_canonical_path(OBJECT(s)));
+        ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_ST_STATUS,
+                         ASPEED_I3C_TRANSFER_STATE_HALT);
+        return;
+    }
+
+    if (arg_attr == ASPEED_I3C_CMD_ATTR_TRANSFER_ARG) {
+        aspeed_i3c_device_transfer(s, cmd, arg.transfer_arg);
+    } else if (arg_attr == ASPEED_I3C_CMD_ATTR_SHORT_DATA_ARG) {
+        aspeed_i3c_device_short_transfer(s, cmd, arg.short_arg);
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Unknown command queue cmd_attr 0x%x"
+                      "\n", object_get_canonical_path(OBJECT(s)), arg_attr);
+        ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_ST_STATUS,
+                         ASPEED_I3C_TRANSFER_STATE_HALT);
+    }
+}
+
+static void aspeed_i3c_device_update_char_table(AspeedI3CDevice *s,
+                                                uint8_t offset, uint64_t pid,
+                                                uint8_t bcr, uint8_t dcr,
+                                                uint8_t addr)
+{
+    if (offset > ASPEED_I3C_NR_DEVICES) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Device char table offset %d out of "
+                      "bounds\n", object_get_canonical_path(OBJECT(s)), offset);
+        /* If we're out of bounds, do nothing. */
+        return;
+    }
+
+    /* Each char table index is 128 bits apart. */
+    uint16_t dev_index = R_DEVICE_CHARACTERISTIC_TABLE_LOC1 + offset *
+                                                            sizeof(uint32_t);
+    s->regs[dev_index] = pid & 0xffffffff;
+    pid >>= 32;
+    s->regs[dev_index + 1] = FIELD_DP32(s->regs[dev_index + 1],
+                                        DEVICE_CHARACTERISTIC_TABLE_LOC2,
+                                        MSB_PID, pid);
+    s->regs[dev_index + 2] = FIELD_DP32(s->regs[dev_index + 2],
+                                        DEVICE_CHARACTERISTIC_TABLE_LOC3, DCR,
+                                        dcr);
+    s->regs[dev_index + 2] = FIELD_DP32(s->regs[dev_index + 2],
+                                        DEVICE_CHARACTERISTIC_TABLE_LOC3, BCR,
+                                        bcr);
+    s->regs[dev_index + 3] = FIELD_DP32(s->regs[dev_index + 3],
+                                        DEVICE_CHARACTERISTIC_TABLE_LOC4,
+                                        DEV_DYNAMIC_ADDR, addr);
+
+    /* Increment PRESENT_DEV_CHAR_TABLE_INDEX. */
+    uint8_t idx = ARRAY_FIELD_EX32(s->regs, DEV_CHAR_TABLE_POINTER,
+                     PRESENT_DEV_CHAR_TABLE_INDEX);
+    /* Increment and rollover. */
+    idx++;
+    if (idx >= ARRAY_FIELD_EX32(s->regs, DEV_CHAR_TABLE_POINTER,
+                               DEV_CHAR_TABLE_DEPTH) / 4) {
+        idx = 0;
+    }
+    ARRAY_FIELD_DP32(s->regs, DEV_CHAR_TABLE_POINTER,
+                     PRESENT_DEV_CHAR_TABLE_INDEX, idx);
+}
+
+static void aspeed_i3c_device_addr_assign_cmd(AspeedI3CDevice *s,
+                                              AspeedI3CAddrAssignCmd cmd)
+{
+    uint8_t i = 0;
+    uint8_t err = ASPEED_I3C_RESP_QUEUE_ERR_NONE;
+
+    if (!aspeed_i3c_device_has_entdaa(s)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: ENTDAA is not supported\n",
+                      object_get_canonical_path(OBJECT(s)));
+        return;
+    }
+
+    /* Tell everyone to ENTDAA. If these error, no one is on the bus. */
+    if (aspeed_i3c_device_send_start(s, I3C_BROADCAST, /*is_recv=*/false,
+                                     /*is_i2c=*/false)) {
+        err = ASPEED_I3C_RESP_QUEUE_ERR_BROADCAST_NACK;
+        goto transfer_done;
+    }
+    if (aspeed_i3c_device_send_byte(s, cmd.cmd, /*is_i2c=*/false)) {
+        err = ASPEED_I3C_RESP_QUEUE_ERR_BROADCAST_NACK;
+        goto transfer_done;
+    }
+
+    /* Go through each device in the table and assign it an address. */
+    for (i = 0; i < cmd.dev_count; i++) {
+        uint8_t addr = aspeed_i3c_device_target_addr(s, cmd.dev_index + i);
+        union {
+            uint64_t pid:48;
+            uint8_t bcr;
+            uint8_t dcr;
+            uint32_t w[2];
+            uint8_t b[8];
+        } target_info;
+
+        /* If this fails, there was no one left to ENTDAA. */
+        if (aspeed_i3c_device_send_start(s, I3C_BROADCAST, /*is_recv=*/false,
+                                         /*is_i2c=*/false)) {
+            err = ASPEED_I3C_RESP_QUEUE_ERR_BROADCAST_NACK;
+            break;
+        }
+
+        /*
+         * In ENTDAA, we read 8 bytes from the target, which will be the
+         * target's PID, BCR, and DCR. After that, we send it the dynamic
+         * address.
+         * Don't bother checking the number of bytes received, it must send 8
+         * bytes during ENTDAA.
+         */
+        uint32_t num_read;
+        if (aspeed_i3c_device_recv_data(s, /*is_i2c=*/false, target_info.b,
+                                        I3C_ENTDAA_SIZE, &num_read)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Target NACKed ENTDAA CCC\n",
+                          object_get_canonical_path(OBJECT(s)));
+            err = ASPEED_I3C_RESP_QUEUE_ERR_DAA_NACK;
+            goto transfer_done;
+        }
+        if (aspeed_i3c_device_send_byte(s, addr, /*is_i2c=*/false)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Target NACKed addr 0x%.2x "
+                          "during ENTDAA\n",
+                          object_get_canonical_path(OBJECT(s)), addr);
+            err = ASPEED_I3C_RESP_QUEUE_ERR_DAA_NACK;
+            break;
+        }
+        aspeed_i3c_device_update_char_table(s, cmd.dev_index + i,
+                                            target_info.pid, target_info.bcr,
+                                            target_info.dcr, addr);
+
+        /* Push the PID, BCR, and DCR to the RX queue. */
+        aspeed_i3c_device_push_rx(s, target_info.w[0]);
+        aspeed_i3c_device_push_rx(s, target_info.w[1]);
+    }
+
+transfer_done:
+    /* Do we send a STOP? */
+    if (cmd.toc) {
+        aspeed_i3c_device_end_transfer(s, /*is_i2c=*/false);
+    }
+    /*
+     * For addr assign commands, the length field is the number of devices
+     * left to assign. CCCT is always 0 in controller mode.
+     */
+    if (cmd.roc) {
+        aspeed_i3c_device_resp_queue_push(s, err, cmd.tid, /*ccc_type=*/0,
+                                         cmd.dev_count - i);
+    }
+}
+
+static uint32_t aspeed_i3c_device_cmd_queue_pop(AspeedI3CDevice *s)
+{
+    if (fifo32_is_empty(&s->cmd_queue)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Tried to dequeue command queue "
+                      "when it was empty\n",
+                      object_get_canonical_path(OBJECT(s)));
+        return 0;
+    }
+    uint32_t val = fifo32_pop(&s->cmd_queue);
+
+    uint8_t empty_threshold = ARRAY_FIELD_EX32(s->regs, QUEUE_THLD_CTRL,
+                                               CMD_BUF_EMPTY_THLD);
+    uint8_t cmd_queue_empty_loc = ARRAY_FIELD_EX32(s->regs,
+                                                   QUEUE_STATUS_LEVEL,
+                                                   CMD_QUEUE_EMPTY_LOC);
+    cmd_queue_empty_loc++;
+    ARRAY_FIELD_DP32(s->regs, QUEUE_STATUS_LEVEL, CMD_QUEUE_EMPTY_LOC,
+                     cmd_queue_empty_loc);
+    if (cmd_queue_empty_loc >= empty_threshold) {
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, CMD_QUEUE_RDY, 1);
+        aspeed_i3c_device_update_irq(s);
+    }
+
+    return val;
+}
+
+static void aspeed_i3c_device_cmd_queue_execute(AspeedI3CDevice *s)
+{
+    ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_ST_STATUS,
+                     ASPEED_I3C_TRANSFER_STATE_IDLE);
+    if (!aspeed_i3c_device_can_transmit(s)) {
+        return;
+    }
+
+    /*
+     * We only start executing when a command is passed into the FIFO.
+     * We expect there to be a multiple of 2 items in the queue. The first item
+     * should be an argument to a command, and the command should be the second
+     * item.
+     */
+    if (fifo32_num_used(&s->cmd_queue) & 1) {
+        return;
+    }
+
+    while (!fifo32_is_empty(&s->cmd_queue)) {
+        AspeedI3CCmdQueueData arg;
+        arg.word = aspeed_i3c_device_cmd_queue_pop(s);
+        AspeedI3CCmdQueueData cmd;
+        cmd.word = aspeed_i3c_device_cmd_queue_pop(s);
+        trace_aspeed_i3c_device_cmd_queue_execute(s->id, cmd.word, arg.word);
+
+        uint8_t cmd_attr = FIELD_EX32(cmd.word, COMMAND_QUEUE_PORT, CMD_ATTR);
+        switch (cmd_attr) {
+        case ASPEED_I3C_CMD_ATTR_TRANSFER_CMD:
+            aspeed_i3c_device_transfer_cmd(s, cmd.transfer_cmd, arg);
+            break;
+        case ASPEED_I3C_CMD_ATTR_ADDR_ASSIGN_CMD:
+            /* Arg is discarded for addr assign commands. */
+            aspeed_i3c_device_addr_assign_cmd(s, cmd.addr_assign_cmd);
+            break;
+        case ASPEED_I3C_CMD_ATTR_TRANSFER_ARG:
+        case ASPEED_I3C_CMD_ATTR_SHORT_DATA_ARG:
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Command queue received argument"
+                          " packet when it expected a command packet\n",
+                          object_get_canonical_path(OBJECT(s)));
+            break;
+        default:
+            /*
+             * The caller's check before queueing an item should prevent this
+             * from happening.
+             */
+            g_assert_not_reached();
+            break;
+        }
+    }
+}
+
+static void aspeed_i3c_device_cmd_queue_push(AspeedI3CDevice *s, uint32_t val)
+{
+    if (fifo32_is_full(&s->cmd_queue)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Command queue received packet when "
+                      "already full\n", object_get_canonical_path(OBJECT(s)));
+        return;
+    }
+    trace_aspeed_i3c_device_cmd_queue_push(s->id, val);
+    fifo32_push(&s->cmd_queue, val);
+
+    uint8_t empty_threshold = ARRAY_FIELD_EX32(s->regs, QUEUE_THLD_CTRL,
+                                               CMD_BUF_EMPTY_THLD);
+    uint8_t cmd_queue_empty_loc = ARRAY_FIELD_EX32(s->regs,
+                                                   QUEUE_STATUS_LEVEL,
+                                                   CMD_QUEUE_EMPTY_LOC);
+    if (cmd_queue_empty_loc) {
+        cmd_queue_empty_loc--;
+        ARRAY_FIELD_DP32(s->regs, QUEUE_STATUS_LEVEL, CMD_QUEUE_EMPTY_LOC,
+                         cmd_queue_empty_loc);
+    }
+    if (cmd_queue_empty_loc < empty_threshold) {
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, CMD_QUEUE_RDY, 0);
+        aspeed_i3c_device_update_irq(s);
+    }
+}
+
+static void aspeed_i3c_device_cmd_queue_port_w(AspeedI3CDevice *s, uint32_t val)
+{
+    uint8_t cmd_attr = FIELD_EX32(val, COMMAND_QUEUE_PORT, CMD_ATTR);
+
+    switch (cmd_attr) {
+    /* If a command is received we can start executing it. */
+    case ASPEED_I3C_CMD_ATTR_TRANSFER_CMD:
+    case ASPEED_I3C_CMD_ATTR_ADDR_ASSIGN_CMD:
+        aspeed_i3c_device_cmd_queue_push(s, val);
+        aspeed_i3c_device_cmd_queue_execute(s);
+        break;
+    /* If we get an argument just push it. */
+    case ASPEED_I3C_CMD_ATTR_TRANSFER_ARG:
+    case ASPEED_I3C_CMD_ATTR_SHORT_DATA_ARG:
+        aspeed_i3c_device_cmd_queue_push(s, val);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Command queue received packet with "
+                      "unknown cmd attr 0x%x\n",
+                      object_get_canonical_path(OBJECT(s)), cmd_attr);
+        break;
+    }
+}
+
 static void aspeed_i3c_device_write(void *opaque, hwaddr offset,
                                     uint64_t value, unsigned size)
 {
@@ -512,6 +1349,10 @@ static void aspeed_i3c_device_write(void *opaque, hwaddr offset,
                       __func__, offset, value);
         break;
     case R_RX_TX_DATA_PORT:
+        aspeed_i3c_device_push_tx(s, val32);
+        break;
+    case R_COMMAND_QUEUE_PORT:
+        aspeed_i3c_device_cmd_queue_port_w(s, val32);
         break;
     case R_RESET_CTRL:
         break;
@@ -566,6 +1407,13 @@ static void aspeed_i3c_device_realize(DeviceState *dev, Error **errp)
 
     memory_region_init_io(&s->mr, OBJECT(s), &aspeed_i3c_device_ops,
                           s, name, ASPEED_I3C_DEVICE_NR_REGS << 2);
+
+    fifo32_create(&s->cmd_queue, ASPEED_I3C_CMD_QUEUE_CAPACITY);
+    fifo32_create(&s->resp_queue, ASPEED_I3C_RESP_QUEUE_CAPACITY);
+    fifo32_create(&s->tx_queue, ASPEED_I3C_TX_QUEUE_CAPACITY);
+    fifo32_create(&s->rx_queue, ASPEED_I3C_RX_QUEUE_CAPACITY);
+
+    s->bus = i3c_init_bus(DEVICE(s), name);
 }
 
 static uint64_t aspeed_i3c_read(void *opaque, hwaddr addr, unsigned int size)
diff --git a/hw/i3c/trace-events b/hw/i3c/trace-events
index cdf7cb07f6..370c08ea45 100644
--- a/hw/i3c/trace-events
+++ b/hw/i3c/trace-events
@@ -5,6 +5,16 @@ aspeed_i3c_read(uint64_t offset, uint64_t data) "I3C read: offset 0x%" PRIx64 "
 aspeed_i3c_write(uint64_t offset, uint64_t data) "I3C write: offset 0x%" PRIx64 " data 0x%" PRIx64
 aspeed_i3c_device_read(uint32_t deviceid, uint64_t offset, uint64_t data) "I3C Dev[%u] read: offset 0x%" PRIx64 " data 0x%" PRIx64
 aspeed_i3c_device_write(uint32_t deviceid, uint64_t offset, uint64_t data) "I3C Dev[%u] write: offset 0x%" PRIx64 " data 0x%" PRIx64
+aspeed_i3c_device_send(uint32_t deviceid, uint32_t num_bytes) "I3C Dev[%u] send %" PRId32 " bytes to bus"
+aspeed_i3c_device_recv_data(uint32_t deviceid, uint32_t num_bytes) "I3C Dev[%u] recv %" PRId32 " bytes from bus"
+aspeed_i3c_device_pop_rx(uint32_t deviceid, uint32_t data) "I3C Dev[%u] pop 0x%" PRIx32 " from RX FIFO"
+aspeed_i3c_device_resp_queue_push(uint32_t deviceid, uint32_t data) "I3C Dev[%u] push 0x%" PRIx32 " to response queue"
+aspeed_i3c_device_push_tx(uint32_t deviceid, uint32_t data) "I3C Dev[%u] push 0x%" PRIx32 " to TX FIFO"
+aspeed_i3c_device_pop_tx(uint32_t deviceid, uint32_t data) "I3C Dev[%u] pop 0x%" PRIx32 " from TX FIFO"
+aspeed_i3c_device_push_rx(uint32_t deviceid, uint32_t data) "I3C Dev[%u] push 0x%" PRIx32 " to RX FIFO"
+aspeed_i3c_device_transfer_ccc(uint32_t deviceid, uint8_t ccc) "I3C Dev[%u] transfer CCC 0x%" PRIx8
+aspeed_i3c_device_cmd_queue_execute(uint32_t deviceid, uint32_t cmd, uint32_t arg) "I3C Dev[%u] execute command 0x%" PRIx32 " arg 0x%" PRIx32
+aspeed_i3c_device_cmd_queue_push(uint32_t deviceid, uint32_t data) "I3C Dev[%u] push 0x%" PRIx32 " to cmd queue"
 
 # core.c
 i3c_target_event(uint8_t address, uint8_t event) "I3C target 0x%" PRIx8 " event 0x%" PRIx8
diff --git a/include/hw/i3c/aspeed_i3c.h b/include/hw/i3c/aspeed_i3c.h
index 39679dfa1a..55f2f45915 100644
--- a/include/hw/i3c/aspeed_i3c.h
+++ b/include/hw/i3c/aspeed_i3c.h
@@ -2,6 +2,7 @@
  * ASPEED I3C Controller
  *
  * Copyright (C) 2021 ASPEED Technology Inc.
+ * Copyright (C) 2023 Google, LLC
  *
  * This code is licensed under the GPL version 2 or later.  See
  * the COPYING file in the top-level directory.
@@ -10,6 +11,8 @@
 #ifndef ASPEED_I3C_H
 #define ASPEED_I3C_H
 
+#include "qemu/fifo32.h"
+#include "hw/i3c/i3c.h"
 #include "hw/sysbus.h"
 
 #define TYPE_ASPEED_I3C "aspeed.i3c"
@@ -20,6 +23,129 @@ OBJECT_DECLARE_TYPE(AspeedI3CState, AspeedI3CClass, ASPEED_I3C)
 #define ASPEED_I3C_DEVICE_NR_REGS (0x300 >> 2)
 #define ASPEED_I3C_NR_DEVICES 6
 
+#define ASPEED_I3C_CMD_QUEUE_CAPACITY  0x10
+#define ASPEED_I3C_RESP_QUEUE_CAPACITY 0x10
+#define ASPEED_I3C_TX_QUEUE_CAPACITY   0x40
+#define ASPEED_I3C_RX_QUEUE_CAPACITY   0x40
+
+/* From datasheet. */
+#define ASPEED_I3C_CMD_ATTR_TRANSFER_CMD 0
+#define ASPEED_I3C_CMD_ATTR_TRANSFER_ARG 1
+#define ASPEED_I3C_CMD_ATTR_SHORT_DATA_ARG 2
+#define ASPEED_I3C_CMD_ATTR_ADDR_ASSIGN_CMD 3
+
+/* Enum values from datasheet. */
+typedef enum AspeedI3CRespQueueErr {
+    ASPEED_I3C_RESP_QUEUE_ERR_NONE = 0,
+    ASPEED_I3C_RESP_QUEUE_ERR_CRC = 1,
+    ASPEED_I3C_RESP_QUEUE_ERR_PARITY = 2,
+    ASPEED_I3C_RESP_QUEUE_ERR_FRAME = 3,
+    ASPEED_I3C_RESP_QUEUE_ERR_BROADCAST_NACK = 4,
+    ASPEED_I3C_RESP_QUEUE_ERR_DAA_NACK = 5,
+    ASPEED_I3C_RESP_QUEUE_ERR_OVERFLOW = 6,
+    ASPEED_I3C_RESP_QUEUE_ERR_ABORTED = 8,
+    ASPEED_I3C_RESP_QUEUE_ERR_I2C_NACK = 9,
+} AspeedI3CRespQueueErr;
+
+typedef enum AspeedI3CTransferState {
+    ASPEED_I3C_TRANSFER_STATE_IDLE = 0x00,
+    ASPEED_I3C_TRANSFER_STATE_START = 0x01,
+    ASPEED_I3C_TRANSFER_STATE_RESTART = 0x02,
+    ASPEED_I3C_TRANSFER_STATE_STOP = 0x03,
+    ASPEED_I3C_TRANSFER_STATE_START_HOLD = 0x04,
+    ASPEED_I3C_TRANSFER_STATE_BROADCAST_W = 0x05,
+    ASPEED_I3C_TRANSFER_STATE_BROADCAST_R = 0x06,
+    ASPEED_I3C_TRANSFER_STATE_DAA = 0x07,
+    ASPEED_I3C_TRANSFER_STATE_DAA_GEN = 0x08,
+    ASPEED_I3C_TRANSFER_STATE_CCC_BYTE = 0x0b,
+    ASPEED_I3C_TRANSFER_STATE_HDR_CMD = 0x0c,
+    ASPEED_I3C_TRANSFER_STATE_WRITE = 0x0d,
+    ASPEED_I3C_TRANSFER_STATE_READ = 0x0e,
+    ASPEED_I3C_TRANSFER_STATE_IBI_READ = 0x0f,
+    ASPEED_I3C_TRANSFER_STATE_IBI_DIS = 0x10,
+    ASPEED_I3C_TRANSFER_STATE_HDR_DDR_CRC = 0x11,
+    ASPEED_I3C_TRANSFER_STATE_CLK_STRETCH = 0x12,
+    ASPEED_I3C_TRANSFER_STATE_HALT = 0x13,
+} AspeedI3CTransferState;
+
+typedef enum AspeedI3CTransferStatus {
+    ASPEED_I3C_TRANSFER_STATUS_IDLE = 0x00,
+    ASPEED_I3C_TRANSFER_STATUS_BROACAST_CCC = 0x01,
+    ASPEED_I3C_TRANSFER_STATUS_DIRECT_CCC_W = 0x02,
+    ASPEED_I3C_TRANSFER_STATUS_DIRECT_CCC_R = 0x03,
+    ASPEED_I3C_TRANSFER_STATUS_ENTDAA = 0x04,
+    ASPEED_I3C_TRANSFER_STATUS_SETDASA = 0x05,
+    ASPEED_I3C_TRANSFER_STATUS_I3C_SDR_W = 0x06,
+    ASPEED_I3C_TRANSFER_STATUS_I3C_SDR_R = 0x07,
+    ASPEED_I3C_TRANSFER_STATUS_I2C_SDR_W = 0x08,
+    ASPEED_I3C_TRANSFER_STATUS_I2C_SDR_R = 0x09,
+    ASPEED_I3C_TRANSFER_STATUS_HDR_TS_W = 0x0a,
+    ASPEED_I3C_TRANSFER_STATUS_HDR_TS_R = 0x0b,
+    ASPEED_I3C_TRANSFER_STATUS_HDR_DDR_W = 0x0c,
+    ASPEED_I3C_TRANSFER_STATUS_HDR_DDR_R = 0x0d,
+    ASPEED_I3C_TRANSFER_STATUS_IBI = 0x0e,
+    ASPEED_I3C_TRANSFER_STATUS_HALT = 0x0f,
+} AspeedI3CTransferStatus;
+
+/*
+ * Transfer commands and arguments are 32-bit wide values that the user passes
+ * into the command queue. We interpret each 32-bit word based on the cmd_attr
+ * field.
+ */
+typedef struct AspeedI3CTransferCmd {
+    uint8_t cmd_attr:3;
+    uint8_t tid:4; /* Transaction ID */
+    uint16_t cmd:8;
+    uint8_t cp:1; /* Command present */
+    uint8_t dev_index:5;
+    uint8_t speed:3;
+    uint8_t resv0:1;
+    uint8_t dbp:1; /* Defining byte present */
+    uint8_t roc:1; /* Response on completion */
+    uint8_t sdap:1; /* Short data argument present */
+    uint8_t rnw:1; /* Read not write */
+    uint8_t resv1:1;
+    uint8_t toc:1; /* Termination (I3C STOP) on completion */
+    uint8_t pec:1; /* Parity error check enabled */
+} AspeedI3CTransferCmd;
+
+typedef struct AspeedI3CTransferArg {
+    uint8_t cmd_attr:3;
+    uint8_t resv:5;
+    uint8_t db; /* Defining byte */
+    uint16_t data_len;
+} AspeedI3CTransferArg;
+
+typedef struct AspeedI3CShortArg {
+    uint8_t cmd_attr:3;
+    uint8_t byte_strb:3;
+    uint8_t resv:2;
+    uint8_t byte0;
+    uint8_t byte1;
+    uint8_t byte2;
+} AspeedI3CShortArg;
+
+typedef struct AspeedI3CAddrAssignCmd {
+    uint8_t cmd_attr:3;
+    uint8_t tid:4; /* Transaction ID */
+    uint16_t cmd:8;
+    uint8_t resv0:1;
+    uint8_t dev_index:5;
+    uint16_t dev_count:5;
+    uint8_t roc:1; /* Response on completion */
+    uint8_t resv1:3;
+    uint8_t toc:1; /* Termination (I3C STOP) on completion */
+    uint8_t resv2:1;
+} AspeedI3CAddrAssignCmd;
+
+typedef union AspeedI3CCmdQueueData {
+    uint32_t word;
+    AspeedI3CTransferCmd transfer_cmd;
+    AspeedI3CTransferArg transfer_arg;
+    AspeedI3CShortArg short_arg;
+    AspeedI3CAddrAssignCmd addr_assign_cmd;
+} AspeedI3CCmdQueueData;
+
 OBJECT_DECLARE_SIMPLE_TYPE(AspeedI3CDevice, ASPEED_I3C_DEVICE)
 typedef struct AspeedI3CDevice {
     /* <private> */
@@ -28,6 +154,12 @@ typedef struct AspeedI3CDevice {
     /* <public> */
     MemoryRegion mr;
     qemu_irq irq;
+    I3CBus *bus;
+
+    Fifo32 cmd_queue;
+    Fifo32 resp_queue;
+    Fifo32 tx_queue;
+    Fifo32 rx_queue;
 
     uint8_t id;
     uint32_t regs[ASPEED_I3C_DEVICE_NR_REGS];
-- 
2.40.0.348.gf938b09366-goog


