Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F512EF7FA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:17:40 +0100 (CET)
Received: from localhost ([::1]:52408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxGV-0004R6-2b
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:17:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3IK74XwgKCmUZXKDRWVKJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--wuhaotsh.bounces.google.com>)
 id 1kxx9l-00019g-4L
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:10:42 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:43108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3IK74XwgKCmUZXKDRWVKJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--wuhaotsh.bounces.google.com>)
 id 1kxx9X-0007K4-RN
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:10:39 -0500
Received: by mail-pj1-x1049.google.com with SMTP id c21so7520373pjr.8
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 11:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=0mxuQctenD5q3cEFitgZ8dhJ0SSY9BkENI18PY6j88g=;
 b=K3+5waLLSbNbklG+Af8imabSddv//PqX33BAAjpv8jP4lbS2kaFAaDBAItA6zoENUb
 YtayqjC/JRITjOXoovzS/ko9l6HOTVP1B72VziVn4ImD5j7KkpgUaIQgYjEg8FFBPFoL
 Gaci1Q3ZFdhA071H2Nd5/ta1s6w+bHUq/R3bolE1m9vwatzSIEGSHSLPlv7B7FdezBNw
 9xx4OlUiLFvS8nNCvTvicTwfrx6oMnQ7b+GSzwwwtNTL95jN+i5/CO+7RQHJlOYs+LxT
 l6qw9iBvKeMj8D8LD4eeDSZWlZrKDEkpGrRSP/l6kbEz1kx/w8CevGg9AEf/t0/NTpfB
 PtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=0mxuQctenD5q3cEFitgZ8dhJ0SSY9BkENI18PY6j88g=;
 b=dJd35yREulpnjWXnxXoZ3XR/7NULHmhXLoFwR2+aWwngcAgoRrrT4nNyzNwhywnpfe
 ijCl57ewqJMmQCy2BTMf3wsBlEaKkOypCZz5saa/02HGa0EycipFDjT48qmREAUrqMfv
 /buyoiVhbUaBIsdQAOz360Is4gwJbnRnfR++Bsp7fsfz7m0E36+cH2PZSubZsSigXhZO
 ruRvICla0JfjuRp0Cge+yIEePWMQPC71bCa7qAEsQ3sbOAedtmSoNlvk5yie2qc0ZUa/
 zJ7Jqh8AP3PRUq/gP63JJ9Ox2HImeyRZlu6v2QvtllgoBxMElKPmYIAbA+gnKmu0FCgt
 +9wQ==
X-Gm-Message-State: AOAM530gbRxW9G3KgmHhRyeESX5e+uzScizdfvvLwgGiTNOGR9WeE7Jw
 uNp7MNUNzpmEtAcrK2yzp0vvLrC73qQKnQ==
X-Google-Smtp-Source: ABdhPJxd5dnJ3XbU3ZEX7ZbaO6F4zubvXzTkpEE+wVnvO3YPUREzMkciETDzOL8TN6YndjeWM+oi1KK1N2g4SA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:d90e:: with SMTP id
 c14mr5116993pjv.85.1610133024194; Fri, 08 Jan 2021 11:10:24 -0800 (PST)
Date: Fri,  8 Jan 2021 11:09:40 -0800
In-Reply-To: <20210108190945.949196-1-wuhaotsh@google.com>
Message-Id: <20210108190945.949196-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210108190945.949196-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v5 1/6] hw/misc: Add clock converter in NPCM7XX CLK module
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3IK74XwgKCmUZXKDRWVKJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

This patch allows NPCM7XX CLK module to compute clocks that are used by
other NPCM7XX modules.

Add a new struct NPCM7xxClockConverterState which represents a
single converter.  Each clock converter in CLK module represents one
converter in NPCM7XX CLK Module(PLL, SEL or Divider). Each converter
takes one or more input clocks and converts them into one output clock.
They form a clock hierarchy in the CLK module and are responsible for
outputing clocks for various other modules in an NPCM7XX SoC.

Each converter has a function pointer called "convert" which represents
the unique logic for that converter.

The clock contains two initialization information: ConverterInitInfo and
ConverterConnectionInfo. They represent the vertices and edges in the
clock diagram respectively.

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/npcm7xx_clk.c         | 795 +++++++++++++++++++++++++++++++++-
 include/hw/misc/npcm7xx_clk.h | 140 +++++-
 2 files changed, 927 insertions(+), 8 deletions(-)

diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
index 6732437fe2..48bc9bdda5 100644
--- a/hw/misc/npcm7xx_clk.c
+++ b/hw/misc/npcm7xx_clk.c
@@ -18,6 +18,7 @@
 
 #include "hw/misc/npcm7xx_clk.h"
 #include "hw/timer/npcm7xx_timer.h"
+#include "hw/qdev-clock.h"
 #include "migration/vmstate.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
@@ -27,9 +28,22 @@
 #include "trace.h"
 #include "sysemu/watchdog.h"
 
+/*
+ * The reference clock hz, and the SECCNT and CNTR25M registers in this module,
+ * is always 25 MHz.
+ */
+#define NPCM7XX_CLOCK_REF_HZ            (25000000)
+
+/* Register Field Definitions */
+#define NPCM7XX_CLK_WDRCR_CA9C  BIT(0) /* Cortex A9 Cores */
+
 #define PLLCON_LOKI     BIT(31)
 #define PLLCON_LOKS     BIT(30)
 #define PLLCON_PWDEN    BIT(12)
