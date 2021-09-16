Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F350E40ECFE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 23:58:44 +0200 (CEST)
Received: from localhost ([::1]:48062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzP2-0006oS-0J
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 17:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzGe-0005me-BZ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:05 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:20965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzGa-0002Ow-P8
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631828999; x=1663364999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ih+WOH6zS1mvCqJQSxv/+oEkEzr9juiZ1Si3cVEYs8E=;
 b=AZxRtTBa0plLD/+m+SxGWOPqOilvaHl30NwetA7l8gyG6mh+uhbO7P78
 xpydm5TWlH3sXGctx/R7Kn4CkXUj7CA8z/4LPZgfEaKZy6zCvxzYyY+cj
 qBCI7eCbxMIcFLz9Qx0YgfBZmdHButqv27e7gny5ePsRac6xaZwMxBYFp
 RQNynsE1SfM7igwKMpu50rV1CUAuoSdD2K2PhvwW8GTCzZRgUpQlF88F6
 Um8T/OWIGdGQkf3ZDAh1P/otYjwz+ap9Z2eingUTMJkwqXdjlOAqIjaTw
 A4PxEilwAkvJQhmofowmi68DRoBJj5NLePbJAEHzktfvj8is+QDF2cGs9 A==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="184998233"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:49:57 +0800
IronPort-SDR: CXSKEapzAXHHF6EXYMRCVy9MQ9RqSqQ/GHH/vF3fDLXfLk9JV28s/IvYhFcc6MDmnNXnzhOHrR
 nSPuTDaqQMZx3AVI8LJ/7XXcUfCO7oWUkIdP/9LnV56/30SKULxcp8MULvxrSMsTU/+aSGLaOC
 jqz+PqyZypPpS5Fuso5otehhaJ+WpI45MA2D9adHvBPhBDRmoRsk+bEO5xIcDY3xssxLdhsOk0
 rZ0IyR1/6YjMdaYoN5zTE/F98Dczgrq2LypxnRIpcTsJolawDheDFUnqfxYXaHAS0ed6HCe1XZ
 LQBKaHhCg76AOe1mciHfhGTv
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:24:45 -0700
IronPort-SDR: RR12zfGJWKwxo9TuYvbTk4JDTehEwCmD35mK6zen+Lw39P0agpbGRcWm8CUKL795NBCKrErCCs
 l0gIdrfWRQkCEmJWNq1Qcxq+DQCV2eTEFry3KJbVK7/7PMLYv0k7MOLnHoqhx7bXVml1j/IigE
 TY4VVOvKZilkyVGTkKlSmn3MZBX0y9aaxOpJkYHSSJFyqkca2gXZ7dPluyN5aPyEQJdSlkN5Am
 UQY3ZICuyNfDDlWY7E3ZLrHBOtD/slYJphM9fMqhscI65CpuhgFm5TwNUZm9IcE+AagYrIsfKt
 /9k=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:49:58 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W2s2mp9z1RwsB
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:49:57 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631828994; x=1634420995; bh=Ih+WOH6zS1mvCqJQSx
 v/+oEkEzr9juiZ1Si3cVEYs8E=; b=Pom3DFfJmccLuOkjs40azpa8WvUMrFD0Ii
 0E7lE6UdJ7yanjaEZltVp52DINve5aBybb7gXAzaLqwhOUbfyNIGNaKqxV30U2YF
 2L+s9G6DVtHRZYqFDv4WAuqEAY+IkzxWeV38rum8Iuttpuky7Htp3xOsgJ4q2iJo
 kncxao09dNO4jhYrkKY8Yx248eP4kaU94Y+LvqIHB9UL1GK5FHuqJpHRT5vlLc0J
 Y1NfBnYzr6hBGBlkvT/HtDD3izK5JutR/TWa5gsB4CObx4e0nujEN53QG4pUXDcN
 MPn5AJ2rZ20kUKVsKsjL0PgO7H0U+6GfcDjo4Zu4svJ3GIBVAhOQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id huCpIWTw3rr6 for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:49:54 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W2j0cw4z1RvlX;
 Thu, 16 Sep 2021 14:49:48 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Justin Restivo <jrestivo@draper.com>,
 Alexandra Clifford <aclifford@draper.com>,
 Amanda Strnad <astrnad@draper.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 08/21] hw/timer: Add SiFive PWM support
