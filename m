Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106661FD552
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 21:21:30 +0200 (CEST)
Received: from localhost ([::1]:52828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jldcn-0005g0-3s
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 15:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jldX4-0004Or-RV
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 15:15:34 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jldX1-0006U3-TF
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 15:15:34 -0400
Received: by mail-ej1-x633.google.com with SMTP id k11so3719636ejr.9
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 12:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PdH+OhSKTHotwgzPomJixLmJ0d9c3wgyyXnXH5sGHKo=;
 b=mdQKoKEVyWd7aeoAuX3Ex/DErZ3uMMFDtVBA96v8gQ0k/iokh1/gd/ae1cQKf2+8j4
 ooB+4RCjiONbvvsjHAV+prGqSYtFTwBBu+jC9uuc6F7rF+fpxVncnYZAIuDjmBkEtrEm
 JYAJ1E6dgJ8djfbd9d9yHcG9rCuwx3PdjN1qZGCibjzkyj9az9Z+CJEjpD6sixXU1zao
 f3kJppTZNQS7VNrNjddCiwRJ5B5kMxU/VFzct7cJkF5z/JldzG3AqoHRc5LBvwa+VyyT
 Luek7UMbN/iJ4yXhUB5nFKhXbOTC8bzsn9dCsJLlq5CHSGghM8jNvxYmxsN3U4mFGw7D
 xVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PdH+OhSKTHotwgzPomJixLmJ0d9c3wgyyXnXH5sGHKo=;
 b=l+C7gUwhzHu7wVt3SC3m85WmxdxCgjAlFO7ntW06Q0NeE3kMJPD3uH7+i34i5+/6Xk
 JghpB/4JqpG8BGLUUG8uVZXKOeykcJ9rDU8DTQrDqFvK5NzdNacyJGdwkMOanKr/SDFw
 WuRBk8VtD9N1KkfzbYQfiTXN7YQ19+TuguA6yMDCMowgdTsHYC13S7c6eKH+N7OA75s6
 0ffQEscaHoHt3oN91FVp4q0HavmAqS4dvJ/NbXA8hmKHaZiOtfDmT2z7VLHnRdJ/JtvZ
 jSXCxaPB2ab9v46yhCcOS5afwu1zWBT4rRJP7w9xSljZNf9xge7mtVkTzoItEKPRGBUu
 JNwQ==
X-Gm-Message-State: AOAM532/MsWrazx1NL/vQbsdR+Zelv67ZA6dOhK8nMPVg23fNqkuGGpd
 jrpMtVwQ6akkJkjCCm92sc8=
X-Google-Smtp-Source: ABdhPJwqdas9D0BCAt0fAFQxWAJBhqO1JTNZ17YzGLre3Qa7BONZSha9qYdoUx0LPaihDrLNkpR5sg==
X-Received: by 2002:a17:906:ce2f:: with SMTP id
 sd15mr575625ejb.445.1592421330448; 
 Wed, 17 Jun 2020 12:15:30 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id y21sm324308edl.72.2020.06.17.12.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 12:15:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <rth@twiddle.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org
Subject: [PATCH rc1 07/15] hw/timer: RX62N 8-Bit timer (TMR)
Date: Wed, 17 Jun 2020 21:15:11 +0200
Message-Id: <20200617191519.14842-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200617191519.14842-1-f4bug@amsat.org>
References: <20200617191519.14842-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yoshinori Sato <ysato@users.sourceforge.jp>

renesas_tmr: 8bit timer modules.
This part use many renesas's CPU.
Hardware manual.
https://www.renesas.com/us/en/doc/products/mpumcu/doc/rx_family/r01uh0033ej0140_rx62n.pdf

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200224141923.82118-16-ysato@users.sourceforge.jp>
[PMD: Split from CMT, filled VMStateField for migration]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/timer/renesas_tmr.h |  55 ++++
 hw/timer/renesas_tmr.c         | 477 +++++++++++++++++++++++++++++++++
 MAINTAINERS                    |   2 +
 hw/timer/Kconfig               |   3 +
 hw/timer/Makefile.objs         |   1 +
 5 files changed, 538 insertions(+)
 create mode 100644 include/hw/timer/renesas_tmr.h
 create mode 100644 hw/timer/renesas_tmr.c

diff --git a/include/hw/timer/renesas_tmr.h b/include/hw/timer/renesas_tmr.h
new file mode 100644
index 0000000000..cf3baa7a28
--- /dev/null
+++ b/include/hw/timer/renesas_tmr.h
@@ -0,0 +1,55 @@
+/*
+ * Renesas 8bit timer Object
+ *
+ * Copyright (c) 2018 Yoshinori Sato
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_TIMER_RENESAS_TMR_H
+#define HW_TIMER_RENESAS_TMR_H
+
+#include "qemu/timer.h"
+#include "hw/sysbus.h"
+
+#define TYPE_RENESAS_TMR "renesas-tmr"
+#define RTMR(obj) OBJECT_CHECK(RTMRState, (obj), TYPE_RENESAS_TMR)
+
+enum timer_event {
+    cmia = 0,
+    cmib = 1,
+    ovi = 2,
+    none = 3,
+    TMR_NR_EVENTS = 4
+};
+
+enum {
+    TMR_CH = 2,
+    TMR_NR_IRQ = 3 * TMR_CH
+};
+
+typedef struct RTMRState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    uint64_t input_freq;
+    MemoryRegion memory;
+
+    int64_t tick;
+    uint8_t tcnt[TMR_CH];
+    uint8_t tcora[TMR_CH];
+    uint8_t tcorb[TMR_CH];
+    uint8_t tcr[TMR_CH];
+    uint8_t tccr[TMR_CH];
+    uint8_t tcor[TMR_CH];
+    uint8_t tcsr[TMR_CH];
+    int64_t div_round[TMR_CH];
+    uint8_t next[TMR_CH];
+    qemu_irq cmia[TMR_CH];
+    qemu_irq cmib[TMR_CH];
+    qemu_irq ovi[TMR_CH];
+    QEMUTimer timer[TMR_CH];
+} RTMRState;
+
+#endif
diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
new file mode 100644
index 0000000000..446f2eacdd
--- /dev/null
+++ b/hw/timer/renesas_tmr.c
@@ -0,0 +1,477 @@
+/*
+ * Renesas 8bit timer
+ *
+ * Datasheet: RX62N Group, RX621 Group User's Manual: Hardware
+ *            (Rev.1.40 R01UH0033EJ0140)
+ *
+ * Copyright (c) 2019 Yoshinori Sato
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/irq.h"
+#include "hw/registerfields.h"
+#include "hw/qdev-properties.h"
+#include "hw/timer/renesas_tmr.h"
+#include "migration/vmstate.h"
+
+REG8(TCR, 0)
+  FIELD(TCR, CCLR,  3, 2)
+  FIELD(TCR, OVIE,  5, 1)
+  FIELD(TCR, CMIEA, 6, 1)
+  FIELD(TCR, CMIEB, 7, 1)
+REG8(TCSR, 2)
+  FIELD(TCSR, OSA,  0, 2)
+  FIELD(TCSR, OSB,  2, 2)
+  FIELD(TCSR, ADTE, 4, 2)
+REG8(TCORA, 4)
+REG8(TCORB, 6)
+REG8(TCNT, 8)
+REG8(TCCR, 10)
+  FIELD(TCCR, CKS,   0, 3)
+  FIELD(TCCR, CSS,   3, 2)
+  FIELD(TCCR, TMRIS, 7, 1)
+
+#define INTERNAL  0x01
+#define CASCADING 0x03
+#define CCLR_A    0x01
+#define CCLR_B    0x02
+
+static const int clkdiv[] = {0, 1, 2, 8, 32, 64, 1024, 8192};
+
+static uint8_t concat_reg(uint8_t *reg)
+{
+    return (reg[0] << 8) | reg[1];
+}
+
+static void update_events(RTMRState *tmr, int ch)
+{
+    uint16_t diff[TMR_NR_EVENTS], min;
+    int64_t next_time;
+    int i, event;
+
+    if (tmr->tccr[ch] == 0) {
+        return ;
+    }
+    if (FIELD_EX8(tmr->tccr[ch], TCCR, CSS) == 0) {
+        /* external clock mode */
+        /* event not happened */
+        return ;
+    }
+    if (FIELD_EX8(tmr->tccr[0], TCCR, CSS) == CASCADING) {
+        /* cascading mode */
+        if (ch == 1) {
+            tmr->next[ch] = none;
+            return ;
+        }
+        diff[cmia] = concat_reg(tmr->tcora) - concat_reg(tmr->tcnt);
+        diff[cmib] = concat_reg(tmr->tcorb) - concat_reg(tmr->tcnt);
+        diff[ovi] = 0x10000 - concat_reg(tmr->tcnt);
+    } else {
+        /* separate mode */
+        diff[cmia] = tmr->tcora[ch] - tmr->tcnt[ch];
+        diff[cmib] = tmr->tcorb[ch] - tmr->tcnt[ch];
+        diff[ovi] = 0x100 - tmr->tcnt[ch];
+    }
+    /* Search for the most recently occurring event. */
+    for (event = 0, min = diff[0], i = 1; i < none; i++) {
+        if (min > diff[i]) {
+            event = i;
+            min = diff[i];
+        }
+    }
+    tmr->next[ch] = event;
+    next_time = diff[event];
+    next_time *= clkdiv[FIELD_EX8(tmr->tccr[ch], TCCR, CKS)];
+    next_time *= NANOSECONDS_PER_SECOND;
+    next_time /= tmr->input_freq;
+    next_time += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    timer_mod(&tmr->timer[ch], next_time);
+}
+
+static int elapsed_time(RTMRState *tmr, int ch, int64_t delta)
+{
+    int divrate = clkdiv[FIELD_EX8(tmr->tccr[ch], TCCR, CKS)];
+    int et;
+
+    tmr->div_round[ch] += delta;
+    if (divrate > 0) {
+        et = tmr->div_round[ch] / divrate;
+        tmr->div_round[ch] %= divrate;
+    } else {
+        /* disble clock. so no update */
+        et = 0;
+    }
+    return et;
+}
+
+static uint16_t read_tcnt(RTMRState *tmr, unsigned size, int ch)
+{
+    int64_t delta, now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    int elapsed, ovf = 0;
+    uint16_t tcnt[2];
+    uint32_t ret;
+
+    delta = (now - tmr->tick) * NANOSECONDS_PER_SECOND / tmr->input_freq;
+    if (delta > 0) {
+        tmr->tick = now;
+
+        if (FIELD_EX8(tmr->tccr[1], TCCR, CSS) == INTERNAL) {
+            /* timer1 count update */
+            elapsed = elapsed_time(tmr, 1, delta);
+            if (elapsed >= 0x100) {
+                ovf = elapsed >> 8;
+            }
+            tcnt[1] = tmr->tcnt[1] + (elapsed & 0xff);
+        }
+        switch (FIELD_EX8(tmr->tccr[0], TCCR, CSS)) {
+        case INTERNAL:
+            elapsed = elapsed_time(tmr, 0, delta);
+            tcnt[0] = tmr->tcnt[0] + elapsed;
+            break;
+        case CASCADING:
+            if (ovf > 0) {
+                tcnt[0] = tmr->tcnt[0] + ovf;
+            }
+            break;
+        }
+    } else {
+        tcnt[0] = tmr->tcnt[0];
+        tcnt[1] = tmr->tcnt[1];
+    }
+    if (size == 1) {
+        return tcnt[ch];
+    } else {
+        ret = 0;
+        ret = deposit32(ret, 0, 8, tcnt[1]);
+        ret = deposit32(ret, 8, 8, tcnt[0]);
+        return ret;
+    }
+}
+
+static uint8_t read_tccr(uint8_t r)
+{
+    uint8_t tccr = 0;
+    tccr = FIELD_DP8(tccr, TCCR, TMRIS,
+                     FIELD_EX8(r, TCCR, TMRIS));
+    tccr = FIELD_DP8(tccr, TCCR, CSS,
+                     FIELD_EX8(r, TCCR, CSS));
+    tccr = FIELD_DP8(tccr, TCCR, CKS,
+                     FIELD_EX8(r, TCCR, CKS));
+    return tccr;
+}
+
+static uint64_t tmr_read(void *opaque, hwaddr addr, unsigned size)
+{
+    RTMRState *tmr = opaque;
+    int ch = addr & 1;
+    uint64_t ret;
+
+    if (size == 2 && (ch != 0 || addr == A_TCR || addr == A_TCSR)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "renesas_tmr: Invalid read size 0x%"
+                                       HWADDR_PRIX "\n",
+                      addr);
+        return UINT64_MAX;
+    }
+    switch (addr & 0x0e) {
+    case A_TCR:
+        ret = 0;
+        ret = FIELD_DP8(ret, TCR, CCLR,
+                        FIELD_EX8(tmr->tcr[ch], TCR, CCLR));
+        ret = FIELD_DP8(ret, TCR, OVIE,
+                        FIELD_EX8(tmr->tcr[ch], TCR, OVIE));
+        ret = FIELD_DP8(ret, TCR, CMIEA,
+                        FIELD_EX8(tmr->tcr[ch], TCR, CMIEA));
+        ret = FIELD_DP8(ret, TCR, CMIEB,
+                        FIELD_EX8(tmr->tcr[ch], TCR, CMIEB));
+        return ret;
+    case A_TCSR:
+        ret = 0;
+        ret = FIELD_DP8(ret, TCSR, OSA,
+                        FIELD_EX8(tmr->tcsr[ch], TCSR, OSA));
+        ret = FIELD_DP8(ret, TCSR, OSB,
+                        FIELD_EX8(tmr->tcsr[ch], TCSR, OSB));
+        switch (ch) {
+        case 0:
+            ret = FIELD_DP8(ret, TCSR, ADTE,
+                            FIELD_EX8(tmr->tcsr[ch], TCSR, ADTE));
+            break;
+        case 1: /* CH1 ADTE unimplement always 1 */
+            ret = FIELD_DP8(ret, TCSR, ADTE, 1);
+            break;
+        }
+        return ret;
+    case A_TCORA:
+        if (size == 1) {
+            return tmr->tcora[ch];
+        } else if (ch == 0) {
+            return concat_reg(tmr->tcora);
+        }
+    case A_TCORB:
+        if (size == 1) {
+            return tmr->tcorb[ch];
+        } else {
+            return concat_reg(tmr->tcorb);
+        }
+    case A_TCNT:
+        return read_tcnt(tmr, size, ch);
+    case A_TCCR:
+        if (size == 1) {
+            return read_tccr(tmr->tccr[ch]);
+        } else {
+            return read_tccr(tmr->tccr[0]) << 8 | read_tccr(tmr->tccr[1]);
+        }
+    default:
+        qemu_log_mask(LOG_UNIMP, "renesas_tmr: Register 0x%" HWADDR_PRIX
+                                 " not implemented\n",
+                      addr);
+        break;
+    }
+    return UINT64_MAX;
+}
+
+static void tmr_write_count(RTMRState *tmr, int ch, unsigned size,
+                            uint8_t *reg, uint64_t val)
+{
+    if (size == 1) {
+        reg[ch] = val;
+        update_events(tmr, ch);
+    } else {
+        reg[0] = extract32(val, 8, 8);
+        reg[1] = extract32(val, 0, 8);
+        update_events(tmr, 0);
+        update_events(tmr, 1);
+    }
+}
+
+static void tmr_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
+{
+    RTMRState *tmr = opaque;
+    int ch = addr & 1;
+
+    if (size == 2 && (ch != 0 || addr == A_TCR || addr == A_TCSR)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "renesas_tmr: Invalid write size 0x%" HWADDR_PRIX "\n",
+                      addr);
+        return;
+    }
+    switch (addr & 0x0e) {
+    case A_TCR:
+        tmr->tcr[ch] = val;
+        break;
+    case A_TCSR:
+        tmr->tcsr[ch] = val;
+        break;
+    case A_TCORA:
+        tmr_write_count(tmr, ch, size, tmr->tcora, val);
+        break;
+    case A_TCORB:
+        tmr_write_count(tmr, ch, size, tmr->tcorb, val);
+        break;
+    case A_TCNT:
+        tmr_write_count(tmr, ch, size, tmr->tcnt, val);
+        break;
+    case A_TCCR:
+        tmr_write_count(tmr, ch, size, tmr->tccr, val);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "renesas_tmr: Register 0x%" HWADDR_PRIX
+                                 " not implemented\n",
+                      addr);
+        break;
+    }
+}
+
+static const MemoryRegionOps tmr_ops = {
+    .write = tmr_write,
+    .read  = tmr_read,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 2,
+    },
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 2,
+    },
+};
+
+static void timer_events(RTMRState *tmr, int ch);
+
+static uint16_t issue_event(RTMRState *tmr, int ch, int sz,
+                        uint16_t tcnt, uint16_t tcora, uint16_t tcorb)
+{
+    uint16_t ret = tcnt;
+
+    switch (tmr->next[ch]) {
+    case none:
+        break;
+    case cmia:
+        if (tcnt >= tcora) {
+            if (FIELD_EX8(tmr->tcr[ch], TCR, CCLR) == CCLR_A) {
+                ret = tcnt - tcora;
+            }
+            if (FIELD_EX8(tmr->tcr[ch], TCR, CMIEA)) {
+                qemu_irq_pulse(tmr->cmia[ch]);
+            }
+            if (sz == 8 && ch == 0 &&
+                FIELD_EX8(tmr->tccr[1], TCCR, CSS) == CASCADING) {
+                tmr->tcnt[1]++;
+                timer_events(tmr, 1);
+            }
+        }
+        break;
+    case cmib:
+        if (tcnt >= tcorb) {
+            if (FIELD_EX8(tmr->tcr[ch], TCR, CCLR) == CCLR_B) {
+                ret = tcnt - tcorb;
+            }
+            if (FIELD_EX8(tmr->tcr[ch], TCR, CMIEB)) {
+                qemu_irq_pulse(tmr->cmib[ch]);
+            }
+        }
+        break;
+    case ovi:
+        if ((tcnt >= (1 << sz)) && FIELD_EX8(tmr->tcr[ch], TCR, OVIE)) {
+            qemu_irq_pulse(tmr->ovi[ch]);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return ret;
+}
+
+static void timer_events(RTMRState *tmr, int ch)
+{
+    uint16_t tcnt;
+
+    tmr->tcnt[ch] = read_tcnt(tmr, 1, ch);
+    if (FIELD_EX8(tmr->tccr[0], TCCR, CSS) != CASCADING) {
+        tmr->tcnt[ch] = issue_event(tmr, ch, 8,
+                                    tmr->tcnt[ch],
+                                    tmr->tcora[ch],
+                                    tmr->tcorb[ch]) & 0xff;
+    } else {
+        if (ch == 1) {
+            return ;
+        }
+        tcnt = issue_event(tmr, ch, 16,
+                           concat_reg(tmr->tcnt),
+                           concat_reg(tmr->tcora),
+                           concat_reg(tmr->tcorb));
+        tmr->tcnt[0] = (tcnt >> 8) & 0xff;
+        tmr->tcnt[1] = tcnt & 0xff;
+    }
+    update_events(tmr, ch);
+}
+
+static void timer_event0(void *opaque)
+{
+    RTMRState *tmr = opaque;
+
+    timer_events(tmr, 0);
+}
+
+static void timer_event1(void *opaque)
+{
+    RTMRState *tmr = opaque;
+
+    timer_events(tmr, 1);
+}
+
+static void rtmr_reset(DeviceState *dev)
+{
+    RTMRState *tmr = RTMR(dev);
+    tmr->tcr[0]   = tmr->tcr[1]   = 0x00;
+    tmr->tcsr[0]  = 0x00;
+    tmr->tcsr[1]  = 0x10;
+    tmr->tcnt[0]  = tmr->tcnt[1]  = 0x00;
+    tmr->tcora[0] = tmr->tcora[1] = 0xff;
+    tmr->tcorb[0] = tmr->tcorb[1] = 0xff;
+    tmr->tccr[0]  = tmr->tccr[1]  = 0x00;
+    tmr->next[0]  = tmr->next[1]  = none;
+    tmr->tick = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+}
+
+static void rtmr_init(Object *obj)
+{
+    SysBusDevice *d = SYS_BUS_DEVICE(obj);
+    RTMRState *tmr = RTMR(obj);
+    int i;
+
+    memory_region_init_io(&tmr->memory, OBJECT(tmr), &tmr_ops,
+                          tmr, "renesas-tmr", 0x10);
+    sysbus_init_mmio(d, &tmr->memory);
+
+    for (i = 0; i < ARRAY_SIZE(tmr->ovi); i++) {
+        sysbus_init_irq(d, &tmr->cmia[i]);
+        sysbus_init_irq(d, &tmr->cmib[i]);
+        sysbus_init_irq(d, &tmr->ovi[i]);
+    }
+    timer_init_ns(&tmr->timer[0], QEMU_CLOCK_VIRTUAL, timer_event0, tmr);
+    timer_init_ns(&tmr->timer[1], QEMU_CLOCK_VIRTUAL, timer_event1, tmr);
+}
+
+static const VMStateDescription vmstate_rtmr = {
+    .name = "rx-tmr",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_INT64(tick, RTMRState),
+        VMSTATE_UINT8_ARRAY(tcnt, RTMRState, TMR_CH),
+        VMSTATE_UINT8_ARRAY(tcora, RTMRState, TMR_CH),
+        VMSTATE_UINT8_ARRAY(tcorb, RTMRState, TMR_CH),
+        VMSTATE_UINT8_ARRAY(tcr, RTMRState, TMR_CH),
+        VMSTATE_UINT8_ARRAY(tccr, RTMRState, TMR_CH),
+        VMSTATE_UINT8_ARRAY(tcor, RTMRState, TMR_CH),
+        VMSTATE_UINT8_ARRAY(tcsr, RTMRState, TMR_CH),
+        VMSTATE_INT64_ARRAY(div_round, RTMRState, TMR_CH),
+        VMSTATE_UINT8_ARRAY(next, RTMRState, TMR_CH),
+        VMSTATE_TIMER_ARRAY(timer, RTMRState, TMR_CH),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property rtmr_properties[] = {
+    DEFINE_PROP_UINT64("input-freq", RTMRState, input_freq, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void rtmr_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_rtmr;
+    dc->reset = rtmr_reset;
+    device_class_set_props(dc, rtmr_properties);
+}
+
+static const TypeInfo rtmr_info = {
+    .name = TYPE_RENESAS_TMR,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(RTMRState),
+    .instance_init = rtmr_init,
+    .class_init = rtmr_class_init,
+};
+
+static void rtmr_register_types(void)
+{
+    type_register_static(&rtmr_info);
+}
+
+type_init(rtmr_register_types)
diff --git a/MAINTAINERS b/MAINTAINERS
index dd0297a74e..4c84fb13ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1968,8 +1968,10 @@ M: Yoshinori Sato <ysato@users.sourceforge.jp>
 R: Magnus Damm <magnus.damm@gmail.com>
 S: Maintained
 F: hw/char/sh_serial.c
+F: hw/timer/renesas_tmr.c
 F: hw/timer/sh_timer.c
 F: include/hw/sh4/sh.h
+F: include/hw/timer/renesas_tmr.h
 
 Renesas RX peripherals
 M: Yoshinori Sato <ysato@users.sourceforge.jp>
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 59b3f44d69..7039c2a686 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -35,3 +35,6 @@ config CMSDK_APB_TIMER
 config CMSDK_APB_DUALTIMER
     bool
     select PTIMER
+
+config RENESAS_TMR
+    bool
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index dece235fd7..44fb47a433 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -23,6 +23,7 @@ common-obj-$(CONFIG_OMAP) += omap_gptimer.o
 common-obj-$(CONFIG_OMAP) += omap_synctimer.o
 common-obj-$(CONFIG_PXA2XX) += pxa2xx_timer.o
 common-obj-$(CONFIG_SH4) += sh_timer.o
+common-obj-$(CONFIG_RENESAS_TMR) += renesas_tmr.o
 common-obj-$(CONFIG_DIGIC) += digic-timer.o
 common-obj-$(CONFIG_MIPS_CPS) += mips_gictimer.o
 
-- 
2.21.3