+#define PLLCON_FBDV(con) extract32((con), 16, 12)
+#define PLLCON_OTDV2(con) extract32((con), 13, 3)
+#define PLLCON_OTDV1(con) extract32((con), 8, 3)
+#define PLLCON_INDV(con) extract32((con), 0, 6)
 
 enum NPCM7xxCLKRegisters {
     NPCM7XX_CLK_CLKEN1,
@@ -89,12 +103,609 @@ static const uint32_t cold_reset_values[NPCM7XX_CLK_NR_REGS] = {
     [NPCM7XX_CLK_AHBCKFI]       = 0x000000c8,
 };
 
-/* Register Field Definitions */
-#define NPCM7XX_CLK_WDRCR_CA9C  BIT(0) /* Cortex A9 Cores */
-
 /* The number of watchdogs that can trigger a reset. */
 #define NPCM7XX_NR_WATCHDOGS    (3)
 
+/* Clock converter functions */
+
+#define TYPE_NPCM7XX_CLOCK_PLL "npcm7xx-clock-pll"
+#define NPCM7XX_CLOCK_PLL(obj) OBJECT_CHECK(NPCM7xxClockPLLState, \
+        (obj), TYPE_NPCM7XX_CLOCK_PLL)
+#define TYPE_NPCM7XX_CLOCK_SEL "npcm7xx-clock-sel"
+#define NPCM7XX_CLOCK_SEL(obj) OBJECT_CHECK(NPCM7xxClockSELState, \
+        (obj), TYPE_NPCM7XX_CLOCK_SEL)
+#define TYPE_NPCM7XX_CLOCK_DIVIDER "npcm7xx-clock-divider"
+#define NPCM7XX_CLOCK_DIVIDER(obj) OBJECT_CHECK(NPCM7xxClockDividerState, \
+        (obj), TYPE_NPCM7XX_CLOCK_DIVIDER)
+
+static void npcm7xx_clk_update_pll(void *opaque)
+{
+    NPCM7xxClockPLLState *s = opaque;
+    uint32_t con = s->clk->regs[s->reg];
+    uint64_t freq;
+
+    /* The PLL is grounded if it is not locked yet. */
+    if (con & PLLCON_LOKI) {
+        freq = clock_get_hz(s->clock_in);
+        freq *= PLLCON_FBDV(con);
+        freq /= PLLCON_INDV(con) * PLLCON_OTDV1(con) * PLLCON_OTDV2(con);
+    } else {
+        freq = 0;
+    }
+
+    clock_update_hz(s->clock_out, freq);
+}
+
+static void npcm7xx_clk_update_sel(void *opaque)
+{
+    NPCM7xxClockSELState *s = opaque;
+    uint32_t index = extract32(s->clk->regs[NPCM7XX_CLK_CLKSEL], s->offset,
+            s->len);
+
+    if (index >= s->input_size) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: SEL index: %u out of range\n",
+                      __func__, index);
+        index = 0;
+    }
+    clock_update_hz(s->clock_out, clock_get_hz(s->clock_in[index]));
+}
+
+static void npcm7xx_clk_update_divider(void *opaque)
+{
+    NPCM7xxClockDividerState *s = opaque;
+    uint32_t freq;
+
+    freq = s->divide(s);
+    clock_update_hz(s->clock_out, freq);
+}
+
+static uint32_t divide_by_constant(NPCM7xxClockDividerState *s)
+{
+    return clock_get_hz(s->clock_in) / s->divisor;
+}
+
+static uint32_t divide_by_reg_divisor(NPCM7xxClockDividerState *s)
+{
+    return clock_get_hz(s->clock_in) /
+            (extract32(s->clk->regs[s->reg], s->offset, s->len) + 1);
+}
+
+static uint32_t divide_by_reg_divisor_times_2(NPCM7xxClockDividerState *s)
+{
+    return divide_by_reg_divisor(s) / 2;
+}
+
+static uint32_t shift_by_reg_divisor(NPCM7xxClockDividerState *s)
+{
+    return clock_get_hz(s->clock_in) >>
+        extract32(s->clk->regs[s->reg], s->offset, s->len);
+}
+
+static NPCM7xxClockPLL find_pll_by_reg(enum NPCM7xxCLKRegisters reg)
+{
+    switch (reg) {
+    case NPCM7XX_CLK_PLLCON0:
+        return NPCM7XX_CLOCK_PLL0;
+    case NPCM7XX_CLK_PLLCON1:
+        return NPCM7XX_CLOCK_PLL1;
+    case NPCM7XX_CLK_PLLCON2:
+        return NPCM7XX_CLOCK_PLL2;
+    case NPCM7XX_CLK_PLLCONG:
+        return NPCM7XX_CLOCK_PLLG;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void npcm7xx_clk_update_all_plls(NPCM7xxCLKState *clk)
+{
+    int i;
+
+    for (i = 0; i < NPCM7XX_CLOCK_NR_PLLS; ++i) {
+        npcm7xx_clk_update_pll(&clk->plls[i]);
+    }
+}
+
+static void npcm7xx_clk_update_all_sels(NPCM7xxCLKState *clk)
+{
+    int i;
+
+    for (i = 0; i < NPCM7XX_CLOCK_NR_SELS; ++i) {
+        npcm7xx_clk_update_sel(&clk->sels[i]);
+    }
+}
+
+static void npcm7xx_clk_update_all_dividers(NPCM7xxCLKState *clk)
+{
+    int i;
+
+    for (i = 0; i < NPCM7XX_CLOCK_NR_DIVIDERS; ++i) {
+        npcm7xx_clk_update_divider(&clk->dividers[i]);
+    }
+}
+
+static void npcm7xx_clk_update_all_clocks(NPCM7xxCLKState *clk)
+{
+    clock_update_hz(clk->clkref, NPCM7XX_CLOCK_REF_HZ);
+    npcm7xx_clk_update_all_plls(clk);
+    npcm7xx_clk_update_all_sels(clk);
+    npcm7xx_clk_update_all_dividers(clk);
+}
+
+/* Types of clock sources. */
+typedef enum ClockSrcType {
+    CLKSRC_REF,
+    CLKSRC_PLL,
+    CLKSRC_SEL,
+    CLKSRC_DIV,
+} ClockSrcType;
+
+typedef struct PLLInitInfo {
+    const char *name;
+    ClockSrcType src_type;
+    int src_index;
+    int reg;
+    const char *public_name;
+} PLLInitInfo;
+
+typedef struct SELInitInfo {
+    const char *name;
+    uint8_t input_size;
+    ClockSrcType src_type[NPCM7XX_CLK_SEL_MAX_INPUT];
+    int src_index[NPCM7XX_CLK_SEL_MAX_INPUT];
+    int offset;
+    int len;
+    const char *public_name;
+} SELInitInfo;
+
+typedef struct DividerInitInfo {
+    const char *name;
+    ClockSrcType src_type;
+    int src_index;
+    uint32_t (*divide)(NPCM7xxClockDividerState *s);
+    int reg; /* not used when type == CONSTANT */
+    int offset; /* not used when type == CONSTANT */
+    int len; /* not used when type == CONSTANT */
+    int divisor; /* used only when type == CONSTANT */
+    const char *public_name;
+} DividerInitInfo;
+
+static const PLLInitInfo pll_init_info_list[] = {
+    [NPCM7XX_CLOCK_PLL0] = {
+        .name = "pll0",
+        .src_type = CLKSRC_REF,
+        .reg = NPCM7XX_CLK_PLLCON0,
+    },
+    [NPCM7XX_CLOCK_PLL1] = {
+        .name = "pll1",
+        .src_type = CLKSRC_REF,
+        .reg = NPCM7XX_CLK_PLLCON1,
+    },
+    [NPCM7XX_CLOCK_PLL2] = {
+        .name = "pll2",
+        .src_type = CLKSRC_REF,
+        .reg = NPCM7XX_CLK_PLLCON2,
+    },
+    [NPCM7XX_CLOCK_PLLG] = {
+        .name = "pllg",
+        .src_type = CLKSRC_REF,
+        .reg = NPCM7XX_CLK_PLLCONG,
+    },
+};
+
+static const SELInitInfo sel_init_info_list[] = {
+    [NPCM7XX_CLOCK_PIXCKSEL] = {
+        .name = "pixcksel",
+        .input_size = 2,
+        .src_type = {CLKSRC_PLL, CLKSRC_REF},
+        .src_index = {NPCM7XX_CLOCK_PLLG, 0},
+        .offset = 5,
+        .len = 1,
+        .public_name = "pixel-clock",
+    },
+    [NPCM7XX_CLOCK_MCCKSEL] = {
+        .name = "mccksel",
+        .input_size = 4,
+        .src_type = {CLKSRC_DIV, CLKSRC_REF, CLKSRC_REF,
+            /*MCBPCK, shouldn't be used in normal operation*/
+            CLKSRC_REF},
+        .src_index = {NPCM7XX_CLOCK_PLL1D2, 0, 0, 0},
+        .offset = 12,
+        .len = 2,
+        .public_name = "mc-phy-clock",
+    },
+    [NPCM7XX_CLOCK_CPUCKSEL] = {
+        .name = "cpucksel",
+        .input_size = 4,
+        .src_type = {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_REF,
+            /*SYSBPCK, shouldn't be used in normal operation*/
+            CLKSRC_REF},
+        .src_index = {NPCM7XX_CLOCK_PLL0, NPCM7XX_CLOCK_PLL1D2, 0, 0},
+        .offset = 0,
+        .len = 2,
+        .public_name = "system-clock",
+    },
+    [NPCM7XX_CLOCK_CLKOUTSEL] = {
+        .name = "clkoutsel",
+        .input_size = 5,
+        .src_type = {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_REF,
+            CLKSRC_PLL, CLKSRC_DIV},
+        .src_index = {NPCM7XX_CLOCK_PLL0, NPCM7XX_CLOCK_PLL1D2, 0,
+            NPCM7XX_CLOCK_PLLG, NPCM7XX_CLOCK_PLL2D2},
+        .offset = 18,
+        .len = 3,
+        .public_name = "tock",
+    },
+    [NPCM7XX_CLOCK_UARTCKSEL] = {
+        .name = "uartcksel",
+        .input_size = 4,
+        .src_type = {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_REF, CLKSRC_DIV},
+        .src_index = {NPCM7XX_CLOCK_PLL0, NPCM7XX_CLOCK_PLL1D2, 0,
+            NPCM7XX_CLOCK_PLL2D2},
+        .offset = 8,
+        .len = 2,
+    },
+    [NPCM7XX_CLOCK_TIMCKSEL] = {
+        .name = "timcksel",
+        .input_size = 4,
+        .src_type = {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_REF, CLKSRC_DIV},
+        .src_index = {NPCM7XX_CLOCK_PLL0, NPCM7XX_CLOCK_PLL1D2, 0,
+            NPCM7XX_CLOCK_PLL2D2},
+        .offset = 14,
+        .len = 2,
+    },
+    [NPCM7XX_CLOCK_SDCKSEL] = {
+        .name = "sdcksel",
+        .input_size = 4,
+        .src_type = {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_REF, CLKSRC_DIV},
+        .src_index = {NPCM7XX_CLOCK_PLL0, NPCM7XX_CLOCK_PLL1D2, 0,
+            NPCM7XX_CLOCK_PLL2D2},
+        .offset = 6,
+        .len = 2,
+    },
+    [NPCM7XX_CLOCK_GFXMSEL] = {
+        .name = "gfxmksel",
+        .input_size = 2,
+        .src_type = {CLKSRC_REF, CLKSRC_PLL},
+        .src_index = {0, NPCM7XX_CLOCK_PLL2},
+        .offset = 21,
+        .len = 1,
+    },
+    [NPCM7XX_CLOCK_SUCKSEL] = {
+        .name = "sucksel",
+        .input_size = 4,
+        .src_type = {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_REF, CLKSRC_DIV},
+        .src_index = {NPCM7XX_CLOCK_PLL0, NPCM7XX_CLOCK_PLL1D2, 0,
+            NPCM7XX_CLOCK_PLL2D2},
+        .offset = 10,
+        .len = 2,
+    },
+};
+
+static const DividerInitInfo divider_init_info_list[] = {
+    [NPCM7XX_CLOCK_PLL1D2] = {
+        .name = "pll1d2",
+        .src_type = CLKSRC_PLL,
+        .src_index = NPCM7XX_CLOCK_PLL1,
+        .divide = divide_by_constant,
+        .divisor = 2,
+    },
+    [NPCM7XX_CLOCK_PLL2D2] = {
+        .name = "pll2d2",
+        .src_type = CLKSRC_PLL,
+        .src_index = NPCM7XX_CLOCK_PLL2,
+        .divide = divide_by_constant,
+        .divisor = 2,
+    },
+    [NPCM7XX_CLOCK_MC_DIVIDER] = {
+        .name = "mc-divider",
+        .src_type = CLKSRC_SEL,
+        .src_index = NPCM7XX_CLOCK_MCCKSEL,
+        .divide = divide_by_constant,
+        .divisor = 2,
+        .public_name = "mc-clock"
+    },
+    [NPCM7XX_CLOCK_AXI_DIVIDER] = {
+        .name = "axi-divider",
+        .src_type = CLKSRC_SEL,
+        .src_index = NPCM7XX_CLOCK_CPUCKSEL,
+        .divide = shift_by_reg_divisor,
+        .reg = NPCM7XX_CLK_CLKDIV1,
+        .offset = 0,
+        .len = 1,
+        .public_name = "clk2"
+    },
+    [NPCM7XX_CLOCK_AHB_DIVIDER] = {
+        .name = "ahb-divider",
+        .src_type = CLKSRC_DIV,
+        .src_index = NPCM7XX_CLOCK_AXI_DIVIDER,
+        .divide = divide_by_reg_divisor,
+        .reg = NPCM7XX_CLK_CLKDIV1,
+        .offset = 26,
+        .len = 2,
+        .public_name = "clk4"
+    },
+    [NPCM7XX_CLOCK_AHB3_DIVIDER] = {
+        .name = "ahb3-divider",
+        .src_type = CLKSRC_DIV,
+        .src_index = NPCM7XX_CLOCK_AHB_DIVIDER,
+        .divide = divide_by_reg_divisor,
+        .reg = NPCM7XX_CLK_CLKDIV1,
+        .offset = 6,
+        .len = 5,
+        .public_name = "ahb3-spi3-clock"
+    },
+    [NPCM7XX_CLOCK_SPI0_DIVIDER] = {
+        .name = "spi0-divider",
+        .src_type = CLKSRC_DIV,
+        .src_index = NPCM7XX_CLOCK_AHB_DIVIDER,
+        .divide = divide_by_reg_divisor,
+        .reg = NPCM7XX_CLK_CLKDIV3,
+        .offset = 6,
+        .len = 5,
+        .public_name = "spi0-clock",
+    },
+    [NPCM7XX_CLOCK_SPIX_DIVIDER] = {
+        .name = "spix-divider",
+        .src_type = CLKSRC_DIV,
+        .src_index = NPCM7XX_CLOCK_AHB_DIVIDER,
+        .divide = divide_by_reg_divisor,
+        .reg = NPCM7XX_CLK_CLKDIV3,
+        .offset = 1,
+        .len = 5,
+        .public_name = "spix-clock",
+    },
+    [NPCM7XX_CLOCK_APB1_DIVIDER] = {
+        .name = "apb1-divider",
+        .src_type = CLKSRC_DIV,
+        .src_index = NPCM7XX_CLOCK_AHB_DIVIDER,
+        .divide = shift_by_reg_divisor,
+        .reg = NPCM7XX_CLK_CLKDIV2,
+        .offset = 24,
+        .len = 2,
+        .public_name = "apb1-clock",
+    },
+    [NPCM7XX_CLOCK_APB2_DIVIDER] = {
+        .name = "apb2-divider",
+        .src_type = CLKSRC_DIV,
+        .src_index = NPCM7XX_CLOCK_AHB_DIVIDER,
+        .divide = shift_by_reg_divisor,
+        .reg = NPCM7XX_CLK_CLKDIV2,
+        .offset = 26,
+        .len = 2,
+        .public_name = "apb2-clock",
+    },
+    [NPCM7XX_CLOCK_APB3_DIVIDER] = {
+        .name = "apb3-divider",
+        .src_type = CLKSRC_DIV,
+        .src_index = NPCM7XX_CLOCK_AHB_DIVIDER,
+        .divide = shift_by_reg_divisor,
+        .reg = NPCM7XX_CLK_CLKDIV2,
+        .offset = 28,
+        .len = 2,
+        .public_name = "apb3-clock",
+    },
+    [NPCM7XX_CLOCK_APB4_DIVIDER] = {
+        .name = "apb4-divider",
+        .src_type = CLKSRC_DIV,
+        .src_index = NPCM7XX_CLOCK_AHB_DIVIDER,
+        .divide = shift_by_reg_divisor,
+        .reg = NPCM7XX_CLK_CLKDIV2,
+        .offset = 30,
+        .len = 2,
+        .public_name = "apb4-clock",
+    },
+    [NPCM7XX_CLOCK_APB5_DIVIDER] = {
+        .name = "apb5-divider",
+        .src_type = CLKSRC_DIV,
+        .src_index = NPCM7XX_CLOCK_AHB_DIVIDER,
+        .divide = shift_by_reg_divisor,
+        .reg = NPCM7XX_CLK_CLKDIV2,
+        .offset = 22,
+        .len = 2,
+        .public_name = "apb5-clock",
+    },
+    [NPCM7XX_CLOCK_CLKOUT_DIVIDER] = {
+        .name = "clkout-divider",
+        .src_type = CLKSRC_SEL,
+        .src_index = NPCM7XX_CLOCK_CLKOUTSEL,
+        .divide = divide_by_reg_divisor,
+        .reg = NPCM7XX_CLK_CLKDIV2,
+        .offset = 16,
+        .len = 5,
+        .public_name = "clkout",
+    },
+    [NPCM7XX_CLOCK_UART_DIVIDER] = {
+        .name = "uart-divider",
+        .src_type = CLKSRC_SEL,
+        .src_index = NPCM7XX_CLOCK_UARTCKSEL,
+        .divide = divide_by_reg_divisor,
+        .reg = NPCM7XX_CLK_CLKDIV1,
+        .offset = 16,
+        .len = 5,
+        .public_name = "uart-clock",
+    },
+    [NPCM7XX_CLOCK_TIMER_DIVIDER] = {
+        .name = "timer-divider",
+        .src_type = CLKSRC_SEL,
+        .src_index = NPCM7XX_CLOCK_TIMCKSEL,
+        .divide = divide_by_reg_divisor,
+        .reg = NPCM7XX_CLK_CLKDIV1,
+        .offset = 21,
+        .len = 5,
+        .public_name = "timer-clock",
+    },
+    [NPCM7XX_CLOCK_ADC_DIVIDER] = {
+        .name = "adc-divider",
+        .src_type = CLKSRC_DIV,
+        .src_index = NPCM7XX_CLOCK_TIMER_DIVIDER,
+        .divide = shift_by_reg_divisor,
+        .reg = NPCM7XX_CLK_CLKDIV1,
+        .offset = 28,
+        .len = 3,
+        .public_name = "adc-clock",
+    },
+    [NPCM7XX_CLOCK_MMC_DIVIDER] = {
+        .name = "mmc-divider",
+        .src_type = CLKSRC_SEL,
+        .src_index = NPCM7XX_CLOCK_SDCKSEL,
+        .divide = divide_by_reg_divisor,
+        .reg = NPCM7XX_CLK_CLKDIV1,
+        .offset = 11,
+        .len = 5,
+        .public_name = "mmc-clock",
+    },
+    [NPCM7XX_CLOCK_SDHC_DIVIDER] = {
+        .name = "sdhc-divider",
+        .src_type = CLKSRC_SEL,
+        .src_index = NPCM7XX_CLOCK_SDCKSEL,
+        .divide = divide_by_reg_divisor_times_2,
+        .reg = NPCM7XX_CLK_CLKDIV2,
+        .offset = 0,
+        .len = 4,
+        .public_name = "sdhc-clock",
+    },
+    [NPCM7XX_CLOCK_GFXM_DIVIDER] = {
+        .name = "gfxm-divider",
+        .src_type = CLKSRC_SEL,
+        .src_index = NPCM7XX_CLOCK_GFXMSEL,
+        .divide = divide_by_constant,
+        .divisor = 3,
+        .public_name = "gfxm-clock",
+    },
+    [NPCM7XX_CLOCK_UTMI_DIVIDER] = {
+        .name = "utmi-divider",
+        .src_type = CLKSRC_SEL,
+        .src_index = NPCM7XX_CLOCK_SUCKSEL,
+        .divide = divide_by_reg_divisor,
+        .reg = NPCM7XX_CLK_CLKDIV2,
+        .offset = 8,
+        .len = 5,
+        .public_name = "utmi-clock",
+    },
+};
+
+static void npcm7xx_clk_pll_init(Object *obj)
+{
+    NPCM7xxClockPLLState *pll = NPCM7XX_CLOCK_PLL(obj);
+
+    pll->clock_in = qdev_init_clock_in(DEVICE(pll), "clock-in",
+            npcm7xx_clk_update_pll, pll);
+    pll->clock_out = qdev_init_clock_out(DEVICE(pll), "clock-out");
+}
+
+static void npcm7xx_clk_sel_init(Object *obj)
+{
+    int i;
+    NPCM7xxClockSELState *sel = NPCM7XX_CLOCK_SEL(obj);
+
+    for (i = 0; i < NPCM7XX_CLK_SEL_MAX_INPUT; ++i) {
+        sel->clock_in[i] = qdev_init_clock_in(DEVICE(sel),
+                g_strdup_printf("clock-in[%d]", i),
+                npcm7xx_clk_update_sel, sel);
+    }
+    sel->clock_out = qdev_init_clock_out(DEVICE(sel), "clock-out");
+}
+static void npcm7xx_clk_divider_init(Object *obj)
+{
+    NPCM7xxClockDividerState *div = NPCM7XX_CLOCK_DIVIDER(obj);
+
+    div->clock_in = qdev_init_clock_in(DEVICE(div), "clock-in",
+            npcm7xx_clk_update_divider, div);
+    div->clock_out = qdev_init_clock_out(DEVICE(div), "clock-out");
+}
+
+static void npcm7xx_init_clock_pll(NPCM7xxClockPLLState *pll,
+        NPCM7xxCLKState *clk, const PLLInitInfo *init_info)
+{
+    pll->name = init_info->name;
+    pll->clk = clk;
+    pll->reg = init_info->reg;
+    if (init_info->public_name != NULL) {
+        qdev_alias_clock(DEVICE(pll), "clock-out", DEVICE(clk),
+                init_info->public_name);
+    }
+}
+
+static void npcm7xx_init_clock_sel(NPCM7xxClockSELState *sel,
+        NPCM7xxCLKState *clk, const SELInitInfo *init_info)
+{
+    int input_size = init_info->input_size;
+
+    sel->name = init_info->name;
+    sel->clk = clk;
+    sel->input_size = init_info->input_size;
+    g_assert(input_size <= NPCM7XX_CLK_SEL_MAX_INPUT);
+    sel->offset = init_info->offset;
+    sel->len = init_info->len;
+    if (init_info->public_name != NULL) {
+        qdev_alias_clock(DEVICE(sel), "clock-out", DEVICE(clk),
+                init_info->public_name);
+    }
+}
+
+static void npcm7xx_init_clock_divider(NPCM7xxClockDividerState *div,
+        NPCM7xxCLKState *clk, const DividerInitInfo *init_info)
+{
+    div->name = init_info->name;
+    div->clk = clk;
+
+    div->divide = init_info->divide;
+    if (div->divide == divide_by_constant) {
+        div->divisor = init_info->divisor;
+    } else {
+        div->reg = init_info->reg;
+        div->offset = init_info->offset;
+        div->len = init_info->len;
+    }
+    if (init_info->public_name != NULL) {
+        qdev_alias_clock(DEVICE(div), "clock-out", DEVICE(clk),
+                init_info->public_name);
+    }
+}
+
+static Clock *npcm7xx_get_clock(NPCM7xxCLKState *clk, ClockSrcType type,
+        int index)
+{
+    switch (type) {
+    case CLKSRC_REF:
+        return clk->clkref;
+    case CLKSRC_PLL:
+        return clk->plls[index].clock_out;
+    case CLKSRC_SEL:
+        return clk->sels[index].clock_out;
+    case CLKSRC_DIV:
+        return clk->dividers[index].clock_out;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void npcm7xx_connect_clocks(NPCM7xxCLKState *clk)
+{
+    int i, j;
+    Clock *src;
+
+    for (i = 0; i < NPCM7XX_CLOCK_NR_PLLS; ++i) {
+        src = npcm7xx_get_clock(clk, pll_init_info_list[i].src_type,
+                pll_init_info_list[i].src_index);
+        clock_set_source(clk->plls[i].clock_in, src);
+    }
+    for (i = 0; i < NPCM7XX_CLOCK_NR_SELS; ++i) {
+        for (j = 0; j < sel_init_info_list[i].input_size; ++j) {
+            src = npcm7xx_get_clock(clk, sel_init_info_list[i].src_type[j],
+                    sel_init_info_list[i].src_index[j]);
+            clock_set_source(clk->sels[i].clock_in[j], src);
+        }
+    }
+    for (i = 0; i < NPCM7XX_CLOCK_NR_DIVIDERS; ++i) {
+        src = npcm7xx_get_clock(clk, divider_init_info_list[i].src_type,
+                divider_init_info_list[i].src_index);
+        clock_set_source(clk->dividers[i].clock_in, src);
+    }
+}
+
 static uint64_t npcm7xx_clk_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint32_t reg = offset / sizeof(uint32_t);
@@ -129,7 +740,7 @@ static uint64_t npcm7xx_clk_read(void *opaque, hwaddr offset, unsigned size)
          *
          * The 4 LSBs are always zero: (1e9 / 640) << 4 = 25000000.
          */
-        value = (((now_ns - s->ref_ns) / 640) << 4) % NPCM7XX_TIMER_REF_HZ;
+        value = (((now_ns - s->ref_ns) / 640) << 4) % NPCM7XX_CLOCK_REF_HZ;
         break;
 
     default:
@@ -183,6 +794,20 @@ static void npcm7xx_clk_write(void *opaque, hwaddr offset,
                 value |= (value & PLLCON_LOKS);
             }
         }
+        /* Only update PLL when it is locked. */
+        if (value & PLLCON_LOKI) {
+            npcm7xx_clk_update_pll(&s->plls[find_pll_by_reg(reg)]);
+        }
+        break;
+
+    case NPCM7XX_CLK_CLKSEL:
+        npcm7xx_clk_update_all_sels(s);
+        break;
+
+    case NPCM7XX_CLK_CLKDIV1:
+    case NPCM7XX_CLK_CLKDIV2:
+    case NPCM7XX_CLK_CLKDIV3:
+        npcm7xx_clk_update_all_dividers(s);
         break;
 
     case NPCM7XX_CLK_CNTR25M:
@@ -234,6 +859,7 @@ static void npcm7xx_clk_enter_reset(Object *obj, ResetType type)
     case RESET_TYPE_COLD:
         memcpy(s->regs, cold_reset_values, sizeof(cold_reset_values));
         s->ref_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        npcm7xx_clk_update_all_clocks(s);
         return;
     }
 
@@ -245,6 +871,42 @@ static void npcm7xx_clk_enter_reset(Object *obj, ResetType type)
                   __func__, type);
 }
 