Date: Fri, 17 Sep 2021 07:48:51 +1000
Message-Id: <20210916214904.734206-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

This is the initial commit of the SiFive PWM timer. This is used by
guest software as a timer and is included in the SiFive FU540 SoC.

Signed-off-by: Justin Restivo <jrestivo@draper.com>
Signed-off-by: Alexandra Clifford <aclifford@draper.com>
Signed-off-by: Amanda Strnad <astrnad@draper.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 9f70a210acbfaf0e1ea6ad311ab892ac69134d8b.1631159656.git.alist=
air.francis@wdc.com
---
 include/hw/timer/sifive_pwm.h |  62 +++++
 hw/timer/sifive_pwm.c         | 468 ++++++++++++++++++++++++++++++++++
 hw/timer/Kconfig              |   3 +
 hw/timer/meson.build          |   1 +
 hw/timer/trace-events         |   6 +
 5 files changed, 540 insertions(+)
 create mode 100644 include/hw/timer/sifive_pwm.h
 create mode 100644 hw/timer/sifive_pwm.c

diff --git a/include/hw/timer/sifive_pwm.h b/include/hw/timer/sifive_pwm.=
h
new file mode 100644
index 0000000000..6a8cf7b29e
--- /dev/null
+++ b/include/hw/timer/sifive_pwm.h
@@ -0,0 +1,62 @@
+/*
+ * SiFive PWM
+ *
+ * Copyright (c) 2020 Western Digital
+ *
+ * Author:  Alistair Francis <alistair.francis@wdc.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
+ * of this software and associated documentation files (the "Software"),=
 to deal
+ * in the Software without restriction, including without limitation the=
 rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be includ=
ed in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_SIFIVE_PWM_H
+#define HW_SIFIVE_PWM_H
+
+#include "hw/sysbus.h"
+#include "qemu/timer.h"
+#include "qom/object.h"
+
+#define TYPE_SIFIVE_PWM "sifive-pwm"
+
+#define SIFIVE_PWM(obj) \
+    OBJECT_CHECK(SiFivePwmState, (obj), TYPE_SIFIVE_PWM)
+
+#define SIFIVE_PWM_CHANS          4
+#define SIFIVE_PWM_IRQS           SIFIVE_PWM_CHANS
+
+typedef struct SiFivePwmState {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /* <public> */
+    MemoryRegion mmio;
+    QEMUTimer timer[SIFIVE_PWM_CHANS];
+    /*
+     * if en bit(s) set, is the number of ticks when pwmcount was 0
+     * if en bit(s) not set, is the number of ticks in pwmcount
+     */
+    uint64_t tick_offset;
+    uint64_t freq_hz;
+
+    uint32_t pwmcfg;
+    uint32_t pwmcmp[SIFIVE_PWM_CHANS];
+
+    qemu_irq irqs[SIFIVE_PWM_IRQS];
+} SiFivePwmState;
+
+#endif /* HW_SIFIVE_PWM_H */
diff --git a/hw/timer/sifive_pwm.c b/hw/timer/sifive_pwm.c
new file mode 100644
index 0000000000..c664480ccf
--- /dev/null
+++ b/hw/timer/sifive_pwm.c
@@ -0,0 +1,468 @@
+/*
+ * SiFive PWM
+ *
+ * Copyright (c) 2020 Western Digital
+ *
+ * Author:  Alistair Francis <alistair.francis@wdc.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
+ * of this software and associated documentation files (the "Software"),=
 to deal
+ * in the Software without restriction, including without limitation the=
 rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be includ=
ed in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "trace.h"
+#include "hw/irq.h"
+#include "hw/timer/sifive_pwm.h"
+#include "hw/qdev-properties.h"
+#include "hw/registerfields.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+
+#define HAS_PWM_EN_BITS(cfg) ((cfg & R_CONFIG_ENONESHOT_MASK) || \
+                              (cfg & R_CONFIG_ENALWAYS_MASK))
+
+#define PWMCMP_MASK 0xFFFF
+#define PWMCOUNT_MASK 0x7FFFFFFF
+
+REG32(CONFIG,                   0x00)
+    FIELD(CONFIG, SCALE,            0, 4)
+    FIELD(CONFIG, STICKY,           8, 1)
+    FIELD(CONFIG, ZEROCMP,          9, 1)
+    FIELD(CONFIG, DEGLITCH,         10, 1)
+    FIELD(CONFIG, ENALWAYS,         12, 1)
+    FIELD(CONFIG, ENONESHOT,        13, 1)
+    FIELD(CONFIG, CMP0CENTER,       16, 1)
+    FIELD(CONFIG, CMP1CENTER,       17, 1)
+    FIELD(CONFIG, CMP2CENTER,       18, 1)
+    FIELD(CONFIG, CMP3CENTER,       19, 1)
+    FIELD(CONFIG, CMP0GANG,         24, 1)
+    FIELD(CONFIG, CMP1GANG,         25, 1)
+    FIELD(CONFIG, CMP2GANG,         26, 1)
+    FIELD(CONFIG, CMP3GANG,         27, 1)
+    FIELD(CONFIG, CMP0IP,           28, 1)
+    FIELD(CONFIG, CMP1IP,           29, 1)
+    FIELD(CONFIG, CMP2IP,           30, 1)
+    FIELD(CONFIG, CMP3IP,           31, 1)
+REG32(COUNT,                    0x08)
+REG32(PWMS,                     0x10)
+REG32(PWMCMP0,                  0x20)
+REG32(PWMCMP1,                  0x24)
+REG32(PWMCMP2,                  0x28)
+REG32(PWMCMP3,                  0x2C)
+
+static inline uint64_t sifive_pwm_ns_to_ticks(SiFivePwmState *s,
+                                                uint64_t time)
+{
+    return muldiv64(time, s->freq_hz, NANOSECONDS_PER_SECOND);
+}
+
+static inline uint64_t sifive_pwm_ticks_to_ns(SiFivePwmState *s,
+                                                uint64_t ticks)
+{
+    return muldiv64(ticks, NANOSECONDS_PER_SECOND, s->freq_hz);
+}
+
+static inline uint64_t sifive_pwm_compute_scale(SiFivePwmState *s)
+{
+    return s->pwmcfg & R_CONFIG_SCALE_MASK;
+}
+
+static void sifive_pwm_set_alarms(SiFivePwmState *s)
+{
+    uint64_t now_ns =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+
+    if (HAS_PWM_EN_BITS(s->pwmcfg)) {
+        /*
+         * Subtract ticks from number of ticks when the timer was zero
+         * and mask to the register width.
+         */
+        uint64_t pwmcount =3D (sifive_pwm_ns_to_ticks(s, now_ns) -
+                             s->tick_offset) & PWMCOUNT_MASK;
+        uint64_t scale =3D sifive_pwm_compute_scale(s);
+        /* PWMs only contains PWMCMP_MASK bits starting at scale */
+        uint64_t pwms =3D (pwmcount & (PWMCMP_MASK << scale)) >> scale;
+
+        for (int i =3D 0; i < SIFIVE_PWM_CHANS; i++) {
+            uint64_t pwmcmp =3D s->pwmcmp[i] & PWMCMP_MASK;
+            uint64_t pwmcmp_ticks =3D pwmcmp << scale;
+
+            /*
+             * Per circuit diagram and spec, both cases raises correspon=
ding
+             * IP bit one clock cycle after time expires.
+             */
+            if (pwmcmp > pwms) {
+                uint64_t offset =3D pwmcmp_ticks - pwmcount + 1;
+                uint64_t when_to_fire =3D now_ns +
+                                          sifive_pwm_ticks_to_ns(s, offs=
et);
+
+                trace_sifive_pwm_set_alarm(when_to_fire, now_ns);
+                timer_mod(&s->timer[i], when_to_fire);
+            } else {
+                /* Schedule interrupt for next cycle */
+                trace_sifive_pwm_set_alarm(now_ns + 1, now_ns);
+                timer_mod(&s->timer[i], now_ns + 1);
+            }
+
+        }
+    } else {
+        /*
+         * If timer incrementing disabled, just do pwms > pwmcmp check s=
ince
+         * a write may have happened to PWMs.
+         */
+        uint64_t pwmcount =3D (s->tick_offset) & PWMCOUNT_MASK;
+        uint64_t scale =3D sifive_pwm_compute_scale(s);
+        uint64_t pwms =3D (pwmcount & (PWMCMP_MASK << scale)) >> scale;
+
+        for (int i =3D 0; i < SIFIVE_PWM_CHANS; i++) {
+            uint64_t pwmcmp =3D s->pwmcmp[i] & PWMCMP_MASK;
+
+            if (pwms >=3D pwmcmp) {
+                trace_sifive_pwm_set_alarm(now_ns + 1, now_ns);
+                timer_mod(&s->timer[i], now_ns + 1);
+            } else {
+                /* Effectively disable timer by scheduling far in future=
. */
+                trace_sifive_pwm_set_alarm(0xFFFFFFFFFFFFFF, now_ns);
+                timer_mod(&s->timer[i], 0xFFFFFFFFFFFFFF);
+            }
+        }
+    }
+}
+
+static void sifive_pwm_interrupt(SiFivePwmState *s, int num)
+{
+    uint64_t now =3D sifive_pwm_ns_to_ticks(s,
+                                        qemu_clock_get_ns(QEMU_CLOCK_VIR=
TUAL));
+    bool was_incrementing =3D HAS_PWM_EN_BITS(s->pwmcfg);
+
+    trace_sifive_pwm_interrupt(num);
+
+    s->pwmcfg |=3D R_CONFIG_CMP0IP_MASK << num;
+    qemu_irq_raise(s->irqs[num]);
+
+    /*
+     * If the zerocmp is set and pwmcmp0 raised the interrupt
+     * reset the zero ticks.
+     */
+    if ((s->pwmcfg & R_CONFIG_ZEROCMP_MASK) && (num =3D=3D 0)) {
+        /* If reset signal conditions, disable ENONESHOT. */
+        s->pwmcfg &=3D ~R_CONFIG_ENONESHOT_MASK;
+
+        if (was_incrementing) {
+            /* If incrementing, time in ticks is when pwmcount is zero *=
/
+            s->tick_offset =3D now;
+        } else {
+            /* If not incrementing, pwmcount =3D 0 */
+            s->tick_offset =3D 0;
+        }
+    }
+
+    /*
+     * If carryout bit set, which we discern via looking for overflow,
+     * also reset ENONESHOT.
+     */
+    if (was_incrementing &&
+        ((now & PWMCOUNT_MASK) < (s->tick_offset & PWMCOUNT_MASK))) {
+        s->pwmcfg &=3D ~R_CONFIG_ENONESHOT_MASK;
+    }
+
+    /* Schedule or disable interrupts */
+    sifive_pwm_set_alarms(s);
+
+    /* If was enabled, and now not enabled, switch tick rep */
+    if (was_incrementing && !HAS_PWM_EN_BITS(s->pwmcfg)) {
+        s->tick_offset =3D (now - s->tick_offset) & PWMCOUNT_MASK;
+    }
+}
+
+static void sifive_pwm_interrupt_0(void *opaque)
+{
+    SiFivePwmState *s =3D opaque;
+
+    sifive_pwm_interrupt(s, 0);
+}
+
+static void sifive_pwm_interrupt_1(void *opaque)
+{
+    SiFivePwmState *s =3D opaque;
+
+    sifive_pwm_interrupt(s, 1);
+}
+
+static void sifive_pwm_interrupt_2(void *opaque)
+{
+    SiFivePwmState *s =3D opaque;
+
+    sifive_pwm_interrupt(s, 2);
+}
+
+static void sifive_pwm_interrupt_3(void *opaque)
+{
+    SiFivePwmState *s =3D opaque;
+
+    sifive_pwm_interrupt(s, 3);
+}
+
+static uint64_t sifive_pwm_read(void *opaque, hwaddr addr,
+                                  unsigned int size)
+{
+    SiFivePwmState *s =3D opaque;
+    uint64_t cur_time, scale;
+    uint64_t now =3D sifive_pwm_ns_to_ticks(s,
+                                        qemu_clock_get_ns(QEMU_CLOCK_VIR=
TUAL));
+
+    trace_sifive_pwm_read(addr);
+
+    switch (addr) {
+    case A_CONFIG:
+        return s->pwmcfg;
+    case A_COUNT:
+        cur_time =3D s->tick_offset;
+
+        if (HAS_PWM_EN_BITS(s->pwmcfg)) {
+            cur_time =3D now - cur_time;
+        }
+
+        /*
+         * Return the value in the counter with bit 31 always 0
+         * This is allowed to wrap around so we don't need to check that=
.
+         */
+        return cur_time & PWMCOUNT_MASK;
+    case A_PWMS:
+        cur_time =3D s->tick_offset;
+        scale =3D sifive_pwm_compute_scale(s);
+
+        if (HAS_PWM_EN_BITS(s->pwmcfg)) {
+            cur_time =3D now - cur_time;
+        }
+
+        return ((cur_time & PWMCOUNT_MASK) >> scale) & PWMCMP_MASK;
+    case A_PWMCMP0:
+        return s->pwmcmp[0] & PWMCMP_MASK;
+    case A_PWMCMP1:
+        return s->pwmcmp[1] & PWMCMP_MASK;
+    case A_PWMCMP2:
+        return s->pwmcmp[2] & PWMCMP_MASK;
+    case A_PWMCMP3:
+        return s->pwmcmp[3] & PWMCMP_MASK;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, add=
r);
+        return 0;
+    }
+
+    return 0;
+}
+
+static void sifive_pwm_write(void *opaque, hwaddr addr,
+                               uint64_t val64, unsigned int size)
+{
+    SiFivePwmState *s =3D opaque;
+    uint32_t value =3D val64;
+    uint64_t new_offset, scale;
+    uint64_t now =3D sifive_pwm_ns_to_ticks(s,
+                                        qemu_clock_get_ns(QEMU_CLOCK_VIR=
TUAL));
+
+    trace_sifive_pwm_write(value, addr);
+
+    switch (addr) {
+    case A_CONFIG:
+        if (value & (R_CONFIG_CMP0CENTER_MASK | R_CONFIG_CMP1CENTER_MASK=
 |
+                     R_CONFIG_CMP2CENTER_MASK | R_CONFIG_CMP3CENTER_MASK=
)) {
+            qemu_log_mask(LOG_UNIMP, "%s: CMPxCENTER is not supported\n"=
,
+                          __func__);
+        }
+
+        if (value & (R_CONFIG_CMP0GANG_MASK | R_CONFIG_CMP1GANG_MASK |
+                     R_CONFIG_CMP2GANG_MASK | R_CONFIG_CMP3GANG_MASK)) {
+            qemu_log_mask(LOG_UNIMP, "%s: CMPxGANG is not supported\n",
+                          __func__);
+        }
+
+        if (value & (R_CONFIG_CMP0IP_MASK | R_CONFIG_CMP1IP_MASK |
+                     R_CONFIG_CMP2IP_MASK | R_CONFIG_CMP3IP_MASK)) {
+            qemu_log_mask(LOG_UNIMP, "%s: CMPxIP is not supported\n",
+                          __func__);
+        }
+
+        if (!(value & R_CONFIG_CMP0IP_MASK)) {
+            qemu_irq_lower(s->irqs[0]);
+        }
+
+        if (!(value & R_CONFIG_CMP1IP_MASK)) {
+            qemu_irq_lower(s->irqs[1]);
+        }
+
+        if (!(value & R_CONFIG_CMP2IP_MASK)) {
+            qemu_irq_lower(s->irqs[2]);
+        }
+
+        if (!(value & R_CONFIG_CMP3IP_MASK)) {
+            qemu_irq_lower(s->irqs[3]);
+        }
+
+        /*
+         * If this write enables the timer increment
+         * set the time when pwmcount was zero to be cur_time - pwmcount=
.
+         * If this write disables the timer increment
+         * convert back from pwmcount to the time in ticks
+         * when pwmcount was zero.
+         */
+        if ((!HAS_PWM_EN_BITS(s->pwmcfg) && HAS_PWM_EN_BITS(value)) ||
+            (HAS_PWM_EN_BITS(s->pwmcfg) && !HAS_PWM_EN_BITS(value))) {
+            s->tick_offset =3D (now - s->tick_offset) & PWMCOUNT_MASK;
+        }
+
+        s->pwmcfg =3D value;
+        break;
+    case A_COUNT:
+        /* The guest changed the counter, updated the offset value. */
+        new_offset =3D value;
+
+        if (HAS_PWM_EN_BITS(s->pwmcfg)) {
+            new_offset =3D now - new_offset;
+        }
+
+        s->tick_offset =3D new_offset;
+        break;
+    case A_PWMS:
+        scale =3D sifive_pwm_compute_scale(s);
+        new_offset =3D (((value & PWMCMP_MASK) << scale) & PWMCOUNT_MASK=
);
+
+        if (HAS_PWM_EN_BITS(s->pwmcfg)) {
+            new_offset =3D now - new_offset;
+        }
+
+        s->tick_offset =3D new_offset;
+        break;
+    case A_PWMCMP0:
+        s->pwmcmp[0] =3D value & PWMCMP_MASK;
+        break;
+    case A_PWMCMP1:
+        s->pwmcmp[1] =3D value & PWMCMP_MASK;
+        break;
+    case A_PWMCMP2:
+        s->pwmcmp[2] =3D value & PWMCMP_MASK;
+        break;
+    case A_PWMCMP3:
+        s->pwmcmp[3] =3D value & PWMCMP_MASK;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, add=
r);
+    }
+
+    /* Update the alarms to reflect possible updated values */
+    sifive_pwm_set_alarms(s);
+}
+
+static void sifive_pwm_reset(DeviceState *dev)
+{
+    SiFivePwmState *s =3D SIFIVE_PWM(dev);
+    uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+
+    s->pwmcfg =3D 0x00000000;
+    s->pwmcmp[0] =3D 0x00000000;
+    s->pwmcmp[1] =3D 0x00000000;
+    s->pwmcmp[2] =3D 0x00000000;
+    s->pwmcmp[3] =3D 0x00000000;
+
+    s->tick_offset =3D sifive_pwm_ns_to_ticks(s, now);
+}
+
+static const MemoryRegionOps sifive_pwm_ops =3D {
+    .read =3D sifive_pwm_read,
+    .write =3D sifive_pwm_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+};
+
+static const VMStateDescription vmstate_sifive_pwm =3D {
+    .name =3D TYPE_SIFIVE_PWM,
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_TIMER_ARRAY(timer, SiFivePwmState, 4),
+        VMSTATE_UINT64(tick_offset, SiFivePwmState),
+        VMSTATE_UINT32(pwmcfg, SiFivePwmState),
+        VMSTATE_UINT32_ARRAY(pwmcmp, SiFivePwmState, 4),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property sifive_pwm_properties[] =3D {
+    /* 0.5Ghz per spec after FSBL */
+    DEFINE_PROP_UINT64("clock-frequency", struct SiFivePwmState,
+                       freq_hz, 500000000ULL),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sifive_pwm_init(Object *obj)
+{
+    SiFivePwmState *s =3D SIFIVE_PWM(obj);
+    int i;
+
+    for (i =3D 0; i < SIFIVE_PWM_IRQS; i++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irqs[i]);
+    }
+
+    memory_region_init_io(&s->mmio, obj, &sifive_pwm_ops, s,
+                          TYPE_SIFIVE_PWM, 0x100);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+}
+
+static void sifive_pwm_realize(DeviceState *dev, Error **errp)
+{
+    SiFivePwmState *s =3D SIFIVE_PWM(dev);
+
+    timer_init_ns(&s->timer[0], QEMU_CLOCK_VIRTUAL,
+                  sifive_pwm_interrupt_0, s);
+
+    timer_init_ns(&s->timer[1], QEMU_CLOCK_VIRTUAL,
+                  sifive_pwm_interrupt_1, s);
+
+    timer_init_ns(&s->timer[2], QEMU_CLOCK_VIRTUAL,
+                  sifive_pwm_interrupt_2, s);
+
+    timer_init_ns(&s->timer[3], QEMU_CLOCK_VIRTUAL,
+                  sifive_pwm_interrupt_3, s);
+}
+
+static void sifive_pwm_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->reset =3D sifive_pwm_reset;
+    device_class_set_props(dc, sifive_pwm_properties);
+    dc->vmsd =3D &vmstate_sifive_pwm;
+    dc->realize =3D sifive_pwm_realize;
+}
+
+static const TypeInfo sifive_pwm_info =3D {
+    .name          =3D TYPE_SIFIVE_PWM,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(SiFivePwmState),
+    .instance_init =3D sifive_pwm_init,
+    .class_init    =3D sifive_pwm_class_init,
+};
+
+static void sifive_pwm_register_types(void)
+{
+    type_register_static(&sifive_pwm_info);
+}
+
+type_init(sifive_pwm_register_types)
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 1e73da7e12..010be7ed1f 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -25,6 +25,9 @@ config ALLWINNER_A10_PIT
     bool
     select PTIMER
=20
+config SIFIVE_PWM
+    bool
+
 config STM32F2XX_TIMER
     bool
=20
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index e67478a8f1..03092e2ceb 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -35,5 +35,6 @@ softmmu_ss.add(when: 'CONFIG_STELLARIS_GPTM', if_true: =
files('stellaris-gptm.c')
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx=
_timer.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
 specific_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_timer.c'))
+softmmu_ss.add(when: 'CONFIG_SIFIVE_PWM', if_true: files('sifive_pwm.c')=
)
=20
 specific_ss.add(when: 'CONFIG_AVR_TIMER16', if_true: files('avr_timer16.=
c'))
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 5234c0ea9e..d0edcd2a80 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -88,3 +88,9 @@ sse_counter_reset(void) "SSE system counter: reset"
 sse_timer_read(uint64_t offset, uint64_t data, unsigned size) "SSE syste=
m timer read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 sse_timer_write(uint64_t offset, uint64_t data, unsigned size) "SSE syst=
em timer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 sse_timer_reset(void) "SSE system timer: reset"
+
+# sifive_pwm.c
+sifive_pwm_set_alarm(uint64_t alarm, uint64_t now) "Setting alarm to: 0x=
%" PRIx64 ", now: 0x%" PRIx64
+sifive_pwm_interrupt(int num) "Interrupt %d"
+sifive_pwm_read(uint64_t offset) "Read at address: 0x%" PRIx64
+sifive_pwm_write(uint64_t data, uint64_t offset) "Write 0x%" PRIx64 " at=
 address: 0x%" PRIx64
--=20
2.31.1