+static void npcm7xx_clk_init_clock_hierarchy(NPCM7xxCLKState *s)
+{
+    int i;
+
+    s->clkref = qdev_init_clock_in(DEVICE(s), "clkref", NULL, NULL);
+
+    /* First pass: init all converter modules */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(pll_init_info_list) != NPCM7XX_CLOCK_NR_PLLS);
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(sel_init_info_list) != NPCM7XX_CLOCK_NR_SELS);
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(divider_init_info_list)
+            != NPCM7XX_CLOCK_NR_DIVIDERS);
+    for (i = 0; i < NPCM7XX_CLOCK_NR_PLLS; ++i) {
+        object_initialize_child(OBJECT(s), pll_init_info_list[i].name,
+                &s->plls[i], TYPE_NPCM7XX_CLOCK_PLL);
+        npcm7xx_init_clock_pll(&s->plls[i], s,
+                &pll_init_info_list[i]);
+    }
+    for (i = 0; i < NPCM7XX_CLOCK_NR_SELS; ++i) {
+        object_initialize_child(OBJECT(s), sel_init_info_list[i].name,
+                &s->sels[i], TYPE_NPCM7XX_CLOCK_SEL);
+        npcm7xx_init_clock_sel(&s->sels[i], s,
+                &sel_init_info_list[i]);
+    }
+    for (i = 0; i < NPCM7XX_CLOCK_NR_DIVIDERS; ++i) {
+        object_initialize_child(OBJECT(s), divider_init_info_list[i].name,
+                &s->dividers[i], TYPE_NPCM7XX_CLOCK_DIVIDER);
+        npcm7xx_init_clock_divider(&s->dividers[i], s,
+                &divider_init_info_list[i]);
+    }
+
+    /* Second pass: connect converter modules */
+    npcm7xx_connect_clocks(s);
+
+    clock_update_hz(s->clkref, NPCM7XX_CLOCK_REF_HZ);
+}
+
 static void npcm7xx_clk_init(Object *obj)
 {
     NPCM7xxCLKState *s = NPCM7XX_CLK(obj);
@@ -252,21 +914,114 @@ static void npcm7xx_clk_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &npcm7xx_clk_ops, s,
                           TYPE_NPCM7XX_CLK, 4 * KiB);
     sysbus_init_mmio(&s->parent, &s->iomem);
+}
+
+static int npcm7xx_clk_post_load(void *opaque, int version_id)
+{
+    if (version_id >= 1) {
+        NPCM7xxCLKState *clk = opaque;
+
+        npcm7xx_clk_update_all_clocks(clk);
+    }
+
+    return 0;
+}
+
+static void npcm7xx_clk_realize(DeviceState *dev, Error **errp)
+{
+    int i;
+    NPCM7xxCLKState *s = NPCM7XX_CLK(dev);
+
     qdev_init_gpio_in_named(DEVICE(s), npcm7xx_clk_perform_watchdog_reset,
             NPCM7XX_WATCHDOG_RESET_GPIO_IN, NPCM7XX_NR_WATCHDOGS);
+    npcm7xx_clk_init_clock_hierarchy(s);
+
+    /* Realize child devices */
+    for (i = 0; i < NPCM7XX_CLOCK_NR_PLLS; ++i) {
+        if (!qdev_realize(DEVICE(&s->plls[i]), NULL, errp)) {
+            return;
+        }
+    }
+    for (i = 0; i < NPCM7XX_CLOCK_NR_SELS; ++i) {
+        if (!qdev_realize(DEVICE(&s->sels[i]), NULL, errp)) {
+            return;
+        }
+    }
+    for (i = 0; i < NPCM7XX_CLOCK_NR_DIVIDERS; ++i) {
+        if (!qdev_realize(DEVICE(&s->dividers[i]), NULL, errp)) {
+            return;
+        }
+    }
 }
 
-static const VMStateDescription vmstate_npcm7xx_clk = {
-    .name = "npcm7xx-clk",
+static const VMStateDescription vmstate_npcm7xx_clk_pll = {
+    .name = "npcm7xx-clock-pll",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields =  (VMStateField[]) {
+        VMSTATE_CLOCK(clock_in, NPCM7xxClockPLLState),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static const VMStateDescription vmstate_npcm7xx_clk_sel = {
+    .name = "npcm7xx-clock-sel",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields =  (VMStateField[]) {
+        VMSTATE_ARRAY_OF_POINTER_TO_STRUCT(clock_in, NPCM7xxClockSELState,
+                NPCM7XX_CLK_SEL_MAX_INPUT, 0, vmstate_clock, Clock),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static const VMStateDescription vmstate_npcm7xx_clk_divider = {
+    .name = "npcm7xx-clock-divider",
     .version_id = 0,
     .minimum_version_id = 0,
+    .fields =  (VMStateField[]) {
+        VMSTATE_CLOCK(clock_in, NPCM7xxClockDividerState),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static const VMStateDescription vmstate_npcm7xx_clk = {
+    .name = "npcm7xx-clk",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = npcm7xx_clk_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, NPCM7xxCLKState, NPCM7XX_CLK_NR_REGS),
         VMSTATE_INT64(ref_ns, NPCM7xxCLKState),
+        VMSTATE_CLOCK(clkref, NPCM7xxCLKState),
         VMSTATE_END_OF_LIST(),
     },
 };
 
+static void npcm7xx_clk_pll_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "NPCM7xx Clock PLL Module";
+    dc->vmsd = &vmstate_npcm7xx_clk_pll;
+}
+
+static void npcm7xx_clk_sel_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "NPCM7xx Clock SEL Module";
+    dc->vmsd = &vmstate_npcm7xx_clk_sel;
+}
+
+static void npcm7xx_clk_divider_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "NPCM7xx Clock Divider Module";
+    dc->vmsd = &vmstate_npcm7xx_clk_divider;
+}
+
 static void npcm7xx_clk_class_init(ObjectClass *klass, void *data)
 {
     ResettableClass *rc = RESETTABLE_CLASS(klass);
@@ -276,9 +1031,34 @@ static void npcm7xx_clk_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "NPCM7xx Clock Control Registers";
     dc->vmsd = &vmstate_npcm7xx_clk;
+    dc->realize = npcm7xx_clk_realize;
     rc->phases.enter = npcm7xx_clk_enter_reset;
 }
 
+static const TypeInfo npcm7xx_clk_pll_info = {
+    .name               = TYPE_NPCM7XX_CLOCK_PLL,
+    .parent             = TYPE_DEVICE,
+    .instance_size      = sizeof(NPCM7xxClockPLLState),
+    .instance_init      = npcm7xx_clk_pll_init,
+    .class_init         = npcm7xx_clk_pll_class_init,
+};
+
+static const TypeInfo npcm7xx_clk_sel_info = {
+    .name               = TYPE_NPCM7XX_CLOCK_SEL,
+    .parent             = TYPE_DEVICE,
+    .instance_size      = sizeof(NPCM7xxClockSELState),
+    .instance_init      = npcm7xx_clk_sel_init,
+    .class_init         = npcm7xx_clk_sel_class_init,
+};
+
+static const TypeInfo npcm7xx_clk_divider_info = {
+    .name               = TYPE_NPCM7XX_CLOCK_DIVIDER,
+    .parent             = TYPE_DEVICE,
+    .instance_size      = sizeof(NPCM7xxClockDividerState),
+    .instance_init      = npcm7xx_clk_divider_init,
+    .class_init         = npcm7xx_clk_divider_class_init,
+};
+
 static const TypeInfo npcm7xx_clk_info = {
     .name               = TYPE_NPCM7XX_CLK,
     .parent             = TYPE_SYS_BUS_DEVICE,
@@ -289,6 +1069,9 @@ static const TypeInfo npcm7xx_clk_info = {
 
 static void npcm7xx_clk_register_type(void)
 {
+    type_register_static(&npcm7xx_clk_pll_info);
+    type_register_static(&npcm7xx_clk_sel_info);
+    type_register_static(&npcm7xx_clk_divider_info);
     type_register_static(&npcm7xx_clk_info);
 }
 type_init(npcm7xx_clk_register_type);
diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h
index 2338fbbdb5..f641f95f3e 100644
--- a/include/hw/misc/npcm7xx_clk.h
+++ b/include/hw/misc/npcm7xx_clk.h
@@ -17,6 +17,7 @@
 #define NPCM7XX_CLK_H
 
 #include "exec/memory.h"
+#include "hw/clock.h"
 #include "hw/sysbus.h"
 
 /*
@@ -33,16 +34,151 @@
 
 #define NPCM7XX_WATCHDOG_RESET_GPIO_IN "npcm7xx-clk-watchdog-reset-gpio-in"
 
-typedef struct NPCM7xxCLKState {
+/* Maximum amount of clock inputs in a SEL module. */
+#define NPCM7XX_CLK_SEL_MAX_INPUT 5
+
+/* PLLs in CLK module. */
+typedef enum NPCM7xxClockPLL {
+    NPCM7XX_CLOCK_PLL0,
+    NPCM7XX_CLOCK_PLL1,
+    NPCM7XX_CLOCK_PLL2,
+    NPCM7XX_CLOCK_PLLG,
+    NPCM7XX_CLOCK_NR_PLLS,
+} NPCM7xxClockPLL;
+
+/* SEL/MUX in CLK module. */
+typedef enum NPCM7xxClockSEL {
+    NPCM7XX_CLOCK_PIXCKSEL,
+    NPCM7XX_CLOCK_MCCKSEL,
+    NPCM7XX_CLOCK_CPUCKSEL,
+    NPCM7XX_CLOCK_CLKOUTSEL,
+    NPCM7XX_CLOCK_UARTCKSEL,
+    NPCM7XX_CLOCK_TIMCKSEL,
+    NPCM7XX_CLOCK_SDCKSEL,
+    NPCM7XX_CLOCK_GFXMSEL,
+    NPCM7XX_CLOCK_SUCKSEL,
+    NPCM7XX_CLOCK_NR_SELS,
+} NPCM7xxClockSEL;
+
+/* Dividers in CLK module. */
+typedef enum NPCM7xxClockDivider {
+    NPCM7XX_CLOCK_PLL1D2, /* PLL1/2 */
+    NPCM7XX_CLOCK_PLL2D2, /* PLL2/2 */
+    NPCM7XX_CLOCK_MC_DIVIDER,
+    NPCM7XX_CLOCK_AXI_DIVIDER,
+    NPCM7XX_CLOCK_AHB_DIVIDER,
+    NPCM7XX_CLOCK_AHB3_DIVIDER,
+    NPCM7XX_CLOCK_SPI0_DIVIDER,
+    NPCM7XX_CLOCK_SPIX_DIVIDER,
+    NPCM7XX_CLOCK_APB1_DIVIDER,
+    NPCM7XX_CLOCK_APB2_DIVIDER,
+    NPCM7XX_CLOCK_APB3_DIVIDER,
+    NPCM7XX_CLOCK_APB4_DIVIDER,
+    NPCM7XX_CLOCK_APB5_DIVIDER,
+    NPCM7XX_CLOCK_CLKOUT_DIVIDER,
+    NPCM7XX_CLOCK_UART_DIVIDER,
+    NPCM7XX_CLOCK_TIMER_DIVIDER,
+    NPCM7XX_CLOCK_ADC_DIVIDER,
+    NPCM7XX_CLOCK_MMC_DIVIDER,
+    NPCM7XX_CLOCK_SDHC_DIVIDER,
+    NPCM7XX_CLOCK_GFXM_DIVIDER, /* divide by 3 */
+    NPCM7XX_CLOCK_UTMI_DIVIDER,
+    NPCM7XX_CLOCK_NR_DIVIDERS,
+} NPCM7xxClockConverter;
+
+typedef struct NPCM7xxCLKState NPCM7xxCLKState;
+
+/**
+ * struct NPCM7xxClockPLLState - A PLL module in CLK module.
+ * @name: The name of the module.
+ * @clk: The CLK module that owns this module.
+ * @clock_in: The input clock of this module.
+ * @clock_out: The output clock of this module.
+ * @reg: The control registers for this PLL module.
+ */
+typedef struct NPCM7xxClockPLLState {
+    DeviceState parent;
+
+    const char *name;
+    NPCM7xxCLKState *clk;
+    Clock *clock_in;
+    Clock *clock_out;
+
+    int reg;
+} NPCM7xxClockPLLState;
+
+/**
+ * struct NPCM7xxClockSELState - A SEL module in CLK module.
+ * @name: The name of the module.
+ * @clk: The CLK module that owns this module.
+ * @input_size: The size of inputs of this module.
+ * @clock_in: The input clocks of this module.
+ * @clock_out: The output clocks of this module.
+ * @offset: The offset of this module in the control register.
+ * @len: The length of this module in the control register.
+ */
+typedef struct NPCM7xxClockSELState {
+    DeviceState parent;
+
+    const char *name;
+    NPCM7xxCLKState *clk;
+    uint8_t input_size;
+    Clock *clock_in[NPCM7XX_CLK_SEL_MAX_INPUT];
+    Clock *clock_out;
+
+    int offset;
+    int len;
+} NPCM7xxClockSELState;
+
+/**
+ * struct NPCM7xxClockDividerState - A Divider module in CLK module.
+ * @name: The name of the module.
+ * @clk: The CLK module that owns this module.
+ * @clock_in: The input clock of this module.
+ * @clock_out: The output clock of this module.
+ * @divide: The function the divider uses to divide the input.
+ * @reg: The index of the control register that contains the divisor.
+ * @offset: The offset of the divisor in the control register.
+ * @len: The length of the divisor in the control register.
+ * @divisor: The divisor for a constant divisor
+ */
+typedef struct NPCM7xxClockDividerState {
+    DeviceState parent;
+
+    const char *name;
+    NPCM7xxCLKState *clk;
+    Clock *clock_in;
+    Clock *clock_out;
+
+    uint32_t (*divide)(struct NPCM7xxClockDividerState *s);
+    union {
+        struct {
+            int reg;
+            int offset;
+            int len;
+        };
+        int divisor;
+    };
+} NPCM7xxClockDividerState;
+
+struct NPCM7xxCLKState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
 
+    /* Clock converters */
+    NPCM7xxClockPLLState plls[NPCM7XX_CLOCK_NR_PLLS];
+    NPCM7xxClockSELState sels[NPCM7XX_CLOCK_NR_SELS];
+    NPCM7xxClockDividerState dividers[NPCM7XX_CLOCK_NR_DIVIDERS];
+
     uint32_t regs[NPCM7XX_CLK_NR_REGS];
 
     /* Time reference for SECCNT and CNTR25M, initialized by power on reset */
     int64_t ref_ns;
-} NPCM7xxCLKState;
+
+    /* The incoming reference clock. */
+    Clock *clkref;
+};
 
 #define TYPE_NPCM7XX_CLK "npcm7xx-clk"
 #define NPCM7XX_CLK(obj) OBJECT_CHECK(NPCM7xxCLKState, (obj), TYPE_NPCM7XX_CLK)
-- 
2.29.2.729.g45daf8777d-goog


