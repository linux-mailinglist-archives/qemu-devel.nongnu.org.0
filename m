Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076E06EDC95
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:30:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prD79-0004L2-Vt; Tue, 25 Apr 2023 03:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vermainfinite@gmail.com>)
 id 1prD77-0004Ki-V2
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:29:26 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vermainfinite@gmail.com>)
 id 1prD72-00043R-0y
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:29:25 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-63b57c49c4cso4563836b3a.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682407757; x=1684999757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xpf2UI7u2Nwi8lJ8aQhL83hHXIiIFQmRsiNxziKchbg=;
 b=N//udKsXuFDIvXsPadYf1/ymv7JLUsawjOz7h4JP9KCzJt/hPU2ZKiJkgrj/yUbxuD
 JfpXvct4/HeK9XYNWRCXxEw+HZj3tg1AXXiasvNHM0apzbydKfRxvX8z1hSvNGhX4VSp
 ELd9oqSOYqASaIKHIhXkuUiK03aamkpPGQBiBuTG+R3vXhahV70KxoyN67hXFYntwLpe
 CcuPvbbMzF4Ff5yW16Jg/oc7t9P/ZhW1pkNd/ItBNWbmjSbXALyuQuALvSsdPAALYDk7
 r4UlCeKJMdzBHA9dL0786SyEg6cTm5bX8to+rMwYxHV2ng4yL5uyWh2pgyMx7ax8U9Bh
 dxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682407757; x=1684999757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xpf2UI7u2Nwi8lJ8aQhL83hHXIiIFQmRsiNxziKchbg=;
 b=AeZS8LrpHHC3cjLClb3GWHOTcL+oPYOecNgAgyipEaM30QCyw84ROoV3G3X83tjsDc
 Ad36t3piZCdkQK5gE9Rxb7N6jIHOl4PeR242X8ymc+G2fCnf8qSN1Rp8kvf3qtvQUcTL
 Sie5dBhqRlJkKpVffnTVqSkKelAKazfMehs9X6Y7AWornkfrI0UAgOeGzia677xRPhY9
 lOlM8/TSCrM/d6NQsOebCjrn5gpLgf/iGthhZohbJHOOonHlDfz83VH2u2/2kC/4CssK
 IJaUfbqC+JGlPiBweQRCihq2zYyFCOfK24fiwbzeMoGS7GQPlHAvUMN5sVXrIGm/pIqf
 DZJw==
X-Gm-Message-State: AC+VfDy/oJwgPrvUXHCItKL0qqT6M+lSVuBfdwCsJltbuSUKPrdGjP9D
 sJCfIqLuSry46OrsPv3jCOmcYU76imBu6Q==
X-Google-Smtp-Source: ACHHUZ5NFFSxHulKstS/5s2oDVDcB3uvxR9+Vz5nB++FvKi05ZOtjO22XMKsavizzjmhfeTa/nE4dQ==
X-Received: by 2002:a05:6a00:1884:b0:640:defd:a6d5 with SMTP id
 x4-20020a056a00188400b00640defda6d5mr5948724pfh.12.1682407755118; 
 Tue, 25 Apr 2023 00:29:15 -0700 (PDT)
Received: from anant-hppaviliongaminglaptop15dk2xxx.. ([106.51.13.146])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a056a00229400b00627fafe49f9sm8633447pfe.106.2023.04.25.00.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:29:14 -0700 (PDT)
From: Anant Verma <vermainfinite@gmail.com>
To: qemu-devel@nongnu.org
Cc: Anant Verma <vermainfinite@gmail.com>
Subject: [PATCH] migration: Replace all tabs with 4 spaces in the ARM subsystem
Date: Tue, 25 Apr 2023 12:58:17 +0530
Message-Id: <20230425072817.447872-1-vermainfinite@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=vermainfinite@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/373

Signed-off-by: Anant Verma <vermainfinite@gmail.com>
---
 hw/adc/max111x.c          |   24 +-
 hw/arm/boot.c             |    8 +-
 hw/arm/mainstone.c        |    8 +-
 hw/arm/nseries.c          |  808 ++++++++++++------------
 hw/arm/omap1.c            | 1026 +++++++++++++++---------------
 hw/arm/omap2.c            | 1236 ++++++++++++++++++-------------------
 hw/arm/omap_sx1.c         |    2 +-
 hw/arm/pxa2xx.c           |  438 ++++++-------
 hw/arm/pxa2xx_gpio.c      |   38 +-
 hw/arm/pxa2xx_pic.c       |   72 +--
 hw/char/omap_uart.c       |   44 +-
 hw/dma/omap_dma.c         |  476 +++++++-------
 hw/dma/pxa2xx_dma.c       |  102 +--
 hw/gpio/omap_gpio.c       |  214 +++----
 hw/gpio/zaurus.c          |   46 +-
 hw/i2c/omap_i2c.c         |  176 +++---
 hw/input/lm832x.c         |   72 +--
 hw/input/tsc2005.c        |  100 +--
 hw/input/tsc210x.c        |  328 +++++-----
 hw/intc/omap_intc.c       |  232 +++----
 hw/misc/cbus.c            |  132 ++--
 hw/misc/mst_fpga.c        |  298 ++++-----
 hw/misc/omap_clk.c        |  934 ++++++++++++++--------------
 hw/misc/omap_gpmc.c       |   86 +--
 hw/misc/omap_l4.c         |   18 +-
 hw/misc/omap_sdrc.c       |  132 ++--
 hw/misc/omap_tap.c        |   28 +-
 hw/sd/omap_mmc.c          |  126 ++--
 hw/sd/pxa2xx_mmci.c       |  108 ++--
 hw/ssi/omap_spi.c         |  142 ++---
 hw/timer/omap_gptimer.c   |   80 +--
 hw/timer/omap_synctimer.c |    4 +-
 hw/timer/pxa2xx_timer.c   |   80 +--
 include/hw/arm/omap.h     |  892 +++++++++++++-------------
 include/hw/arm/pxa.h      |  100 +--
 include/hw/arm/sharpsl.h  |    2 +-
 include/hw/arm/soc_dma.h  |    4 +-
 tcg/arm/tcg-target.h      |    4 +-
 38 files changed, 4310 insertions(+), 4310 deletions(-)

diff --git a/hw/adc/max111x.c b/hw/adc/max111x.c
index e8bf4cccd4..036286a8c6 100644
--- a/hw/adc/max111x.c
+++ b/hw/adc/max111x.c
@@ -18,18 +18,18 @@
 #include "hw/qdev-properties.h"
 
 /* Control-byte bitfields */
-#define CB_PD0		(1 << 0)
-#define CB_PD1		(1 << 1)
-#define CB_SGL		(1 << 2)
-#define CB_UNI		(1 << 3)
-#define CB_SEL0		(1 << 4)
-#define CB_SEL1		(1 << 5)
-#define CB_SEL2		(1 << 6)
-#define CB_START	(1 << 7)
-
-#define CHANNEL_NUM(v, b0, b1, b2)	\
-                        ((((v) >> (2 + (b0))) & 4) |	\
-                         (((v) >> (3 + (b1))) & 2) |	\
+#define CB_PD0      (1 << 0)
+#define CB_PD1      (1 << 1)
+#define CB_SGL      (1 << 2)
+#define CB_UNI      (1 << 3)
+#define CB_SEL0     (1 << 4)
+#define CB_SEL1     (1 << 5)
+#define CB_SEL2     (1 << 6)
+#define CB_START    (1 << 7)
+
+#define CHANNEL_NUM(v, b0, b1, b2)  \
+                        ((((v) >> (2 + (b0))) & 4) |    \
+                         (((v) >> (3 + (b1))) & 2) |    \
                          (((v) >> (4 + (b2))) & 1))
 
 static uint32_t max111x_read(MAX111xState *s)
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 54f6a3e0b3..301e1313c2 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -366,13 +366,13 @@ static void set_kernel_args_old(const struct arm_boot_info *info,
     WRITE_WORD(p, info->ram_size / 4096);
     /* ramdisk_size */
     WRITE_WORD(p, 0);
-#define FLAG_READONLY	1
-#define FLAG_RDLOAD	4
-#define FLAG_RDPROMPT	8
+#define FLAG_READONLY   1
+#define FLAG_RDLOAD 4
+#define FLAG_RDPROMPT   8
     /* flags */
     WRITE_WORD(p, FLAG_READONLY | FLAG_RDLOAD | FLAG_RDPROMPT);
     /* rootdev */
-    WRITE_WORD(p, (31 << 8) | 0);	/* /dev/mtdblock0 */
+    WRITE_WORD(p, (31 << 8) | 0);   /* /dev/mtdblock0 */
     /* video_num_cols */
     WRITE_WORD(p, 0);
     /* video_num_rows */
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 68329c4617..309a714674 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -26,10 +26,10 @@
 #include "cpu.h"
 
 /* Device addresses */
-#define MST_FPGA_PHYS	0x08000000
-#define MST_ETH_PHYS	0x10000300
-#define MST_FLASH_0		0x00000000
-#define MST_FLASH_1		0x04000000
+#define MST_FPGA_PHYS   0x08000000
+#define MST_ETH_PHYS    0x10000300
+#define MST_FLASH_0     0x00000000
+#define MST_FLASH_1     0x04000000
 
 /* IRQ definitions */
 #define MMC_IRQ       0
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 9e49e9e177..7795a30cd9 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -69,73 +69,73 @@ struct n800_s {
 };
 
 /* GPIO pins */
-#define N8X0_TUSB_ENABLE_GPIO		0
-#define N800_MMC2_WP_GPIO		8
-#define N800_UNKNOWN_GPIO0		9	/* out */
-#define N810_MMC2_VIOSD_GPIO		9
-#define N810_HEADSET_AMP_GPIO		10
-#define N800_CAM_TURN_GPIO		12
-#define N810_GPS_RESET_GPIO		12
-#define N800_BLIZZARD_POWERDOWN_GPIO	15
-#define N800_MMC1_WP_GPIO		23
-#define N810_MMC2_VSD_GPIO		23
-#define N8X0_ONENAND_GPIO		26
-#define N810_BLIZZARD_RESET_GPIO	30
-#define N800_UNKNOWN_GPIO2		53	/* out */
-#define N8X0_TUSB_INT_GPIO		58
-#define N8X0_BT_WKUP_GPIO		61
-#define N8X0_STI_GPIO			62
-#define N8X0_CBUS_SEL_GPIO		64
-#define N8X0_CBUS_DAT_GPIO		65
-#define N8X0_CBUS_CLK_GPIO		66
-#define N8X0_WLAN_IRQ_GPIO		87
-#define N8X0_BT_RESET_GPIO		92
-#define N8X0_TEA5761_CS_GPIO		93
-#define N800_UNKNOWN_GPIO		94
-#define N810_TSC_RESET_GPIO		94
-#define N800_CAM_ACT_GPIO		95
-#define N810_GPS_WAKEUP_GPIO		95
-#define N8X0_MMC_CS_GPIO		96
-#define N8X0_WLAN_PWR_GPIO		97
-#define N8X0_BT_HOST_WKUP_GPIO		98
-#define N810_SPEAKER_AMP_GPIO		101
-#define N810_KB_LOCK_GPIO		102
-#define N800_TSC_TS_GPIO		103
-#define N810_TSC_TS_GPIO		106
-#define N8X0_HEADPHONE_GPIO		107
-#define N8X0_RETU_GPIO			108
-#define N800_TSC_KP_IRQ_GPIO		109
-#define N810_KEYBOARD_GPIO		109
-#define N800_BAT_COVER_GPIO		110
-#define N810_SLIDE_GPIO			110
-#define N8X0_TAHVO_GPIO			111
-#define N800_UNKNOWN_GPIO4		112	/* out */
-#define N810_SLEEPX_LED_GPIO		112
-#define N800_TSC_RESET_GPIO		118	/* ? */
-#define N810_AIC33_RESET_GPIO		118
-#define N800_TSC_UNKNOWN_GPIO		119	/* out */
-#define N8X0_TMP105_GPIO		125
+#define N8X0_TUSB_ENABLE_GPIO       0
+#define N800_MMC2_WP_GPIO       8
+#define N800_UNKNOWN_GPIO0      9   /* out */
+#define N810_MMC2_VIOSD_GPIO        9
+#define N810_HEADSET_AMP_GPIO       10
+#define N800_CAM_TURN_GPIO      12
+#define N810_GPS_RESET_GPIO     12
+#define N800_BLIZZARD_POWERDOWN_GPIO    15
+#define N800_MMC1_WP_GPIO       23
+#define N810_MMC2_VSD_GPIO      23
+#define N8X0_ONENAND_GPIO       26
+#define N810_BLIZZARD_RESET_GPIO    30
+#define N800_UNKNOWN_GPIO2      53  /* out */
+#define N8X0_TUSB_INT_GPIO      58
+#define N8X0_BT_WKUP_GPIO       61
+#define N8X0_STI_GPIO           62
+#define N8X0_CBUS_SEL_GPIO      64
+#define N8X0_CBUS_DAT_GPIO      65
+#define N8X0_CBUS_CLK_GPIO      66
+#define N8X0_WLAN_IRQ_GPIO      87
+#define N8X0_BT_RESET_GPIO      92
+#define N8X0_TEA5761_CS_GPIO        93
+#define N800_UNKNOWN_GPIO       94
+#define N810_TSC_RESET_GPIO     94
+#define N800_CAM_ACT_GPIO       95
+#define N810_GPS_WAKEUP_GPIO        95
+#define N8X0_MMC_CS_GPIO        96
+#define N8X0_WLAN_PWR_GPIO      97
+#define N8X0_BT_HOST_WKUP_GPIO      98
+#define N810_SPEAKER_AMP_GPIO       101
+#define N810_KB_LOCK_GPIO       102
+#define N800_TSC_TS_GPIO        103
+#define N810_TSC_TS_GPIO        106
+#define N8X0_HEADPHONE_GPIO     107
+#define N8X0_RETU_GPIO          108
+#define N800_TSC_KP_IRQ_GPIO        109
+#define N810_KEYBOARD_GPIO      109
+#define N800_BAT_COVER_GPIO     110
+#define N810_SLIDE_GPIO         110
+#define N8X0_TAHVO_GPIO         111
+#define N800_UNKNOWN_GPIO4      112 /* out */
+#define N810_SLEEPX_LED_GPIO        112
+#define N800_TSC_RESET_GPIO     118 /* ? */
+#define N810_AIC33_RESET_GPIO       118
+#define N800_TSC_UNKNOWN_GPIO       119 /* out */
+#define N8X0_TMP105_GPIO        125
 
 /* Config */
-#define BT_UART				0
-#define XLDR_LL_UART			1
+#define BT_UART             0
+#define XLDR_LL_UART            1
 
 /* Addresses on the I2C bus 0 */
-#define N810_TLV320AIC33_ADDR		0x18	/* Audio CODEC */
-#define N8X0_TCM825x_ADDR		0x29	/* Camera */
-#define N810_LP5521_ADDR		0x32	/* LEDs */
-#define N810_TSL2563_ADDR		0x3d	/* Light sensor */
-#define N810_LM8323_ADDR		0x45	/* Keyboard */
+#define N810_TLV320AIC33_ADDR       0x18    /* Audio CODEC */
+#define N8X0_TCM825x_ADDR       0x29    /* Camera */
+#define N810_LP5521_ADDR        0x32    /* LEDs */
+#define N810_TSL2563_ADDR       0x3d    /* Light sensor */
+#define N810_LM8323_ADDR        0x45    /* Keyboard */
 /* Addresses on the I2C bus 1 */
-#define N8X0_TMP105_ADDR		0x48	/* Temperature sensor */
-#define N8X0_MENELAUS_ADDR		0x72	/* Power management */
+#define N8X0_TMP105_ADDR        0x48    /* Temperature sensor */
+#define N8X0_MENELAUS_ADDR      0x72    /* Power management */
 
 /* Chipselects on GPMC NOR interface */
-#define N8X0_ONENAND_CS			0
-#define N8X0_USB_ASYNC_CS		1
-#define N8X0_USB_SYNC_CS		4
+#define N8X0_ONENAND_CS         0
+#define N8X0_USB_ASYNC_CS       1
+#define N8X0_USB_SYNC_CS        4
 
-#define N8X0_BD_ADDR			0x00, 0x1a, 0x89, 0x9e, 0x3e, 0x81
+#define N8X0_BD_ADDR            0x00, 0x1a, 0x89, 0x9e, 0x3e, 0x81
 
 static void n800_mmc_cs_cb(void *opaque, int line, int level)
 {
@@ -151,9 +151,9 @@ static void n8x0_gpio_setup(struct n800_s *s)
     qemu_irq_lower(qdev_get_gpio_in(s->mpu->gpio, N800_BAT_COVER_GPIO));
 }
 
-#define MAEMO_CAL_HEADER(...)				\
-    'C',  'o',  'n',  'F',  0x02, 0x00, 0x04, 0x00,	\
-    __VA_ARGS__,					\
+#define MAEMO_CAL_HEADER(...)               \
+    'C',  'o',  'n',  'F',  0x02, 0x00, 0x04, 0x00, \
+    __VA_ARGS__,                    \
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 
 static const uint8_t n8x0_cal_wlan_mac[] = {
@@ -244,7 +244,7 @@ static const MouseTransformInfo n810_pointercal = {
     .a = { 15041, 148, -4731056, 171, -10238, 35933380, 65536 },
 };
 
-#define RETU_KEYCODE	61	/* F3 */
+#define RETU_KEYCODE    61  /* F3 */
 
 static void n800_key_event(void *opaque, int keycode)
 {
@@ -263,20 +263,20 @@ static void n800_key_event(void *opaque, int keycode)
 
 static const int n800_keys[16] = {
     -1,
-    72,	/* Up */
-    63,	/* Home (F5) */
+    72, /* Up */
+    63, /* Home (F5) */
     -1,
-    75,	/* Left */
-    28,	/* Enter */
-    77,	/* Right */
+    75, /* Left */
+    28, /* Enter */
+    77, /* Right */
     -1,
-     1,	/* Cycle (ESC) */
-    80,	/* Down */
-    62,	/* Menu (F4) */
+     1, /* Cycle (ESC) */
+    80, /* Down */
+    62, /* Menu (F4) */
     -1,
-    66,	/* Zoom- (F8) */
-    64,	/* FullScreen (F6) */
-    65,	/* Zoom+ (F7) */
+    66, /* Zoom- (F8) */
+    64, /* FullScreen (F6) */
+    65, /* Zoom+ (F7) */
     -1,
 };
 
@@ -286,7 +286,7 @@ static void n800_tsc_kbd_setup(struct n800_s *s)
 
     /* XXX: are the three pins inverted inside the chip between the
      * tsc and the cpu (N4111)?  */
-    qemu_irq penirq = NULL;	/* NC */
+    qemu_irq penirq = NULL; /* NC */
     qemu_irq kbirq = qdev_get_gpio_in(s->mpu->gpio, N800_TSC_KP_IRQ_GPIO);
     qemu_irq dav = qdev_get_gpio_in(s->mpu->gpio, N800_TSC_TS_GPIO);
 
@@ -334,68 +334,68 @@ static void n810_key_event(void *opaque, int keycode)
     lm832x_key_event(s->kbd, code, !(keycode & 0x80));
 }
 
-#define M	0
+#define M   0
 
 static const int n810_keys[0x80] = {
-    [0x01] = 16,	/* Q */
-    [0x02] = 37,	/* K */
-    [0x03] = 24,	/* O */
-    [0x04] = 25,	/* P */
-    [0x05] = 14,	/* Backspace */
-    [0x06] = 30,	/* A */
-    [0x07] = 31,	/* S */
-    [0x08] = 32,	/* D */
-    [0x09] = 33,	/* F */
-    [0x0a] = 34,	/* G */
-    [0x0b] = 35,	/* H */
-    [0x0c] = 36,	/* J */
-
-    [0x11] = 17,	/* W */
-    [0x12] = 62,	/* Menu (F4) */
-    [0x13] = 38,	/* L */
-    [0x14] = 40,	/* ' (Apostrophe) */
-    [0x16] = 44,	/* Z */
-    [0x17] = 45,	/* X */
-    [0x18] = 46,	/* C */
-    [0x19] = 47,	/* V */
-    [0x1a] = 48,	/* B */
-    [0x1b] = 49,	/* N */
-    [0x1c] = 42,	/* Shift (Left shift) */
-    [0x1f] = 65,	/* Zoom+ (F7) */
-
-    [0x21] = 18,	/* E */
-    [0x22] = 39,	/* ; (Semicolon) */
-    [0x23] = 12,	/* - (Minus) */
-    [0x24] = 13,	/* = (Equal) */
-    [0x2b] = 56,	/* Fn (Left Alt) */
-    [0x2c] = 50,	/* M */
-    [0x2f] = 66,	/* Zoom- (F8) */
-
-    [0x31] = 19,	/* R */
-    [0x32] = 29 | M,	/* Right Ctrl */
-    [0x34] = 57,	/* Space */
-    [0x35] = 51,	/* , (Comma) */
-    [0x37] = 72 | M,	/* Up */
-    [0x3c] = 82 | M,	/* Compose (Insert) */
-    [0x3f] = 64,	/* FullScreen (F6) */
-
-    [0x41] = 20,	/* T */
-    [0x44] = 52,	/* . (Dot) */
-    [0x46] = 77 | M,	/* Right */
-    [0x4f] = 63,	/* Home (F5) */
-    [0x51] = 21,	/* Y */
-    [0x53] = 80 | M,	/* Down */
-    [0x55] = 28,	/* Enter */
-    [0x5f] =  1,	/* Cycle (ESC) */
-
-    [0x61] = 22,	/* U */
-    [0x64] = 75 | M,	/* Left */
-
-    [0x71] = 23,	/* I */
+    [0x01] = 16,    /* Q */
+    [0x02] = 37,    /* K */
+    [0x03] = 24,    /* O */
+    [0x04] = 25,    /* P */
+    [0x05] = 14,    /* Backspace */
+    [0x06] = 30,    /* A */
+    [0x07] = 31,    /* S */
+    [0x08] = 32,    /* D */
+    [0x09] = 33,    /* F */
+    [0x0a] = 34,    /* G */
+    [0x0b] = 35,    /* H */
+    [0x0c] = 36,    /* J */
+
+    [0x11] = 17,    /* W */
+    [0x12] = 62,    /* Menu (F4) */
+    [0x13] = 38,    /* L */
+    [0x14] = 40,    /* ' (Apostrophe) */
+    [0x16] = 44,    /* Z */
+    [0x17] = 45,    /* X */
+    [0x18] = 46,    /* C */
+    [0x19] = 47,    /* V */
+    [0x1a] = 48,    /* B */
+    [0x1b] = 49,    /* N */
+    [0x1c] = 42,    /* Shift (Left shift) */
+    [0x1f] = 65,    /* Zoom+ (F7) */
+
+    [0x21] = 18,    /* E */
+    [0x22] = 39,    /* ; (Semicolon) */
+    [0x23] = 12,    /* - (Minus) */
+    [0x24] = 13,    /* = (Equal) */
+    [0x2b] = 56,    /* Fn (Left Alt) */
+    [0x2c] = 50,    /* M */
+    [0x2f] = 66,    /* Zoom- (F8) */
+
+    [0x31] = 19,    /* R */
+    [0x32] = 29 | M,    /* Right Ctrl */
+    [0x34] = 57,    /* Space */
+    [0x35] = 51,    /* , (Comma) */
+    [0x37] = 72 | M,    /* Up */
+    [0x3c] = 82 | M,    /* Compose (Insert) */
+    [0x3f] = 64,    /* FullScreen (F6) */
+
+    [0x41] = 20,    /* T */
+    [0x44] = 52,    /* . (Dot) */
+    [0x46] = 77 | M,    /* Right */
+    [0x4f] = 63,    /* Home (F5) */
+    [0x51] = 21,    /* Y */
+    [0x53] = 80 | M,    /* Down */
+    [0x55] = 28,    /* Enter */
+    [0x5f] =  1,    /* Cycle (ESC) */
+
+    [0x61] = 22,    /* U */
+    [0x64] = 75 | M,    /* Left */
+
+    [0x71] = 23,    /* I */
 #if 0
-    [0x75] = 28 | M,	/* KP Enter (KP Enter) */
+    [0x75] = 28 | M,    /* KP Enter (KP Enter) */
 #else
-    [0x75] = 15,	/* KP Enter (Tab) */
+    [0x75] = 15,    /* KP Enter (Tab) */
 #endif
 };
 
@@ -453,9 +453,9 @@ static void mipid_reset(struct mipid_s *s)
     s->sleep = 1;
     s->booster = 0;
     s->selfcheck =
-            (1 << 7) |	/* Register loading OK.  */
-            (1 << 5) |	/* The chip is attached.  */
-            (1 << 4);	/* Display glass still in one piece.  */
+            (1 << 7) |  /* Register loading OK.  */
+            (1 << 5) |  /* The chip is attached.  */
+            (1 << 4);   /* Display glass still in one piece.  */
     s->te = 0;
     s->partial = 0;
     s->normal = 1;
@@ -486,38 +486,38 @@ static uint32_t mipid_txrx(void *opaque, uint32_t cmd, int len)
     }
 
     switch (s->cmd) {
-    case 0x00:	/* NOP */
+    case 0x00:  /* NOP */
         break;
 
-    case 0x01:	/* SWRESET */
+    case 0x01:  /* SWRESET */
         mipid_reset(s);
         break;
 
-    case 0x02:	/* BSTROFF */
+    case 0x02:  /* BSTROFF */
         s->booster = 0;
         break;
-    case 0x03:	/* BSTRON */
+    case 0x03:  /* BSTRON */
         s->booster = 1;
         break;
 
-    case 0x04:	/* RDDID */
+    case 0x04:  /* RDDID */
         s->p = 0;
         s->resp[0] = (s->id >> 16) & 0xff;
         s->resp[1] = (s->id >>  8) & 0xff;
         s->resp[2] = (s->id >>  0) & 0xff;
         break;
 
-    case 0x06:	/* RD_RED */
-    case 0x07:	/* RD_GREEN */
+    case 0x06:  /* RD_RED */
+    case 0x07:  /* RD_GREEN */
         /* XXX the bootloader sometimes issues RD_BLUE meaning RDDID so
          * for the bootloader one needs to change this.  */
-    case 0x08:	/* RD_BLUE */
+    case 0x08:  /* RD_BLUE */
         s->p = 0;
         /* TODO: return first pixel components */
         s->resp[0] = 0x01;
         break;
 
-    case 0x09:	/* RDDST */
+    case 0x09:  /* RDDST */
         s->p = 0;
         s->resp[0] = s->booster << 7;
         s->resp[1] = (5 << 4) | (s->partial << 2) |
@@ -527,69 +527,69 @@ static uint32_t mipid_txrx(void *opaque, uint32_t cmd, int len)
         s->resp[3] = s->gamma << 6;
         break;
 
-    case 0x0a:	/* RDDPM */
+    case 0x0a:  /* RDDPM */
         s->p = 0;
         s->resp[0] = (s->onoff << 2) | (s->normal << 3) | (s->sleep << 4) |
                 (s->partial << 5) | (s->sleep << 6) | (s->booster << 7);
         break;
-    case 0x0b:	/* RDDMADCTR */
+    case 0x0b:  /* RDDMADCTR */
         s->p = 0;
         s->resp[0] = 0;
         break;
-    case 0x0c:	/* RDDCOLMOD */
+    case 0x0c:  /* RDDCOLMOD */
         s->p = 0;
-        s->resp[0] = 5;	/* 65K colours */
+        s->resp[0] = 5; /* 65K colours */
         break;
-    case 0x0d:	/* RDDIM */
+    case 0x0d:  /* RDDIM */
         s->p = 0;
         s->resp[0] = (s->invert << 5) | (s->vscr << 7) | s->gamma;
         break;
-    case 0x0e:	/* RDDSM */
+    case 0x0e:  /* RDDSM */
         s->p = 0;
         s->resp[0] = s->te << 7;
         break;
-    case 0x0f:	/* RDDSDR */
+    case 0x0f:  /* RDDSDR */
         s->p = 0;
         s->resp[0] = s->selfcheck;
         break;
 
-    case 0x10:	/* SLPIN */
+    case 0x10:  /* SLPIN */
         s->sleep = 1;
         break;
-    case 0x11:	/* SLPOUT */
+    case 0x11:  /* SLPOUT */
         s->sleep = 0;
-        s->selfcheck ^= 1 << 6;	/* POFF self-diagnosis Ok */
+        s->selfcheck ^= 1 << 6; /* POFF self-diagnosis Ok */
         break;
 
-    case 0x12:	/* PTLON */
+    case 0x12:  /* PTLON */
         s->partial = 1;
         s->normal = 0;
         s->vscr = 0;
         break;
-    case 0x13:	/* NORON */
+    case 0x13:  /* NORON */
         s->partial = 0;
         s->normal = 1;
         s->vscr = 0;
         break;
 
-    case 0x20:	/* INVOFF */
+    case 0x20:  /* INVOFF */
         s->invert = 0;
         break;
-    case 0x21:	/* INVON */
+    case 0x21:  /* INVON */
         s->invert = 1;
         break;
 
-    case 0x22:	/* APOFF */
-    case 0x23:	/* APON */
+    case 0x22:  /* APOFF */
+    case 0x23:  /* APON */
         goto bad_cmd;
 
-    case 0x25:	/* WRCNTR */
+    case 0x25:  /* WRCNTR */
         if (s->pm < 0) {
             s->pm = 1;
         }
         goto bad_cmd;
 
-    case 0x26:	/* GAMSET */
+    case 0x26:  /* GAMSET */
         if (!s->pm) {
             s->gamma = ctz32(s->param[0] & 0xf);
             if (s->gamma == 32) {
@@ -600,26 +600,26 @@ static uint32_t mipid_txrx(void *opaque, uint32_t cmd, int len)
         }
         break;
 
-    case 0x28:	/* DISPOFF */
+    case 0x28:  /* DISPOFF */
         s->onoff = 0;
         break;
-    case 0x29:	/* DISPON */
+    case 0x29:  /* DISPON */
         s->onoff = 1;
         break;
 
-    case 0x2a:	/* CASET */
-    case 0x2b:	/* RASET */
-    case 0x2c:	/* RAMWR */
-    case 0x2d:	/* RGBSET */
-    case 0x2e:	/* RAMRD */
-    case 0x30:	/* PTLAR */
-    case 0x33:	/* SCRLAR */
+    case 0x2a:  /* CASET */
+    case 0x2b:  /* RASET */
+    case 0x2c:  /* RAMWR */
+    case 0x2d:  /* RGBSET */
+    case 0x2e:  /* RAMRD */
+    case 0x30:  /* PTLAR */
+    case 0x33:  /* SCRLAR */
         goto bad_cmd;
 
-    case 0x34:	/* TEOFF */
+    case 0x34:  /* TEOFF */
         s->te = 0;
         break;
-    case 0x35:	/* TEON */
+    case 0x35:  /* TEON */
         if (!s->pm) {
             s->te = 1;
         } else if (s->pm < 0) {
@@ -627,67 +627,67 @@ static uint32_t mipid_txrx(void *opaque, uint32_t cmd, int len)
         }
         break;
 
-    case 0x36:	/* MADCTR */
+    case 0x36:  /* MADCTR */
         goto bad_cmd;
 
-    case 0x37:	/* VSCSAD */
+    case 0x37:  /* VSCSAD */
         s->partial = 0;
         s->normal = 0;
         s->vscr = 1;
         break;
 
-    case 0x38:	/* IDMOFF */
-    case 0x39:	/* IDMON */
-    case 0x3a:	/* COLMOD */
+    case 0x38:  /* IDMOFF */
+    case 0x39:  /* IDMON */
+    case 0x3a:  /* COLMOD */
         goto bad_cmd;
 
-    case 0xb0:	/* CLKINT / DISCTL */
-    case 0xb1:	/* CLKEXT */
+    case 0xb0:  /* CLKINT / DISCTL */
+    case 0xb1:  /* CLKEXT */
         if (s->pm < 0) {
             s->pm = 2;
         }
         break;
 
-    case 0xb4:	/* FRMSEL */
+    case 0xb4:  /* FRMSEL */
         break;
 
-    case 0xb5:	/* FRM8SEL */
-    case 0xb6:	/* TMPRNG / INIESC */
-    case 0xb7:	/* TMPHIS / NOP2 */
-    case 0xb8:	/* TMPREAD / MADCTL */
-    case 0xba:	/* DISTCTR */
-    case 0xbb:	/* EPVOL */
+    case 0xb5:  /* FRM8SEL */
+    case 0xb6:  /* TMPRNG / INIESC */
+    case 0xb7:  /* TMPHIS / NOP2 */
+    case 0xb8:  /* TMPREAD / MADCTL */
+    case 0xba:  /* DISTCTR */
+    case 0xbb:  /* EPVOL */
         goto bad_cmd;
 
-    case 0xbd:	/* Unknown */
+    case 0xbd:  /* Unknown */
         s->p = 0;
         s->resp[0] = 0;
         s->resp[1] = 1;
         break;
 
-    case 0xc2:	/* IFMOD */
+    case 0xc2:  /* IFMOD */
         if (s->pm < 0) {
             s->pm = 2;
         }
         break;
 
-    case 0xc6:	/* PWRCTL */
-    case 0xc7:	/* PPWRCTL */
-    case 0xd0:	/* EPWROUT */
-    case 0xd1:	/* EPWRIN */
-    case 0xd4:	/* RDEV */
-    case 0xd5:	/* RDRR */
+    case 0xc6:  /* PWRCTL */
+    case 0xc7:  /* PPWRCTL */
+    case 0xd0:  /* EPWROUT */
+    case 0xd1:  /* EPWRIN */
+    case 0xd4:  /* RDEV */
+    case 0xd5:  /* RDRR */
         goto bad_cmd;
 
-    case 0xda:	/* RDID1 */
+    case 0xda:  /* RDID1 */
         s->p = 0;
         s->resp[0] = (s->id >> 16) & 0xff;
         break;
-    case 0xdb:	/* RDID2 */
+    case 0xdb:  /* RDID2 */
         s->p = 0;
         s->resp[0] = (s->id >>  8) & 0xff;
         break;
-    case 0xdc:	/* RDID3 */
+    case 0xdc:  /* RDID3 */
         s->p = 0;
         s->resp[0] = (s->id >>  0) & 0xff;
         break;
@@ -727,38 +727,38 @@ static void n800_dss_init(struct rfbi_chip_s *chip)
 {
     uint8_t *fb_blank;
 
-    chip->write(chip->opaque, 0, 0x2a);		/* LCD Width register */
+    chip->write(chip->opaque, 0, 0x2a);     /* LCD Width register */
     chip->write(chip->opaque, 1, 0x64);
-    chip->write(chip->opaque, 0, 0x2c);		/* LCD HNDP register */
+    chip->write(chip->opaque, 0, 0x2c);     /* LCD HNDP register */
     chip->write(chip->opaque, 1, 0x1e);
-    chip->write(chip->opaque, 0, 0x2e);		/* LCD Height 0 register */
+    chip->write(chip->opaque, 0, 0x2e);     /* LCD Height 0 register */
     chip->write(chip->opaque, 1, 0xe0);
-    chip->write(chip->opaque, 0, 0x30);		/* LCD Height 1 register */
+    chip->write(chip->opaque, 0, 0x30);     /* LCD Height 1 register */
     chip->write(chip->opaque, 1, 0x01);
-    chip->write(chip->opaque, 0, 0x32);		/* LCD VNDP register */
+    chip->write(chip->opaque, 0, 0x32);     /* LCD VNDP register */
     chip->write(chip->opaque, 1, 0x06);
-    chip->write(chip->opaque, 0, 0x68);		/* Display Mode register */
-    chip->write(chip->opaque, 1, 1);		/* Enable bit */
-
-    chip->write(chip->opaque, 0, 0x6c);	
-    chip->write(chip->opaque, 1, 0x00);		/* Input X Start Position */
-    chip->write(chip->opaque, 1, 0x00);		/* Input X Start Position */
-    chip->write(chip->opaque, 1, 0x00);		/* Input Y Start Position */
-    chip->write(chip->opaque, 1, 0x00);		/* Input Y Start Position */
-    chip->write(chip->opaque, 1, 0x1f);		/* Input X End Position */
-    chip->write(chip->opaque, 1, 0x03);		/* Input X End Position */
-    chip->write(chip->opaque, 1, 0xdf);		/* Input Y End Position */
-    chip->write(chip->opaque, 1, 0x01);		/* Input Y End Position */
-    chip->write(chip->opaque, 1, 0x00);		/* Output X Start Position */
-    chip->write(chip->opaque, 1, 0x00);		/* Output X Start Position */
-    chip->write(chip->opaque, 1, 0x00);		/* Output Y Start Position */
-    chip->write(chip->opaque, 1, 0x00);		/* Output Y Start Position */
-    chip->write(chip->opaque, 1, 0x1f);		/* Output X End Position */
-    chip->write(chip->opaque, 1, 0x03);		/* Output X End Position */
-    chip->write(chip->opaque, 1, 0xdf);		/* Output Y End Position */
-    chip->write(chip->opaque, 1, 0x01);		/* Output Y End Position */
-    chip->write(chip->opaque, 1, 0x01);		/* Input Data Format */
-    chip->write(chip->opaque, 1, 0x01);		/* Data Source Select */
+    chip->write(chip->opaque, 0, 0x68);     /* Display Mode register */
+    chip->write(chip->opaque, 1, 1);        /* Enable bit */
+
+    chip->write(chip->opaque, 0, 0x6c); 
+    chip->write(chip->opaque, 1, 0x00);     /* Input X Start Position */
+    chip->write(chip->opaque, 1, 0x00);     /* Input X Start Position */
+    chip->write(chip->opaque, 1, 0x00);     /* Input Y Start Position */
+    chip->write(chip->opaque, 1, 0x00);     /* Input Y Start Position */
+    chip->write(chip->opaque, 1, 0x1f);     /* Input X End Position */
+    chip->write(chip->opaque, 1, 0x03);     /* Input X End Position */
+    chip->write(chip->opaque, 1, 0xdf);     /* Input Y End Position */
+    chip->write(chip->opaque, 1, 0x01);     /* Input Y End Position */
+    chip->write(chip->opaque, 1, 0x00);     /* Output X Start Position */
+    chip->write(chip->opaque, 1, 0x00);     /* Output X Start Position */
+    chip->write(chip->opaque, 1, 0x00);     /* Output Y Start Position */
+    chip->write(chip->opaque, 1, 0x00);     /* Output Y Start Position */
+    chip->write(chip->opaque, 1, 0x1f);     /* Output X End Position */
+    chip->write(chip->opaque, 1, 0x03);     /* Output X End Position */
+    chip->write(chip->opaque, 1, 0xdf);     /* Output Y End Position */
+    chip->write(chip->opaque, 1, 0x01);     /* Output Y End Position */
+    chip->write(chip->opaque, 1, 0x01);     /* Input Data Format */
+    chip->write(chip->opaque, 1, 0x01);     /* Data Source Select */
 
     fb_blank = memset(g_malloc(800 * 480 * 2), 0xff, 800 * 480 * 2);
     /* Display Memory Data Port */
@@ -864,9 +864,9 @@ static void n800_setup_nolo_tags(void *sram_base)
 
     /* The NOLO tags start here */
     p = sram_base + 0x9000;
-#define ADD_TAG(tag, len)				\
-    stw_p((uint16_t *) p + 0, tag);			\
-    stw_p((uint16_t *) p + 1, len); p++;		\
+#define ADD_TAG(tag, len)               \
+    stw_p((uint16_t *) p + 0, tag);         \
+    stw_p((uint16_t *) p + 1, len); p++;        \
     stl_p(p++, OMAP2_SRAM_BASE | (((void *) v - sram_base) & 0xffff));
 
     /* OMAP STI console? Pin out settings? */
@@ -881,91 +881,91 @@ static void n800_setup_nolo_tags(void *sram_base)
 
     /* NOLO serial console */
     ADD_TAG(0x6e02, 4);
-    stl_p(v++, XLDR_LL_UART);		/* UART number (1 - 3) */
+    stl_p(v++, XLDR_LL_UART);       /* UART number (1 - 3) */
 
 #if 0
     /* CBUS settings (Retu/AVilma) */
     ADD_TAG(0x6e03, 6);
-    stw_p((uint16_t *) v + 0, 65);	/* CBUS GPIO0 */
-    stw_p((uint16_t *) v + 1, 66);	/* CBUS GPIO1 */
-    stw_p((uint16_t *) v + 2, 64);	/* CBUS GPIO2 */
+    stw_p((uint16_t *) v + 0, 65);  /* CBUS GPIO0 */
+    stw_p((uint16_t *) v + 1, 66);  /* CBUS GPIO1 */
+    stw_p((uint16_t *) v + 2, 64);  /* CBUS GPIO2 */
     v += 2;
 #endif
 
     /* Nokia ASIC BB5 (Retu/Tahvo) */
     ADD_TAG(0x6e0a, 4);
-    stw_p((uint16_t *) v + 0, 111);	/* "Retu" interrupt GPIO */
-    stw_p((uint16_t *) v + 1, 108);	/* "Tahvo" interrupt GPIO */
+    stw_p((uint16_t *) v + 0, 111); /* "Retu" interrupt GPIO */
+    stw_p((uint16_t *) v + 1, 108); /* "Tahvo" interrupt GPIO */
     v++;
 
     /* LCD console? */
     ADD_TAG(0x6e04, 4);
-    stw_p((uint16_t *) v + 0, 30);	/* ??? */
-    stw_p((uint16_t *) v + 1, 24);	/* ??? */
+    stw_p((uint16_t *) v + 0, 30);  /* ??? */
+    stw_p((uint16_t *) v + 1, 24);  /* ??? */
     v++;
 
 #if 0
     /* LCD settings */
     ADD_TAG(0x6e06, 2);
-    stw_p((uint16_t *) (v++), 15);	/* ??? */
+    stw_p((uint16_t *) (v++), 15);  /* ??? */
 #endif
 
     /* I^2C (Menelaus) */
     ADD_TAG(0x6e07, 4);
-    stl_p(v++, 0x00720000);		/* ??? */
+    stl_p(v++, 0x00720000);     /* ??? */
 
     /* Unknown */
     ADD_TAG(0x6e0b, 6);
-    stw_p((uint16_t *) v + 0, 94);	/* ??? */
-    stw_p((uint16_t *) v + 1, 23);	/* ??? */
-    stw_p((uint16_t *) v + 2, 0);	/* ??? */
+    stw_p((uint16_t *) v + 0, 94);  /* ??? */
+    stw_p((uint16_t *) v + 1, 23);  /* ??? */
+    stw_p((uint16_t *) v + 2, 0);   /* ??? */
     v += 2;
 
     /* OMAP gpio switch info */
     ADD_TAG(0x6e0c, 80);
-    strcpy((void *) v, "bat_cover");	v += 3;
-    stw_p((uint16_t *) v + 0, 110);	/* GPIO num ??? */
-    stw_p((uint16_t *) v + 1, 1);	/* GPIO num ??? */
+    strcpy((void *) v, "bat_cover");    v += 3;
+    stw_p((uint16_t *) v + 0, 110); /* GPIO num ??? */
+    stw_p((uint16_t *) v + 1, 1);   /* GPIO num ??? */
     v += 2;
-    strcpy((void *) v, "cam_act");	v += 3;
-    stw_p((uint16_t *) v + 0, 95);	/* GPIO num ??? */
-    stw_p((uint16_t *) v + 1, 32);	/* GPIO num ??? */
+    strcpy((void *) v, "cam_act");  v += 3;
+    stw_p((uint16_t *) v + 0, 95);  /* GPIO num ??? */
+    stw_p((uint16_t *) v + 1, 32);  /* GPIO num ??? */
     v += 2;
-    strcpy((void *) v, "cam_turn");	v += 3;
-    stw_p((uint16_t *) v + 0, 12);	/* GPIO num ??? */
-    stw_p((uint16_t *) v + 1, 33);	/* GPIO num ??? */
+    strcpy((void *) v, "cam_turn"); v += 3;
+    stw_p((uint16_t *) v + 0, 12);  /* GPIO num ??? */
+    stw_p((uint16_t *) v + 1, 33);  /* GPIO num ??? */
     v += 2;
-    strcpy((void *) v, "headphone");	v += 3;
-    stw_p((uint16_t *) v + 0, 107);	/* GPIO num ??? */
-    stw_p((uint16_t *) v + 1, 17);	/* GPIO num ??? */
+    strcpy((void *) v, "headphone");    v += 3;
+    stw_p((uint16_t *) v + 0, 107); /* GPIO num ??? */
+    stw_p((uint16_t *) v + 1, 17);  /* GPIO num ??? */
     v += 2;
 
     /* Bluetooth */
     ADD_TAG(0x6e0e, 12);
-    stl_p(v++, 0x5c623d01);		/* ??? */
-    stl_p(v++, 0x00000201);		/* ??? */
-    stl_p(v++, 0x00000000);		/* ??? */
+    stl_p(v++, 0x5c623d01);     /* ??? */
+    stl_p(v++, 0x00000201);     /* ??? */
+    stl_p(v++, 0x00000000);     /* ??? */
 
     /* CX3110x WLAN settings */
     ADD_TAG(0x6e0f, 8);
-    stl_p(v++, 0x00610025);		/* ??? */
-    stl_p(v++, 0xffff0057);		/* ??? */
+    stl_p(v++, 0x00610025);     /* ??? */
+    stl_p(v++, 0xffff0057);     /* ??? */
 
     /* MMC host settings */
     ADD_TAG(0x6e10, 12);
-    stl_p(v++, 0xffff000f);		/* ??? */
-    stl_p(v++, 0xffffffff);		/* ??? */
-    stl_p(v++, 0x00000060);		/* ??? */
+    stl_p(v++, 0xffff000f);     /* ??? */
+    stl_p(v++, 0xffffffff);     /* ??? */
+    stl_p(v++, 0x00000060);     /* ??? */
 
     /* OneNAND chip select */
     ADD_TAG(0x6e11, 10);
-    stl_p(v++, 0x00000401);		/* ??? */
-    stl_p(v++, 0x0002003a);		/* ??? */
-    stl_p(v++, 0x00000002);		/* ??? */
+    stl_p(v++, 0x00000401);     /* ??? */
+    stl_p(v++, 0x0002003a);     /* ??? */
+    stl_p(v++, 0x00000002);     /* ??? */
 
     /* TEA5761 sensor settings */
     ADD_TAG(0x6e12, 2);
-    stl_p(v++, 93);			/* GPIO num ??? */
+    stl_p(v++, 93);         /* GPIO num ??? */
 
 #if 0
     /* Unknown tag */
@@ -985,11 +985,11 @@ static void n800_setup_nolo_tags(void *sram_base)
 static void n800_gpmc_init(struct n800_s *s)
 {
     uint32_t config7 =
-            (0xf << 8) |	/* MASKADDRESS */
-            (1 << 6) |		/* CSVALID */
-            (4 << 0);		/* BASEADDRESS */
+            (0xf << 8) |    /* MASKADDRESS */
+            (1 << 6) |      /* CSVALID */
+            (4 << 0);       /* BASEADDRESS */
 
-    cpu_physical_memory_write(0x6800a078,		/* GPMC_CONFIG7_0 */
+    cpu_physical_memory_write(0x6800a078,       /* GPMC_CONFIG7_0 */
                               &config7, sizeof(config7));
 }
 
@@ -1000,47 +1000,47 @@ static void n8x0_boot_init(void *opaque)
     uint32_t buf;
 
     /* PRCM setup */
-#define omap_writel(addr, val)	\
-    buf = (val);			\
+#define omap_writel(addr, val)  \
+    buf = (val);            \
     cpu_physical_memory_write(addr, &buf, sizeof(buf))
 
-    omap_writel(0x48008060, 0x41);		/* PRCM_CLKSRC_CTRL */
-    omap_writel(0x48008070, 1);			/* PRCM_CLKOUT_CTRL */
-    omap_writel(0x48008078, 0);			/* PRCM_CLKEMUL_CTRL */
-    omap_writel(0x48008090, 0);			/* PRCM_VOLTSETUP */
-    omap_writel(0x48008094, 0);			/* PRCM_CLKSSETUP */
-    omap_writel(0x48008098, 0);			/* PRCM_POLCTRL */
-    omap_writel(0x48008140, 2);			/* CM_CLKSEL_MPU */
-    omap_writel(0x48008148, 0);			/* CM_CLKSTCTRL_MPU */
-    omap_writel(0x48008158, 1);			/* RM_RSTST_MPU */
-    omap_writel(0x480081c8, 0x15);		/* PM_WKDEP_MPU */
-    omap_writel(0x480081d4, 0x1d4);		/* PM_EVGENCTRL_MPU */
-    omap_writel(0x480081d8, 0);			/* PM_EVEGENONTIM_MPU */
-    omap_writel(0x480081dc, 0);			/* PM_EVEGENOFFTIM_MPU */
-    omap_writel(0x480081e0, 0xc);		/* PM_PWSTCTRL_MPU */
-    omap_writel(0x48008200, 0x047e7ff7);	/* CM_FCLKEN1_CORE */
-    omap_writel(0x48008204, 0x00000004);	/* CM_FCLKEN2_CORE */
-    omap_writel(0x48008210, 0x047e7ff1);	/* CM_ICLKEN1_CORE */
-    omap_writel(0x48008214, 0x00000004);	/* CM_ICLKEN2_CORE */
-    omap_writel(0x4800821c, 0x00000000);	/* CM_ICLKEN4_CORE */
-    omap_writel(0x48008230, 0);			/* CM_AUTOIDLE1_CORE */
-    omap_writel(0x48008234, 0);			/* CM_AUTOIDLE2_CORE */
-    omap_writel(0x48008238, 7);			/* CM_AUTOIDLE3_CORE */
-    omap_writel(0x4800823c, 0);			/* CM_AUTOIDLE4_CORE */
-    omap_writel(0x48008240, 0x04360626);	/* CM_CLKSEL1_CORE */
-    omap_writel(0x48008244, 0x00000014);	/* CM_CLKSEL2_CORE */
-    omap_writel(0x48008248, 0);			/* CM_CLKSTCTRL_CORE */
-    omap_writel(0x48008300, 0x00000000);	/* CM_FCLKEN_GFX */
-    omap_writel(0x48008310, 0x00000000);	/* CM_ICLKEN_GFX */
-    omap_writel(0x48008340, 0x00000001);	/* CM_CLKSEL_GFX */
-    omap_writel(0x48008400, 0x00000004);	/* CM_FCLKEN_WKUP */
-    omap_writel(0x48008410, 0x00000004);	/* CM_ICLKEN_WKUP */
-    omap_writel(0x48008440, 0x00000000);	/* CM_CLKSEL_WKUP */
-    omap_writel(0x48008500, 0x000000cf);	/* CM_CLKEN_PLL */
-    omap_writel(0x48008530, 0x0000000c);	/* CM_AUTOIDLE_PLL */
-    omap_writel(0x48008540,			/* CM_CLKSEL1_PLL */
+    omap_writel(0x48008060, 0x41);      /* PRCM_CLKSRC_CTRL */
+    omap_writel(0x48008070, 1);         /* PRCM_CLKOUT_CTRL */
+    omap_writel(0x48008078, 0);         /* PRCM_CLKEMUL_CTRL */
+    omap_writel(0x48008090, 0);         /* PRCM_VOLTSETUP */
+    omap_writel(0x48008094, 0);         /* PRCM_CLKSSETUP */
+    omap_writel(0x48008098, 0);         /* PRCM_POLCTRL */
+    omap_writel(0x48008140, 2);         /* CM_CLKSEL_MPU */
+    omap_writel(0x48008148, 0);         /* CM_CLKSTCTRL_MPU */
+    omap_writel(0x48008158, 1);         /* RM_RSTST_MPU */
+    omap_writel(0x480081c8, 0x15);      /* PM_WKDEP_MPU */
+    omap_writel(0x480081d4, 0x1d4);     /* PM_EVGENCTRL_MPU */
+    omap_writel(0x480081d8, 0);         /* PM_EVEGENONTIM_MPU */
+    omap_writel(0x480081dc, 0);         /* PM_EVEGENOFFTIM_MPU */
+    omap_writel(0x480081e0, 0xc);       /* PM_PWSTCTRL_MPU */
+    omap_writel(0x48008200, 0x047e7ff7);    /* CM_FCLKEN1_CORE */
+    omap_writel(0x48008204, 0x00000004);    /* CM_FCLKEN2_CORE */
+    omap_writel(0x48008210, 0x047e7ff1);    /* CM_ICLKEN1_CORE */
+    omap_writel(0x48008214, 0x00000004);    /* CM_ICLKEN2_CORE */
+    omap_writel(0x4800821c, 0x00000000);    /* CM_ICLKEN4_CORE */
+    omap_writel(0x48008230, 0);         /* CM_AUTOIDLE1_CORE */
+    omap_writel(0x48008234, 0);         /* CM_AUTOIDLE2_CORE */
+    omap_writel(0x48008238, 7);         /* CM_AUTOIDLE3_CORE */
+    omap_writel(0x4800823c, 0);         /* CM_AUTOIDLE4_CORE */
+    omap_writel(0x48008240, 0x04360626);    /* CM_CLKSEL1_CORE */
+    omap_writel(0x48008244, 0x00000014);    /* CM_CLKSEL2_CORE */
+    omap_writel(0x48008248, 0);         /* CM_CLKSTCTRL_CORE */
+    omap_writel(0x48008300, 0x00000000);    /* CM_FCLKEN_GFX */
+    omap_writel(0x48008310, 0x00000000);    /* CM_ICLKEN_GFX */
+    omap_writel(0x48008340, 0x00000001);    /* CM_CLKSEL_GFX */
+    omap_writel(0x48008400, 0x00000004);    /* CM_FCLKEN_WKUP */
+    omap_writel(0x48008410, 0x00000004);    /* CM_ICLKEN_WKUP */
+    omap_writel(0x48008440, 0x00000000);    /* CM_CLKSEL_WKUP */
+    omap_writel(0x48008500, 0x000000cf);    /* CM_CLKEN_PLL */
+    omap_writel(0x48008530, 0x0000000c);    /* CM_AUTOIDLE_PLL */
+    omap_writel(0x48008540,         /* CM_CLKSEL1_PLL */
                     (0x78 << 12) | (6 << 8));
-    omap_writel(0x48008544, 2);			/* CM_CLKSEL2_PLL */
+    omap_writel(0x48008544, 2);         /* CM_CLKSEL2_PLL */
 
     /* GPMC setup */
     n800_gpmc_init(s);
@@ -1057,10 +1057,10 @@ static void n8x0_boot_init(void *opaque)
     }
 }
 
-#define OMAP_TAG_NOKIA_BT	0x4e01
-#define OMAP_TAG_WLAN_CX3110X	0x4e02
-#define OMAP_TAG_CBUS		0x4e03
-#define OMAP_TAG_EM_ASIC_BB5	0x4e04
+#define OMAP_TAG_NOKIA_BT   0x4e01
+#define OMAP_TAG_WLAN_CX3110X   0x4e02
+#define OMAP_TAG_CBUS       0x4e03
+#define OMAP_TAG_EM_ASIC_BB5    0x4e04
 
 static const struct omap_gpiosw_info_s {
     const char *name;
@@ -1138,150 +1138,150 @@ static int n8x0_atag_setup(void *p, int model)
 
     w = p;
 
-    stw_p(w++, OMAP_TAG_UART);			/* u16 tag */
-    stw_p(w++, 4);				/* u16 len */
+    stw_p(w++, OMAP_TAG_UART);          /* u16 tag */
+    stw_p(w++, 4);              /* u16 len */
     stw_p(w++, (1 << 2) | (1 << 1) | (1 << 0)); /* uint enabled_uarts */
     w++;
 
 #if 0
-    stw_p(w++, OMAP_TAG_SERIAL_CONSOLE);	/* u16 tag */
-    stw_p(w++, 4);				/* u16 len */
-    stw_p(w++, XLDR_LL_UART + 1);		/* u8 console_uart */
-    stw_p(w++, 115200);				/* u32 console_speed */
+    stw_p(w++, OMAP_TAG_SERIAL_CONSOLE);    /* u16 tag */
+    stw_p(w++, 4);              /* u16 len */
+    stw_p(w++, XLDR_LL_UART + 1);       /* u8 console_uart */
+    stw_p(w++, 115200);             /* u32 console_speed */
 #endif
 
-    stw_p(w++, OMAP_TAG_LCD);			/* u16 tag */
-    stw_p(w++, 36);				/* u16 len */
-    strcpy((void *) w, "QEMU LCD panel");	/* char panel_name[16] */
+    stw_p(w++, OMAP_TAG_LCD);           /* u16 tag */
+    stw_p(w++, 36);             /* u16 len */
+    strcpy((void *) w, "QEMU LCD panel");   /* char panel_name[16] */
     w += 8;
-    strcpy((void *) w, "blizzard");		/* char ctrl_name[16] */
+    strcpy((void *) w, "blizzard");     /* char ctrl_name[16] */
     w += 8;
-    stw_p(w++, N810_BLIZZARD_RESET_GPIO);	/* TODO: n800 s16 nreset_gpio */
-    stw_p(w++, 24);				/* u8 data_lines */
-
-    stw_p(w++, OMAP_TAG_CBUS);			/* u16 tag */
-    stw_p(w++, 8);				/* u16 len */
-    stw_p(w++, N8X0_CBUS_CLK_GPIO);		/* s16 clk_gpio */
-    stw_p(w++, N8X0_CBUS_DAT_GPIO);		/* s16 dat_gpio */
-    stw_p(w++, N8X0_CBUS_SEL_GPIO);		/* s16 sel_gpio */
+    stw_p(w++, N810_BLIZZARD_RESET_GPIO);   /* TODO: n800 s16 nreset_gpio */
+    stw_p(w++, 24);             /* u8 data_lines */
+
+    stw_p(w++, OMAP_TAG_CBUS);          /* u16 tag */
+    stw_p(w++, 8);              /* u16 len */
+    stw_p(w++, N8X0_CBUS_CLK_GPIO);     /* s16 clk_gpio */
+    stw_p(w++, N8X0_CBUS_DAT_GPIO);     /* s16 dat_gpio */
+    stw_p(w++, N8X0_CBUS_SEL_GPIO);     /* s16 sel_gpio */
     w++;
 
-    stw_p(w++, OMAP_TAG_EM_ASIC_BB5);		/* u16 tag */
-    stw_p(w++, 4);				/* u16 len */
-    stw_p(w++, N8X0_RETU_GPIO);			/* s16 retu_irq_gpio */
-    stw_p(w++, N8X0_TAHVO_GPIO);		/* s16 tahvo_irq_gpio */
+    stw_p(w++, OMAP_TAG_EM_ASIC_BB5);       /* u16 tag */
+    stw_p(w++, 4);              /* u16 len */
+    stw_p(w++, N8X0_RETU_GPIO);         /* s16 retu_irq_gpio */
+    stw_p(w++, N8X0_TAHVO_GPIO);        /* s16 tahvo_irq_gpio */
 
     gpiosw = (model == 810) ? n810_gpiosw_info : n800_gpiosw_info;
     for (; gpiosw->name; gpiosw++) {
-        stw_p(w++, OMAP_TAG_GPIO_SWITCH);	/* u16 tag */
-        stw_p(w++, 20);				/* u16 len */
-        strcpy((void *) w, gpiosw->name);	/* char name[12] */
+        stw_p(w++, OMAP_TAG_GPIO_SWITCH);   /* u16 tag */
+        stw_p(w++, 20);             /* u16 len */
+        strcpy((void *) w, gpiosw->name);   /* char name[12] */
         w += 6;
-        stw_p(w++, gpiosw->line);		/* u16 gpio */
+        stw_p(w++, gpiosw->line);       /* u16 gpio */
         stw_p(w++, gpiosw->type);
         stw_p(w++, 0);
         stw_p(w++, 0);
     }
 
-    stw_p(w++, OMAP_TAG_NOKIA_BT);		/* u16 tag */
-    stw_p(w++, 12);				/* u16 len */
+    stw_p(w++, OMAP_TAG_NOKIA_BT);      /* u16 tag */
+    stw_p(w++, 12);             /* u16 len */
     b = (void *) w;
-    stb_p(b++, 0x01);				/* u8 chip_type	(CSR) */
-    stb_p(b++, N8X0_BT_WKUP_GPIO);		/* u8 bt_wakeup_gpio */
-    stb_p(b++, N8X0_BT_HOST_WKUP_GPIO);		/* u8 host_wakeup_gpio */
-    stb_p(b++, N8X0_BT_RESET_GPIO);		/* u8 reset_gpio */
-    stb_p(b++, BT_UART + 1);			/* u8 bt_uart */
-    memcpy(b, &n8x0_bd_addr, 6);		/* u8 bd_addr[6] */
+    stb_p(b++, 0x01);               /* u8 chip_type (CSR) */
+    stb_p(b++, N8X0_BT_WKUP_GPIO);      /* u8 bt_wakeup_gpio */
+    stb_p(b++, N8X0_BT_HOST_WKUP_GPIO);     /* u8 host_wakeup_gpio */
+    stb_p(b++, N8X0_BT_RESET_GPIO);     /* u8 reset_gpio */
+    stb_p(b++, BT_UART + 1);            /* u8 bt_uart */
+    memcpy(b, &n8x0_bd_addr, 6);        /* u8 bd_addr[6] */
     b += 6;
-    stb_p(b++, 0x02);				/* u8 bt_sysclk (38.4) */
+    stb_p(b++, 0x02);               /* u8 bt_sysclk (38.4) */
     w = (void *) b;
 
-    stw_p(w++, OMAP_TAG_WLAN_CX3110X);		/* u16 tag */
-    stw_p(w++, 8);				/* u16 len */
-    stw_p(w++, 0x25);				/* u8 chip_type */
-    stw_p(w++, N8X0_WLAN_PWR_GPIO);		/* s16 power_gpio */
-    stw_p(w++, N8X0_WLAN_IRQ_GPIO);		/* s16 irq_gpio */
-    stw_p(w++, -1);				/* s16 spi_cs_gpio */
+    stw_p(w++, OMAP_TAG_WLAN_CX3110X);      /* u16 tag */
+    stw_p(w++, 8);              /* u16 len */
+    stw_p(w++, 0x25);               /* u8 chip_type */
+    stw_p(w++, N8X0_WLAN_PWR_GPIO);     /* s16 power_gpio */
+    stw_p(w++, N8X0_WLAN_IRQ_GPIO);     /* s16 irq_gpio */
+    stw_p(w++, -1);             /* s16 spi_cs_gpio */
 
-    stw_p(w++, OMAP_TAG_MMC);			/* u16 tag */
-    stw_p(w++, 16);				/* u16 len */
+    stw_p(w++, OMAP_TAG_MMC);           /* u16 tag */
+    stw_p(w++, 16);             /* u16 len */
     if (model == 810) {
-        stw_p(w++, 0x23f);			/* unsigned flags */
-        stw_p(w++, -1);				/* s16 power_pin */
-        stw_p(w++, -1);				/* s16 switch_pin */
-        stw_p(w++, -1);				/* s16 wp_pin */
-        stw_p(w++, 0x240);			/* unsigned flags */
-        stw_p(w++, 0xc000);			/* s16 power_pin */
-        stw_p(w++, 0x0248);			/* s16 switch_pin */
-        stw_p(w++, 0xc000);			/* s16 wp_pin */
+        stw_p(w++, 0x23f);          /* unsigned flags */
+        stw_p(w++, -1);             /* s16 power_pin */
+        stw_p(w++, -1);             /* s16 switch_pin */
+        stw_p(w++, -1);             /* s16 wp_pin */
+        stw_p(w++, 0x240);          /* unsigned flags */
+        stw_p(w++, 0xc000);         /* s16 power_pin */
+        stw_p(w++, 0x0248);         /* s16 switch_pin */
+        stw_p(w++, 0xc000);         /* s16 wp_pin */
     } else {
-        stw_p(w++, 0xf);			/* unsigned flags */
-        stw_p(w++, -1);				/* s16 power_pin */
-        stw_p(w++, -1);				/* s16 switch_pin */
-        stw_p(w++, -1);				/* s16 wp_pin */
-        stw_p(w++, 0);				/* unsigned flags */
-        stw_p(w++, 0);				/* s16 power_pin */
-        stw_p(w++, 0);				/* s16 switch_pin */
-        stw_p(w++, 0);				/* s16 wp_pin */
+        stw_p(w++, 0xf);            /* unsigned flags */
+        stw_p(w++, -1);             /* s16 power_pin */
+        stw_p(w++, -1);             /* s16 switch_pin */
+        stw_p(w++, -1);             /* s16 wp_pin */
+        stw_p(w++, 0);              /* unsigned flags */
+        stw_p(w++, 0);              /* s16 power_pin */
+        stw_p(w++, 0);              /* s16 switch_pin */
+        stw_p(w++, 0);              /* s16 wp_pin */
     }
 
-    stw_p(w++, OMAP_TAG_TEA5761);		/* u16 tag */
-    stw_p(w++, 4);				/* u16 len */
-    stw_p(w++, N8X0_TEA5761_CS_GPIO);		/* u16 enable_gpio */
+    stw_p(w++, OMAP_TAG_TEA5761);       /* u16 tag */
+    stw_p(w++, 4);              /* u16 len */
+    stw_p(w++, N8X0_TEA5761_CS_GPIO);       /* u16 enable_gpio */
     w++;
 
     partition = (model == 810) ? n810_part_info : n800_part_info;
     for (; partition->name; partition++) {
-        stw_p(w++, OMAP_TAG_PARTITION);		/* u16 tag */
-        stw_p(w++, 28);				/* u16 len */
-        strcpy((void *) w, partition->name);	/* char name[16] */
+        stw_p(w++, OMAP_TAG_PARTITION);     /* u16 tag */
+        stw_p(w++, 28);             /* u16 len */
+        strcpy((void *) w, partition->name);    /* char name[16] */
         l = (void *) (w + 8);
-        stl_p(l++, partition->size);		/* unsigned int size */
-        stl_p(l++, partition->offset);		/* unsigned int offset */
-        stl_p(l++, partition->mask);		/* unsigned int mask_flags */
+        stl_p(l++, partition->size);        /* unsigned int size */
+        stl_p(l++, partition->offset);      /* unsigned int offset */
+        stl_p(l++, partition->mask);        /* unsigned int mask_flags */
         w = (void *) l;
     }
 
-    stw_p(w++, OMAP_TAG_BOOT_REASON);		/* u16 tag */
-    stw_p(w++, 12);				/* u16 len */
+    stw_p(w++, OMAP_TAG_BOOT_REASON);       /* u16 tag */
+    stw_p(w++, 12);             /* u16 len */
 #if 0
-    strcpy((void *) w, "por");			/* char reason_str[12] */
-    strcpy((void *) w, "charger");		/* char reason_str[12] */
-    strcpy((void *) w, "32wd_to");		/* char reason_str[12] */
-    strcpy((void *) w, "sw_rst");		/* char reason_str[12] */
-    strcpy((void *) w, "mbus");			/* char reason_str[12] */
-    strcpy((void *) w, "unknown");		/* char reason_str[12] */
-    strcpy((void *) w, "swdg_to");		/* char reason_str[12] */
-    strcpy((void *) w, "sec_vio");		/* char reason_str[12] */
-    strcpy((void *) w, "pwr_key");		/* char reason_str[12] */
-    strcpy((void *) w, "rtc_alarm");		/* char reason_str[12] */
+    strcpy((void *) w, "por");          /* char reason_str[12] */
+    strcpy((void *) w, "charger");      /* char reason_str[12] */
+    strcpy((void *) w, "32wd_to");      /* char reason_str[12] */
+    strcpy((void *) w, "sw_rst");       /* char reason_str[12] */
+    strcpy((void *) w, "mbus");         /* char reason_str[12] */
+    strcpy((void *) w, "unknown");      /* char reason_str[12] */
+    strcpy((void *) w, "swdg_to");      /* char reason_str[12] */
+    strcpy((void *) w, "sec_vio");      /* char reason_str[12] */
+    strcpy((void *) w, "pwr_key");      /* char reason_str[12] */
+    strcpy((void *) w, "rtc_alarm");        /* char reason_str[12] */
 #else
-    strcpy((void *) w, "pwr_key");		/* char reason_str[12] */
+    strcpy((void *) w, "pwr_key");      /* char reason_str[12] */
 #endif
     w += 6;
 
     tag = (model == 810) ? "RX-44" : "RX-34";
-    stw_p(w++, OMAP_TAG_VERSION_STR);		/* u16 tag */
-    stw_p(w++, 24);				/* u16 len */
-    strcpy((void *) w, "product");		/* char component[12] */
+    stw_p(w++, OMAP_TAG_VERSION_STR);       /* u16 tag */
+    stw_p(w++, 24);             /* u16 len */
+    strcpy((void *) w, "product");      /* char component[12] */
     w += 6;
-    strcpy((void *) w, tag);			/* char version[12] */
+    strcpy((void *) w, tag);            /* char version[12] */
     w += 6;
 
-    stw_p(w++, OMAP_TAG_VERSION_STR);		/* u16 tag */
-    stw_p(w++, 24);				/* u16 len */
-    strcpy((void *) w, "hw-build");		/* char component[12] */
+    stw_p(w++, OMAP_TAG_VERSION_STR);       /* u16 tag */
+    stw_p(w++, 24);             /* u16 len */
+    strcpy((void *) w, "hw-build");     /* char component[12] */
     w += 6;
     strcpy((void *) w, "QEMU ");
     pstrcat((void *) w, 12, qemu_hw_version()); /* char version[12] */
     w += 6;
 
     tag = (model == 810) ? "1.1.10-qemu" : "1.1.6-qemu";
-    stw_p(w++, OMAP_TAG_VERSION_STR);		/* u16 tag */
-    stw_p(w++, 24);				/* u16 len */
-    strcpy((void *) w, "nolo");			/* char component[12] */
+    stw_p(w++, OMAP_TAG_VERSION_STR);       /* u16 tag */
+    stw_p(w++, 24);             /* u16 len */
+    strcpy((void *) w, "nolo");         /* char component[12] */
     w += 6;
-    strcpy((void *) w, tag);			/* char version[12] */
+    strcpy((void *) w, tag);            /* char version[12] */
     w += 6;
 
     return (void *) w - p;
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index d5438156ee..e91fc2dadd 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -141,7 +141,7 @@ static inline void omap_timer_update(struct omap_mpu_timer_s *timer)
     int64_t expires;
 
     if (timer->enable && timer->st && timer->rate) {
-        timer->val = timer->reset_val;	/* Should skip this on clk enable */
+        timer->val = timer->reset_val;  /* Should skip this on clk enable */
         expires = muldiv64((uint64_t) timer->val << (timer->ptv + 1),
                            NANOSECONDS_PER_SECOND, timer->rate);
 
@@ -209,13 +209,13 @@ static uint64_t omap_mpu_timer_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* CNTL_TIMER */
+    case 0x00:  /* CNTL_TIMER */
         return (s->enable << 5) | (s->ptv << 2) | (s->ar << 1) | s->st;
 
-    case 0x04:	/* LOAD_TIM */
+    case 0x04:  /* LOAD_TIM */
         break;
 
-    case 0x08:	/* READ_TIM */
+    case 0x08:  /* READ_TIM */
         return omap_timer_read(s);
     }
 
@@ -234,7 +234,7 @@ static void omap_mpu_timer_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* CNTL_TIMER */
+    case 0x00:  /* CNTL_TIMER */
         omap_timer_sync(s);
         s->enable = (value >> 5) & 1;
         s->ptv = (value >> 2) & 7;
@@ -243,11 +243,11 @@ static void omap_mpu_timer_write(void *opaque, hwaddr addr,
         omap_timer_update(s);
         return;
 
-    case 0x04:	/* LOAD_TIM */
+    case 0x04:  /* LOAD_TIM */
         s->reset_val = value;
         return;
 
-    case 0x08:	/* READ_TIM */
+    case 0x08:  /* READ_TIM */
         OMAP_RO_REG(addr);
         break;
 
@@ -315,14 +315,14 @@ static uint64_t omap_wd_timer_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* CNTL_TIMER */
+    case 0x00:  /* CNTL_TIMER */
         return (s->timer.ptv << 9) | (s->timer.ar << 8) |
                 (s->timer.st << 7) | (s->free << 1);
 
-    case 0x04:	/* READ_TIMER */
+    case 0x04:  /* READ_TIMER */
         return omap_timer_read(&s->timer);
 
-    case 0x08:	/* TIMER_MODE */
+    case 0x08:  /* TIMER_MODE */
         return s->mode << 15;
     }
 
@@ -341,7 +341,7 @@ static void omap_wd_timer_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* CNTL_TIMER */
+    case 0x00:  /* CNTL_TIMER */
         omap_timer_sync(&s->timer);
         s->timer.ptv = (value >> 9) & 7;
         s->timer.ar = (value >> 8) & 1;
@@ -350,11 +350,11 @@ static void omap_wd_timer_write(void *opaque, hwaddr addr,
         omap_timer_update(&s->timer);
         break;
 
-    case 0x04:	/* LOAD_TIMER */
+    case 0x04:  /* LOAD_TIMER */
         s->timer.reset_val = value & 0xffff;
         break;
 
-    case 0x08:	/* TIMER_MODE */
+    case 0x08:  /* TIMER_MODE */
         if (!s->mode && ((value >> 15) & 1))
             omap_clk_get(s->timer.clk);
         s->mode |= (value >> 15) & 1;
@@ -439,13 +439,13 @@ static uint64_t omap_os_timer_read(void *opaque, hwaddr addr,
     }
 
     switch (offset) {
-    case 0x00:	/* TVR */
+    case 0x00:  /* TVR */
         return s->timer.reset_val;
 
-    case 0x04:	/* TCR */
+    case 0x04:  /* TCR */
         return omap_timer_read(&s->timer);
 
-    case 0x08:	/* CR */
+    case 0x08:  /* CR */
         return (s->timer.ar << 3) | (s->timer.it_ena << 2) | s->timer.st;
 
     default:
@@ -467,15 +467,15 @@ static void omap_os_timer_write(void *opaque, hwaddr addr,
     }
 
     switch (offset) {
-    case 0x00:	/* TVR */
+    case 0x00:  /* TVR */
         s->timer.reset_val = value & 0x00ffffff;
         break;
 
-    case 0x04:	/* TCR */
+    case 0x04:  /* TCR */
         OMAP_RO_REG(addr);
         break;
 
-    case 0x08:	/* CR */
+    case 0x08:  /* CR */
         s->timer.ar = (value >> 3) & 1;
         s->timer.it_ena = (value >> 2) & 1;
         if (s->timer.st != (value & 1) || (value & 2)) {
@@ -540,34 +540,34 @@ static uint64_t omap_ulpd_pm_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x14:	/* IT_STATUS */
+    case 0x14:  /* IT_STATUS */
         ret = s->ulpd_pm_regs[addr >> 2];
         s->ulpd_pm_regs[addr >> 2] = 0;
         qemu_irq_lower(qdev_get_gpio_in(s->ih[1], OMAP_INT_GAUGE_32K));
         return ret;
 
-    case 0x18:	/* Reserved */
-    case 0x1c:	/* Reserved */
-    case 0x20:	/* Reserved */
-    case 0x28:	/* Reserved */
-    case 0x2c:	/* Reserved */
+    case 0x18:  /* Reserved */
+    case 0x1c:  /* Reserved */
+    case 0x20:  /* Reserved */
+    case 0x28:  /* Reserved */
+    case 0x2c:  /* Reserved */
         OMAP_BAD_REG(addr);
         /* fall through */
-    case 0x00:	/* COUNTER_32_LSB */
-    case 0x04:	/* COUNTER_32_MSB */
-    case 0x08:	/* COUNTER_HIGH_FREQ_LSB */
-    case 0x0c:	/* COUNTER_HIGH_FREQ_MSB */
-    case 0x10:	/* GAUGING_CTRL */
-    case 0x24:	/* SETUP_ANALOG_CELL3_ULPD1 */
-    case 0x30:	/* CLOCK_CTRL */
-    case 0x34:	/* SOFT_REQ */
-    case 0x38:	/* COUNTER_32_FIQ */
-    case 0x3c:	/* DPLL_CTRL */
-    case 0x40:	/* STATUS_REQ */
+    case 0x00:  /* COUNTER_32_LSB */
+    case 0x04:  /* COUNTER_32_MSB */
+    case 0x08:  /* COUNTER_HIGH_FREQ_LSB */
+    case 0x0c:  /* COUNTER_HIGH_FREQ_MSB */
+    case 0x10:  /* GAUGING_CTRL */
+    case 0x24:  /* SETUP_ANALOG_CELL3_ULPD1 */
+    case 0x30:  /* CLOCK_CTRL */
+    case 0x34:  /* SOFT_REQ */
+    case 0x38:  /* COUNTER_32_FIQ */
+    case 0x3c:  /* DPLL_CTRL */
+    case 0x40:  /* STATUS_REQ */
         /* XXX: check clk::usecount state for every clock */
-    case 0x48:	/* LOCL_TIME */
-    case 0x4c:	/* APLL_CTRL */
-    case 0x50:	/* POWER_CTRL */
+    case 0x48:  /* LOCL_TIME */
+    case 0x4c:  /* APLL_CTRL */
+    case 0x50:  /* POWER_CTRL */
         return s->ulpd_pm_regs[addr >> 2];
     }
 
@@ -578,22 +578,22 @@ static uint64_t omap_ulpd_pm_read(void *opaque, hwaddr addr,
 static inline void omap_ulpd_clk_update(struct omap_mpu_state_s *s,
                 uint16_t diff, uint16_t value)
 {
-    if (diff & (1 << 4))				/* USB_MCLK_EN */
+    if (diff & (1 << 4))                /* USB_MCLK_EN */
         omap_clk_onoff(omap_findclk(s, "usb_clk0"), (value >> 4) & 1);
-    if (diff & (1 << 5))				/* DIS_USB_PVCI_CLK */
+    if (diff & (1 << 5))                /* DIS_USB_PVCI_CLK */
         omap_clk_onoff(omap_findclk(s, "usb_w2fc_ck"), (~value >> 5) & 1);
 }
 
 static inline void omap_ulpd_req_update(struct omap_mpu_state_s *s,
                 uint16_t diff, uint16_t value)
 {
-    if (diff & (1 << 0))				/* SOFT_DPLL_REQ */
+    if (diff & (1 << 0))                /* SOFT_DPLL_REQ */
         omap_clk_canidle(omap_findclk(s, "dpll4"), (~value >> 0) & 1);
-    if (diff & (1 << 1))				/* SOFT_COM_REQ */
+    if (diff & (1 << 1))                /* SOFT_COM_REQ */
         omap_clk_canidle(omap_findclk(s, "com_mclk_out"), (~value >> 1) & 1);
-    if (diff & (1 << 2))				/* SOFT_SDW_REQ */
+    if (diff & (1 << 2))                /* SOFT_SDW_REQ */
         omap_clk_canidle(omap_findclk(s, "bt_mclk_out"), (~value >> 2) & 1);
-    if (diff & (1 << 3))				/* SOFT_USB_REQ */
+    if (diff & (1 << 3))                /* SOFT_USB_REQ */
         omap_clk_canidle(omap_findclk(s, "usb_clk0"), (~value >> 3) & 1);
 }
 
@@ -612,16 +612,16 @@ static void omap_ulpd_pm_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* COUNTER_32_LSB */
-    case 0x04:	/* COUNTER_32_MSB */
-    case 0x08:	/* COUNTER_HIGH_FREQ_LSB */
-    case 0x0c:	/* COUNTER_HIGH_FREQ_MSB */
-    case 0x14:	/* IT_STATUS */
-    case 0x40:	/* STATUS_REQ */
+    case 0x00:  /* COUNTER_32_LSB */
+    case 0x04:  /* COUNTER_32_MSB */
+    case 0x08:  /* COUNTER_HIGH_FREQ_LSB */
+    case 0x0c:  /* COUNTER_HIGH_FREQ_MSB */
+    case 0x14:  /* IT_STATUS */
+    case 0x40:  /* STATUS_REQ */
         OMAP_RO_REG(addr);
         break;
 
-    case 0x10:	/* GAUGING_CTRL */
+    case 0x10:  /* GAUGING_CTRL */
         /* Bits 0 and 1 seem to be confused in the OMAP 310 TRM */
         if ((s->ulpd_pm_regs[addr >> 2] ^ value) & 1) {
             now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -635,50 +635,50 @@ static void omap_ulpd_pm_write(void *opaque, hwaddr addr,
                 ticks = muldiv64(now, 32768, NANOSECONDS_PER_SECOND);
                 s->ulpd_pm_regs[0x00 >> 2] = (ticks >>  0) & 0xffff;
                 s->ulpd_pm_regs[0x04 >> 2] = (ticks >> 16) & 0xffff;
-                if (ticks >> 32)	/* OVERFLOW_32K */
+                if (ticks >> 32)    /* OVERFLOW_32K */
                     s->ulpd_pm_regs[0x14 >> 2] |= 1 << 2;
 
                 /* High frequency ticks */
                 ticks = muldiv64(now, 12000000, NANOSECONDS_PER_SECOND);
                 s->ulpd_pm_regs[0x08 >> 2] = (ticks >>  0) & 0xffff;
                 s->ulpd_pm_regs[0x0c >> 2] = (ticks >> 16) & 0xffff;
-                if (ticks >> 32)	/* OVERFLOW_HI_FREQ */
+                if (ticks >> 32)    /* OVERFLOW_HI_FREQ */
                     s->ulpd_pm_regs[0x14 >> 2] |= 1 << 1;
 
-                s->ulpd_pm_regs[0x14 >> 2] |= 1 << 0;	/* IT_GAUGING */
+                s->ulpd_pm_regs[0x14 >> 2] |= 1 << 0;   /* IT_GAUGING */
                 qemu_irq_raise(qdev_get_gpio_in(s->ih[1], OMAP_INT_GAUGE_32K));
             }
         }
         s->ulpd_pm_regs[addr >> 2] = value;
         break;
 
-    case 0x18:	/* Reserved */
-    case 0x1c:	/* Reserved */
-    case 0x20:	/* Reserved */
-    case 0x28:	/* Reserved */
-    case 0x2c:	/* Reserved */
+    case 0x18:  /* Reserved */
+    case 0x1c:  /* Reserved */
+    case 0x20:  /* Reserved */
+    case 0x28:  /* Reserved */
+    case 0x2c:  /* Reserved */
         OMAP_BAD_REG(addr);
         /* fall through */
-    case 0x24:	/* SETUP_ANALOG_CELL3_ULPD1 */
-    case 0x38:	/* COUNTER_32_FIQ */
-    case 0x48:	/* LOCL_TIME */
-    case 0x50:	/* POWER_CTRL */
+    case 0x24:  /* SETUP_ANALOG_CELL3_ULPD1 */
+    case 0x38:  /* COUNTER_32_FIQ */
+    case 0x48:  /* LOCL_TIME */
+    case 0x50:  /* POWER_CTRL */
         s->ulpd_pm_regs[addr >> 2] = value;
         break;
 
-    case 0x30:	/* CLOCK_CTRL */
+    case 0x30:  /* CLOCK_CTRL */
         diff = s->ulpd_pm_regs[addr >> 2] ^ value;
         s->ulpd_pm_regs[addr >> 2] = value & 0x3f;
         omap_ulpd_clk_update(s, diff, value);
         break;
 
-    case 0x34:	/* SOFT_REQ */
+    case 0x34:  /* SOFT_REQ */
         diff = s->ulpd_pm_regs[addr >> 2] ^ value;
         s->ulpd_pm_regs[addr >> 2] = value & 0x1f;
         omap_ulpd_req_update(s, diff, value);
         break;
 
-    case 0x3c:	/* DPLL_CTRL */
+    case 0x3c:  /* DPLL_CTRL */
         /* XXX: OMAP310 TRM claims bit 3 is PLL_ENABLE, and bit 4 is
          * omitted altogether, probably a typo.  */
         /* This register has identical semantics with DPLL(1:3) control
@@ -686,11 +686,11 @@ static void omap_ulpd_pm_write(void *opaque, hwaddr addr,
         diff = s->ulpd_pm_regs[addr >> 2] & value;
         s->ulpd_pm_regs[addr >> 2] = value & 0x2fff;
         if (diff & (0x3ff << 2)) {
-            if (value & (1 << 4)) {			/* PLL_ENABLE */
-                div = ((value >> 5) & 3) + 1;		/* PLL_DIV */
-                mult = MIN((value >> 7) & 0x1f, 1);	/* PLL_MULT */
+            if (value & (1 << 4)) {         /* PLL_ENABLE */
+                div = ((value >> 5) & 3) + 1;       /* PLL_DIV */
+                mult = MIN((value >> 7) & 0x1f, 1); /* PLL_MULT */
             } else {
-                div = bypass_div[((value >> 2) & 3)];	/* BYPASS_DIV */
+                div = bypass_div[((value >> 2) & 3)];   /* BYPASS_DIV */
                 mult = 1;
             }
             omap_clk_setrate(omap_findclk(s, "dpll4"), div, mult);
@@ -705,10 +705,10 @@ static void omap_ulpd_pm_write(void *opaque, hwaddr addr,
         s->ulpd_pm_regs[addr >> 2] |= 2;
         break;
 
-    case 0x4c:	/* APLL_CTRL */
+    case 0x4c:  /* APLL_CTRL */
         diff = s->ulpd_pm_regs[addr >> 2] & value;
         s->ulpd_pm_regs[addr >> 2] = value & 0xf;
-        if (diff & (1 << 0))				/* APLL_NDPLL_SWITCH */
+        if (diff & (1 << 0))                /* APLL_NDPLL_SWITCH */
             omap_clk_reparent(omap_findclk(s, "ck_48m"), omap_findclk(s,
                                     (value & (1 << 0)) ? "apll" : "dpll4"));
         break;
@@ -772,43 +772,43 @@ static uint64_t omap_pin_cfg_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* FUNC_MUX_CTRL_0 */
-    case 0x04:	/* FUNC_MUX_CTRL_1 */
-    case 0x08:	/* FUNC_MUX_CTRL_2 */
+    case 0x00:  /* FUNC_MUX_CTRL_0 */
+    case 0x04:  /* FUNC_MUX_CTRL_1 */
+    case 0x08:  /* FUNC_MUX_CTRL_2 */
         return s->func_mux_ctrl[addr >> 2];
 
-    case 0x0c:	/* COMP_MODE_CTRL_0 */
+    case 0x0c:  /* COMP_MODE_CTRL_0 */
         return s->comp_mode_ctrl[0];
 
-    case 0x10:	/* FUNC_MUX_CTRL_3 */
-    case 0x14:	/* FUNC_MUX_CTRL_4 */
-    case 0x18:	/* FUNC_MUX_CTRL_5 */
-    case 0x1c:	/* FUNC_MUX_CTRL_6 */
-    case 0x20:	/* FUNC_MUX_CTRL_7 */
-    case 0x24:	/* FUNC_MUX_CTRL_8 */
-    case 0x28:	/* FUNC_MUX_CTRL_9 */
-    case 0x2c:	/* FUNC_MUX_CTRL_A */
-    case 0x30:	/* FUNC_MUX_CTRL_B */
-    case 0x34:	/* FUNC_MUX_CTRL_C */
-    case 0x38:	/* FUNC_MUX_CTRL_D */
+    case 0x10:  /* FUNC_MUX_CTRL_3 */
+    case 0x14:  /* FUNC_MUX_CTRL_4 */
+    case 0x18:  /* FUNC_MUX_CTRL_5 */
+    case 0x1c:  /* FUNC_MUX_CTRL_6 */
+    case 0x20:  /* FUNC_MUX_CTRL_7 */
+    case 0x24:  /* FUNC_MUX_CTRL_8 */
+    case 0x28:  /* FUNC_MUX_CTRL_9 */
+    case 0x2c:  /* FUNC_MUX_CTRL_A */
+    case 0x30:  /* FUNC_MUX_CTRL_B */
+    case 0x34:  /* FUNC_MUX_CTRL_C */
+    case 0x38:  /* FUNC_MUX_CTRL_D */
         return s->func_mux_ctrl[(addr >> 2) - 1];
 
-    case 0x40:	/* PULL_DWN_CTRL_0 */
-    case 0x44:	/* PULL_DWN_CTRL_1 */
-    case 0x48:	/* PULL_DWN_CTRL_2 */
-    case 0x4c:	/* PULL_DWN_CTRL_3 */
+    case 0x40:  /* PULL_DWN_CTRL_0 */
+    case 0x44:  /* PULL_DWN_CTRL_1 */
+    case 0x48:  /* PULL_DWN_CTRL_2 */
+    case 0x4c:  /* PULL_DWN_CTRL_3 */
         return s->pull_dwn_ctrl[(addr & 0xf) >> 2];
 
-    case 0x50:	/* GATE_INH_CTRL_0 */
+    case 0x50:  /* GATE_INH_CTRL_0 */
         return s->gate_inh_ctrl[0];
 
-    case 0x60:	/* VOLTAGE_CTRL_0 */
+    case 0x60:  /* VOLTAGE_CTRL_0 */
         return s->voltage_ctrl[0];
 
-    case 0x70:	/* TEST_DBG_CTRL_0 */
+    case 0x70:  /* TEST_DBG_CTRL_0 */
         return s->test_dbg_ctrl[0];
 
-    case 0x80:	/* MOD_CONF_CTRL_0 */
+    case 0x80:  /* MOD_CONF_CTRL_0 */
         return s->mod_conf_ctrl[0];
     }
 
@@ -820,10 +820,10 @@ static inline void omap_pin_funcmux0_update(struct omap_mpu_state_s *s,
                 uint32_t diff, uint32_t value)
 {
     if (s->compat1509) {
-        if (diff & (1 << 9))			/* BLUETOOTH */
+        if (diff & (1 << 9))            /* BLUETOOTH */
             omap_clk_onoff(omap_findclk(s, "bt_mclk_out"),
                             (~value >> 9) & 1);
-        if (diff & (1 << 7))			/* USB.CLKO */
+        if (diff & (1 << 7))            /* USB.CLKO */
             omap_clk_onoff(omap_findclk(s, "usb.clko"),
                             (value >> 7) & 1);
     }
@@ -853,23 +853,23 @@ static inline void omap_pin_modconf1_update(struct omap_mpu_state_s *s,
                           omap_findclk(s, ((value >> 31) & 1) ?
                                        "ck_48m" : "armper_ck"));
     }
-    if (diff & (1 << 30))			/* CONF_MOD_UART2_CLK_MODE_R */
+    if (diff & (1 << 30))           /* CONF_MOD_UART2_CLK_MODE_R */
          omap_clk_reparent(omap_findclk(s, "uart2_ck"),
                          omap_findclk(s, ((value >> 30) & 1) ?
                                  "ck_48m" : "armper_ck"));
-    if (diff & (1 << 29))			/* CONF_MOD_UART1_CLK_MODE_R */
+    if (diff & (1 << 29))           /* CONF_MOD_UART1_CLK_MODE_R */
          omap_clk_reparent(omap_findclk(s, "uart1_ck"),
                          omap_findclk(s, ((value >> 29) & 1) ?
                                  "ck_48m" : "armper_ck"));
-    if (diff & (1 << 23))			/* CONF_MOD_MMC_SD_CLK_REQ_R */
+    if (diff & (1 << 23))           /* CONF_MOD_MMC_SD_CLK_REQ_R */
          omap_clk_reparent(omap_findclk(s, "mmc_ck"),
                          omap_findclk(s, ((value >> 23) & 1) ?
                                  "ck_48m" : "armper_ck"));
-    if (diff & (1 << 12))			/* CONF_MOD_COM_MCLK_12_48_S */
+    if (diff & (1 << 12))           /* CONF_MOD_COM_MCLK_12_48_S */
          omap_clk_reparent(omap_findclk(s, "com_mclk_out"),
                          omap_findclk(s, ((value >> 12) & 1) ?
                                  "ck_48m" : "armper_ck"));
-    if (diff & (1 << 9))			/* CONF_MOD_USB_HOST_HHC_UHO */
+    if (diff & (1 << 9))            /* CONF_MOD_USB_HOST_HHC_UHO */
          omap_clk_onoff(omap_findclk(s, "usb_hhc_ck"), (value >> 9) & 1);
 }
 
@@ -885,63 +885,63 @@ static void omap_pin_cfg_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* FUNC_MUX_CTRL_0 */
+    case 0x00:  /* FUNC_MUX_CTRL_0 */
         diff = s->func_mux_ctrl[addr >> 2] ^ value;
         s->func_mux_ctrl[addr >> 2] = value;
         omap_pin_funcmux0_update(s, diff, value);
         return;
 
-    case 0x04:	/* FUNC_MUX_CTRL_1 */
+    case 0x04:  /* FUNC_MUX_CTRL_1 */
         diff = s->func_mux_ctrl[addr >> 2] ^ value;
         s->func_mux_ctrl[addr >> 2] = value;
         omap_pin_funcmux1_update(s, diff, value);
         return;
 
-    case 0x08:	/* FUNC_MUX_CTRL_2 */
+    case 0x08:  /* FUNC_MUX_CTRL_2 */
         s->func_mux_ctrl[addr >> 2] = value;
         return;
 
-    case 0x0c:	/* COMP_MODE_CTRL_0 */
+    case 0x0c:  /* COMP_MODE_CTRL_0 */
         s->comp_mode_ctrl[0] = value;
         s->compat1509 = (value != 0x0000eaef);
         omap_pin_funcmux0_update(s, ~0, s->func_mux_ctrl[0]);
         omap_pin_funcmux1_update(s, ~0, s->func_mux_ctrl[1]);
         return;
 
-    case 0x10:	/* FUNC_MUX_CTRL_3 */
-    case 0x14:	/* FUNC_MUX_CTRL_4 */
-    case 0x18:	/* FUNC_MUX_CTRL_5 */
-    case 0x1c:	/* FUNC_MUX_CTRL_6 */
-    case 0x20:	/* FUNC_MUX_CTRL_7 */
-    case 0x24:	/* FUNC_MUX_CTRL_8 */
-    case 0x28:	/* FUNC_MUX_CTRL_9 */
-    case 0x2c:	/* FUNC_MUX_CTRL_A */
-    case 0x30:	/* FUNC_MUX_CTRL_B */
-    case 0x34:	/* FUNC_MUX_CTRL_C */
-    case 0x38:	/* FUNC_MUX_CTRL_D */
+    case 0x10:  /* FUNC_MUX_CTRL_3 */
+    case 0x14:  /* FUNC_MUX_CTRL_4 */
+    case 0x18:  /* FUNC_MUX_CTRL_5 */
+    case 0x1c:  /* FUNC_MUX_CTRL_6 */
+    case 0x20:  /* FUNC_MUX_CTRL_7 */
+    case 0x24:  /* FUNC_MUX_CTRL_8 */
+    case 0x28:  /* FUNC_MUX_CTRL_9 */
+    case 0x2c:  /* FUNC_MUX_CTRL_A */
+    case 0x30:  /* FUNC_MUX_CTRL_B */
+    case 0x34:  /* FUNC_MUX_CTRL_C */
+    case 0x38:  /* FUNC_MUX_CTRL_D */
         s->func_mux_ctrl[(addr >> 2) - 1] = value;
         return;
 
-    case 0x40:	/* PULL_DWN_CTRL_0 */
-    case 0x44:	/* PULL_DWN_CTRL_1 */
-    case 0x48:	/* PULL_DWN_CTRL_2 */
-    case 0x4c:	/* PULL_DWN_CTRL_3 */
+    case 0x40:  /* PULL_DWN_CTRL_0 */
+    case 0x44:  /* PULL_DWN_CTRL_1 */
+    case 0x48:  /* PULL_DWN_CTRL_2 */
+    case 0x4c:  /* PULL_DWN_CTRL_3 */
         s->pull_dwn_ctrl[(addr & 0xf) >> 2] = value;
         return;
 
-    case 0x50:	/* GATE_INH_CTRL_0 */
+    case 0x50:  /* GATE_INH_CTRL_0 */
         s->gate_inh_ctrl[0] = value;
         return;
 
-    case 0x60:	/* VOLTAGE_CTRL_0 */
+    case 0x60:  /* VOLTAGE_CTRL_0 */
         s->voltage_ctrl[0] = value;
         return;
 
-    case 0x70:	/* TEST_DBG_CTRL_0 */
+    case 0x70:  /* TEST_DBG_CTRL_0 */
         s->test_dbg_ctrl[0] = value;
         return;
 
-    case 0x80:	/* MOD_CONF_CTRL_0 */
+    case 0x80:  /* MOD_CONF_CTRL_0 */
         diff = s->mod_conf_ctrl[0] ^ value;
         s->mod_conf_ctrl[0] = value;
         omap_pin_modconf1_update(s, diff, value);
@@ -995,17 +995,17 @@ static uint64_t omap_id_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0xfffe1800:	/* DIE_ID_LSB */
+    case 0xfffe1800:    /* DIE_ID_LSB */
         return 0xc9581f0e;
-    case 0xfffe1804:	/* DIE_ID_MSB */
+    case 0xfffe1804:    /* DIE_ID_MSB */
         return 0xa8858bfa;
 
-    case 0xfffe2000:	/* PRODUCT_ID_LSB */
+    case 0xfffe2000:    /* PRODUCT_ID_LSB */
         return 0x00aaaafc;
-    case 0xfffe2004:	/* PRODUCT_ID_MSB */
+    case 0xfffe2004:    /* PRODUCT_ID_MSB */
         return 0xcafeb574;
 
-    case 0xfffed400:	/* JTAG_ID_LSB */
+    case 0xfffed400:    /* JTAG_ID_LSB */
         switch (s->mpu_model) {
         case omap310:
             return 0x03310315;
@@ -1016,7 +1016,7 @@ static uint64_t omap_id_read(void *opaque, hwaddr addr,
         }
         break;
 
-    case 0xfffed404:	/* JTAG_ID_MSB */
+    case 0xfffed404:    /* JTAG_ID_MSB */
         switch (s->mpu_model) {
         case omap310:
             return 0xfb57402f;
@@ -1077,22 +1077,22 @@ static uint64_t omap_mpui_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* CTRL */
+    case 0x00:  /* CTRL */
         return s->mpui_ctrl;
-    case 0x04:	/* DEBUG_ADDR */
+    case 0x04:  /* DEBUG_ADDR */
         return 0x01ffffff;
-    case 0x08:	/* DEBUG_DATA */
+    case 0x08:  /* DEBUG_DATA */
         return 0xffffffff;
-    case 0x0c:	/* DEBUG_FLAG */
+    case 0x0c:  /* DEBUG_FLAG */
         return 0x00000800;
-    case 0x10:	/* STATUS */
+    case 0x10:  /* STATUS */
         return 0x00000000;
 
     /* Not in OMAP310 */
-    case 0x14:	/* DSP_STATUS */
-    case 0x18:	/* DSP_BOOT_CONFIG */
+    case 0x14:  /* DSP_STATUS */
+    case 0x18:  /* DSP_BOOT_CONFIG */
         return 0x00000000;
-    case 0x1c:	/* DSP_MPUI_CONFIG */
+    case 0x1c:  /* DSP_MPUI_CONFIG */
         return 0x0000ffff;
     }
 
@@ -1111,20 +1111,20 @@ static void omap_mpui_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* CTRL */
+    case 0x00:  /* CTRL */
         s->mpui_ctrl = value & 0x007fffff;
         break;
 
-    case 0x04:	/* DEBUG_ADDR */
-    case 0x08:	/* DEBUG_DATA */
-    case 0x0c:	/* DEBUG_FLAG */
-    case 0x10:	/* STATUS */
+    case 0x04:  /* DEBUG_ADDR */
+    case 0x08:  /* DEBUG_DATA */
+    case 0x0c:  /* DEBUG_FLAG */
+    case 0x10:  /* STATUS */
     /* Not in OMAP310 */
-    case 0x14:	/* DSP_STATUS */
+    case 0x14:  /* DSP_STATUS */
         OMAP_RO_REG(addr);
         break;
-    case 0x18:	/* DSP_BOOT_CONFIG */
-    case 0x1c:	/* DSP_MPUI_CONFIG */
+    case 0x18:  /* DSP_BOOT_CONFIG */
+    case 0x1c:  /* DSP_MPUI_CONFIG */
         break;
 
     default:
@@ -1175,19 +1175,19 @@ static uint64_t omap_tipb_bridge_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* TIPB_CNTL */
+    case 0x00:  /* TIPB_CNTL */
         return s->control;
-    case 0x04:	/* TIPB_BUS_ALLOC */
+    case 0x04:  /* TIPB_BUS_ALLOC */
         return s->alloc;
-    case 0x08:	/* MPU_TIPB_CNTL */
+    case 0x08:  /* MPU_TIPB_CNTL */
         return s->buffer;
-    case 0x0c:	/* ENHANCED_TIPB_CNTL */
+    case 0x0c:  /* ENHANCED_TIPB_CNTL */
         return s->enh_control;
-    case 0x10:	/* ADDRESS_DBG */
-    case 0x14:	/* DATA_DEBUG_LOW */
-    case 0x18:	/* DATA_DEBUG_HIGH */
+    case 0x10:  /* ADDRESS_DBG */
+    case 0x14:  /* DATA_DEBUG_LOW */
+    case 0x18:  /* DATA_DEBUG_HIGH */
         return 0xffff;
-    case 0x1c:	/* DEBUG_CNTR_SIG */
+    case 0x1c:  /* DEBUG_CNTR_SIG */
         return 0x00f8;
     }
 
@@ -1206,27 +1206,27 @@ static void omap_tipb_bridge_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* TIPB_CNTL */
+    case 0x00:  /* TIPB_CNTL */
         s->control = value & 0xffff;
         break;
 
-    case 0x04:	/* TIPB_BUS_ALLOC */
+    case 0x04:  /* TIPB_BUS_ALLOC */
         s->alloc = value & 0x003f;
         break;
 
-    case 0x08:	/* MPU_TIPB_CNTL */
+    case 0x08:  /* MPU_TIPB_CNTL */
         s->buffer = value & 0x0003;
         break;
 
-    case 0x0c:	/* ENHANCED_TIPB_CNTL */
+    case 0x0c:  /* ENHANCED_TIPB_CNTL */
         s->width_intr = !(value & 2);
         s->enh_control = value & 0x000f;
         break;
 
-    case 0x10:	/* ADDRESS_DBG */
-    case 0x14:	/* DATA_DEBUG_LOW */
-    case 0x18:	/* DATA_DEBUG_HIGH */
-    case 0x1c:	/* DEBUG_CNTR_SIG */
+    case 0x10:  /* ADDRESS_DBG */
+    case 0x14:  /* DATA_DEBUG_LOW */
+    case 0x18:  /* DATA_DEBUG_HIGH */
+    case 0x1c:  /* DEBUG_CNTR_SIG */
         OMAP_RO_REG(addr);
         break;
 
@@ -1277,23 +1277,23 @@ static uint64_t omap_tcmi_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* IMIF_PRIO */
-    case 0x04:	/* EMIFS_PRIO */
-    case 0x08:	/* EMIFF_PRIO */
-    case 0x0c:	/* EMIFS_CONFIG */
-    case 0x10:	/* EMIFS_CS0_CONFIG */
-    case 0x14:	/* EMIFS_CS1_CONFIG */
-    case 0x18:	/* EMIFS_CS2_CONFIG */
-    case 0x1c:	/* EMIFS_CS3_CONFIG */
-    case 0x24:	/* EMIFF_MRS */
-    case 0x28:	/* TIMEOUT1 */
-    case 0x2c:	/* TIMEOUT2 */
-    case 0x30:	/* TIMEOUT3 */
-    case 0x3c:	/* EMIFF_SDRAM_CONFIG_2 */
-    case 0x40:	/* EMIFS_CFG_DYN_WAIT */
+    case 0x00:  /* IMIF_PRIO */
+    case 0x04:  /* EMIFS_PRIO */
+    case 0x08:  /* EMIFF_PRIO */
+    case 0x0c:  /* EMIFS_CONFIG */
+    case 0x10:  /* EMIFS_CS0_CONFIG */
+    case 0x14:  /* EMIFS_CS1_CONFIG */
+    case 0x18:  /* EMIFS_CS2_CONFIG */
+    case 0x1c:  /* EMIFS_CS3_CONFIG */
+    case 0x24:  /* EMIFF_MRS */
+    case 0x28:  /* TIMEOUT1 */
+    case 0x2c:  /* TIMEOUT2 */
+    case 0x30:  /* TIMEOUT3 */
+    case 0x3c:  /* EMIFF_SDRAM_CONFIG_2 */
+    case 0x40:  /* EMIFS_CFG_DYN_WAIT */
         return s->tcmi_regs[addr >> 2];
 
-    case 0x20:	/* EMIFF_SDRAM_CONFIG */
+    case 0x20:  /* EMIFF_SDRAM_CONFIG */
         ret = s->tcmi_regs[addr >> 2];
         s->tcmi_regs[addr >> 2] &= ~1; /* XXX: Clear SLRF on SDRAM access */
         /* XXX: We can try using the VGA_DIRTY flag for this */
@@ -1315,23 +1315,23 @@ static void omap_tcmi_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* IMIF_PRIO */
-    case 0x04:	/* EMIFS_PRIO */
-    case 0x08:	/* EMIFF_PRIO */
-    case 0x10:	/* EMIFS_CS0_CONFIG */
-    case 0x14:	/* EMIFS_CS1_CONFIG */
-    case 0x18:	/* EMIFS_CS2_CONFIG */
-    case 0x1c:	/* EMIFS_CS3_CONFIG */
-    case 0x20:	/* EMIFF_SDRAM_CONFIG */
-    case 0x24:	/* EMIFF_MRS */
-    case 0x28:	/* TIMEOUT1 */
-    case 0x2c:	/* TIMEOUT2 */
-    case 0x30:	/* TIMEOUT3 */
-    case 0x3c:	/* EMIFF_SDRAM_CONFIG_2 */
-    case 0x40:	/* EMIFS_CFG_DYN_WAIT */
+    case 0x00:  /* IMIF_PRIO */
+    case 0x04:  /* EMIFS_PRIO */
+    case 0x08:  /* EMIFF_PRIO */
+    case 0x10:  /* EMIFS_CS0_CONFIG */
+    case 0x14:  /* EMIFS_CS1_CONFIG */
+    case 0x18:  /* EMIFS_CS2_CONFIG */
+    case 0x1c:  /* EMIFS_CS3_CONFIG */
+    case 0x20:  /* EMIFF_SDRAM_CONFIG */
+    case 0x24:  /* EMIFF_MRS */
+    case 0x28:  /* TIMEOUT1 */
+    case 0x2c:  /* TIMEOUT2 */
+    case 0x30:  /* TIMEOUT3 */
+    case 0x3c:  /* EMIFF_SDRAM_CONFIG_2 */
+    case 0x40:  /* EMIFS_CFG_DYN_WAIT */
         s->tcmi_regs[addr >> 2] = value;
         break;
-    case 0x0c:	/* EMIFS_CONFIG */
+    case 0x0c:  /* EMIFS_CONFIG */
         s->tcmi_regs[addr >> 2] = (value & 0xf) | (1 << 4);
         break;
 
@@ -1390,7 +1390,7 @@ static uint64_t omap_dpll_read(void *opaque, hwaddr addr,
         return omap_badwidth_read16(opaque, addr);
     }
 
-    if (addr == 0x00)	/* CTL_REG */
+    if (addr == 0x00)   /* CTL_REG */
         return s->mode;
 
     OMAP_BAD_REG(addr);
@@ -1410,16 +1410,16 @@ static void omap_dpll_write(void *opaque, hwaddr addr,
         return;
     }
 
-    if (addr == 0x00) {	/* CTL_REG */
+    if (addr == 0x00) { /* CTL_REG */
         /* See omap_ulpd_pm_write() too */
         diff = s->mode & value;
         s->mode = value & 0x2fff;
         if (diff & (0x3ff << 2)) {
-            if (value & (1 << 4)) {			/* PLL_ENABLE */
-                div = ((value >> 5) & 3) + 1;		/* PLL_DIV */
-                mult = MIN((value >> 7) & 0x1f, 1);	/* PLL_MULT */
+            if (value & (1 << 4)) {         /* PLL_ENABLE */
+                div = ((value >> 5) & 3) + 1;       /* PLL_DIV */
+                mult = MIN((value >> 7) & 0x1f, 1); /* PLL_MULT */
             } else {
-                div = bypass_div[((value >> 2) & 3)];	/* BYPASS_DIV */
+                div = bypass_div[((value >> 2) & 3)];   /* BYPASS_DIV */
                 mult = 1;
             }
             omap_clk_setrate(s->dpll, div, mult);
@@ -1471,31 +1471,31 @@ static uint64_t omap_clkm_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* ARM_CKCTL */
+    case 0x00:  /* ARM_CKCTL */
         return s->clkm.arm_ckctl;
 
-    case 0x04:	/* ARM_IDLECT1 */
+    case 0x04:  /* ARM_IDLECT1 */
         return s->clkm.arm_idlect1;
 
-    case 0x08:	/* ARM_IDLECT2 */
+    case 0x08:  /* ARM_IDLECT2 */
         return s->clkm.arm_idlect2;
 
-    case 0x0c:	/* ARM_EWUPCT */
+    case 0x0c:  /* ARM_EWUPCT */
         return s->clkm.arm_ewupct;
 
-    case 0x10:	/* ARM_RSTCT1 */
+    case 0x10:  /* ARM_RSTCT1 */
         return s->clkm.arm_rstct1;
 
-    case 0x14:	/* ARM_RSTCT2 */
+    case 0x14:  /* ARM_RSTCT2 */
         return s->clkm.arm_rstct2;
 
-    case 0x18:	/* ARM_SYSST */
+    case 0x18:  /* ARM_SYSST */
         return (s->clkm.clocking_scheme << 11) | s->clkm.cold_start;
 
-    case 0x1c:	/* ARM_CKOUT1 */
+    case 0x1c:  /* ARM_CKOUT1 */
         return s->clkm.arm_ckout1;
 
-    case 0x20:	/* ARM_CKOUT2 */
+    case 0x20:  /* ARM_CKOUT2 */
         break;
     }
 
@@ -1508,7 +1508,7 @@ static inline void omap_clkm_ckctl_update(struct omap_mpu_state_s *s,
 {
     omap_clk clk;
 
-    if (diff & (1 << 14)) {				/* ARM_INTHCK_SEL */
+    if (diff & (1 << 14)) {             /* ARM_INTHCK_SEL */
         if (value & (1 << 14))
             /* Reserved */;
         else {
@@ -1516,7 +1516,7 @@ static inline void omap_clkm_ckctl_update(struct omap_mpu_state_s *s,
             omap_clk_reparent(clk, omap_findclk(s, "tc_ck"));
         }
     }
-    if (diff & (1 << 12)) {				/* ARM_TIMXO */
+    if (diff & (1 << 12)) {             /* ARM_TIMXO */
         clk = omap_findclk(s, "armtim_ck");
         if (value & (1 << 12))
             omap_clk_reparent(clk, omap_findclk(s, "clkin"));
@@ -1524,27 +1524,27 @@ static inline void omap_clkm_ckctl_update(struct omap_mpu_state_s *s,
             omap_clk_reparent(clk, omap_findclk(s, "ck_gen1"));
     }
     /* XXX: en_dspck */
-    if (diff & (3 << 10)) {				/* DSPMMUDIV */
+    if (diff & (3 << 10)) {             /* DSPMMUDIV */
         clk = omap_findclk(s, "dspmmu_ck");
         omap_clk_setrate(clk, 1 << ((value >> 10) & 3), 1);
     }
-    if (diff & (3 << 8)) {				/* TCDIV */
+    if (diff & (3 << 8)) {              /* TCDIV */
         clk = omap_findclk(s, "tc_ck");
         omap_clk_setrate(clk, 1 << ((value >> 8) & 3), 1);
     }
-    if (diff & (3 << 6)) {				/* DSPDIV */
+    if (diff & (3 << 6)) {              /* DSPDIV */
         clk = omap_findclk(s, "dsp_ck");
         omap_clk_setrate(clk, 1 << ((value >> 6) & 3), 1);
     }
-    if (diff & (3 << 4)) {				/* ARMDIV */
+    if (diff & (3 << 4)) {              /* ARMDIV */
         clk = omap_findclk(s, "arm_ck");
         omap_clk_setrate(clk, 1 << ((value >> 4) & 3), 1);
     }
-    if (diff & (3 << 2)) {				/* LCDDIV */
+    if (diff & (3 << 2)) {              /* LCDDIV */
         clk = omap_findclk(s, "lcd_ck");
         omap_clk_setrate(clk, 1 << ((value >> 2) & 3), 1);
     }
-    if (diff & (3 << 0)) {				/* PERDIV */
+    if (diff & (3 << 0)) {              /* PERDIV */
         clk = omap_findclk(s, "armper_ck");
         omap_clk_setrate(clk, 1 << ((value >> 0) & 3), 1);
     }
@@ -1563,25 +1563,25 @@ static inline void omap_clkm_idlect1_update(struct omap_mpu_state_s *s,
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
 
-#define SET_CANIDLE(clock, bit)				\
-    if (diff & (1 << bit)) {				\
-        clk = omap_findclk(s, clock);			\
-        omap_clk_canidle(clk, (value >> bit) & 1);	\
+#define SET_CANIDLE(clock, bit)             \
+    if (diff & (1 << bit)) {                \
+        clk = omap_findclk(s, clock);           \
+        omap_clk_canidle(clk, (value >> bit) & 1);  \
     }
-    SET_CANIDLE("mpuwd_ck", 0)				/* IDLWDT_ARM */
-    SET_CANIDLE("armxor_ck", 1)				/* IDLXORP_ARM */
-    SET_CANIDLE("mpuper_ck", 2)				/* IDLPER_ARM */
-    SET_CANIDLE("lcd_ck", 3)				/* IDLLCD_ARM */
-    SET_CANIDLE("lb_ck", 4)				/* IDLLB_ARM */
-    SET_CANIDLE("hsab_ck", 5)				/* IDLHSAB_ARM */
-    SET_CANIDLE("tipb_ck", 6)				/* IDLIF_ARM */
-    SET_CANIDLE("dma_ck", 6)				/* IDLIF_ARM */
-    SET_CANIDLE("tc_ck", 6)				/* IDLIF_ARM */
-    SET_CANIDLE("dpll1", 7)				/* IDLDPLL_ARM */
-    SET_CANIDLE("dpll2", 7)				/* IDLDPLL_ARM */
-    SET_CANIDLE("dpll3", 7)				/* IDLDPLL_ARM */
-    SET_CANIDLE("mpui_ck", 8)				/* IDLAPI_ARM */
-    SET_CANIDLE("armtim_ck", 9)				/* IDLTIM_ARM */
+    SET_CANIDLE("mpuwd_ck", 0)              /* IDLWDT_ARM */
+    SET_CANIDLE("armxor_ck", 1)             /* IDLXORP_ARM */
+    SET_CANIDLE("mpuper_ck", 2)             /* IDLPER_ARM */
+    SET_CANIDLE("lcd_ck", 3)                /* IDLLCD_ARM */
+    SET_CANIDLE("lb_ck", 4)             /* IDLLB_ARM */
+    SET_CANIDLE("hsab_ck", 5)               /* IDLHSAB_ARM */
+    SET_CANIDLE("tipb_ck", 6)               /* IDLIF_ARM */
+    SET_CANIDLE("dma_ck", 6)                /* IDLIF_ARM */
+    SET_CANIDLE("tc_ck", 6)             /* IDLIF_ARM */
+    SET_CANIDLE("dpll1", 7)             /* IDLDPLL_ARM */
+    SET_CANIDLE("dpll2", 7)             /* IDLDPLL_ARM */
+    SET_CANIDLE("dpll3", 7)             /* IDLDPLL_ARM */
+    SET_CANIDLE("mpui_ck", 8)               /* IDLAPI_ARM */
+    SET_CANIDLE("armtim_ck", 9)             /* IDLTIM_ARM */
 }
 
 static inline void omap_clkm_idlect2_update(struct omap_mpu_state_s *s,
@@ -1589,22 +1589,22 @@ static inline void omap_clkm_idlect2_update(struct omap_mpu_state_s *s,
 {
     omap_clk clk;
 
-#define SET_ONOFF(clock, bit)				\
-    if (diff & (1 << bit)) {				\
-        clk = omap_findclk(s, clock);			\
-        omap_clk_onoff(clk, (value >> bit) & 1);	\
+#define SET_ONOFF(clock, bit)               \
+    if (diff & (1 << bit)) {                \
+        clk = omap_findclk(s, clock);           \
+        omap_clk_onoff(clk, (value >> bit) & 1);    \
     }
-    SET_ONOFF("mpuwd_ck", 0)				/* EN_WDTCK */
-    SET_ONOFF("armxor_ck", 1)				/* EN_XORPCK */
-    SET_ONOFF("mpuper_ck", 2)				/* EN_PERCK */
-    SET_ONOFF("lcd_ck", 3)				/* EN_LCDCK */
-    SET_ONOFF("lb_ck", 4)				/* EN_LBCK */
-    SET_ONOFF("hsab_ck", 5)				/* EN_HSABCK */
-    SET_ONOFF("mpui_ck", 6)				/* EN_APICK */
-    SET_ONOFF("armtim_ck", 7)				/* EN_TIMCK */
-    SET_CANIDLE("dma_ck", 8)				/* DMACK_REQ */
-    SET_ONOFF("arm_gpio_ck", 9)				/* EN_GPIOCK */
-    SET_ONOFF("lbfree_ck", 10)				/* EN_LBFREECK */
+    SET_ONOFF("mpuwd_ck", 0)                /* EN_WDTCK */
+    SET_ONOFF("armxor_ck", 1)               /* EN_XORPCK */
+    SET_ONOFF("mpuper_ck", 2)               /* EN_PERCK */
+    SET_ONOFF("lcd_ck", 3)              /* EN_LCDCK */
+    SET_ONOFF("lb_ck", 4)               /* EN_LBCK */
+    SET_ONOFF("hsab_ck", 5)             /* EN_HSABCK */
+    SET_ONOFF("mpui_ck", 6)             /* EN_APICK */
+    SET_ONOFF("armtim_ck", 7)               /* EN_TIMCK */
+    SET_CANIDLE("dma_ck", 8)                /* DMACK_REQ */
+    SET_ONOFF("arm_gpio_ck", 9)             /* EN_GPIOCK */
+    SET_ONOFF("lbfree_ck", 10)              /* EN_LBFREECK */
 }
 
 static inline void omap_clkm_ckout1_update(struct omap_mpu_state_s *s,
@@ -1612,7 +1612,7 @@ static inline void omap_clkm_ckout1_update(struct omap_mpu_state_s *s,
 {
     omap_clk clk;
 
-    if (diff & (3 << 4)) {				/* TCLKOUT */
+    if (diff & (3 << 4)) {              /* TCLKOUT */
         clk = omap_findclk(s, "tclk_out");
         switch ((value >> 4) & 3) {
         case 1:
@@ -1627,7 +1627,7 @@ static inline void omap_clkm_ckout1_update(struct omap_mpu_state_s *s,
             omap_clk_onoff(clk, 0);
         }
     }
-    if (diff & (3 << 2)) {				/* DCLKOUT */
+    if (diff & (3 << 2)) {              /* DCLKOUT */
         clk = omap_findclk(s, "dclk_out");
         switch ((value >> 2) & 3) {
         case 0:
@@ -1644,7 +1644,7 @@ static inline void omap_clkm_ckout1_update(struct omap_mpu_state_s *s,
             break;
         }
     }
-    if (diff & (3 << 0)) {				/* ACLKOUT */
+    if (diff & (3 << 0)) {              /* ACLKOUT */
         clk = omap_findclk(s, "aclk_out");
         switch ((value >> 0) & 3) {
         case 1:
@@ -1682,51 +1682,51 @@ static void omap_clkm_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* ARM_CKCTL */
+    case 0x00:  /* ARM_CKCTL */
         diff = s->clkm.arm_ckctl ^ value;
         s->clkm.arm_ckctl = value & 0x7fff;
         omap_clkm_ckctl_update(s, diff, value);
         return;
 
-    case 0x04:	/* ARM_IDLECT1 */
+    case 0x04:  /* ARM_IDLECT1 */
         diff = s->clkm.arm_idlect1 ^ value;
         s->clkm.arm_idlect1 = value & 0x0fff;
         omap_clkm_idlect1_update(s, diff, value);
         return;
 
-    case 0x08:	/* ARM_IDLECT2 */
+    case 0x08:  /* ARM_IDLECT2 */
         diff = s->clkm.arm_idlect2 ^ value;
         s->clkm.arm_idlect2 = value & 0x07ff;
         omap_clkm_idlect2_update(s, diff, value);
         return;
 
-    case 0x0c:	/* ARM_EWUPCT */
+    case 0x0c:  /* ARM_EWUPCT */
         s->clkm.arm_ewupct = value & 0x003f;
         return;
 
-    case 0x10:	/* ARM_RSTCT1 */
+    case 0x10:  /* ARM_RSTCT1 */
         diff = s->clkm.arm_rstct1 ^ value;
         s->clkm.arm_rstct1 = value & 0x0007;
         if (value & 9) {
             qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
             s->clkm.cold_start = 0xa;
         }
-        if (diff & ~value & 4) {				/* DSP_RST */
+        if (diff & ~value & 4) {                /* DSP_RST */
             omap_mpui_reset(s);
             omap_tipb_bridge_reset(s->private_tipb);
             omap_tipb_bridge_reset(s->public_tipb);
         }
-        if (diff & 2) {						/* DSP_EN */
+        if (diff & 2) {                     /* DSP_EN */
             clk = omap_findclk(s, "dsp_ck");
             omap_clk_canidle(clk, (~value >> 1) & 1);
         }
         return;
 
-    case 0x14:	/* ARM_RSTCT2 */
+    case 0x14:  /* ARM_RSTCT2 */
         s->clkm.arm_rstct2 = value & 0x0001;
         return;
 
-    case 0x18:	/* ARM_SYSST */
+    case 0x18:  /* ARM_SYSST */
         if ((s->clkm.clocking_scheme ^ (value >> 11)) & 7) {
             s->clkm.clocking_scheme = (value >> 11) & 7;
             printf("%s: clocking scheme set to %s\n", __func__,
@@ -1735,13 +1735,13 @@ static void omap_clkm_write(void *opaque, hwaddr addr,
         s->clkm.cold_start &= value & 0x3f;
         return;
 
-    case 0x1c:	/* ARM_CKOUT1 */
+    case 0x1c:  /* ARM_CKOUT1 */
         diff = s->clkm.arm_ckout1 ^ value;
         s->clkm.arm_ckout1 = value & 0x003f;
         omap_clkm_ckout1_update(s, diff, value);
         return;
 
-    case 0x20:	/* ARM_CKOUT2 */
+    case 0x20:  /* ARM_CKOUT2 */
     default:
         OMAP_BAD_REG(addr);
     }
@@ -1764,16 +1764,16 @@ static uint64_t omap_clkdsp_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x04:	/* DSP_IDLECT1 */
+    case 0x04:  /* DSP_IDLECT1 */
         return s->clkm.dsp_idlect1;
 
-    case 0x08:	/* DSP_IDLECT2 */
+    case 0x08:  /* DSP_IDLECT2 */
         return s->clkm.dsp_idlect2;
 
-    case 0x14:	/* DSP_RSTCT2 */
+    case 0x14:  /* DSP_RSTCT2 */
         return s->clkm.dsp_rstct2;
 
-    case 0x18:	/* DSP_SYSST */
+    case 0x18:  /* DSP_SYSST */
         return (s->clkm.clocking_scheme << 11) | s->clkm.cold_start |
                 (cpu->halted << 6);      /* Quite useless... */
     }
@@ -1787,7 +1787,7 @@ static inline void omap_clkdsp_idlect1_update(struct omap_mpu_state_s *s,
 {
     omap_clk clk;
 
-    SET_CANIDLE("dspxor_ck", 1);			/* IDLXORP_DSP */
+    SET_CANIDLE("dspxor_ck", 1);            /* IDLXORP_DSP */
 }
 
 static inline void omap_clkdsp_idlect2_update(struct omap_mpu_state_s *s,
@@ -1795,7 +1795,7 @@ static inline void omap_clkdsp_idlect2_update(struct omap_mpu_state_s *s,
 {
     omap_clk clk;
 
-    SET_ONOFF("dspxor_ck", 1);				/* EN_XORPCK */
+    SET_ONOFF("dspxor_ck", 1);              /* EN_XORPCK */
 }
 
 static void omap_clkdsp_write(void *opaque, hwaddr addr,
@@ -1810,23 +1810,23 @@ static void omap_clkdsp_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x04:	/* DSP_IDLECT1 */
+    case 0x04:  /* DSP_IDLECT1 */
         diff = s->clkm.dsp_idlect1 ^ value;
         s->clkm.dsp_idlect1 = value & 0x01f7;
         omap_clkdsp_idlect1_update(s, diff, value);
         break;
 
-    case 0x08:	/* DSP_IDLECT2 */
+    case 0x08:  /* DSP_IDLECT2 */
         s->clkm.dsp_idlect2 = value & 0x0037;
         diff = s->clkm.dsp_idlect1 ^ value;
         omap_clkdsp_idlect2_update(s, diff, value);
         break;
 
-    case 0x14:	/* DSP_RSTCT2 */
+    case 0x14:  /* DSP_RSTCT2 */
         s->clkm.dsp_rstct2 = value & 0x0001;
         break;
 
-    case 0x18:	/* DSP_SYSST */
+    case 0x18:  /* DSP_SYSST */
         s->clkm.cold_start &= value & 0x3f;
         break;
 
@@ -1925,8 +1925,8 @@ static void omap_mpuio_set(void *opaque, int line, int level)
             qemu_irq_raise(s->irq);
             /* TODO: wakeup */
         }
-        if ((s->event & (1 << 0)) &&		/* SET_GPIO_EVENT_MODE */
-                (s->event >> 1) == line)	/* PIN_SELECT */
+        if ((s->event & (1 << 0)) &&        /* SET_GPIO_EVENT_MODE */
+                (s->event >> 1) == line)    /* PIN_SELECT */
             s->latch = s->inputs;
     }
 }
@@ -1956,47 +1956,47 @@ static uint64_t omap_mpuio_read(void *opaque, hwaddr addr,
     }
 
     switch (offset) {
-    case 0x00:	/* INPUT_LATCH */
+    case 0x00:  /* INPUT_LATCH */
         return s->inputs;
 
-    case 0x04:	/* OUTPUT_REG */
+    case 0x04:  /* OUTPUT_REG */
         return s->outputs;
 
-    case 0x08:	/* IO_CNTL */
+    case 0x08:  /* IO_CNTL */
         return s->dir;
 
-    case 0x10:	/* KBR_LATCH */
+    case 0x10:  /* KBR_LATCH */
         return s->row_latch;
 
-    case 0x14:	/* KBC_REG */
+    case 0x14:  /* KBC_REG */
         return s->cols;
 
-    case 0x18:	/* GPIO_EVENT_MODE_REG */
+    case 0x18:  /* GPIO_EVENT_MODE_REG */
         return s->event;
 
-    case 0x1c:	/* GPIO_INT_EDGE_REG */
+    case 0x1c:  /* GPIO_INT_EDGE_REG */
         return s->edge;
 
-    case 0x20:	/* KBD_INT */
+    case 0x20:  /* KBD_INT */
         return (~s->row_latch & 0x1f) && !s->kbd_mask;
 
-    case 0x24:	/* GPIO_INT */
+    case 0x24:  /* GPIO_INT */
         ret = s->ints;
         s->ints &= s->mask;
         if (ret)
             qemu_irq_lower(s->irq);
         return ret;
 
-    case 0x28:	/* KBD_MASKIT */
+    case 0x28:  /* KBD_MASKIT */
         return s->kbd_mask;
 
-    case 0x2c:	/* GPIO_MASKIT */
+    case 0x2c:  /* GPIO_MASKIT */
         return s->mask;
 
-    case 0x30:	/* GPIO_DEBOUNCING_REG */
+    case 0x30:  /* GPIO_DEBOUNCING_REG */
         return s->debounce;
 
-    case 0x34:	/* GPIO_LATCH_REG */
+    case 0x34:  /* GPIO_LATCH_REG */
         return s->latch;
     }
 
@@ -2018,7 +2018,7 @@ static void omap_mpuio_write(void *opaque, hwaddr addr,
     }
 
     switch (offset) {
-    case 0x04:	/* OUTPUT_REG */
+    case 0x04:  /* OUTPUT_REG */
         diff = (s->outputs ^ value) & ~s->dir;
         s->outputs = value;
         while ((ln = ctz32(diff)) != 32) {
@@ -2028,7 +2028,7 @@ static void omap_mpuio_write(void *opaque, hwaddr addr,
         }
         break;
 
-    case 0x08:	/* IO_CNTL */
+    case 0x08:  /* IO_CNTL */
         diff = s->outputs & (s->dir ^ value);
         s->dir = value;
 
@@ -2040,37 +2040,37 @@ static void omap_mpuio_write(void *opaque, hwaddr addr,
         }
         break;
 
-    case 0x14:	/* KBC_REG */
+    case 0x14:  /* KBC_REG */
         s->cols = value;
         omap_mpuio_kbd_update(s);
         break;
 
-    case 0x18:	/* GPIO_EVENT_MODE_REG */
+    case 0x18:  /* GPIO_EVENT_MODE_REG */
         s->event = value & 0x1f;
         break;
 
-    case 0x1c:	/* GPIO_INT_EDGE_REG */
+    case 0x1c:  /* GPIO_INT_EDGE_REG */
         s->edge = value;
         break;
 
-    case 0x28:	/* KBD_MASKIT */
+    case 0x28:  /* KBD_MASKIT */
         s->kbd_mask = value & 1;
         omap_mpuio_kbd_update(s);
         break;
 
-    case 0x2c:	/* GPIO_MASKIT */
+    case 0x2c:  /* GPIO_MASKIT */
         s->mask = value;
         break;
 
-    case 0x30:	/* GPIO_DEBOUNCING_REG */
+    case 0x30:  /* GPIO_DEBOUNCING_REG */
         s->debounce = value & 0x1ff;
         break;
 
-    case 0x00:	/* INPUT_LATCH */
-    case 0x10:	/* KBR_LATCH */
-    case 0x20:	/* KBD_INT */
-    case 0x24:	/* GPIO_INT */
-    case 0x34:	/* GPIO_LATCH_REG */
+    case 0x00:  /* INPUT_LATCH */
+    case 0x10:  /* KBR_LATCH */
+    case 0x20:  /* KBD_INT */
+    case 0x24:  /* GPIO_INT */
+    case 0x34:  /* GPIO_LATCH_REG */
         OMAP_RO_REG(addr);
         return;
 
@@ -2175,24 +2175,24 @@ struct omap_uwire_s {
 
 static void omap_uwire_transfer_start(struct omap_uwire_s *s)
 {
-    int chipselect = (s->control >> 10) & 3;		/* INDEX */
+    int chipselect = (s->control >> 10) & 3;        /* INDEX */
     uWireSlave *slave = s->chip[chipselect];
 
-    if ((s->control >> 5) & 0x1f) {			/* NB_BITS_WR */
-        if (s->control & (1 << 12))			/* CS_CMD */
+    if ((s->control >> 5) & 0x1f) {         /* NB_BITS_WR */
+        if (s->control & (1 << 12))         /* CS_CMD */
             if (slave && slave->send)
                 slave->send(slave->opaque,
                                 s->txbuf >> (16 - ((s->control >> 5) & 0x1f)));
-        s->control &= ~(1 << 14);			/* CSRB */
+        s->control &= ~(1 << 14);           /* CSRB */
         /* TODO: depending on s->setup[4] bits [1:0] assert an IRQ or
          * a DRQ.  When is the level IRQ supposed to be reset?  */
     }
 
-    if ((s->control >> 0) & 0x1f) {			/* NB_BITS_RD */
-        if (s->control & (1 << 12))			/* CS_CMD */
+    if ((s->control >> 0) & 0x1f) {         /* NB_BITS_RD */
+        if (s->control & (1 << 12))         /* CS_CMD */
             if (slave && slave->receive)
                 s->rxbuf = slave->receive(slave->opaque);
-        s->control |= 1 << 15;				/* RDRB */
+        s->control |= 1 << 15;              /* RDRB */
         /* TODO: depending on s->setup[4] bits [1:0] assert an IRQ or
          * a DRQ.  When is the level IRQ supposed to be reset?  */
     }
@@ -2208,22 +2208,22 @@ static uint64_t omap_uwire_read(void *opaque, hwaddr addr, unsigned size)
     }
 
     switch (offset) {
-    case 0x00:	/* RDR */
-        s->control &= ~(1 << 15);			/* RDRB */
+    case 0x00:  /* RDR */
+        s->control &= ~(1 << 15);           /* RDRB */
         return s->rxbuf;
 
-    case 0x04:	/* CSR */
+    case 0x04:  /* CSR */
         return s->control;
 
-    case 0x08:	/* SR1 */
+    case 0x08:  /* SR1 */
         return s->setup[0];
-    case 0x0c:	/* SR2 */
+    case 0x0c:  /* SR2 */
         return s->setup[1];
-    case 0x10:	/* SR3 */
+    case 0x10:  /* SR3 */
         return s->setup[2];
-    case 0x14:	/* SR4 */
+    case 0x14:  /* SR4 */
         return s->setup[3];
-    case 0x18:	/* SR5 */
+    case 0x18:  /* SR5 */
         return s->setup[4];
     }
 
@@ -2243,39 +2243,39 @@ static void omap_uwire_write(void *opaque, hwaddr addr,
     }
 
     switch (offset) {
-    case 0x00:	/* TDR */
-        s->txbuf = value;				/* TD */
-        if ((s->setup[4] & (1 << 2)) &&			/* AUTO_TX_EN */
-                        ((s->setup[4] & (1 << 3)) ||	/* CS_TOGGLE_TX_EN */
-                         (s->control & (1 << 12)))) {	/* CS_CMD */
-            s->control |= 1 << 14;			/* CSRB */
+    case 0x00:  /* TDR */
+        s->txbuf = value;               /* TD */
+        if ((s->setup[4] & (1 << 2)) &&         /* AUTO_TX_EN */
+                        ((s->setup[4] & (1 << 3)) ||    /* CS_TOGGLE_TX_EN */
+                         (s->control & (1 << 12)))) {   /* CS_CMD */
+            s->control |= 1 << 14;          /* CSRB */
             omap_uwire_transfer_start(s);
         }
         break;
 
-    case 0x04:	/* CSR */
+    case 0x04:  /* CSR */
         s->control = value & 0x1fff;
-        if (value & (1 << 13))				/* START */
+        if (value & (1 << 13))              /* START */
             omap_uwire_transfer_start(s);
         break;
 
-    case 0x08:	/* SR1 */
+    case 0x08:  /* SR1 */
         s->setup[0] = value & 0x003f;
         break;
 
-    case 0x0c:	/* SR2 */
+    case 0x0c:  /* SR2 */
         s->setup[1] = value & 0x0fc0;
         break;
 
-    case 0x10:	/* SR3 */
+    case 0x10:  /* SR3 */
         s->setup[2] = value & 0x0003;
         break;
 
-    case 0x14:	/* SR4 */
+    case 0x14:  /* SR4 */
         s->setup[3] = value & 0x0001;
         break;
 
-    case 0x18:	/* SR5 */
+    case 0x18:  /* SR5 */
         s->setup[4] = value & 0x000f;
         break;
 
@@ -2360,9 +2360,9 @@ static uint64_t omap_pwl_read(void *opaque, hwaddr addr, unsigned size)
     }
 
     switch (offset) {
-    case 0x00:	/* PWL_LEVEL */
+    case 0x00:  /* PWL_LEVEL */
         return s->level;
-    case 0x04:	/* PWL_CTRL */
+    case 0x04:  /* PWL_CTRL */
         return s->enable;
     }
     OMAP_BAD_REG(addr);
@@ -2381,11 +2381,11 @@ static void omap_pwl_write(void *opaque, hwaddr addr,
     }
 
     switch (offset) {
-    case 0x00:	/* PWL_LEVEL */
+    case 0x00:  /* PWL_LEVEL */
         s->level = value;
         omap_pwl_update(s);
         break;
-    case 0x04:	/* PWL_CTRL */
+    case 0x04:  /* PWL_CTRL */
         s->enable = value & 1;
         omap_pwl_update(s);
         break;
@@ -2453,11 +2453,11 @@ static uint64_t omap_pwt_read(void *opaque, hwaddr addr, unsigned size)
     }
 
     switch (offset) {
-    case 0x00:	/* FRC */
+    case 0x00:  /* FRC */
         return s->frc;
-    case 0x04:	/* VCR */
+    case 0x04:  /* VCR */
         return s->vrc;
-    case 0x08:	/* GCR */
+    case 0x08:  /* GCR */
         return s->gcr;
     }
     OMAP_BAD_REG(addr);
@@ -2476,10 +2476,10 @@ static void omap_pwt_write(void *opaque, hwaddr addr,
     }
 
     switch (offset) {
-    case 0x00:	/* FRC */
+    case 0x00:  /* FRC */
         s->frc = value & 0x3f;
         break;
-    case 0x04:	/* VRC */
+    case 0x04:  /* VRC */
         if ((value ^ s->vrc) & 1) {
             if (value & 1)
                 printf("%s: %iHz buzz on\n", __func__, (int)
@@ -2503,7 +2503,7 @@ static void omap_pwt_write(void *opaque, hwaddr addr,
         }
         s->vrc = value & 0x7f;
         break;
-    case 0x08:	/* GCR */
+    case 0x08:  /* GCR */
         s->gcr = value & 3;
         break;
     default:
@@ -2585,69 +2585,69 @@ static uint64_t omap_rtc_read(void *opaque, hwaddr addr, unsigned size)
     }
 
     switch (offset) {
-    case 0x00:	/* SECONDS_REG */
+    case 0x00:  /* SECONDS_REG */
         return to_bcd(s->current_tm.tm_sec);
 
-    case 0x04:	/* MINUTES_REG */
+    case 0x04:  /* MINUTES_REG */
         return to_bcd(s->current_tm.tm_min);
 
-    case 0x08:	/* HOURS_REG */
+    case 0x08:  /* HOURS_REG */
         if (s->pm_am)
             return ((s->current_tm.tm_hour > 11) << 7) |
                     to_bcd(((s->current_tm.tm_hour - 1) % 12) + 1);
         else
             return to_bcd(s->current_tm.tm_hour);
 
-    case 0x0c:	/* DAYS_REG */
+    case 0x0c:  /* DAYS_REG */
         return to_bcd(s->current_tm.tm_mday);
 
-    case 0x10:	/* MONTHS_REG */
+    case 0x10:  /* MONTHS_REG */
         return to_bcd(s->current_tm.tm_mon + 1);
 
-    case 0x14:	/* YEARS_REG */
+    case 0x14:  /* YEARS_REG */
         return to_bcd(s->current_tm.tm_year % 100);
 
-    case 0x18:	/* WEEK_REG */
+    case 0x18:  /* WEEK_REG */
         return s->current_tm.tm_wday;
 
-    case 0x20:	/* ALARM_SECONDS_REG */
+    case 0x20:  /* ALARM_SECONDS_REG */
         return to_bcd(s->alarm_tm.tm_sec);
 
-    case 0x24:	/* ALARM_MINUTES_REG */
+    case 0x24:  /* ALARM_MINUTES_REG */
         return to_bcd(s->alarm_tm.tm_min);
 
-    case 0x28:	/* ALARM_HOURS_REG */
+    case 0x28:  /* ALARM_HOURS_REG */
         if (s->pm_am)
             return ((s->alarm_tm.tm_hour > 11) << 7) |
                     to_bcd(((s->alarm_tm.tm_hour - 1) % 12) + 1);
         else
             return to_bcd(s->alarm_tm.tm_hour);
 
-    case 0x2c:	/* ALARM_DAYS_REG */
+    case 0x2c:  /* ALARM_DAYS_REG */
         return to_bcd(s->alarm_tm.tm_mday);
 
-    case 0x30:	/* ALARM_MONTHS_REG */
+    case 0x30:  /* ALARM_MONTHS_REG */
         return to_bcd(s->alarm_tm.tm_mon + 1);
 
-    case 0x34:	/* ALARM_YEARS_REG */
+    case 0x34:  /* ALARM_YEARS_REG */
         return to_bcd(s->alarm_tm.tm_year % 100);
 
-    case 0x40:	/* RTC_CTRL_REG */
+    case 0x40:  /* RTC_CTRL_REG */
         return (s->pm_am << 3) | (s->auto_comp << 2) |
                 (s->round << 1) | s->running;
 
-    case 0x44:	/* RTC_STATUS_REG */
+    case 0x44:  /* RTC_STATUS_REG */
         i = s->status;
         s->status &= ~0x3d;
         return i;
 
-    case 0x48:	/* RTC_INTERRUPTS_REG */
+    case 0x48:  /* RTC_INTERRUPTS_REG */
         return s->interrupts;
 
-    case 0x4c:	/* RTC_COMP_LSB_REG */
+    case 0x4c:  /* RTC_COMP_LSB_REG */
         return ((uint16_t) s->comp_reg) & 0xff;
 
-    case 0x50:	/* RTC_COMP_MSB_REG */
+    case 0x50:  /* RTC_COMP_MSB_REG */
         return ((uint16_t) s->comp_reg) >> 8;
     }
 
@@ -2669,7 +2669,7 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
     }
 
     switch (offset) {
-    case 0x00:	/* SECONDS_REG */
+    case 0x00:  /* SECONDS_REG */
 #ifdef ALMDEBUG
         printf("RTC SEC_REG <-- %02x\n", value);
 #endif
@@ -2677,7 +2677,7 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         s->ti += from_bcd(value);
         return;
 
-    case 0x04:	/* MINUTES_REG */
+    case 0x04:  /* MINUTES_REG */
 #ifdef ALMDEBUG
         printf("RTC MIN_REG <-- %02x\n", value);
 #endif
@@ -2685,7 +2685,7 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         s->ti += from_bcd(value) * 60;
         return;
 
-    case 0x08:	/* HOURS_REG */
+    case 0x08:  /* HOURS_REG */
 #ifdef ALMDEBUG
         printf("RTC HRS_REG <-- %02x\n", value);
 #endif
@@ -2697,7 +2697,7 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
             s->ti += from_bcd(value & 0x3f) * 3600;
         return;
 
-    case 0x0c:	/* DAYS_REG */
+    case 0x0c:  /* DAYS_REG */
 #ifdef ALMDEBUG
         printf("RTC DAY_REG <-- %02x\n", value);
 #endif
@@ -2705,7 +2705,7 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         s->ti += from_bcd(value) * 86400;
         return;
 
-    case 0x10:	/* MONTHS_REG */
+    case 0x10:  /* MONTHS_REG */
 #ifdef ALMDEBUG
         printf("RTC MTH_REG <-- %02x\n", value);
 #endif
@@ -2724,7 +2724,7 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         }
         return;
 
-    case 0x14:	/* YEARS_REG */
+    case 0x14:  /* YEARS_REG */
 #ifdef ALMDEBUG
         printf("RTC YRS_REG <-- %02x\n", value);
 #endif
@@ -2743,10 +2743,10 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         }
         return;
 
-    case 0x18:	/* WEEK_REG */
-        return;	/* Ignored */
+    case 0x18:  /* WEEK_REG */
+        return; /* Ignored */
 
-    case 0x20:	/* ALARM_SECONDS_REG */
+    case 0x20:  /* ALARM_SECONDS_REG */
 #ifdef ALMDEBUG
         printf("ALM SEC_REG <-- %02x\n", value);
 #endif
@@ -2754,7 +2754,7 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         omap_rtc_alarm_update(s);
         return;
 
-    case 0x24:	/* ALARM_MINUTES_REG */
+    case 0x24:  /* ALARM_MINUTES_REG */
 #ifdef ALMDEBUG
         printf("ALM MIN_REG <-- %02x\n", value);
 #endif
@@ -2762,7 +2762,7 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         omap_rtc_alarm_update(s);
         return;
 
-    case 0x28:	/* ALARM_HOURS_REG */
+    case 0x28:  /* ALARM_HOURS_REG */
 #ifdef ALMDEBUG
         printf("ALM HRS_REG <-- %02x\n", value);
 #endif
@@ -2775,7 +2775,7 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         omap_rtc_alarm_update(s);
         return;
 
-    case 0x2c:	/* ALARM_DAYS_REG */
+    case 0x2c:  /* ALARM_DAYS_REG */
 #ifdef ALMDEBUG
         printf("ALM DAY_REG <-- %02x\n", value);
 #endif
@@ -2783,7 +2783,7 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         omap_rtc_alarm_update(s);
         return;
 
-    case 0x30:	/* ALARM_MONTHS_REG */
+    case 0x30:  /* ALARM_MONTHS_REG */
 #ifdef ALMDEBUG
         printf("ALM MON_REG <-- %02x\n", value);
 #endif
@@ -2791,7 +2791,7 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         omap_rtc_alarm_update(s);
         return;
 
-    case 0x34:	/* ALARM_YEARS_REG */
+    case 0x34:  /* ALARM_YEARS_REG */
 #ifdef ALMDEBUG
         printf("ALM YRS_REG <-- %02x\n", value);
 #endif
@@ -2799,7 +2799,7 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         omap_rtc_alarm_update(s);
         return;
 
-    case 0x40:	/* RTC_CTRL_REG */
+    case 0x40:  /* RTC_CTRL_REG */
 #ifdef ALMDEBUG
         printf("RTC CONTROL <-- %02x\n", value);
 #endif
@@ -2811,7 +2811,7 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         s->status |= s->running << 1;
         return;
 
-    case 0x44:	/* RTC_STATUS_REG */
+    case 0x44:  /* RTC_STATUS_REG */
 #ifdef ALMDEBUG
         printf("RTC STATUSL <-- %02x\n", value);
 #endif
@@ -2819,14 +2819,14 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         omap_rtc_interrupts_update(s);
         return;
 
-    case 0x48:	/* RTC_INTERRUPTS_REG */
+    case 0x48:  /* RTC_INTERRUPTS_REG */
 #ifdef ALMDEBUG
         printf("RTC INTRS <-- %02x\n", value);
 #endif
         s->interrupts = value;
         return;
 
-    case 0x4c:	/* RTC_COMP_LSB_REG */
+    case 0x4c:  /* RTC_COMP_LSB_REG */
 #ifdef ALMDEBUG
         printf("RTC COMPLSB <-- %02x\n", value);
 #endif
@@ -2834,7 +2834,7 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         s->comp_reg |= 0x00ff & value;
         return;
 
-    case 0x50:	/* RTC_COMP_MSB_REG */
+    case 0x50:  /* RTC_COMP_MSB_REG */
 #ifdef ALMDEBUG
         printf("RTC COMPMSB <-- %02x\n", value);
 #endif
@@ -2988,12 +2988,12 @@ static void omap_mcbsp_intr_update(struct omap_mcbsp_s *s)
 {
     int irq;
 
-    switch ((s->spcr[0] >> 4) & 3) {			/* RINTM */
+    switch ((s->spcr[0] >> 4) & 3) {            /* RINTM */
     case 0:
-        irq = (s->spcr[0] >> 1) & 1;			/* RRDY */
+        irq = (s->spcr[0] >> 1) & 1;            /* RRDY */
         break;
     case 3:
-        irq = (s->spcr[0] >> 3) & 1;			/* RSYNCERR */
+        irq = (s->spcr[0] >> 3) & 1;            /* RSYNCERR */
         break;
     default:
         irq = 0;
@@ -3003,12 +3003,12 @@ static void omap_mcbsp_intr_update(struct omap_mcbsp_s *s)
     if (irq)
         qemu_irq_pulse(s->rxirq);
 
-    switch ((s->spcr[1] >> 4) & 3) {			/* XINTM */
+    switch ((s->spcr[1] >> 4) & 3) {            /* XINTM */
     case 0:
-        irq = (s->spcr[1] >> 1) & 1;			/* XRDY */
+        irq = (s->spcr[1] >> 1) & 1;            /* XRDY */
         break;
     case 3:
-        irq = (s->spcr[1] >> 3) & 1;			/* XSYNCERR */
+        irq = (s->spcr[1] >> 3) & 1;            /* XSYNCERR */
         break;
     default:
         irq = 0;
@@ -3021,9 +3021,9 @@ static void omap_mcbsp_intr_update(struct omap_mcbsp_s *s)
 
 static void omap_mcbsp_rx_newdata(struct omap_mcbsp_s *s)
 {
-    if ((s->spcr[0] >> 1) & 1)				/* RRDY */
-        s->spcr[0] |= 1 << 2;				/* RFULL */
-    s->spcr[0] |= 1 << 1;				/* RRDY */
+    if ((s->spcr[0] >> 1) & 1)              /* RRDY */
+        s->spcr[0] |= 1 << 2;               /* RFULL */
+    s->spcr[0] |= 1 << 1;               /* RRDY */
     qemu_irq_raise(s->rxdrq);
     omap_mcbsp_intr_update(s);
 }
@@ -3062,14 +3062,14 @@ static void omap_mcbsp_rx_stop(struct omap_mcbsp_s *s)
 
 static void omap_mcbsp_rx_done(struct omap_mcbsp_s *s)
 {
-    s->spcr[0] &= ~(1 << 1);				/* RRDY */
+    s->spcr[0] &= ~(1 << 1);                /* RRDY */
     qemu_irq_lower(s->rxdrq);
     omap_mcbsp_intr_update(s);
 }
 
 static void omap_mcbsp_tx_newdata(struct omap_mcbsp_s *s)
 {
-    s->spcr[1] |= 1 << 1;				/* XRDY */
+    s->spcr[1] |= 1 << 1;               /* XRDY */
     qemu_irq_raise(s->txdrq);
     omap_mcbsp_intr_update(s);
 }
@@ -3103,7 +3103,7 @@ static void omap_mcbsp_tx_start(struct omap_mcbsp_s *s)
 
 static void omap_mcbsp_tx_done(struct omap_mcbsp_s *s)
 {
-    s->spcr[1] &= ~(1 << 1);				/* XRDY */
+    s->spcr[1] &= ~(1 << 1);                /* XRDY */
     qemu_irq_lower(s->txdrq);
     omap_mcbsp_intr_update(s);
     if (s->codec && s->codec->cts)
@@ -3121,27 +3121,27 @@ static void omap_mcbsp_req_update(struct omap_mcbsp_s *s)
 {
     int prev_rx_rate, prev_tx_rate;
     int rx_rate = 0, tx_rate = 0;
-    int cpu_rate = 1500000;	/* XXX */
+    int cpu_rate = 1500000; /* XXX */
 
     /* TODO: check CLKSTP bit */
-    if (s->spcr[1] & (1 << 6)) {			/* GRST */
-        if (s->spcr[0] & (1 << 0)) {			/* RRST */
-            if ((s->srgr[1] & (1 << 13)) &&		/* CLKSM */
-                            (s->pcr & (1 << 8))) {	/* CLKRM */
-                if (~s->pcr & (1 << 7))			/* SCLKME */
+    if (s->spcr[1] & (1 << 6)) {            /* GRST */
+        if (s->spcr[0] & (1 << 0)) {            /* RRST */
+            if ((s->srgr[1] & (1 << 13)) &&     /* CLKSM */
+                            (s->pcr & (1 << 8))) {  /* CLKRM */
+                if (~s->pcr & (1 << 7))         /* SCLKME */
                     rx_rate = cpu_rate /
-                            ((s->srgr[0] & 0xff) + 1);	/* CLKGDV */
+                            ((s->srgr[0] & 0xff) + 1);  /* CLKGDV */
             } else
                 if (s->codec)
                     rx_rate = s->codec->rx_rate;
         }
 
-        if (s->spcr[1] & (1 << 0)) {			/* XRST */
-            if ((s->srgr[1] & (1 << 13)) &&		/* CLKSM */
-                            (s->pcr & (1 << 9))) {	/* CLKXM */
-                if (~s->pcr & (1 << 7))			/* SCLKME */
+        if (s->spcr[1] & (1 << 0)) {            /* XRST */
+            if ((s->srgr[1] & (1 << 13)) &&     /* CLKSM */
+                            (s->pcr & (1 << 9))) {  /* CLKXM */
+                if (~s->pcr & (1 << 7))         /* SCLKME */
                     tx_rate = cpu_rate /
-                            ((s->srgr[0] & 0xff) + 1);	/* CLKGDV */
+                            ((s->srgr[0] & 0xff) + 1);  /* CLKGDV */
             } else
                 if (s->codec)
                     tx_rate = s->codec->tx_rate;
@@ -3178,11 +3178,11 @@ static uint64_t omap_mcbsp_read(void *opaque, hwaddr addr,
     }
 
     switch (offset) {
-    case 0x00:	/* DRR2 */
-        if (((s->rcr[0] >> 5) & 7) < 3)			/* RWDLEN1 */
+    case 0x00:  /* DRR2 */
+        if (((s->rcr[0] >> 5) & 7) < 3)         /* RWDLEN1 */
             return 0x0000;
         /* Fall through.  */
-    case 0x02:	/* DRR1 */
+    case 0x02:  /* DRR1 */
         if (s->rx_req < 2) {
             printf("%s: Rx FIFO underrun\n", __func__);
             omap_mcbsp_rx_done(s);
@@ -3200,63 +3200,63 @@ static uint64_t omap_mcbsp_read(void *opaque, hwaddr addr,
         }
         return 0x0000;
 
-    case 0x04:	/* DXR2 */
-    case 0x06:	/* DXR1 */
+    case 0x04:  /* DXR2 */
+    case 0x06:  /* DXR1 */
         return 0x0000;
 
-    case 0x08:	/* SPCR2 */
+    case 0x08:  /* SPCR2 */
         return s->spcr[1];
-    case 0x0a:	/* SPCR1 */
+    case 0x0a:  /* SPCR1 */
         return s->spcr[0];
-    case 0x0c:	/* RCR2 */
+    case 0x0c:  /* RCR2 */
         return s->rcr[1];
-    case 0x0e:	/* RCR1 */
+    case 0x0e:  /* RCR1 */
         return s->rcr[0];
-    case 0x10:	/* XCR2 */
+    case 0x10:  /* XCR2 */
         return s->xcr[1];
-    case 0x12:	/* XCR1 */
+    case 0x12:  /* XCR1 */
         return s->xcr[0];
-    case 0x14:	/* SRGR2 */
+    case 0x14:  /* SRGR2 */
         return s->srgr[1];
-    case 0x16:	/* SRGR1 */
+    case 0x16:  /* SRGR1 */
         return s->srgr[0];
-    case 0x18:	/* MCR2 */
+    case 0x18:  /* MCR2 */
         return s->mcr[1];
-    case 0x1a:	/* MCR1 */
+    case 0x1a:  /* MCR1 */
         return s->mcr[0];
-    case 0x1c:	/* RCERA */
+    case 0x1c:  /* RCERA */
         return s->rcer[0];
-    case 0x1e:	/* RCERB */
+    case 0x1e:  /* RCERB */
         return s->rcer[1];
-    case 0x20:	/* XCERA */
+    case 0x20:  /* XCERA */
         return s->xcer[0];
-    case 0x22:	/* XCERB */
+    case 0x22:  /* XCERB */
         return s->xcer[1];
-    case 0x24:	/* PCR0 */
+    case 0x24:  /* PCR0 */
         return s->pcr;
-    case 0x26:	/* RCERC */
+    case 0x26:  /* RCERC */
         return s->rcer[2];
-    case 0x28:	/* RCERD */
+    case 0x28:  /* RCERD */
         return s->rcer[3];
-    case 0x2a:	/* XCERC */
+    case 0x2a:  /* XCERC */
         return s->xcer[2];
-    case 0x2c:	/* XCERD */
+    case 0x2c:  /* XCERD */
         return s->xcer[3];
-    case 0x2e:	/* RCERE */
+    case 0x2e:  /* RCERE */
         return s->rcer[4];
-    case 0x30:	/* RCERF */
+    case 0x30:  /* RCERF */
         return s->rcer[5];
-    case 0x32:	/* XCERE */
+    case 0x32:  /* XCERE */
         return s->xcer[4];
-    case 0x34:	/* XCERF */
+    case 0x34:  /* XCERF */
         return s->xcer[5];
-    case 0x36:	/* RCERG */
+    case 0x36:  /* RCERG */
         return s->rcer[6];
-    case 0x38:	/* RCERH */
+    case 0x38:  /* RCERH */
         return s->rcer[7];
-    case 0x3a:	/* XCERG */
+    case 0x3a:  /* XCERG */
         return s->xcer[6];
-    case 0x3c:	/* XCERH */
+    case 0x3c:  /* XCERH */
         return s->xcer[7];
     }
 
@@ -3271,16 +3271,16 @@ static void omap_mcbsp_writeh(void *opaque, hwaddr addr,
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     switch (offset) {
-    case 0x00:	/* DRR2 */
-    case 0x02:	/* DRR1 */
+    case 0x00:  /* DRR2 */
+    case 0x02:  /* DRR1 */
         OMAP_RO_REG(addr);
         return;
 
-    case 0x04:	/* DXR2 */
-        if (((s->xcr[0] >> 5) & 7) < 3)			/* XWDLEN1 */
+    case 0x04:  /* DXR2 */
+        if (((s->xcr[0] >> 5) & 7) < 3)         /* XWDLEN1 */
             return;
         /* Fall through.  */
-    case 0x06:	/* DXR1 */
+    case 0x06:  /* DXR1 */
         if (s->tx_req > 1) {
             s->tx_req -= 2;
             if (s->codec && s->codec->cts) {
@@ -3293,20 +3293,20 @@ static void omap_mcbsp_writeh(void *opaque, hwaddr addr,
             printf("%s: Tx FIFO overrun\n", __func__);
         return;
 
-    case 0x08:	/* SPCR2 */
+    case 0x08:  /* SPCR2 */
         s->spcr[1] &= 0x0002;
         s->spcr[1] |= 0x03f9 & value;
-        s->spcr[1] |= 0x0004 & (value << 2);		/* XEMPTY := XRST */
-        if (~value & 1)					/* XRST */
+        s->spcr[1] |= 0x0004 & (value << 2);        /* XEMPTY := XRST */
+        if (~value & 1)                 /* XRST */
             s->spcr[1] &= ~6;
         omap_mcbsp_req_update(s);
         return;
-    case 0x0a:	/* SPCR1 */
+    case 0x0a:  /* SPCR1 */
         s->spcr[0] &= 0x0006;
         s->spcr[0] |= 0xf8f9 & value;
-        if (value & (1 << 15))				/* DLB */
+        if (value & (1 << 15))              /* DLB */
             printf("%s: Digital Loopback mode enable attempt\n", __func__);
-        if (~value & 1) {				/* RRST */
+        if (~value & 1) {               /* RRST */
             s->spcr[0] &= ~6;
             s->rx_req = 0;
             omap_mcbsp_rx_done(s);
@@ -3314,85 +3314,85 @@ static void omap_mcbsp_writeh(void *opaque, hwaddr addr,
         omap_mcbsp_req_update(s);
         return;
 
-    case 0x0c:	/* RCR2 */
+    case 0x0c:  /* RCR2 */
         s->rcr[1] = value & 0xffff;
         return;
-    case 0x0e:	/* RCR1 */
+    case 0x0e:  /* RCR1 */
         s->rcr[0] = value & 0x7fe0;
         return;
-    case 0x10:	/* XCR2 */
+    case 0x10:  /* XCR2 */
         s->xcr[1] = value & 0xffff;
         return;
-    case 0x12:	/* XCR1 */
+    case 0x12:  /* XCR1 */
         s->xcr[0] = value & 0x7fe0;
         return;
-    case 0x14:	/* SRGR2 */
+    case 0x14:  /* SRGR2 */
         s->srgr[1] = value & 0xffff;
         omap_mcbsp_req_update(s);
         return;
-    case 0x16:	/* SRGR1 */
+    case 0x16:  /* SRGR1 */
         s->srgr[0] = value & 0xffff;
         omap_mcbsp_req_update(s);
         return;
-    case 0x18:	/* MCR2 */
+    case 0x18:  /* MCR2 */
         s->mcr[1] = value & 0x03e3;
-        if (value & 3)					/* XMCM */
+        if (value & 3)                  /* XMCM */
             printf("%s: Tx channel selection mode enable attempt\n", __func__);
         return;
-    case 0x1a:	/* MCR1 */
+    case 0x1a:  /* MCR1 */
         s->mcr[0] = value & 0x03e1;
-        if (value & 1)					/* RMCM */
+        if (value & 1)                  /* RMCM */
             printf("%s: Rx channel selection mode enable attempt\n", __func__);
         return;
-    case 0x1c:	/* RCERA */
+    case 0x1c:  /* RCERA */
         s->rcer[0] = value & 0xffff;
         return;
-    case 0x1e:	/* RCERB */
+    case 0x1e:  /* RCERB */
         s->rcer[1] = value & 0xffff;
         return;
-    case 0x20:	/* XCERA */
+    case 0x20:  /* XCERA */
         s->xcer[0] = value & 0xffff;
         return;
-    case 0x22:	/* XCERB */
+    case 0x22:  /* XCERB */
         s->xcer[1] = value & 0xffff;
         return;
-    case 0x24:	/* PCR0 */
+    case 0x24:  /* PCR0 */
         s->pcr = value & 0x7faf;
         return;
-    case 0x26:	/* RCERC */
+    case 0x26:  /* RCERC */
         s->rcer[2] = value & 0xffff;
         return;
-    case 0x28:	/* RCERD */
+    case 0x28:  /* RCERD */
         s->rcer[3] = value & 0xffff;
         return;
-    case 0x2a:	/* XCERC */
+    case 0x2a:  /* XCERC */
         s->xcer[2] = value & 0xffff;
         return;
-    case 0x2c:	/* XCERD */
+    case 0x2c:  /* XCERD */
         s->xcer[3] = value & 0xffff;
         return;
-    case 0x2e:	/* RCERE */
+    case 0x2e:  /* RCERE */
         s->rcer[4] = value & 0xffff;
         return;
-    case 0x30:	/* RCERF */
+    case 0x30:  /* RCERF */
         s->rcer[5] = value & 0xffff;
         return;
-    case 0x32:	/* XCERE */
+    case 0x32:  /* XCERE */
         s->xcer[4] = value & 0xffff;
         return;
-    case 0x34:	/* XCERF */
+    case 0x34:  /* XCERF */
         s->xcer[5] = value & 0xffff;
         return;
-    case 0x36:	/* RCERG */
+    case 0x36:  /* RCERG */
         s->rcer[6] = value & 0xffff;
         return;
-    case 0x38:	/* RCERH */
+    case 0x38:  /* RCERH */
         s->rcer[7] = value & 0xffff;
         return;
-    case 0x3a:	/* XCERG */
+    case 0x3a:  /* XCERG */
         s->xcer[6] = value & 0xffff;
         return;
-    case 0x3c:	/* XCERH */
+    case 0x3c:  /* XCERH */
         s->xcer[7] = value & 0xffff;
         return;
     }
@@ -3406,8 +3406,8 @@ static void omap_mcbsp_writew(void *opaque, hwaddr addr,
     struct omap_mcbsp_s *s = opaque;
     int offset = addr & OMAP_MPUI_REG_MASK;
 
-    if (offset == 0x04) {				/* DXR */
-        if (((s->xcr[0] >> 5) & 7) < 3)			/* XWDLEN1 */
+    if (offset == 0x04) {               /* DXR */
+        if (((s->xcr[0] >> 5) & 7) < 3)         /* XWDLEN1 */
             return;
         if (s->tx_req > 3) {
             s->tx_req -= 4;
@@ -3550,15 +3550,15 @@ static void omap_lpg_update(struct omap_lpg_s *s)
     int64_t on, period = 1, ticks = 1000;
     static const int per[8] = { 1, 2, 4, 8, 12, 16, 20, 24 };
 
-    if (~s->control & (1 << 6))					/* LPGRES */
+    if (~s->control & (1 << 6))                 /* LPGRES */
         on = 0;
-    else if (s->control & (1 << 7))				/* PERM_ON */
+    else if (s->control & (1 << 7))             /* PERM_ON */
         on = period;
     else {
-        period = muldiv64(ticks, per[s->control & 7],		/* PERCTRL */
+        period = muldiv64(ticks, per[s->control & 7],       /* PERCTRL */
                         256 / 32);
         on = (s->clk && s->power) ? muldiv64(ticks,
-                        per[(s->control >> 3) & 7], 256) : 0;	/* ONCTRL */
+                        per[(s->control >> 3) & 7], 256) : 0;   /* ONCTRL */
     }
 
     timer_del(s->tm);
@@ -3596,10 +3596,10 @@ static uint64_t omap_lpg_read(void *opaque, hwaddr addr, unsigned size)
     }
 
     switch (offset) {
-    case 0x00:	/* LCR */
+    case 0x00:  /* LCR */
         return s->control;
 
-    case 0x04:	/* PMR */
+    case 0x04:  /* PMR */
         return s->power;
     }
 
@@ -3619,14 +3619,14 @@ static void omap_lpg_write(void *opaque, hwaddr addr,
     }
 
     switch (offset) {
-    case 0x00:	/* LCR */
-        if (~value & (1 << 6))					/* LPGRES */
+    case 0x00:  /* LCR */
+        if (~value & (1 << 6))                  /* LPGRES */
             omap_lpg_reset(s);
         s->control = value & 0xff;
         omap_lpg_update(s);
         return;
 
-    case 0x04:	/* PMR */
+    case 0x04:  /* PMR */
         s->power = value & 0x01;
         omap_lpg_update(s);
         return;
@@ -3676,7 +3676,7 @@ static uint64_t omap_mpui_io_read(void *opaque, hwaddr addr,
         return omap_badwidth_read16(opaque, addr);
     }
 
-    if (addr == OMAP_MPUI_BASE)	/* CMR */
+    if (addr == OMAP_MPUI_BASE) /* CMR */
         return 0xfe4d;
 
     OMAP_BAD_REG(addr);
@@ -3750,25 +3750,25 @@ static const struct omap_map_s {
     const char *name;
 } omap15xx_dsp_mm[] = {
     /* Strobe 0 */
-    { 0xe1010000, 0xfffb0000, 0x800, "UART1 BT" },		/* CS0 */
-    { 0xe1010800, 0xfffb0800, 0x800, "UART2 COM" },		/* CS1 */
-    { 0xe1011800, 0xfffb1800, 0x800, "McBSP1 audio" },		/* CS3 */
-    { 0xe1012000, 0xfffb2000, 0x800, "MCSI2 communication" },	/* CS4 */
-    { 0xe1012800, 0xfffb2800, 0x800, "MCSI1 BT u-Law" },	/* CS5 */
-    { 0xe1013000, 0xfffb3000, 0x800, "uWire" },			/* CS6 */
-    { 0xe1013800, 0xfffb3800, 0x800, "I^2C" },			/* CS7 */
-    { 0xe1014000, 0xfffb4000, 0x800, "USB W2FC" },		/* CS8 */
-    { 0xe1014800, 0xfffb4800, 0x800, "RTC" },			/* CS9 */
-    { 0xe1015000, 0xfffb5000, 0x800, "MPUIO" },			/* CS10 */
-    { 0xe1015800, 0xfffb5800, 0x800, "PWL" },			/* CS11 */
-    { 0xe1016000, 0xfffb6000, 0x800, "PWT" },			/* CS12 */
-    { 0xe1017000, 0xfffb7000, 0x800, "McBSP3" },		/* CS14 */
-    { 0xe1017800, 0xfffb7800, 0x800, "MMC" },			/* CS15 */
-    { 0xe1019000, 0xfffb9000, 0x800, "32-kHz timer" },		/* CS18 */
-    { 0xe1019800, 0xfffb9800, 0x800, "UART3" },			/* CS19 */
-    { 0xe101c800, 0xfffbc800, 0x800, "TIPB switches" },		/* CS25 */
+    { 0xe1010000, 0xfffb0000, 0x800, "UART1 BT" },      /* CS0 */
+    { 0xe1010800, 0xfffb0800, 0x800, "UART2 COM" },     /* CS1 */
+    { 0xe1011800, 0xfffb1800, 0x800, "McBSP1 audio" },      /* CS3 */
+    { 0xe1012000, 0xfffb2000, 0x800, "MCSI2 communication" },   /* CS4 */
+    { 0xe1012800, 0xfffb2800, 0x800, "MCSI1 BT u-Law" },    /* CS5 */
+    { 0xe1013000, 0xfffb3000, 0x800, "uWire" },         /* CS6 */
+    { 0xe1013800, 0xfffb3800, 0x800, "I^2C" },          /* CS7 */
+    { 0xe1014000, 0xfffb4000, 0x800, "USB W2FC" },      /* CS8 */
+    { 0xe1014800, 0xfffb4800, 0x800, "RTC" },           /* CS9 */
+    { 0xe1015000, 0xfffb5000, 0x800, "MPUIO" },         /* CS10 */
+    { 0xe1015800, 0xfffb5800, 0x800, "PWL" },           /* CS11 */
+    { 0xe1016000, 0xfffb6000, 0x800, "PWT" },           /* CS12 */
+    { 0xe1017000, 0xfffb7000, 0x800, "McBSP3" },        /* CS14 */
+    { 0xe1017800, 0xfffb7800, 0x800, "MMC" },           /* CS15 */
+    { 0xe1019000, 0xfffb9000, 0x800, "32-kHz timer" },      /* CS18 */
+    { 0xe1019800, 0xfffb9800, 0x800, "UART3" },         /* CS19 */
+    { 0xe101c800, 0xfffbc800, 0x800, "TIPB switches" },     /* CS25 */
     /* Strobe 1 */
-    { 0xe101e000, 0xfffce000, 0x800, "GPIOs" },			/* CS28 */
+    { 0xe101e000, 0xfffce000, 0x800, "GPIOs" },         /* CS28 */
 
     { 0 }
 };
@@ -4058,18 +4058,18 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegion *dram,
                               0xfffbd800, omap_findclk(s, "clk32-kHz"));
 
     /* Register mappings not currently implemented:
-     * MCSI2 Comm	fffb2000 - fffb27ff (not mapped on OMAP310)
-     * MCSI1 Bluetooth	fffb2800 - fffb2fff (not mapped on OMAP310)
-     * USB W2FC		fffb4000 - fffb47ff
-     * Camera Interface	fffb6800 - fffb6fff
-     * USB Host		fffba000 - fffba7ff
-     * FAC		fffba800 - fffbafff
-     * HDQ/1-Wire	fffbc000 - fffbc7ff
-     * TIPB switches	fffbc800 - fffbcfff
-     * Mailbox		fffcf000 - fffcf7ff
-     * Local bus IF	fffec100 - fffec1ff
-     * Local bus MMU	fffec200 - fffec2ff
-     * DSP MMU		fffed200 - fffed2ff
+     * MCSI2 Comm   fffb2000 - fffb27ff (not mapped on OMAP310)
+     * MCSI1 Bluetooth  fffb2800 - fffb2fff (not mapped on OMAP310)
+     * USB W2FC     fffb4000 - fffb47ff
+     * Camera Interface fffb6800 - fffb6fff
+     * USB Host     fffba000 - fffba7ff
+     * FAC      fffba800 - fffbafff
+     * HDQ/1-Wire   fffbc000 - fffbc7ff
+     * TIPB switches    fffbc800 - fffbcfff
+     * Mailbox      fffcf000 - fffcf7ff
+     * Local bus IF fffec100 - fffec1ff
+     * Local bus MMU    fffec200 - fffec2ff
+     * DSP MMU      fffed200 - fffed2ff
      */
 
     omap_setup_dsp_mapping(system_memory, omap15xx_dsp_mm);
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index d5a2ae7af6..fa7d262603 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -91,19 +91,19 @@ struct omap_eac_s {
 
 static inline void omap_eac_interrupt_update(struct omap_eac_s *s)
 {
-    qemu_set_irq(s->irq, (s->codec.config[1] >> 14) & 1);	/* AURDI */
+    qemu_set_irq(s->irq, (s->codec.config[1] >> 14) & 1);   /* AURDI */
 }
 
 static inline void omap_eac_in_dmarequest_update(struct omap_eac_s *s)
 {
     qemu_set_irq(s->codec.rxdrq, (s->codec.rxavail || s->codec.rxlen) &&
-                    ((s->codec.config[1] >> 12) & 1));		/* DMAREN */
+                    ((s->codec.config[1] >> 12) & 1));      /* DMAREN */
 }
 
 static inline void omap_eac_out_dmarequest_update(struct omap_eac_s *s)
 {
     qemu_set_irq(s->codec.txdrq, s->codec.txlen < s->codec.txavail &&
-                    ((s->codec.config[1] >> 11) & 1));		/* DMAWEN */
+                    ((s->codec.config[1] >> 11) & 1));      /* DMAWEN */
 }
 
 static inline void omap_eac_in_refill(struct omap_eac_s *s)
@@ -117,7 +117,7 @@ static inline void omap_eac_in_refill(struct omap_eac_s *s)
     left -= leftwrap;
     start = 0;
     while (leftwrap && (recv = AUD_read(s->codec.in_voice, buf + start,
-                                    leftwrap)) > 0) {	/* Be defensive */
+                                    leftwrap)) > 0) {   /* Be defensive */
         start += recv;
         leftwrap -= recv;
     }
@@ -131,7 +131,7 @@ static inline void omap_eac_in_refill(struct omap_eac_s *s)
         start = 0;
         while (left && (recv = AUD_read(s->codec.in_voice,
                                         (uint8_t *) s->codec.rxbuf + start,
-                                        left)) > 0) {	/* Be defensive */
+                                        left)) > 0) {   /* Be defensive */
             start += recv;
             left -= recv;
         }
@@ -151,7 +151,7 @@ static inline void omap_eac_out_empty(struct omap_eac_s *s)
 
     while (left && (sent = AUD_write(s->codec.out_voice,
                                     (uint8_t *) s->codec.txbuf + start,
-                                    left)) > 0) {	/* Be defensive */
+                                    left)) > 0) {   /* Be defensive */
         start += sent;
         left -= sent;
     }
@@ -188,8 +188,8 @@ static void omap_eac_out_cb(void *opaque, int free_b)
 
 static void omap_eac_enable_update(struct omap_eac_s *s)
 {
-    s->codec.enable = !(s->codec.config[1] & 1) &&		/* EACPWD */
-            (s->codec.config[1] & 2) &&				/* AUDEN */
+    s->codec.enable = !(s->codec.config[1] & 1) &&      /* EACPWD */
+            (s->codec.config[1] & 2) &&             /* AUDEN */
             s->codec.hw_enable;
 }
 
@@ -269,8 +269,8 @@ static void omap_eac_format_update(struct omap_eac_s *s)
         return;
 
     omap_eac_rate_update(s);
-    fmt.endianness = ((s->codec.config[0] >> 8) & 1);		/* LI_BI */
-    fmt.nchannels = ((s->codec.config[0] >> 10) & 1) ? 2 : 1;	/* MN_ST */
+    fmt.endianness = ((s->codec.config[0] >> 8) & 1);       /* LI_BI */
+    fmt.nchannels = ((s->codec.config[0] >> 10) & 1) ? 2 : 1;   /* MN_ST */
     fmt.freq = s->codec.rate;
     /* TODO: signedness possibly depends on the CODEC hardware - or
      * does I2S specify it?  */
@@ -343,67 +343,67 @@ static uint64_t omap_eac_read(void *opaque, hwaddr addr, unsigned size)
     }
 
     switch (addr) {
-    case 0x000:	/* CPCFR1 */
+    case 0x000: /* CPCFR1 */
         return s->config[0];
-    case 0x004:	/* CPCFR2 */
+    case 0x004: /* CPCFR2 */
         return s->config[1];
-    case 0x008:	/* CPCFR3 */
+    case 0x008: /* CPCFR3 */
         return s->config[2];
-    case 0x00c:	/* CPCFR4 */
+    case 0x00c: /* CPCFR4 */
         return s->config[3];
 
-    case 0x010:	/* CPTCTL */
+    case 0x010: /* CPTCTL */
         return s->control | ((s->codec.rxavail + s->codec.rxlen > 0) << 7) |
                 ((s->codec.txlen < s->codec.txavail) << 5);
 
-    case 0x014:	/* CPTTADR */
+    case 0x014: /* CPTTADR */
         return s->address;
-    case 0x018:	/* CPTDATL */
+    case 0x018: /* CPTDATL */
         return s->data & 0xff;
-    case 0x01c:	/* CPTDATH */
+    case 0x01c: /* CPTDATH */
         return s->data >> 8;
-    case 0x020:	/* CPTVSLL */
+    case 0x020: /* CPTVSLL */
         return s->vtol;
-    case 0x024:	/* CPTVSLH */
-        return s->vtsl | (3 << 5);	/* CRDY1 | CRDY2 */
-    case 0x040:	/* MPCTR */
+    case 0x024: /* CPTVSLH */
+        return s->vtsl | (3 << 5);  /* CRDY1 | CRDY2 */
+    case 0x040: /* MPCTR */
         return s->modem.control;
-    case 0x044:	/* MPMCCFR */
+    case 0x044: /* MPMCCFR */
         return s->modem.config;
-    case 0x060:	/* BPCTR */
+    case 0x060: /* BPCTR */
         return s->bt.control;
-    case 0x064:	/* BPMCCFR */
+    case 0x064: /* BPMCCFR */
         return s->bt.config;
-    case 0x080:	/* AMSCFR */
+    case 0x080: /* AMSCFR */
         return s->mixer;
-    case 0x084:	/* AMVCTR */
+    case 0x084: /* AMVCTR */
         return s->gain[0];
-    case 0x088:	/* AM1VCTR */
+    case 0x088: /* AM1VCTR */
         return s->gain[1];
-    case 0x08c:	/* AM2VCTR */
+    case 0x08c: /* AM2VCTR */
         return s->gain[2];
-    case 0x090:	/* AM3VCTR */
+    case 0x090: /* AM3VCTR */
         return s->gain[3];
-    case 0x094:	/* ASTCTR */
+    case 0x094: /* ASTCTR */
         return s->att;
-    case 0x098:	/* APD1LCR */
+    case 0x098: /* APD1LCR */
         return s->max[0];
-    case 0x09c:	/* APD1RCR */
+    case 0x09c: /* APD1RCR */
         return s->max[1];
-    case 0x0a0:	/* APD2LCR */
+    case 0x0a0: /* APD2LCR */
         return s->max[2];
-    case 0x0a4:	/* APD2RCR */
+    case 0x0a4: /* APD2RCR */
         return s->max[3];
-    case 0x0a8:	/* APD3LCR */
+    case 0x0a8: /* APD3LCR */
         return s->max[4];
-    case 0x0ac:	/* APD3RCR */
+    case 0x0ac: /* APD3RCR */
         return s->max[5];
-    case 0x0b0:	/* APD4R */
+    case 0x0b0: /* APD4R */
         return s->max[6];
-    case 0x0b4:	/* ADWR */
+    case 0x0b4: /* ADWR */
         /* This should be write-only?  Docs list it as read-only.  */
         return 0x0000;
-    case 0x0b8:	/* ADRDR */
+    case 0x0b8: /* ADRDR */
         if (likely(s->codec.rxlen > 1)) {
             ret = s->codec.rxbuf[s->codec.rxoff ++];
             s->codec.rxlen --;
@@ -419,29 +419,29 @@ static uint64_t omap_eac_read(void *opaque, hwaddr addr, unsigned size)
             return ret;
         }
         return 0x0000;
-    case 0x0bc:	/* AGCFR */
+    case 0x0bc: /* AGCFR */
         return s->codec.config[0];
-    case 0x0c0:	/* AGCTR */
+    case 0x0c0: /* AGCTR */
         return s->codec.config[1] | ((s->codec.config[1] & 2) << 14);
-    case 0x0c4:	/* AGCFR2 */
+    case 0x0c4: /* AGCFR2 */
         return s->codec.config[2];
-    case 0x0c8:	/* AGCFR3 */
+    case 0x0c8: /* AGCFR3 */
         return s->codec.config[3];
-    case 0x0cc:	/* MBPDMACTR */
-    case 0x0d0:	/* MPDDMARR */
-    case 0x0d8:	/* MPUDMARR */
-    case 0x0e4:	/* BPDDMARR */
-    case 0x0ec:	/* BPUDMARR */
+    case 0x0cc: /* MBPDMACTR */
+    case 0x0d0: /* MPDDMARR */
+    case 0x0d8: /* MPUDMARR */
+    case 0x0e4: /* BPDDMARR */
+    case 0x0ec: /* BPUDMARR */
         return 0x0000;
 
-    case 0x100:	/* VERSION_NUMBER */
+    case 0x100: /* VERSION_NUMBER */
         return 0x0010;
 
-    case 0x104:	/* SYSCONFIG */
+    case 0x104: /* SYSCONFIG */
         return s->sysconfig;
 
-    case 0x108:	/* SYSSTATUS */
-        return 1 | 0xe;					/* RESETDONE | stuff */
+    case 0x108: /* SYSSTATUS */
+        return 1 | 0xe;                 /* RESETDONE | stuff */
     }
 
     OMAP_BAD_REG(addr);
@@ -459,95 +459,95 @@ static void omap_eac_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x098:	/* APD1LCR */
-    case 0x09c:	/* APD1RCR */
-    case 0x0a0:	/* APD2LCR */
-    case 0x0a4:	/* APD2RCR */
-    case 0x0a8:	/* APD3LCR */
-    case 0x0ac:	/* APD3RCR */
-    case 0x0b0:	/* APD4R */
-    case 0x0b8:	/* ADRDR */
-    case 0x0d0:	/* MPDDMARR */
-    case 0x0d8:	/* MPUDMARR */
-    case 0x0e4:	/* BPDDMARR */
-    case 0x0ec:	/* BPUDMARR */
-    case 0x100:	/* VERSION_NUMBER */
-    case 0x108:	/* SYSSTATUS */
+    case 0x098: /* APD1LCR */
+    case 0x09c: /* APD1RCR */
+    case 0x0a0: /* APD2LCR */
+    case 0x0a4: /* APD2RCR */
+    case 0x0a8: /* APD3LCR */
+    case 0x0ac: /* APD3RCR */
+    case 0x0b0: /* APD4R */
+    case 0x0b8: /* ADRDR */
+    case 0x0d0: /* MPDDMARR */
+    case 0x0d8: /* MPUDMARR */
+    case 0x0e4: /* BPDDMARR */
+    case 0x0ec: /* BPUDMARR */
+    case 0x100: /* VERSION_NUMBER */
+    case 0x108: /* SYSSTATUS */
         OMAP_RO_REG(addr);
         return;
 
-    case 0x000:	/* CPCFR1 */
+    case 0x000: /* CPCFR1 */
         s->config[0] = value & 0xff;
         omap_eac_format_update(s);
         break;
-    case 0x004:	/* CPCFR2 */
+    case 0x004: /* CPCFR2 */
         s->config[1] = value & 0xff;
         omap_eac_format_update(s);
         break;
-    case 0x008:	/* CPCFR3 */
+    case 0x008: /* CPCFR3 */
         s->config[2] = value & 0xff;
         omap_eac_format_update(s);
         break;
-    case 0x00c:	/* CPCFR4 */
+    case 0x00c: /* CPCFR4 */
         s->config[3] = value & 0xff;
         omap_eac_format_update(s);
         break;
 
-    case 0x010:	/* CPTCTL */
+    case 0x010: /* CPTCTL */
         /* Assuming TXF and TXE bits are read-only... */
         s->control = value & 0x5f;
         omap_eac_interrupt_update(s);
         break;
 
-    case 0x014:	/* CPTTADR */
+    case 0x014: /* CPTTADR */
         s->address = value & 0xff;
         break;
-    case 0x018:	/* CPTDATL */
+    case 0x018: /* CPTDATL */
         s->data &= 0xff00;
         s->data |= value & 0xff;
         break;
-    case 0x01c:	/* CPTDATH */
+    case 0x01c: /* CPTDATH */
         s->data &= 0x00ff;
         s->data |= value << 8;
         break;
-    case 0x020:	/* CPTVSLL */
+    case 0x020: /* CPTVSLL */
         s->vtol = value & 0xf8;
         break;
-    case 0x024:	/* CPTVSLH */
+    case 0x024: /* CPTVSLH */
         s->vtsl = value & 0x9f;
         break;
-    case 0x040:	/* MPCTR */
+    case 0x040: /* MPCTR */
         s->modem.control = value & 0x8f;
         break;
-    case 0x044:	/* MPMCCFR */
+    case 0x044: /* MPMCCFR */
         s->modem.config = value & 0x7fff;
         break;
-    case 0x060:	/* BPCTR */
+    case 0x060: /* BPCTR */
         s->bt.control = value & 0x8f;
         break;
-    case 0x064:	/* BPMCCFR */
+    case 0x064: /* BPMCCFR */
         s->bt.config = value & 0x7fff;
         break;
-    case 0x080:	/* AMSCFR */
+    case 0x080: /* AMSCFR */
         s->mixer = value & 0x0fff;
         break;
-    case 0x084:	/* AMVCTR */
+    case 0x084: /* AMVCTR */
         s->gain[0] = value & 0xffff;
         break;
-    case 0x088:	/* AM1VCTR */
+    case 0x088: /* AM1VCTR */
         s->gain[1] = value & 0xff7f;
         break;
-    case 0x08c:	/* AM2VCTR */
+    case 0x08c: /* AM2VCTR */
         s->gain[2] = value & 0xff7f;
         break;
-    case 0x090:	/* AM3VCTR */
+    case 0x090: /* AM3VCTR */
         s->gain[3] = value & 0xff7f;
         break;
-    case 0x094:	/* ASTCTR */
+    case 0x094: /* ASTCTR */
         s->att = value & 0xff;
         break;
 
-    case 0x0b4:	/* ADWR */
+    case 0x0b4: /* ADWR */
         s->codec.txbuf[s->codec.txlen ++] = value;
         if (unlikely(s->codec.txlen == EAC_BUF_LEN ||
                                 s->codec.txlen == s->codec.txavail)) {
@@ -558,31 +558,31 @@ static void omap_eac_write(void *opaque, hwaddr addr,
         }
         break;
 
-    case 0x0bc:	/* AGCFR */
+    case 0x0bc: /* AGCFR */
         s->codec.config[0] = value & 0x07ff;
         omap_eac_format_update(s);
         break;
-    case 0x0c0:	/* AGCTR */
+    case 0x0c0: /* AGCTR */
         s->codec.config[1] = value & 0x780f;
         omap_eac_format_update(s);
         break;
-    case 0x0c4:	/* AGCFR2 */
+    case 0x0c4: /* AGCFR2 */
         s->codec.config[2] = value & 0x003f;
         omap_eac_format_update(s);
         break;
-    case 0x0c8:	/* AGCFR3 */
+    case 0x0c8: /* AGCFR3 */
         s->codec.config[3] = value & 0xffff;
         omap_eac_format_update(s);
         break;
-    case 0x0cc:	/* MBPDMACTR */
-    case 0x0d4:	/* MPDDMAWR */
-    case 0x0e0:	/* MPUDMAWR */
-    case 0x0e8:	/* BPDDMAWR */
-    case 0x0f0:	/* BPUDMAWR */
+    case 0x0cc: /* MBPDMACTR */
+    case 0x0d4: /* MPDDMAWR */
+    case 0x0e0: /* MPUDMAWR */
+    case 0x0e8: /* BPDDMAWR */
+    case 0x0f0: /* BPUDMAWR */
         break;
 
-    case 0x104:	/* SYSCONFIG */
-        if (value & (1 << 1))				/* SOFTRESET */
+    case 0x104: /* SYSCONFIG */
+        if (value & (1 << 1))               /* SOFTRESET */
             omap_eac_reset(s);
         s->sysconfig = value & 0x31d;
         break;
@@ -633,8 +633,8 @@ struct omap_sti_s {
     uint32_t serial_config;
 };
 
-#define STI_TRACE_CONSOLE_CHANNEL	239
-#define STI_TRACE_CONTROL_CHANNEL	253
+#define STI_TRACE_CONSOLE_CHANNEL   239
+#define STI_TRACE_CONTROL_CHANNEL   253
 
 static inline void omap_sti_interrupt_update(struct omap_sti_s *s)
 {
@@ -662,30 +662,30 @@ static uint64_t omap_sti_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* STI_REVISION */
+    case 0x00:  /* STI_REVISION */
         return 0x10;
 
-    case 0x10:	/* STI_SYSCONFIG */
+    case 0x10:  /* STI_SYSCONFIG */
         return s->sysconfig;
 
-    case 0x14:	/* STI_SYSSTATUS / STI_RX_STATUS / XTI_SYSSTATUS */
+    case 0x14:  /* STI_SYSSTATUS / STI_RX_STATUS / XTI_SYSSTATUS */
         return 0x00;
 
-    case 0x18:	/* STI_IRQSTATUS */
+    case 0x18:  /* STI_IRQSTATUS */
         return s->irqst;
 
-    case 0x1c:	/* STI_IRQSETEN / STI_IRQCLREN */
+    case 0x1c:  /* STI_IRQSETEN / STI_IRQCLREN */
         return s->irqen;
 
-    case 0x24:	/* STI_ER / STI_DR / XTI_TRACESELECT */
-    case 0x28:	/* STI_RX_DR / XTI_RXDATA */
+    case 0x24:  /* STI_ER / STI_DR / XTI_TRACESELECT */
+    case 0x28:  /* STI_RX_DR / XTI_RXDATA */
         /* TODO */
         return 0;
 
-    case 0x2c:	/* STI_CLK_CTRL / XTI_SCLKCRTL */
+    case 0x2c:  /* STI_CLK_CTRL / XTI_SCLKCRTL */
         return s->clkcontrol;
 
-    case 0x30:	/* STI_SERIAL_CFG / XTI_SCONFIG */
+    case 0x30:  /* STI_SERIAL_CFG / XTI_SCONFIG */
         return s->serial_config;
     }
 
@@ -704,37 +704,37 @@ static void omap_sti_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* STI_REVISION */
-    case 0x14:	/* STI_SYSSTATUS / STI_RX_STATUS / XTI_SYSSTATUS */
+    case 0x00:  /* STI_REVISION */
+    case 0x14:  /* STI_SYSSTATUS / STI_RX_STATUS / XTI_SYSSTATUS */
         OMAP_RO_REG(addr);
         return;
 
-    case 0x10:	/* STI_SYSCONFIG */
-        if (value & (1 << 1))				/* SOFTRESET */
+    case 0x10:  /* STI_SYSCONFIG */
+        if (value & (1 << 1))               /* SOFTRESET */
             omap_sti_reset(s);
         s->sysconfig = value & 0xfe;
         break;
 
-    case 0x18:	/* STI_IRQSTATUS */
+    case 0x18:  /* STI_IRQSTATUS */
         s->irqst &= ~value;
         omap_sti_interrupt_update(s);
         break;
 
-    case 0x1c:	/* STI_IRQSETEN / STI_IRQCLREN */
+    case 0x1c:  /* STI_IRQSETEN / STI_IRQCLREN */
         s->irqen = value & 0xffff;
         omap_sti_interrupt_update(s);
         break;
 
-    case 0x2c:	/* STI_CLK_CTRL / XTI_SCLKCRTL */
+    case 0x2c:  /* STI_CLK_CTRL / XTI_SCLKCRTL */
         s->clkcontrol = value & 0xff;
         break;
 
-    case 0x30:	/* STI_SERIAL_CFG / XTI_SCONFIG */
+    case 0x30:  /* STI_SERIAL_CFG / XTI_SCONFIG */
         s->serial_config = value & 0xff;
         break;
 
-    case 0x24:	/* STI_ER / STI_DR / XTI_TRACESELECT */
-    case 0x28:	/* STI_RX_DR / XTI_RXDATA */
+    case 0x24:  /* STI_ER / STI_DR / XTI_TRACESELECT */
+    case 0x28:  /* STI_RX_DR / XTI_RXDATA */
         /* TODO */
         return;
 
@@ -815,8 +815,8 @@ static struct omap_sti_s *omap_sti_init(struct omap_target_agent_s *ta,
 }
 
 /* L4 Interconnect */
-#define L4TA(n)		(n)
-#define L4TAO(n)	((n) + 39)
+#define L4TA(n)     (n)
+#define L4TAO(n)    ((n) + 39)
 
 static const struct omap_l4_region_s omap_l4_region[125] = {
     [  1] = { 0x40800,  0x800, 32          }, /* Initiator agent */
@@ -1003,9 +1003,9 @@ static const struct omap_l4_agent_info_s omap_l4_agent_info[54] = {
     { L4TA(39),  123, 2, 1 }, /* HDQ/1-Wire */
 };
 
-#define omap_l4ta(bus, cs)	\
+#define omap_l4ta(bus, cs)  \
     omap_l4ta_get(bus, omap_l4_region, omap_l4_agent_info, L4TA(cs))
-#define omap_l4tao(bus, cs)	\
+#define omap_l4tao(bus, cs) \
     omap_l4ta_get(bus, omap_l4_region, omap_l4_agent_info, L4TAO(cs))
 
 /* Power, Reset, and Clock Management */
@@ -1063,187 +1063,187 @@ static uint64_t omap_prcm_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x000:	/* PRCM_REVISION */
+    case 0x000: /* PRCM_REVISION */
         return 0x10;
 
-    case 0x010:	/* PRCM_SYSCONFIG */
+    case 0x010: /* PRCM_SYSCONFIG */
         return s->sysconfig;
 
-    case 0x018:	/* PRCM_IRQSTATUS_MPU */
+    case 0x018: /* PRCM_IRQSTATUS_MPU */
         return s->irqst[0];
 
-    case 0x01c:	/* PRCM_IRQENABLE_MPU */
+    case 0x01c: /* PRCM_IRQENABLE_MPU */
         return s->irqen[0];
 
-    case 0x050:	/* PRCM_VOLTCTRL */
+    case 0x050: /* PRCM_VOLTCTRL */
         return s->voltctrl;
-    case 0x054:	/* PRCM_VOLTST */
+    case 0x054: /* PRCM_VOLTST */
         return s->voltctrl & 3;
 
-    case 0x060:	/* PRCM_CLKSRC_CTRL */
+    case 0x060: /* PRCM_CLKSRC_CTRL */
         return s->clksrc[0];
-    case 0x070:	/* PRCM_CLKOUT_CTRL */
+    case 0x070: /* PRCM_CLKOUT_CTRL */
         return s->clkout[0];
-    case 0x078:	/* PRCM_CLKEMUL_CTRL */
+    case 0x078: /* PRCM_CLKEMUL_CTRL */
         return s->clkemul[0];
-    case 0x080:	/* PRCM_CLKCFG_CTRL */
-    case 0x084:	/* PRCM_CLKCFG_STATUS */
+    case 0x080: /* PRCM_CLKCFG_CTRL */
+    case 0x084: /* PRCM_CLKCFG_STATUS */
         return 0;
 
-    case 0x090:	/* PRCM_VOLTSETUP */
+    case 0x090: /* PRCM_VOLTSETUP */
         return s->setuptime[0];
 
-    case 0x094:	/* PRCM_CLKSSETUP */
+    case 0x094: /* PRCM_CLKSSETUP */
         return s->setuptime[1];
 
-    case 0x098:	/* PRCM_POLCTRL */
+    case 0x098: /* PRCM_POLCTRL */
         return s->clkpol[0];
 
-    case 0x0b0:	/* GENERAL_PURPOSE1 */
-    case 0x0b4:	/* GENERAL_PURPOSE2 */
-    case 0x0b8:	/* GENERAL_PURPOSE3 */
-    case 0x0bc:	/* GENERAL_PURPOSE4 */
-    case 0x0c0:	/* GENERAL_PURPOSE5 */
-    case 0x0c4:	/* GENERAL_PURPOSE6 */
-    case 0x0c8:	/* GENERAL_PURPOSE7 */
-    case 0x0cc:	/* GENERAL_PURPOSE8 */
-    case 0x0d0:	/* GENERAL_PURPOSE9 */
-    case 0x0d4:	/* GENERAL_PURPOSE10 */
-    case 0x0d8:	/* GENERAL_PURPOSE11 */
-    case 0x0dc:	/* GENERAL_PURPOSE12 */
-    case 0x0e0:	/* GENERAL_PURPOSE13 */
-    case 0x0e4:	/* GENERAL_PURPOSE14 */
-    case 0x0e8:	/* GENERAL_PURPOSE15 */
-    case 0x0ec:	/* GENERAL_PURPOSE16 */
-    case 0x0f0:	/* GENERAL_PURPOSE17 */
-    case 0x0f4:	/* GENERAL_PURPOSE18 */
-    case 0x0f8:	/* GENERAL_PURPOSE19 */
-    case 0x0fc:	/* GENERAL_PURPOSE20 */
+    case 0x0b0: /* GENERAL_PURPOSE1 */
+    case 0x0b4: /* GENERAL_PURPOSE2 */
+    case 0x0b8: /* GENERAL_PURPOSE3 */
+    case 0x0bc: /* GENERAL_PURPOSE4 */
+    case 0x0c0: /* GENERAL_PURPOSE5 */
+    case 0x0c4: /* GENERAL_PURPOSE6 */
+    case 0x0c8: /* GENERAL_PURPOSE7 */
+    case 0x0cc: /* GENERAL_PURPOSE8 */
+    case 0x0d0: /* GENERAL_PURPOSE9 */
+    case 0x0d4: /* GENERAL_PURPOSE10 */
+    case 0x0d8: /* GENERAL_PURPOSE11 */
+    case 0x0dc: /* GENERAL_PURPOSE12 */
+    case 0x0e0: /* GENERAL_PURPOSE13 */
+    case 0x0e4: /* GENERAL_PURPOSE14 */
+    case 0x0e8: /* GENERAL_PURPOSE15 */
+    case 0x0ec: /* GENERAL_PURPOSE16 */
+    case 0x0f0: /* GENERAL_PURPOSE17 */
+    case 0x0f4: /* GENERAL_PURPOSE18 */
+    case 0x0f8: /* GENERAL_PURPOSE19 */
+    case 0x0fc: /* GENERAL_PURPOSE20 */
         return s->scratch[(addr - 0xb0) >> 2];
 
-    case 0x140:	/* CM_CLKSEL_MPU */
+    case 0x140: /* CM_CLKSEL_MPU */
         return s->clksel[0];
-    case 0x148:	/* CM_CLKSTCTRL_MPU */
+    case 0x148: /* CM_CLKSTCTRL_MPU */
         return s->clkctrl[0];
 
-    case 0x158:	/* RM_RSTST_MPU */
+    case 0x158: /* RM_RSTST_MPU */
         return s->rst[0];
-    case 0x1c8:	/* PM_WKDEP_MPU */
+    case 0x1c8: /* PM_WKDEP_MPU */
         return s->wkup[0];
-    case 0x1d4:	/* PM_EVGENCTRL_MPU */
+    case 0x1d4: /* PM_EVGENCTRL_MPU */
         return s->ev;
-    case 0x1d8:	/* PM_EVEGENONTIM_MPU */
+    case 0x1d8: /* PM_EVEGENONTIM_MPU */
         return s->evtime[0];
-    case 0x1dc:	/* PM_EVEGENOFFTIM_MPU */
+    case 0x1dc: /* PM_EVEGENOFFTIM_MPU */
         return s->evtime[1];
-    case 0x1e0:	/* PM_PWSTCTRL_MPU */
+    case 0x1e0: /* PM_PWSTCTRL_MPU */
         return s->power[0];
-    case 0x1e4:	/* PM_PWSTST_MPU */
+    case 0x1e4: /* PM_PWSTST_MPU */
         return 0;
 
-    case 0x200:	/* CM_FCLKEN1_CORE */
+    case 0x200: /* CM_FCLKEN1_CORE */
         return s->clken[0];
-    case 0x204:	/* CM_FCLKEN2_CORE */
+    case 0x204: /* CM_FCLKEN2_CORE */
         return s->clken[1];
-    case 0x210:	/* CM_ICLKEN1_CORE */
+    case 0x210: /* CM_ICLKEN1_CORE */
         return s->clken[2];
-    case 0x214:	/* CM_ICLKEN2_CORE */
+    case 0x214: /* CM_ICLKEN2_CORE */
         return s->clken[3];
-    case 0x21c:	/* CM_ICLKEN4_CORE */
+    case 0x21c: /* CM_ICLKEN4_CORE */
         return s->clken[4];
 
-    case 0x220:	/* CM_IDLEST1_CORE */
+    case 0x220: /* CM_IDLEST1_CORE */
         /* TODO: check the actual iclk status */
         return 0x7ffffff9;
-    case 0x224:	/* CM_IDLEST2_CORE */
+    case 0x224: /* CM_IDLEST2_CORE */
         /* TODO: check the actual iclk status */
         return 0x00000007;
-    case 0x22c:	/* CM_IDLEST4_CORE */
+    case 0x22c: /* CM_IDLEST4_CORE */
         /* TODO: check the actual iclk status */
         return 0x0000001f;
 
-    case 0x230:	/* CM_AUTOIDLE1_CORE */
+    case 0x230: /* CM_AUTOIDLE1_CORE */
         return s->clkidle[0];
-    case 0x234:	/* CM_AUTOIDLE2_CORE */
+    case 0x234: /* CM_AUTOIDLE2_CORE */
         return s->clkidle[1];
-    case 0x238:	/* CM_AUTOIDLE3_CORE */
+    case 0x238: /* CM_AUTOIDLE3_CORE */
         return s->clkidle[2];
-    case 0x23c:	/* CM_AUTOIDLE4_CORE */
+    case 0x23c: /* CM_AUTOIDLE4_CORE */
         return s->clkidle[3];
 
-    case 0x240:	/* CM_CLKSEL1_CORE */
+    case 0x240: /* CM_CLKSEL1_CORE */
         return s->clksel[1];
-    case 0x244:	/* CM_CLKSEL2_CORE */
+    case 0x244: /* CM_CLKSEL2_CORE */
         return s->clksel[2];
 
-    case 0x248:	/* CM_CLKSTCTRL_CORE */
+    case 0x248: /* CM_CLKSTCTRL_CORE */
         return s->clkctrl[1];
 
-    case 0x2a0:	/* PM_WKEN1_CORE */
+    case 0x2a0: /* PM_WKEN1_CORE */
         return s->wken[0];
-    case 0x2a4:	/* PM_WKEN2_CORE */
+    case 0x2a4: /* PM_WKEN2_CORE */
         return s->wken[1];
 
-    case 0x2b0:	/* PM_WKST1_CORE */
+    case 0x2b0: /* PM_WKST1_CORE */
         return s->wkst[0];
-    case 0x2b4:	/* PM_WKST2_CORE */
+    case 0x2b4: /* PM_WKST2_CORE */
         return s->wkst[1];
-    case 0x2c8:	/* PM_WKDEP_CORE */
+    case 0x2c8: /* PM_WKDEP_CORE */
         return 0x1e;
 
-    case 0x2e0:	/* PM_PWSTCTRL_CORE */
+    case 0x2e0: /* PM_PWSTCTRL_CORE */
         return s->power[1];
-    case 0x2e4:	/* PM_PWSTST_CORE */
+    case 0x2e4: /* PM_PWSTST_CORE */
         return 0x000030 | (s->power[1] & 0xfc00);
 
-    case 0x300:	/* CM_FCLKEN_GFX */
+    case 0x300: /* CM_FCLKEN_GFX */
         return s->clken[5];
-    case 0x310:	/* CM_ICLKEN_GFX */
+    case 0x310: /* CM_ICLKEN_GFX */
         return s->clken[6];
-    case 0x320:	/* CM_IDLEST_GFX */
+    case 0x320: /* CM_IDLEST_GFX */
         /* TODO: check the actual iclk status */
         return 0x00000001;
-    case 0x340:	/* CM_CLKSEL_GFX */
+    case 0x340: /* CM_CLKSEL_GFX */
         return s->clksel[3];
-    case 0x348:	/* CM_CLKSTCTRL_GFX */
+    case 0x348: /* CM_CLKSTCTRL_GFX */
         return s->clkctrl[2];
-    case 0x350:	/* RM_RSTCTRL_GFX */
+    case 0x350: /* RM_RSTCTRL_GFX */
         return s->rstctrl[0];
-    case 0x358:	/* RM_RSTST_GFX */
+    case 0x358: /* RM_RSTST_GFX */
         return s->rst[1];
-    case 0x3c8:	/* PM_WKDEP_GFX */
+    case 0x3c8: /* PM_WKDEP_GFX */
         return s->wkup[1];
 
-    case 0x3e0:	/* PM_PWSTCTRL_GFX */
+    case 0x3e0: /* PM_PWSTCTRL_GFX */
         return s->power[2];
-    case 0x3e4:	/* PM_PWSTST_GFX */
+    case 0x3e4: /* PM_PWSTST_GFX */
         return s->power[2] & 3;
 
-    case 0x400:	/* CM_FCLKEN_WKUP */
+    case 0x400: /* CM_FCLKEN_WKUP */
         return s->clken[7];
-    case 0x410:	/* CM_ICLKEN_WKUP */
+    case 0x410: /* CM_ICLKEN_WKUP */
         return s->clken[8];
-    case 0x420:	/* CM_IDLEST_WKUP */
+    case 0x420: /* CM_IDLEST_WKUP */
         /* TODO: check the actual iclk status */
         return 0x0000003f;
-    case 0x430:	/* CM_AUTOIDLE_WKUP */
+    case 0x430: /* CM_AUTOIDLE_WKUP */
         return s->clkidle[4];
-    case 0x440:	/* CM_CLKSEL_WKUP */
+    case 0x440: /* CM_CLKSEL_WKUP */
         return s->clksel[4];
-    case 0x450:	/* RM_RSTCTRL_WKUP */
+    case 0x450: /* RM_RSTCTRL_WKUP */
         return 0;
-    case 0x454:	/* RM_RSTTIME_WKUP */
+    case 0x454: /* RM_RSTTIME_WKUP */
         return s->rsttime_wkup;
-    case 0x458:	/* RM_RSTST_WKUP */
+    case 0x458: /* RM_RSTST_WKUP */
         return s->rst[2];
-    case 0x4a0:	/* PM_WKEN_WKUP */
+    case 0x4a0: /* PM_WKEN_WKUP */
         return s->wken[2];
-    case 0x4b0:	/* PM_WKST_WKUP */
+    case 0x4b0: /* PM_WKST_WKUP */
         return s->wkst[2];
 
-    case 0x500:	/* CM_CLKEN_PLL */
+    case 0x500: /* CM_CLKEN_PLL */
         return s->clken[9];
-    case 0x520:	/* CM_IDLEST_CKGEN */
+    case 0x520: /* CM_IDLEST_CKGEN */
         ret = 0x0000070 | (s->apll_lock[0] << 9) | (s->apll_lock[1] << 8);
         if (!(s->clksel[6] & 3))
             /* Core uses 32-kHz clock */
@@ -1255,45 +1255,45 @@ static uint64_t omap_prcm_read(void *opaque, hwaddr addr,
             /* Core uses DPLL */
             ret |= 2 << 0;
         return ret;
-    case 0x530:	/* CM_AUTOIDLE_PLL */
+    case 0x530: /* CM_AUTOIDLE_PLL */
         return s->clkidle[5];
-    case 0x540:	/* CM_CLKSEL1_PLL */
+    case 0x540: /* CM_CLKSEL1_PLL */
         return s->clksel[5];
-    case 0x544:	/* CM_CLKSEL2_PLL */
+    case 0x544: /* CM_CLKSEL2_PLL */
         return s->clksel[6];
 
-    case 0x800:	/* CM_FCLKEN_DSP */
+    case 0x800: /* CM_FCLKEN_DSP */
         return s->clken[10];
-    case 0x810:	/* CM_ICLKEN_DSP */
+    case 0x810: /* CM_ICLKEN_DSP */
         return s->clken[11];
-    case 0x820:	/* CM_IDLEST_DSP */
+    case 0x820: /* CM_IDLEST_DSP */
         /* TODO: check the actual iclk status */
         return 0x00000103;
-    case 0x830:	/* CM_AUTOIDLE_DSP */
+    case 0x830: /* CM_AUTOIDLE_DSP */
         return s->clkidle[6];
-    case 0x840:	/* CM_CLKSEL_DSP */
+    case 0x840: /* CM_CLKSEL_DSP */
         return s->clksel[7];
-    case 0x848:	/* CM_CLKSTCTRL_DSP */
+    case 0x848: /* CM_CLKSTCTRL_DSP */
         return s->clkctrl[3];
-    case 0x850:	/* RM_RSTCTRL_DSP */
+    case 0x850: /* RM_RSTCTRL_DSP */
         return 0;
-    case 0x858:	/* RM_RSTST_DSP */
+    case 0x858: /* RM_RSTST_DSP */
         return s->rst[3];
-    case 0x8c8:	/* PM_WKDEP_DSP */
+    case 0x8c8: /* PM_WKDEP_DSP */
         return s->wkup[2];
-    case 0x8e0:	/* PM_PWSTCTRL_DSP */
+    case 0x8e0: /* PM_PWSTCTRL_DSP */
         return s->power[3];
-    case 0x8e4:	/* PM_PWSTST_DSP */
+    case 0x8e4: /* PM_PWSTST_DSP */
         return 0x008030 | (s->power[3] & 0x3003);
 
-    case 0x8f0:	/* PRCM_IRQSTATUS_DSP */
+    case 0x8f0: /* PRCM_IRQSTATUS_DSP */
         return s->irqst[1];
-    case 0x8f4:	/* PRCM_IRQENABLE_DSP */
+    case 0x8f4: /* PRCM_IRQENABLE_DSP */
         return s->irqen[1];
 
-    case 0x8f8:	/* PRCM_IRQSTATUS_IVA */
+    case 0x8f8: /* PRCM_IRQSTATUS_IVA */
         return s->irqst[2];
-    case 0x8fc:	/* PRCM_IRQENABLE_IVA */
+    case 0x8fc: /* PRCM_IRQENABLE_IVA */
         return s->irqen[2];
     }
 
@@ -1327,19 +1327,19 @@ static void omap_prcm_dpll_update(struct omap_prcm_s *s)
     mult = (s->clksel[5] >> 12) & 0x3ff;
     div = (s->clksel[5] >> 8) & 0xf;
     if (mult == 0 || mult == 1)
-        mode = 1;	/* Bypass */
+        mode = 1;   /* Bypass */
 
     s->dpll_lock = 0;
     switch (mode) {
     case 0:
         fprintf(stderr, "%s: bad EN_DPLL\n", __func__);
         break;
-    case 1:	/* Low-power bypass mode (Default) */
-    case 2:	/* Fast-relock bypass mode */
+    case 1: /* Low-power bypass mode (Default) */
+    case 2: /* Fast-relock bypass mode */
         omap_clk_setrate(dpll, 1, 1);
         omap_clk_setrate(dpll_x2, 1, 1);
         break;
-    case 3:	/* Lock mode */
+    case 3: /* Lock mode */
         s->dpll_lock = 1; /* After 20 FINT cycles (ref_clk / (div + 1)).  */
 
         omap_clk_setrate(dpll, div + 1, mult);
@@ -1375,258 +1375,258 @@ static void omap_prcm_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x000:	/* PRCM_REVISION */
-    case 0x054:	/* PRCM_VOLTST */
-    case 0x084:	/* PRCM_CLKCFG_STATUS */
-    case 0x1e4:	/* PM_PWSTST_MPU */
-    case 0x220:	/* CM_IDLEST1_CORE */
-    case 0x224:	/* CM_IDLEST2_CORE */
-    case 0x22c:	/* CM_IDLEST4_CORE */
-    case 0x2c8:	/* PM_WKDEP_CORE */
-    case 0x2e4:	/* PM_PWSTST_CORE */
-    case 0x320:	/* CM_IDLEST_GFX */
-    case 0x3e4:	/* PM_PWSTST_GFX */
-    case 0x420:	/* CM_IDLEST_WKUP */
-    case 0x520:	/* CM_IDLEST_CKGEN */
-    case 0x820:	/* CM_IDLEST_DSP */
-    case 0x8e4:	/* PM_PWSTST_DSP */
+    case 0x000: /* PRCM_REVISION */
+    case 0x054: /* PRCM_VOLTST */
+    case 0x084: /* PRCM_CLKCFG_STATUS */
+    case 0x1e4: /* PM_PWSTST_MPU */
+    case 0x220: /* CM_IDLEST1_CORE */
+    case 0x224: /* CM_IDLEST2_CORE */
+    case 0x22c: /* CM_IDLEST4_CORE */
+    case 0x2c8: /* PM_WKDEP_CORE */
+    case 0x2e4: /* PM_PWSTST_CORE */
+    case 0x320: /* CM_IDLEST_GFX */
+    case 0x3e4: /* PM_PWSTST_GFX */
+    case 0x420: /* CM_IDLEST_WKUP */
+    case 0x520: /* CM_IDLEST_CKGEN */
+    case 0x820: /* CM_IDLEST_DSP */
+    case 0x8e4: /* PM_PWSTST_DSP */
         OMAP_RO_REG(addr);
         return;
 
-    case 0x010:	/* PRCM_SYSCONFIG */
+    case 0x010: /* PRCM_SYSCONFIG */
         s->sysconfig = value & 1;
         break;
 
-    case 0x018:	/* PRCM_IRQSTATUS_MPU */
+    case 0x018: /* PRCM_IRQSTATUS_MPU */
         s->irqst[0] &= ~value;
         omap_prcm_int_update(s, 0);
         break;
-    case 0x01c:	/* PRCM_IRQENABLE_MPU */
+    case 0x01c: /* PRCM_IRQENABLE_MPU */
         s->irqen[0] = value & 0x3f;
         omap_prcm_int_update(s, 0);
         break;
 
-    case 0x050:	/* PRCM_VOLTCTRL */
+    case 0x050: /* PRCM_VOLTCTRL */
         s->voltctrl = value & 0xf1c3;
         break;
 
-    case 0x060:	/* PRCM_CLKSRC_CTRL */
+    case 0x060: /* PRCM_CLKSRC_CTRL */
         s->clksrc[0] = value & 0xdb;
         /* TODO update clocks */
         break;
 
-    case 0x070:	/* PRCM_CLKOUT_CTRL */
+    case 0x070: /* PRCM_CLKOUT_CTRL */
         s->clkout[0] = value & 0xbbbb;
         /* TODO update clocks */
         break;
 
-    case 0x078:	/* PRCM_CLKEMUL_CTRL */
+    case 0x078: /* PRCM_CLKEMUL_CTRL */
         s->clkemul[0] = value & 1;
         /* TODO update clocks */
         break;
 
-    case 0x080:	/* PRCM_CLKCFG_CTRL */
+    case 0x080: /* PRCM_CLKCFG_CTRL */
         break;
 
-    case 0x090:	/* PRCM_VOLTSETUP */
+    case 0x090: /* PRCM_VOLTSETUP */
         s->setuptime[0] = value & 0xffff;
         break;
-    case 0x094:	/* PRCM_CLKSSETUP */
+    case 0x094: /* PRCM_CLKSSETUP */
         s->setuptime[1] = value & 0xffff;
         break;
 
-    case 0x098:	/* PRCM_POLCTRL */
+    case 0x098: /* PRCM_POLCTRL */
         s->clkpol[0] = value & 0x701;
         break;
 
-    case 0x0b0:	/* GENERAL_PURPOSE1 */
-    case 0x0b4:	/* GENERAL_PURPOSE2 */
-    case 0x0b8:	/* GENERAL_PURPOSE3 */
-    case 0x0bc:	/* GENERAL_PURPOSE4 */
-    case 0x0c0:	/* GENERAL_PURPOSE5 */
-    case 0x0c4:	/* GENERAL_PURPOSE6 */
-    case 0x0c8:	/* GENERAL_PURPOSE7 */
-    case 0x0cc:	/* GENERAL_PURPOSE8 */
-    case 0x0d0:	/* GENERAL_PURPOSE9 */
-    case 0x0d4:	/* GENERAL_PURPOSE10 */
-    case 0x0d8:	/* GENERAL_PURPOSE11 */
-    case 0x0dc:	/* GENERAL_PURPOSE12 */
-    case 0x0e0:	/* GENERAL_PURPOSE13 */
-    case 0x0e4:	/* GENERAL_PURPOSE14 */
-    case 0x0e8:	/* GENERAL_PURPOSE15 */
-    case 0x0ec:	/* GENERAL_PURPOSE16 */
-    case 0x0f0:	/* GENERAL_PURPOSE17 */
-    case 0x0f4:	/* GENERAL_PURPOSE18 */
-    case 0x0f8:	/* GENERAL_PURPOSE19 */
-    case 0x0fc:	/* GENERAL_PURPOSE20 */
+    case 0x0b0: /* GENERAL_PURPOSE1 */
+    case 0x0b4: /* GENERAL_PURPOSE2 */
+    case 0x0b8: /* GENERAL_PURPOSE3 */
+    case 0x0bc: /* GENERAL_PURPOSE4 */
+    case 0x0c0: /* GENERAL_PURPOSE5 */
+    case 0x0c4: /* GENERAL_PURPOSE6 */
+    case 0x0c8: /* GENERAL_PURPOSE7 */
+    case 0x0cc: /* GENERAL_PURPOSE8 */
+    case 0x0d0: /* GENERAL_PURPOSE9 */
+    case 0x0d4: /* GENERAL_PURPOSE10 */
+    case 0x0d8: /* GENERAL_PURPOSE11 */
+    case 0x0dc: /* GENERAL_PURPOSE12 */
+    case 0x0e0: /* GENERAL_PURPOSE13 */
+    case 0x0e4: /* GENERAL_PURPOSE14 */
+    case 0x0e8: /* GENERAL_PURPOSE15 */
+    case 0x0ec: /* GENERAL_PURPOSE16 */
+    case 0x0f0: /* GENERAL_PURPOSE17 */
+    case 0x0f4: /* GENERAL_PURPOSE18 */
+    case 0x0f8: /* GENERAL_PURPOSE19 */
+    case 0x0fc: /* GENERAL_PURPOSE20 */
         s->scratch[(addr - 0xb0) >> 2] = value;
         break;
 
-    case 0x140:	/* CM_CLKSEL_MPU */
+    case 0x140: /* CM_CLKSEL_MPU */
         s->clksel[0] = value & 0x1f;
         /* TODO update clocks */
         break;
-    case 0x148:	/* CM_CLKSTCTRL_MPU */
+    case 0x148: /* CM_CLKSTCTRL_MPU */
         s->clkctrl[0] = value & 0x1f;
         break;
 
-    case 0x158:	/* RM_RSTST_MPU */
+    case 0x158: /* RM_RSTST_MPU */
         s->rst[0] &= ~value;
         break;
-    case 0x1c8:	/* PM_WKDEP_MPU */
+    case 0x1c8: /* PM_WKDEP_MPU */
         s->wkup[0] = value & 0x15;
         break;
 
-    case 0x1d4:	/* PM_EVGENCTRL_MPU */
+    case 0x1d4: /* PM_EVGENCTRL_MPU */
         s->ev = value & 0x1f;
         break;
-    case 0x1d8:	/* PM_EVEGENONTIM_MPU */
+    case 0x1d8: /* PM_EVEGENONTIM_MPU */
         s->evtime[0] = value;
         break;
-    case 0x1dc:	/* PM_EVEGENOFFTIM_MPU */
+    case 0x1dc: /* PM_EVEGENOFFTIM_MPU */
         s->evtime[1] = value;
         break;
 
-    case 0x1e0:	/* PM_PWSTCTRL_MPU */
+    case 0x1e0: /* PM_PWSTCTRL_MPU */
         s->power[0] = value & 0xc0f;
         break;
 
-    case 0x200:	/* CM_FCLKEN1_CORE */
+    case 0x200: /* CM_FCLKEN1_CORE */
         s->clken[0] = value & 0xbfffffff;
         /* TODO update clocks */
         /* The EN_EAC bit only gets/puts func_96m_clk.  */
         break;
-    case 0x204:	/* CM_FCLKEN2_CORE */
+    case 0x204: /* CM_FCLKEN2_CORE */
         s->clken[1] = value & 0x00000007;
         /* TODO update clocks */
         break;
-    case 0x210:	/* CM_ICLKEN1_CORE */
+    case 0x210: /* CM_ICLKEN1_CORE */
         s->clken[2] = value & 0xfffffff9;
         /* TODO update clocks */
         /* The EN_EAC bit only gets/puts core_l4_iclk.  */
         break;
-    case 0x214:	/* CM_ICLKEN2_CORE */
+    case 0x214: /* CM_ICLKEN2_CORE */
         s->clken[3] = value & 0x00000007;
         /* TODO update clocks */
         break;
-    case 0x21c:	/* CM_ICLKEN4_CORE */
+    case 0x21c: /* CM_ICLKEN4_CORE */
         s->clken[4] = value & 0x0000001f;
         /* TODO update clocks */
         break;
 
-    case 0x230:	/* CM_AUTOIDLE1_CORE */
+    case 0x230: /* CM_AUTOIDLE1_CORE */
         s->clkidle[0] = value & 0xfffffff9;
         /* TODO update clocks */
         break;
-    case 0x234:	/* CM_AUTOIDLE2_CORE */
+    case 0x234: /* CM_AUTOIDLE2_CORE */
         s->clkidle[1] = value & 0x00000007;
         /* TODO update clocks */
         break;
-    case 0x238:	/* CM_AUTOIDLE3_CORE */
+    case 0x238: /* CM_AUTOIDLE3_CORE */
         s->clkidle[2] = value & 0x00000007;
         /* TODO update clocks */
         break;
-    case 0x23c:	/* CM_AUTOIDLE4_CORE */
+    case 0x23c: /* CM_AUTOIDLE4_CORE */
         s->clkidle[3] = value & 0x0000001f;
         /* TODO update clocks */
         break;
 
-    case 0x240:	/* CM_CLKSEL1_CORE */
+    case 0x240: /* CM_CLKSEL1_CORE */
         s->clksel[1] = value & 0x0fffbf7f;
         /* TODO update clocks */
         break;
 
-    case 0x244:	/* CM_CLKSEL2_CORE */
+    case 0x244: /* CM_CLKSEL2_CORE */
         s->clksel[2] = value & 0x00fffffc;
         /* TODO update clocks */
         break;
 
-    case 0x248:	/* CM_CLKSTCTRL_CORE */
+    case 0x248: /* CM_CLKSTCTRL_CORE */
         s->clkctrl[1] = value & 0x7;
         break;
 
-    case 0x2a0:	/* PM_WKEN1_CORE */
+    case 0x2a0: /* PM_WKEN1_CORE */
         s->wken[0] = value & 0x04667ff8;
         break;
-    case 0x2a4:	/* PM_WKEN2_CORE */
+    case 0x2a4: /* PM_WKEN2_CORE */
         s->wken[1] = value & 0x00000005;
         break;
 
-    case 0x2b0:	/* PM_WKST1_CORE */
+    case 0x2b0: /* PM_WKST1_CORE */
         s->wkst[0] &= ~value;
         break;
-    case 0x2b4:	/* PM_WKST2_CORE */
+    case 0x2b4: /* PM_WKST2_CORE */
         s->wkst[1] &= ~value;
         break;
 
-    case 0x2e0:	/* PM_PWSTCTRL_CORE */
+    case 0x2e0: /* PM_PWSTCTRL_CORE */
         s->power[1] = (value & 0x00fc3f) | (1 << 2);
         break;
 
-    case 0x300:	/* CM_FCLKEN_GFX */
+    case 0x300: /* CM_FCLKEN_GFX */
         s->clken[5] = value & 6;
         /* TODO update clocks */
         break;
-    case 0x310:	/* CM_ICLKEN_GFX */
+    case 0x310: /* CM_ICLKEN_GFX */
         s->clken[6] = value & 1;
         /* TODO update clocks */
         break;
-    case 0x340:	/* CM_CLKSEL_GFX */
+    case 0x340: /* CM_CLKSEL_GFX */
         s->clksel[3] = value & 7;
         /* TODO update clocks */
         break;
-    case 0x348:	/* CM_CLKSTCTRL_GFX */
+    case 0x348: /* CM_CLKSTCTRL_GFX */
         s->clkctrl[2] = value & 1;
         break;
-    case 0x350:	/* RM_RSTCTRL_GFX */
+    case 0x350: /* RM_RSTCTRL_GFX */
         s->rstctrl[0] = value & 1;
         /* TODO: reset */
         break;
-    case 0x358:	/* RM_RSTST_GFX */
+    case 0x358: /* RM_RSTST_GFX */
         s->rst[1] &= ~value;
         break;
-    case 0x3c8:	/* PM_WKDEP_GFX */
+    case 0x3c8: /* PM_WKDEP_GFX */
         s->wkup[1] = value & 0x13;
         break;
-    case 0x3e0:	/* PM_PWSTCTRL_GFX */
+    case 0x3e0: /* PM_PWSTCTRL_GFX */
         s->power[2] = (value & 0x00c0f) | (3 << 2);
         break;
 
-    case 0x400:	/* CM_FCLKEN_WKUP */
+    case 0x400: /* CM_FCLKEN_WKUP */
         s->clken[7] = value & 0xd;
         /* TODO update clocks */
         break;
-    case 0x410:	/* CM_ICLKEN_WKUP */
+    case 0x410: /* CM_ICLKEN_WKUP */
         s->clken[8] = value & 0x3f;
         /* TODO update clocks */
         break;
-    case 0x430:	/* CM_AUTOIDLE_WKUP */
+    case 0x430: /* CM_AUTOIDLE_WKUP */
         s->clkidle[4] = value & 0x0000003f;
         /* TODO update clocks */
         break;
-    case 0x440:	/* CM_CLKSEL_WKUP */
+    case 0x440: /* CM_CLKSEL_WKUP */
         s->clksel[4] = value & 3;
         /* TODO update clocks */
         break;
-    case 0x450:	/* RM_RSTCTRL_WKUP */
+    case 0x450: /* RM_RSTCTRL_WKUP */
         /* TODO: reset */
         if (value & 2)
             qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
         break;
-    case 0x454:	/* RM_RSTTIME_WKUP */
+    case 0x454: /* RM_RSTTIME_WKUP */
         s->rsttime_wkup = value & 0x1fff;
         break;
-    case 0x458:	/* RM_RSTST_WKUP */
+    case 0x458: /* RM_RSTST_WKUP */
         s->rst[2] &= ~value;
         break;
-    case 0x4a0:	/* PM_WKEN_WKUP */
+    case 0x4a0: /* PM_WKEN_WKUP */
         s->wken[2] = value & 0x00000005;
         break;
-    case 0x4b0:	/* PM_WKST_WKUP */
+    case 0x4b0: /* PM_WKST_WKUP */
         s->wkst[2] &= ~value;
         break;
 
-    case 0x500:	/* CM_CLKEN_PLL */
+    case 0x500: /* CM_CLKEN_PLL */
         if (value & 0xffffff30)
             fprintf(stderr, "%s: write 0s in CM_CLKEN_PLL for "
                             "future compatibility\n", __func__);
@@ -1641,11 +1641,11 @@ static void omap_prcm_write(void *opaque, hwaddr addr,
             omap_prcm_dpll_update(s);
         }
         break;
-    case 0x530:	/* CM_AUTOIDLE_PLL */
+    case 0x530: /* CM_AUTOIDLE_PLL */
         s->clkidle[5] = value & 0x000000cf;
         /* TODO update clocks */
         break;
-    case 0x540:	/* CM_CLKSEL1_PLL */
+    case 0x540: /* CM_CLKSEL1_PLL */
         if (value & 0xfc4000d7)
             fprintf(stderr, "%s: write 0s in CM_CLKSEL1_PLL for "
                             "future compatibility\n", __func__);
@@ -1657,7 +1657,7 @@ static void omap_prcm_write(void *opaque, hwaddr addr,
 
         s->clksel[5] = value & 0x03bfff28;
         break;
-    case 0x544:	/* CM_CLKSEL2_PLL */
+    case 0x544: /* CM_CLKSEL2_PLL */
         if (value & ~3)
             fprintf(stderr, "%s: write 0s in CM_CLKSEL2_PLL[31:2] for "
                             "future compatibility\n", __func__);
@@ -1667,52 +1667,52 @@ static void omap_prcm_write(void *opaque, hwaddr addr,
         }
         break;
 
-    case 0x800:	/* CM_FCLKEN_DSP */
+    case 0x800: /* CM_FCLKEN_DSP */
         s->clken[10] = value & 0x501;
         /* TODO update clocks */
         break;
-    case 0x810:	/* CM_ICLKEN_DSP */
+    case 0x810: /* CM_ICLKEN_DSP */
         s->clken[11] = value & 0x2;
         /* TODO update clocks */
         break;
-    case 0x830:	/* CM_AUTOIDLE_DSP */
+    case 0x830: /* CM_AUTOIDLE_DSP */
         s->clkidle[6] = value & 0x2;
         /* TODO update clocks */
         break;
-    case 0x840:	/* CM_CLKSEL_DSP */
+    case 0x840: /* CM_CLKSEL_DSP */
         s->clksel[7] = value & 0x3fff;
         /* TODO update clocks */
         break;
-    case 0x848:	/* CM_CLKSTCTRL_DSP */
+    case 0x848: /* CM_CLKSTCTRL_DSP */
         s->clkctrl[3] = value & 0x101;
         break;
-    case 0x850:	/* RM_RSTCTRL_DSP */
+    case 0x850: /* RM_RSTCTRL_DSP */
         /* TODO: reset */
         break;
-    case 0x858:	/* RM_RSTST_DSP */
+    case 0x858: /* RM_RSTST_DSP */
         s->rst[3] &= ~value;
         break;
-    case 0x8c8:	/* PM_WKDEP_DSP */
+    case 0x8c8: /* PM_WKDEP_DSP */
         s->wkup[2] = value & 0x13;
         break;
-    case 0x8e0:	/* PM_PWSTCTRL_DSP */
+    case 0x8e0: /* PM_PWSTCTRL_DSP */
         s->power[3] = (value & 0x03017) | (3 << 2);
         break;
 
-    case 0x8f0:	/* PRCM_IRQSTATUS_DSP */
+    case 0x8f0: /* PRCM_IRQSTATUS_DSP */
         s->irqst[1] &= ~value;
         omap_prcm_int_update(s, 1);
         break;
-    case 0x8f4:	/* PRCM_IRQENABLE_DSP */
+    case 0x8f4: /* PRCM_IRQENABLE_DSP */
         s->irqen[1] = value & 0x7;
         omap_prcm_int_update(s, 1);
         break;
 
-    case 0x8f8:	/* PRCM_IRQSTATUS_IVA */
+    case 0x8f8: /* PRCM_IRQSTATUS_IVA */
         s->irqst[2] &= ~value;
         omap_prcm_int_update(s, 2);
         break;
-    case 0x8fc:	/* PRCM_IRQENABLE_IVA */
+    case 0x8fc: /* PRCM_IRQENABLE_IVA */
         s->irqen[2] = value & 0x7;
         omap_prcm_int_update(s, 2);
         break;
@@ -1852,7 +1852,7 @@ static uint32_t omap_sysctl_read8(void *opaque, hwaddr addr)
     int value;
 
     switch (addr) {
-    case 0x030 ... 0x140:	/* CONTROL_PADCONF - only used in the POP */
+    case 0x030 ... 0x140:   /* CONTROL_PADCONF - only used in the POP */
         pad_offset = (addr - 0x30) >> 2;
         byte_offset = (addr - 0x30) & (4 - 1);
 
@@ -1874,91 +1874,91 @@ static uint32_t omap_sysctl_read(void *opaque, hwaddr addr)
     struct omap_sysctl_s *s = opaque;
 
     switch (addr) {
-    case 0x000:	/* CONTROL_REVISION */
+    case 0x000: /* CONTROL_REVISION */
         return 0x20;
 
-    case 0x010:	/* CONTROL_SYSCONFIG */
+    case 0x010: /* CONTROL_SYSCONFIG */
         return s->sysconfig;
 
-    case 0x030 ... 0x140:	/* CONTROL_PADCONF - only used in the POP */
+    case 0x030 ... 0x140:   /* CONTROL_PADCONF - only used in the POP */
         return s->padconf[(addr - 0x30) >> 2];
 
-    case 0x270:	/* CONTROL_DEBOBS */
+    case 0x270: /* CONTROL_DEBOBS */
         return s->obs;
 
-    case 0x274:	/* CONTROL_DEVCONF */
+    case 0x274: /* CONTROL_DEVCONF */
         return s->devconfig;
 
-    case 0x28c:	/* CONTROL_EMU_SUPPORT */
+    case 0x28c: /* CONTROL_EMU_SUPPORT */
         return 0;
 
-    case 0x290:	/* CONTROL_MSUSPENDMUX_0 */
+    case 0x290: /* CONTROL_MSUSPENDMUX_0 */
         return s->msuspendmux[0];
-    case 0x294:	/* CONTROL_MSUSPENDMUX_1 */
+    case 0x294: /* CONTROL_MSUSPENDMUX_1 */
         return s->msuspendmux[1];
-    case 0x298:	/* CONTROL_MSUSPENDMUX_2 */
+    case 0x298: /* CONTROL_MSUSPENDMUX_2 */
         return s->msuspendmux[2];
-    case 0x29c:	/* CONTROL_MSUSPENDMUX_3 */
+    case 0x29c: /* CONTROL_MSUSPENDMUX_3 */
         return s->msuspendmux[3];
-    case 0x2a0:	/* CONTROL_MSUSPENDMUX_4 */
+    case 0x2a0: /* CONTROL_MSUSPENDMUX_4 */
         return s->msuspendmux[4];
-    case 0x2a4:	/* CONTROL_MSUSPENDMUX_5 */
+    case 0x2a4: /* CONTROL_MSUSPENDMUX_5 */
         return 0;
 
-    case 0x2b8:	/* CONTROL_PSA_CTRL */
+    case 0x2b8: /* CONTROL_PSA_CTRL */
         return s->psaconfig;
-    case 0x2bc:	/* CONTROL_PSA_CMD */
-    case 0x2c0:	/* CONTROL_PSA_VALUE */
+    case 0x2bc: /* CONTROL_PSA_CMD */
+    case 0x2c0: /* CONTROL_PSA_VALUE */
         return 0;
 
-    case 0x2b0:	/* CONTROL_SEC_CTRL */
+    case 0x2b0: /* CONTROL_SEC_CTRL */
         return 0x800000f1;
-    case 0x2d0:	/* CONTROL_SEC_EMU */
+    case 0x2d0: /* CONTROL_SEC_EMU */
         return 0x80000015;
-    case 0x2d4:	/* CONTROL_SEC_TAP */
+    case 0x2d4: /* CONTROL_SEC_TAP */
         return 0x8000007f;
-    case 0x2b4:	/* CONTROL_SEC_TEST */
-    case 0x2f0:	/* CONTROL_SEC_STATUS */
-    case 0x2f4:	/* CONTROL_SEC_ERR_STATUS */
+    case 0x2b4: /* CONTROL_SEC_TEST */
+    case 0x2f0: /* CONTROL_SEC_STATUS */
+    case 0x2f4: /* CONTROL_SEC_ERR_STATUS */
         /* Secure mode is not present on general-pusrpose device.  Outside
          * secure mode these values cannot be read or written.  */
         return 0;
 
-    case 0x2d8:	/* CONTROL_OCM_RAM_PERM */
+    case 0x2d8: /* CONTROL_OCM_RAM_PERM */
         return 0xff;
-    case 0x2dc:	/* CONTROL_OCM_PUB_RAM_ADD */
-    case 0x2e0:	/* CONTROL_EXT_SEC_RAM_START_ADD */
-    case 0x2e4:	/* CONTROL_EXT_SEC_RAM_STOP_ADD */
+    case 0x2dc: /* CONTROL_OCM_PUB_RAM_ADD */
+    case 0x2e0: /* CONTROL_EXT_SEC_RAM_START_ADD */
+    case 0x2e4: /* CONTROL_EXT_SEC_RAM_STOP_ADD */
         /* No secure mode so no Extended Secure RAM present.  */
         return 0;
 
-    case 0x2f8:	/* CONTROL_STATUS */
+    case 0x2f8: /* CONTROL_STATUS */
         /* Device Type => General-purpose */
         return 0x0300;
-    case 0x2fc:	/* CONTROL_GENERAL_PURPOSE_STATUS */
+    case 0x2fc: /* CONTROL_GENERAL_PURPOSE_STATUS */
 
-    case 0x300:	/* CONTROL_RPUB_KEY_H_0 */
-    case 0x304:	/* CONTROL_RPUB_KEY_H_1 */
-    case 0x308:	/* CONTROL_RPUB_KEY_H_2 */
-    case 0x30c:	/* CONTROL_RPUB_KEY_H_3 */
+    case 0x300: /* CONTROL_RPUB_KEY_H_0 */
+    case 0x304: /* CONTROL_RPUB_KEY_H_1 */
+    case 0x308: /* CONTROL_RPUB_KEY_H_2 */
+    case 0x30c: /* CONTROL_RPUB_KEY_H_3 */
         return 0xdecafbad;
 
-    case 0x310:	/* CONTROL_RAND_KEY_0 */
-    case 0x314:	/* CONTROL_RAND_KEY_1 */
-    case 0x318:	/* CONTROL_RAND_KEY_2 */
-    case 0x31c:	/* CONTROL_RAND_KEY_3 */
-    case 0x320:	/* CONTROL_CUST_KEY_0 */
-    case 0x324:	/* CONTROL_CUST_KEY_1 */
-    case 0x330:	/* CONTROL_TEST_KEY_0 */
-    case 0x334:	/* CONTROL_TEST_KEY_1 */
-    case 0x338:	/* CONTROL_TEST_KEY_2 */
-    case 0x33c:	/* CONTROL_TEST_KEY_3 */
-    case 0x340:	/* CONTROL_TEST_KEY_4 */
-    case 0x344:	/* CONTROL_TEST_KEY_5 */
-    case 0x348:	/* CONTROL_TEST_KEY_6 */
-    case 0x34c:	/* CONTROL_TEST_KEY_7 */
-    case 0x350:	/* CONTROL_TEST_KEY_8 */
-    case 0x354:	/* CONTROL_TEST_KEY_9 */
+    case 0x310: /* CONTROL_RAND_KEY_0 */
+    case 0x314: /* CONTROL_RAND_KEY_1 */
+    case 0x318: /* CONTROL_RAND_KEY_2 */
+    case 0x31c: /* CONTROL_RAND_KEY_3 */
+    case 0x320: /* CONTROL_CUST_KEY_0 */
+    case 0x324: /* CONTROL_CUST_KEY_1 */
+    case 0x330: /* CONTROL_TEST_KEY_0 */
+    case 0x334: /* CONTROL_TEST_KEY_1 */
+    case 0x338: /* CONTROL_TEST_KEY_2 */
+    case 0x33c: /* CONTROL_TEST_KEY_3 */
+    case 0x340: /* CONTROL_TEST_KEY_4 */
+    case 0x344: /* CONTROL_TEST_KEY_5 */
+    case 0x348: /* CONTROL_TEST_KEY_6 */
+    case 0x34c: /* CONTROL_TEST_KEY_7 */
+    case 0x350: /* CONTROL_TEST_KEY_8 */
+    case 0x354: /* CONTROL_TEST_KEY_9 */
         /* Can only be accessed in secure mode and when C_FieldAccEnable
          * bit is set in CONTROL_SEC_CTRL.
          * TODO: otherwise an interconnect access error is generated.  */
@@ -1976,7 +1976,7 @@ static void omap_sysctl_write8(void *opaque, hwaddr addr, uint32_t value)
     int prev_value;
 
     switch (addr) {
-    case 0x030 ... 0x140:	/* CONTROL_PADCONF - only used in the POP */
+    case 0x030 ... 0x140:   /* CONTROL_PADCONF - only used in the POP */
         pad_offset = (addr - 0x30) >> 2;
         byte_offset = (addr - 0x30) & (4 - 1);
 
@@ -1997,87 +1997,87 @@ static void omap_sysctl_write(void *opaque, hwaddr addr, uint32_t value)
     struct omap_sysctl_s *s = opaque;
 
     switch (addr) {
-    case 0x000:	/* CONTROL_REVISION */
-    case 0x2a4:	/* CONTROL_MSUSPENDMUX_5 */
-    case 0x2c0:	/* CONTROL_PSA_VALUE */
-    case 0x2f8:	/* CONTROL_STATUS */
-    case 0x2fc:	/* CONTROL_GENERAL_PURPOSE_STATUS */
-    case 0x300:	/* CONTROL_RPUB_KEY_H_0 */
-    case 0x304:	/* CONTROL_RPUB_KEY_H_1 */
-    case 0x308:	/* CONTROL_RPUB_KEY_H_2 */
-    case 0x30c:	/* CONTROL_RPUB_KEY_H_3 */
-    case 0x310:	/* CONTROL_RAND_KEY_0 */
-    case 0x314:	/* CONTROL_RAND_KEY_1 */
-    case 0x318:	/* CONTROL_RAND_KEY_2 */
-    case 0x31c:	/* CONTROL_RAND_KEY_3 */
-    case 0x320:	/* CONTROL_CUST_KEY_0 */
-    case 0x324:	/* CONTROL_CUST_KEY_1 */
-    case 0x330:	/* CONTROL_TEST_KEY_0 */
-    case 0x334:	/* CONTROL_TEST_KEY_1 */
-    case 0x338:	/* CONTROL_TEST_KEY_2 */
-    case 0x33c:	/* CONTROL_TEST_KEY_3 */
-    case 0x340:	/* CONTROL_TEST_KEY_4 */
-    case 0x344:	/* CONTROL_TEST_KEY_5 */
-    case 0x348:	/* CONTROL_TEST_KEY_6 */
-    case 0x34c:	/* CONTROL_TEST_KEY_7 */
-    case 0x350:	/* CONTROL_TEST_KEY_8 */
-    case 0x354:	/* CONTROL_TEST_KEY_9 */
+    case 0x000: /* CONTROL_REVISION */
+    case 0x2a4: /* CONTROL_MSUSPENDMUX_5 */
+    case 0x2c0: /* CONTROL_PSA_VALUE */
+    case 0x2f8: /* CONTROL_STATUS */
+    case 0x2fc: /* CONTROL_GENERAL_PURPOSE_STATUS */
+    case 0x300: /* CONTROL_RPUB_KEY_H_0 */
+    case 0x304: /* CONTROL_RPUB_KEY_H_1 */
+    case 0x308: /* CONTROL_RPUB_KEY_H_2 */
+    case 0x30c: /* CONTROL_RPUB_KEY_H_3 */
+    case 0x310: /* CONTROL_RAND_KEY_0 */
+    case 0x314: /* CONTROL_RAND_KEY_1 */
+    case 0x318: /* CONTROL_RAND_KEY_2 */
+    case 0x31c: /* CONTROL_RAND_KEY_3 */
+    case 0x320: /* CONTROL_CUST_KEY_0 */
+    case 0x324: /* CONTROL_CUST_KEY_1 */
+    case 0x330: /* CONTROL_TEST_KEY_0 */
+    case 0x334: /* CONTROL_TEST_KEY_1 */
+    case 0x338: /* CONTROL_TEST_KEY_2 */
+    case 0x33c: /* CONTROL_TEST_KEY_3 */
+    case 0x340: /* CONTROL_TEST_KEY_4 */
+    case 0x344: /* CONTROL_TEST_KEY_5 */
+    case 0x348: /* CONTROL_TEST_KEY_6 */
+    case 0x34c: /* CONTROL_TEST_KEY_7 */
+    case 0x350: /* CONTROL_TEST_KEY_8 */
+    case 0x354: /* CONTROL_TEST_KEY_9 */
         OMAP_RO_REG(addr);
         return;
 
-    case 0x010:	/* CONTROL_SYSCONFIG */
+    case 0x010: /* CONTROL_SYSCONFIG */
         s->sysconfig = value & 0x1e;
         break;
 
-    case 0x030 ... 0x140:	/* CONTROL_PADCONF - only used in the POP */
+    case 0x030 ... 0x140:   /* CONTROL_PADCONF - only used in the POP */
         /* XXX: should check constant bits */
         s->padconf[(addr - 0x30) >> 2] = value & 0x1f1f1f1f;
         break;
 
-    case 0x270:	/* CONTROL_DEBOBS */
+    case 0x270: /* CONTROL_DEBOBS */
         s->obs = value & 0xff;
         break;
 
-    case 0x274:	/* CONTROL_DEVCONF */
+    case 0x274: /* CONTROL_DEVCONF */
         s->devconfig = value & 0xffffc7ff;
         break;
 
-    case 0x28c:	/* CONTROL_EMU_SUPPORT */
+    case 0x28c: /* CONTROL_EMU_SUPPORT */
         break;
 
-    case 0x290:	/* CONTROL_MSUSPENDMUX_0 */
+    case 0x290: /* CONTROL_MSUSPENDMUX_0 */
         s->msuspendmux[0] = value & 0x3fffffff;
         break;
-    case 0x294:	/* CONTROL_MSUSPENDMUX_1 */
+    case 0x294: /* CONTROL_MSUSPENDMUX_1 */
         s->msuspendmux[1] = value & 0x3fffffff;
         break;
-    case 0x298:	/* CONTROL_MSUSPENDMUX_2 */
+    case 0x298: /* CONTROL_MSUSPENDMUX_2 */
         s->msuspendmux[2] = value & 0x3fffffff;
         break;
-    case 0x29c:	/* CONTROL_MSUSPENDMUX_3 */
+    case 0x29c: /* CONTROL_MSUSPENDMUX_3 */
         s->msuspendmux[3] = value & 0x3fffffff;
         break;
-    case 0x2a0:	/* CONTROL_MSUSPENDMUX_4 */
+    case 0x2a0: /* CONTROL_MSUSPENDMUX_4 */
         s->msuspendmux[4] = value & 0x3fffffff;
         break;
 
-    case 0x2b8:	/* CONTROL_PSA_CTRL */
+    case 0x2b8: /* CONTROL_PSA_CTRL */
         s->psaconfig = value & 0x1c;
         s->psaconfig |= (value & 0x20) ? 2 : 1;
         break;
-    case 0x2bc:	/* CONTROL_PSA_CMD */
+    case 0x2bc: /* CONTROL_PSA_CMD */
         break;
 
-    case 0x2b0:	/* CONTROL_SEC_CTRL */
-    case 0x2b4:	/* CONTROL_SEC_TEST */
-    case 0x2d0:	/* CONTROL_SEC_EMU */
-    case 0x2d4:	/* CONTROL_SEC_TAP */
-    case 0x2d8:	/* CONTROL_OCM_RAM_PERM */
-    case 0x2dc:	/* CONTROL_OCM_PUB_RAM_ADD */
-    case 0x2e0:	/* CONTROL_EXT_SEC_RAM_START_ADD */
-    case 0x2e4:	/* CONTROL_EXT_SEC_RAM_STOP_ADD */
-    case 0x2f0:	/* CONTROL_SEC_STATUS */
-    case 0x2f4:	/* CONTROL_SEC_ERR_STATUS */
+    case 0x2b0: /* CONTROL_SEC_CTRL */
+    case 0x2b4: /* CONTROL_SEC_TEST */
+    case 0x2d0: /* CONTROL_SEC_EMU */
+    case 0x2d4: /* CONTROL_SEC_TAP */
+    case 0x2d8: /* CONTROL_OCM_RAM_PERM */
+    case 0x2dc: /* CONTROL_OCM_PUB_RAM_ADD */
+    case 0x2e0: /* CONTROL_EXT_SEC_RAM_START_ADD */
+    case 0x2e4: /* CONTROL_EXT_SEC_RAM_STOP_ADD */
+    case 0x2f0: /* CONTROL_SEC_STATUS */
+    case 0x2f4: /* CONTROL_SEC_ERR_STATUS */
         break;
 
     default:
@@ -2156,13 +2156,13 @@ static void omap_sysctl_reset(struct omap_sysctl_s *s)
     s->padconf[0x0d] = 0x08080800;
     s->padconf[0x0e] = 0x08080808;
     s->padconf[0x0f] = 0x08080808;
-    s->padconf[0x10] = 0x18181808;	/* | 0x07070700 if SBoot3 */
-    s->padconf[0x11] = 0x18181818;	/* | 0x07070707 if SBoot3 */
-    s->padconf[0x12] = 0x18181818;	/* | 0x07070707 if SBoot3 */
-    s->padconf[0x13] = 0x18181818;	/* | 0x07070707 if SBoot3 */
-    s->padconf[0x14] = 0x18181818;	/* | 0x00070707 if SBoot3 */
+    s->padconf[0x10] = 0x18181808;  /* | 0x07070700 if SBoot3 */
+    s->padconf[0x11] = 0x18181818;  /* | 0x07070707 if SBoot3 */
+    s->padconf[0x12] = 0x18181818;  /* | 0x07070707 if SBoot3 */
+    s->padconf[0x13] = 0x18181818;  /* | 0x07070707 if SBoot3 */
+    s->padconf[0x14] = 0x18181818;  /* | 0x00070707 if SBoot3 */
     s->padconf[0x15] = 0x18181818;
-    s->padconf[0x16] = 0x18181818;	/* | 0x07000000 if SBoot3 */
+    s->padconf[0x16] = 0x18181818;  /* | 0x07000000 if SBoot3 */
     s->padconf[0x17] = 0x1f001f00;
     s->padconf[0x18] = 0x1f1f1f1f;
     s->padconf[0x19] = 0x00000000;
@@ -2524,184 +2524,184 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegion *sdram,
                     omap_findclk(s, "core_l4_iclk"));
 
     /* All register mappings (including those not currently implemented):
-     * SystemControlMod	48000000 - 48000fff
-     * SystemControlL4	48001000 - 48001fff
-     * 32kHz Timer Mod	48004000 - 48004fff
-     * 32kHz Timer L4	48005000 - 48005fff
-     * PRCM ModA	48008000 - 480087ff
-     * PRCM ModB	48008800 - 48008fff
-     * PRCM L4		48009000 - 48009fff
-     * TEST-BCM Mod	48012000 - 48012fff
-     * TEST-BCM L4	48013000 - 48013fff
-     * TEST-TAP Mod	48014000 - 48014fff
-     * TEST-TAP L4	48015000 - 48015fff
-     * GPIO1 Mod	48018000 - 48018fff
-     * GPIO Top		48019000 - 48019fff
-     * GPIO2 Mod	4801a000 - 4801afff
-     * GPIO L4		4801b000 - 4801bfff
-     * GPIO3 Mod	4801c000 - 4801cfff
-     * GPIO4 Mod	4801e000 - 4801efff
-     * WDTIMER1 Mod	48020000 - 48010fff
-     * WDTIMER Top	48021000 - 48011fff
-     * WDTIMER2 Mod	48022000 - 48012fff
-     * WDTIMER L4	48023000 - 48013fff
-     * WDTIMER3 Mod	48024000 - 48014fff
-     * WDTIMER3 L4	48025000 - 48015fff
-     * WDTIMER4 Mod	48026000 - 48016fff
-     * WDTIMER4 L4	48027000 - 48017fff
-     * GPTIMER1 Mod	48028000 - 48018fff
-     * GPTIMER1 L4	48029000 - 48019fff
-     * GPTIMER2 Mod	4802a000 - 4801afff
-     * GPTIMER2 L4	4802b000 - 4801bfff
-     * L4-Config AP	48040000 - 480407ff
-     * L4-Config IP	48040800 - 48040fff
-     * L4-Config LA	48041000 - 48041fff
-     * ARM11ETB Mod	48048000 - 48049fff
-     * ARM11ETB L4	4804a000 - 4804afff
-     * DISPLAY Top	48050000 - 480503ff
-     * DISPLAY DISPC	48050400 - 480507ff
-     * DISPLAY RFBI	48050800 - 48050bff
-     * DISPLAY VENC	48050c00 - 48050fff
-     * DISPLAY L4	48051000 - 48051fff
-     * CAMERA Top	48052000 - 480523ff
-     * CAMERA core	48052400 - 480527ff
-     * CAMERA DMA	48052800 - 48052bff
-     * CAMERA MMU	48052c00 - 48052fff
-     * CAMERA L4	48053000 - 48053fff
-     * SDMA Mod		48056000 - 48056fff
-     * SDMA L4		48057000 - 48057fff
-     * SSI Top		48058000 - 48058fff
-     * SSI GDD		48059000 - 48059fff
-     * SSI Port1	4805a000 - 4805afff
-     * SSI Port2	4805b000 - 4805bfff
-     * SSI L4		4805c000 - 4805cfff
-     * USB Mod		4805e000 - 480fefff
-     * USB L4		4805f000 - 480fffff
-     * WIN_TRACER1 Mod	48060000 - 48060fff
-     * WIN_TRACER1 L4	48061000 - 48061fff
-     * WIN_TRACER2 Mod	48062000 - 48062fff
-     * WIN_TRACER2 L4	48063000 - 48063fff
-     * WIN_TRACER3 Mod	48064000 - 48064fff
-     * WIN_TRACER3 L4	48065000 - 48065fff
-     * WIN_TRACER4 Top	48066000 - 480660ff
-     * WIN_TRACER4 ETT	48066100 - 480661ff
-     * WIN_TRACER4 WT	48066200 - 480662ff
-     * WIN_TRACER4 L4	48067000 - 48067fff
-     * XTI Mod		48068000 - 48068fff
-     * XTI L4		48069000 - 48069fff
-     * UART1 Mod	4806a000 - 4806afff
-     * UART1 L4		4806b000 - 4806bfff
-     * UART2 Mod	4806c000 - 4806cfff
-     * UART2 L4		4806d000 - 4806dfff
-     * UART3 Mod	4806e000 - 4806efff
-     * UART3 L4		4806f000 - 4806ffff
-     * I2C1 Mod		48070000 - 48070fff
-     * I2C1 L4		48071000 - 48071fff
-     * I2C2 Mod		48072000 - 48072fff
-     * I2C2 L4		48073000 - 48073fff
-     * McBSP1 Mod	48074000 - 48074fff
-     * McBSP1 L4	48075000 - 48075fff
-     * McBSP2 Mod	48076000 - 48076fff
-     * McBSP2 L4	48077000 - 48077fff
-     * GPTIMER3 Mod	48078000 - 48078fff
-     * GPTIMER3 L4	48079000 - 48079fff
-     * GPTIMER4 Mod	4807a000 - 4807afff
-     * GPTIMER4 L4	4807b000 - 4807bfff
-     * GPTIMER5 Mod	4807c000 - 4807cfff
-     * GPTIMER5 L4	4807d000 - 4807dfff
-     * GPTIMER6 Mod	4807e000 - 4807efff
-     * GPTIMER6 L4	4807f000 - 4807ffff
-     * GPTIMER7 Mod	48080000 - 48080fff
-     * GPTIMER7 L4	48081000 - 48081fff
-     * GPTIMER8 Mod	48082000 - 48082fff
-     * GPTIMER8 L4	48083000 - 48083fff
-     * GPTIMER9 Mod	48084000 - 48084fff
-     * GPTIMER9 L4	48085000 - 48085fff
-     * GPTIMER10 Mod	48086000 - 48086fff
-     * GPTIMER10 L4	48087000 - 48087fff
-     * GPTIMER11 Mod	48088000 - 48088fff
-     * GPTIMER11 L4	48089000 - 48089fff
-     * GPTIMER12 Mod	4808a000 - 4808afff
-     * GPTIMER12 L4	4808b000 - 4808bfff
-     * EAC Mod		48090000 - 48090fff
-     * EAC L4		48091000 - 48091fff
-     * FAC Mod		48092000 - 48092fff
-     * FAC L4		48093000 - 48093fff
-     * MAILBOX Mod	48094000 - 48094fff
-     * MAILBOX L4	48095000 - 48095fff
-     * SPI1 Mod		48098000 - 48098fff
-     * SPI1 L4		48099000 - 48099fff
-     * SPI2 Mod		4809a000 - 4809afff
-     * SPI2 L4		4809b000 - 4809bfff
-     * MMC/SDIO Mod	4809c000 - 4809cfff
-     * MMC/SDIO L4	4809d000 - 4809dfff
-     * MS_PRO Mod	4809e000 - 4809efff
-     * MS_PRO L4	4809f000 - 4809ffff
-     * RNG Mod		480a0000 - 480a0fff
-     * RNG L4		480a1000 - 480a1fff
-     * DES3DES Mod	480a2000 - 480a2fff
-     * DES3DES L4	480a3000 - 480a3fff
-     * SHA1MD5 Mod	480a4000 - 480a4fff
-     * SHA1MD5 L4	480a5000 - 480a5fff
-     * AES Mod		480a6000 - 480a6fff
-     * AES L4		480a7000 - 480a7fff
-     * PKA Mod		480a8000 - 480a9fff
-     * PKA L4		480aa000 - 480aafff
-     * MG Mod		480b0000 - 480b0fff
-     * MG L4		480b1000 - 480b1fff
-     * HDQ/1-wire Mod	480b2000 - 480b2fff
-     * HDQ/1-wire L4	480b3000 - 480b3fff
-     * MPU interrupt	480fe000 - 480fefff
-     * STI channel base	54000000 - 5400ffff
-     * IVA RAM		5c000000 - 5c01ffff
-     * IVA ROM		5c020000 - 5c027fff
-     * IMG_BUF_A	5c040000 - 5c040fff
-     * IMG_BUF_B	5c042000 - 5c042fff
-     * VLCDS		5c048000 - 5c0487ff
-     * IMX_COEF		5c049000 - 5c04afff
-     * IMX_CMD		5c051000 - 5c051fff
-     * VLCDQ		5c053000 - 5c0533ff
-     * VLCDH		5c054000 - 5c054fff
-     * SEQ_CMD		5c055000 - 5c055fff
-     * IMX_REG		5c056000 - 5c0560ff
-     * VLCD_REG		5c056100 - 5c0561ff
-     * SEQ_REG		5c056200 - 5c0562ff
-     * IMG_BUF_REG	5c056300 - 5c0563ff
-     * SEQIRQ_REG	5c056400 - 5c0564ff
-     * OCP_REG		5c060000 - 5c060fff
-     * SYSC_REG		5c070000 - 5c070fff
-     * MMU_REG		5d000000 - 5d000fff
-     * sDMA R		68000400 - 680005ff
-     * sDMA W		68000600 - 680007ff
-     * Display Control	68000800 - 680009ff
-     * DSP subsystem	68000a00 - 68000bff
-     * MPU subsystem	68000c00 - 68000dff
-     * IVA subsystem	68001000 - 680011ff
-     * USB		68001200 - 680013ff
-     * Camera		68001400 - 680015ff
-     * VLYNQ (firewall)	68001800 - 68001bff
-     * VLYNQ		68001e00 - 68001fff
-     * SSI		68002000 - 680021ff
-     * L4		68002400 - 680025ff
-     * DSP (firewall)	68002800 - 68002bff
-     * DSP subsystem	68002e00 - 68002fff
-     * IVA (firewall)	68003000 - 680033ff
-     * IVA		68003600 - 680037ff
-     * GFX		68003a00 - 68003bff
-     * CMDWR emulation	68003c00 - 68003dff
-     * SMS		68004000 - 680041ff
-     * OCM		68004200 - 680043ff
-     * GPMC		68004400 - 680045ff
-     * RAM (firewall)	68005000 - 680053ff
-     * RAM (err login)	68005400 - 680057ff
-     * ROM (firewall)	68005800 - 68005bff
-     * ROM (err login)	68005c00 - 68005fff
-     * GPMC (firewall)	68006000 - 680063ff
-     * GPMC (err login)	68006400 - 680067ff
-     * SMS (err login)	68006c00 - 68006fff
-     * SMS registers	68008000 - 68008fff
-     * SDRC registers	68009000 - 68009fff
-     * GPMC registers	6800a000   6800afff
+     * SystemControlMod 48000000 - 48000fff
+     * SystemControlL4  48001000 - 48001fff
+     * 32kHz Timer Mod  48004000 - 48004fff
+     * 32kHz Timer L4   48005000 - 48005fff
+     * PRCM ModA    48008000 - 480087ff
+     * PRCM ModB    48008800 - 48008fff
+     * PRCM L4      48009000 - 48009fff
+     * TEST-BCM Mod 48012000 - 48012fff
+     * TEST-BCM L4  48013000 - 48013fff
+     * TEST-TAP Mod 48014000 - 48014fff
+     * TEST-TAP L4  48015000 - 48015fff
+     * GPIO1 Mod    48018000 - 48018fff
+     * GPIO Top     48019000 - 48019fff
+     * GPIO2 Mod    4801a000 - 4801afff
+     * GPIO L4      4801b000 - 4801bfff
+     * GPIO3 Mod    4801c000 - 4801cfff
+     * GPIO4 Mod    4801e000 - 4801efff
+     * WDTIMER1 Mod 48020000 - 48010fff
+     * WDTIMER Top  48021000 - 48011fff
+     * WDTIMER2 Mod 48022000 - 48012fff
+     * WDTIMER L4   48023000 - 48013fff
+     * WDTIMER3 Mod 48024000 - 48014fff
+     * WDTIMER3 L4  48025000 - 48015fff
+     * WDTIMER4 Mod 48026000 - 48016fff
+     * WDTIMER4 L4  48027000 - 48017fff
+     * GPTIMER1 Mod 48028000 - 48018fff
+     * GPTIMER1 L4  48029000 - 48019fff
+     * GPTIMER2 Mod 4802a000 - 4801afff
+     * GPTIMER2 L4  4802b000 - 4801bfff
+     * L4-Config AP 48040000 - 480407ff
+     * L4-Config IP 48040800 - 48040fff
+     * L4-Config LA 48041000 - 48041fff
+     * ARM11ETB Mod 48048000 - 48049fff
+     * ARM11ETB L4  4804a000 - 4804afff
+     * DISPLAY Top  48050000 - 480503ff
+     * DISPLAY DISPC    48050400 - 480507ff
+     * DISPLAY RFBI 48050800 - 48050bff
+     * DISPLAY VENC 48050c00 - 48050fff
+     * DISPLAY L4   48051000 - 48051fff
+     * CAMERA Top   48052000 - 480523ff
+     * CAMERA core  48052400 - 480527ff
+     * CAMERA DMA   48052800 - 48052bff
+     * CAMERA MMU   48052c00 - 48052fff
+     * CAMERA L4    48053000 - 48053fff
+     * SDMA Mod     48056000 - 48056fff
+     * SDMA L4      48057000 - 48057fff
+     * SSI Top      48058000 - 48058fff
+     * SSI GDD      48059000 - 48059fff
+     * SSI Port1    4805a000 - 4805afff
+     * SSI Port2    4805b000 - 4805bfff
+     * SSI L4       4805c000 - 4805cfff
+     * USB Mod      4805e000 - 480fefff
+     * USB L4       4805f000 - 480fffff
+     * WIN_TRACER1 Mod  48060000 - 48060fff
+     * WIN_TRACER1 L4   48061000 - 48061fff
+     * WIN_TRACER2 Mod  48062000 - 48062fff
+     * WIN_TRACER2 L4   48063000 - 48063fff
+     * WIN_TRACER3 Mod  48064000 - 48064fff
+     * WIN_TRACER3 L4   48065000 - 48065fff
+     * WIN_TRACER4 Top  48066000 - 480660ff
+     * WIN_TRACER4 ETT  48066100 - 480661ff
+     * WIN_TRACER4 WT   48066200 - 480662ff
+     * WIN_TRACER4 L4   48067000 - 48067fff
+     * XTI Mod      48068000 - 48068fff
+     * XTI L4       48069000 - 48069fff
+     * UART1 Mod    4806a000 - 4806afff
+     * UART1 L4     4806b000 - 4806bfff
+     * UART2 Mod    4806c000 - 4806cfff
+     * UART2 L4     4806d000 - 4806dfff
+     * UART3 Mod    4806e000 - 4806efff
+     * UART3 L4     4806f000 - 4806ffff
+     * I2C1 Mod     48070000 - 48070fff
+     * I2C1 L4      48071000 - 48071fff
+     * I2C2 Mod     48072000 - 48072fff
+     * I2C2 L4      48073000 - 48073fff
+     * McBSP1 Mod   48074000 - 48074fff
+     * McBSP1 L4    48075000 - 48075fff
+     * McBSP2 Mod   48076000 - 48076fff
+     * McBSP2 L4    48077000 - 48077fff
+     * GPTIMER3 Mod 48078000 - 48078fff
+     * GPTIMER3 L4  48079000 - 48079fff
+     * GPTIMER4 Mod 4807a000 - 4807afff
+     * GPTIMER4 L4  4807b000 - 4807bfff
+     * GPTIMER5 Mod 4807c000 - 4807cfff
+     * GPTIMER5 L4  4807d000 - 4807dfff
+     * GPTIMER6 Mod 4807e000 - 4807efff
+     * GPTIMER6 L4  4807f000 - 4807ffff
+     * GPTIMER7 Mod 48080000 - 48080fff
+     * GPTIMER7 L4  48081000 - 48081fff
+     * GPTIMER8 Mod 48082000 - 48082fff
+     * GPTIMER8 L4  48083000 - 48083fff
+     * GPTIMER9 Mod 48084000 - 48084fff
+     * GPTIMER9 L4  48085000 - 48085fff
+     * GPTIMER10 Mod    48086000 - 48086fff
+     * GPTIMER10 L4 48087000 - 48087fff
+     * GPTIMER11 Mod    48088000 - 48088fff
+     * GPTIMER11 L4 48089000 - 48089fff
+     * GPTIMER12 Mod    4808a000 - 4808afff
+     * GPTIMER12 L4 4808b000 - 4808bfff
+     * EAC Mod      48090000 - 48090fff
+     * EAC L4       48091000 - 48091fff
+     * FAC Mod      48092000 - 48092fff
+     * FAC L4       48093000 - 48093fff
+     * MAILBOX Mod  48094000 - 48094fff
+     * MAILBOX L4   48095000 - 48095fff
+     * SPI1 Mod     48098000 - 48098fff
+     * SPI1 L4      48099000 - 48099fff
+     * SPI2 Mod     4809a000 - 4809afff
+     * SPI2 L4      4809b000 - 4809bfff
+     * MMC/SDIO Mod 4809c000 - 4809cfff
+     * MMC/SDIO L4  4809d000 - 4809dfff
+     * MS_PRO Mod   4809e000 - 4809efff
+     * MS_PRO L4    4809f000 - 4809ffff
+     * RNG Mod      480a0000 - 480a0fff
+     * RNG L4       480a1000 - 480a1fff
+     * DES3DES Mod  480a2000 - 480a2fff
+     * DES3DES L4   480a3000 - 480a3fff
+     * SHA1MD5 Mod  480a4000 - 480a4fff
+     * SHA1MD5 L4   480a5000 - 480a5fff
+     * AES Mod      480a6000 - 480a6fff
+     * AES L4       480a7000 - 480a7fff
+     * PKA Mod      480a8000 - 480a9fff
+     * PKA L4       480aa000 - 480aafff
+     * MG Mod       480b0000 - 480b0fff
+     * MG L4        480b1000 - 480b1fff
+     * HDQ/1-wire Mod   480b2000 - 480b2fff
+     * HDQ/1-wire L4    480b3000 - 480b3fff
+     * MPU interrupt    480fe000 - 480fefff
+     * STI channel base 54000000 - 5400ffff
+     * IVA RAM      5c000000 - 5c01ffff
+     * IVA ROM      5c020000 - 5c027fff
+     * IMG_BUF_A    5c040000 - 5c040fff
+     * IMG_BUF_B    5c042000 - 5c042fff
+     * VLCDS        5c048000 - 5c0487ff
+     * IMX_COEF     5c049000 - 5c04afff
+     * IMX_CMD      5c051000 - 5c051fff
+     * VLCDQ        5c053000 - 5c0533ff
+     * VLCDH        5c054000 - 5c054fff
+     * SEQ_CMD      5c055000 - 5c055fff
+     * IMX_REG      5c056000 - 5c0560ff
+     * VLCD_REG     5c056100 - 5c0561ff
+     * SEQ_REG      5c056200 - 5c0562ff
+     * IMG_BUF_REG  5c056300 - 5c0563ff
+     * SEQIRQ_REG   5c056400 - 5c0564ff
+     * OCP_REG      5c060000 - 5c060fff
+     * SYSC_REG     5c070000 - 5c070fff
+     * MMU_REG      5d000000 - 5d000fff
+     * sDMA R       68000400 - 680005ff
+     * sDMA W       68000600 - 680007ff
+     * Display Control  68000800 - 680009ff
+     * DSP subsystem    68000a00 - 68000bff
+     * MPU subsystem    68000c00 - 68000dff
+     * IVA subsystem    68001000 - 680011ff
+     * USB      68001200 - 680013ff
+     * Camera       68001400 - 680015ff
+     * VLYNQ (firewall) 68001800 - 68001bff
+     * VLYNQ        68001e00 - 68001fff
+     * SSI      68002000 - 680021ff
+     * L4       68002400 - 680025ff
+     * DSP (firewall)   68002800 - 68002bff
+     * DSP subsystem    68002e00 - 68002fff
+     * IVA (firewall)   68003000 - 680033ff
+     * IVA      68003600 - 680037ff
+     * GFX      68003a00 - 68003bff
+     * CMDWR emulation  68003c00 - 68003dff
+     * SMS      68004000 - 680041ff
+     * OCM      68004200 - 680043ff
+     * GPMC     68004400 - 680045ff
+     * RAM (firewall)   68005000 - 680053ff
+     * RAM (err login)  68005400 - 680057ff
+     * ROM (firewall)   68005800 - 68005bff
+     * ROM (err login)  68005c00 - 68005fff
+     * GPMC (firewall)  68006000 - 680063ff
+     * GPMC (err login) 68006400 - 680067ff
+     * SMS (err login)  68006c00 - 68006fff
+     * SMS registers    68008000 - 68008fff
+     * SDRC registers   68009000 - 68009fff
+     * GPMC registers   6800a000   6800afff
      */
 
     qemu_register_reset(omap2_mpu_reset, s);
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 4bf1579f8c..f0f87a163f 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -1,7 +1,7 @@
 /* omap_sx1.c Support for the Siemens SX1 smartphone emulation.
  *
  *   Copyright (C) 2008
- * 	Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+ *  Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
  *   Copyright (C) 2007 Vladimir Ananiev <vovan888@gmail.com>
  *
  *   based on PalmOne's (TM) PDAs support (palm.c)
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 07d5dd8691..ece70a8dae 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -83,27 +83,27 @@ static PXASSPDef pxa27x_ssp[] = {
     { 0, 0 }
 };
 
-#define PMCR	0x00	/* Power Manager Control register */
-#define PSSR	0x04	/* Power Manager Sleep Status register */
-#define PSPR	0x08	/* Power Manager Scratch-Pad register */
-#define PWER	0x0c	/* Power Manager Wake-Up Enable register */
-#define PRER	0x10	/* Power Manager Rising-Edge Detect Enable register */
-#define PFER	0x14	/* Power Manager Falling-Edge Detect Enable register */
-#define PEDR	0x18	/* Power Manager Edge-Detect Status register */
-#define PCFR	0x1c	/* Power Manager General Configuration register */
-#define PGSR0	0x20	/* Power Manager GPIO Sleep-State register 0 */
-#define PGSR1	0x24	/* Power Manager GPIO Sleep-State register 1 */
-#define PGSR2	0x28	/* Power Manager GPIO Sleep-State register 2 */
-#define PGSR3	0x2c	/* Power Manager GPIO Sleep-State register 3 */
-#define RCSR	0x30	/* Reset Controller Status register */
-#define PSLR	0x34	/* Power Manager Sleep Configuration register */
-#define PTSR	0x38	/* Power Manager Standby Configuration register */
-#define PVCR	0x40	/* Power Manager Voltage Change Control register */
-#define PUCR	0x4c	/* Power Manager USIM Card Control/Status register */
-#define PKWR	0x50	/* Power Manager Keyboard Wake-Up Enable register */
-#define PKSR	0x54	/* Power Manager Keyboard Level-Detect Status */
-#define PCMD0	0x80	/* Power Manager I2C Command register File 0 */
-#define PCMD31	0xfc	/* Power Manager I2C Command register File 31 */
+#define PMCR    0x00    /* Power Manager Control register */
+#define PSSR    0x04    /* Power Manager Sleep Status register */
+#define PSPR    0x08    /* Power Manager Scratch-Pad register */
+#define PWER    0x0c    /* Power Manager Wake-Up Enable register */
+#define PRER    0x10    /* Power Manager Rising-Edge Detect Enable register */
+#define PFER    0x14    /* Power Manager Falling-Edge Detect Enable register */
+#define PEDR    0x18    /* Power Manager Edge-Detect Status register */
+#define PCFR    0x1c    /* Power Manager General Configuration register */
+#define PGSR0   0x20    /* Power Manager GPIO Sleep-State register 0 */
+#define PGSR1   0x24    /* Power Manager GPIO Sleep-State register 1 */
+#define PGSR2   0x28    /* Power Manager GPIO Sleep-State register 2 */
+#define PGSR3   0x2c    /* Power Manager GPIO Sleep-State register 3 */
+#define RCSR    0x30    /* Reset Controller Status register */
+#define PSLR    0x34    /* Power Manager Sleep Configuration register */
+#define PTSR    0x38    /* Power Manager Standby Configuration register */
+#define PVCR    0x40    /* Power Manager Voltage Change Control register */
+#define PUCR    0x4c    /* Power Manager USIM Card Control/Status register */
+#define PKWR    0x50    /* Power Manager Keyboard Wake-Up Enable register */
+#define PKSR    0x54    /* Power Manager Keyboard Level-Detect Status */
+#define PCMD0   0x80    /* Power Manager I2C Command register File 0 */
+#define PCMD31  0xfc    /* Power Manager I2C Command register File 31 */
 
 static uint64_t pxa2xx_pm_read(void *opaque, hwaddr addr,
                                unsigned size)
@@ -140,13 +140,13 @@ static void pxa2xx_pm_write(void *opaque, hwaddr addr,
         s->pm_regs[addr >> 2] |= value & 0x15;
         break;
 
-    case PSSR:	/* Read-clean registers */
+    case PSSR:  /* Read-clean registers */
     case RCSR:
     case PKSR:
         s->pm_regs[addr >> 2] &= ~value;
         break;
 
-    default:	/* Read-write registers */
+    default:    /* Read-write registers */
         if (!(addr & 3)) {
             s->pm_regs[addr >> 2] = value;
             break;
@@ -174,10 +174,10 @@ static const VMStateDescription vmstate_pxa2xx_pm = {
     }
 };
 
-#define CCCR	0x00	/* Core Clock Configuration register */
-#define CKEN	0x04	/* Clock Enable register */
-#define OSCC	0x08	/* Oscillator Configuration register */
-#define CCSR	0x0c	/* Core Clock Status register */
+#define CCCR    0x00    /* Core Clock Configuration register */
+#define CKEN    0x04    /* Clock Enable register */
+#define OSCC    0x08    /* Oscillator Configuration register */
+#define CCSR    0x0c    /* Core Clock Status register */
 
 static uint64_t pxa2xx_cm_read(void *opaque, hwaddr addr,
                                unsigned size)
@@ -216,8 +216,8 @@ static void pxa2xx_cm_write(void *opaque, hwaddr addr,
     case OSCC:
         s->cm_regs[addr >> 2] &= ~0x6c;
         s->cm_regs[addr >> 2] |= value & 0x6e;
-        if ((value >> 1) & 1)			/* OON */
-            s->cm_regs[addr >> 2] |= 1 << 0;	/* Oscillator is now stable */
+        if ((value >> 1) & 1)           /* OON */
+            s->cm_regs[addr >> 2] |= 1 << 0;    /* Oscillator is now stable */
         break;
 
     default:
@@ -392,29 +392,29 @@ static void pxa2xx_setup_cp14(PXA2xxState *s)
     define_arm_cp_regs_with_opaque(s->cpu, pxa_cp_reginfo, s);
 }
 
-#define MDCNFG		0x00	/* SDRAM Configuration register */
-#define MDREFR		0x04	/* SDRAM Refresh Control register */
-#define MSC0		0x08	/* Static Memory Control register 0 */
-#define MSC1		0x0c	/* Static Memory Control register 1 */
-#define MSC2		0x10	/* Static Memory Control register 2 */
-#define MECR		0x14	/* Expansion Memory Bus Config register */
-#define SXCNFG		0x1c	/* Synchronous Static Memory Config register */
-#define MCMEM0		0x28	/* PC Card Memory Socket 0 Timing register */
-#define MCMEM1		0x2c	/* PC Card Memory Socket 1 Timing register */
-#define MCATT0		0x30	/* PC Card Attribute Socket 0 register */
-#define MCATT1		0x34	/* PC Card Attribute Socket 1 register */
-#define MCIO0		0x38	/* PC Card I/O Socket 0 Timing register */
-#define MCIO1		0x3c	/* PC Card I/O Socket 1 Timing register */
-#define MDMRS		0x40	/* SDRAM Mode Register Set Config register */
-#define BOOT_DEF	0x44	/* Boot-time Default Configuration register */
-#define ARB_CNTL	0x48	/* Arbiter Control register */
-#define BSCNTR0		0x4c	/* Memory Buffer Strength Control register 0 */
-#define BSCNTR1		0x50	/* Memory Buffer Strength Control register 1 */
-#define LCDBSCNTR	0x54	/* LCD Buffer Strength Control register */
-#define MDMRSLP		0x58	/* Low Power SDRAM Mode Set Config register */
-#define BSCNTR2		0x5c	/* Memory Buffer Strength Control register 2 */
-#define BSCNTR3		0x60	/* Memory Buffer Strength Control register 3 */
-#define SA1110		0x64	/* SA-1110 Memory Compatibility register */
+#define MDCNFG      0x00    /* SDRAM Configuration register */
+#define MDREFR      0x04    /* SDRAM Refresh Control register */
+#define MSC0        0x08    /* Static Memory Control register 0 */
+#define MSC1        0x0c    /* Static Memory Control register 1 */
+#define MSC2        0x10    /* Static Memory Control register 2 */
+#define MECR        0x14    /* Expansion Memory Bus Config register */
+#define SXCNFG      0x1c    /* Synchronous Static Memory Config register */
+#define MCMEM0      0x28    /* PC Card Memory Socket 0 Timing register */
+#define MCMEM1      0x2c    /* PC Card Memory Socket 1 Timing register */
+#define MCATT0      0x30    /* PC Card Attribute Socket 0 register */
+#define MCATT1      0x34    /* PC Card Attribute Socket 1 register */
+#define MCIO0       0x38    /* PC Card I/O Socket 0 Timing register */
+#define MCIO1       0x3c    /* PC Card I/O Socket 1 Timing register */
+#define MDMRS       0x40    /* SDRAM Mode Register Set Config register */
+#define BOOT_DEF    0x44    /* Boot-time Default Configuration register */
+#define ARB_CNTL    0x48    /* Arbiter Control register */
+#define BSCNTR0     0x4c    /* Memory Buffer Strength Control register 0 */
+#define BSCNTR1     0x50    /* Memory Buffer Strength Control register 1 */
+#define LCDBSCNTR   0x54    /* LCD Buffer Strength Control register */
+#define MDMRSLP     0x58    /* Low Power SDRAM Mode Set Config register */
+#define BSCNTR2     0x5c    /* Memory Buffer Strength Control register 2 */
+#define BSCNTR3     0x60    /* Memory Buffer Strength Control register 3 */
+#define SA1110      0x64    /* SA-1110 Memory Compatibility register */
 
 static uint64_t pxa2xx_mm_read(void *opaque, hwaddr addr,
                                unsigned size)
@@ -528,52 +528,52 @@ static const VMStateDescription vmstate_pxa2xx_ssp = {
     }
 };
 
-#define SSCR0	0x00	/* SSP Control register 0 */
-#define SSCR1	0x04	/* SSP Control register 1 */
-#define SSSR	0x08	/* SSP Status register */
-#define SSITR	0x0c	/* SSP Interrupt Test register */
-#define SSDR	0x10	/* SSP Data register */
-#define SSTO	0x28	/* SSP Time-Out register */
-#define SSPSP	0x2c	/* SSP Programmable Serial Protocol register */
-#define SSTSA	0x30	/* SSP TX Time Slot Active register */
-#define SSRSA	0x34	/* SSP RX Time Slot Active register */
-#define SSTSS	0x38	/* SSP Time Slot Status register */
-#define SSACD	0x3c	/* SSP Audio Clock Divider register */
+#define SSCR0   0x00    /* SSP Control register 0 */
+#define SSCR1   0x04    /* SSP Control register 1 */
+#define SSSR    0x08    /* SSP Status register */
+#define SSITR   0x0c    /* SSP Interrupt Test register */
+#define SSDR    0x10    /* SSP Data register */
+#define SSTO    0x28    /* SSP Time-Out register */
+#define SSPSP   0x2c    /* SSP Programmable Serial Protocol register */
+#define SSTSA   0x30    /* SSP TX Time Slot Active register */
+#define SSRSA   0x34    /* SSP RX Time Slot Active register */
+#define SSTSS   0x38    /* SSP Time Slot Status register */
+#define SSACD   0x3c    /* SSP Audio Clock Divider register */
 
 /* Bitfields for above registers */
-#define SSCR0_SPI(x)	(((x) & 0x30) == 0x00)
-#define SSCR0_SSP(x)	(((x) & 0x30) == 0x10)
-#define SSCR0_UWIRE(x)	(((x) & 0x30) == 0x20)
-#define SSCR0_PSP(x)	(((x) & 0x30) == 0x30)
-#define SSCR0_SSE	(1 << 7)
-#define SSCR0_RIM	(1 << 22)
-#define SSCR0_TIM	(1 << 23)
+#define SSCR0_SPI(x)    (((x) & 0x30) == 0x00)
+#define SSCR0_SSP(x)    (((x) & 0x30) == 0x10)
+#define SSCR0_UWIRE(x)  (((x) & 0x30) == 0x20)
+#define SSCR0_PSP(x)    (((x) & 0x30) == 0x30)
+#define SSCR0_SSE   (1 << 7)
+#define SSCR0_RIM   (1 << 22)
+#define SSCR0_TIM   (1 << 23)
 #define SSCR0_MOD       (1U << 31)
-#define SSCR0_DSS(x)	(((((x) >> 16) & 0x10) | ((x) & 0xf)) + 1)
-#define SSCR1_RIE	(1 << 0)
-#define SSCR1_TIE	(1 << 1)
-#define SSCR1_LBM	(1 << 2)
-#define SSCR1_MWDS	(1 << 5)
-#define SSCR1_TFT(x)	((((x) >> 6) & 0xf) + 1)
-#define SSCR1_RFT(x)	((((x) >> 10) & 0xf) + 1)
-#define SSCR1_EFWR	(1 << 14)
-#define SSCR1_PINTE	(1 << 18)
-#define SSCR1_TINTE	(1 << 19)
-#define SSCR1_RSRE	(1 << 20)
-#define SSCR1_TSRE	(1 << 21)
-#define SSCR1_EBCEI	(1 << 29)
-#define SSITR_INT	(7 << 5)
-#define SSSR_TNF	(1 << 2)
-#define SSSR_RNE	(1 << 3)
-#define SSSR_TFS	(1 << 5)
-#define SSSR_RFS	(1 << 6)
-#define SSSR_ROR	(1 << 7)
-#define SSSR_PINT	(1 << 18)
-#define SSSR_TINT	(1 << 19)
-#define SSSR_EOC	(1 << 20)
-#define SSSR_TUR	(1 << 21)
-#define SSSR_BCE	(1 << 23)
-#define SSSR_RW		0x00bc0080
+#define SSCR0_DSS(x)    (((((x) >> 16) & 0x10) | ((x) & 0xf)) + 1)
+#define SSCR1_RIE   (1 << 0)
+#define SSCR1_TIE   (1 << 1)
+#define SSCR1_LBM   (1 << 2)
+#define SSCR1_MWDS  (1 << 5)
+#define SSCR1_TFT(x)    ((((x) >> 6) & 0xf) + 1)
+#define SSCR1_RFT(x)    ((((x) >> 10) & 0xf) + 1)
+#define SSCR1_EFWR  (1 << 14)
+#define SSCR1_PINTE (1 << 18)
+#define SSCR1_TINTE (1 << 19)
+#define SSCR1_RSRE  (1 << 20)
+#define SSCR1_TSRE  (1 << 21)
+#define SSCR1_EBCEI (1 << 29)
+#define SSITR_INT   (7 << 5)
+#define SSSR_TNF    (1 << 2)
+#define SSSR_RNE    (1 << 3)
+#define SSSR_TFS    (1 << 5)
+#define SSSR_RFS    (1 << 6)
+#define SSSR_ROR    (1 << 7)
+#define SSSR_PINT   (1 << 18)
+#define SSSR_TINT   (1 << 19)
+#define SSSR_EOC    (1 << 20)
+#define SSSR_TUR    (1 << 21)
+#define SSSR_BCE    (1 << 23)
+#define SSSR_RW     0x00bc0080
 
 static void pxa2xx_ssp_int_update(PXA2xxSSPState *s)
 {
@@ -593,8 +593,8 @@ static void pxa2xx_ssp_int_update(PXA2xxSSPState *s)
 
 static void pxa2xx_ssp_fifo_update(PXA2xxSSPState *s)
 {
-    s->sssr &= ~(0xf << 12);	/* Clear RFL */
-    s->sssr &= ~(0xf << 8);	/* Clear TFL */
+    s->sssr &= ~(0xf << 12);    /* Clear RFL */
+    s->sssr &= ~(0xf << 8); /* Clear TFL */
     s->sssr &= ~SSSR_TFS;
     s->sssr &= ~SSSR_TNF;
     if (s->enable) {
@@ -794,21 +794,21 @@ static void pxa2xx_ssp_init(Object *obj)
 }
 
 /* Real-Time Clock */
-#define RCNR		0x00	/* RTC Counter register */
-#define RTAR		0x04	/* RTC Alarm register */
-#define RTSR		0x08	/* RTC Status register */
-#define RTTR		0x0c	/* RTC Timer Trim register */
-#define RDCR		0x10	/* RTC Day Counter register */
-#define RYCR		0x14	/* RTC Year Counter register */
-#define RDAR1		0x18	/* RTC Wristwatch Day Alarm register 1 */
-#define RYAR1		0x1c	/* RTC Wristwatch Year Alarm register 1 */
-#define RDAR2		0x20	/* RTC Wristwatch Day Alarm register 2 */
-#define RYAR2		0x24	/* RTC Wristwatch Year Alarm register 2 */
-#define SWCR		0x28	/* RTC Stopwatch Counter register */
-#define SWAR1		0x2c	/* RTC Stopwatch Alarm register 1 */
-#define SWAR2		0x30	/* RTC Stopwatch Alarm register 2 */
-#define RTCPICR		0x34	/* RTC Periodic Interrupt Counter register */
-#define PIAR		0x38	/* RTC Periodic Interrupt Alarm register */
+#define RCNR        0x00    /* RTC Counter register */
+#define RTAR        0x04    /* RTC Alarm register */
+#define RTSR        0x08    /* RTC Status register */
+#define RTTR        0x0c    /* RTC Timer Trim register */
+#define RDCR        0x10    /* RTC Day Counter register */
+#define RYCR        0x14    /* RTC Year Counter register */
+#define RDAR1       0x18    /* RTC Wristwatch Day Alarm register 1 */
+#define RYAR1       0x1c    /* RTC Wristwatch Year Alarm register 1 */
+#define RDAR2       0x20    /* RTC Wristwatch Day Alarm register 2 */
+#define RYAR2       0x24    /* RTC Wristwatch Year Alarm register 2 */
+#define SWCR        0x28    /* RTC Stopwatch Counter register */
+#define SWAR1       0x2c    /* RTC Stopwatch Alarm register 1 */
+#define SWAR2       0x30    /* RTC Stopwatch Alarm register 2 */
+#define RTCPICR     0x34    /* RTC Periodic Interrupt Counter register */
+#define PIAR        0x38    /* RTC Periodic Interrupt Alarm register */
 
 #define TYPE_PXA2XX_RTC "pxa2xx_rtc"
 OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxRTCState, PXA2XX_RTC)
@@ -1269,19 +1269,19 @@ struct PXA2xxI2CState {
     uint8_t data;
 };
 
-#define IBMR	0x80	/* I2C Bus Monitor register */
-#define IDBR	0x88	/* I2C Data Buffer register */
-#define ICR	0x90	/* I2C Control register */
-#define ISR	0x98	/* I2C Status register */
-#define ISAR	0xa0	/* I2C Slave Address register */
+#define IBMR    0x80    /* I2C Bus Monitor register */
+#define IDBR    0x88    /* I2C Data Buffer register */
+#define ICR 0x90    /* I2C Control register */
+#define ISR 0x98    /* I2C Status register */
+#define ISAR    0xa0    /* I2C Slave Address register */
 
 static void pxa2xx_i2c_update(PXA2xxI2CState *s)
 {
     uint16_t level = 0;
-    level |= s->status & s->control & (1 << 10);		/* BED */
-    level |= (s->status & (1 << 7)) && (s->control & (1 << 9));	/* IRF */
-    level |= (s->status & (1 << 6)) && (s->control & (1 << 8));	/* ITE */
-    level |= s->status & (1 << 9);				/* SAD */
+    level |= s->status & s->control & (1 << 10);        /* BED */
+    level |= (s->status & (1 << 7)) && (s->control & (1 << 9)); /* IRF */
+    level |= (s->status & (1 << 6)) && (s->control & (1 << 8)); /* ITE */
+    level |= s->status & (1 << 9);              /* SAD */
     qemu_set_irq(s->irq, !!level);
 }
 
@@ -1293,18 +1293,18 @@ static int pxa2xx_i2c_event(I2CSlave *i2c, enum i2c_event event)
 
     switch (event) {
     case I2C_START_SEND:
-        s->status |= (1 << 9);				/* set SAD */
-        s->status &= ~(1 << 0);				/* clear RWM */
+        s->status |= (1 << 9);              /* set SAD */
+        s->status &= ~(1 << 0);             /* clear RWM */
         break;
     case I2C_START_RECV:
-        s->status |= (1 << 9);				/* set SAD */
-        s->status |= 1 << 0;				/* set RWM */
+        s->status |= (1 << 9);              /* set SAD */
+        s->status |= 1 << 0;                /* set RWM */
         break;
     case I2C_FINISH:
-        s->status |= (1 << 4);				/* set SSD */
+        s->status |= (1 << 4);              /* set SSD */
         break;
     case I2C_NACK:
-        s->status |= 1 << 1;				/* set ACKNAK */
+        s->status |= 1 << 1;                /* set ACKNAK */
         break;
     default:
         return -1;
@@ -1323,8 +1323,8 @@ static uint8_t pxa2xx_i2c_rx(I2CSlave *i2c)
         return 0;
     }
 
-    if (s->status & (1 << 0)) {			/* RWM */
-        s->status |= 1 << 6;			/* set ITE */
+    if (s->status & (1 << 0)) {         /* RWM */
+        s->status |= 1 << 6;            /* set ITE */
     }
     pxa2xx_i2c_update(s);
 
@@ -1340,8 +1340,8 @@ static int pxa2xx_i2c_tx(I2CSlave *i2c, uint8_t data)
         return 1;
     }
 
-    if (!(s->status & (1 << 0))) {		/* RWM */
-        s->status |= 1 << 7;			/* set IRF */
+    if (!(s->status & (1 << 0))) {      /* RWM */
+        s->status |= 1 << 7;            /* set IRF */
         s->data = data;
     }
     pxa2xx_i2c_update(s);
@@ -1368,7 +1368,7 @@ static uint64_t pxa2xx_i2c_read(void *opaque, hwaddr addr,
         return s->data;
     case IBMR:
         if (s->status & (1 << 2))
-            s->ibmr ^= 3;	/* Fake SCL and SDA pin changes */
+            s->ibmr ^= 3;   /* Fake SCL and SDA pin changes */
         else
             s->ibmr = 0;
         return s->ibmr;
@@ -1392,44 +1392,44 @@ static void pxa2xx_i2c_write(void *opaque, hwaddr addr,
     switch (addr) {
     case ICR:
         s->control = value & 0xfff7;
-        if ((value & (1 << 3)) && (value & (1 << 6))) {	/* TB and IUE */
+        if ((value & (1 << 3)) && (value & (1 << 6))) { /* TB and IUE */
             /* TODO: slave mode */
-            if (value & (1 << 0)) {			/* START condition */
+            if (value & (1 << 0)) {         /* START condition */
                 if (s->data & 1)
-                    s->status |= 1 << 0;		/* set RWM */
+                    s->status |= 1 << 0;        /* set RWM */
                 else
-                    s->status &= ~(1 << 0);		/* clear RWM */
+                    s->status &= ~(1 << 0);     /* clear RWM */
                 ack = !i2c_start_transfer(s->bus, s->data >> 1, s->data & 1);
             } else {
-                if (s->status & (1 << 0)) {		/* RWM */
+                if (s->status & (1 << 0)) {     /* RWM */
                     s->data = i2c_recv(s->bus);
-                    if (value & (1 << 2))		/* ACKNAK */
+                    if (value & (1 << 2))       /* ACKNAK */
                         i2c_nack(s->bus);
                     ack = 1;
                 } else
                     ack = !i2c_send(s->bus, s->data);
             }
 
-            if (value & (1 << 1))			/* STOP condition */
+            if (value & (1 << 1))           /* STOP condition */
                 i2c_end_transfer(s->bus);
 
             if (ack) {
-                if (value & (1 << 0))			/* START condition */
-                    s->status |= 1 << 6;		/* set ITE */
+                if (value & (1 << 0))           /* START condition */
+                    s->status |= 1 << 6;        /* set ITE */
                 else
-                    if (s->status & (1 << 0))		/* RWM */
-                        s->status |= 1 << 7;		/* set IRF */
+                    if (s->status & (1 << 0))       /* RWM */
+                        s->status |= 1 << 7;        /* set IRF */
                     else
-                        s->status |= 1 << 6;		/* set ITE */
-                s->status &= ~(1 << 1);			/* clear ACKNAK */
+                        s->status |= 1 << 6;        /* set ITE */
+                s->status &= ~(1 << 1);         /* clear ACKNAK */
             } else {
-                s->status |= 1 << 6;			/* set ITE */
-                s->status |= 1 << 10;			/* set BED */
-                s->status |= 1 << 1;			/* set ACKNAK */
+                s->status |= 1 << 6;            /* set ITE */
+                s->status |= 1 << 10;           /* set BED */
+                s->status |= 1 << 1;            /* set ACKNAK */
             }
         }
-        if (!(value & (1 << 3)) && (value & (1 << 6)))	/* !TB and IUE */
-            if (value & (1 << 4))			/* MA */
+        if (!(value & (1 << 3)) && (value & (1 << 6)))  /* !TB and IUE */
+            if (value & (1 << 4))           /* MA */
                 i2c_end_transfer(s->bus);
         pxa2xx_i2c_update(s);
         break;
@@ -1584,10 +1584,10 @@ static void pxa2xx_i2s_reset(PXA2xxI2SState *i2s)
     i2s->mask = 0x00;
 }
 
-#define SACR_TFTH(val)	((val >> 8) & 0xf)
-#define SACR_RFTH(val)	((val >> 12) & 0xf)
-#define SACR_DREC(val)	(val & (1 << 3))
-#define SACR_DPRL(val)	(val & (1 << 4))
+#define SACR_TFTH(val)  ((val >> 8) & 0xf)
+#define SACR_RFTH(val)  ((val >> 12) & 0xf)
+#define SACR_DREC(val)  (val & (1 << 3))
+#define SACR_DPRL(val)  (val & (1 << 4))
 
 static inline void pxa2xx_i2s_update(PXA2xxI2SState *i2s)
 {
@@ -1602,29 +1602,29 @@ static inline void pxa2xx_i2s_update(PXA2xxI2SState *i2s)
 
     i2s->status &= 0xe0;
     if (i2s->fifo_len < 16 || !i2s->enable)
-        i2s->status |= 1 << 0;			/* TNF */
+        i2s->status |= 1 << 0;          /* TNF */
     if (i2s->rx_len)
-        i2s->status |= 1 << 1;			/* RNE */
+        i2s->status |= 1 << 1;          /* RNE */
     if (i2s->enable)
-        i2s->status |= 1 << 2;			/* BSY */
+        i2s->status |= 1 << 2;          /* BSY */
     if (tfs)
-        i2s->status |= 1 << 3;			/* TFS */
+        i2s->status |= 1 << 3;          /* TFS */
     if (rfs)
-        i2s->status |= 1 << 4;			/* RFS */
+        i2s->status |= 1 << 4;          /* RFS */
     if (!(i2s->tx_len && i2s->enable))
-        i2s->status |= i2s->fifo_len << 8;	/* TFL */
-    i2s->status |= MAX(i2s->rx_len, 0xf) << 12;	/* RFL */
+        i2s->status |= i2s->fifo_len << 8;  /* TFL */
+    i2s->status |= MAX(i2s->rx_len, 0xf) << 12; /* RFL */
 
     qemu_set_irq(i2s->irq, i2s->status & i2s->mask);
 }
 
-#define SACR0	0x00	/* Serial Audio Global Control register */
-#define SACR1	0x04	/* Serial Audio I2S/MSB-Justified Control register */
-#define SASR0	0x0c	/* Serial Audio Interface and FIFO Status register */
-#define SAIMR	0x14	/* Serial Audio Interrupt Mask register */
-#define SAICR	0x18	/* Serial Audio Interrupt Clear register */
-#define SADIV	0x60	/* Serial Audio Clock Divider register */
-#define SADR	0x80	/* Serial Audio Data register */
+#define SACR0   0x00    /* Serial Audio Global Control register */
+#define SACR1   0x04    /* Serial Audio I2S/MSB-Justified Control register */
+#define SASR0   0x0c    /* Serial Audio Interface and FIFO Status register */
+#define SAIMR   0x14    /* Serial Audio Interrupt Mask register */
+#define SAICR   0x18    /* Serial Audio Interrupt Clear register */
+#define SADIV   0x60    /* Serial Audio Clock Divider register */
+#define SADR    0x80    /* Serial Audio Data register */
 
 static uint64_t pxa2xx_i2s_read(void *opaque, hwaddr addr,
                                 unsigned size)
@@ -1668,24 +1668,24 @@ static void pxa2xx_i2s_write(void *opaque, hwaddr addr,
 
     switch (addr) {
     case SACR0:
-        if (value & (1 << 3))				/* RST */
+        if (value & (1 << 3))               /* RST */
             pxa2xx_i2s_reset(s);
         s->control[0] = value & 0xff3d;
-        if (!s->enable && (value & 1) && s->tx_len) {	/* ENB */
+        if (!s->enable && (value & 1) && s->tx_len) {   /* ENB */
             for (sample = s->fifo; s->fifo_len > 0; s->fifo_len --, sample ++)
                 s->codec_out(s->opaque, *sample);
-            s->status &= ~(1 << 7);			/* I2SOFF */
+            s->status &= ~(1 << 7);         /* I2SOFF */
         }
-        if (value & (1 << 4))				/* EFWR */
+        if (value & (1 << 4))               /* EFWR */
             printf("%s: Attempt to use special function\n", __func__);
-        s->enable = (value & 9) == 1;			/* ENB && !RST*/
+        s->enable = (value & 9) == 1;           /* ENB && !RST*/
         pxa2xx_i2s_update(s);
         break;
     case SACR1:
         s->control[1] = value & 0x0039;
-        if (value & (1 << 5))				/* ENLBF */
+        if (value & (1 << 5))               /* ENLBF */
             printf("%s: Attempt to use loopback function\n", __func__);
-        if (value & (1 << 4))				/* DPRL */
+        if (value & (1 << 4))               /* DPRL */
             s->fifo_len = 0;
         pxa2xx_i2s_update(s);
         break;
@@ -1747,9 +1747,9 @@ static void pxa2xx_i2s_data_req(void *opaque, int tx, int rx)
 
     /* Signal FIFO errors */
     if (s->enable && s->tx_len)
-        s->status |= 1 << 5;		/* TUR */
+        s->status |= 1 << 5;        /* TUR */
     if (s->enable && s->rx_len)
-        s->status |= 1 << 6;		/* ROR */
+        s->status |= 1 << 6;        /* ROR */
 
     /* Should be tx - MIN(tx, s->fifo_len) but we don't really need to
      * handle the cases where it makes a difference.  */
@@ -1821,33 +1821,33 @@ static inline void pxa2xx_fir_update(PXA2xxFIrState *s)
 {
     static const int tresh[4] = { 8, 16, 32, 0 };
     int intr = 0;
-    if ((s->control[0] & (1 << 4)) &&			/* RXE */
-                    s->rx_len >= tresh[s->control[2] & 3])	/* TRIG */
-        s->status[0] |= 1 << 4;				/* RFS */
+    if ((s->control[0] & (1 << 4)) &&           /* RXE */
+                    s->rx_len >= tresh[s->control[2] & 3])  /* TRIG */
+        s->status[0] |= 1 << 4;             /* RFS */
     else
-        s->status[0] &= ~(1 << 4);			/* RFS */
-    if (s->control[0] & (1 << 3))			/* TXE */
-        s->status[0] |= 1 << 3;				/* TFS */
+        s->status[0] &= ~(1 << 4);          /* RFS */
+    if (s->control[0] & (1 << 3))           /* TXE */
+        s->status[0] |= 1 << 3;             /* TFS */
     else
-        s->status[0] &= ~(1 << 3);			/* TFS */
+        s->status[0] &= ~(1 << 3);          /* TFS */
     if (s->rx_len)
-        s->status[1] |= 1 << 2;				/* RNE */
+        s->status[1] |= 1 << 2;             /* RNE */
     else
-        s->status[1] &= ~(1 << 2);			/* RNE */
-    if (s->control[0] & (1 << 4))			/* RXE */
-        s->status[1] |= 1 << 0;				/* RSY */
+        s->status[1] &= ~(1 << 2);          /* RNE */
+    if (s->control[0] & (1 << 4))           /* RXE */
+        s->status[1] |= 1 << 0;             /* RSY */
     else
-        s->status[1] &= ~(1 << 0);			/* RSY */
-
-    intr |= (s->control[0] & (1 << 5)) &&		/* RIE */
-            (s->status[0] & (1 << 4));			/* RFS */
-    intr |= (s->control[0] & (1 << 6)) &&		/* TIE */
-            (s->status[0] & (1 << 3));			/* TFS */
-    intr |= (s->control[2] & (1 << 4)) &&		/* TRAIL */
-            (s->status[0] & (1 << 6));			/* EOC */
-    intr |= (s->control[0] & (1 << 2)) &&		/* TUS */
-            (s->status[0] & (1 << 1));			/* TUR */
-    intr |= s->status[0] & 0x25;			/* FRE, RAB, EIF */
+        s->status[1] &= ~(1 << 0);          /* RSY */
+
+    intr |= (s->control[0] & (1 << 5)) &&       /* RIE */
+            (s->status[0] & (1 << 4));          /* RFS */
+    intr |= (s->control[0] & (1 << 6)) &&       /* TIE */
+            (s->status[0] & (1 << 3));          /* TFS */
+    intr |= (s->control[2] & (1 << 4)) &&       /* TRAIL */
+            (s->status[0] & (1 << 6));          /* EOC */
+    intr |= (s->control[0] & (1 << 2)) &&       /* TUS */
+            (s->status[0] & (1 << 1));          /* TUR */
+    intr |= s->status[0] & 0x25;            /* FRE, RAB, EIF */
 
     qemu_set_irq(s->rx_dma, (s->status[0] >> 4) & 1);
     qemu_set_irq(s->tx_dma, (s->status[0] >> 3) & 1);
@@ -1855,13 +1855,13 @@ static inline void pxa2xx_fir_update(PXA2xxFIrState *s)
     qemu_set_irq(s->irq, intr && s->enable);
 }
 
-#define ICCR0	0x00	/* FICP Control register 0 */
-#define ICCR1	0x04	/* FICP Control register 1 */
-#define ICCR2	0x08	/* FICP Control register 2 */
-#define ICDR	0x0c	/* FICP Data register */
-#define ICSR0	0x14	/* FICP Status register 0 */
-#define ICSR1	0x18	/* FICP Status register 1 */
-#define ICFOR	0x1c	/* FICP FIFO Occupancy Status register */
+#define ICCR0   0x00    /* FICP Control register 0 */
+#define ICCR1   0x04    /* FICP Control register 1 */
+#define ICCR2   0x08    /* FICP Control register 2 */
+#define ICDR    0x0c    /* FICP Data register */
+#define ICSR0   0x14    /* FICP Status register 0 */
+#define ICSR1   0x18    /* FICP Status register 1 */
+#define ICFOR   0x1c    /* FICP FIFO Occupancy Status register */
 
 static uint64_t pxa2xx_fir_read(void *opaque, hwaddr addr,
                                 unsigned size)
@@ -1891,7 +1891,7 @@ static uint64_t pxa2xx_fir_read(void *opaque, hwaddr addr,
     case ICSR0:
         return s->status[0];
     case ICSR1:
-        return s->status[1] | (1 << 3);			/* TNF */
+        return s->status[1] | (1 << 3);         /* TNF */
     case ICFOR:
         return s->rx_len;
     default:
@@ -1913,12 +1913,12 @@ static void pxa2xx_fir_write(void *opaque, hwaddr addr,
     switch (addr) {
     case ICCR0:
         s->control[0] = value;
-        if (!(value & (1 << 4)))			/* RXE */
+        if (!(value & (1 << 4)))            /* RXE */
             s->rx_len = s->rx_start = 0;
         if (!(value & (1 << 3))) {                      /* TXE */
             /* Nop */
         }
-        s->enable = value & 1;				/* ITR */
+        s->enable = value & 1;              /* ITR */
         if (!s->enable)
             s->status[0] = 0;
         pxa2xx_fir_update(s);
@@ -1970,17 +1970,17 @@ static int pxa2xx_fir_is_empty(void *opaque)
 static void pxa2xx_fir_rx(void *opaque, const uint8_t *buf, int size)
 {
     PXA2xxFIrState *s = (PXA2xxFIrState *) opaque;
-    if (!(s->control[0] & (1 << 4)))			/* RXE */
+    if (!(s->control[0] & (1 << 4)))            /* RXE */
         return;
 
     while (size --) {
-        s->status[1] |= 1 << 4;				/* EOF */
+        s->status[1] |= 1 << 4;             /* EOF */
         if (s->rx_len >= 64) {
-            s->status[1] |= 1 << 6;			/* ROR */
+            s->status[1] |= 1 << 6;         /* ROR */
             break;
         }
 
-        if (s->control[2] & (1 << 3))			/* RXP */
+        if (s->control[2] & (1 << 3))           /* RXP */
             s->rx_fifo[(s->rx_start + s->rx_len ++) & 63] = *(buf ++);
         else
             s->rx_fifo[(s->rx_start + s->rx_len ++) & 63] = ~*(buf ++);
@@ -2085,7 +2085,7 @@ static void pxa2xx_reset(void *opaque, int line, int level)
 {
     PXA2xxState *s = (PXA2xxState *) opaque;
 
-    if (level && (s->pm_regs[PCFR >> 2] & 0x10)) {	/* GPR_EN */
+    if (level && (s->pm_regs[PCFR >> 2] & 0x10)) {  /* GPR_EN */
         cpu_reset(CPU(s->cpu));
         /* TODO: reset peripherals */
     }
@@ -2172,8 +2172,8 @@ PXA2xxState *pxa270_init(unsigned int sdram_size, const char *cpu_type)
                     qdev_get_gpio_in(s->pic, PXA2XX_PIC_LCD));
 
     s->cm_base = 0x41300000;
-    s->cm_regs[CCCR >> 2] = 0x02000210;	/* 416.0 MHz */
-    s->clkcfg = 0x00000009;		/* Turbo mode active */
+    s->cm_regs[CCCR >> 2] = 0x02000210; /* 416.0 MHz */
+    s->clkcfg = 0x00000009;     /* Turbo mode active */
     memory_region_init_io(&s->cm_iomem, NULL, &pxa2xx_cm_ops, s, "pxa2xx-cm", 0x1000);
     memory_region_add_subregion(address_space, s->cm_base, &s->cm_iomem);
     vmstate_register(NULL, 0, &vmstate_pxa2xx_cm, s);
@@ -2183,7 +2183,7 @@ PXA2xxState *pxa270_init(unsigned int sdram_size, const char *cpu_type)
     s->mm_base = 0x48000000;
     s->mm_regs[MDMRS >> 2] = 0x00020002;
     s->mm_regs[MDREFR >> 2] = 0x03ca4000;
-    s->mm_regs[MECR >> 2] = 0x00000001;	/* Two PC Card sockets */
+    s->mm_regs[MECR >> 2] = 0x00000001; /* Two PC Card sockets */
     memory_region_init_io(&s->mm_iomem, NULL, &pxa2xx_mm_ops, s, "pxa2xx-mm", 0x1000);
     memory_region_add_subregion(address_space, s->mm_base, &s->mm_iomem);
     vmstate_register(NULL, 0, &vmstate_pxa2xx_mm, s);
@@ -2309,7 +2309,7 @@ PXA2xxState *pxa255_init(unsigned int sdram_size)
     s->cm_regs[CCCR >> 2] = 0x00000121;         /* from datasheet */
     s->cm_regs[CKEN >> 2] = 0x00017def;         /* from datasheet */
 
-    s->clkcfg = 0x00000009;		/* Turbo mode active */
+    s->clkcfg = 0x00000009;     /* Turbo mode active */
     memory_region_init_io(&s->cm_iomem, NULL, &pxa2xx_cm_ops, s, "pxa2xx-cm", 0x1000);
     memory_region_add_subregion(address_space, s->cm_base, &s->cm_iomem);
     vmstate_register(NULL, 0, &vmstate_pxa2xx_cm, s);
@@ -2319,7 +2319,7 @@ PXA2xxState *pxa255_init(unsigned int sdram_size)
     s->mm_base = 0x48000000;
     s->mm_regs[MDMRS >> 2] = 0x00020002;
     s->mm_regs[MDREFR >> 2] = 0x03ca4000;
-    s->mm_regs[MECR >> 2] = 0x00000001;	/* Two PC Card sockets */
+    s->mm_regs[MECR >> 2] = 0x00000001; /* Two PC Card sockets */
     memory_region_init_io(&s->mm_iomem, NULL, &pxa2xx_mm_ops, s, "pxa2xx-mm", 0x1000);
     memory_region_add_subregion(address_space, s->mm_base, &s->mm_iomem);
     vmstate_register(NULL, 0, &vmstate_pxa2xx_mm, s);
diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
index e7c3d99224..f7b59d8472 100644
--- a/hw/arm/pxa2xx_gpio.c
+++ b/hw/arm/pxa2xx_gpio.c
@@ -19,7 +19,7 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 
-#define PXA2XX_GPIO_BANKS	4
+#define PXA2XX_GPIO_BANKS   4
 
 #define TYPE_PXA2XX_GPIO "pxa2xx-gpio"
 OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxGPIOInfo, PXA2XX_GPIO)
@@ -65,7 +65,7 @@ static struct {
     int bank;
 } pxa2xx_gpio_regs[0x200] = {
     [0 ... 0x1ff] = { GPIO_NONE, 0 },
-#define PXA2XX_REG(reg, a0, a1, a2, a3)	\
+#define PXA2XX_REG(reg, a0, a1, a2, a3) \
     [a0] = { reg, 0 }, [a1] = { reg, 1 }, [a2] = { reg, 2 }, [a3] = { reg, 3 },
 
     PXA2XX_REG(GPLR, 0x000, 0x004, 0x008, 0x100)
@@ -163,38 +163,38 @@ static uint64_t pxa2xx_gpio_read(void *opaque, hwaddr offset,
 
     bank = pxa2xx_gpio_regs[offset].bank;
     switch (pxa2xx_gpio_regs[offset].reg) {
-    case GPDR:		/* GPIO Pin-Direction registers */
+    case GPDR:      /* GPIO Pin-Direction registers */
         return s->dir[bank];
 
-    case GPSR:		/* GPIO Pin-Output Set registers */
+    case GPSR:      /* GPIO Pin-Output Set registers */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "pxa2xx GPIO: read from write only register GPSR\n");
         return 0;
 
-    case GPCR:		/* GPIO Pin-Output Clear registers */
+    case GPCR:      /* GPIO Pin-Output Clear registers */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "pxa2xx GPIO: read from write only register GPCR\n");
         return 0;
 
-    case GRER:		/* GPIO Rising-Edge Detect Enable registers */
+    case GRER:      /* GPIO Rising-Edge Detect Enable registers */
         return s->rising[bank];
 
-    case GFER:		/* GPIO Falling-Edge Detect Enable registers */
+    case GFER:      /* GPIO Falling-Edge Detect Enable registers */
         return s->falling[bank];
 
-    case GAFR_L:	/* GPIO Alternate Function registers */
+    case GAFR_L:    /* GPIO Alternate Function registers */
         return s->gafr[bank * 2];
 
-    case GAFR_U:	/* GPIO Alternate Function registers */
+    case GAFR_U:    /* GPIO Alternate Function registers */
         return s->gafr[bank * 2 + 1];
 
-    case GPLR:		/* GPIO Pin-Level registers */
+    case GPLR:      /* GPIO Pin-Level registers */
         ret = (s->olevel[bank] & s->dir[bank]) |
                 (s->ilevel[bank] & ~s->dir[bank]);
         qemu_irq_raise(s->read_notify);
         return ret;
 
-    case GEDR:		/* GPIO Edge Detect Status registers */
+    case GEDR:      /* GPIO Edge Detect Status registers */
         return s->status[bank];
 
     default:
@@ -215,38 +215,38 @@ static void pxa2xx_gpio_write(void *opaque, hwaddr offset,
 
     bank = pxa2xx_gpio_regs[offset].bank;
     switch (pxa2xx_gpio_regs[offset].reg) {
-    case GPDR:		/* GPIO Pin-Direction registers */
+    case GPDR:      /* GPIO Pin-Direction registers */
         s->dir[bank] = value;
         pxa2xx_gpio_handler_update(s);
         break;
 
-    case GPSR:		/* GPIO Pin-Output Set registers */
+    case GPSR:      /* GPIO Pin-Output Set registers */
         s->olevel[bank] |= value;
         pxa2xx_gpio_handler_update(s);
         break;
 
-    case GPCR:		/* GPIO Pin-Output Clear registers */
+    case GPCR:      /* GPIO Pin-Output Clear registers */
         s->olevel[bank] &= ~value;
         pxa2xx_gpio_handler_update(s);
         break;
 
-    case GRER:		/* GPIO Rising-Edge Detect Enable registers */
+    case GRER:      /* GPIO Rising-Edge Detect Enable registers */
         s->rising[bank] = value;
         break;
 
-    case GFER:		/* GPIO Falling-Edge Detect Enable registers */
+    case GFER:      /* GPIO Falling-Edge Detect Enable registers */
         s->falling[bank] = value;
         break;
 
-    case GAFR_L:	/* GPIO Alternate Function registers */
+    case GAFR_L:    /* GPIO Alternate Function registers */
         s->gafr[bank * 2] = value;
         break;
 
-    case GAFR_U:	/* GPIO Alternate Function registers */
+    case GAFR_U:    /* GPIO Alternate Function registers */
         s->gafr[bank * 2 + 1] = value;
         break;
 
-    case GEDR:		/* GPIO Edge Detect Status registers */
+    case GEDR:      /* GPIO Edge Detect Status registers */
         s->status[bank] &= ~value;
         pxa2xx_gpio_irq_update(s);
         break;
diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index 47132ab982..f461d5bee3 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -19,24 +19,24 @@
 #include "qom/object.h"
 #include "target/arm/cpregs.h"
 
-#define ICIP	0x00	/* Interrupt Controller IRQ Pending register */
-#define ICMR	0x04	/* Interrupt Controller Mask register */
-#define ICLR	0x08	/* Interrupt Controller Level register */
-#define ICFP	0x0c	/* Interrupt Controller FIQ Pending register */
-#define ICPR	0x10	/* Interrupt Controller Pending register */
-#define ICCR	0x14	/* Interrupt Controller Control register */
-#define ICHP	0x18	/* Interrupt Controller Highest Priority register */
-#define IPR0	0x1c	/* Interrupt Controller Priority register 0 */
-#define IPR31	0x98	/* Interrupt Controller Priority register 31 */
-#define ICIP2	0x9c	/* Interrupt Controller IRQ Pending register 2 */
-#define ICMR2	0xa0	/* Interrupt Controller Mask register 2 */
-#define ICLR2	0xa4	/* Interrupt Controller Level register 2 */
-#define ICFP2	0xa8	/* Interrupt Controller FIQ Pending register 2 */
-#define ICPR2	0xac	/* Interrupt Controller Pending register 2 */
-#define IPR32	0xb0	/* Interrupt Controller Priority register 32 */
-#define IPR39	0xcc	/* Interrupt Controller Priority register 39 */
-
-#define PXA2XX_PIC_SRCS	40
+#define ICIP    0x00    /* Interrupt Controller IRQ Pending register */
+#define ICMR    0x04    /* Interrupt Controller Mask register */
+#define ICLR    0x08    /* Interrupt Controller Level register */
+#define ICFP    0x0c    /* Interrupt Controller FIQ Pending register */
+#define ICPR    0x10    /* Interrupt Controller Pending register */
+#define ICCR    0x14    /* Interrupt Controller Control register */
+#define ICHP    0x18    /* Interrupt Controller Highest Priority register */
+#define IPR0    0x1c    /* Interrupt Controller Priority register 0 */
+#define IPR31   0x98    /* Interrupt Controller Priority register 31 */
+#define ICIP2   0x9c    /* Interrupt Controller IRQ Pending register 2 */
+#define ICMR2   0xa0    /* Interrupt Controller Mask register 2 */
+#define ICLR2   0xa4    /* Interrupt Controller Level register 2 */
+#define ICFP2   0xa8    /* Interrupt Controller FIQ Pending register 2 */
+#define ICPR2   0xac    /* Interrupt Controller Pending register 2 */
+#define IPR32   0xb0    /* Interrupt Controller Priority register 32 */
+#define IPR39   0xcc    /* Interrupt Controller Priority register 39 */
+
+#define PXA2XX_PIC_SRCS 40
 
 #define TYPE_PXA2XX_PIC "pxa2xx_pic"
 OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxPICState, PXA2XX_PIC)
@@ -104,7 +104,7 @@ static void pxa2xx_pic_set_irq(void *opaque, int irq, int level)
 static inline uint32_t pxa2xx_pic_highest(PXA2xxPICState *s) {
     int i, int_set, irq;
     uint32_t bit, mask[2];
-    uint32_t ichp = 0x003f003f;	/* Both IDs invalid */
+    uint32_t ichp = 0x003f003f; /* Both IDs invalid */
 
     mask[0] = s->int_pending[0] & s->int_enabled[0];
     mask[1] = s->int_pending[1] & s->int_enabled[1];
@@ -139,33 +139,33 @@ static uint64_t pxa2xx_pic_mem_read(void *opaque, hwaddr offset,
     PXA2xxPICState *s = (PXA2xxPICState *) opaque;
 
     switch (offset) {
-    case ICIP:	/* IRQ Pending register */
+    case ICIP:  /* IRQ Pending register */
         return s->int_pending[0] & ~s->is_fiq[0] & s->int_enabled[0];
-    case ICIP2:	/* IRQ Pending register 2 */
+    case ICIP2: /* IRQ Pending register 2 */
         return s->int_pending[1] & ~s->is_fiq[1] & s->int_enabled[1];
-    case ICMR:	/* Mask register */
+    case ICMR:  /* Mask register */
         return s->int_enabled[0];
-    case ICMR2:	/* Mask register 2 */
+    case ICMR2: /* Mask register 2 */
         return s->int_enabled[1];
-    case ICLR:	/* Level register */
+    case ICLR:  /* Level register */
         return s->is_fiq[0];
-    case ICLR2:	/* Level register 2 */
+    case ICLR2: /* Level register 2 */
         return s->is_fiq[1];
-    case ICCR:	/* Idle mask */
+    case ICCR:  /* Idle mask */
         return (s->int_idle == 0);
-    case ICFP:	/* FIQ Pending register */
+    case ICFP:  /* FIQ Pending register */
         return s->int_pending[0] & s->is_fiq[0] & s->int_enabled[0];
-    case ICFP2:	/* FIQ Pending register 2 */
+    case ICFP2: /* FIQ Pending register 2 */
         return s->int_pending[1] & s->is_fiq[1] & s->int_enabled[1];
-    case ICPR:	/* Pending register */
+    case ICPR:  /* Pending register */
         return s->int_pending[0];
-    case ICPR2:	/* Pending register 2 */
+    case ICPR2: /* Pending register 2 */
         return s->int_pending[1];
     case IPR0  ... IPR31:
         return s->priority[0  + ((offset - IPR0 ) >> 2)];
     case IPR32 ... IPR39:
         return s->priority[32 + ((offset - IPR32) >> 2)];
-    case ICHP:	/* Highest Priority register */
+    case ICHP:  /* Highest Priority register */
         return pxa2xx_pic_highest(s);
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -181,19 +181,19 @@ static void pxa2xx_pic_mem_write(void *opaque, hwaddr offset,
     PXA2xxPICState *s = (PXA2xxPICState *) opaque;
 
     switch (offset) {
-    case ICMR:	/* Mask register */
+    case ICMR:  /* Mask register */
         s->int_enabled[0] = value;
         break;
-    case ICMR2:	/* Mask register 2 */
+    case ICMR2: /* Mask register 2 */
         s->int_enabled[1] = value;
         break;
-    case ICLR:	/* Level register */
+    case ICLR:  /* Level register */
         s->is_fiq[0] = value;
         break;
-    case ICLR2:	/* Level register 2 */
+    case ICLR2: /* Level register 2 */
         s->is_fiq[1] = value;
         break;
-    case ICCR:	/* Idle mask */
+    case ICCR:  /* Idle mask */
         s->int_idle = (value & 1) ? 0 : ~0;
         break;
     case IPR0  ... IPR31:
diff --git a/hw/char/omap_uart.c b/hw/char/omap_uart.c
index 1c890b9201..8726190f1e 100644
--- a/hw/char/omap_uart.c
+++ b/hw/char/omap_uart.c
@@ -76,27 +76,27 @@ static uint64_t omap_uart_read(void *opaque, hwaddr addr, unsigned size)
     }
 
     switch (addr) {
-    case 0x20:	/* MDR1 */
+    case 0x20:  /* MDR1 */
         return s->mdr[0];
-    case 0x24:	/* MDR2 */
+    case 0x24:  /* MDR2 */
         return s->mdr[1];
-    case 0x40:	/* SCR */
+    case 0x40:  /* SCR */
         return s->scr;
-    case 0x44:	/* SSR */
+    case 0x44:  /* SSR */
         return 0x0;
-    case 0x48:	/* EBLR (OMAP2) */
+    case 0x48:  /* EBLR (OMAP2) */
         return s->eblr;
-    case 0x4C:	/* OSC_12M_SEL (OMAP1) */
+    case 0x4C:  /* OSC_12M_SEL (OMAP1) */
         return s->clksel;
-    case 0x50:	/* MVR */
+    case 0x50:  /* MVR */
         return 0x30;
-    case 0x54:	/* SYSC (OMAP2) */
+    case 0x54:  /* SYSC (OMAP2) */
         return s->syscontrol;
-    case 0x58:	/* SYSS (OMAP2) */
+    case 0x58:  /* SYSS (OMAP2) */
         return 1;
-    case 0x5c:	/* WER (OMAP2) */
+    case 0x5c:  /* WER (OMAP2) */
         return s->wkup;
-    case 0x60:	/* CFPS (OMAP2) */
+    case 0x60:  /* CFPS (OMAP2) */
         return s->cfps;
     }
 
@@ -115,35 +115,35 @@ static void omap_uart_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x20:	/* MDR1 */
+    case 0x20:  /* MDR1 */
         s->mdr[0] = value & 0x7f;
         break;
-    case 0x24:	/* MDR2 */
+    case 0x24:  /* MDR2 */
         s->mdr[1] = value & 0xff;
         break;
-    case 0x40:	/* SCR */
+    case 0x40:  /* SCR */
         s->scr = value & 0xff;
         break;
-    case 0x48:	/* EBLR (OMAP2) */
+    case 0x48:  /* EBLR (OMAP2) */
         s->eblr = value & 0xff;
         break;
-    case 0x4C:	/* OSC_12M_SEL (OMAP1) */
+    case 0x4C:  /* OSC_12M_SEL (OMAP1) */
         s->clksel = value & 1;
         break;
-    case 0x44:	/* SSR */
-    case 0x50:	/* MVR */
-    case 0x58:	/* SYSS (OMAP2) */
+    case 0x44:  /* SSR */
+    case 0x50:  /* MVR */
+    case 0x58:  /* SYSS (OMAP2) */
         OMAP_RO_REG(addr);
         break;
-    case 0x54:	/* SYSC (OMAP2) */
+    case 0x54:  /* SYSC (OMAP2) */
         s->syscontrol = value & 0x1d;
         if (value & 2)
             omap_uart_reset(s);
         break;
-    case 0x5c:	/* WER (OMAP2) */
+    case 0x5c:  /* WER (OMAP2) */
         s->wkup = value & 0x7f;
         break;
-    case 0x60:	/* CFPS (OMAP2) */
+    case 0x60:  /* CFPS (OMAP2) */
         s->cfps = value & 0xff;
         break;
     default:
diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index c6e35ba4b8..443b699f2d 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -131,9 +131,9 @@ struct omap_dma_s {
 #define LAST_FRAME_INTR (1 << 4)
 #define END_BLOCK_INTR  (1 << 5)
 #define SYNC            (1 << 6)
-#define END_PKT_INTR	(1 << 7)
-#define TRANS_ERR_INTR	(1 << 8)
-#define MISALIGN_INTR	(1 << 11)
+#define END_PKT_INTR    (1 << 7)
+#define TRANS_ERR_INTR  (1 << 8)
+#define MISALIGN_INTR   (1 << 11)
 
 static inline void omap_dma_interrupts_update(struct omap_dma_s *s)
 {
@@ -526,12 +526,12 @@ static void omap_dma_transfer_setup(struct soc_dma_ch_s *dma)
 
     /* Check all the conditions that terminate the transfer starting
      * with those that can occur the soonest.  */
-#define INTR_CHECK(cond, id, nelements)	\
-    if (cond) {			\
-        elements[id] = nelements;	\
-        if (elements[id] < min_elems)	\
-            min_elems = elements[id];	\
-    } else				\
+#define INTR_CHECK(cond, id, nelements) \
+    if (cond) {         \
+        elements[id] = nelements;   \
+        if (elements[id] < min_elems)   \
+            min_elems = elements[id];   \
+    } else              \
         elements[id] = INT_MAX;
 
     /* Elements */
@@ -747,7 +747,7 @@ static int omap_dma_ch_reg_read(struct omap_dma_s *s,
                 struct omap_dma_channel_s *ch, int reg, uint16_t *value)
 {
     switch (reg) {
-    case 0x00:	/* SYS_DMA_CSDP_CH0 */
+    case 0x00:  /* SYS_DMA_CSDP_CH0 */
         *value = (ch->burst[1] << 14) |
                 (ch->pack[1] << 13) |
                 (ch->port[1] << 9) |
@@ -757,9 +757,9 @@ static int omap_dma_ch_reg_read(struct omap_dma_s *s,
                 (ch->data_type >> 1);
         break;
 
-    case 0x02:	/* SYS_DMA_CCR_CH0 */
+    case 0x02:  /* SYS_DMA_CCR_CH0 */
         if (s->model <= omap_dma_3_1)
-            *value = 0 << 10;			/* FIFO_FLUSH reads as 0 */
+            *value = 0 << 10;           /* FIFO_FLUSH reads as 0 */
         else
             *value = ch->omap_3_1_compatible_disable << 10;
         *value |= (ch->mode[1] << 14) |
@@ -772,11 +772,11 @@ static int omap_dma_ch_reg_read(struct omap_dma_s *s,
                 (ch->fs << 5) | ch->sync;
         break;
 
-    case 0x04:	/* SYS_DMA_CICR_CH0 */
+    case 0x04:  /* SYS_DMA_CICR_CH0 */
         *value = ch->interrupts;
         break;
 
-    case 0x06:	/* SYS_DMA_CSR_CH0 */
+    case 0x06:  /* SYS_DMA_CSR_CH0 */
         *value = ch->status;
         ch->status &= SYNC;
         if (!ch->omap_3_1_compatible_disable && ch->sibling) {
@@ -786,77 +786,77 @@ static int omap_dma_ch_reg_read(struct omap_dma_s *s,
         qemu_irq_lower(ch->irq);
         break;
 
-    case 0x08:	/* SYS_DMA_CSSA_L_CH0 */
+    case 0x08:  /* SYS_DMA_CSSA_L_CH0 */
         *value = ch->addr[0] & 0x0000ffff;
         break;
 
-    case 0x0a:	/* SYS_DMA_CSSA_U_CH0 */
+    case 0x0a:  /* SYS_DMA_CSSA_U_CH0 */
         *value = ch->addr[0] >> 16;
         break;
 
-    case 0x0c:	/* SYS_DMA_CDSA_L_CH0 */
+    case 0x0c:  /* SYS_DMA_CDSA_L_CH0 */
         *value = ch->addr[1] & 0x0000ffff;
         break;
 
-    case 0x0e:	/* SYS_DMA_CDSA_U_CH0 */
+    case 0x0e:  /* SYS_DMA_CDSA_U_CH0 */
         *value = ch->addr[1] >> 16;
         break;
 
-    case 0x10:	/* SYS_DMA_CEN_CH0 */
+    case 0x10:  /* SYS_DMA_CEN_CH0 */
         *value = ch->elements;
         break;
 
-    case 0x12:	/* SYS_DMA_CFN_CH0 */
+    case 0x12:  /* SYS_DMA_CFN_CH0 */
         *value = ch->frames;
         break;
 
-    case 0x14:	/* SYS_DMA_CFI_CH0 */
+    case 0x14:  /* SYS_DMA_CFI_CH0 */
         *value = ch->frame_index[0];
         break;
 
-    case 0x16:	/* SYS_DMA_CEI_CH0 */
+    case 0x16:  /* SYS_DMA_CEI_CH0 */
         *value = ch->element_index[0];
         break;
 
-    case 0x18:	/* SYS_DMA_CPC_CH0 or DMA_CSAC */
+    case 0x18:  /* SYS_DMA_CPC_CH0 or DMA_CSAC */
         if (ch->omap_3_1_compatible_disable)
-            *value = ch->active_set.src & 0xffff;	/* CSAC */
+            *value = ch->active_set.src & 0xffff;   /* CSAC */
         else
             *value = ch->cpc;
         break;
 
-    case 0x1a:	/* DMA_CDAC */
-        *value = ch->active_set.dest & 0xffff;	/* CDAC */
+    case 0x1a:  /* DMA_CDAC */
+        *value = ch->active_set.dest & 0xffff;  /* CDAC */
         break;
 
-    case 0x1c:	/* DMA_CDEI */
+    case 0x1c:  /* DMA_CDEI */
         *value = ch->element_index[1];
         break;
 
-    case 0x1e:	/* DMA_CDFI */
+    case 0x1e:  /* DMA_CDFI */
         *value = ch->frame_index[1];
         break;
 
-    case 0x20:	/* DMA_COLOR_L */
+    case 0x20:  /* DMA_COLOR_L */
         *value = ch->color & 0xffff;
         break;
 
-    case 0x22:	/* DMA_COLOR_U */
+    case 0x22:  /* DMA_COLOR_U */
         *value = ch->color >> 16;
         break;
 
-    case 0x24:	/* DMA_CCR2 */
+    case 0x24:  /* DMA_CCR2 */
         *value = (ch->bs << 2) |
                 (ch->transparent_copy << 1) |
                 ch->constant_fill;
         break;
 
-    case 0x28:	/* DMA_CLNK_CTRL */
+    case 0x28:  /* DMA_CLNK_CTRL */
         *value = (ch->link_enabled << 15) |
                 (ch->link_next_ch & 0xf);
         break;
 
-    case 0x2a:	/* DMA_LCH_CTRL */
+    case 0x2a:  /* DMA_LCH_CTRL */
         *value = (ch->interleave_disabled << 15) |
                 ch->type;
         break;
@@ -871,7 +871,7 @@ static int omap_dma_ch_reg_write(struct omap_dma_s *s,
                 struct omap_dma_channel_s *ch, int reg, uint16_t value)
 {
     switch (reg) {
-    case 0x00:	/* SYS_DMA_CSDP_CH0 */
+    case 0x00:  /* SYS_DMA_CSDP_CH0 */
         ch->burst[1] = (value & 0xc000) >> 14;
         ch->pack[1] = (value & 0x2000) >> 13;
         ch->port[1] = (enum omap_dma_port) ((value & 0x1e00) >> 9);
@@ -894,7 +894,7 @@ static int omap_dma_ch_reg_write(struct omap_dma_s *s,
         }
         break;
 
-    case 0x02:	/* SYS_DMA_CCR_CH0 */
+    case 0x02:  /* SYS_DMA_CCR_CH0 */
         ch->mode[1] = (omap_dma_addressing_t) ((value & 0xc000) >> 14);
         ch->mode[0] = (omap_dma_addressing_t) ((value & 0x3000) >> 12);
         ch->end_prog = (value & 0x0800) >> 11;
@@ -916,88 +916,88 @@ static int omap_dma_ch_reg_write(struct omap_dma_s *s,
 
         break;
 
-    case 0x04:	/* SYS_DMA_CICR_CH0 */
+    case 0x04:  /* SYS_DMA_CICR_CH0 */
         ch->interrupts = value & 0x3f;
         break;
 
-    case 0x06:	/* SYS_DMA_CSR_CH0 */
+    case 0x06:  /* SYS_DMA_CSR_CH0 */
         OMAP_RO_REG((hwaddr) reg);
         break;
 
-    case 0x08:	/* SYS_DMA_CSSA_L_CH0 */
+    case 0x08:  /* SYS_DMA_CSSA_L_CH0 */
         ch->addr[0] &= 0xffff0000;
         ch->addr[0] |= value;
         break;
 
-    case 0x0a:	/* SYS_DMA_CSSA_U_CH0 */
+    case 0x0a:  /* SYS_DMA_CSSA_U_CH0 */
         ch->addr[0] &= 0x0000ffff;
         ch->addr[0] |= (uint32_t) value << 16;
         break;
 
-    case 0x0c:	/* SYS_DMA_CDSA_L_CH0 */
+    case 0x0c:  /* SYS_DMA_CDSA_L_CH0 */
         ch->addr[1] &= 0xffff0000;
         ch->addr[1] |= value;
         break;
 
-    case 0x0e:	/* SYS_DMA_CDSA_U_CH0 */
+    case 0x0e:  /* SYS_DMA_CDSA_U_CH0 */
         ch->addr[1] &= 0x0000ffff;
         ch->addr[1] |= (uint32_t) value << 16;
         break;
 
-    case 0x10:	/* SYS_DMA_CEN_CH0 */
+    case 0x10:  /* SYS_DMA_CEN_CH0 */
         ch->elements = value;
         break;
 
-    case 0x12:	/* SYS_DMA_CFN_CH0 */
+    case 0x12:  /* SYS_DMA_CFN_CH0 */
         ch->frames = value;
         break;
 
-    case 0x14:	/* SYS_DMA_CFI_CH0 */
+    case 0x14:  /* SYS_DMA_CFI_CH0 */
         ch->frame_index[0] = (int16_t) value;
         break;
 
-    case 0x16:	/* SYS_DMA_CEI_CH0 */
+    case 0x16:  /* SYS_DMA_CEI_CH0 */
         ch->element_index[0] = (int16_t) value;
         break;
 
-    case 0x18:	/* SYS_DMA_CPC_CH0 or DMA_CSAC */
+    case 0x18:  /* SYS_DMA_CPC_CH0 or DMA_CSAC */
         OMAP_RO_REG((hwaddr) reg);
         break;
 
-    case 0x1c:	/* DMA_CDEI */
+    case 0x1c:  /* DMA_CDEI */
         ch->element_index[1] = (int16_t) value;
         break;
 
-    case 0x1e:	/* DMA_CDFI */
+    case 0x1e:  /* DMA_CDFI */
         ch->frame_index[1] = (int16_t) value;
         break;
 
-    case 0x20:	/* DMA_COLOR_L */
+    case 0x20:  /* DMA_COLOR_L */
         ch->color &= 0xffff0000;
         ch->color |= value;
         break;
 
-    case 0x22:	/* DMA_COLOR_U */
+    case 0x22:  /* DMA_COLOR_U */
         ch->color &= 0xffff;
         ch->color |= (uint32_t)value << 16;
         break;
 
-    case 0x24:	/* DMA_CCR2 */
+    case 0x24:  /* DMA_CCR2 */
         ch->bs = (value >> 2) & 0x1;
         ch->transparent_copy = (value >> 1) & 0x1;
         ch->constant_fill = value & 0x1;
         break;
 
-    case 0x28:	/* DMA_CLNK_CTRL */
+    case 0x28:  /* DMA_CLNK_CTRL */
         ch->link_enabled = (value >> 15) & 0x1;
-        if (value & (1 << 14)) {			/* Stop_Lnk */
+        if (value & (1 << 14)) {            /* Stop_Lnk */
             ch->link_enabled = 0;
             omap_dma_disable_channel(s, ch);
         }
         ch->link_next_ch = value & 0x1f;
         break;
 
-    case 0x2a:	/* DMA_LCH_CTRL */
+    case 0x2a:  /* DMA_LCH_CTRL */
         ch->interleave_disabled = (value >> 15) & 0x1;
         ch->type = value & 0xf;
         break;
@@ -1012,7 +1012,7 @@ static int omap_dma_3_2_lcd_write(struct omap_dma_lcd_channel_s *s, int offset,
                 uint16_t value)
 {
     switch (offset) {
-    case 0xbc0:	/* DMA_LCD_CSDP */
+    case 0xbc0: /* DMA_LCD_CSDP */
         s->brust_f2 = (value >> 14) & 0x3;
         s->pack_f2 = (value >> 13) & 0x1;
         s->data_type_f2 = (1 << ((value >> 11) & 0x3));
@@ -1021,7 +1021,7 @@ static int omap_dma_3_2_lcd_write(struct omap_dma_lcd_channel_s *s, int offset,
         s->data_type_f1 = (1 << ((value >> 0) & 0x3));
         break;
 
-    case 0xbc2:	/* DMA_LCD_CCR */
+    case 0xbc2: /* DMA_LCD_CCR */
         s->mode_f2 = (value >> 14) & 0x3;
         s->mode_f1 = (value >> 12) & 0x3;
         s->end_prog = (value >> 11) & 0x1;
@@ -1033,7 +1033,7 @@ static int omap_dma_3_2_lcd_write(struct omap_dma_lcd_channel_s *s, int offset,
         s->bs = (value >> 4) & 0x1;
         break;
 
-    case 0xbc4:	/* DMA_LCD_CTRL */
+    case 0xbc4: /* DMA_LCD_CTRL */
         s->dst = (value >> 8) & 0x1;
         s->src = ((value >> 6) & 0x3) << 1;
         s->condition = 0;
@@ -1042,91 +1042,91 @@ static int omap_dma_3_2_lcd_write(struct omap_dma_lcd_channel_s *s, int offset,
         s->dual = value & 1;
         break;
 
-    case 0xbc8:	/* TOP_B1_L */
+    case 0xbc8: /* TOP_B1_L */
         s->src_f1_top &= 0xffff0000;
         s->src_f1_top |= 0x0000ffff & value;
         break;
 
-    case 0xbca:	/* TOP_B1_U */
+    case 0xbca: /* TOP_B1_U */
         s->src_f1_top &= 0x0000ffff;
         s->src_f1_top |= (uint32_t)value << 16;
         break;
 
-    case 0xbcc:	/* BOT_B1_L */
+    case 0xbcc: /* BOT_B1_L */
         s->src_f1_bottom &= 0xffff0000;
         s->src_f1_bottom |= 0x0000ffff & value;
         break;
 
-    case 0xbce:	/* BOT_B1_U */
+    case 0xbce: /* BOT_B1_U */
         s->src_f1_bottom &= 0x0000ffff;
         s->src_f1_bottom |= (uint32_t) value << 16;
         break;
 
-    case 0xbd0:	/* TOP_B2_L */
+    case 0xbd0: /* TOP_B2_L */
         s->src_f2_top &= 0xffff0000;
         s->src_f2_top |= 0x0000ffff & value;
         break;
 
-    case 0xbd2:	/* TOP_B2_U */
+    case 0xbd2: /* TOP_B2_U */
         s->src_f2_top &= 0x0000ffff;
         s->src_f2_top |= (uint32_t) value << 16;
         break;
 
-    case 0xbd4:	/* BOT_B2_L */
+    case 0xbd4: /* BOT_B2_L */
         s->src_f2_bottom &= 0xffff0000;
         s->src_f2_bottom |= 0x0000ffff & value;
         break;
 
-    case 0xbd6:	/* BOT_B2_U */
+    case 0xbd6: /* BOT_B2_U */
         s->src_f2_bottom &= 0x0000ffff;
         s->src_f2_bottom |= (uint32_t) value << 16;
         break;
 
-    case 0xbd8:	/* DMA_LCD_SRC_EI_B1 */
+    case 0xbd8: /* DMA_LCD_SRC_EI_B1 */
         s->element_index_f1 = value;
         break;
 
-    case 0xbda:	/* DMA_LCD_SRC_FI_B1_L */
+    case 0xbda: /* DMA_LCD_SRC_FI_B1_L */
         s->frame_index_f1 &= 0xffff0000;
         s->frame_index_f1 |= 0x0000ffff & value;
         break;
 
-    case 0xbf4:	/* DMA_LCD_SRC_FI_B1_U */
+    case 0xbf4: /* DMA_LCD_SRC_FI_B1_U */
         s->frame_index_f1 &= 0x0000ffff;
         s->frame_index_f1 |= (uint32_t) value << 16;
         break;
 
-    case 0xbdc:	/* DMA_LCD_SRC_EI_B2 */
+    case 0xbdc: /* DMA_LCD_SRC_EI_B2 */
         s->element_index_f2 = value;
         break;
 
-    case 0xbde:	/* DMA_LCD_SRC_FI_B2_L */
+    case 0xbde: /* DMA_LCD_SRC_FI_B2_L */
         s->frame_index_f2 &= 0xffff0000;
         s->frame_index_f2 |= 0x0000ffff & value;
         break;
 
-    case 0xbf6:	/* DMA_LCD_SRC_FI_B2_U */
+    case 0xbf6: /* DMA_LCD_SRC_FI_B2_U */
         s->frame_index_f2 &= 0x0000ffff;
         s->frame_index_f2 |= (uint32_t) value << 16;
         break;
 
-    case 0xbe0:	/* DMA_LCD_SRC_EN_B1 */
+    case 0xbe0: /* DMA_LCD_SRC_EN_B1 */
         s->elements_f1 = value;
         break;
 
-    case 0xbe4:	/* DMA_LCD_SRC_FN_B1 */
+    case 0xbe4: /* DMA_LCD_SRC_FN_B1 */
         s->frames_f1 = value;
         break;
 
-    case 0xbe2:	/* DMA_LCD_SRC_EN_B2 */
+    case 0xbe2: /* DMA_LCD_SRC_EN_B2 */
         s->elements_f2 = value;
         break;
 
-    case 0xbe6:	/* DMA_LCD_SRC_FN_B2 */
+    case 0xbe6: /* DMA_LCD_SRC_FN_B2 */
         s->frames_f2 = value;
         break;
 
-    case 0xbea:	/* DMA_LCD_LCH_CTRL */
+    case 0xbea: /* DMA_LCD_LCH_CTRL */
         s->lch_type = value & 0xf;
         break;
 
@@ -1140,7 +1140,7 @@ static int omap_dma_3_2_lcd_read(struct omap_dma_lcd_channel_s *s, int offset,
                 uint16_t *ret)
 {
     switch (offset) {
-    case 0xbc0:	/* DMA_LCD_CSDP */
+    case 0xbc0: /* DMA_LCD_CSDP */
         *ret = (s->brust_f2 << 14) |
             (s->pack_f2 << 13) |
             ((s->data_type_f2 >> 1) << 11) |
@@ -1149,7 +1149,7 @@ static int omap_dma_3_2_lcd_read(struct omap_dma_lcd_channel_s *s, int offset,
             ((s->data_type_f1 >> 1) << 0);
         break;
 
-    case 0xbc2:	/* DMA_LCD_CCR */
+    case 0xbc2: /* DMA_LCD_CCR */
         *ret = (s->mode_f2 << 14) |
             (s->mode_f1 << 12) |
             (s->end_prog << 11) |
@@ -1161,7 +1161,7 @@ static int omap_dma_3_2_lcd_read(struct omap_dma_lcd_channel_s *s, int offset,
             (s->bs << 4);
         break;
 
-    case 0xbc4:	/* DMA_LCD_CTRL */
+    case 0xbc4: /* DMA_LCD_CTRL */
         qemu_irq_lower(s->irq);
         *ret = (s->dst << 8) |
             ((s->src & 0x6) << 5) |
@@ -1170,79 +1170,79 @@ static int omap_dma_3_2_lcd_read(struct omap_dma_lcd_channel_s *s, int offset,
             s->dual;
         break;
 
-    case 0xbc8:	/* TOP_B1_L */
+    case 0xbc8: /* TOP_B1_L */
         *ret = s->src_f1_top & 0xffff;
         break;
 
-    case 0xbca:	/* TOP_B1_U */
+    case 0xbca: /* TOP_B1_U */
         *ret = s->src_f1_top >> 16;
         break;
 
-    case 0xbcc:	/* BOT_B1_L */
+    case 0xbcc: /* BOT_B1_L */
         *ret = s->src_f1_bottom & 0xffff;
         break;
 
-    case 0xbce:	/* BOT_B1_U */
+    case 0xbce: /* BOT_B1_U */
         *ret = s->src_f1_bottom >> 16;
         break;
 
-    case 0xbd0:	/* TOP_B2_L */
+    case 0xbd0: /* TOP_B2_L */
         *ret = s->src_f2_top & 0xffff;
         break;
 
-    case 0xbd2:	/* TOP_B2_U */
+    case 0xbd2: /* TOP_B2_U */
         *ret = s->src_f2_top >> 16;
         break;
 
-    case 0xbd4:	/* BOT_B2_L */
+    case 0xbd4: /* BOT_B2_L */
         *ret = s->src_f2_bottom & 0xffff;
         break;
 
-    case 0xbd6:	/* BOT_B2_U */
+    case 0xbd6: /* BOT_B2_U */
         *ret = s->src_f2_bottom >> 16;
         break;
 
-    case 0xbd8:	/* DMA_LCD_SRC_EI_B1 */
+    case 0xbd8: /* DMA_LCD_SRC_EI_B1 */
         *ret = s->element_index_f1;
         break;
 
-    case 0xbda:	/* DMA_LCD_SRC_FI_B1_L */
+    case 0xbda: /* DMA_LCD_SRC_FI_B1_L */
         *ret = s->frame_index_f1 & 0xffff;
         break;
 
-    case 0xbf4:	/* DMA_LCD_SRC_FI_B1_U */
+    case 0xbf4: /* DMA_LCD_SRC_FI_B1_U */
         *ret = s->frame_index_f1 >> 16;
         break;
 
-    case 0xbdc:	/* DMA_LCD_SRC_EI_B2 */
+    case 0xbdc: /* DMA_LCD_SRC_EI_B2 */
         *ret = s->element_index_f2;
         break;
 
-    case 0xbde:	/* DMA_LCD_SRC_FI_B2_L */
+    case 0xbde: /* DMA_LCD_SRC_FI_B2_L */
         *ret = s->frame_index_f2 & 0xffff;
         break;
 
-    case 0xbf6:	/* DMA_LCD_SRC_FI_B2_U */
+    case 0xbf6: /* DMA_LCD_SRC_FI_B2_U */
         *ret = s->frame_index_f2 >> 16;
         break;
 
-    case 0xbe0:	/* DMA_LCD_SRC_EN_B1 */
+    case 0xbe0: /* DMA_LCD_SRC_EN_B1 */
         *ret = s->elements_f1;
         break;
 
-    case 0xbe4:	/* DMA_LCD_SRC_FN_B1 */
+    case 0xbe4: /* DMA_LCD_SRC_FN_B1 */
         *ret = s->frames_f1;
         break;
 
-    case 0xbe2:	/* DMA_LCD_SRC_EN_B2 */
+    case 0xbe2: /* DMA_LCD_SRC_EN_B2 */
         *ret = s->elements_f2;
         break;
 
-    case 0xbe6:	/* DMA_LCD_SRC_FN_B2 */
+    case 0xbe6: /* DMA_LCD_SRC_FN_B2 */
         *ret = s->frames_f2;
         break;
 
-    case 0xbea:	/* DMA_LCD_LCH_CTRL */
+    case 0xbea: /* DMA_LCD_LCH_CTRL */
         *ret = s->lch_type;
         break;
 
@@ -1256,7 +1256,7 @@ static int omap_dma_3_1_lcd_write(struct omap_dma_lcd_channel_s *s, int offset,
                 uint16_t value)
 {
     switch (offset) {
-    case 0x300:	/* SYS_DMA_LCD_CTRL */
+    case 0x300: /* SYS_DMA_LCD_CTRL */
         s->src = (value & 0x40) ? imif : emiff;
         s->condition = 0;
         /* Assume no bus errors and thus no BUS_ERROR irq bits.  */
@@ -1264,42 +1264,42 @@ static int omap_dma_3_1_lcd_write(struct omap_dma_lcd_channel_s *s, int offset,
         s->dual = value & 1;
         break;
 
-    case 0x302:	/* SYS_DMA_LCD_TOP_F1_L */
+    case 0x302: /* SYS_DMA_LCD_TOP_F1_L */
         s->src_f1_top &= 0xffff0000;
         s->src_f1_top |= 0x0000ffff & value;
         break;
 
-    case 0x304:	/* SYS_DMA_LCD_TOP_F1_U */
+    case 0x304: /* SYS_DMA_LCD_TOP_F1_U */
         s->src_f1_top &= 0x0000ffff;
         s->src_f1_top |= (uint32_t)value << 16;
         break;
 
-    case 0x306:	/* SYS_DMA_LCD_BOT_F1_L */
+    case 0x306: /* SYS_DMA_LCD_BOT_F1_L */
         s->src_f1_bottom &= 0xffff0000;
         s->src_f1_bottom |= 0x0000ffff & value;
         break;
 
-    case 0x308:	/* SYS_DMA_LCD_BOT_F1_U */
+    case 0x308: /* SYS_DMA_LCD_BOT_F1_U */
         s->src_f1_bottom &= 0x0000ffff;
         s->src_f1_bottom |= (uint32_t)value << 16;
         break;
 
-    case 0x30a:	/* SYS_DMA_LCD_TOP_F2_L */
+    case 0x30a: /* SYS_DMA_LCD_TOP_F2_L */
         s->src_f2_top &= 0xffff0000;
         s->src_f2_top |= 0x0000ffff & value;
         break;
 
-    case 0x30c:	/* SYS_DMA_LCD_TOP_F2_U */
+    case 0x30c: /* SYS_DMA_LCD_TOP_F2_U */
         s->src_f2_top &= 0x0000ffff;
         s->src_f2_top |= (uint32_t)value << 16;
         break;
 
-    case 0x30e:	/* SYS_DMA_LCD_BOT_F2_L */
+    case 0x30e: /* SYS_DMA_LCD_BOT_F2_L */
         s->src_f2_bottom &= 0xffff0000;
         s->src_f2_bottom |= 0x0000ffff & value;
         break;
 
-    case 0x310:	/* SYS_DMA_LCD_BOT_F2_U */
+    case 0x310: /* SYS_DMA_LCD_BOT_F2_U */
         s->src_f2_bottom &= 0x0000ffff;
         s->src_f2_bottom |= (uint32_t)value << 16;
         break;
@@ -1316,7 +1316,7 @@ static int omap_dma_3_1_lcd_read(struct omap_dma_lcd_channel_s *s, int offset,
     int i;
 
     switch (offset) {
-    case 0x300:	/* SYS_DMA_LCD_CTRL */
+    case 0x300: /* SYS_DMA_LCD_CTRL */
         i = s->condition;
         s->condition = 0;
         qemu_irq_lower(s->irq);
@@ -1324,35 +1324,35 @@ static int omap_dma_3_1_lcd_read(struct omap_dma_lcd_channel_s *s, int offset,
                 (s->interrupts << 1) | s->dual;
         break;
 
-    case 0x302:	/* SYS_DMA_LCD_TOP_F1_L */
+    case 0x302: /* SYS_DMA_LCD_TOP_F1_L */
         *ret = s->src_f1_top & 0xffff;
         break;
 
-    case 0x304:	/* SYS_DMA_LCD_TOP_F1_U */
+    case 0x304: /* SYS_DMA_LCD_TOP_F1_U */
         *ret = s->src_f1_top >> 16;
         break;
 
-    case 0x306:	/* SYS_DMA_LCD_BOT_F1_L */
+    case 0x306: /* SYS_DMA_LCD_BOT_F1_L */
         *ret = s->src_f1_bottom & 0xffff;
         break;
 
-    case 0x308:	/* SYS_DMA_LCD_BOT_F1_U */
+    case 0x308: /* SYS_DMA_LCD_BOT_F1_U */
         *ret = s->src_f1_bottom >> 16;
         break;
 
-    case 0x30a:	/* SYS_DMA_LCD_TOP_F2_L */
+    case 0x30a: /* SYS_DMA_LCD_TOP_F2_L */
         *ret = s->src_f2_top & 0xffff;
         break;
 
-    case 0x30c:	/* SYS_DMA_LCD_TOP_F2_U */
+    case 0x30c: /* SYS_DMA_LCD_TOP_F2_U */
         *ret = s->src_f2_top >> 16;
         break;
 
-    case 0x30e:	/* SYS_DMA_LCD_BOT_F2_L */
+    case 0x30e: /* SYS_DMA_LCD_BOT_F2_L */
         *ret = s->src_f2_bottom & 0xffff;
         break;
 
-    case 0x310:	/* SYS_DMA_LCD_BOT_F2_U */
+    case 0x310: /* SYS_DMA_LCD_BOT_F2_U */
         *ret = s->src_f2_bottom >> 16;
         break;
 
@@ -1365,18 +1365,18 @@ static int omap_dma_3_1_lcd_read(struct omap_dma_lcd_channel_s *s, int offset,
 static int omap_dma_sys_write(struct omap_dma_s *s, int offset, uint16_t value)
 {
     switch (offset) {
-    case 0x400:	/* SYS_DMA_GCR */
+    case 0x400: /* SYS_DMA_GCR */
         s->gcr = value;
         break;
 
-    case 0x404:	/* DMA_GSCR */
+    case 0x404: /* DMA_GSCR */
         if (value & 0x8)
             omap_dma_disable_3_1_mapping(s);
         else
             omap_dma_enable_3_1_mapping(s);
         break;
 
-    case 0x408:	/* DMA_GRST */
+    case 0x408: /* DMA_GRST */
         if (value & 0x1)
             omap_dma_reset(s->dma);
         break;
@@ -1391,57 +1391,57 @@ static int omap_dma_sys_read(struct omap_dma_s *s, int offset,
                 uint16_t *ret)
 {
     switch (offset) {
-    case 0x400:	/* SYS_DMA_GCR */
+    case 0x400: /* SYS_DMA_GCR */
         *ret = s->gcr;
         break;
 
-    case 0x404:	/* DMA_GSCR */
+    case 0x404: /* DMA_GSCR */
         *ret = s->omap_3_1_mapping_disabled << 3;
         break;
 
-    case 0x408:	/* DMA_GRST */
+    case 0x408: /* DMA_GRST */
         *ret = 0;
         break;
 
-    case 0x442:	/* DMA_HW_ID */
-    case 0x444:	/* DMA_PCh2_ID */
-    case 0x446:	/* DMA_PCh0_ID */
-    case 0x448:	/* DMA_PCh1_ID */
-    case 0x44a:	/* DMA_PChG_ID */
-    case 0x44c:	/* DMA_PChD_ID */
+    case 0x442: /* DMA_HW_ID */
+    case 0x444: /* DMA_PCh2_ID */
+    case 0x446: /* DMA_PCh0_ID */
+    case 0x448: /* DMA_PCh1_ID */
+    case 0x44a: /* DMA_PChG_ID */
+    case 0x44c: /* DMA_PChD_ID */
         *ret = 1;
         break;
 
-    case 0x44e:	/* DMA_CAPS_0_U */
+    case 0x44e: /* DMA_CAPS_0_U */
         *ret = (s->caps[0] >> 16) & 0xffff;
         break;
-    case 0x450:	/* DMA_CAPS_0_L */
+    case 0x450: /* DMA_CAPS_0_L */
         *ret = (s->caps[0] >>  0) & 0xffff;
         break;
 
-    case 0x452:	/* DMA_CAPS_1_U */
+    case 0x452: /* DMA_CAPS_1_U */
         *ret = (s->caps[1] >> 16) & 0xffff;
         break;
-    case 0x454:	/* DMA_CAPS_1_L */
+    case 0x454: /* DMA_CAPS_1_L */
         *ret = (s->caps[1] >>  0) & 0xffff;
         break;
 
-    case 0x456:	/* DMA_CAPS_2 */
+    case 0x456: /* DMA_CAPS_2 */
         *ret = s->caps[2];
         break;
 
-    case 0x458:	/* DMA_CAPS_3 */
+    case 0x458: /* DMA_CAPS_3 */
         *ret = s->caps[3];
         break;
 
-    case 0x45a:	/* DMA_CAPS_4 */
+    case 0x45a: /* DMA_CAPS_4 */
         *ret = s->caps[4];
         break;
 
-    case 0x460:	/* DMA_PCh2_SR */
-    case 0x480:	/* DMA_PCh0_SR */
-    case 0x482:	/* DMA_PCh1_SR */
-    case 0x4c0:	/* DMA_PChD_SR_0 */
+    case 0x460: /* DMA_PCh2_SR */
+    case 0x480: /* DMA_PCh0_SR */
+    case 0x482: /* DMA_PCh1_SR */
+    case 0x4c0: /* DMA_PChD_SR_0 */
         qemu_log_mask(LOG_UNIMP,
                       "%s: Physical Channel Status Registers not implemented\n",
                       __func__);
@@ -1590,38 +1590,38 @@ static void omap_dma_setcaps(struct omap_dma_s *s)
     case omap_dma_4:
         /* XXX Only available for sDMA */
         s->caps[0] =
-                (1 << 19) |	/* Constant Fill Capability */
-                (1 << 18);	/* Transparent BLT Capability */
+                (1 << 19) | /* Constant Fill Capability */
+                (1 << 18);  /* Transparent BLT Capability */
         s->caps[1] =
-                (1 << 1);	/* 1-bit palettized capability (DMA 3.2 only) */
+                (1 << 1);   /* 1-bit palettized capability (DMA 3.2 only) */
         s->caps[2] =
-                (1 << 8) |	/* SEPARATE_SRC_AND_DST_INDEX_CPBLTY */
-                (1 << 7) |	/* DST_DOUBLE_INDEX_ADRS_CPBLTY */
-                (1 << 6) |	/* DST_SINGLE_INDEX_ADRS_CPBLTY */
-                (1 << 5) |	/* DST_POST_INCRMNT_ADRS_CPBLTY */
-                (1 << 4) |	/* DST_CONST_ADRS_CPBLTY */
-                (1 << 3) |	/* SRC_DOUBLE_INDEX_ADRS_CPBLTY */
-                (1 << 2) |	/* SRC_SINGLE_INDEX_ADRS_CPBLTY */
-                (1 << 1) |	/* SRC_POST_INCRMNT_ADRS_CPBLTY */
-                (1 << 0);	/* SRC_CONST_ADRS_CPBLTY */
+                (1 << 8) |  /* SEPARATE_SRC_AND_DST_INDEX_CPBLTY */
+                (1 << 7) |  /* DST_DOUBLE_INDEX_ADRS_CPBLTY */
+                (1 << 6) |  /* DST_SINGLE_INDEX_ADRS_CPBLTY */
+                (1 << 5) |  /* DST_POST_INCRMNT_ADRS_CPBLTY */
+                (1 << 4) |  /* DST_CONST_ADRS_CPBLTY */
+                (1 << 3) |  /* SRC_DOUBLE_INDEX_ADRS_CPBLTY */
+                (1 << 2) |  /* SRC_SINGLE_INDEX_ADRS_CPBLTY */
+                (1 << 1) |  /* SRC_POST_INCRMNT_ADRS_CPBLTY */
+                (1 << 0);   /* SRC_CONST_ADRS_CPBLTY */
         s->caps[3] =
-                (1 << 6) |	/* BLOCK_SYNCHR_CPBLTY (DMA 4 only) */
-                (1 << 7) |	/* PKT_SYNCHR_CPBLTY (DMA 4 only) */
-                (1 << 5) |	/* CHANNEL_CHAINING_CPBLTY */
-                (1 << 4) |	/* LCh_INTERLEAVE_CPBLTY */
-                (1 << 3) |	/* AUTOINIT_REPEAT_CPBLTY (DMA 3.2 only) */
-                (1 << 2) |	/* AUTOINIT_ENDPROG_CPBLTY (DMA 3.2 only) */
-                (1 << 1) |	/* FRAME_SYNCHR_CPBLTY */
-                (1 << 0);	/* ELMNT_SYNCHR_CPBLTY */
+                (1 << 6) |  /* BLOCK_SYNCHR_CPBLTY (DMA 4 only) */
+                (1 << 7) |  /* PKT_SYNCHR_CPBLTY (DMA 4 only) */
+                (1 << 5) |  /* CHANNEL_CHAINING_CPBLTY */
+                (1 << 4) |  /* LCh_INTERLEAVE_CPBLTY */
+                (1 << 3) |  /* AUTOINIT_REPEAT_CPBLTY (DMA 3.2 only) */
+                (1 << 2) |  /* AUTOINIT_ENDPROG_CPBLTY (DMA 3.2 only) */
+                (1 << 1) |  /* FRAME_SYNCHR_CPBLTY */
+                (1 << 0);   /* ELMNT_SYNCHR_CPBLTY */
         s->caps[4] =
-                (1 << 7) |	/* PKT_INTERRUPT_CPBLTY (DMA 4 only) */
-                (1 << 6) |	/* SYNC_STATUS_CPBLTY */
-                (1 << 5) |	/* BLOCK_INTERRUPT_CPBLTY */
-                (1 << 4) |	/* LAST_FRAME_INTERRUPT_CPBLTY */
-                (1 << 3) |	/* FRAME_INTERRUPT_CPBLTY */
-                (1 << 2) |	/* HALF_FRAME_INTERRUPT_CPBLTY */
-                (1 << 1) |	/* EVENT_DROP_INTERRUPT_CPBLTY */
-                (1 << 0);	/* TIMEOUT_INTERRUPT_CPBLTY (DMA 3.2 only) */
+                (1 << 7) |  /* PKT_INTERRUPT_CPBLTY (DMA 4 only) */
+                (1 << 6) |  /* SYNC_STATUS_CPBLTY */
+                (1 << 5) |  /* BLOCK_INTERRUPT_CPBLTY */
+                (1 << 4) |  /* LAST_FRAME_INTERRUPT_CPBLTY */
+                (1 << 3) |  /* FRAME_INTERRUPT_CPBLTY */
+                (1 << 2) |  /* HALF_FRAME_INTERRUPT_CPBLTY */
+                (1 << 1) |  /* EVENT_DROP_INTERRUPT_CPBLTY */
+                (1 << 0);   /* TIMEOUT_INTERRUPT_CPBLTY (DMA 3.2 only) */
         break;
     }
 }
@@ -1711,49 +1711,49 @@ static uint64_t omap_dma4_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* DMA4_REVISION */
+    case 0x00:  /* DMA4_REVISION */
         return 0x40;
 
-    case 0x14:	/* DMA4_IRQSTATUS_L3 */
+    case 0x14:  /* DMA4_IRQSTATUS_L3 */
         irqn ++;
         /* fall through */
-    case 0x10:	/* DMA4_IRQSTATUS_L2 */
+    case 0x10:  /* DMA4_IRQSTATUS_L2 */
         irqn ++;
         /* fall through */
-    case 0x0c:	/* DMA4_IRQSTATUS_L1 */
+    case 0x0c:  /* DMA4_IRQSTATUS_L1 */
         irqn ++;
         /* fall through */
-    case 0x08:	/* DMA4_IRQSTATUS_L0 */
+    case 0x08:  /* DMA4_IRQSTATUS_L0 */
         return s->irqstat[irqn];
 
-    case 0x24:	/* DMA4_IRQENABLE_L3 */
+    case 0x24:  /* DMA4_IRQENABLE_L3 */
         irqn ++;
         /* fall through */
-    case 0x20:	/* DMA4_IRQENABLE_L2 */
+    case 0x20:  /* DMA4_IRQENABLE_L2 */
         irqn ++;
         /* fall through */
-    case 0x1c:	/* DMA4_IRQENABLE_L1 */
+    case 0x1c:  /* DMA4_IRQENABLE_L1 */
         irqn ++;
         /* fall through */
-    case 0x18:	/* DMA4_IRQENABLE_L0 */
+    case 0x18:  /* DMA4_IRQENABLE_L0 */
         return s->irqen[irqn];
 
-    case 0x28:	/* DMA4_SYSSTATUS */
-        return 1;						/* RESETDONE */
+    case 0x28:  /* DMA4_SYSSTATUS */
+        return 1;                       /* RESETDONE */
 
-    case 0x2c:	/* DMA4_OCP_SYSCONFIG */
+    case 0x2c:  /* DMA4_OCP_SYSCONFIG */
         return s->ocp;
 
-    case 0x64:	/* DMA4_CAPS_0 */
+    case 0x64:  /* DMA4_CAPS_0 */
         return s->caps[0];
-    case 0x6c:	/* DMA4_CAPS_2 */
+    case 0x6c:  /* DMA4_CAPS_2 */
         return s->caps[2];
-    case 0x70:	/* DMA4_CAPS_3 */
+    case 0x70:  /* DMA4_CAPS_3 */
         return s->caps[3];
-    case 0x74:	/* DMA4_CAPS_4 */
+    case 0x74:  /* DMA4_CAPS_4 */
         return s->caps[4];
 
-    case 0x78:	/* DMA4_GCR */
+    case 0x78:  /* DMA4_GCR */
         return s->gcr;
 
     case 0x80 ... 0xfff:
@@ -1770,7 +1770,7 @@ static uint64_t omap_dma4_read(void *opaque, hwaddr addr,
 
     /* Per-channel registers */
     switch (addr) {
-    case 0x00:	/* DMA4_CCR */
+    case 0x00:  /* DMA4_CCR */
         return (ch->buf_disable << 25) |
                 (ch->src_sync << 24) |
                 (ch->prefetch << 23) |
@@ -1786,16 +1786,16 @@ static uint64_t omap_dma4_read(void *opaque, hwaddr addr,
                 (ch->priority << 6) |
                 (ch->fs << 5) | (ch->sync & 0x1f);
 
-    case 0x04:	/* DMA4_CLNK_CTRL */
+    case 0x04:  /* DMA4_CLNK_CTRL */
         return (ch->link_enabled << 15) | ch->link_next_ch;
 
-    case 0x08:	/* DMA4_CICR */
+    case 0x08:  /* DMA4_CICR */
         return ch->interrupts;
 
-    case 0x0c:	/* DMA4_CSR */
+    case 0x0c:  /* DMA4_CSR */
         return ch->cstatus;
 
-    case 0x10:	/* DMA4_CSDP */
+    case 0x10:  /* DMA4_CSDP */
         return (ch->endian[0] << 21) |
                 (ch->endian_lock[0] << 20) |
                 (ch->endian[1] << 19) |
@@ -1809,43 +1809,43 @@ static uint64_t omap_dma4_read(void *opaque, hwaddr addr,
                 (ch->translate[0] << 2) |
                 (ch->data_type >> 1);
 
-    case 0x14:	/* DMA4_CEN */
+    case 0x14:  /* DMA4_CEN */
         return ch->elements;
 
-    case 0x18:	/* DMA4_CFN */
+    case 0x18:  /* DMA4_CFN */
         return ch->frames;
 
-    case 0x1c:	/* DMA4_CSSA */
+    case 0x1c:  /* DMA4_CSSA */
         return ch->addr[0];
 
-    case 0x20:	/* DMA4_CDSA */
+    case 0x20:  /* DMA4_CDSA */
         return ch->addr[1];
 
-    case 0x24:	/* DMA4_CSEI */
+    case 0x24:  /* DMA4_CSEI */
         return ch->element_index[0];
 
-    case 0x28:	/* DMA4_CSFI */
+    case 0x28:  /* DMA4_CSFI */
         return ch->frame_index[0];
 
-    case 0x2c:	/* DMA4_CDEI */
+    case 0x2c:  /* DMA4_CDEI */
         return ch->element_index[1];
 
-    case 0x30:	/* DMA4_CDFI */
+    case 0x30:  /* DMA4_CDFI */
         return ch->frame_index[1];
 
-    case 0x34:	/* DMA4_CSAC */
+    case 0x34:  /* DMA4_CSAC */
         return ch->active_set.src & 0xffff;
 
-    case 0x38:	/* DMA4_CDAC */
+    case 0x38:  /* DMA4_CDAC */
         return ch->active_set.dest & 0xffff;
 
-    case 0x3c:	/* DMA4_CCEN */
+    case 0x3c:  /* DMA4_CCEN */
         return ch->active_set.element;
 
-    case 0x40:	/* DMA4_CCFN */
+    case 0x40:  /* DMA4_CCFN */
         return ch->active_set.frame;
 
-    case 0x44:	/* DMA4_COLOR */
+    case 0x44:  /* DMA4_COLOR */
         /* XXX only in sDMA */
         return ch->color;
 
@@ -1868,36 +1868,36 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x14:	/* DMA4_IRQSTATUS_L3 */
+    case 0x14:  /* DMA4_IRQSTATUS_L3 */
         irqn ++;
         /* fall through */
-    case 0x10:	/* DMA4_IRQSTATUS_L2 */
+    case 0x10:  /* DMA4_IRQSTATUS_L2 */
         irqn ++;
         /* fall through */
-    case 0x0c:	/* DMA4_IRQSTATUS_L1 */
+    case 0x0c:  /* DMA4_IRQSTATUS_L1 */
         irqn ++;
         /* fall through */
-    case 0x08:	/* DMA4_IRQSTATUS_L0 */
+    case 0x08:  /* DMA4_IRQSTATUS_L0 */
         s->irqstat[irqn] &= ~value;
         if (!s->irqstat[irqn])
             qemu_irq_lower(s->irq[irqn]);
         return;
 
-    case 0x24:	/* DMA4_IRQENABLE_L3 */
+    case 0x24:  /* DMA4_IRQENABLE_L3 */
         irqn ++;
         /* fall through */
-    case 0x20:	/* DMA4_IRQENABLE_L2 */
+    case 0x20:  /* DMA4_IRQENABLE_L2 */
         irqn ++;
         /* fall through */
-    case 0x1c:	/* DMA4_IRQENABLE_L1 */
+    case 0x1c:  /* DMA4_IRQENABLE_L1 */
         irqn ++;
         /* fall through */
-    case 0x18:	/* DMA4_IRQENABLE_L0 */
+    case 0x18:  /* DMA4_IRQENABLE_L0 */
         s->irqen[irqn] = value;
         return;
 
-    case 0x2c:	/* DMA4_OCP_SYSCONFIG */
-        if (value & 2)						/* SOFTRESET */
+    case 0x2c:  /* DMA4_OCP_SYSCONFIG */
+        if (value & 2)                      /* SOFTRESET */
             omap_dma_reset(s->dma);
         s->ocp = value & 0x3321;
         if (((s->ocp >> 12) & 3) == 3) { /* MIDLEMODE */
@@ -1906,7 +1906,7 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
         }
         return;
 
-    case 0x78:	/* DMA4_GCR */
+    case 0x78:  /* DMA4_GCR */
         s->gcr = value & 0x00ff00ff;
         if ((value & 0xff) == 0x00) { /* MAX_CHANNEL_FIFO_DEPTH */
             qemu_log_mask(LOG_GUEST_ERROR, "%s: wrong FIFO depth in GCR\n",
@@ -1921,12 +1921,12 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
         addr -= chnum * 0x60;
         break;
 
-    case 0x00:	/* DMA4_REVISION */
-    case 0x28:	/* DMA4_SYSSTATUS */
-    case 0x64:	/* DMA4_CAPS_0 */
-    case 0x6c:	/* DMA4_CAPS_2 */
-    case 0x70:	/* DMA4_CAPS_3 */
-    case 0x74:	/* DMA4_CAPS_4 */
+    case 0x00:  /* DMA4_REVISION */
+    case 0x28:  /* DMA4_SYSSTATUS */
+    case 0x64:  /* DMA4_CAPS_0 */
+    case 0x6c:  /* DMA4_CAPS_2 */
+    case 0x70:  /* DMA4_CAPS_3 */
+    case 0x74:  /* DMA4_CAPS_4 */
         OMAP_RO_REG(addr);
         return;
 
@@ -1937,9 +1937,9 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
 
     /* Per-channel registers */
     switch (addr) {
-    case 0x00:	/* DMA4_CCR */
+    case 0x00:  /* DMA4_CCR */
         ch->buf_disable = (value >> 25) & 1;
-        ch->src_sync = (value >> 24) & 1;	/* XXX For CamDMA must be 1 */
+        ch->src_sync = (value >> 24) & 1;   /* XXX For CamDMA must be 1 */
         if (ch->buf_disable && !ch->src_sync) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "%s: Buffering disable is not allowed in "
@@ -1969,20 +1969,20 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
 
         break;
 
-    case 0x04:	/* DMA4_CLNK_CTRL */
+    case 0x04:  /* DMA4_CLNK_CTRL */
         ch->link_enabled = (value >> 15) & 0x1;
         ch->link_next_ch = value & 0x1f;
         break;
 
-    case 0x08:	/* DMA4_CICR */
+    case 0x08:  /* DMA4_CICR */
         ch->interrupts = value & 0x09be;
         break;
 
-    case 0x0c:	/* DMA4_CSR */
+    case 0x0c:  /* DMA4_CSR */
         ch->cstatus &= ~value;
         break;
 
-    case 0x10:	/* DMA4_CSDP */
+    case 0x10:  /* DMA4_CSDP */
         ch->endian[0] =(value >> 21) & 1;
         ch->endian_lock[0] =(value >> 20) & 1;
         ch->endian[1] =(value >> 19) & 1;
@@ -2012,55 +2012,55 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
         }
         break;
 
-    case 0x14:	/* DMA4_CEN */
+    case 0x14:  /* DMA4_CEN */
         ch->set_update = 1;
         ch->elements = value & 0xffffff;
         break;
 
-    case 0x18:	/* DMA4_CFN */
+    case 0x18:  /* DMA4_CFN */
         ch->frames = value & 0xffff;
         ch->set_update = 1;
         break;
 
-    case 0x1c:	/* DMA4_CSSA */
+    case 0x1c:  /* DMA4_CSSA */
         ch->addr[0] = (hwaddr) (uint32_t) value;
         ch->set_update = 1;
         break;
 
-    case 0x20:	/* DMA4_CDSA */
+    case 0x20:  /* DMA4_CDSA */
         ch->addr[1] = (hwaddr) (uint32_t) value;
         ch->set_update = 1;
         break;
 
-    case 0x24:	/* DMA4_CSEI */
+    case 0x24:  /* DMA4_CSEI */
         ch->element_index[0] = (int16_t) value;
         ch->set_update = 1;
         break;
 
-    case 0x28:	/* DMA4_CSFI */
+    case 0x28:  /* DMA4_CSFI */
         ch->frame_index[0] = (int32_t) value;
         ch->set_update = 1;
         break;
 
-    case 0x2c:	/* DMA4_CDEI */
+    case 0x2c:  /* DMA4_CDEI */
         ch->element_index[1] = (int16_t) value;
         ch->set_update = 1;
         break;
 
-    case 0x30:	/* DMA4_CDFI */
+    case 0x30:  /* DMA4_CDFI */
         ch->frame_index[1] = (int32_t) value;
         ch->set_update = 1;
         break;
 
-    case 0x44:	/* DMA4_COLOR */
+    case 0x44:  /* DMA4_COLOR */
         /* XXX only in sDMA */
         ch->color = value;
         break;
 
-    case 0x34:	/* DMA4_CSAC */
-    case 0x38:	/* DMA4_CDAC */
-    case 0x3c:	/* DMA4_CCEN */
-    case 0x40:	/* DMA4_CCFN */
+    case 0x34:  /* DMA4_CSAC */
+    case 0x38:  /* DMA4_CDAC */
+    case 0x3c:  /* DMA4_CCEN */
+    case 0x40:  /* DMA4_CCFN */
         OMAP_RO_REG(addr);
         break;
 
diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
index fa896f7edf..1bddb5b485 100644
--- a/hw/dma/pxa2xx_dma.c
+++ b/hw/dma/pxa2xx_dma.c
@@ -61,61 +61,61 @@ struct PXA2xxDMAState {
     int running;
 };
 
-#define DCSR0	0x0000	/* DMA Control / Status register for Channel 0 */
-#define DCSR31	0x007c	/* DMA Control / Status register for Channel 31 */
-#define DALGN	0x00a0	/* DMA Alignment register */
-#define DPCSR	0x00a4	/* DMA Programmed I/O Control Status register */
-#define DRQSR0	0x00e0	/* DMA DREQ<0> Status register */
-#define DRQSR1	0x00e4	/* DMA DREQ<1> Status register */
-#define DRQSR2	0x00e8	/* DMA DREQ<2> Status register */
-#define DINT	0x00f0	/* DMA Interrupt register */
-#define DRCMR0	0x0100	/* Request to Channel Map register 0 */
-#define DRCMR63	0x01fc	/* Request to Channel Map register 63 */
-#define D_CH0	0x0200	/* Channel 0 Descriptor start */
-#define DRCMR64	0x1100	/* Request to Channel Map register 64 */
-#define DRCMR74	0x1128	/* Request to Channel Map register 74 */
+#define DCSR0   0x0000  /* DMA Control / Status register for Channel 0 */
+#define DCSR31  0x007c  /* DMA Control / Status register for Channel 31 */
+#define DALGN   0x00a0  /* DMA Alignment register */
+#define DPCSR   0x00a4  /* DMA Programmed I/O Control Status register */
+#define DRQSR0  0x00e0  /* DMA DREQ<0> Status register */
+#define DRQSR1  0x00e4  /* DMA DREQ<1> Status register */
+#define DRQSR2  0x00e8  /* DMA DREQ<2> Status register */
+#define DINT    0x00f0  /* DMA Interrupt register */
+#define DRCMR0  0x0100  /* Request to Channel Map register 0 */
+#define DRCMR63 0x01fc  /* Request to Channel Map register 63 */
+#define D_CH0   0x0200  /* Channel 0 Descriptor start */
+#define DRCMR64 0x1100  /* Request to Channel Map register 64 */
+#define DRCMR74 0x1128  /* Request to Channel Map register 74 */
 
 /* Per-channel register */
-#define DDADR	0x00
-#define DSADR	0x01
-#define DTADR	0x02
-#define DCMD	0x03
+#define DDADR   0x00
+#define DSADR   0x01
+#define DTADR   0x02
+#define DCMD    0x03
 
 /* Bit-field masks */
-#define DRCMR_CHLNUM		0x1f
-#define DRCMR_MAPVLD		(1 << 7)
-#define DDADR_STOP		(1 << 0)
-#define DDADR_BREN		(1 << 1)
-#define DCMD_LEN		0x1fff
-#define DCMD_WIDTH(x)		(1 << ((((x) >> 14) & 3) - 1))
-#define DCMD_SIZE(x)		(4 << (((x) >> 16) & 3))
-#define DCMD_FLYBYT		(1 << 19)
-#define DCMD_FLYBYS		(1 << 20)
-#define DCMD_ENDIRQEN		(1 << 21)
-#define DCMD_STARTIRQEN		(1 << 22)
-#define DCMD_CMPEN		(1 << 25)
-#define DCMD_FLOWTRG		(1 << 28)
-#define DCMD_FLOWSRC		(1 << 29)
-#define DCMD_INCTRGADDR		(1 << 30)
-#define DCMD_INCSRCADDR		(1 << 31)
-#define DCSR_BUSERRINTR		(1 << 0)
-#define DCSR_STARTINTR		(1 << 1)
-#define DCSR_ENDINTR		(1 << 2)
-#define DCSR_STOPINTR		(1 << 3)
-#define DCSR_RASINTR		(1 << 4)
-#define DCSR_REQPEND		(1 << 8)
-#define DCSR_EORINT		(1 << 9)
-#define DCSR_CMPST		(1 << 10)
-#define DCSR_MASKRUN		(1 << 22)
-#define DCSR_RASIRQEN		(1 << 23)
-#define DCSR_CLRCMPST		(1 << 24)
-#define DCSR_SETCMPST		(1 << 25)
-#define DCSR_EORSTOPEN		(1 << 26)
-#define DCSR_EORJMPEN		(1 << 27)
-#define DCSR_EORIRQEN		(1 << 28)
-#define DCSR_STOPIRQEN		(1 << 29)
-#define DCSR_NODESCFETCH	(1 << 30)
-#define DCSR_RUN		(1 << 31)
+#define DRCMR_CHLNUM        0x1f
+#define DRCMR_MAPVLD        (1 << 7)
+#define DDADR_STOP      (1 << 0)
+#define DDADR_BREN      (1 << 1)
+#define DCMD_LEN        0x1fff
+#define DCMD_WIDTH(x)       (1 << ((((x) >> 14) & 3) - 1))
+#define DCMD_SIZE(x)        (4 << (((x) >> 16) & 3))
+#define DCMD_FLYBYT     (1 << 19)
+#define DCMD_FLYBYS     (1 << 20)
+#define DCMD_ENDIRQEN       (1 << 21)
+#define DCMD_STARTIRQEN     (1 << 22)
+#define DCMD_CMPEN      (1 << 25)
+#define DCMD_FLOWTRG        (1 << 28)
+#define DCMD_FLOWSRC        (1 << 29)
+#define DCMD_INCTRGADDR     (1 << 30)
+#define DCMD_INCSRCADDR     (1 << 31)
+#define DCSR_BUSERRINTR     (1 << 0)
+#define DCSR_STARTINTR      (1 << 1)
+#define DCSR_ENDINTR        (1 << 2)
+#define DCSR_STOPINTR       (1 << 3)
+#define DCSR_RASINTR        (1 << 4)
+#define DCSR_REQPEND        (1 << 8)
+#define DCSR_EORINT     (1 << 9)
+#define DCSR_CMPST      (1 << 10)
+#define DCSR_MASKRUN        (1 << 22)
+#define DCSR_RASIRQEN       (1 << 23)
+#define DCSR_CLRCMPST       (1 << 24)
+#define DCSR_SETCMPST       (1 << 25)
+#define DCSR_EORSTOPEN      (1 << 26)
+#define DCSR_EORJMPEN       (1 << 27)
+#define DCSR_EORIRQEN       (1 << 28)
+#define DCSR_STOPIRQEN      (1 << 29)
+#define DCSR_NODESCFETCH    (1 << 30)
+#define DCSR_RUN        (1 << 31)
 
 static inline void pxa2xx_dma_update(PXA2xxDMAState *s, int ch)
 {
diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index a3341d70f1..34e9b6f743 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -80,25 +80,25 @@ static uint64_t omap_gpio_read(void *opaque, hwaddr addr,
     }
 
     switch (offset) {
-    case 0x00:	/* DATA_INPUT */
+    case 0x00:  /* DATA_INPUT */
         return s->inputs & s->pins;
 
-    case 0x04:	/* DATA_OUTPUT */
+    case 0x04:  /* DATA_OUTPUT */
         return s->outputs;
 
-    case 0x08:	/* DIRECTION_CONTROL */
+    case 0x08:  /* DIRECTION_CONTROL */
         return s->dir;
 
-    case 0x0c:	/* INTERRUPT_CONTROL */
+    case 0x0c:  /* INTERRUPT_CONTROL */
         return s->edge;
 
-    case 0x10:	/* INTERRUPT_MASK */
+    case 0x10:  /* INTERRUPT_MASK */
         return s->mask;
 
-    case 0x14:	/* INTERRUPT_STATUS */
+    case 0x14:  /* INTERRUPT_STATUS */
         return s->ints;
 
-    case 0x18:	/* PIN_CONTROL (not in OMAP310) */
+    case 0x18:  /* PIN_CONTROL (not in OMAP310) */
         OMAP_BAD_REG(addr);
         return s->pins;
     }
@@ -121,11 +121,11 @@ static void omap_gpio_write(void *opaque, hwaddr addr,
     }
 
     switch (offset) {
-    case 0x00:	/* DATA_INPUT */
+    case 0x00:  /* DATA_INPUT */
         OMAP_RO_REG(addr);
         return;
 
-    case 0x04:	/* DATA_OUTPUT */
+    case 0x04:  /* DATA_OUTPUT */
         diff = (s->outputs ^ value) & ~s->dir;
         s->outputs = value;
         while ((ln = ctz32(diff)) != 32) {
@@ -135,7 +135,7 @@ static void omap_gpio_write(void *opaque, hwaddr addr,
         }
         break;
 
-    case 0x08:	/* DIRECTION_CONTROL */
+    case 0x08:  /* DIRECTION_CONTROL */
         diff = s->outputs & (s->dir ^ value);
         s->dir = value;
 
@@ -147,21 +147,21 @@ static void omap_gpio_write(void *opaque, hwaddr addr,
         }
         break;
 
-    case 0x0c:	/* INTERRUPT_CONTROL */
+    case 0x0c:  /* INTERRUPT_CONTROL */
         s->edge = value;
         break;
 
-    case 0x10:	/* INTERRUPT_MASK */
+    case 0x10:  /* INTERRUPT_MASK */
         s->mask = value;
         break;
 
-    case 0x14:	/* INTERRUPT_STATUS */
+    case 0x14:  /* INTERRUPT_STATUS */
         s->ints &= ~value;
         if (!s->ints)
             qemu_irq_lower(s->irq);
         break;
 
-    case 0x18:	/* PIN_CONTROL (not in OMAP310 TRM) */
+    case 0x18:  /* PIN_CONTROL (not in OMAP310 TRM) */
         OMAP_BAD_REG(addr);
         s->pins = value;
         break;
@@ -233,9 +233,9 @@ static inline void omap2_gpio_module_int_update(struct omap2_gpio_s *s,
 
 static void omap2_gpio_module_wake(struct omap2_gpio_s *s, int line)
 {
-    if (!(s->config[0] & (1 << 2)))			/* ENAWAKEUP */
+    if (!(s->config[0] & (1 << 2)))         /* ENAWAKEUP */
         return;
-    if (!(s->config[0] & (3 << 3)))			/* Force Idle */
+    if (!(s->config[0] & (3 << 3)))         /* Force Idle */
         return;
     if (!(s->wumask & (1 << line)))
         return;
@@ -312,66 +312,66 @@ static uint32_t omap2_gpio_module_read(void *opaque, hwaddr addr)
     struct omap2_gpio_s *s = opaque;
 
     switch (addr) {
-    case 0x00:	/* GPIO_REVISION */
+    case 0x00:  /* GPIO_REVISION */
         return s->revision;
 
-    case 0x10:	/* GPIO_SYSCONFIG */
+    case 0x10:  /* GPIO_SYSCONFIG */
         return s->config[0];
 
-    case 0x14:	/* GPIO_SYSSTATUS */
+    case 0x14:  /* GPIO_SYSSTATUS */
         return 0x01;
 
-    case 0x18:	/* GPIO_IRQSTATUS1 */
+    case 0x18:  /* GPIO_IRQSTATUS1 */
         return s->ints[0];
 
-    case 0x1c:	/* GPIO_IRQENABLE1 */
-    case 0x60:	/* GPIO_CLEARIRQENABLE1 */
-    case 0x64:	/* GPIO_SETIRQENABLE1 */
+    case 0x1c:  /* GPIO_IRQENABLE1 */
+    case 0x60:  /* GPIO_CLEARIRQENABLE1 */
+    case 0x64:  /* GPIO_SETIRQENABLE1 */
         return s->mask[0];
 
-    case 0x20:	/* GPIO_WAKEUPENABLE */
-    case 0x80:	/* GPIO_CLEARWKUENA */
-    case 0x84:	/* GPIO_SETWKUENA */
+    case 0x20:  /* GPIO_WAKEUPENABLE */
+    case 0x80:  /* GPIO_CLEARWKUENA */
+    case 0x84:  /* GPIO_SETWKUENA */
         return s->wumask;
 
-    case 0x28:	/* GPIO_IRQSTATUS2 */
+    case 0x28:  /* GPIO_IRQSTATUS2 */
         return s->ints[1];
 
-    case 0x2c:	/* GPIO_IRQENABLE2 */
-    case 0x70:	/* GPIO_CLEARIRQENABLE2 */
-    case 0x74:	/* GPIO_SETIREQNEABLE2 */
+    case 0x2c:  /* GPIO_IRQENABLE2 */
+    case 0x70:  /* GPIO_CLEARIRQENABLE2 */
+    case 0x74:  /* GPIO_SETIREQNEABLE2 */
         return s->mask[1];
 
-    case 0x30:	/* GPIO_CTRL */
+    case 0x30:  /* GPIO_CTRL */
         return s->config[1];
 
-    case 0x34:	/* GPIO_OE */
+    case 0x34:  /* GPIO_OE */
         return s->dir;
 
-    case 0x38:	/* GPIO_DATAIN */
+    case 0x38:  /* GPIO_DATAIN */
         return s->inputs;
 
-    case 0x3c:	/* GPIO_DATAOUT */
-    case 0x90:	/* GPIO_CLEARDATAOUT */
-    case 0x94:	/* GPIO_SETDATAOUT */
+    case 0x3c:  /* GPIO_DATAOUT */
+    case 0x90:  /* GPIO_CLEARDATAOUT */
+    case 0x94:  /* GPIO_SETDATAOUT */
         return s->outputs;
 
-    case 0x40:	/* GPIO_LEVELDETECT0 */
+    case 0x40:  /* GPIO_LEVELDETECT0 */
         return s->level[0];
 
-    case 0x44:	/* GPIO_LEVELDETECT1 */
+    case 0x44:  /* GPIO_LEVELDETECT1 */
         return s->level[1];
 
-    case 0x48:	/* GPIO_RISINGDETECT */
+    case 0x48:  /* GPIO_RISINGDETECT */
         return s->edge[0];
 
-    case 0x4c:	/* GPIO_FALLINGDETECT */
+    case 0x4c:  /* GPIO_FALLINGDETECT */
         return s->edge[1];
 
-    case 0x50:	/* GPIO_DEBOUNCENABLE */
+    case 0x50:  /* GPIO_DEBOUNCENABLE */
         return s->debounce;
 
-    case 0x54:	/* GPIO_DEBOUNCINGTIME */
+    case 0x54:  /* GPIO_DEBOUNCINGTIME */
         return s->delay;
     }
 
@@ -387,13 +387,13 @@ static void omap2_gpio_module_write(void *opaque, hwaddr addr,
     int ln;
 
     switch (addr) {
-    case 0x00:	/* GPIO_REVISION */
-    case 0x14:	/* GPIO_SYSSTATUS */
-    case 0x38:	/* GPIO_DATAIN */
+    case 0x00:  /* GPIO_REVISION */
+    case 0x14:  /* GPIO_SYSSTATUS */
+    case 0x38:  /* GPIO_DATAIN */
         OMAP_RO_REG(addr);
         break;
 
-    case 0x10:	/* GPIO_SYSCONFIG */
+    case 0x10:  /* GPIO_SYSCONFIG */
         if (((value >> 3) & 3) == 3) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "%s: Illegal IDLEMODE value: 3\n", __func__);
@@ -403,39 +403,39 @@ static void omap2_gpio_module_write(void *opaque, hwaddr addr,
         s->config[0] = value & 0x1d;
         break;
 
-    case 0x18:	/* GPIO_IRQSTATUS1 */
+    case 0x18:  /* GPIO_IRQSTATUS1 */
         if (s->ints[0] & value) {
             s->ints[0] &= ~value;
             omap2_gpio_module_level_update(s, 0);
         }
         break;
 
-    case 0x1c:	/* GPIO_IRQENABLE1 */
+    case 0x1c:  /* GPIO_IRQENABLE1 */
         s->mask[0] = value;
         omap2_gpio_module_int_update(s, 0);
         break;
 
-    case 0x20:	/* GPIO_WAKEUPENABLE */
+    case 0x20:  /* GPIO_WAKEUPENABLE */
         s->wumask = value;
         break;
 
-    case 0x28:	/* GPIO_IRQSTATUS2 */
+    case 0x28:  /* GPIO_IRQSTATUS2 */
         if (s->ints[1] & value) {
             s->ints[1] &= ~value;
             omap2_gpio_module_level_update(s, 1);
         }
         break;
 
-    case 0x2c:	/* GPIO_IRQENABLE2 */
+    case 0x2c:  /* GPIO_IRQENABLE2 */
         s->mask[1] = value;
         omap2_gpio_module_int_update(s, 1);
         break;
 
-    case 0x30:	/* GPIO_CTRL */
+    case 0x30:  /* GPIO_CTRL */
         s->config[1] = value & 7;
         break;
 
-    case 0x34:	/* GPIO_OE */
+    case 0x34:  /* GPIO_OE */
         diff = s->outputs & (s->dir ^ value);
         s->dir = value;
 
@@ -449,71 +449,71 @@ static void omap2_gpio_module_write(void *opaque, hwaddr addr,
         omap2_gpio_module_level_update(s, 1);
         break;
 
-    case 0x3c:	/* GPIO_DATAOUT */
+    case 0x3c:  /* GPIO_DATAOUT */
         omap2_gpio_module_out_update(s, s->outputs ^ value);
         break;
 
-    case 0x40:	/* GPIO_LEVELDETECT0 */
+    case 0x40:  /* GPIO_LEVELDETECT0 */
         s->level[0] = value;
         omap2_gpio_module_level_update(s, 0);
         omap2_gpio_module_level_update(s, 1);
         break;
 
-    case 0x44:	/* GPIO_LEVELDETECT1 */
+    case 0x44:  /* GPIO_LEVELDETECT1 */
         s->level[1] = value;
         omap2_gpio_module_level_update(s, 0);
         omap2_gpio_module_level_update(s, 1);
         break;
 
-    case 0x48:	/* GPIO_RISINGDETECT */
+    case 0x48:  /* GPIO_RISINGDETECT */
         s->edge[0] = value;
         break;
 
-    case 0x4c:	/* GPIO_FALLINGDETECT */
+    case 0x4c:  /* GPIO_FALLINGDETECT */
         s->edge[1] = value;
         break;
 
-    case 0x50:	/* GPIO_DEBOUNCENABLE */
+    case 0x50:  /* GPIO_DEBOUNCENABLE */
         s->debounce = value;
         break;
 
-    case 0x54:	/* GPIO_DEBOUNCINGTIME */
+    case 0x54:  /* GPIO_DEBOUNCINGTIME */
         s->delay = value;
         break;
 
-    case 0x60:	/* GPIO_CLEARIRQENABLE1 */
+    case 0x60:  /* GPIO_CLEARIRQENABLE1 */
         s->mask[0] &= ~value;
         omap2_gpio_module_int_update(s, 0);
         break;
 
-    case 0x64:	/* GPIO_SETIRQENABLE1 */
+    case 0x64:  /* GPIO_SETIRQENABLE1 */
         s->mask[0] |= value;
         omap2_gpio_module_int_update(s, 0);
         break;
 
-    case 0x70:	/* GPIO_CLEARIRQENABLE2 */
+    case 0x70:  /* GPIO_CLEARIRQENABLE2 */
         s->mask[1] &= ~value;
         omap2_gpio_module_int_update(s, 1);
         break;
 
-    case 0x74:	/* GPIO_SETIREQNEABLE2 */
+    case 0x74:  /* GPIO_SETIREQNEABLE2 */
         s->mask[1] |= value;
         omap2_gpio_module_int_update(s, 1);
         break;
 
-    case 0x80:	/* GPIO_CLEARWKUENA */
+    case 0x80:  /* GPIO_CLEARWKUENA */
         s->wumask &= ~value;
         break;
 
-    case 0x84:	/* GPIO_SETWKUENA */
+    case 0x84:  /* GPIO_SETWKUENA */
         s->wumask |= value;
         break;
 
-    case 0x90:	/* GPIO_CLEARDATAOUT */
+    case 0x90:  /* GPIO_CLEARDATAOUT */
         omap2_gpio_module_out_update(s, s->outputs & value);
         break;
 
-    case 0x94:	/* GPIO_SETDATAOUT */
+    case 0x94:  /* GPIO_SETDATAOUT */
         omap2_gpio_module_out_update(s, ~s->outputs & value);
         break;
 
@@ -541,39 +541,39 @@ static void omap2_gpio_module_writep(void *opaque, hwaddr addr,
     }
 
     switch (addr & ~3) {
-    case 0x00:	/* GPIO_REVISION */
-    case 0x14:	/* GPIO_SYSSTATUS */
-    case 0x38:	/* GPIO_DATAIN */
+    case 0x00:  /* GPIO_REVISION */
+    case 0x14:  /* GPIO_SYSSTATUS */
+    case 0x38:  /* GPIO_DATAIN */
         OMAP_RO_REG(addr);
         break;
 
-    case 0x10:	/* GPIO_SYSCONFIG */
-    case 0x1c:	/* GPIO_IRQENABLE1 */
-    case 0x20:	/* GPIO_WAKEUPENABLE */
-    case 0x2c:	/* GPIO_IRQENABLE2 */
-    case 0x30:	/* GPIO_CTRL */
-    case 0x34:	/* GPIO_OE */
-    case 0x3c:	/* GPIO_DATAOUT */
-    case 0x40:	/* GPIO_LEVELDETECT0 */
-    case 0x44:	/* GPIO_LEVELDETECT1 */
-    case 0x48:	/* GPIO_RISINGDETECT */
-    case 0x4c:	/* GPIO_FALLINGDETECT */
-    case 0x50:	/* GPIO_DEBOUNCENABLE */
-    case 0x54:	/* GPIO_DEBOUNCINGTIME */
+    case 0x10:  /* GPIO_SYSCONFIG */
+    case 0x1c:  /* GPIO_IRQENABLE1 */
+    case 0x20:  /* GPIO_WAKEUPENABLE */
+    case 0x2c:  /* GPIO_IRQENABLE2 */
+    case 0x30:  /* GPIO_CTRL */
+    case 0x34:  /* GPIO_OE */
+    case 0x3c:  /* GPIO_DATAOUT */
+    case 0x40:  /* GPIO_LEVELDETECT0 */
+    case 0x44:  /* GPIO_LEVELDETECT1 */
+    case 0x48:  /* GPIO_RISINGDETECT */
+    case 0x4c:  /* GPIO_FALLINGDETECT */
+    case 0x50:  /* GPIO_DEBOUNCENABLE */
+    case 0x54:  /* GPIO_DEBOUNCINGTIME */
         cur = omap2_gpio_module_read(opaque, addr & ~3) &
                 ~(mask << ((addr & 3) << 3));
 
         /* Fall through.  */
-    case 0x18:	/* GPIO_IRQSTATUS1 */
-    case 0x28:	/* GPIO_IRQSTATUS2 */
-    case 0x60:	/* GPIO_CLEARIRQENABLE1 */
-    case 0x64:	/* GPIO_SETIRQENABLE1 */
-    case 0x70:	/* GPIO_CLEARIRQENABLE2 */
-    case 0x74:	/* GPIO_SETIREQNEABLE2 */
-    case 0x80:	/* GPIO_CLEARWKUENA */
-    case 0x84:	/* GPIO_SETWKUENA */
-    case 0x90:	/* GPIO_CLEARDATAOUT */
-    case 0x94:	/* GPIO_SETDATAOUT */
+    case 0x18:  /* GPIO_IRQSTATUS1 */
+    case 0x28:  /* GPIO_IRQSTATUS2 */
+    case 0x60:  /* GPIO_CLEARIRQENABLE1 */
+    case 0x64:  /* GPIO_SETIRQENABLE1 */
+    case 0x70:  /* GPIO_CLEARIRQENABLE2 */
+    case 0x74:  /* GPIO_SETIREQNEABLE2 */
+    case 0x80:  /* GPIO_CLEARWKUENA */
+    case 0x84:  /* GPIO_SETWKUENA */
+    case 0x90:  /* GPIO_CLEARDATAOUT */
+    case 0x94:  /* GPIO_SETDATAOUT */
         value <<= (addr & 3) << 3;
         omap2_gpio_module_write(opaque, addr, cur | value);
         break;
@@ -616,22 +616,22 @@ static uint64_t omap2_gpif_top_read(void *opaque, hwaddr addr, unsigned size)
     Omap2GpioState *s = opaque;
 
     switch (addr) {
-    case 0x00:	/* IPGENERICOCPSPL_REVISION */
+    case 0x00:  /* IPGENERICOCPSPL_REVISION */
         return 0x18;
 
-    case 0x10:	/* IPGENERICOCPSPL_SYSCONFIG */
+    case 0x10:  /* IPGENERICOCPSPL_SYSCONFIG */
         return s->autoidle;
 
-    case 0x14:	/* IPGENERICOCPSPL_SYSSTATUS */
+    case 0x14:  /* IPGENERICOCPSPL_SYSSTATUS */
         return 0x01;
 
-    case 0x18:	/* IPGENERICOCPSPL_IRQSTATUS */
+    case 0x18:  /* IPGENERICOCPSPL_IRQSTATUS */
         return 0x00;
 
-    case 0x40:	/* IPGENERICOCPSPL_GPO */
+    case 0x40:  /* IPGENERICOCPSPL_GPO */
         return s->gpo;
 
-    case 0x50:	/* IPGENERICOCPSPL_GPI */
+    case 0x50:  /* IPGENERICOCPSPL_GPI */
         return 0x00;
     }
 
@@ -645,20 +645,20 @@ static void omap2_gpif_top_write(void *opaque, hwaddr addr,
     Omap2GpioState *s = opaque;
 
     switch (addr) {
-    case 0x00:	/* IPGENERICOCPSPL_REVISION */
-    case 0x14:	/* IPGENERICOCPSPL_SYSSTATUS */
-    case 0x18:	/* IPGENERICOCPSPL_IRQSTATUS */
-    case 0x50:	/* IPGENERICOCPSPL_GPI */
+    case 0x00:  /* IPGENERICOCPSPL_REVISION */
+    case 0x14:  /* IPGENERICOCPSPL_SYSSTATUS */
+    case 0x18:  /* IPGENERICOCPSPL_IRQSTATUS */
+    case 0x50:  /* IPGENERICOCPSPL_GPI */
         OMAP_RO_REG(addr);
         break;
 
-    case 0x10:	/* IPGENERICOCPSPL_SYSCONFIG */
-        if (value & (1 << 1))					/* SOFTRESET */
+    case 0x10:  /* IPGENERICOCPSPL_SYSCONFIG */
+        if (value & (1 << 1))                   /* SOFTRESET */
             omap2_gpif_reset(DEVICE(s));
         s->autoidle = value & 1;
         break;
 
-    case 0x40:	/* IPGENERICOCPSPL_GPO */
+    case 0x40:  /* IPGENERICOCPSPL_GPO */
         s->gpo = value & 1;
         break;
 
diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
index 7cf52a5041..67307832b8 100644
--- a/hw/gpio/zaurus.c
+++ b/hw/gpio/zaurus.c
@@ -49,17 +49,17 @@ struct ScoopInfo {
     uint16_t isr;
 };
 
-#define SCOOP_MCR	0x00
-#define SCOOP_CDR	0x04
-#define SCOOP_CSR	0x08
-#define SCOOP_CPR	0x0c
-#define SCOOP_CCR	0x10
-#define SCOOP_IRR_IRM	0x14
-#define SCOOP_IMR	0x18
-#define SCOOP_ISR	0x1c
-#define SCOOP_GPCR	0x20
-#define SCOOP_GPWR	0x24
-#define SCOOP_GPRR	0x28
+#define SCOOP_MCR   0x00
+#define SCOOP_CDR   0x04
+#define SCOOP_CSR   0x08
+#define SCOOP_CPR   0x0c
+#define SCOOP_CCR   0x10
+#define SCOOP_IRR_IRM   0x14
+#define SCOOP_IMR   0x18
+#define SCOOP_ISR   0x1c
+#define SCOOP_GPCR  0x20
+#define SCOOP_GPWR  0x24
+#define SCOOP_GPRR  0x28
 
 static inline void scoop_gpio_handler_update(ScoopInfo *s) {
     uint32_t level, diff;
@@ -145,7 +145,7 @@ static void scoop_write(void *opaque, hwaddr addr,
         scoop_gpio_handler_update(s);
         break;
     case SCOOP_GPWR:
-    case SCOOP_GPRR:	/* GPRR is probably R/O in real HW */
+    case SCOOP_GPRR:    /* GPRR is probably R/O in real HW */
         s->gpio_level = value & s->gpio_dir;
         scoop_gpio_handler_update(s);
         break;
@@ -265,7 +265,7 @@ type_init(scoop_register_types)
 
 /* Write the bootloader parameters memory area.  */
 
-#define MAGIC_CHG(a, b, c, d)	((d << 24) | (c << 16) | (b << 8) | a)
+#define MAGIC_CHG(a, b, c, d)   ((d << 24) | (c << 16) | (b << 8) | a)
 
 static struct QEMU_PACKED sl_param_info {
     uint32_t comadj_keyword;
@@ -286,16 +286,16 @@ static struct QEMU_PACKED sl_param_info {
     uint32_t phad_keyword;
     int32_t phadadj;
 } zaurus_bootparam = {
-    .comadj_keyword	= MAGIC_CHG('C', 'M', 'A', 'D'),
-    .comadj		= 125,
-    .uuid_keyword	= MAGIC_CHG('U', 'U', 'I', 'D'),
-    .uuid		= { -1 },
-    .touch_keyword	= MAGIC_CHG('T', 'U', 'C', 'H'),
-    .touch_xp		= -1,
-    .adadj_keyword	= MAGIC_CHG('B', 'V', 'A', 'D'),
-    .adadj		= -1,
-    .phad_keyword	= MAGIC_CHG('P', 'H', 'A', 'D'),
-    .phadadj		= 0x01,
+    .comadj_keyword = MAGIC_CHG('C', 'M', 'A', 'D'),
+    .comadj     = 125,
+    .uuid_keyword   = MAGIC_CHG('U', 'U', 'I', 'D'),
+    .uuid       = { -1 },
+    .touch_keyword  = MAGIC_CHG('T', 'U', 'C', 'H'),
+    .touch_xp       = -1,
+    .adadj_keyword  = MAGIC_CHG('B', 'V', 'A', 'D'),
+    .adadj      = -1,
+    .phad_keyword   = MAGIC_CHG('P', 'H', 'A', 'D'),
+    .phadadj        = 0x01,
 };
 
 void sl_bootparam_write(hwaddr ptr)
diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
index e5d205dda5..7c7cb455bc 100644
--- a/hw/i2c/omap_i2c.c
+++ b/hw/i2c/omap_i2c.c
@@ -55,16 +55,16 @@ struct OMAPI2CState {
     uint16_t test;
 };
 
-#define OMAP2_INTR_REV	0x34
-#define OMAP2_GC_REV	0x34
+#define OMAP2_INTR_REV  0x34
+#define OMAP2_GC_REV    0x34
 
 static void omap_i2c_interrupts_update(OMAPI2CState *s)
 {
     qemu_set_irq(s->irq, s->stat & s->mask);
-    if ((s->dma >> 15) & 1)					/* RDMA_EN */
-        qemu_set_irq(s->drq[0], (s->stat >> 3) & 1);		/* RRDY */
-    if ((s->dma >> 7) & 1)					/* XDMA_EN */
-        qemu_set_irq(s->drq[1], (s->stat >> 4) & 1);		/* XRDY */
+    if ((s->dma >> 15) & 1)                 /* RDMA_EN */
+        qemu_set_irq(s->drq[0], (s->stat >> 3) & 1);        /* RRDY */
+    if ((s->dma >> 7) & 1)                  /* XDMA_EN */
+        qemu_set_irq(s->drq[1], (s->stat >> 4) & 1);        /* XRDY */
 }
 
 static void omap_i2c_fifo_run(OMAPI2CState *s)
@@ -74,25 +74,25 @@ static void omap_i2c_fifo_run(OMAPI2CState *s)
     if (!i2c_bus_busy(s->bus))
         return;
 
-    if ((s->control >> 2) & 1) {				/* RM */
-        if ((s->control >> 1) & 1) {				/* STP */
+    if ((s->control >> 2) & 1) {                /* RM */
+        if ((s->control >> 1) & 1) {                /* STP */
             i2c_end_transfer(s->bus);
-            s->control &= ~(1 << 1);				/* STP */
+            s->control &= ~(1 << 1);                /* STP */
             s->count_cur = s->count;
             s->txlen = 0;
-        } else if ((s->control >> 9) & 1) {			/* TRX */
+        } else if ((s->control >> 9) & 1) {         /* TRX */
             while (ack && s->txlen)
                 ack = (i2c_send(s->bus,
                                         (s->fifo >> ((-- s->txlen) << 3)) &
                                         0xff) >= 0);
-            s->stat |= 1 << 4;					/* XRDY */
+            s->stat |= 1 << 4;                  /* XRDY */
         } else {
             while (s->rxlen < 4)
                 s->fifo |= i2c_recv(s->bus) << ((s->rxlen ++) << 3);
-            s->stat |= 1 << 3;					/* RRDY */
+            s->stat |= 1 << 3;                  /* RRDY */
         }
     } else {
-        if ((s->control >> 9) & 1) {				/* TRX */
+        if ((s->control >> 9) & 1) {                /* TRX */
             while (ack && s->count_cur && s->txlen) {
                 ack = (i2c_send(s->bus,
                                         (s->fifo >> ((-- s->txlen) << 3)) &
@@ -100,12 +100,12 @@ static void omap_i2c_fifo_run(OMAPI2CState *s)
                 s->count_cur --;
             }
             if (ack && s->count_cur)
-                s->stat |= 1 << 4;				/* XRDY */
+                s->stat |= 1 << 4;              /* XRDY */
             else
-                s->stat &= ~(1 << 4);				/* XRDY */
+                s->stat &= ~(1 << 4);               /* XRDY */
             if (!s->count_cur) {
-                s->stat |= 1 << 2;				/* ARDY */
-                s->control &= ~(1 << 10);			/* MST */
+                s->stat |= 1 << 2;              /* ARDY */
+                s->control &= ~(1 << 10);           /* MST */
             }
         } else {
             while (s->count_cur && s->rxlen < 4) {
@@ -113,26 +113,26 @@ static void omap_i2c_fifo_run(OMAPI2CState *s)
                 s->count_cur --;
             }
             if (s->rxlen)
-                s->stat |= 1 << 3;				/* RRDY */
+                s->stat |= 1 << 3;              /* RRDY */
             else
-                s->stat &= ~(1 << 3);				/* RRDY */
+                s->stat &= ~(1 << 3);               /* RRDY */
         }
         if (!s->count_cur) {
-            if ((s->control >> 1) & 1) {			/* STP */
+            if ((s->control >> 1) & 1) {            /* STP */
                 i2c_end_transfer(s->bus);
-                s->control &= ~(1 << 1);			/* STP */
+                s->control &= ~(1 << 1);            /* STP */
                 s->count_cur = s->count;
                 s->txlen = 0;
             } else {
-                s->stat |= 1 << 2;				/* ARDY */
-                s->control &= ~(1 << 10);			/* MST */
+                s->stat |= 1 << 2;              /* ARDY */
+                s->control &= ~(1 << 10);           /* MST */
             }
         }
     }
 
-    s->stat |= (!ack) << 1;					/* NACK */
+    s->stat |= (!ack) << 1;                 /* NACK */
     if (!ack)
-        s->control &= ~(1 << 1);				/* STP */
+        s->control &= ~(1 << 1);                /* STP */
 }
 
 static void omap_i2c_reset(DeviceState *dev)
@@ -163,16 +163,16 @@ static uint32_t omap_i2c_read(void *opaque, hwaddr addr)
     uint16_t ret;
 
     switch (offset) {
-    case 0x00:	/* I2C_REV */
-        return s->revision;					/* REV */
+    case 0x00:  /* I2C_REV */
+        return s->revision;                 /* REV */
 
-    case 0x04:	/* I2C_IE */
+    case 0x04:  /* I2C_IE */
         return s->mask;
 
-    case 0x08:	/* I2C_STAT */
+    case 0x08:  /* I2C_STAT */
         return s->stat | (i2c_bus_busy(s->bus) << 12);
 
-    case 0x0c:	/* I2C_IV */
+    case 0x0c:  /* I2C_IV */
         if (s->revision >= OMAP2_INTR_REV)
             break;
         ret = ctz32(s->stat & s->mask);
@@ -185,18 +185,18 @@ static uint32_t omap_i2c_read(void *opaque, hwaddr addr)
         omap_i2c_interrupts_update(s);
         return ret;
 
-    case 0x10:	/* I2C_SYSS */
-        return (s->control >> 15) & 1;				/* I2C_EN */
+    case 0x10:  /* I2C_SYSS */
+        return (s->control >> 15) & 1;              /* I2C_EN */
 
-    case 0x14:	/* I2C_BUF */
+    case 0x14:  /* I2C_BUF */
         return s->dma;
 
-    case 0x18:	/* I2C_CNT */
-        return s->count_cur;					/* DCOUNT */
+    case 0x18:  /* I2C_CNT */
+        return s->count_cur;                    /* DCOUNT */
 
-    case 0x1c:	/* I2C_DATA */
+    case 0x1c:  /* I2C_DATA */
         ret = 0;
-        if (s->control & (1 << 14)) {				/* BE */
+        if (s->control & (1 << 14)) {               /* BE */
             ret |= ((s->fifo >> 0) & 0xff) << 8;
             ret |= ((s->fifo >> 8) & 0xff) << 0;
         } else {
@@ -204,7 +204,7 @@ static uint32_t omap_i2c_read(void *opaque, hwaddr addr)
             ret |= ((s->fifo >> 0) & 0xff) << 0;
         }
         if (s->rxlen == 1) {
-            s->stat |= 1 << 15;					/* SBD */
+            s->stat |= 1 << 15;                 /* SBD */
             s->rxlen = 0;
         } else if (s->rxlen > 1) {
             if (s->rxlen > 2)
@@ -214,41 +214,41 @@ static uint32_t omap_i2c_read(void *opaque, hwaddr addr)
             /* XXX: remote access (qualifier) error - what's that?  */
         }
         if (!s->rxlen) {
-            s->stat &= ~(1 << 3);				/* RRDY */
-            if (((s->control >> 10) & 1) &&			/* MST */
-                            ((~s->control >> 9) & 1)) {		/* TRX */
-                s->stat |= 1 << 2;				/* ARDY */
-                s->control &= ~(1 << 10);			/* MST */
+            s->stat &= ~(1 << 3);               /* RRDY */
+            if (((s->control >> 10) & 1) &&         /* MST */
+                            ((~s->control >> 9) & 1)) {     /* TRX */
+                s->stat |= 1 << 2;              /* ARDY */
+                s->control &= ~(1 << 10);           /* MST */
             }
         }
-        s->stat &= ~(1 << 11);					/* ROVR */
+        s->stat &= ~(1 << 11);                  /* ROVR */
         omap_i2c_fifo_run(s);
         omap_i2c_interrupts_update(s);
         return ret;
 
-    case 0x20:	/* I2C_SYSC */
+    case 0x20:  /* I2C_SYSC */
         return 0;
 
-    case 0x24:	/* I2C_CON */
+    case 0x24:  /* I2C_CON */
         return s->control;
 
-    case 0x28:	/* I2C_OA */
+    case 0x28:  /* I2C_OA */
         return s->addr[0];
 
-    case 0x2c:	/* I2C_SA */
+    case 0x2c:  /* I2C_SA */
         return s->addr[1];
 
-    case 0x30:	/* I2C_PSC */
+    case 0x30:  /* I2C_PSC */
         return s->divider;
 
-    case 0x34:	/* I2C_SCLL */
+    case 0x34:  /* I2C_SCLL */
         return s->times[0];
 
-    case 0x38:	/* I2C_SCLH */
+    case 0x38:  /* I2C_SCLH */
         return s->times[1];
 
-    case 0x3c:	/* I2C_SYSTEST */
-        if (s->test & (1 << 15)) {				/* ST_EN */
+    case 0x3c:  /* I2C_SYSTEST */
+        if (s->test & (1 << 15)) {              /* ST_EN */
             s->test ^= 0xa;
             return s->test;
         } else
@@ -267,17 +267,17 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
     int nack;
 
     switch (offset) {
-    case 0x00:	/* I2C_REV */
-    case 0x0c:	/* I2C_IV */
-    case 0x10:	/* I2C_SYSS */
+    case 0x00:  /* I2C_REV */
+    case 0x0c:  /* I2C_IV */
+    case 0x10:  /* I2C_SYSS */
         OMAP_RO_REG(addr);
         return;
 
-    case 0x04:	/* I2C_IE */
+    case 0x04:  /* I2C_IE */
         s->mask = value & (s->revision < OMAP2_GC_REV ? 0x1f : 0x3f);
         break;
 
-    case 0x08:	/* I2C_STAT */
+    case 0x08:  /* I2C_STAT */
         if (s->revision < OMAP2_INTR_REV) {
             OMAP_RO_REG(addr);
             return;
@@ -288,40 +288,40 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
         omap_i2c_interrupts_update(s);
         break;
 
-    case 0x14:	/* I2C_BUF */
+    case 0x14:  /* I2C_BUF */
         s->dma = value & 0x8080;
-        if (value & (1 << 15))					/* RDMA_EN */
-            s->mask &= ~(1 << 3);				/* RRDY_IE */
-        if (value & (1 << 7))					/* XDMA_EN */
-            s->mask &= ~(1 << 4);				/* XRDY_IE */
+        if (value & (1 << 15))                  /* RDMA_EN */
+            s->mask &= ~(1 << 3);               /* RRDY_IE */
+        if (value & (1 << 7))                   /* XDMA_EN */
+            s->mask &= ~(1 << 4);               /* XRDY_IE */
         break;
 
-    case 0x18:	/* I2C_CNT */
-        s->count = value;					/* DCOUNT */
+    case 0x18:  /* I2C_CNT */
+        s->count = value;                   /* DCOUNT */
         break;
 
-    case 0x1c:	/* I2C_DATA */
+    case 0x1c:  /* I2C_DATA */
         if (s->txlen > 2) {
             /* XXX: remote access (qualifier) error - what's that?  */
             break;
         }
         s->fifo <<= 16;
         s->txlen += 2;
-        if (s->control & (1 << 14)) {				/* BE */
+        if (s->control & (1 << 14)) {               /* BE */
             s->fifo |= ((value >> 8) & 0xff) << 8;
             s->fifo |= ((value >> 0) & 0xff) << 0;
         } else {
             s->fifo |= ((value >> 0) & 0xff) << 8;
             s->fifo |= ((value >> 8) & 0xff) << 0;
         }
-        s->stat &= ~(1 << 10);					/* XUDF */
+        s->stat &= ~(1 << 10);                  /* XUDF */
         if (s->txlen > 2)
-            s->stat &= ~(1 << 4);				/* XRDY */
+            s->stat &= ~(1 << 4);               /* XRDY */
         omap_i2c_fifo_run(s);
         omap_i2c_interrupts_update(s);
         break;
 
-    case 0x20:	/* I2C_SYSC */
+    case 0x20:  /* I2C_SYSC */
         if (s->revision < OMAP2_INTR_REV) {
             OMAP_BAD_REG(addr);
             return;
@@ -332,9 +332,9 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
         }
         break;
 
-    case 0x24:	/* I2C_CON */
+    case 0x24:  /* I2C_CON */
         s->control = value & 0xcf87;
-        if (~value & (1 << 15)) {				/* I2C_EN */
+        if (~value & (1 << 15)) {               /* I2C_EN */
             if (s->revision < OMAP2_INTR_REV) {
                 omap_i2c_reset(DEVICE(s));
             }
@@ -351,14 +351,14 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
                           __func__);
             break;
         }
-        if ((value & (1 << 15)) && value & (1 << 0)) {		/* STT */
-            nack = !!i2c_start_transfer(s->bus, s->addr[1],	/* SA */
-                            (~value >> 9) & 1);			/* TRX */
-            s->stat |= nack << 1;				/* NACK */
-            s->control &= ~(1 << 0);				/* STT */
+        if ((value & (1 << 15)) && value & (1 << 0)) {      /* STT */
+            nack = !!i2c_start_transfer(s->bus, s->addr[1], /* SA */
+                            (~value >> 9) & 1);         /* TRX */
+            s->stat |= nack << 1;               /* NACK */
+            s->control &= ~(1 << 0);                /* STT */
             s->fifo = 0;
             if (nack)
-                s->control &= ~(1 << 1);			/* STP */
+                s->control &= ~(1 << 1);            /* STP */
             else {
                 s->count_cur = s->count;
                 omap_i2c_fifo_run(s);
@@ -367,29 +367,29 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
         }
         break;
 
-    case 0x28:	/* I2C_OA */
+    case 0x28:  /* I2C_OA */
         s->addr[0] = value & 0x3ff;
         break;
 
-    case 0x2c:	/* I2C_SA */
+    case 0x2c:  /* I2C_SA */
         s->addr[1] = value & 0x3ff;
         break;
 
-    case 0x30:	/* I2C_PSC */
+    case 0x30:  /* I2C_PSC */
         s->divider = value;
         break;
 
-    case 0x34:	/* I2C_SCLL */
+    case 0x34:  /* I2C_SCLL */
         s->times[0] = value;
         break;
 
-    case 0x38:	/* I2C_SCLH */
+    case 0x38:  /* I2C_SCLH */
         s->times[1] = value;
         break;
 
-    case 0x3c:	/* I2C_SYSTEST */
+    case 0x3c:  /* I2C_SYSTEST */
         s->test = value & 0xf80f;
-        if (value & (1 << 11))					/* SBB */
+        if (value & (1 << 11))                  /* SBB */
             if (s->revision >= OMAP2_INTR_REV) {
                 s->stat |= 0x3f;
                 omap_i2c_interrupts_update(s);
@@ -413,7 +413,7 @@ static void omap_i2c_writeb(void *opaque, hwaddr addr,
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     switch (offset) {
-    case 0x1c:	/* I2C_DATA */
+    case 0x1c:  /* I2C_DATA */
         if (s->txlen > 2) {
             /* XXX: remote access (qualifier) error - what's that?  */
             break;
@@ -421,9 +421,9 @@ static void omap_i2c_writeb(void *opaque, hwaddr addr,
         s->fifo <<= 8;
         s->txlen += 1;
         s->fifo |= value & 0xff;
-        s->stat &= ~(1 << 10);					/* XUDF */
+        s->stat &= ~(1 << 10);                  /* XUDF */
         if (s->txlen > 2)
-            s->stat &= ~(1 << 4);				/* XRDY */
+            s->stat &= ~(1 << 4);               /* XRDY */
         omap_i2c_fifo_run(s);
         omap_i2c_interrupts_update(s);
         break;
diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
index 19a646d9bb..ed133df2e4 100644
--- a/hw/input/lm832x.c
+++ b/hw/input/lm832x.c
@@ -75,15 +75,15 @@ struct LM823KbdState {
     } pwm;
 };
 
-#define INT_KEYPAD		(1 << 0)
-#define INT_ERROR		(1 << 3)
-#define INT_NOINIT		(1 << 4)
-#define INT_PWMEND(n)		(1 << (5 + n))
+#define INT_KEYPAD      (1 << 0)
+#define INT_ERROR       (1 << 3)
+#define INT_NOINIT      (1 << 4)
+#define INT_PWMEND(n)       (1 << (5 + n))
 
-#define ERR_BADPAR		(1 << 0)
-#define ERR_CMDUNK		(1 << 1)
-#define ERR_KEYOVR		(1 << 2)
-#define ERR_FIFOOVR		(1 << 6)
+#define ERR_BADPAR      (1 << 0)
+#define ERR_CMDUNK      (1 << 1)
+#define ERR_KEYOVR      (1 << 2)
+#define ERR_FIFOOVR     (1 << 6)
 
 static void lm_kbd_irq_update(LM823KbdState *s)
 {
@@ -139,36 +139,36 @@ static void lm_kbd_pwm2_tick(void *opaque)
 }
 
 enum {
-    LM832x_CMD_READ_ID		= 0x80, /* Read chip ID. */
-    LM832x_CMD_WRITE_CFG	= 0x81, /* Set configuration item. */
-    LM832x_CMD_READ_INT		= 0x82, /* Get interrupt status. */
-    LM832x_CMD_RESET		= 0x83, /* Reset, same as external one */
-    LM823x_CMD_WRITE_PULL_DOWN	= 0x84, /* Select GPIO pull-up/down. */
-    LM832x_CMD_WRITE_PORT_SEL	= 0x85, /* Select GPIO in/out. */
-    LM832x_CMD_WRITE_PORT_STATE	= 0x86, /* Set GPIO pull-up/down. */
-    LM832x_CMD_READ_PORT_SEL	= 0x87, /* Get GPIO in/out. */
-    LM832x_CMD_READ_PORT_STATE	= 0x88, /* Get GPIO pull-up/down. */
-    LM832x_CMD_READ_FIFO	= 0x89, /* Read byte from FIFO. */
-    LM832x_CMD_RPT_READ_FIFO	= 0x8a, /* Read FIFO (no increment). */
-    LM832x_CMD_SET_ACTIVE	= 0x8b, /* Set active time. */
-    LM832x_CMD_READ_ERROR	= 0x8c, /* Get error status. */
-    LM832x_CMD_READ_ROTATOR	= 0x8e, /* Read rotator status. */
-    LM832x_CMD_SET_DEBOUNCE	= 0x8f, /* Set debouncing time. */
-    LM832x_CMD_SET_KEY_SIZE	= 0x90, /* Set keypad size. */
-    LM832x_CMD_READ_KEY_SIZE	= 0x91, /* Get keypad size. */
-    LM832x_CMD_READ_CFG		= 0x92, /* Get configuration item. */
-    LM832x_CMD_WRITE_CLOCK	= 0x93, /* Set clock config. */
-    LM832x_CMD_READ_CLOCK	= 0x94, /* Get clock config. */
-    LM832x_CMD_PWM_WRITE	= 0x95, /* Write PWM script. */
-    LM832x_CMD_PWM_START	= 0x96, /* Start PWM engine. */
-    LM832x_CMD_PWM_STOP		= 0x97, /* Stop PWM engine. */
-    LM832x_GENERAL_ERROR	= 0xff, /* There was one error.
+    LM832x_CMD_READ_ID      = 0x80, /* Read chip ID. */
+    LM832x_CMD_WRITE_CFG    = 0x81, /* Set configuration item. */
+    LM832x_CMD_READ_INT     = 0x82, /* Get interrupt status. */
+    LM832x_CMD_RESET        = 0x83, /* Reset, same as external one */
+    LM823x_CMD_WRITE_PULL_DOWN  = 0x84, /* Select GPIO pull-up/down. */
+    LM832x_CMD_WRITE_PORT_SEL   = 0x85, /* Select GPIO in/out. */
+    LM832x_CMD_WRITE_PORT_STATE = 0x86, /* Set GPIO pull-up/down. */
+    LM832x_CMD_READ_PORT_SEL    = 0x87, /* Get GPIO in/out. */
+    LM832x_CMD_READ_PORT_STATE  = 0x88, /* Get GPIO pull-up/down. */
+    LM832x_CMD_READ_FIFO    = 0x89, /* Read byte from FIFO. */
+    LM832x_CMD_RPT_READ_FIFO    = 0x8a, /* Read FIFO (no increment). */
+    LM832x_CMD_SET_ACTIVE   = 0x8b, /* Set active time. */
+    LM832x_CMD_READ_ERROR   = 0x8c, /* Get error status. */
+    LM832x_CMD_READ_ROTATOR = 0x8e, /* Read rotator status. */
+    LM832x_CMD_SET_DEBOUNCE = 0x8f, /* Set debouncing time. */
+    LM832x_CMD_SET_KEY_SIZE = 0x90, /* Set keypad size. */
+    LM832x_CMD_READ_KEY_SIZE    = 0x91, /* Get keypad size. */
+    LM832x_CMD_READ_CFG     = 0x92, /* Get configuration item. */
+    LM832x_CMD_WRITE_CLOCK  = 0x93, /* Set clock config. */
+    LM832x_CMD_READ_CLOCK   = 0x94, /* Get clock config. */
+    LM832x_CMD_PWM_WRITE    = 0x95, /* Write PWM script. */
+    LM832x_CMD_PWM_START    = 0x96, /* Start PWM engine. */
+    LM832x_CMD_PWM_STOP     = 0x97, /* Stop PWM engine. */
+    LM832x_GENERAL_ERROR    = 0xff, /* There was one error.
                                            Previously was represented by -1
                                            This is not a command */
 };
 
-#define LM832x_MAX_KPX		8
-#define LM832x_MAX_KPY		12
+#define LM832x_MAX_KPX      8
+#define LM832x_MAX_KPY      12
 
 static uint8_t lm_kbd_read(LM823KbdState *s, int reg, int byte)
 {
@@ -257,9 +257,9 @@ static void lm_kbd_write(LM823KbdState *s, int reg, int byte, uint8_t value)
     case LM832x_CMD_WRITE_CFG:
         s->config = value;
         /* This must be done whenever s->mux.in is updated (never).  */
-        if ((s->config >> 1) & 1)			/* MUX1EN */
+        if ((s->config >> 1) & 1)           /* MUX1EN */
             qemu_set_irq(s->mux.out[0], s->mux.in[0][(s->config >> 0) & 1]);
-        if ((s->config >> 3) & 1)			/* MUX2EN */
+        if ((s->config >> 3) & 1)           /* MUX2EN */
             qemu_set_irq(s->mux.out[0], s->mux.in[0][(s->config >> 2) & 1]);
         /* TODO: check that this is issued only following the chip reset
          * and not in the middle of operation and that it is followed by
diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 555b677173..b8a9a85928 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -28,10 +28,10 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 
-#define TSC_CUT_RESOLUTION(value, p)	((value) >> (16 - (p ? 12 : 10)))
+#define TSC_CUT_RESOLUTION(value, p)    ((value) >> (16 - (p ? 12 : 10)))
 
 typedef struct {
-    qemu_irq pint;	/* Combination of the nPENIRQ and DAV signals */
+    qemu_irq pint;  /* Combination of the nPENIRQ and DAV signals */
     QEMUTimer *timer;
     uint16_t model;
 
@@ -63,7 +63,7 @@ typedef struct {
 } TSC2005State;
 
 enum {
-    TSC_MODE_XYZ_SCAN	= 0x0,
+    TSC_MODE_XYZ_SCAN   = 0x0,
     TSC_MODE_XY_SCAN,
     TSC_MODE_X,
     TSC_MODE_Y,
@@ -82,100 +82,100 @@ enum {
 };
 
 static const uint16_t mode_regs[16] = {
-    0xf000,	/* X, Y, Z scan */
-    0xc000,	/* X, Y scan */
-    0x8000,	/* X */
-    0x4000,	/* Y */
-    0x3000,	/* Z */
-    0x0800,	/* AUX */
-    0x0400,	/* TEMP1 */
-    0x0200,	/* TEMP2 */
-    0x0800,	/* AUX scan */
-    0x0040,	/* X test */
-    0x0020,	/* Y test */
-    0x0080,	/* Short-circuit test */
-    0x0000,	/* Reserved */
-    0x0000,	/* X+, X- drivers */
-    0x0000,	/* Y+, Y- drivers */
-    0x0000,	/* Y+, X- drivers */
+    0xf000, /* X, Y, Z scan */
+    0xc000, /* X, Y scan */
+    0x8000, /* X */
+    0x4000, /* Y */
+    0x3000, /* Z */
+    0x0800, /* AUX */
+    0x0400, /* TEMP1 */
+    0x0200, /* TEMP2 */
+    0x0800, /* AUX scan */
+    0x0040, /* X test */
+    0x0020, /* Y test */
+    0x0080, /* Short-circuit test */
+    0x0000, /* Reserved */
+    0x0000, /* X+, X- drivers */
+    0x0000, /* Y+, Y- drivers */
+    0x0000, /* Y+, X- drivers */
 };
 
-#define X_TRANSFORM(s)			\
+#define X_TRANSFORM(s)          \
     ((s->y * s->tr[0] - s->x * s->tr[1]) / s->tr[2] + s->tr[3])
-#define Y_TRANSFORM(s)			\
+#define Y_TRANSFORM(s)          \
     ((s->y * s->tr[4] - s->x * s->tr[5]) / s->tr[6] + s->tr[7])
-#define Z1_TRANSFORM(s)			\
+#define Z1_TRANSFORM(s)         \
     ((400 - ((s)->x >> 7) + ((s)->pressure << 10)) << 4)
-#define Z2_TRANSFORM(s)			\
+#define Z2_TRANSFORM(s)         \
     ((4000 + ((s)->y >> 7) - ((s)->pressure << 10)) << 4)
 
-#define AUX_VAL				(700 << 4)	/* +/- 3 at 12-bit */
-#define TEMP1_VAL			(1264 << 4)	/* +/- 5 at 12-bit */
-#define TEMP2_VAL			(1531 << 4)	/* +/- 5 at 12-bit */
+#define AUX_VAL             (700 << 4)  /* +/- 3 at 12-bit */
+#define TEMP1_VAL           (1264 << 4) /* +/- 5 at 12-bit */
+#define TEMP2_VAL           (1531 << 4) /* +/- 5 at 12-bit */
 
 static uint16_t tsc2005_read(TSC2005State *s, int reg)
 {
     uint16_t ret;
 
     switch (reg) {
-    case 0x0:	/* X */
+    case 0x0:   /* X */
         s->dav &= ~mode_regs[TSC_MODE_X];
         return TSC_CUT_RESOLUTION(X_TRANSFORM(s), s->precision) +
                 (s->noise & 3);
-    case 0x1:	/* Y */
+    case 0x1:   /* Y */
         s->dav &= ~mode_regs[TSC_MODE_Y];
         s->noise ++;
         return TSC_CUT_RESOLUTION(Y_TRANSFORM(s), s->precision) ^
                 (s->noise & 3);
-    case 0x2:	/* Z1 */
+    case 0x2:   /* Z1 */
         s->dav &= 0xdfff;
         return TSC_CUT_RESOLUTION(Z1_TRANSFORM(s), s->precision) -
                 (s->noise & 3);
-    case 0x3:	/* Z2 */
+    case 0x3:   /* Z2 */
         s->dav &= 0xefff;
         return TSC_CUT_RESOLUTION(Z2_TRANSFORM(s), s->precision) |
                 (s->noise & 3);
 
-    case 0x4:	/* AUX */
+    case 0x4:   /* AUX */
         s->dav &= ~mode_regs[TSC_MODE_AUX];
         return TSC_CUT_RESOLUTION(AUX_VAL, s->precision);
 
-    case 0x5:	/* TEMP1 */
+    case 0x5:   /* TEMP1 */
         s->dav &= ~mode_regs[TSC_MODE_TEMP1];
         return TSC_CUT_RESOLUTION(TEMP1_VAL, s->precision) -
                 (s->noise & 5);
-    case 0x6:	/* TEMP2 */
+    case 0x6:   /* TEMP2 */
         s->dav &= 0xdfff;
         s->dav &= ~mode_regs[TSC_MODE_TEMP2];
         return TSC_CUT_RESOLUTION(TEMP2_VAL, s->precision) ^
                 (s->noise & 3);
 
-    case 0x7:	/* Status */
+    case 0x7:   /* Status */
         ret = s->dav | (s->reset << 7) | (s->pdst << 2) | 0x0;
         s->dav &= ~(mode_regs[TSC_MODE_X_TEST] | mode_regs[TSC_MODE_Y_TEST] |
                         mode_regs[TSC_MODE_TS_TEST]);
         s->reset = true;
         return ret;
 
-    case 0x8:	/* AUX high treshold */
+    case 0x8:   /* AUX high treshold */
         return s->aux_thr[1];
-    case 0x9:	/* AUX low treshold */
+    case 0x9:   /* AUX low treshold */
         return s->aux_thr[0];
 
-    case 0xa:	/* TEMP high treshold */
+    case 0xa:   /* TEMP high treshold */
         return s->temp_thr[1];
-    case 0xb:	/* TEMP low treshold */
+    case 0xb:   /* TEMP low treshold */
         return s->temp_thr[0];
 
-    case 0xc:	/* CFR0 */
+    case 0xc:   /* CFR0 */
         return (s->pressure << 15) | ((!s->busy) << 14) |
                 (s->nextprecision << 13) | s->timing[0]; 
-    case 0xd:	/* CFR1 */
+    case 0xd:   /* CFR1 */
         return s->timing[1];
-    case 0xe:	/* CFR2 */
+    case 0xe:   /* CFR2 */
         return (s->pin_func << 14) | s->filter;
 
-    case 0xf:	/* Function select status */
+    case 0xf:   /* Function select status */
         return s->function >= 0 ? 1 << s->function : 0;
     }
 
@@ -186,21 +186,21 @@ static uint16_t tsc2005_read(TSC2005State *s, int reg)
 static void tsc2005_write(TSC2005State *s, int reg, uint16_t data)
 {
     switch (reg) {
-    case 0x8:	/* AUX high treshold */
+    case 0x8:   /* AUX high treshold */
         s->aux_thr[1] = data;
         break;
-    case 0x9:	/* AUX low treshold */
+    case 0x9:   /* AUX low treshold */
         s->aux_thr[0] = data;
         break;
 
-    case 0xa:	/* TEMP high treshold */
+    case 0xa:   /* TEMP high treshold */
         s->temp_thr[1] = data;
         break;
-    case 0xb:	/* TEMP low treshold */
+    case 0xb:   /* TEMP low treshold */
         s->temp_thr[0] = data;
         break;
 
-    case 0xc:	/* CFR0 */
+    case 0xc:   /* CFR0 */
         s->host_mode = (data >> 15) != 0;
         if (s->enabled != !(data & 0x4000)) {
             s->enabled = !(data & 0x4000);
@@ -216,10 +216,10 @@ static void tsc2005_write(TSC2005State *s, int reg, uint16_t data)
                           "tsc2005_write: illegal conversion clock setting\n");
         }
         break;
-    case 0xd:	/* CFR1 */
+    case 0xd:   /* CFR1 */
         s->timing[1] = data & 0xf07;
         break;
-    case 0xe:	/* CFR2 */
+    case 0xe:   /* CFR2 */
         s->pin_func = (data >> 14) & 3;
         s->filter = data & 0x3fff;
         break;
@@ -296,7 +296,7 @@ static void tsc2005_pin_update(TSC2005State *s)
     s->busy = true;
     s->precision = s->nextprecision;
     s->function = s->nextfunction;
-    s->pdst = !s->pnd0;	/* Synchronised on internal clock */
+    s->pdst = !s->pnd0; /* Synchronised on internal clock */
     expires = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
         (NANOSECONDS_PER_SECOND >> 7);
     timer_mod(s->timer, expires);
diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index 7eae5989f7..c975831876 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -31,13 +31,13 @@
 #include "hw/irq.h"
 #include "migration/vmstate.h"
 
-#define TSC_DATA_REGISTERS_PAGE		0x0
-#define TSC_CONTROL_REGISTERS_PAGE	0x1
-#define TSC_AUDIO_REGISTERS_PAGE	0x2
+#define TSC_DATA_REGISTERS_PAGE     0x0
+#define TSC_CONTROL_REGISTERS_PAGE  0x1
+#define TSC_AUDIO_REGISTERS_PAGE    0x2
 
 #define TSC_VERBOSE
 
-#define TSC_CUT_RESOLUTION(value, p)	((value) >> (16 - resolution[p]))
+#define TSC_CUT_RESOLUTION(value, p)    ((value) >> (16 - resolution[p]))
 
 typedef struct {
     qemu_irq pint;
@@ -103,60 +103,60 @@ typedef struct {
 
 static const int resolution[4] = { 12, 8, 10, 12 };
 
-#define TSC_MODE_NO_SCAN	0x0
-#define TSC_MODE_XY_SCAN	0x1
-#define TSC_MODE_XYZ_SCAN	0x2
-#define TSC_MODE_X		0x3
-#define TSC_MODE_Y		0x4
-#define TSC_MODE_Z		0x5
-#define TSC_MODE_BAT1		0x6
-#define TSC_MODE_BAT2		0x7
-#define TSC_MODE_AUX		0x8
-#define TSC_MODE_AUX_SCAN	0x9
-#define TSC_MODE_TEMP1		0xa
-#define TSC_MODE_PORT_SCAN	0xb
-#define TSC_MODE_TEMP2		0xc
-#define TSC_MODE_XX_DRV		0xd
-#define TSC_MODE_YY_DRV		0xe
-#define TSC_MODE_YX_DRV		0xf
+#define TSC_MODE_NO_SCAN    0x0
+#define TSC_MODE_XY_SCAN    0x1
+#define TSC_MODE_XYZ_SCAN   0x2
+#define TSC_MODE_X      0x3
+#define TSC_MODE_Y      0x4
+#define TSC_MODE_Z      0x5
+#define TSC_MODE_BAT1       0x6
+#define TSC_MODE_BAT2       0x7
+#define TSC_MODE_AUX        0x8
+#define TSC_MODE_AUX_SCAN   0x9
+#define TSC_MODE_TEMP1      0xa
+#define TSC_MODE_PORT_SCAN  0xb
+#define TSC_MODE_TEMP2      0xc
+#define TSC_MODE_XX_DRV     0xd
+#define TSC_MODE_YY_DRV     0xe
+#define TSC_MODE_YX_DRV     0xf
 
 static const uint16_t mode_regs[16] = {
-    0x0000,	/* No scan */
-    0x0600,	/* X, Y scan */
-    0x0780,	/* X, Y, Z scan */
-    0x0400,	/* X */
-    0x0200,	/* Y */
-    0x0180,	/* Z */
-    0x0040,	/* BAT1 */
-    0x0030,	/* BAT2 */
-    0x0010,	/* AUX */
-    0x0010,	/* AUX scan */
-    0x0004,	/* TEMP1 */
-    0x0070,	/* Port scan */
-    0x0002,	/* TEMP2 */
-    0x0000,	/* X+, X- drivers */
-    0x0000,	/* Y+, Y- drivers */
-    0x0000,	/* Y+, X- drivers */
+    0x0000, /* No scan */
+    0x0600, /* X, Y scan */
+    0x0780, /* X, Y, Z scan */
+    0x0400, /* X */
+    0x0200, /* Y */
+    0x0180, /* Z */
+    0x0040, /* BAT1 */
+    0x0030, /* BAT2 */
+    0x0010, /* AUX */
+    0x0010, /* AUX scan */
+    0x0004, /* TEMP1 */
+    0x0070, /* Port scan */
+    0x0002, /* TEMP2 */
+    0x0000, /* X+, X- drivers */
+    0x0000, /* Y+, Y- drivers */
+    0x0000, /* Y+, X- drivers */
 };
 
-#define X_TRANSFORM(s)			\
+#define X_TRANSFORM(s)          \
     ((s->y * s->tr[0] - s->x * s->tr[1]) / s->tr[2] + s->tr[3])
-#define Y_TRANSFORM(s)			\
+#define Y_TRANSFORM(s)          \
     ((s->y * s->tr[4] - s->x * s->tr[5]) / s->tr[6] + s->tr[7])
-#define Z1_TRANSFORM(s)			\
+#define Z1_TRANSFORM(s)         \
     ((400 - ((s)->x >> 7) + ((s)->pressure << 10)) << 4)
-#define Z2_TRANSFORM(s)			\
+#define Z2_TRANSFORM(s)         \
     ((4000 + ((s)->y >> 7) - ((s)->pressure << 10)) << 4)
 
-#define BAT1_VAL			0x8660
-#define BAT2_VAL			0x0000
-#define AUX1_VAL			0x35c0
-#define AUX2_VAL			0xffff
-#define TEMP1_VAL			0x8c70
-#define TEMP2_VAL			0xa5b0
+#define BAT1_VAL            0x8660
+#define BAT2_VAL            0x0000
+#define AUX1_VAL            0x35c0
+#define AUX2_VAL            0xffff
+#define TEMP1_VAL           0x8c70
+#define TEMP2_VAL           0xa5b0
 
-#define TSC_POWEROFF_DELAY		50
-#define TSC_SOFTSTEP_DELAY		50
+#define TSC_POWEROFF_DELAY      50
+#define TSC_SOFTSTEP_DELAY      50
 
 static void tsc210x_reset(TSC210xState *s)
 {
@@ -222,34 +222,34 @@ typedef struct {
     int fsref;
 } TSC210xRateInfo;
 
-/*  { rate,   dsor, fsref }	*/
+/*  { rate,   dsor, fsref } */
 static const TSC210xRateInfo tsc2102_rates[] = {
     /* Fsref / 6.0 */
-    { 7350,	63,	1 },
-    { 8000,	63,	0 },
+    { 7350, 63, 1 },
+    { 8000, 63, 0 },
     /* Fsref / 6.0 */
-    { 7350,	54,	1 },
-    { 8000,	54,	0 },
+    { 7350, 54, 1 },
+    { 8000, 54, 0 },
     /* Fsref / 5.0 */
-    { 8820,	45,	1 },
-    { 9600,	45,	0 },
+    { 8820, 45, 1 },
+    { 9600, 45, 0 },
     /* Fsref / 4.0 */
-    { 11025,	36,	1 },
-    { 12000,	36,	0 },
+    { 11025,    36, 1 },
+    { 12000,    36, 0 },
     /* Fsref / 3.0 */
-    { 14700,	27,	1 },
-    { 16000,	27,	0 },
+    { 14700,    27, 1 },
+    { 16000,    27, 0 },
     /* Fsref / 2.0 */
-    { 22050,	18,	1 },
-    { 24000,	18,	0 },
+    { 22050,    18, 1 },
+    { 24000,    18, 0 },
     /* Fsref / 1.5 */
-    { 29400,	9,	1 },
-    { 32000,	9,	0 },
+    { 29400,    9,  1 },
+    { 32000,    9,  0 },
     /* Fsref */
-    { 44100,	0,	1 },
-    { 48000,	0,	0 },
+    { 44100,    0,  1 },
+    { 48000,    0,  0 },
 
-    { 0,	0, 	0 },
+    { 0,    0,  0 },
 };
 
 static inline void tsc210x_out_flush(TSC210xState *s, int len)
@@ -283,11 +283,11 @@ static void tsc2102_audio_rate_update(TSC210xState *s)
 
     s->codec.tx_rate = 0;
     s->codec.rx_rate = 0;
-    if (s->dac_power & (1 << 15))				/* PWDNC */
+    if (s->dac_power & (1 << 15))               /* PWDNC */
         return;
 
     for (rate = tsc2102_rates; rate->rate; rate ++)
-        if (rate->dsor == (s->audio_ctrl1 & 0x3f) &&		/* DACFS */
+        if (rate->dsor == (s->audio_ctrl1 & 0x3f) &&        /* DACFS */
                         rate->fsref == ((s->audio_ctrl3 >> 13) & 1))/* REFFS */
             break;
     if (!rate->rate) {
@@ -313,8 +313,8 @@ static void tsc2102_audio_output_update(TSC210xState *s)
     s->codec.cts = 0;
 
     enable =
-            (~s->dac_power & (1 << 15)) &&			/* PWDNC */
-            (~s->dac_power & (1 << 10));			/* DAPWDN */
+            (~s->dac_power & (1 << 15)) &&          /* PWDNC */
+            (~s->dac_power & (1 << 10));            /* DAPWDN */
     if (!enable || !s->codec.tx_rate)
         return;
 
@@ -335,28 +335,28 @@ static void tsc2102_audio_output_update(TSC210xState *s)
 static uint16_t tsc2102_data_register_read(TSC210xState *s, int reg)
 {
     switch (reg) {
-    case 0x00:	/* X */
+    case 0x00:  /* X */
         s->dav &= 0xfbff;
         return TSC_CUT_RESOLUTION(X_TRANSFORM(s), s->precision) +
                 (s->noise & 3);
 
-    case 0x01:	/* Y */
+    case 0x01:  /* Y */
         s->noise ++;
         s->dav &= 0xfdff;
         return TSC_CUT_RESOLUTION(Y_TRANSFORM(s), s->precision) ^
                 (s->noise & 3);
 
-    case 0x02:	/* Z1 */
+    case 0x02:  /* Z1 */
         s->dav &= 0xfeff;
         return TSC_CUT_RESOLUTION(Z1_TRANSFORM(s), s->precision) -
                 (s->noise & 3);
 
-    case 0x03:	/* Z2 */
+    case 0x03:  /* Z2 */
         s->dav &= 0xff7f;
         return TSC_CUT_RESOLUTION(Z2_TRANSFORM(s), s->precision) |
                 (s->noise & 3);
 
-    case 0x04:	/* KPData */
+    case 0x04:  /* KPData */
         if ((s->model & 0xff00) == 0x2300) {
             if (s->kb.intr && (s->kb.mode & 2)) {
                 s->kb.intr = 0;
@@ -367,34 +367,34 @@ static uint16_t tsc2102_data_register_read(TSC210xState *s, int reg)
 
         return 0xffff;
 
-    case 0x05:	/* BAT1 */
+    case 0x05:  /* BAT1 */
         s->dav &= 0xffbf;
         return TSC_CUT_RESOLUTION(BAT1_VAL, s->precision) +
                 (s->noise & 6);
 
-    case 0x06:	/* BAT2 */
+    case 0x06:  /* BAT2 */
         s->dav &= 0xffdf;
         return TSC_CUT_RESOLUTION(BAT2_VAL, s->precision);
 
-    case 0x07:	/* AUX1 */
+    case 0x07:  /* AUX1 */
         s->dav &= 0xffef;
         return TSC_CUT_RESOLUTION(AUX1_VAL, s->precision);
 
-    case 0x08:	/* AUX2 */
+    case 0x08:  /* AUX2 */
         s->dav &= 0xfff7;
         return 0xffff;
 
-    case 0x09:	/* TEMP1 */
+    case 0x09:  /* TEMP1 */
         s->dav &= 0xfffb;
         return TSC_CUT_RESOLUTION(TEMP1_VAL, s->precision) -
                 (s->noise & 5);
 
-    case 0x0a:	/* TEMP2 */
+    case 0x0a:  /* TEMP2 */
         s->dav &= 0xfffd;
         return TSC_CUT_RESOLUTION(TEMP2_VAL, s->precision) ^
                 (s->noise & 3);
 
-    case 0x0b:	/* DAC */
+    case 0x0b:  /* DAC */
         s->dav &= 0xfffe;
         return 0xffff;
 
@@ -411,11 +411,11 @@ static uint16_t tsc2102_control_register_read(
                 TSC210xState *s, int reg)
 {
     switch (reg) {
-    case 0x00:	/* TSC ADC */
+    case 0x00:  /* TSC ADC */
         return (s->pressure << 15) | ((!s->busy) << 14) |
                 (s->nextfunction << 10) | (s->nextprecision << 8) | s->filter; 
 
-    case 0x01:	/* Status / Keypad Control */
+    case 0x01:  /* Status / Keypad Control */
         if ((s->model & 0xff00) == 0x2100)
             return (s->pin_func << 14) | ((!s->enabled) << 13) |
                     (s->host_mode << 12) | ((!!s->dav) << 11) | s->dav;
@@ -423,27 +423,27 @@ static uint16_t tsc2102_control_register_read(
             return (s->kb.intr << 15) | ((s->kb.scan || !s->kb.down) << 14) |
                     (s->kb.debounce << 11);
 
-    case 0x02:	/* DAC Control */
+    case 0x02:  /* DAC Control */
         if ((s->model & 0xff00) == 0x2300)
             return s->dac_power & 0x8000;
         else
             goto bad_reg;
 
-    case 0x03:	/* Reference */
+    case 0x03:  /* Reference */
         return s->ref;
 
-    case 0x04:	/* Reset */
+    case 0x04:  /* Reset */
         return 0xffff;
 
-    case 0x05:	/* Configuration */
+    case 0x05:  /* Configuration */
         return s->timing;
 
-    case 0x06:	/* Secondary configuration */
+    case 0x06:  /* Secondary configuration */
         if ((s->model & 0xff00) == 0x2100)
             goto bad_reg;
         return ((!s->dav) << 15) | ((s->kb.mode & 1) << 14) | s->pll[2];
 
-    case 0x10:	/* Keypad Mask */
+    case 0x10:  /* Keypad Mask */
         if ((s->model & 0xff00) == 0x2100)
             goto bad_reg;
         return s->kb.mask;
@@ -464,19 +464,19 @@ static uint16_t tsc2102_audio_register_read(TSC210xState *s, int reg)
     uint16_t val;
 
     switch (reg) {
-    case 0x00:	/* Audio Control 1 */
+    case 0x00:  /* Audio Control 1 */
         return s->audio_ctrl1;
 
     case 0x01:
         return 0xff00;
 
-    case 0x02:	/* DAC Volume Control */
+    case 0x02:  /* DAC Volume Control */
         return s->volume;
 
     case 0x03:
         return 0x8b00;
 
-    case 0x04:	/* Audio Control 2 */
+    case 0x04:  /* Audio Control 2 */
         l_ch = 1;
         r_ch = 1;
         if (s->softstep && !(s->dac_power & (1 << 10))) {
@@ -488,46 +488,46 @@ static uint16_t tsc2102_audio_register_read(TSC210xState *s, int reg)
 
         return s->audio_ctrl2 | (l_ch << 3) | (r_ch << 2);
 
-    case 0x05:	/* Stereo DAC Power Control */
+    case 0x05:  /* Stereo DAC Power Control */
         return 0x2aa0 | s->dac_power |
                 (((s->dac_power & (1 << 10)) &&
                   (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) >
                    s->powerdown + TSC_POWEROFF_DELAY)) << 6);
 
-    case 0x06:	/* Audio Control 3 */
+    case 0x06:  /* Audio Control 3 */
         val = s->audio_ctrl3 | 0x0001;
         s->audio_ctrl3 &= 0xff3f;
         return val;
 
-    case 0x07:	/* LCH_BASS_BOOST_N0 */
-    case 0x08:	/* LCH_BASS_BOOST_N1 */
-    case 0x09:	/* LCH_BASS_BOOST_N2 */
-    case 0x0a:	/* LCH_BASS_BOOST_N3 */
-    case 0x0b:	/* LCH_BASS_BOOST_N4 */
-    case 0x0c:	/* LCH_BASS_BOOST_N5 */
-    case 0x0d:	/* LCH_BASS_BOOST_D1 */
-    case 0x0e:	/* LCH_BASS_BOOST_D2 */
-    case 0x0f:	/* LCH_BASS_BOOST_D4 */
-    case 0x10:	/* LCH_BASS_BOOST_D5 */
-    case 0x11:	/* RCH_BASS_BOOST_N0 */
-    case 0x12:	/* RCH_BASS_BOOST_N1 */
-    case 0x13:	/* RCH_BASS_BOOST_N2 */
-    case 0x14:	/* RCH_BASS_BOOST_N3 */
-    case 0x15:	/* RCH_BASS_BOOST_N4 */
-    case 0x16:	/* RCH_BASS_BOOST_N5 */
-    case 0x17:	/* RCH_BASS_BOOST_D1 */
-    case 0x18:	/* RCH_BASS_BOOST_D2 */
-    case 0x19:	/* RCH_BASS_BOOST_D4 */
-    case 0x1a:	/* RCH_BASS_BOOST_D5 */
+    case 0x07:  /* LCH_BASS_BOOST_N0 */
+    case 0x08:  /* LCH_BASS_BOOST_N1 */
+    case 0x09:  /* LCH_BASS_BOOST_N2 */
+    case 0x0a:  /* LCH_BASS_BOOST_N3 */
+    case 0x0b:  /* LCH_BASS_BOOST_N4 */
+    case 0x0c:  /* LCH_BASS_BOOST_N5 */
+    case 0x0d:  /* LCH_BASS_BOOST_D1 */
+    case 0x0e:  /* LCH_BASS_BOOST_D2 */
+    case 0x0f:  /* LCH_BASS_BOOST_D4 */
+    case 0x10:  /* LCH_BASS_BOOST_D5 */
+    case 0x11:  /* RCH_BASS_BOOST_N0 */
+    case 0x12:  /* RCH_BASS_BOOST_N1 */
+    case 0x13:  /* RCH_BASS_BOOST_N2 */
+    case 0x14:  /* RCH_BASS_BOOST_N3 */
+    case 0x15:  /* RCH_BASS_BOOST_N4 */
+    case 0x16:  /* RCH_BASS_BOOST_N5 */
+    case 0x17:  /* RCH_BASS_BOOST_D1 */
+    case 0x18:  /* RCH_BASS_BOOST_D2 */
+    case 0x19:  /* RCH_BASS_BOOST_D4 */
+    case 0x1a:  /* RCH_BASS_BOOST_D5 */
         return s->filter_data[reg - 0x07];
 
-    case 0x1b:	/* PLL Programmability 1 */
+    case 0x1b:  /* PLL Programmability 1 */
         return s->pll[0];
 
-    case 0x1c:	/* PLL Programmability 2 */
+    case 0x1c:  /* PLL Programmability 2 */
         return s->pll[1];
 
-    case 0x1d:	/* Audio Control 4 */
+    case 0x1d:  /* Audio Control 4 */
         return (!s->softstep) << 14;
 
     default:
@@ -543,16 +543,16 @@ static void tsc2102_data_register_write(
                 TSC210xState *s, int reg, uint16_t value)
 {
     switch (reg) {
-    case 0x00:	/* X */
-    case 0x01:	/* Y */
-    case 0x02:	/* Z1 */
-    case 0x03:	/* Z2 */
-    case 0x05:	/* BAT1 */
-    case 0x06:	/* BAT2 */
-    case 0x07:	/* AUX1 */
-    case 0x08:	/* AUX2 */
-    case 0x09:	/* TEMP1 */
-    case 0x0a:	/* TEMP2 */
+    case 0x00:  /* X */
+    case 0x01:  /* Y */
+    case 0x02:  /* Z1 */
+    case 0x03:  /* Z2 */
+    case 0x05:  /* BAT1 */
+    case 0x06:  /* BAT2 */
+    case 0x07:  /* AUX1 */
+    case 0x08:  /* AUX2 */
+    case 0x09:  /* TEMP1 */
+    case 0x0a:  /* TEMP2 */
         return;
 
     default:
@@ -565,7 +565,7 @@ static void tsc2102_control_register_write(
                 TSC210xState *s, int reg, uint16_t value)
 {
     switch (reg) {
-    case 0x00:	/* TSC ADC */
+    case 0x00:  /* TSC ADC */
         s->host_mode = value >> 15;
         s->enabled = !(value & 0x4000);
         if (s->busy && !s->enabled)
@@ -576,7 +576,7 @@ static void tsc2102_control_register_write(
         s->filter = value & 0xff;
         return;
 
-    case 0x01:	/* Status / Keypad Control */
+    case 0x01:  /* Status / Keypad Control */
         if ((s->model & 0xff00) == 0x2100)
             s->pin_func = value >> 14;
         else {
@@ -589,7 +589,7 @@ static void tsc2102_control_register_write(
         }
         return;
 
-    case 0x02:	/* DAC Control */
+    case 0x02:  /* DAC Control */
         if ((s->model & 0xff00) == 0x2300) {
             s->dac_power &= 0x7fff;
             s->dac_power |= 0x8000 & value;
@@ -597,11 +597,11 @@ static void tsc2102_control_register_write(
             goto bad_reg;
         break;
 
-    case 0x03:	/* Reference */
+    case 0x03:  /* Reference */
         s->ref = value & 0x1f;
         return;
 
-    case 0x04:	/* Reset */
+    case 0x04:  /* Reset */
         if (value == 0xbb00) {
             if (s->busy)
                 timer_del(s->timer);
@@ -614,7 +614,7 @@ static void tsc2102_control_register_write(
         }
         return;
 
-    case 0x05:	/* Configuration */
+    case 0x05:  /* Configuration */
         s->timing = value & 0x3f;
 #ifdef TSC_VERBOSE
         if (value & ~0x3f)
@@ -623,14 +623,14 @@ static void tsc2102_control_register_write(
 #endif
         return;
 
-    case 0x06:	/* Secondary configuration */
+    case 0x06:  /* Secondary configuration */
         if ((s->model & 0xff00) == 0x2100)
             goto bad_reg;
         s->kb.mode = value >> 14;
         s->pll[2] = value & 0x3ffff;
         return;
 
-    case 0x10:	/* Keypad Mask */
+    case 0x10:  /* Keypad Mask */
         if ((s->model & 0xff00) == 0x2100)
             goto bad_reg;
         s->kb.mask = value;
@@ -647,7 +647,7 @@ static void tsc2102_audio_register_write(
                 TSC210xState *s, int reg, uint16_t value)
 {
     switch (reg) {
-    case 0x00:	/* Audio Control 1 */
+    case 0x00:  /* Audio Control 1 */
         s->audio_ctrl1 = value & 0x0f3f;
 #ifdef TSC_VERBOSE
         if ((value & ~0x0f3f) || ((value & 7) != ((value >> 3) & 7)))
@@ -666,7 +666,7 @@ static void tsc2102_audio_register_write(
 #endif
         return;
 
-    case 0x02:	/* DAC Volume Control */
+    case 0x02:  /* DAC Volume Control */
         s->volume = value;
         s->volume_change = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         return;
@@ -679,7 +679,7 @@ static void tsc2102_audio_register_write(
 #endif
         return;
 
-    case 0x04:	/* Audio Control 2 */
+    case 0x04:  /* Audio Control 2 */
         s->audio_ctrl2 = value & 0xf7f2;
 #ifdef TSC_VERBOSE
         if (value & ~0xf7fd)
@@ -688,7 +688,7 @@ static void tsc2102_audio_register_write(
 #endif
         return;
 
-    case 0x05:	/* Stereo DAC Power Control */
+    case 0x05:  /* Stereo DAC Power Control */
         if ((value & ~s->dac_power) & (1 << 10))
             s->powerdown = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
@@ -702,7 +702,7 @@ static void tsc2102_audio_register_write(
         tsc2102_audio_output_update(s);
         return;
 
-    case 0x06:	/* Audio Control 3 */
+    case 0x06:  /* Audio Control 3 */
         s->audio_ctrl3 &= 0x00c0;
         s->audio_ctrl3 |= value & 0xf800;
 #ifdef TSC_VERBOSE
@@ -713,30 +713,30 @@ static void tsc2102_audio_register_write(
         tsc2102_audio_output_update(s);
         return;
 
-    case 0x07:	/* LCH_BASS_BOOST_N0 */
-    case 0x08:	/* LCH_BASS_BOOST_N1 */
-    case 0x09:	/* LCH_BASS_BOOST_N2 */
-    case 0x0a:	/* LCH_BASS_BOOST_N3 */
-    case 0x0b:	/* LCH_BASS_BOOST_N4 */
-    case 0x0c:	/* LCH_BASS_BOOST_N5 */
-    case 0x0d:	/* LCH_BASS_BOOST_D1 */
-    case 0x0e:	/* LCH_BASS_BOOST_D2 */
-    case 0x0f:	/* LCH_BASS_BOOST_D4 */
-    case 0x10:	/* LCH_BASS_BOOST_D5 */
-    case 0x11:	/* RCH_BASS_BOOST_N0 */
-    case 0x12:	/* RCH_BASS_BOOST_N1 */
-    case 0x13:	/* RCH_BASS_BOOST_N2 */
-    case 0x14:	/* RCH_BASS_BOOST_N3 */
-    case 0x15:	/* RCH_BASS_BOOST_N4 */
-    case 0x16:	/* RCH_BASS_BOOST_N5 */
-    case 0x17:	/* RCH_BASS_BOOST_D1 */
-    case 0x18:	/* RCH_BASS_BOOST_D2 */
-    case 0x19:	/* RCH_BASS_BOOST_D4 */
-    case 0x1a:	/* RCH_BASS_BOOST_D5 */
+    case 0x07:  /* LCH_BASS_BOOST_N0 */
+    case 0x08:  /* LCH_BASS_BOOST_N1 */
+    case 0x09:  /* LCH_BASS_BOOST_N2 */
+    case 0x0a:  /* LCH_BASS_BOOST_N3 */
+    case 0x0b:  /* LCH_BASS_BOOST_N4 */
+    case 0x0c:  /* LCH_BASS_BOOST_N5 */
+    case 0x0d:  /* LCH_BASS_BOOST_D1 */
+    case 0x0e:  /* LCH_BASS_BOOST_D2 */
+    case 0x0f:  /* LCH_BASS_BOOST_D4 */
+    case 0x10:  /* LCH_BASS_BOOST_D5 */
+    case 0x11:  /* RCH_BASS_BOOST_N0 */
+    case 0x12:  /* RCH_BASS_BOOST_N1 */
+    case 0x13:  /* RCH_BASS_BOOST_N2 */
+    case 0x14:  /* RCH_BASS_BOOST_N3 */
+    case 0x15:  /* RCH_BASS_BOOST_N4 */
+    case 0x16:  /* RCH_BASS_BOOST_N5 */
+    case 0x17:  /* RCH_BASS_BOOST_D1 */
+    case 0x18:  /* RCH_BASS_BOOST_D2 */
+    case 0x19:  /* RCH_BASS_BOOST_D4 */
+    case 0x1a:  /* RCH_BASS_BOOST_D5 */
         s->filter_data[reg - 0x07] = value;
         return;
 
-    case 0x1b:	/* PLL Programmability 1 */
+    case 0x1b:  /* PLL Programmability 1 */
         s->pll[0] = value & 0xfffc;
 #ifdef TSC_VERBOSE
         if (value & ~0xfffc)
@@ -745,7 +745,7 @@ static void tsc2102_audio_register_write(
 #endif
         return;
 
-    case 0x1c:	/* PLL Programmability 2 */
+    case 0x1c:  /* PLL Programmability 2 */
         s->pll[1] = value & 0xfffc;
 #ifdef TSC_VERBOSE
         if (value & ~0xfffc)
@@ -754,7 +754,7 @@ static void tsc2102_audio_register_write(
 #endif
         return;
 
-    case 0x1d:	/* Audio Control 4 */
+    case 0x1d:  /* Audio Control 4 */
         s->softstep = !(value & 0x4000);
 #ifdef TSC_VERBOSE
         if (value & ~0x4000)
diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
index 647bf324a8..2ce24d21b2 100644
--- a/hw/intc/omap_intc.c
+++ b/hw/intc/omap_intc.c
@@ -104,8 +104,8 @@ static inline void omap_inth_update(OMAPIntcState *s, int is_fiq)
     }
 }
 
-#define INT_FALLING_EDGE	0
-#define INT_LOW_LEVEL		1
+#define INT_FALLING_EDGE    0
+#define INT_LOW_LEVEL       1
 
 static void omap_set_intr(void *opaque, int irq, int req)
 {
@@ -164,13 +164,13 @@ static uint64_t omap_inth_read(void *opaque, hwaddr addr,
     offset &= 0xff;
 
     switch (offset) {
-    case 0x00:	/* ITR */
+    case 0x00:  /* ITR */
         return bank->irqs;
 
-    case 0x04:	/* MIR */
+    case 0x04:  /* MIR */
         return bank->mask;
 
-    case 0x10:	/* SIR_IRQ_CODE */
+    case 0x10:  /* SIR_IRQ_CODE */
     case 0x14:  /* SIR_FIQ_CODE */
         if (bank_no != 0)
             break;
@@ -181,49 +181,49 @@ static uint64_t omap_inth_read(void *opaque, hwaddr addr,
             bank->irqs &= ~(1 << i);
         return line_no;
 
-    case 0x18:	/* CONTROL_REG */
+    case 0x18:  /* CONTROL_REG */
         if (bank_no != 0)
             break;
         return 0;
 
-    case 0x1c:	/* ILR0 */
-    case 0x20:	/* ILR1 */
-    case 0x24:	/* ILR2 */
-    case 0x28:	/* ILR3 */
-    case 0x2c:	/* ILR4 */
-    case 0x30:	/* ILR5 */
-    case 0x34:	/* ILR6 */
-    case 0x38:	/* ILR7 */
-    case 0x3c:	/* ILR8 */
-    case 0x40:	/* ILR9 */
-    case 0x44:	/* ILR10 */
-    case 0x48:	/* ILR11 */
-    case 0x4c:	/* ILR12 */
-    case 0x50:	/* ILR13 */
-    case 0x54:	/* ILR14 */
-    case 0x58:	/* ILR15 */
-    case 0x5c:	/* ILR16 */
-    case 0x60:	/* ILR17 */
-    case 0x64:	/* ILR18 */
-    case 0x68:	/* ILR19 */
-    case 0x6c:	/* ILR20 */
-    case 0x70:	/* ILR21 */
-    case 0x74:	/* ILR22 */
-    case 0x78:	/* ILR23 */
-    case 0x7c:	/* ILR24 */
-    case 0x80:	/* ILR25 */
-    case 0x84:	/* ILR26 */
-    case 0x88:	/* ILR27 */
-    case 0x8c:	/* ILR28 */
-    case 0x90:	/* ILR29 */
-    case 0x94:	/* ILR30 */
-    case 0x98:	/* ILR31 */
+    case 0x1c:  /* ILR0 */
+    case 0x20:  /* ILR1 */
+    case 0x24:  /* ILR2 */
+    case 0x28:  /* ILR3 */
+    case 0x2c:  /* ILR4 */
+    case 0x30:  /* ILR5 */
+    case 0x34:  /* ILR6 */
+    case 0x38:  /* ILR7 */
+    case 0x3c:  /* ILR8 */
+    case 0x40:  /* ILR9 */
+    case 0x44:  /* ILR10 */
+    case 0x48:  /* ILR11 */
+    case 0x4c:  /* ILR12 */
+    case 0x50:  /* ILR13 */
+    case 0x54:  /* ILR14 */
+    case 0x58:  /* ILR15 */
+    case 0x5c:  /* ILR16 */
+    case 0x60:  /* ILR17 */
+    case 0x64:  /* ILR18 */
+    case 0x68:  /* ILR19 */
+    case 0x6c:  /* ILR20 */
+    case 0x70:  /* ILR21 */
+    case 0x74:  /* ILR22 */
+    case 0x78:  /* ILR23 */
+    case 0x7c:  /* ILR24 */
+    case 0x80:  /* ILR25 */
+    case 0x84:  /* ILR26 */
+    case 0x88:  /* ILR27 */
+    case 0x8c:  /* ILR28 */
+    case 0x90:  /* ILR29 */
+    case 0x94:  /* ILR30 */
+    case 0x98:  /* ILR31 */
         i = (offset - 0x1c) >> 2;
         return (bank->priority[i] << 2) |
                 (((bank->sens_edge >> i) & 1) << 1) |
                 ((bank->fiq >> i) & 1);
 
-    case 0x9c:	/* ISR */
+    case 0x9c:  /* ISR */
         return 0x00000000;
 
     }
@@ -241,24 +241,24 @@ static void omap_inth_write(void *opaque, hwaddr addr,
     offset &= 0xff;
 
     switch (offset) {
-    case 0x00:	/* ITR */
+    case 0x00:  /* ITR */
         /* Important: ignore the clearing if the IRQ is level-triggered and
            the input bit is 1 */
         bank->irqs &= value | (bank->inputs & bank->sens_edge);
         return;
 
-    case 0x04:	/* MIR */
+    case 0x04:  /* MIR */
         bank->mask = value;
         omap_inth_update(s, 0);
         omap_inth_update(s, 1);
         return;
 
-    case 0x10:	/* SIR_IRQ_CODE */
-    case 0x14:	/* SIR_FIQ_CODE */
+    case 0x10:  /* SIR_IRQ_CODE */
+    case 0x14:  /* SIR_FIQ_CODE */
         OMAP_RO_REG(addr);
         break;
 
-    case 0x18:	/* CONTROL_REG */
+    case 0x18:  /* CONTROL_REG */
         if (bank_no != 0)
             break;
         if (value & 2) {
@@ -273,38 +273,38 @@ static void omap_inth_write(void *opaque, hwaddr addr,
         }
         return;
 
-    case 0x1c:	/* ILR0 */
-    case 0x20:	/* ILR1 */
-    case 0x24:	/* ILR2 */
-    case 0x28:	/* ILR3 */
-    case 0x2c:	/* ILR4 */
-    case 0x30:	/* ILR5 */
-    case 0x34:	/* ILR6 */
-    case 0x38:	/* ILR7 */
-    case 0x3c:	/* ILR8 */
-    case 0x40:	/* ILR9 */
-    case 0x44:	/* ILR10 */
-    case 0x48:	/* ILR11 */
-    case 0x4c:	/* ILR12 */
-    case 0x50:	/* ILR13 */
-    case 0x54:	/* ILR14 */
-    case 0x58:	/* ILR15 */
-    case 0x5c:	/* ILR16 */
-    case 0x60:	/* ILR17 */
-    case 0x64:	/* ILR18 */
-    case 0x68:	/* ILR19 */
-    case 0x6c:	/* ILR20 */
-    case 0x70:	/* ILR21 */
-    case 0x74:	/* ILR22 */
-    case 0x78:	/* ILR23 */
-    case 0x7c:	/* ILR24 */
-    case 0x80:	/* ILR25 */
-    case 0x84:	/* ILR26 */
-    case 0x88:	/* ILR27 */
-    case 0x8c:	/* ILR28 */
-    case 0x90:	/* ILR29 */
-    case 0x94:	/* ILR30 */
-    case 0x98:	/* ILR31 */
+    case 0x1c:  /* ILR0 */
+    case 0x20:  /* ILR1 */
+    case 0x24:  /* ILR2 */
+    case 0x28:  /* ILR3 */
+    case 0x2c:  /* ILR4 */
+    case 0x30:  /* ILR5 */
+    case 0x34:  /* ILR6 */
+    case 0x38:  /* ILR7 */
+    case 0x3c:  /* ILR8 */
+    case 0x40:  /* ILR9 */
+    case 0x44:  /* ILR10 */
+    case 0x48:  /* ILR11 */
+    case 0x4c:  /* ILR12 */
+    case 0x50:  /* ILR13 */
+    case 0x54:  /* ILR14 */
+    case 0x58:  /* ILR15 */
+    case 0x5c:  /* ILR16 */
+    case 0x60:  /* ILR17 */
+    case 0x64:  /* ILR18 */
+    case 0x68:  /* ILR19 */
+    case 0x6c:  /* ILR20 */
+    case 0x70:  /* ILR21 */
+    case 0x74:  /* ILR22 */
+    case 0x78:  /* ILR23 */
+    case 0x7c:  /* ILR24 */
+    case 0x80:  /* ILR25 */
+    case 0x84:  /* ILR26 */
+    case 0x88:  /* ILR27 */
+    case 0x8c:  /* ILR28 */
+    case 0x90:  /* ILR29 */
+    case 0x94:  /* ILR30 */
+    case 0x98:  /* ILR31 */
         i = (offset - 0x1c) >> 2;
         bank->priority[i] = (value >> 2) & 0x1f;
         bank->sens_edge &= ~(1 << i);
@@ -313,7 +313,7 @@ static void omap_inth_write(void *opaque, hwaddr addr,
         bank->fiq |= (value & 1) << i;
         return;
 
-    case 0x9c:	/* ISR */
+    case 0x9c:  /* ISR */
         for (i = 0; i < 32; i ++)
             if (value & (1 << i)) {
                 omap_set_intr(s, 32 * bank_no + i, 1);
@@ -440,55 +440,55 @@ static uint64_t omap2_inth_read(void *opaque, hwaddr addr,
     }
 
     switch (offset) {
-    case 0x00:	/* INTC_REVISION */
+    case 0x00:  /* INTC_REVISION */
         return s->revision;
 
-    case 0x10:	/* INTC_SYSCONFIG */
+    case 0x10:  /* INTC_SYSCONFIG */
         return (s->autoidle >> 2) & 1;
 
-    case 0x14:	/* INTC_SYSSTATUS */
-        return 1;						/* RESETDONE */
+    case 0x14:  /* INTC_SYSSTATUS */
+        return 1;                       /* RESETDONE */
 
-    case 0x40:	/* INTC_SIR_IRQ */
+    case 0x40:  /* INTC_SIR_IRQ */
         return s->sir_intr[0];
 
-    case 0x44:	/* INTC_SIR_FIQ */
+    case 0x44:  /* INTC_SIR_FIQ */
         return s->sir_intr[1];
 
-    case 0x48:	/* INTC_CONTROL */
-        return (!s->mask) << 2;					/* GLOBALMASK */
+    case 0x48:  /* INTC_CONTROL */
+        return (!s->mask) << 2;                 /* GLOBALMASK */
 
-    case 0x4c:	/* INTC_PROTECTION */
+    case 0x4c:  /* INTC_PROTECTION */
         return 0;
 
-    case 0x50:	/* INTC_IDLE */
+    case 0x50:  /* INTC_IDLE */
         return s->autoidle & 3;
 
     /* Per-bank registers */
-    case 0x80:	/* INTC_ITR */
+    case 0x80:  /* INTC_ITR */
         return bank->inputs;
 
-    case 0x84:	/* INTC_MIR */
+    case 0x84:  /* INTC_MIR */
         return bank->mask;
 
-    case 0x88:	/* INTC_MIR_CLEAR */
-    case 0x8c:	/* INTC_MIR_SET */
+    case 0x88:  /* INTC_MIR_CLEAR */
+    case 0x8c:  /* INTC_MIR_SET */
         return 0;
 
-    case 0x90:	/* INTC_ISR_SET */
+    case 0x90:  /* INTC_ISR_SET */
         return bank->swi;
 
-    case 0x94:	/* INTC_ISR_CLEAR */
+    case 0x94:  /* INTC_ISR_CLEAR */
         return 0;
 
-    case 0x98:	/* INTC_PENDING_IRQ */
+    case 0x98:  /* INTC_PENDING_IRQ */
         return bank->irqs & ~bank->mask & ~bank->fiq;
 
-    case 0x9c:	/* INTC_PENDING_FIQ */
+    case 0x9c:  /* INTC_PENDING_FIQ */
         return bank->irqs & ~bank->mask & bank->fiq;
 
     /* Per-line registers */
-    case 0x100 ... 0x300:	/* INTC_ILR */
+    case 0x100 ... 0x300:   /* INTC_ILR */
         bank_no = (offset - 0x100) >> 7;
         if (bank_no > s->nbanks)
             break;
@@ -521,7 +521,7 @@ static void omap2_inth_write(void *opaque, hwaddr addr,
     }
 
     switch (offset) {
-    case 0x10:	/* INTC_SYSCONFIG */
+    case 0x10:  /* INTC_SYSCONFIG */
         s->autoidle &= 4;
         s->autoidle |= (value & 1) << 2;
         if (value & 2) {                                        /* SOFTRESET */
@@ -529,21 +529,21 @@ static void omap2_inth_write(void *opaque, hwaddr addr,
         }
         return;
 
-    case 0x48:	/* INTC_CONTROL */
-        s->mask = (value & 4) ? 0 : ~0;				/* GLOBALMASK */
-        if (value & 2) {					/* NEWFIQAGR */
+    case 0x48:  /* INTC_CONTROL */
+        s->mask = (value & 4) ? 0 : ~0;             /* GLOBALMASK */
+        if (value & 2) {                    /* NEWFIQAGR */
             qemu_set_irq(s->parent_intr[1], 0);
             s->new_agr[1] = ~0;
             omap_inth_update(s, 1);
         }
-        if (value & 1) {					/* NEWIRQAGR */
+        if (value & 1) {                    /* NEWIRQAGR */
             qemu_set_irq(s->parent_intr[0], 0);
             s->new_agr[0] = ~0;
             omap_inth_update(s, 0);
         }
         return;
 
-    case 0x4c:	/* INTC_PROTECTION */
+    case 0x4c:  /* INTC_PROTECTION */
         /* TODO: Make a bitmap (or sizeof(char)map) of access privileges
          * for every register, see Chapter 3 and 4 for privileged mode.  */
         if (value & 1)
@@ -551,41 +551,41 @@ static void omap2_inth_write(void *opaque, hwaddr addr,
                             __func__);
         return;
 
-    case 0x50:	/* INTC_IDLE */
+    case 0x50:  /* INTC_IDLE */
         s->autoidle &= ~3;
         s->autoidle |= value & 3;
         return;
 
     /* Per-bank registers */
-    case 0x84:	/* INTC_MIR */
+    case 0x84:  /* INTC_MIR */
         bank->mask = value;
         omap_inth_update(s, 0);
         omap_inth_update(s, 1);
         return;
 
-    case 0x88:	/* INTC_MIR_CLEAR */
+    case 0x88:  /* INTC_MIR_CLEAR */
         bank->mask &= ~value;
         omap_inth_update(s, 0);
         omap_inth_update(s, 1);
         return;
 
-    case 0x8c:	/* INTC_MIR_SET */
+    case 0x8c:  /* INTC_MIR_SET */
         bank->mask |= value;
         return;
 
-    case 0x90:	/* INTC_ISR_SET */
+    case 0x90:  /* INTC_ISR_SET */
         bank->irqs |= bank->swi |= value;
         omap_inth_update(s, 0);
         omap_inth_update(s, 1);
         return;
 
-    case 0x94:	/* INTC_ISR_CLEAR */
+    case 0x94:  /* INTC_ISR_CLEAR */
         bank->swi &= ~value;
         bank->irqs = bank->swi & bank->inputs;
         return;
 
     /* Per-line registers */
-    case 0x100 ... 0x300:	/* INTC_ILR */
+    case 0x100 ... 0x300:   /* INTC_ILR */
         bank_no = (offset - 0x100) >> 7;
         if (bank_no > s->nbanks)
             break;
@@ -596,13 +596,13 @@ static void omap2_inth_write(void *opaque, hwaddr addr,
         bank->fiq |= (value & 1) << line_no;
         return;
 
-    case 0x00:	/* INTC_REVISION */
-    case 0x14:	/* INTC_SYSSTATUS */
-    case 0x40:	/* INTC_SIR_IRQ */
-    case 0x44:	/* INTC_SIR_FIQ */
-    case 0x80:	/* INTC_ITR */
-    case 0x98:	/* INTC_PENDING_IRQ */
-    case 0x9c:	/* INTC_PENDING_FIQ */
+    case 0x00:  /* INTC_REVISION */
+    case 0x14:  /* INTC_SYSSTATUS */
+    case 0x40:  /* INTC_SIR_IRQ */
+    case 0x44:  /* INTC_SIR_FIQ */
+    case 0x80:  /* INTC_ITR */
+    case 0x98:  /* INTC_PENDING_IRQ */
+    case 0x9c:  /* INTC_PENDING_FIQ */
         OMAP_RO_REG(addr);
         return;
     }
diff --git a/hw/misc/cbus.c b/hw/misc/cbus.c
index 653e8ddcd5..65c9f2753a 100644
--- a/hw/misc/cbus.c
+++ b/hw/misc/cbus.c
@@ -179,61 +179,61 @@ static void retu_interrupt_update(CBusRetu *s)
     qemu_set_irq(s->irq, s->irqst & ~s->irqen);
 }
 
-#define RETU_REG_ASICR		0x00	/* (RO) ASIC ID & revision */
-#define RETU_REG_IDR		0x01	/* (T)  Interrupt ID */
-#define RETU_REG_IMR		0x02	/* (RW) Interrupt mask */
-#define RETU_REG_RTCDSR		0x03	/* (RW) RTC seconds register */
-#define RETU_REG_RTCHMR		0x04	/* (RO) RTC hours and minutes reg */
-#define RETU_REG_RTCHMAR	0x05	/* (RW) RTC hours and minutes set reg */
-#define RETU_REG_RTCCALR	0x06	/* (RW) RTC calibration register */
-#define RETU_REG_ADCR		0x08	/* (RW) ADC result register */
-#define RETU_REG_ADCSCR		0x09	/* (RW) ADC sample control register */
-#define RETU_REG_AFCR		0x0a	/* (RW) AFC register */
-#define RETU_REG_ANTIFR		0x0b	/* (RW) AntiF register */
-#define RETU_REG_CALIBR		0x0c	/* (RW) CalibR register*/
-#define RETU_REG_CCR1		0x0d	/* (RW) Common control register 1 */
-#define RETU_REG_CCR2		0x0e	/* (RW) Common control register 2 */
-#define RETU_REG_RCTRL_CLR	0x0f	/* (T)  Regulator clear register */
-#define RETU_REG_RCTRL_SET	0x10	/* (T)  Regulator set register */
-#define RETU_REG_TXCR		0x11	/* (RW) TxC register */
-#define RETU_REG_STATUS		0x16	/* (RO) Status register */
-#define RETU_REG_WATCHDOG	0x17	/* (RW) Watchdog register */
-#define RETU_REG_AUDTXR		0x18	/* (RW) Audio Codec Tx register */
-#define RETU_REG_AUDPAR		0x19	/* (RW) AudioPA register */
-#define RETU_REG_AUDRXR1	0x1a	/* (RW) Audio receive register 1 */
-#define RETU_REG_AUDRXR2	0x1b	/* (RW) Audio receive register 2 */
-#define RETU_REG_SGR1		0x1c	/* (RW) */
-#define RETU_REG_SCR1		0x1d	/* (RW) */
-#define RETU_REG_SGR2		0x1e	/* (RW) */
-#define RETU_REG_SCR2		0x1f	/* (RW) */
+#define RETU_REG_ASICR      0x00    /* (RO) ASIC ID & revision */
+#define RETU_REG_IDR        0x01    /* (T)  Interrupt ID */
+#define RETU_REG_IMR        0x02    /* (RW) Interrupt mask */
+#define RETU_REG_RTCDSR     0x03    /* (RW) RTC seconds register */
+#define RETU_REG_RTCHMR     0x04    /* (RO) RTC hours and minutes reg */
+#define RETU_REG_RTCHMAR    0x05    /* (RW) RTC hours and minutes set reg */
+#define RETU_REG_RTCCALR    0x06    /* (RW) RTC calibration register */
+#define RETU_REG_ADCR       0x08    /* (RW) ADC result register */
+#define RETU_REG_ADCSCR     0x09    /* (RW) ADC sample control register */
+#define RETU_REG_AFCR       0x0a    /* (RW) AFC register */
+#define RETU_REG_ANTIFR     0x0b    /* (RW) AntiF register */
+#define RETU_REG_CALIBR     0x0c    /* (RW) CalibR register*/
+#define RETU_REG_CCR1       0x0d    /* (RW) Common control register 1 */
+#define RETU_REG_CCR2       0x0e    /* (RW) Common control register 2 */
+#define RETU_REG_RCTRL_CLR  0x0f    /* (T)  Regulator clear register */
+#define RETU_REG_RCTRL_SET  0x10    /* (T)  Regulator set register */
+#define RETU_REG_TXCR       0x11    /* (RW) TxC register */
+#define RETU_REG_STATUS     0x16    /* (RO) Status register */
+#define RETU_REG_WATCHDOG   0x17    /* (RW) Watchdog register */
+#define RETU_REG_AUDTXR     0x18    /* (RW) Audio Codec Tx register */
+#define RETU_REG_AUDPAR     0x19    /* (RW) AudioPA register */
+#define RETU_REG_AUDRXR1    0x1a    /* (RW) Audio receive register 1 */
+#define RETU_REG_AUDRXR2    0x1b    /* (RW) Audio receive register 2 */
+#define RETU_REG_SGR1       0x1c    /* (RW) */
+#define RETU_REG_SCR1       0x1d    /* (RW) */
+#define RETU_REG_SGR2       0x1e    /* (RW) */
+#define RETU_REG_SCR2       0x1f    /* (RW) */
 
 /* Retu Interrupt sources */
 enum {
-    retu_int_pwr	= 0,	/* Power button */
-    retu_int_char	= 1,	/* Charger */
-    retu_int_rtcs	= 2,	/* Seconds */
-    retu_int_rtcm	= 3,	/* Minutes */
-    retu_int_rtcd	= 4,	/* Days */
-    retu_int_rtca	= 5,	/* Alarm */
-    retu_int_hook	= 6,	/* Hook */
-    retu_int_head	= 7,	/* Headset */
-    retu_int_adcs	= 8,	/* ADC sample */
+    retu_int_pwr    = 0,    /* Power button */
+    retu_int_char   = 1,    /* Charger */
+    retu_int_rtcs   = 2,    /* Seconds */
+    retu_int_rtcm   = 3,    /* Minutes */
+    retu_int_rtcd   = 4,    /* Days */
+    retu_int_rtca   = 5,    /* Alarm */
+    retu_int_hook   = 6,    /* Hook */
+    retu_int_head   = 7,    /* Headset */
+    retu_int_adcs   = 8,    /* ADC sample */
 };
 
 /* Retu ADC channel wiring */
 enum {
-    retu_adc_bsi	= 1,	/* BSI */
-    retu_adc_batt_temp	= 2,	/* Battery temperature */
-    retu_adc_chg_volt	= 3,	/* Charger voltage */
-    retu_adc_head_det	= 4,	/* Headset detection */
-    retu_adc_hook_det	= 5,	/* Hook detection */
-    retu_adc_rf_gp	= 6,	/* RF GP */
-    retu_adc_tx_det	= 7,	/* Wideband Tx detection */
-    retu_adc_batt_volt	= 8,	/* Battery voltage */
-    retu_adc_sens	= 10,	/* Light sensor */
-    retu_adc_sens_temp	= 11,	/* Light sensor temperature */
-    retu_adc_bbatt_volt	= 12,	/* Backup battery voltage */
-    retu_adc_self_temp	= 13,	/* RETU temperature */
+    retu_adc_bsi    = 1,    /* BSI */
+    retu_adc_batt_temp  = 2,    /* Battery temperature */
+    retu_adc_chg_volt   = 3,    /* Charger voltage */
+    retu_adc_head_det   = 4,    /* Headset detection */
+    retu_adc_hook_det   = 5,    /* Hook detection */
+    retu_adc_rf_gp  = 6,    /* RF GP */
+    retu_adc_tx_det = 7,    /* Wideband Tx detection */
+    retu_adc_batt_volt  = 8,    /* Battery voltage */
+    retu_adc_sens   = 10,   /* Light sensor */
+    retu_adc_sens_temp  = 11,   /* Light sensor temperature */
+    retu_adc_bbatt_volt = 12,   /* Backup battery voltage */
+    retu_adc_self_temp  = 13,   /* RETU temperature */
 };
 
 static inline uint16_t retu_read(CBusRetu *s, int reg)
@@ -246,7 +246,7 @@ static inline uint16_t retu_read(CBusRetu *s, int reg)
     case RETU_REG_ASICR:
         return 0x0215 | (s->is_vilma << 7);
 
-    case RETU_REG_IDR:	/* TODO: Or is this ffs(s->irqst)?  */
+    case RETU_REG_IDR:  /* TODO: Or is this ffs(s->irqst)?  */
         return s->irqst;
 
     case RETU_REG_IMR:
@@ -436,7 +436,7 @@ static void retu_head_event(void *retu, int state)
     CBusSlave *slave = (CBusSlave *) retu;
     CBusRetu *s = (CBusRetu *) slave->opaque;
 
-    if ((s->cc[0] & 0x500) == 0x500) {	/* TODO: Which bits? */
+    if ((s->cc[0] & 0x500) == 0x500) {  /* TODO: Which bits? */
         /* TODO: reissue the interrupt every 100ms or so.  */
         s->irqst |= 1 << retu_int_head;
         retu_interrupt_update(s);
@@ -485,20 +485,20 @@ static void tahvo_interrupt_update(CBusTahvo *s)
     qemu_set_irq(s->irq, s->irqst & ~s->irqen);
 }
 
-#define TAHVO_REG_ASICR		0x00	/* (RO) ASIC ID & revision */
-#define TAHVO_REG_IDR		0x01	/* (T)  Interrupt ID */
-#define TAHVO_REG_IDSR		0x02	/* (RO) Interrupt status */
-#define TAHVO_REG_IMR		0x03	/* (RW) Interrupt mask */
-#define TAHVO_REG_CHAPWMR	0x04	/* (RW) Charger PWM */
-#define TAHVO_REG_LEDPWMR	0x05	/* (RW) LED PWM */
-#define TAHVO_REG_USBR		0x06	/* (RW) USB control */
-#define TAHVO_REG_RCR		0x07	/* (RW) Some kind of power management */
-#define TAHVO_REG_CCR1		0x08	/* (RW) Common control register 1 */
-#define TAHVO_REG_CCR2		0x09	/* (RW) Common control register 2 */
-#define TAHVO_REG_TESTR1	0x0a	/* (RW) Test register 1 */
-#define TAHVO_REG_TESTR2	0x0b	/* (RW) Test register 2 */
-#define TAHVO_REG_NOPR		0x0c	/* (RW) Number of periods */
-#define TAHVO_REG_FRR		0x0d	/* (RO) FR */
+#define TAHVO_REG_ASICR     0x00    /* (RO) ASIC ID & revision */
+#define TAHVO_REG_IDR       0x01    /* (T)  Interrupt ID */
+#define TAHVO_REG_IDSR      0x02    /* (RO) Interrupt status */
+#define TAHVO_REG_IMR       0x03    /* (RW) Interrupt mask */
+#define TAHVO_REG_CHAPWMR   0x04    /* (RW) Charger PWM */
+#define TAHVO_REG_LEDPWMR   0x05    /* (RW) LED PWM */
+#define TAHVO_REG_USBR      0x06    /* (RW) USB control */
+#define TAHVO_REG_RCR       0x07    /* (RW) Some kind of power management */
+#define TAHVO_REG_CCR1      0x08    /* (RW) Common control register 1 */
+#define TAHVO_REG_CCR2      0x09    /* (RW) Common control register 2 */
+#define TAHVO_REG_TESTR1    0x0a    /* (RW) Test register 1 */
+#define TAHVO_REG_TESTR2    0x0b    /* (RW) Test register 2 */
+#define TAHVO_REG_NOPR      0x0c    /* (RW) Number of periods */
+#define TAHVO_REG_FRR       0x0d    /* (RO) FR */
 
 static inline uint16_t tahvo_read(CBusTahvo *s, int reg)
 {
@@ -508,10 +508,10 @@ static inline uint16_t tahvo_read(CBusTahvo *s, int reg)
 
     switch (reg) {
     case TAHVO_REG_ASICR:
-        return 0x0021 | (s->is_betty ? 0x0b00 : 0x0300);	/* 22 in N810 */
+        return 0x0021 | (s->is_betty ? 0x0b00 : 0x0300);    /* 22 in N810 */
 
     case TAHVO_REG_IDR:
-    case TAHVO_REG_IDSR:	/* XXX: what does this do?  */
+    case TAHVO_REG_IDSR:    /* XXX: what does this do?  */
         return s->irqst;
 
     case TAHVO_REG_IMR:
diff --git a/hw/misc/mst_fpga.c b/hw/misc/mst_fpga.c
index 7692825867..22c01af770 100644
--- a/hw/misc/mst_fpga.c
+++ b/hw/misc/mst_fpga.c
@@ -19,26 +19,26 @@
 #include "qom/object.h"
 
 /* Mainstone FPGA for extern irqs */
-#define FPGA_GPIO_PIN	0
-#define MST_NUM_IRQS	16
-#define MST_LEDDAT1		0x10
-#define MST_LEDDAT2		0x14
-#define MST_LEDCTRL		0x40
-#define MST_GPSWR		0x60
-#define MST_MSCWR1		0x80
-#define MST_MSCWR2		0x84
-#define MST_MSCWR3		0x88
-#define MST_MSCRD		0x90
-#define MST_INTMSKENA	0xc0
-#define MST_INTSETCLR	0xd0
-#define MST_PCMCIA0		0xe0
-#define MST_PCMCIA1		0xe4
-
-#define MST_PCMCIAx_READY	(1 << 10)
-#define MST_PCMCIAx_nCD		(1 << 5)
-
-#define MST_PCMCIA_CD0_IRQ	9
-#define MST_PCMCIA_CD1_IRQ	13
+#define FPGA_GPIO_PIN   0
+#define MST_NUM_IRQS    16
+#define MST_LEDDAT1     0x10
+#define MST_LEDDAT2     0x14
+#define MST_LEDCTRL     0x40
+#define MST_GPSWR       0x60
+#define MST_MSCWR1      0x80
+#define MST_MSCWR2      0x84
+#define MST_MSCWR3      0x88
+#define MST_MSCRD       0x90
+#define MST_INTMSKENA   0xc0
+#define MST_INTSETCLR   0xd0
+#define MST_PCMCIA0     0xe0
+#define MST_PCMCIA1     0xe4
+
+#define MST_PCMCIAx_READY   (1 << 10)
+#define MST_PCMCIAx_nCD     (1 << 5)
+
+#define MST_PCMCIA_CD0_IRQ  9
+#define MST_PCMCIA_CD1_IRQ  13
 
 #define TYPE_MAINSTONE_FPGA "mainstone-fpga"
 OBJECT_DECLARE_SIMPLE_TYPE(mst_irq_state, MAINSTONE_FPGA)
@@ -68,139 +68,139 @@ struct mst_irq_state {
 static void
 mst_fpga_set_irq(void *opaque, int irq, int level)
 {
-	mst_irq_state *s = (mst_irq_state *)opaque;
-	uint32_t oldint = s->intsetclr & s->intmskena;
-
-	if (level)
-		s->prev_level |= 1u << irq;
-	else
-		s->prev_level &= ~(1u << irq);
-
-	switch(irq) {
-	case MST_PCMCIA_CD0_IRQ:
-		if (level)
-			s->pcmcia0 &= ~MST_PCMCIAx_nCD;
-		else
-			s->pcmcia0 |=  MST_PCMCIAx_nCD;
-		break;
-	case MST_PCMCIA_CD1_IRQ:
-		if (level)
-			s->pcmcia1 &= ~MST_PCMCIAx_nCD;
-		else
-			s->pcmcia1 |=  MST_PCMCIAx_nCD;
-		break;
-	}
-
-	if ((s->intmskena & (1u << irq)) && level)
-		s->intsetclr |= 1u << irq;
-
-	if (oldint != (s->intsetclr & s->intmskena))
-		qemu_set_irq(s->parent, s->intsetclr & s->intmskena);
+    mst_irq_state *s = (mst_irq_state *)opaque;
+    uint32_t oldint = s->intsetclr & s->intmskena;
+
+    if (level)
+        s->prev_level |= 1u << irq;
+    else
+        s->prev_level &= ~(1u << irq);
+
+    switch(irq) {
+    case MST_PCMCIA_CD0_IRQ:
+        if (level)
+            s->pcmcia0 &= ~MST_PCMCIAx_nCD;
+        else
+            s->pcmcia0 |=  MST_PCMCIAx_nCD;
+        break;
+    case MST_PCMCIA_CD1_IRQ:
+        if (level)
+            s->pcmcia1 &= ~MST_PCMCIAx_nCD;
+        else
+            s->pcmcia1 |=  MST_PCMCIAx_nCD;
+        break;
+    }
+
+    if ((s->intmskena & (1u << irq)) && level)
+        s->intsetclr |= 1u << irq;
+
+    if (oldint != (s->intsetclr & s->intmskena))
+        qemu_set_irq(s->parent, s->intsetclr & s->intmskena);
 }
 
 
 static uint64_t
 mst_fpga_readb(void *opaque, hwaddr addr, unsigned size)
 {
-	mst_irq_state *s = (mst_irq_state *) opaque;
-
-	switch (addr) {
-	case MST_LEDDAT1:
-		return s->leddat1;
-	case MST_LEDDAT2:
-		return s->leddat2;
-	case MST_LEDCTRL:
-		return s->ledctrl;
-	case MST_GPSWR:
-		return s->gpswr;
-	case MST_MSCWR1:
-		return s->mscwr1;
-	case MST_MSCWR2:
-		return s->mscwr2;
-	case MST_MSCWR3:
-		return s->mscwr3;
-	case MST_MSCRD:
-		return s->mscrd;
-	case MST_INTMSKENA:
-		return s->intmskena;
-	case MST_INTSETCLR:
-		return s->intsetclr;
-	case MST_PCMCIA0:
-		return s->pcmcia0;
-	case MST_PCMCIA1:
-		return s->pcmcia1;
-	default:
-		printf("Mainstone - mst_fpga_readb: Bad register offset "
-			"0x" HWADDR_FMT_plx "\n", addr);
-	}
-	return 0;
+    mst_irq_state *s = (mst_irq_state *) opaque;
+
+    switch (addr) {
+    case MST_LEDDAT1:
+        return s->leddat1;
+    case MST_LEDDAT2:
+        return s->leddat2;
+    case MST_LEDCTRL:
+        return s->ledctrl;
+    case MST_GPSWR:
+        return s->gpswr;
+    case MST_MSCWR1:
+        return s->mscwr1;
+    case MST_MSCWR2:
+        return s->mscwr2;
+    case MST_MSCWR3:
+        return s->mscwr3;
+    case MST_MSCRD:
+        return s->mscrd;
+    case MST_INTMSKENA:
+        return s->intmskena;
+    case MST_INTSETCLR:
+        return s->intsetclr;
+    case MST_PCMCIA0:
+        return s->pcmcia0;
+    case MST_PCMCIA1:
+        return s->pcmcia1;
+    default:
+        printf("Mainstone - mst_fpga_readb: Bad register offset "
+            "0x" HWADDR_FMT_plx "\n", addr);
+    }
+    return 0;
 }
 
 static void
 mst_fpga_writeb(void *opaque, hwaddr addr, uint64_t value,
-		unsigned size)
+        unsigned size)
 {
-	mst_irq_state *s = (mst_irq_state *) opaque;
-	value &= 0xffffffff;
-
-	switch (addr) {
-	case MST_LEDDAT1:
-		s->leddat1 = value;
-		break;
-	case MST_LEDDAT2:
-		s->leddat2 = value;
-		break;
-	case MST_LEDCTRL:
-		s->ledctrl = value;
-		break;
-	case MST_GPSWR:
-		s->gpswr = value;
-		break;
-	case MST_MSCWR1:
-		s->mscwr1 = value;
-		break;
-	case MST_MSCWR2:
-		s->mscwr2 = value;
-		break;
-	case MST_MSCWR3:
-		s->mscwr3 = value;
-		break;
-	case MST_MSCRD:
-		s->mscrd =  value;
-		break;
-	case MST_INTMSKENA:	/* Mask interrupt */
-		s->intmskena = (value & 0xFEEFF);
-		qemu_set_irq(s->parent, s->intsetclr & s->intmskena);
-		break;
-	case MST_INTSETCLR:	/* clear or set interrupt */
-		s->intsetclr = (value & 0xFEEFF);
-		qemu_set_irq(s->parent, s->intsetclr & s->intmskena);
-		break;
-		/* For PCMCIAx allow the to change only power and reset */
-	case MST_PCMCIA0:
-		s->pcmcia0 = (value & 0x1f) | (s->pcmcia0 & ~0x1f);
-		break;
-	case MST_PCMCIA1:
-		s->pcmcia1 = (value & 0x1f) | (s->pcmcia1 & ~0x1f);
-		break;
-	default:
-		printf("Mainstone - mst_fpga_writeb: Bad register offset "
-			"0x" HWADDR_FMT_plx "\n", addr);
-	}
+    mst_irq_state *s = (mst_irq_state *) opaque;
+    value &= 0xffffffff;
+
+    switch (addr) {
+    case MST_LEDDAT1:
+        s->leddat1 = value;
+        break;
+    case MST_LEDDAT2:
+        s->leddat2 = value;
+        break;
+    case MST_LEDCTRL:
+        s->ledctrl = value;
+        break;
+    case MST_GPSWR:
+        s->gpswr = value;
+        break;
+    case MST_MSCWR1:
+        s->mscwr1 = value;
+        break;
+    case MST_MSCWR2:
+        s->mscwr2 = value;
+        break;
+    case MST_MSCWR3:
+        s->mscwr3 = value;
+        break;
+    case MST_MSCRD:
+        s->mscrd =  value;
+        break;
+    case MST_INTMSKENA: /* Mask interrupt */
+        s->intmskena = (value & 0xFEEFF);
+        qemu_set_irq(s->parent, s->intsetclr & s->intmskena);
+        break;
+    case MST_INTSETCLR: /* clear or set interrupt */
+        s->intsetclr = (value & 0xFEEFF);
+        qemu_set_irq(s->parent, s->intsetclr & s->intmskena);
+        break;
+        /* For PCMCIAx allow the to change only power and reset */
+    case MST_PCMCIA0:
+        s->pcmcia0 = (value & 0x1f) | (s->pcmcia0 & ~0x1f);
+        break;
+    case MST_PCMCIA1:
+        s->pcmcia1 = (value & 0x1f) | (s->pcmcia1 & ~0x1f);
+        break;
+    default:
+        printf("Mainstone - mst_fpga_writeb: Bad register offset "
+            "0x" HWADDR_FMT_plx "\n", addr);
+    }
 }
 
 static const MemoryRegionOps mst_fpga_ops = {
-	.read = mst_fpga_readb,
-	.write = mst_fpga_writeb,
-	.endianness = DEVICE_NATIVE_ENDIAN,
+    .read = mst_fpga_readb,
+    .write = mst_fpga_writeb,
+    .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
 static int mst_fpga_post_load(void *opaque, int version_id)
 {
-	mst_irq_state *s = (mst_irq_state *) opaque;
+    mst_irq_state *s = (mst_irq_state *) opaque;
 
-	qemu_set_irq(s->parent, s->intsetclr & s->intmskena);
-	return 0;
+    qemu_set_irq(s->parent, s->intsetclr & s->intmskena);
+    return 0;
 }
 
 static void mst_fpga_init(Object *obj)
@@ -228,21 +228,21 @@ static const VMStateDescription vmstate_mst_fpga_regs = {
     .minimum_version_id = 0,
     .post_load = mst_fpga_post_load,
     .fields = (VMStateField[]) {
-		VMSTATE_UINT32(prev_level, mst_irq_state),
-		VMSTATE_UINT32(leddat1, mst_irq_state),
-		VMSTATE_UINT32(leddat2, mst_irq_state),
-		VMSTATE_UINT32(ledctrl, mst_irq_state),
-		VMSTATE_UINT32(gpswr, mst_irq_state),
-		VMSTATE_UINT32(mscwr1, mst_irq_state),
-		VMSTATE_UINT32(mscwr2, mst_irq_state),
-		VMSTATE_UINT32(mscwr3, mst_irq_state),
-		VMSTATE_UINT32(mscrd, mst_irq_state),
-		VMSTATE_UINT32(intmskena, mst_irq_state),
-		VMSTATE_UINT32(intsetclr, mst_irq_state),
-		VMSTATE_UINT32(pcmcia0, mst_irq_state),
-		VMSTATE_UINT32(pcmcia1, mst_irq_state),
-		VMSTATE_END_OF_LIST(),
-	},
+        VMSTATE_UINT32(prev_level, mst_irq_state),
+        VMSTATE_UINT32(leddat1, mst_irq_state),
+        VMSTATE_UINT32(leddat2, mst_irq_state),
+        VMSTATE_UINT32(ledctrl, mst_irq_state),
+        VMSTATE_UINT32(gpswr, mst_irq_state),
+        VMSTATE_UINT32(mscwr1, mst_irq_state),
+        VMSTATE_UINT32(mscwr2, mst_irq_state),
+        VMSTATE_UINT32(mscwr3, mst_irq_state),
+        VMSTATE_UINT32(mscrd, mst_irq_state),
+        VMSTATE_UINT32(intmskena, mst_irq_state),
+        VMSTATE_UINT32(intsetclr, mst_irq_state),
+        VMSTATE_UINT32(pcmcia0, mst_irq_state),
+        VMSTATE_UINT32(pcmcia1, mst_irq_state),
+        VMSTATE_END_OF_LIST(),
+    },
 };
 
 static void mst_fpga_class_init(ObjectClass *klass, void *data)
diff --git a/hw/misc/omap_clk.c b/hw/misc/omap_clk.c
index c77ca2fc74..3bcd831a02 100644
--- a/hw/misc/omap_clk.c
+++ b/hw/misc/omap_clk.c
@@ -30,174 +30,174 @@ struct clk {
     struct clk *parent;
     struct clk *child1;
     struct clk *sibling;
-#define ALWAYS_ENABLED		(1 << 0)
-#define CLOCK_IN_OMAP310	(1 << 10)
-#define CLOCK_IN_OMAP730	(1 << 11)
-#define CLOCK_IN_OMAP1510	(1 << 12)
-#define CLOCK_IN_OMAP16XX	(1 << 13)
-#define CLOCK_IN_OMAP242X	(1 << 14)
-#define CLOCK_IN_OMAP243X	(1 << 15)
-#define CLOCK_IN_OMAP343X	(1 << 16)
+#define ALWAYS_ENABLED      (1 << 0)
+#define CLOCK_IN_OMAP310    (1 << 10)
+#define CLOCK_IN_OMAP730    (1 << 11)
+#define CLOCK_IN_OMAP1510   (1 << 12)
+#define CLOCK_IN_OMAP16XX   (1 << 13)
+#define CLOCK_IN_OMAP242X   (1 << 14)
+#define CLOCK_IN_OMAP243X   (1 << 15)
+#define CLOCK_IN_OMAP343X   (1 << 16)
     uint32_t flags;
     int id;
 
-    int running;		/* Is currently ticking */
-    int enabled;		/* Is enabled, regardless of its input clk */
-    unsigned long rate;		/* Current rate (if .running) */
-    unsigned int divisor;	/* Rate relative to input (if .enabled) */
-    unsigned int multiplier;	/* Rate relative to input (if .enabled) */
-    qemu_irq users[16];		/* Who to notify on change */
-    int usecount;		/* Automatically idle when unused */
+    int running;        /* Is currently ticking */
+    int enabled;        /* Is enabled, regardless of its input clk */
+    unsigned long rate;     /* Current rate (if .running) */
+    unsigned int divisor;   /* Rate relative to input (if .enabled) */
+    unsigned int multiplier;    /* Rate relative to input (if .enabled) */
+    qemu_irq users[16];     /* Who to notify on change */
+    int usecount;       /* Automatically idle when unused */
 };
 
 static struct clk xtal_osc12m = {
-    .name	= "xtal_osc_12m",
-    .rate	= 12000000,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
+    .name   = "xtal_osc_12m",
+    .rate   = 12000000,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
 };
 
 static struct clk xtal_osc32k = {
-    .name	= "xtal_osc_32k",
-    .rate	= 32768,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
+    .name   = "xtal_osc_32k",
+    .rate   = 32768,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
             CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
 };
 
 static struct clk ck_ref = {
-    .name	= "ck_ref",
-    .alias	= "clkin",
-    .parent	= &xtal_osc12m,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
+    .name   = "ck_ref",
+    .alias  = "clkin",
+    .parent = &xtal_osc12m,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
             ALWAYS_ENABLED,
 };
 
 /* If a dpll is disabled it becomes a bypass, child clocks don't stop */
 static struct clk dpll1 = {
-    .name	= "dpll1",
-    .parent	= &ck_ref,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
+    .name   = "dpll1",
+    .parent = &ck_ref,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
             ALWAYS_ENABLED,
 };
 
 static struct clk dpll2 = {
-    .name	= "dpll2",
-    .parent	= &ck_ref,
-    .flags	= CLOCK_IN_OMAP310 | ALWAYS_ENABLED,
+    .name   = "dpll2",
+    .parent = &ck_ref,
+    .flags  = CLOCK_IN_OMAP310 | ALWAYS_ENABLED,
 };
 
 static struct clk dpll3 = {
-    .name	= "dpll3",
-    .parent	= &ck_ref,
-    .flags	= CLOCK_IN_OMAP310 | ALWAYS_ENABLED,
+    .name   = "dpll3",
+    .parent = &ck_ref,
+    .flags  = CLOCK_IN_OMAP310 | ALWAYS_ENABLED,
 };
 
 static struct clk dpll4 = {
-    .name	= "dpll4",
-    .parent	= &ck_ref,
-    .multiplier	= 4,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
+    .name   = "dpll4",
+    .parent = &ck_ref,
+    .multiplier = 4,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
 };
 
 static struct clk apll = {
-    .name	= "apll",
-    .parent	= &ck_ref,
-    .multiplier	= 48,
-    .divisor	= 12,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
+    .name   = "apll",
+    .parent = &ck_ref,
+    .multiplier = 48,
+    .divisor    = 12,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
 };
 
 static struct clk ck_48m = {
-    .name	= "ck_48m",
-    .parent	= &dpll4,	/* either dpll4 or apll */
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
+    .name   = "ck_48m",
+    .parent = &dpll4,   /* either dpll4 or apll */
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
 };
 
 static struct clk ck_dpll1out = {
-    .name	= "ck_dpll1out",
-    .parent	= &dpll1,
-    .flags	= CLOCK_IN_OMAP16XX,
+    .name   = "ck_dpll1out",
+    .parent = &dpll1,
+    .flags  = CLOCK_IN_OMAP16XX,
 };
 
 static struct clk sossi_ck = {
-    .name	= "ck_sossi",
-    .parent	= &ck_dpll1out,
-    .flags	= CLOCK_IN_OMAP16XX,
+    .name   = "ck_sossi",
+    .parent = &ck_dpll1out,
+    .flags  = CLOCK_IN_OMAP16XX,
 };
 
 static struct clk clkm1 = {
-    .name	= "clkm1",
-    .alias	= "ck_gen1",
-    .parent	= &dpll1,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
+    .name   = "clkm1",
+    .alias  = "ck_gen1",
+    .parent = &dpll1,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
             ALWAYS_ENABLED,
 };
 
 static struct clk clkm2 = {
-    .name	= "clkm2",
-    .alias	= "ck_gen2",
-    .parent	= &dpll1,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
+    .name   = "clkm2",
+    .alias  = "ck_gen2",
+    .parent = &dpll1,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
             ALWAYS_ENABLED,
 };
 
 static struct clk clkm3 = {
-    .name	= "clkm3",
-    .alias	= "ck_gen3",
-    .parent	= &dpll1,	/* either dpll1 or ck_ref */
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
+    .name   = "clkm3",
+    .alias  = "ck_gen3",
+    .parent = &dpll1,   /* either dpll1 or ck_ref */
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
             ALWAYS_ENABLED,
 };
 
 static struct clk arm_ck = {
-    .name	= "arm_ck",
-    .alias	= "mpu_ck",
-    .parent	= &clkm1,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
+    .name   = "arm_ck",
+    .alias  = "mpu_ck",
+    .parent = &clkm1,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
             ALWAYS_ENABLED,
 };
 
 static struct clk armper_ck = {
-    .name	= "armper_ck",
-    .alias	= "mpuper_ck",
-    .parent	= &clkm1,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
+    .name   = "armper_ck",
+    .alias  = "mpuper_ck",
+    .parent = &clkm1,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
 };
 
 static struct clk arm_gpio_ck = {
-    .name	= "arm_gpio_ck",
-    .alias	= "mpu_gpio_ck",
-    .parent	= &clkm1,
-    .divisor	= 1,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310,
+    .name   = "arm_gpio_ck",
+    .alias  = "mpu_gpio_ck",
+    .parent = &clkm1,
+    .divisor    = 1,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310,
 };
 
 static struct clk armxor_ck = {
-    .name	= "armxor_ck",
-    .alias	= "mpuxor_ck",
-    .parent	= &ck_ref,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
+    .name   = "armxor_ck",
+    .alias  = "mpuxor_ck",
+    .parent = &ck_ref,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
 };
 
 static struct clk armtim_ck = {
-    .name	= "armtim_ck",
-    .alias	= "mputim_ck",
-    .parent	= &ck_ref,	/* either CLKIN or DPLL1 */
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
+    .name   = "armtim_ck",
+    .alias  = "mputim_ck",
+    .parent = &ck_ref,  /* either CLKIN or DPLL1 */
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
 };
 
 static struct clk armwdt_ck = {
-    .name	= "armwdt_ck",
-    .alias	= "mpuwd_ck",
-    .parent	= &clkm1,
-    .divisor	= 14,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
+    .name   = "armwdt_ck",
+    .alias  = "mpuwd_ck",
+    .parent = &clkm1,
+    .divisor    = 14,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
             ALWAYS_ENABLED,
 };
 
 static struct clk arminth_ck16xx = {
-    .name	= "arminth_ck",
-    .parent	= &arm_ck,
-    .flags	= CLOCK_IN_OMAP16XX | ALWAYS_ENABLED,
+    .name   = "arminth_ck",
+    .parent = &arm_ck,
+    .flags  = CLOCK_IN_OMAP16XX | ALWAYS_ENABLED,
     /* Note: On 16xx the frequency can be divided by 2 by programming
      * ARM_CKCTL:ARM_INTHCK_SEL(14) to 1
      *
@@ -206,48 +206,48 @@ static struct clk arminth_ck16xx = {
 };
 
 static struct clk dsp_ck = {
-    .name	= "dsp_ck",
-    .parent	= &clkm2,
-    .flags	= CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX,
+    .name   = "dsp_ck",
+    .parent = &clkm2,
+    .flags  = CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX,
 };
 
 static struct clk dspmmu_ck = {
-    .name	= "dspmmu_ck",
-    .parent	= &clkm2,
-    .flags	= CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX |
+    .name   = "dspmmu_ck",
+    .parent = &clkm2,
+    .flags  = CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX |
             ALWAYS_ENABLED,
 };
 
 static struct clk dspper_ck = {
-    .name	= "dspper_ck",
-    .parent	= &clkm2,
-    .flags	= CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX,
+    .name   = "dspper_ck",
+    .parent = &clkm2,
+    .flags  = CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX,
 };
 
 static struct clk dspxor_ck = {
-    .name	= "dspxor_ck",
-    .parent	= &ck_ref,
-    .flags	= CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX,
+    .name   = "dspxor_ck",
+    .parent = &ck_ref,
+    .flags  = CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX,
 };
 
 static struct clk dsptim_ck = {
-    .name	= "dsptim_ck",
-    .parent	= &ck_ref,
-    .flags	= CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX,
+    .name   = "dsptim_ck",
+    .parent = &ck_ref,
+    .flags  = CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX,
 };
 
 static struct clk tc_ck = {
-    .name	= "tc_ck",
-    .parent	= &clkm3,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX |
+    .name   = "tc_ck",
+    .parent = &clkm3,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX |
             CLOCK_IN_OMAP730 | CLOCK_IN_OMAP310 |
             ALWAYS_ENABLED,
 };
 
 static struct clk arminth_ck15xx = {
-    .name	= "arminth_ck",
-    .parent	= &tc_ck,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310 | ALWAYS_ENABLED,
+    .name   = "arminth_ck",
+    .parent = &tc_ck,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310 | ALWAYS_ENABLED,
     /* Note: On 1510 the frequency follows TC_CK
      *
      * 16xx version is in MPU clocks.
@@ -256,606 +256,606 @@ static struct clk arminth_ck15xx = {
 
 static struct clk tipb_ck = {
     /* No-idle controlled by "tc_ck" */
-    .name	= "tipb_ck",
-    .parent	= &tc_ck,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310 | ALWAYS_ENABLED,
+    .name   = "tipb_ck",
+    .parent = &tc_ck,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310 | ALWAYS_ENABLED,
 };
 
 static struct clk l3_ocpi_ck = {
     /* No-idle controlled by "tc_ck" */
-    .name	= "l3_ocpi_ck",
-    .parent	= &tc_ck,
-    .flags	= CLOCK_IN_OMAP16XX,
+    .name   = "l3_ocpi_ck",
+    .parent = &tc_ck,
+    .flags  = CLOCK_IN_OMAP16XX,
 };
 
 static struct clk tc1_ck = {
-    .name	= "tc1_ck",
-    .parent	= &tc_ck,
-    .flags	= CLOCK_IN_OMAP16XX,
+    .name   = "tc1_ck",
+    .parent = &tc_ck,
+    .flags  = CLOCK_IN_OMAP16XX,
 };
 
 static struct clk tc2_ck = {
-    .name	= "tc2_ck",
-    .parent	= &tc_ck,
-    .flags	= CLOCK_IN_OMAP16XX,
+    .name   = "tc2_ck",
+    .parent = &tc_ck,
+    .flags  = CLOCK_IN_OMAP16XX,
 };
 
 static struct clk dma_ck = {
     /* No-idle controlled by "tc_ck" */
-    .name	= "dma_ck",
-    .parent	= &tc_ck,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
+    .name   = "dma_ck",
+    .parent = &tc_ck,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
             ALWAYS_ENABLED,
 };
 
 static struct clk dma_lcdfree_ck = {
-    .name	= "dma_lcdfree_ck",
-    .parent	= &tc_ck,
-    .flags	= CLOCK_IN_OMAP16XX | ALWAYS_ENABLED,
+    .name   = "dma_lcdfree_ck",
+    .parent = &tc_ck,
+    .flags  = CLOCK_IN_OMAP16XX | ALWAYS_ENABLED,
 };
 
 static struct clk api_ck = {
-    .name	= "api_ck",
-    .alias	= "mpui_ck",
-    .parent	= &tc_ck,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
+    .name   = "api_ck",
+    .alias  = "mpui_ck",
+    .parent = &tc_ck,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
 };
 
 static struct clk lb_ck = {
-    .name	= "lb_ck",
-    .parent	= &tc_ck,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310,
+    .name   = "lb_ck",
+    .parent = &tc_ck,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310,
 };
 
 static struct clk lbfree_ck = {
-    .name	= "lbfree_ck",
-    .parent	= &tc_ck,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310,
+    .name   = "lbfree_ck",
+    .parent = &tc_ck,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310,
 };
 
 static struct clk hsab_ck = {
-    .name	= "hsab_ck",
-    .parent	= &tc_ck,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310,
+    .name   = "hsab_ck",
+    .parent = &tc_ck,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310,
 };
 
 static struct clk rhea1_ck = {
-    .name	= "rhea1_ck",
-    .parent	= &tc_ck,
-    .flags	= CLOCK_IN_OMAP16XX | ALWAYS_ENABLED,
+    .name   = "rhea1_ck",
+    .parent = &tc_ck,
+    .flags  = CLOCK_IN_OMAP16XX | ALWAYS_ENABLED,
 };
 
 static struct clk rhea2_ck = {
-    .name	= "rhea2_ck",
-    .parent	= &tc_ck,
-    .flags	= CLOCK_IN_OMAP16XX | ALWAYS_ENABLED,
+    .name   = "rhea2_ck",
+    .parent = &tc_ck,
+    .flags  = CLOCK_IN_OMAP16XX | ALWAYS_ENABLED,
 };
 
 static struct clk lcd_ck_16xx = {
-    .name	= "lcd_ck",
-    .parent	= &clkm3,
-    .flags	= CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP730,
+    .name   = "lcd_ck",
+    .parent = &clkm3,
+    .flags  = CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP730,
 };
 
 static struct clk lcd_ck_1510 = {
-    .name	= "lcd_ck",
-    .parent	= &clkm3,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310,
+    .name   = "lcd_ck",
+    .parent = &clkm3,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310,
 };
 
 static struct clk uart1_1510 = {
-    .name	= "uart1_ck",
+    .name   = "uart1_ck",
     /* Direct from ULPD, no real parent */
-    .parent	= &armper_ck,	/* either armper_ck or dpll4 */
-    .rate	= 12000000,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310 | ALWAYS_ENABLED,
+    .parent = &armper_ck,   /* either armper_ck or dpll4 */
+    .rate   = 12000000,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310 | ALWAYS_ENABLED,
 };
 
 static struct clk uart1_16xx = {
-    .name	= "uart1_ck",
+    .name   = "uart1_ck",
     /* Direct from ULPD, no real parent */
-    .parent	= &armper_ck,
-    .rate	= 48000000,
-    .flags	= CLOCK_IN_OMAP16XX,
+    .parent = &armper_ck,
+    .rate   = 48000000,
+    .flags  = CLOCK_IN_OMAP16XX,
 };
 
 static struct clk uart2_ck = {
-    .name	= "uart2_ck",
+    .name   = "uart2_ck",
     /* Direct from ULPD, no real parent */
-    .parent	= &armper_ck,	/* either armper_ck or dpll4 */
-    .rate	= 12000000,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
+    .parent = &armper_ck,   /* either armper_ck or dpll4 */
+    .rate   = 12000000,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310 |
             ALWAYS_ENABLED,
 };
 
 static struct clk uart3_1510 = {
-    .name	= "uart3_ck",
+    .name   = "uart3_ck",
     /* Direct from ULPD, no real parent */
-    .parent	= &armper_ck,	/* either armper_ck or dpll4 */
-    .rate	= 12000000,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310 | ALWAYS_ENABLED,
+    .parent = &armper_ck,   /* either armper_ck or dpll4 */
+    .rate   = 12000000,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310 | ALWAYS_ENABLED,
 };
 
 static struct clk uart3_16xx = {
-    .name	= "uart3_ck",
+    .name   = "uart3_ck",
     /* Direct from ULPD, no real parent */
-    .parent	= &armper_ck,
-    .rate	= 48000000,
-    .flags	= CLOCK_IN_OMAP16XX,
+    .parent = &armper_ck,
+    .rate   = 48000000,
+    .flags  = CLOCK_IN_OMAP16XX,
 };
 
-static struct clk usb_clk0 = {	/* 6 MHz output on W4_USB_CLK0 */
-    .name	= "usb_clk0",
-    .alias	= "usb.clko",
+static struct clk usb_clk0 = {  /* 6 MHz output on W4_USB_CLK0 */
+    .name   = "usb_clk0",
+    .alias  = "usb.clko",
     /* Direct from ULPD, no parent */
-    .rate	= 6000000,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
+    .rate   = 6000000,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
 };
 
 static struct clk usb_hhc_ck1510 = {
-    .name	= "usb_hhc_ck",
+    .name   = "usb_hhc_ck",
     /* Direct from ULPD, no parent */
-    .rate	= 48000000, /* Actually 2 clocks, 12MHz and 48MHz */
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310,
+    .rate   = 48000000, /* Actually 2 clocks, 12MHz and 48MHz */
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP310,
 };
 
 static struct clk usb_hhc_ck16xx = {
-    .name	= "usb_hhc_ck",
+    .name   = "usb_hhc_ck",
     /* Direct from ULPD, no parent */
-    .rate	= 48000000,
+    .rate   = 48000000,
     /* OTG_SYSCON_2.OTG_PADEN == 0 (not 1510-compatible) */
-    .flags	= CLOCK_IN_OMAP16XX,
+    .flags  = CLOCK_IN_OMAP16XX,
 };
 
 static struct clk usb_w2fc_mclk = {
-    .name	= "usb_w2fc_mclk",
-    .alias	= "usb_w2fc_ck",
-    .parent	= &ck_48m,
-    .rate	= 48000000,
-    .flags	= CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX,
+    .name   = "usb_w2fc_mclk",
+    .alias  = "usb_w2fc_ck",
+    .parent = &ck_48m,
+    .rate   = 48000000,
+    .flags  = CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX,
 };
 
 static struct clk mclk_1510 = {
-    .name	= "mclk",
+    .name   = "mclk",
     /* Direct from ULPD, no parent. May be enabled by ext hardware. */
-    .rate	= 12000000,
-    .flags	= CLOCK_IN_OMAP1510,
+    .rate   = 12000000,
+    .flags  = CLOCK_IN_OMAP1510,
 };
 
 static struct clk bclk_310 = {
-    .name	= "bt_mclk_out",	/* Alias midi_mclk_out? */
-    .parent	= &armper_ck,
-    .flags	= CLOCK_IN_OMAP310,
+    .name   = "bt_mclk_out",    /* Alias midi_mclk_out? */
+    .parent = &armper_ck,
+    .flags  = CLOCK_IN_OMAP310,
 };
 
 static struct clk mclk_310 = {
-    .name	= "com_mclk_out",
-    .parent	= &armper_ck,
-    .flags	= CLOCK_IN_OMAP310,
+    .name   = "com_mclk_out",
+    .parent = &armper_ck,
+    .flags  = CLOCK_IN_OMAP310,
 };
 
 static struct clk mclk_16xx = {
-    .name	= "mclk",
+    .name   = "mclk",
     /* Direct from ULPD, no parent. May be enabled by ext hardware. */
-    .flags	= CLOCK_IN_OMAP16XX,
+    .flags  = CLOCK_IN_OMAP16XX,
 };
 
 static struct clk bclk_1510 = {
-    .name	= "bclk",
+    .name   = "bclk",
     /* Direct from ULPD, no parent. May be enabled by ext hardware. */
-    .rate	= 12000000,
-    .flags	= CLOCK_IN_OMAP1510,
+    .rate   = 12000000,
+    .flags  = CLOCK_IN_OMAP1510,
 };
 
 static struct clk bclk_16xx = {
-    .name	= "bclk",
+    .name   = "bclk",
     /* Direct from ULPD, no parent. May be enabled by ext hardware. */
-    .flags	= CLOCK_IN_OMAP16XX,
+    .flags  = CLOCK_IN_OMAP16XX,
 };
 
 static struct clk mmc1_ck = {
-    .name	= "mmc_ck",
-    .id		= 1,
+    .name   = "mmc_ck",
+    .id     = 1,
     /* Functional clock is direct from ULPD, interface clock is ARMPER */
-    .parent	= &armper_ck,	/* either armper_ck or dpll4 */
-    .rate	= 48000000,
-    .flags	= CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
+    .parent = &armper_ck,   /* either armper_ck or dpll4 */
+    .rate   = 48000000,
+    .flags  = CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX | CLOCK_IN_OMAP310,
 };
 
 static struct clk mmc2_ck = {
-    .name	= "mmc_ck",
-    .id		= 2,
+    .name   = "mmc_ck",
+    .id     = 2,
     /* Functional clock is direct from ULPD, interface clock is ARMPER */
-    .parent	= &armper_ck,
-    .rate	= 48000000,
-    .flags	= CLOCK_IN_OMAP16XX,
+    .parent = &armper_ck,
+    .rate   = 48000000,
+    .flags  = CLOCK_IN_OMAP16XX,
 };
 
 static struct clk cam_mclk = {
-    .name	= "cam.mclk",
-    .flags	= CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX,
-    .rate	= 12000000,
+    .name   = "cam.mclk",
+    .flags  = CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX,
+    .rate   = 12000000,
 };
 
 static struct clk cam_exclk = {
-    .name	= "cam.exclk",
-    .flags	= CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX,
+    .name   = "cam.exclk",
+    .flags  = CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX,
     /* Either 12M from cam.mclk or 48M from dpll4 */
-    .parent	= &cam_mclk,
+    .parent = &cam_mclk,
 };
 
 static struct clk cam_lclk = {
-    .name	= "cam.lclk",
-    .flags	= CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX,
+    .name   = "cam.lclk",
+    .flags  = CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX,
 };
 
 static struct clk i2c_fck = {
-    .name	= "i2c_fck",
-    .id		= 1,
-    .flags	= CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX |
+    .name   = "i2c_fck",
+    .id     = 1,
+    .flags  = CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX |
             ALWAYS_ENABLED,
-    .parent	= &armxor_ck,
+    .parent = &armxor_ck,
 };
 
 static struct clk i2c_ick = {
-    .name	= "i2c_ick",
-    .id		= 1,
-    .flags	= CLOCK_IN_OMAP16XX | ALWAYS_ENABLED,
-    .parent	= &armper_ck,
+    .name   = "i2c_ick",
+    .id     = 1,
+    .flags  = CLOCK_IN_OMAP16XX | ALWAYS_ENABLED,
+    .parent = &armper_ck,
 };
 
 static struct clk clk32k = {
-    .name	= "clk32-kHz",
-    .flags	= CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX |
+    .name   = "clk32-kHz",
+    .flags  = CLOCK_IN_OMAP310 | CLOCK_IN_OMAP1510 | CLOCK_IN_OMAP16XX |
             CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
-    .parent	= &xtal_osc32k,
+    .parent = &xtal_osc32k,
 };
 
 static struct clk ref_clk = {
-    .name	= "ref_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
-    .rate	= 12000000,	/* 12 MHz or 13 MHz or 19.2 MHz */
-    /*.parent	= sys.xtalin */
+    .name   = "ref_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
+    .rate   = 12000000, /* 12 MHz or 13 MHz or 19.2 MHz */
+    /*.parent   = sys.xtalin */
 };
 
 static struct clk apll_96m = {
-    .name	= "apll_96m",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
-    .rate	= 96000000,
-    /*.parent	= ref_clk */
+    .name   = "apll_96m",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
+    .rate   = 96000000,
+    /*.parent   = ref_clk */
 };
 
 static struct clk apll_54m = {
-    .name	= "apll_54m",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
-    .rate	= 54000000,
-    /*.parent	= ref_clk */
+    .name   = "apll_54m",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
+    .rate   = 54000000,
+    /*.parent   = ref_clk */
 };
 
 static struct clk sys_clk = {
-    .name	= "sys_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
-    .rate	= 32768,
-    /*.parent	= sys.xtalin */
+    .name   = "sys_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
+    .rate   = 32768,
+    /*.parent   = sys.xtalin */
 };
 
 static struct clk sleep_clk = {
-    .name	= "sleep_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
-    .rate	= 32768,
-    /*.parent	= sys.xtalin */
+    .name   = "sleep_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
+    .rate   = 32768,
+    /*.parent   = sys.xtalin */
 };
 
 static struct clk dpll_ck = {
-    .name	= "dpll",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
-    .parent	= &ref_clk,
+    .name   = "dpll",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
+    .parent = &ref_clk,
 };
 
 static struct clk dpll_x2_ck = {
-    .name	= "dpll_x2",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
-    .parent	= &ref_clk,
+    .name   = "dpll_x2",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
+    .parent = &ref_clk,
 };
 
 static struct clk wdt1_sys_clk = {
-    .name	= "wdt1_sys_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
-    .rate	= 32768,
-    /*.parent	= sys.xtalin */
+    .name   = "wdt1_sys_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X | ALWAYS_ENABLED,
+    .rate   = 32768,
+    /*.parent   = sys.xtalin */
 };
 
 static struct clk func_96m_clk = {
-    .name	= "func_96m_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .divisor	= 1,
-    .parent	= &apll_96m,
+    .name   = "func_96m_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .divisor    = 1,
+    .parent = &apll_96m,
 };
 
 static struct clk func_48m_clk = {
-    .name	= "func_48m_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .divisor	= 2,
-    .parent	= &apll_96m,
+    .name   = "func_48m_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .divisor    = 2,
+    .parent = &apll_96m,
 };
 
 static struct clk func_12m_clk = {
-    .name	= "func_12m_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .divisor	= 8,
-    .parent	= &apll_96m,
+    .name   = "func_12m_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .divisor    = 8,
+    .parent = &apll_96m,
 };
 
 static struct clk func_54m_clk = {
-    .name	= "func_54m_clk",
-    .flags	= CLOCK_IN_OMAP242X,
-    .divisor	= 1,
-    .parent	= &apll_54m,
+    .name   = "func_54m_clk",
+    .flags  = CLOCK_IN_OMAP242X,
+    .divisor    = 1,
+    .parent = &apll_54m,
 };
 
 static struct clk sys_clkout = {
-    .name	= "clkout",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &sys_clk,
+    .name   = "clkout",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &sys_clk,
 };
 
 static struct clk sys_clkout2 = {
-    .name	= "clkout2",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &sys_clk,
+    .name   = "clkout2",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &sys_clk,
 };
 
 static struct clk core_clk = {
-    .name	= "core_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &dpll_x2_ck,	/* Switchable between dpll_ck and clk32k */
+    .name   = "core_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &dpll_x2_ck,  /* Switchable between dpll_ck and clk32k */
 };
 
 static struct clk l3_clk = {
-    .name	= "l3_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &core_clk,
+    .name   = "l3_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &core_clk,
 };
 
 static struct clk core_l4_iclk = {
-    .name	= "core_l4_iclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &l3_clk,
+    .name   = "core_l4_iclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &l3_clk,
 };
 
 static struct clk wu_l4_iclk = {
-    .name	= "wu_l4_iclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &l3_clk,
+    .name   = "wu_l4_iclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &l3_clk,
 };
 
 static struct clk core_l3_iclk = {
-    .name	= "core_l3_iclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &core_clk,
+    .name   = "core_l3_iclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &core_clk,
 };
 
 static struct clk core_l4_usb_clk = {
-    .name	= "core_l4_usb_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &l3_clk,
+    .name   = "core_l4_usb_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &l3_clk,
 };
 
 static struct clk wu_gpt1_clk = {
-    .name	= "wu_gpt1_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &sys_clk,
+    .name   = "wu_gpt1_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &sys_clk,
 };
 
 static struct clk wu_32k_clk = {
-    .name	= "wu_32k_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &sys_clk,
+    .name   = "wu_32k_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &sys_clk,
 };
 
 static struct clk uart1_fclk = {
-    .name	= "uart1_fclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &func_48m_clk,
+    .name   = "uart1_fclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &func_48m_clk,
 };
 
 static struct clk uart1_iclk = {
-    .name	= "uart1_iclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &core_l4_iclk,
+    .name   = "uart1_iclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &core_l4_iclk,
 };
 
 static struct clk uart2_fclk = {
-    .name	= "uart2_fclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &func_48m_clk,
+    .name   = "uart2_fclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &func_48m_clk,
 };
 
 static struct clk uart2_iclk = {
-    .name	= "uart2_iclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &core_l4_iclk,
+    .name   = "uart2_iclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &core_l4_iclk,
 };
 
 static struct clk uart3_fclk = {
-    .name	= "uart3_fclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &func_48m_clk,
+    .name   = "uart3_fclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &func_48m_clk,
 };
 
 static struct clk uart3_iclk = {
-    .name	= "uart3_iclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &core_l4_iclk,
+    .name   = "uart3_iclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &core_l4_iclk,
 };
 
 static struct clk mpu_fclk = {
-    .name	= "mpu_fclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &core_clk,
+    .name   = "mpu_fclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &core_clk,
 };
 
 static struct clk mpu_iclk = {
-    .name	= "mpu_iclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &core_clk,
+    .name   = "mpu_iclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &core_clk,
 };
 
 static struct clk int_m_fclk = {
-    .name	= "int_m_fclk",
-    .alias	= "mpu_intc_fclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &core_clk,
+    .name   = "int_m_fclk",
+    .alias  = "mpu_intc_fclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &core_clk,
 };
 
 static struct clk int_m_iclk = {
-    .name	= "int_m_iclk",
-    .alias	= "mpu_intc_iclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &core_clk,
+    .name   = "int_m_iclk",
+    .alias  = "mpu_intc_iclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &core_clk,
 };
 
 static struct clk core_gpt2_clk = {
-    .name	= "core_gpt2_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &sys_clk,
+    .name   = "core_gpt2_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &sys_clk,
 };
 
 static struct clk core_gpt3_clk = {
-    .name	= "core_gpt3_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &sys_clk,
+    .name   = "core_gpt3_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &sys_clk,
 };
 
 static struct clk core_gpt4_clk = {
-    .name	= "core_gpt4_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &sys_clk,
+    .name   = "core_gpt4_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &sys_clk,
 };
 
 static struct clk core_gpt5_clk = {
-    .name	= "core_gpt5_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &sys_clk,
+    .name   = "core_gpt5_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &sys_clk,
 };
 
 static struct clk core_gpt6_clk = {
-    .name	= "core_gpt6_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &sys_clk,
+    .name   = "core_gpt6_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &sys_clk,
 };
 
 static struct clk core_gpt7_clk = {
-    .name	= "core_gpt7_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &sys_clk,
+    .name   = "core_gpt7_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &sys_clk,
 };
 
 static struct clk core_gpt8_clk = {
-    .name	= "core_gpt8_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &sys_clk,
+    .name   = "core_gpt8_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &sys_clk,
 };
 
 static struct clk core_gpt9_clk = {
-    .name	= "core_gpt9_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &sys_clk,
+    .name   = "core_gpt9_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &sys_clk,
 };
 
 static struct clk core_gpt10_clk = {
-    .name	= "core_gpt10_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &sys_clk,
+    .name   = "core_gpt10_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &sys_clk,
 };
 
 static struct clk core_gpt11_clk = {
-    .name	= "core_gpt11_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &sys_clk,
+    .name   = "core_gpt11_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &sys_clk,
 };
 
 static struct clk core_gpt12_clk = {
-    .name	= "core_gpt12_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &sys_clk,
+    .name   = "core_gpt12_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &sys_clk,
 };
 
 static struct clk mcbsp1_clk = {
-    .name	= "mcbsp1_cg",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .divisor	= 2,
-    .parent	= &func_96m_clk,
+    .name   = "mcbsp1_cg",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .divisor    = 2,
+    .parent = &func_96m_clk,
 };
 
 static struct clk mcbsp2_clk = {
-    .name	= "mcbsp2_cg",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .divisor	= 2,
-    .parent	= &func_96m_clk,
+    .name   = "mcbsp2_cg",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .divisor    = 2,
+    .parent = &func_96m_clk,
 };
 
 static struct clk emul_clk = {
-    .name	= "emul_ck",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &func_54m_clk,
+    .name   = "emul_ck",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &func_54m_clk,
 };
 
 static struct clk sdma_fclk = {
-    .name	= "sdma_fclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &l3_clk,
+    .name   = "sdma_fclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &l3_clk,
 };
 
 static struct clk sdma_iclk = {
-    .name	= "sdma_iclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &core_l3_iclk, /* core_l4_iclk for the configuration port */
+    .name   = "sdma_iclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &core_l3_iclk, /* core_l4_iclk for the configuration port */
 };
 
 static struct clk i2c1_fclk = {
-    .name	= "i2c1.fclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &func_12m_clk,
-    .divisor	= 1,
+    .name   = "i2c1.fclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &func_12m_clk,
+    .divisor    = 1,
 };
 
 static struct clk i2c1_iclk = {
-    .name	= "i2c1.iclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &core_l4_iclk,
+    .name   = "i2c1.iclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &core_l4_iclk,
 };
 
 static struct clk i2c2_fclk = {
-    .name	= "i2c2.fclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &func_12m_clk,
-    .divisor	= 1,
+    .name   = "i2c2.fclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &func_12m_clk,
+    .divisor    = 1,
 };
 
 static struct clk i2c2_iclk = {
-    .name	= "i2c2.iclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &core_l4_iclk,
+    .name   = "i2c2.iclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &core_l4_iclk,
 };
 
 static struct clk gpio_dbclk[5] = {
     {
-        .name	= "gpio1_dbclk",
-        .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-        .parent	= &wu_32k_clk,
+        .name   = "gpio1_dbclk",
+        .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+        .parent = &wu_32k_clk,
     }, {
-        .name	= "gpio2_dbclk",
-        .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-        .parent	= &wu_32k_clk,
+        .name   = "gpio2_dbclk",
+        .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+        .parent = &wu_32k_clk,
     }, {
-        .name	= "gpio3_dbclk",
-        .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-        .parent	= &wu_32k_clk,
+        .name   = "gpio3_dbclk",
+        .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+        .parent = &wu_32k_clk,
     }, {
-        .name	= "gpio4_dbclk",
-        .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-        .parent	= &wu_32k_clk,
+        .name   = "gpio4_dbclk",
+        .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+        .parent = &wu_32k_clk,
     }, {
         .name   = "gpio5_dbclk",
         .flags  = CLOCK_IN_OMAP243X,
@@ -864,90 +864,90 @@ static struct clk gpio_dbclk[5] = {
 };
 
 static struct clk gpio_iclk = {
-    .name	= "gpio_iclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &wu_l4_iclk,
+    .name   = "gpio_iclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &wu_l4_iclk,
 };
 
 static struct clk mmc_fck = {
-    .name	= "mmc_fclk",
-    .flags	= CLOCK_IN_OMAP242X,
-    .parent	= &func_96m_clk,
+    .name   = "mmc_fclk",
+    .flags  = CLOCK_IN_OMAP242X,
+    .parent = &func_96m_clk,
 };
 
 static struct clk mmc_ick = {
-    .name	= "mmc_iclk",
-    .flags	= CLOCK_IN_OMAP242X,
-    .parent	= &core_l4_iclk,
+    .name   = "mmc_iclk",
+    .flags  = CLOCK_IN_OMAP242X,
+    .parent = &core_l4_iclk,
 };
 
 static struct clk spi_fclk[3] = {
     {
-        .name	= "spi1_fclk",
-        .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-        .parent	= &func_48m_clk,
+        .name   = "spi1_fclk",
+        .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+        .parent = &func_48m_clk,
     }, {
-        .name	= "spi2_fclk",
-        .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-        .parent	= &func_48m_clk,
+        .name   = "spi2_fclk",
+        .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+        .parent = &func_48m_clk,
     }, {
-        .name	= "spi3_fclk",
-        .flags	= CLOCK_IN_OMAP243X,
-        .parent	= &func_48m_clk,
+        .name   = "spi3_fclk",
+        .flags  = CLOCK_IN_OMAP243X,
+        .parent = &func_48m_clk,
     },
 };
 
 static struct clk dss_clk[2] = {
     {
-        .name	= "dss_clk1",
-        .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-        .parent	= &core_clk,
+        .name   = "dss_clk1",
+        .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+        .parent = &core_clk,
     }, {
-        .name	= "dss_clk2",
-        .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-        .parent	= &sys_clk,
+        .name   = "dss_clk2",
+        .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+        .parent = &sys_clk,
     },
 };
 
 static struct clk dss_54m_clk = {
-    .name	= "dss_54m_clk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &func_54m_clk,
+    .name   = "dss_54m_clk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &func_54m_clk,
 };
 
 static struct clk dss_l3_iclk = {
-    .name	= "dss_l3_iclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &core_l3_iclk,
+    .name   = "dss_l3_iclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &core_l3_iclk,
 };
 
 static struct clk dss_l4_iclk = {
-    .name	= "dss_l4_iclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-    .parent	= &core_l4_iclk,
+    .name   = "dss_l4_iclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .parent = &core_l4_iclk,
 };
 
 static struct clk spi_iclk[3] = {
     {
-        .name	= "spi1_iclk",
-        .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-        .parent	= &core_l4_iclk,
+        .name   = "spi1_iclk",
+        .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+        .parent = &core_l4_iclk,
     }, {
-        .name	= "spi2_iclk",
-        .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
-        .parent	= &core_l4_iclk,
+        .name   = "spi2_iclk",
+        .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+        .parent = &core_l4_iclk,
     }, {
-        .name	= "spi3_iclk",
-        .flags	= CLOCK_IN_OMAP243X,
-        .parent	= &core_l4_iclk,
+        .name   = "spi3_iclk",
+        .flags  = CLOCK_IN_OMAP243X,
+        .parent = &core_l4_iclk,
     },
 };
 
 static struct clk omapctrl_clk = {
-    .name	= "omapctrl_iclk",
-    .flags	= CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
+    .name   = "omapctrl_iclk",
+    .flags  = CLOCK_IN_OMAP242X | CLOCK_IN_OMAP243X,
     /* XXX Should be in WKUP domain */
-    .parent	= &core_l4_iclk,
+    .parent = &core_l4_iclk,
 };
 
 static struct clk *onchip_clks[] = {
diff --git a/hw/misc/omap_gpmc.c b/hw/misc/omap_gpmc.c
index 67158eb164..ae5465e4d6 100644
--- a/hw/misc/omap_gpmc.c
+++ b/hw/misc/omap_gpmc.c
@@ -518,32 +518,32 @@ static uint64_t omap_gpmc_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x000:	/* GPMC_REVISION */
+    case 0x000: /* GPMC_REVISION */
         return s->revision;
 
-    case 0x010:	/* GPMC_SYSCONFIG */
+    case 0x010: /* GPMC_SYSCONFIG */
         return s->sysconfig;
 
-    case 0x014:	/* GPMC_SYSSTATUS */
-        return 1;						/* RESETDONE */
+    case 0x014: /* GPMC_SYSSTATUS */
+        return 1;                       /* RESETDONE */
 
-    case 0x018:	/* GPMC_IRQSTATUS */
+    case 0x018: /* GPMC_IRQSTATUS */
         return s->irqst;
 
-    case 0x01c:	/* GPMC_IRQENABLE */
+    case 0x01c: /* GPMC_IRQENABLE */
         return s->irqen;
 
-    case 0x040:	/* GPMC_TIMEOUT_CONTROL */
+    case 0x040: /* GPMC_TIMEOUT_CONTROL */
         return s->timeout;
 
-    case 0x044:	/* GPMC_ERR_ADDRESS */
-    case 0x048:	/* GPMC_ERR_TYPE */
+    case 0x044: /* GPMC_ERR_ADDRESS */
+    case 0x048: /* GPMC_ERR_TYPE */
         return 0;
 
-    case 0x050:	/* GPMC_CONFIG */
+    case 0x050: /* GPMC_CONFIG */
         return s->config;
 
-    case 0x054:	/* GPMC_STATUS */
+    case 0x054: /* GPMC_STATUS */
         return 0x001;
 
     case 0x060 ... 0x1d4:
@@ -573,13 +573,13 @@ static uint64_t omap_gpmc_read(void *opaque, hwaddr addr,
         }
         break;
 
-    case 0x1e0:	/* GPMC_PREFETCH_CONFIG1 */
+    case 0x1e0: /* GPMC_PREFETCH_CONFIG1 */
         return s->prefetch.config1;
-    case 0x1e4:	/* GPMC_PREFETCH_CONFIG2 */
+    case 0x1e4: /* GPMC_PREFETCH_CONFIG2 */
         return s->prefetch.transfercount;
-    case 0x1ec:	/* GPMC_PREFETCH_CONTROL */
+    case 0x1ec: /* GPMC_PREFETCH_CONTROL */
         return s->prefetch.startengine;
-    case 0x1f0:	/* GPMC_PREFETCH_STATUS */
+    case 0x1f0: /* GPMC_PREFETCH_STATUS */
         /* NB: The OMAP3 TRM is inconsistent about whether the GPMC
          * FIFOTHRESHOLDSTATUS bit should be set when
          * FIFOPOINTER > FIFOTHRESHOLD or when it is >= FIFOTHRESHOLD.
@@ -592,13 +592,13 @@ static uint64_t omap_gpmc_read(void *opaque, hwaddr addr,
                   ((s->prefetch.config1 >> 8) & 0x7f) ? 1 : 0) << 16) |
                 s->prefetch.count;
 
-    case 0x1f4:	/* GPMC_ECC_CONFIG */
+    case 0x1f4: /* GPMC_ECC_CONFIG */
         return s->ecc_cs;
-    case 0x1f8:	/* GPMC_ECC_CONTROL */
+    case 0x1f8: /* GPMC_ECC_CONTROL */
         return s->ecc_ptr;
-    case 0x1fc:	/* GPMC_ECC_SIZE_CONFIG */
+    case 0x1fc: /* GPMC_ECC_SIZE_CONFIG */
         return s->ecc_cfg;
-    case 0x200 ... 0x220:	/* GPMC_ECC_RESULT */
+    case 0x200 ... 0x220:   /* GPMC_ECC_RESULT */
         cs = (addr & 0x1f) >> 2;
         /* TODO: check correctness */
         return
@@ -607,10 +607,10 @@ static uint64_t omap_gpmc_read(void *opaque, hwaddr addr,
                 ((s->ecc[cs].lp[0] & 0x1ff) <<  3) |
                 ((s->ecc[cs].lp[1] & 0x1ff) << 19);
 
-    case 0x230:	/* GPMC_TESTMODE_CTRL */
+    case 0x230: /* GPMC_TESTMODE_CTRL */
         return 0;
-    case 0x234:	/* GPMC_PSA_LSB */
-    case 0x238:	/* GPMC_PSA_MSB */
+    case 0x234: /* GPMC_PSA_LSB */
+    case 0x238: /* GPMC_PSA_MSB */
         return 0x00000000;
     }
 
@@ -631,17 +631,17 @@ static void omap_gpmc_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x000:	/* GPMC_REVISION */
-    case 0x014:	/* GPMC_SYSSTATUS */
-    case 0x054:	/* GPMC_STATUS */
-    case 0x1f0:	/* GPMC_PREFETCH_STATUS */
-    case 0x200 ... 0x220:	/* GPMC_ECC_RESULT */
-    case 0x234:	/* GPMC_PSA_LSB */
-    case 0x238:	/* GPMC_PSA_MSB */
+    case 0x000: /* GPMC_REVISION */
+    case 0x014: /* GPMC_SYSSTATUS */
+    case 0x054: /* GPMC_STATUS */
+    case 0x1f0: /* GPMC_PREFETCH_STATUS */
+    case 0x200 ... 0x220:   /* GPMC_ECC_RESULT */
+    case 0x234: /* GPMC_PSA_LSB */
+    case 0x238: /* GPMC_PSA_MSB */
         OMAP_RO_REG(addr);
         break;
 
-    case 0x010:	/* GPMC_SYSCONFIG */
+    case 0x010: /* GPMC_SYSCONFIG */
         if ((value >> 3) == 0x3)
             fprintf(stderr, "%s: bad SDRAM idle mode %"PRIi64"\n",
                             __func__, value >> 3);
@@ -650,25 +650,25 @@ static void omap_gpmc_write(void *opaque, hwaddr addr,
         s->sysconfig = value & 0x19;
         break;
 
-    case 0x018:	/* GPMC_IRQSTATUS */
+    case 0x018: /* GPMC_IRQSTATUS */
         s->irqst &= ~value;
         omap_gpmc_int_update(s);
         break;
 
-    case 0x01c:	/* GPMC_IRQENABLE */
+    case 0x01c: /* GPMC_IRQENABLE */
         s->irqen = value & 0xf03;
         omap_gpmc_int_update(s);
         break;
 
-    case 0x040:	/* GPMC_TIMEOUT_CONTROL */
+    case 0x040: /* GPMC_TIMEOUT_CONTROL */
         s->timeout = value & 0x1ff1;
         break;
 
-    case 0x044:	/* GPMC_ERR_ADDRESS */
-    case 0x048:	/* GPMC_ERR_TYPE */
+    case 0x044: /* GPMC_ERR_ADDRESS */
+    case 0x048: /* GPMC_ERR_TYPE */
         break;
 
-    case 0x050:	/* GPMC_CONFIG */
+    case 0x050: /* GPMC_CONFIG */
         s->config = value & 0xf13;
         break;
 
@@ -724,7 +724,7 @@ static void omap_gpmc_write(void *opaque, hwaddr addr,
         }
         break;
 
-    case 0x1e0:	/* GPMC_PREFETCH_CONFIG1 */
+    case 0x1e0: /* GPMC_PREFETCH_CONFIG1 */
         if (!s->prefetch.startengine) {
             uint32_t newconfig1 = value & 0x7f8f7fbf;
             uint32_t changed;
@@ -755,13 +755,13 @@ static void omap_gpmc_write(void *opaque, hwaddr addr,
         }
         break;
 
-    case 0x1e4:	/* GPMC_PREFETCH_CONFIG2 */
+    case 0x1e4: /* GPMC_PREFETCH_CONFIG2 */
         if (!s->prefetch.startengine) {
             s->prefetch.transfercount = value & 0x3fff;
         }
         break;
 
-    case 0x1ec:	/* GPMC_PREFETCH_CONTROL */
+    case 0x1ec: /* GPMC_PREFETCH_CONTROL */
         if (s->prefetch.startengine != (value & 1)) {
             s->prefetch.startengine = value & 1;
             if (s->prefetch.startengine) {
@@ -789,10 +789,10 @@ static void omap_gpmc_write(void *opaque, hwaddr addr,
         }
         break;
 
-    case 0x1f4:	/* GPMC_ECC_CONFIG */
+    case 0x1f4: /* GPMC_ECC_CONFIG */
         s->ecc_cs = 0x8f;
         break;
-    case 0x1f8:	/* GPMC_ECC_CONTROL */
+    case 0x1f8: /* GPMC_ECC_CONTROL */
         if (value & (1 << 8))
             for (cs = 0; cs < 9; cs ++)
                 ecc_reset(&s->ecc[cs]);
@@ -802,10 +802,10 @@ static void omap_gpmc_write(void *opaque, hwaddr addr,
             s->ecc_cs &= ~1;
         }
         break;
-    case 0x1fc:	/* GPMC_ECC_SIZE_CONFIG */
+    case 0x1fc: /* GPMC_ECC_SIZE_CONFIG */
         s->ecc_cfg = value & 0x3fcff1ff;
         break;
-    case 0x230:	/* GPMC_TESTMODE_CTRL */
+    case 0x230: /* GPMC_TESTMODE_CTRL */
         if (value & 7)
             fprintf(stderr, "%s: test mode enable attempt\n", __func__);
         break;
diff --git a/hw/misc/omap_l4.c b/hw/misc/omap_l4.c
index b7875489da..1c396121fe 100644
--- a/hw/misc/omap_l4.c
+++ b/hw/misc/omap_l4.c
@@ -61,13 +61,13 @@ static uint64_t omap_l4ta_read(void *opaque, hwaddr addr, unsigned size)
     }
 
     switch (addr) {
-    case 0x00:	/* COMPONENT */
+    case 0x00:  /* COMPONENT */
         return s->component;
 
-    case 0x20:	/* AGENT_CONTROL */
+    case 0x20:  /* AGENT_CONTROL */
         return s->control;
 
-    case 0x28:	/* AGENT_STATUS */
+    case 0x28:  /* AGENT_STATUS */
         return s->status;
     }
 
@@ -86,15 +86,15 @@ static void omap_l4ta_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* COMPONENT */
-    case 0x28:	/* AGENT_STATUS */
+    case 0x00:  /* COMPONENT */
+    case 0x28:  /* AGENT_STATUS */
         OMAP_RO_REG(addr);
         break;
 
-    case 0x20:	/* AGENT_CONTROL */
+    case 0x20:  /* AGENT_CONTROL */
         s->control = value & 0x01000700;
-        if (value & 1)					/* OCP_RESET */
-            s->status &= ~1;				/* REQ_TIMEOUT */
+        if (value & 1)                  /* OCP_RESET */
+            s->status &= ~1;                /* REQ_TIMEOUT */
         break;
 
     default:
@@ -134,7 +134,7 @@ struct omap_target_agent_s *omap_l4ta_get(struct omap_l4_s *bus,
 
     ta->component = ('Q' << 24) | ('E' << 16) | ('M' << 8) | ('U' << 0);
     ta->status = 0x00000000;
-    ta->control = 0x00000200;	/* XXX 01000200 for L4TAO */
+    ta->control = 0x00000200;   /* XXX 01000200 for L4TAO */
 
     memory_region_init_io(&ta->iomem, NULL, &omap_l4ta_ops, ta, "omap.l4ta",
                           omap_l4_region_size(ta, info->ta_region));
diff --git a/hw/misc/omap_sdrc.c b/hw/misc/omap_sdrc.c
index 6aa1b3ef7f..0626d76cfb 100644
--- a/hw/misc/omap_sdrc.c
+++ b/hw/misc/omap_sdrc.c
@@ -40,44 +40,44 @@ static uint64_t omap_sdrc_read(void *opaque, hwaddr addr, unsigned size)
     }
 
     switch (addr) {
-    case 0x00:	/* SDRC_REVISION */
+    case 0x00:  /* SDRC_REVISION */
         return 0x20;
 
-    case 0x10:	/* SDRC_SYSCONFIG */
+    case 0x10:  /* SDRC_SYSCONFIG */
         return s->config;
 
-    case 0x14:	/* SDRC_SYSSTATUS */
-        return 1;						/* RESETDONE */
-
-    case 0x40:	/* SDRC_CS_CFG */
-    case 0x44:	/* SDRC_SHARING */
-    case 0x48:	/* SDRC_ERR_ADDR */
-    case 0x4c:	/* SDRC_ERR_TYPE */
-    case 0x60:	/* SDRC_DLLA_SCTRL */
-    case 0x64:	/* SDRC_DLLA_STATUS */
-    case 0x68:	/* SDRC_DLLB_CTRL */
-    case 0x6c:	/* SDRC_DLLB_STATUS */
-    case 0x70:	/* SDRC_POWER */
-    case 0x80:	/* SDRC_MCFG_0 */
-    case 0x84:	/* SDRC_MR_0 */
-    case 0x88:	/* SDRC_EMR1_0 */
-    case 0x8c:	/* SDRC_EMR2_0 */
-    case 0x90:	/* SDRC_EMR3_0 */
-    case 0x94:	/* SDRC_DCDL1_CTRL */
-    case 0x98:	/* SDRC_DCDL2_CTRL */
-    case 0x9c:	/* SDRC_ACTIM_CTRLA_0 */
-    case 0xa0:	/* SDRC_ACTIM_CTRLB_0 */
-    case 0xa4:	/* SDRC_RFR_CTRL_0 */
-    case 0xa8:	/* SDRC_MANUAL_0 */
-    case 0xb0:	/* SDRC_MCFG_1 */
-    case 0xb4:	/* SDRC_MR_1 */
-    case 0xb8:	/* SDRC_EMR1_1 */
-    case 0xbc:	/* SDRC_EMR2_1 */
-    case 0xc0:	/* SDRC_EMR3_1 */
-    case 0xc4:	/* SDRC_ACTIM_CTRLA_1 */
-    case 0xc8:	/* SDRC_ACTIM_CTRLB_1 */
-    case 0xd4:	/* SDRC_RFR_CTRL_1 */
-    case 0xd8:	/* SDRC_MANUAL_1 */
+    case 0x14:  /* SDRC_SYSSTATUS */
+        return 1;                       /* RESETDONE */
+
+    case 0x40:  /* SDRC_CS_CFG */
+    case 0x44:  /* SDRC_SHARING */
+    case 0x48:  /* SDRC_ERR_ADDR */
+    case 0x4c:  /* SDRC_ERR_TYPE */
+    case 0x60:  /* SDRC_DLLA_SCTRL */
+    case 0x64:  /* SDRC_DLLA_STATUS */
+    case 0x68:  /* SDRC_DLLB_CTRL */
+    case 0x6c:  /* SDRC_DLLB_STATUS */
+    case 0x70:  /* SDRC_POWER */
+    case 0x80:  /* SDRC_MCFG_0 */
+    case 0x84:  /* SDRC_MR_0 */
+    case 0x88:  /* SDRC_EMR1_0 */
+    case 0x8c:  /* SDRC_EMR2_0 */
+    case 0x90:  /* SDRC_EMR3_0 */
+    case 0x94:  /* SDRC_DCDL1_CTRL */
+    case 0x98:  /* SDRC_DCDL2_CTRL */
+    case 0x9c:  /* SDRC_ACTIM_CTRLA_0 */
+    case 0xa0:  /* SDRC_ACTIM_CTRLB_0 */
+    case 0xa4:  /* SDRC_RFR_CTRL_0 */
+    case 0xa8:  /* SDRC_MANUAL_0 */
+    case 0xb0:  /* SDRC_MCFG_1 */
+    case 0xb4:  /* SDRC_MR_1 */
+    case 0xb8:  /* SDRC_EMR1_1 */
+    case 0xbc:  /* SDRC_EMR2_1 */
+    case 0xc0:  /* SDRC_EMR3_1 */
+    case 0xc4:  /* SDRC_ACTIM_CTRLA_1 */
+    case 0xc8:  /* SDRC_ACTIM_CTRLB_1 */
+    case 0xd4:  /* SDRC_RFR_CTRL_1 */
+    case 0xd8:  /* SDRC_MANUAL_1 */
         return 0x00;
     }
 
@@ -96,15 +96,15 @@ static void omap_sdrc_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* SDRC_REVISION */
-    case 0x14:	/* SDRC_SYSSTATUS */
-    case 0x48:	/* SDRC_ERR_ADDR */
-    case 0x64:	/* SDRC_DLLA_STATUS */
-    case 0x6c:	/* SDRC_DLLB_STATUS */
+    case 0x00:  /* SDRC_REVISION */
+    case 0x14:  /* SDRC_SYSSTATUS */
+    case 0x48:  /* SDRC_ERR_ADDR */
+    case 0x64:  /* SDRC_DLLA_STATUS */
+    case 0x6c:  /* SDRC_DLLB_STATUS */
         OMAP_RO_REG(addr);
         return;
 
-    case 0x10:	/* SDRC_SYSCONFIG */
+    case 0x10:  /* SDRC_SYSCONFIG */
         if ((value >> 3) != 0x2)
             fprintf(stderr, "%s: bad SDRAM idle mode %i\n",
                     __func__, (unsigned)value >> 3);
@@ -113,32 +113,32 @@ static void omap_sdrc_write(void *opaque, hwaddr addr,
         s->config = value & 0x18;
         break;
 
-    case 0x40:	/* SDRC_CS_CFG */
-    case 0x44:	/* SDRC_SHARING */
-    case 0x4c:	/* SDRC_ERR_TYPE */
-    case 0x60:	/* SDRC_DLLA_SCTRL */
-    case 0x68:	/* SDRC_DLLB_CTRL */
-    case 0x70:	/* SDRC_POWER */
-    case 0x80:	/* SDRC_MCFG_0 */
-    case 0x84:	/* SDRC_MR_0 */
-    case 0x88:	/* SDRC_EMR1_0 */
-    case 0x8c:	/* SDRC_EMR2_0 */
-    case 0x90:	/* SDRC_EMR3_0 */
-    case 0x94:	/* SDRC_DCDL1_CTRL */
-    case 0x98:	/* SDRC_DCDL2_CTRL */
-    case 0x9c:	/* SDRC_ACTIM_CTRLA_0 */
-    case 0xa0:	/* SDRC_ACTIM_CTRLB_0 */
-    case 0xa4:	/* SDRC_RFR_CTRL_0 */
-    case 0xa8:	/* SDRC_MANUAL_0 */
-    case 0xb0:	/* SDRC_MCFG_1 */
-    case 0xb4:	/* SDRC_MR_1 */
-    case 0xb8:	/* SDRC_EMR1_1 */
-    case 0xbc:	/* SDRC_EMR2_1 */
-    case 0xc0:	/* SDRC_EMR3_1 */
-    case 0xc4:	/* SDRC_ACTIM_CTRLA_1 */
-    case 0xc8:	/* SDRC_ACTIM_CTRLB_1 */
-    case 0xd4:	/* SDRC_RFR_CTRL_1 */
-    case 0xd8:	/* SDRC_MANUAL_1 */
+    case 0x40:  /* SDRC_CS_CFG */
+    case 0x44:  /* SDRC_SHARING */
+    case 0x4c:  /* SDRC_ERR_TYPE */
+    case 0x60:  /* SDRC_DLLA_SCTRL */
+    case 0x68:  /* SDRC_DLLB_CTRL */
+    case 0x70:  /* SDRC_POWER */
+    case 0x80:  /* SDRC_MCFG_0 */
+    case 0x84:  /* SDRC_MR_0 */
+    case 0x88:  /* SDRC_EMR1_0 */
+    case 0x8c:  /* SDRC_EMR2_0 */
+    case 0x90:  /* SDRC_EMR3_0 */
+    case 0x94:  /* SDRC_DCDL1_CTRL */
+    case 0x98:  /* SDRC_DCDL2_CTRL */
+    case 0x9c:  /* SDRC_ACTIM_CTRLA_0 */
+    case 0xa0:  /* SDRC_ACTIM_CTRLB_0 */
+    case 0xa4:  /* SDRC_RFR_CTRL_0 */
+    case 0xa8:  /* SDRC_MANUAL_0 */
+    case 0xb0:  /* SDRC_MCFG_1 */
+    case 0xb4:  /* SDRC_MR_1 */
+    case 0xb8:  /* SDRC_EMR1_1 */
+    case 0xbc:  /* SDRC_EMR2_1 */
+    case 0xc0:  /* SDRC_EMR3_1 */
+    case 0xc4:  /* SDRC_ACTIM_CTRLA_1 */
+    case 0xc8:  /* SDRC_ACTIM_CTRLB_1 */
+    case 0xd4:  /* SDRC_RFR_CTRL_1 */
+    case 0xd8:  /* SDRC_MANUAL_1 */
         break;
 
     default:
diff --git a/hw/misc/omap_tap.c b/hw/misc/omap_tap.c
index 4d7fb7d85f..daa15696ee 100644
--- a/hw/misc/omap_tap.c
+++ b/hw/misc/omap_tap.c
@@ -32,25 +32,25 @@ static uint64_t omap_tap_read(void *opaque, hwaddr addr, unsigned size)
     }
 
     switch (addr) {
-    case 0x204:	/* IDCODE_reg */
+    case 0x204: /* IDCODE_reg */
         switch (s->mpu_model) {
         case omap2420:
         case omap2422:
         case omap2423:
-            return 0x5b5d902f;	/* ES 2.2 */
+            return 0x5b5d902f;  /* ES 2.2 */
         case omap2430:
-            return 0x5b68a02f;	/* ES 2.2 */
+            return 0x5b68a02f;  /* ES 2.2 */
         case omap3430:
-            return 0x1b7ae02f;	/* ES 2 */
+            return 0x1b7ae02f;  /* ES 2 */
         default:
             hw_error("%s: Bad mpu model\n", __func__);
         }
 
-    case 0x208:	/* PRODUCTION_ID_reg for OMAP2 */
-    case 0x210:	/* PRODUCTION_ID_reg for OMAP3 */
+    case 0x208: /* PRODUCTION_ID_reg for OMAP2 */
+    case 0x210: /* PRODUCTION_ID_reg for OMAP3 */
         switch (s->mpu_model) {
         case omap2420:
-            return 0x000254f0;	/* POP ESHS2.1.1 in N91/93/95, ES2 in N800 */
+            return 0x000254f0;  /* POP ESHS2.1.1 in N91/93/95, ES2 in N800 */
         case omap2422:
             return 0x000400f0;
         case omap2423:
@@ -68,22 +68,22 @@ static uint64_t omap_tap_read(void *opaque, hwaddr addr, unsigned size)
         case omap2420:
         case omap2422:
         case omap2423:
-            return 0xcafeb5d9;	/* ES 2.2 */
+            return 0xcafeb5d9;  /* ES 2.2 */
         case omap2430:
-            return 0xcafeb68a;	/* ES 2.2 */
+            return 0xcafeb68a;  /* ES 2.2 */
         case omap3430:
-            return 0xcafeb7ae;	/* ES 2 */
+            return 0xcafeb7ae;  /* ES 2 */
         default:
             hw_error("%s: Bad mpu model\n", __func__);
         }
 
-    case 0x218:	/* DIE_ID_reg */
+    case 0x218: /* DIE_ID_reg */
         return ('Q' << 24) | ('E' << 16) | ('M' << 8) | ('U' << 0);
-    case 0x21c:	/* DIE_ID_reg */
+    case 0x21c: /* DIE_ID_reg */
         return 0x54 << 24;
-    case 0x220:	/* DIE_ID_reg */
+    case 0x220: /* DIE_ID_reg */
         return ('Q' << 24) | ('E' << 16) | ('M' << 8) | ('U' << 0);
-    case 0x224:	/* DIE_ID_reg */
+    case 0x224: /* DIE_ID_reg */
         return ('Q' << 24) | ('E' << 16) | ('M' << 8) | ('U' << 0);
     }
 
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index edd3cf2a1e..04a7d36c44 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -104,11 +104,11 @@ static void omap_mmc_fifolevel_update(struct omap_mmc_s *host)
 }
 
 typedef enum {
-    sd_nore = 0,	/* no response */
-    sd_r1,		/* normal response command */
-    sd_r2,		/* CID, CSD registers */
-    sd_r3,		/* OCR register */
-    sd_r6 = 6,		/* Published RCA response */
+    sd_nore = 0,    /* no response */
+    sd_r1,      /* normal response command */
+    sd_r2,      /* CID, CSD registers */
+    sd_r3,      /* OCR register */
+    sd_r6 = 6,      /* Published RCA response */
     sd_r1b = -1,
 } sd_rsp_type_t;
 
@@ -215,7 +215,7 @@ static void omap_mmc_command(struct omap_mmc_s *host, int cmd, int dir,
     if (timeout)
         host->status |= 0x0080;
     else if (cmd == 12)
-        host->status |= 0x0005;	/* Makes it more real */
+        host->status |= 0x0005; /* Makes it more real */
     else
         host->status |= 0x0001;
 }
@@ -331,32 +331,32 @@ static uint64_t omap_mmc_read(void *opaque, hwaddr offset, unsigned size)
     }
 
     switch (offset) {
-    case 0x00:	/* MMC_CMD */
+    case 0x00:  /* MMC_CMD */
         return s->last_cmd;
 
-    case 0x04:	/* MMC_ARGL */
+    case 0x04:  /* MMC_ARGL */
         return s->arg & 0x0000ffff;
 
-    case 0x08:	/* MMC_ARGH */
+    case 0x08:  /* MMC_ARGH */
         return s->arg >> 16;
 
-    case 0x0c:	/* MMC_CON */
+    case 0x0c:  /* MMC_CON */
         return (s->dw << 15) | (s->mode << 12) | (s->enable << 11) | 
                 (s->be << 10) | s->clkdiv;
 
-    case 0x10:	/* MMC_STAT */
+    case 0x10:  /* MMC_STAT */
         return s->status;
 
-    case 0x14:	/* MMC_IE */
+    case 0x14:  /* MMC_IE */
         return s->mask;
 
-    case 0x18:	/* MMC_CTO */
+    case 0x18:  /* MMC_CTO */
         return s->cto;
 
-    case 0x1c:	/* MMC_DTO */
+    case 0x1c:  /* MMC_DTO */
         return s->dto;
 
-    case 0x20:	/* MMC_DATA */
+    case 0x20:  /* MMC_DATA */
         /* TODO: support 8-bit access */
         i = s->fifo[s->fifo_start];
         if (s->fifo_len == 0) {
@@ -371,42 +371,42 @@ static uint64_t omap_mmc_read(void *opaque, hwaddr offset, unsigned size)
         omap_mmc_interrupts_update(s);
         return i;
 
-    case 0x24:	/* MMC_BLEN */
+    case 0x24:  /* MMC_BLEN */
         return s->blen_counter;
 
-    case 0x28:	/* MMC_NBLK */
+    case 0x28:  /* MMC_NBLK */
         return s->nblk_counter;
 
-    case 0x2c:	/* MMC_BUF */
+    case 0x2c:  /* MMC_BUF */
         return (s->rx_dma << 15) | (s->af_level << 8) |
             (s->tx_dma << 7) | s->ae_level;
 
-    case 0x30:	/* MMC_SPI */
+    case 0x30:  /* MMC_SPI */
         return 0x0000;
-    case 0x34:	/* MMC_SDIO */
+    case 0x34:  /* MMC_SDIO */
         return (s->cdet_wakeup << 2) | (s->cdet_enable) | s->sdio;
-    case 0x38:	/* MMC_SYST */
+    case 0x38:  /* MMC_SYST */
         return 0x0000;
 
-    case 0x3c:	/* MMC_REV */
+    case 0x3c:  /* MMC_REV */
         return s->rev;
 
-    case 0x40:	/* MMC_RSP0 */
-    case 0x44:	/* MMC_RSP1 */
-    case 0x48:	/* MMC_RSP2 */
-    case 0x4c:	/* MMC_RSP3 */
-    case 0x50:	/* MMC_RSP4 */
-    case 0x54:	/* MMC_RSP5 */
-    case 0x58:	/* MMC_RSP6 */
-    case 0x5c:	/* MMC_RSP7 */
+    case 0x40:  /* MMC_RSP0 */
+    case 0x44:  /* MMC_RSP1 */
+    case 0x48:  /* MMC_RSP2 */
+    case 0x4c:  /* MMC_RSP3 */
+    case 0x50:  /* MMC_RSP4 */
+    case 0x54:  /* MMC_RSP5 */
+    case 0x58:  /* MMC_RSP6 */
+    case 0x5c:  /* MMC_RSP7 */
         return s->rsp[(offset - 0x40) >> 2];
 
     /* OMAP2-specific */
-    case 0x60:	/* MMC_IOSR */
-    case 0x64:	/* MMC_SYSC */
+    case 0x60:  /* MMC_IOSR */
+    case 0x64:  /* MMC_SYSC */
         return 0;
-    case 0x68:	/* MMC_SYSS */
-        return 1;						/* RSTD */
+    case 0x68:  /* MMC_SYSS */
+        return 1;                       /* RSTD */
     }
 
     OMAP_BAD_REG(offset);
@@ -425,7 +425,7 @@ static void omap_mmc_write(void *opaque, hwaddr offset,
     }
 
     switch (offset) {
-    case 0x00:	/* MMC_CMD */
+    case 0x00:  /* MMC_CMD */
         if (!s->enable)
             break;
 
@@ -440,17 +440,17 @@ static void omap_mmc_write(void *opaque, hwaddr offset,
         omap_mmc_update(s);
         break;
 
-    case 0x04:	/* MMC_ARGL */
+    case 0x04:  /* MMC_ARGL */
         s->arg &= 0xffff0000;
         s->arg |= 0x0000ffff & value;
         break;
 
-    case 0x08:	/* MMC_ARGH */
+    case 0x08:  /* MMC_ARGH */
         s->arg &= 0x0000ffff;
         s->arg |= value << 16;
         break;
 
-    case 0x0c:	/* MMC_CON */
+    case 0x0c:  /* MMC_CON */
         s->dw = (value >> 15) & 1;
         s->mode = (value >> 12) & 3;
         s->enable = (value >> 11) & 1;
@@ -470,27 +470,27 @@ static void omap_mmc_write(void *opaque, hwaddr offset,
             omap_mmc_pseudo_reset(s);
         break;
 
-    case 0x10:	/* MMC_STAT */
+    case 0x10:  /* MMC_STAT */
         s->status &= ~value;
         omap_mmc_interrupts_update(s);
         break;
 
-    case 0x14:	/* MMC_IE */
+    case 0x14:  /* MMC_IE */
         s->mask = value & 0x7fff;
         omap_mmc_interrupts_update(s);
         break;
 
-    case 0x18:	/* MMC_CTO */
+    case 0x18:  /* MMC_CTO */
         s->cto = value & 0xff;
         if (s->cto > 0xfd && s->rev <= 1)
             printf("MMC: CTO of 0xff and 0xfe cannot be used!\n");
         break;
 
-    case 0x1c:	/* MMC_DTO */
+    case 0x1c:  /* MMC_DTO */
         s->dto = value & 0xffff;
         break;
 
-    case 0x20:	/* MMC_DATA */
+    case 0x20:  /* MMC_DATA */
         /* TODO: support 8-bit access */
         if (s->fifo_len == 32)
             break;
@@ -501,18 +501,18 @@ static void omap_mmc_write(void *opaque, hwaddr offset,
         omap_mmc_interrupts_update(s);
         break;
 
-    case 0x24:	/* MMC_BLEN */
+    case 0x24:  /* MMC_BLEN */
         s->blen = (value & 0x07ff) + 1;
         s->blen_counter = s->blen;
         break;
 
-    case 0x28:	/* MMC_NBLK */
+    case 0x28:  /* MMC_NBLK */
         s->nblk = (value & 0x07ff) + 1;
         s->nblk_counter = s->nblk;
         s->blen_counter = s->blen;
         break;
 
-    case 0x2c:	/* MMC_BUF */
+    case 0x2c:  /* MMC_BUF */
         s->rx_dma = (value >> 15) & 1;
         s->af_level = (value >> 8) & 0x1f;
         s->tx_dma = (value >> 7) & 1;
@@ -527,38 +527,38 @@ static void omap_mmc_write(void *opaque, hwaddr offset,
         break;
 
     /* SPI, SDIO and TEST modes unimplemented */
-    case 0x30:	/* MMC_SPI (OMAP1 only) */
+    case 0x30:  /* MMC_SPI (OMAP1 only) */
         break;
-    case 0x34:	/* MMC_SDIO */
+    case 0x34:  /* MMC_SDIO */
         s->sdio = value & (s->rev >= 2 ? 0xfbf3 : 0x2020);
         s->cdet_wakeup = (value >> 9) & 1;
         s->cdet_enable = (value >> 2) & 1;
         break;
-    case 0x38:	/* MMC_SYST */
+    case 0x38:  /* MMC_SYST */
         break;
 
-    case 0x3c:	/* MMC_REV */
-    case 0x40:	/* MMC_RSP0 */
-    case 0x44:	/* MMC_RSP1 */
-    case 0x48:	/* MMC_RSP2 */
-    case 0x4c:	/* MMC_RSP3 */
-    case 0x50:	/* MMC_RSP4 */
-    case 0x54:	/* MMC_RSP5 */
-    case 0x58:	/* MMC_RSP6 */
-    case 0x5c:	/* MMC_RSP7 */
+    case 0x3c:  /* MMC_REV */
+    case 0x40:  /* MMC_RSP0 */
+    case 0x44:  /* MMC_RSP1 */
+    case 0x48:  /* MMC_RSP2 */
+    case 0x4c:  /* MMC_RSP3 */
+    case 0x50:  /* MMC_RSP4 */
+    case 0x54:  /* MMC_RSP5 */
+    case 0x58:  /* MMC_RSP6 */
+    case 0x5c:  /* MMC_RSP7 */
         OMAP_RO_REG(offset);
         break;
 
     /* OMAP2-specific */
-    case 0x60:	/* MMC_IOSR */
+    case 0x60:  /* MMC_IOSR */
         if (value & 0xf)
             printf("MMC: SDIO bits used!\n");
         break;
-    case 0x64:	/* MMC_SYSC */
-        if (value & (1 << 2))					/* SRTS */
+    case 0x64:  /* MMC_SYSC */
+        if (value & (1 << 2))                   /* SRTS */
             omap_mmc_reset(s);
         break;
-    case 0x68:	/* MMC_SYSS */
+    case 0x68:  /* MMC_SYSS */
         OMAP_RO_REG(offset);
         break;
 
@@ -601,7 +601,7 @@ struct omap_mmc_s *omap_mmc_init(hwaddr base,
     s->irq = irq;
     s->dma = dma;
     s->clk = clk;
-    s->lines = 1;	/* TODO: needs to be settable per-board */
+    s->lines = 1;   /* TODO: needs to be settable per-board */
     s->rev = 1;
 
     memory_region_init_io(&s->iomem, NULL, &omap_mmc_ops, s, "omap.mmc", 0x800);
diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 124fbf8bbd..ab50c43d7d 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -113,55 +113,55 @@ static const VMStateDescription vmstate_pxa2xx_mmci = {
     }
 };
 
-#define MMC_STRPCL	0x00	/* MMC Clock Start/Stop register */
-#define MMC_STAT	0x04	/* MMC Status register */
-#define MMC_CLKRT	0x08	/* MMC Clock Rate register */
-#define MMC_SPI		0x0c	/* MMC SPI Mode register */
-#define MMC_CMDAT	0x10	/* MMC Command/Data register */
-#define MMC_RESTO	0x14	/* MMC Response Time-Out register */
-#define MMC_RDTO	0x18	/* MMC Read Time-Out register */
-#define MMC_BLKLEN	0x1c	/* MMC Block Length register */
-#define MMC_NUMBLK	0x20	/* MMC Number of Blocks register */
-#define MMC_PRTBUF	0x24	/* MMC Buffer Partly Full register */
-#define MMC_I_MASK	0x28	/* MMC Interrupt Mask register */
-#define MMC_I_REG	0x2c	/* MMC Interrupt Request register */
-#define MMC_CMD		0x30	/* MMC Command register */
-#define MMC_ARGH	0x34	/* MMC Argument High register */
-#define MMC_ARGL	0x38	/* MMC Argument Low register */
-#define MMC_RES		0x3c	/* MMC Response FIFO */
-#define MMC_RXFIFO	0x40	/* MMC Receive FIFO */
-#define MMC_TXFIFO	0x44	/* MMC Transmit FIFO */
-#define MMC_RDWAIT	0x48	/* MMC RD_WAIT register */
-#define MMC_BLKS_REM	0x4c	/* MMC Blocks Remaining register */
+#define MMC_STRPCL  0x00    /* MMC Clock Start/Stop register */
+#define MMC_STAT    0x04    /* MMC Status register */
+#define MMC_CLKRT   0x08    /* MMC Clock Rate register */
+#define MMC_SPI     0x0c    /* MMC SPI Mode register */
+#define MMC_CMDAT   0x10    /* MMC Command/Data register */
+#define MMC_RESTO   0x14    /* MMC Response Time-Out register */
+#define MMC_RDTO    0x18    /* MMC Read Time-Out register */
+#define MMC_BLKLEN  0x1c    /* MMC Block Length register */
+#define MMC_NUMBLK  0x20    /* MMC Number of Blocks register */
+#define MMC_PRTBUF  0x24    /* MMC Buffer Partly Full register */
+#define MMC_I_MASK  0x28    /* MMC Interrupt Mask register */
+#define MMC_I_REG   0x2c    /* MMC Interrupt Request register */
+#define MMC_CMD     0x30    /* MMC Command register */
+#define MMC_ARGH    0x34    /* MMC Argument High register */
+#define MMC_ARGL    0x38    /* MMC Argument Low register */
+#define MMC_RES     0x3c    /* MMC Response FIFO */
+#define MMC_RXFIFO  0x40    /* MMC Receive FIFO */
+#define MMC_TXFIFO  0x44    /* MMC Transmit FIFO */
+#define MMC_RDWAIT  0x48    /* MMC RD_WAIT register */
+#define MMC_BLKS_REM    0x4c    /* MMC Blocks Remaining register */
 
 /* Bitfield masks */
-#define STRPCL_STOP_CLK	(1 << 0)
-#define STRPCL_STRT_CLK	(1 << 1)
-#define STAT_TOUT_RES	(1 << 1)
-#define STAT_CLK_EN	(1 << 8)
-#define STAT_DATA_DONE	(1 << 11)
-#define STAT_PRG_DONE	(1 << 12)
-#define STAT_END_CMDRES	(1 << 13)
-#define SPI_SPI_MODE	(1 << 0)
-#define CMDAT_RES_TYPE	(3 << 0)
-#define CMDAT_DATA_EN	(1 << 2)
-#define CMDAT_WR_RD	(1 << 3)
-#define CMDAT_DMA_EN	(1 << 7)
-#define CMDAT_STOP_TRAN	(1 << 10)
-#define INT_DATA_DONE	(1 << 0)
-#define INT_PRG_DONE	(1 << 1)
-#define INT_END_CMD	(1 << 2)
-#define INT_STOP_CMD	(1 << 3)
-#define INT_CLK_OFF	(1 << 4)
-#define INT_RXFIFO_REQ	(1 << 5)
-#define INT_TXFIFO_REQ	(1 << 6)
-#define INT_TINT	(1 << 7)
-#define INT_DAT_ERR	(1 << 8)
-#define INT_RES_ERR	(1 << 9)
-#define INT_RD_STALLED	(1 << 10)
-#define INT_SDIO_INT	(1 << 11)
-#define INT_SDIO_SACK	(1 << 12)
-#define PRTBUF_PRT_BUF	(1 << 0)
+#define STRPCL_STOP_CLK (1 << 0)
+#define STRPCL_STRT_CLK (1 << 1)
+#define STAT_TOUT_RES   (1 << 1)
+#define STAT_CLK_EN (1 << 8)
+#define STAT_DATA_DONE  (1 << 11)
+#define STAT_PRG_DONE   (1 << 12)
+#define STAT_END_CMDRES (1 << 13)
+#define SPI_SPI_MODE    (1 << 0)
+#define CMDAT_RES_TYPE  (3 << 0)
+#define CMDAT_DATA_EN   (1 << 2)
+#define CMDAT_WR_RD (1 << 3)
+#define CMDAT_DMA_EN    (1 << 7)
+#define CMDAT_STOP_TRAN (1 << 10)
+#define INT_DATA_DONE   (1 << 0)
+#define INT_PRG_DONE    (1 << 1)
+#define INT_END_CMD (1 << 2)
+#define INT_STOP_CMD    (1 << 3)
+#define INT_CLK_OFF (1 << 4)
+#define INT_RXFIFO_REQ  (1 << 5)
+#define INT_TXFIFO_REQ  (1 << 6)
+#define INT_TINT    (1 << 7)
+#define INT_DAT_ERR (1 << 8)
+#define INT_RES_ERR (1 << 9)
+#define INT_RD_STALLED  (1 << 10)
+#define INT_SDIO_INT    (1 << 11)
+#define INT_SDIO_SACK   (1 << 12)
+#define PRTBUF_PRT_BUF  (1 << 0)
 
 /* Route internal interrupt lines to the global IC and DMA */
 static void pxa2xx_mmci_int_update(PXA2xxMMCIState *s)
@@ -226,30 +226,30 @@ static void pxa2xx_mmci_wakequeues(PXA2xxMMCIState *s)
 
     request.cmd = s->cmd;
     request.arg = s->arg;
-    request.crc = 0;	/* FIXME */
+    request.crc = 0;    /* FIXME */
 
     rsplen = sdbus_do_command(&s->sdbus, &request, response);
     s->intreq |= INT_END_CMD;
 
     memset(s->resp_fifo, 0, sizeof(s->resp_fifo));
     switch (s->cmdat & CMDAT_RES_TYPE) {
-#define PXAMMCI_RESP(wd, value0, value1)	\
-        s->resp_fifo[(wd) + 0] |= (value0);	\
+#define PXAMMCI_RESP(wd, value0, value1)    \
+        s->resp_fifo[(wd) + 0] |= (value0); \
         s->resp_fifo[(wd) + 1] |= (value1) << 8;
-    case 0:	/* No response */
+    case 0: /* No response */
         goto complete;
 
-    case 1:	/* R1, R4, R5 or R6 */
+    case 1: /* R1, R4, R5 or R6 */
         if (rsplen < 4)
             goto timeout;
         goto complete;
 
-    case 2:	/* R2 */
+    case 2: /* R2 */
         if (rsplen < 16)
             goto timeout;
         goto complete;
 
-    case 3:	/* R3 */
+    case 3: /* R3 */
         if (rsplen < 4)
             goto timeout;
         goto complete;
diff --git a/hw/ssi/omap_spi.c b/hw/ssi/omap_spi.c
index 8f85c3e391..d62554fc88 100644
--- a/hw/ssi/omap_spi.c
+++ b/hw/ssi/omap_spi.c
@@ -62,52 +62,52 @@ static inline void omap_mcspi_interrupt_update(struct omap_mcspi_s *s)
 static inline void omap_mcspi_dmarequest_update(struct omap_mcspi_ch_s *ch)
 {
     qemu_set_irq(ch->txdrq,
-                    (ch->control & 1) &&		/* EN */
-                    (ch->config & (1 << 14)) &&		/* DMAW */
-                    (ch->status & (1 << 1)) &&		/* TXS */
-                    ((ch->config >> 12) & 3) != 1);	/* TRM */
+                    (ch->control & 1) &&        /* EN */
+                    (ch->config & (1 << 14)) &&     /* DMAW */
+                    (ch->status & (1 << 1)) &&      /* TXS */
+                    ((ch->config >> 12) & 3) != 1); /* TRM */
     qemu_set_irq(ch->rxdrq,
-                    (ch->control & 1) &&		/* EN */
-                    (ch->config & (1 << 15)) &&		/* DMAW */
-                    (ch->status & (1 << 0)) &&		/* RXS */
-                    ((ch->config >> 12) & 3) != 2);	/* TRM */
+                    (ch->control & 1) &&        /* EN */
+                    (ch->config & (1 << 15)) &&     /* DMAW */
+                    (ch->status & (1 << 0)) &&      /* RXS */
+                    ((ch->config >> 12) & 3) != 2); /* TRM */
 }
 
 static void omap_mcspi_transfer_run(struct omap_mcspi_s *s, int chnum)
 {
     struct omap_mcspi_ch_s *ch = s->ch + chnum;
 
-    if (!(ch->control & 1))				/* EN */
+    if (!(ch->control & 1))             /* EN */
         return;
-    if ((ch->status & (1 << 0)) &&			/* RXS */
-                    ((ch->config >> 12) & 3) != 2 &&	/* TRM */
-                    !(ch->config & (1 << 19)))		/* TURBO */
+    if ((ch->status & (1 << 0)) &&          /* RXS */
+                    ((ch->config >> 12) & 3) != 2 &&    /* TRM */
+                    !(ch->config & (1 << 19)))      /* TURBO */
         goto intr_update;
-    if ((ch->status & (1 << 1)) &&			/* TXS */
-                    ((ch->config >> 12) & 3) != 1)	/* TRM */
+    if ((ch->status & (1 << 1)) &&          /* TXS */
+                    ((ch->config >> 12) & 3) != 1)  /* TRM */
         goto intr_update;
 
-    if (!(s->control & 1) ||				/* SINGLE */
-                    (ch->config & (1 << 20))) {		/* FORCE */
+    if (!(s->control & 1) ||                /* SINGLE */
+                    (ch->config & (1 << 20))) {     /* FORCE */
         if (ch->txrx)
-            ch->rx = ch->txrx(ch->opaque, ch->tx,	/* WL */
+            ch->rx = ch->txrx(ch->opaque, ch->tx,   /* WL */
                             1 + (0x1f & (ch->config >> 7)));
     }
 
     ch->tx = 0;
-    ch->status |= 1 << 2;				/* EOT */
-    ch->status |= 1 << 1;				/* TXS */
-    if (((ch->config >> 12) & 3) != 2)			/* TRM */
-        ch->status |= 1 << 0;				/* RXS */
+    ch->status |= 1 << 2;               /* EOT */
+    ch->status |= 1 << 1;               /* TXS */
+    if (((ch->config >> 12) & 3) != 2)          /* TRM */
+        ch->status |= 1 << 0;               /* RXS */
 
 intr_update:
-    if ((ch->status & (1 << 0)) &&			/* RXS */
-                    ((ch->config >> 12) & 3) != 2 &&	/* TRM */
-                    !(ch->config & (1 << 19)))		/* TURBO */
-        s->irqst |= 1 << (2 + 4 * chnum);		/* RX_FULL */
-    if ((ch->status & (1 << 1)) &&			/* TXS */
-                    ((ch->config >> 12) & 3) != 1)	/* TRM */
-        s->irqst |= 1 << (0 + 4 * chnum);		/* TX_EMPTY */
+    if ((ch->status & (1 << 0)) &&          /* RXS */
+                    ((ch->config >> 12) & 3) != 2 &&    /* TRM */
+                    !(ch->config & (1 << 19)))      /* TURBO */
+        s->irqst |= 1 << (2 + 4 * chnum);       /* RX_FULL */
+    if ((ch->status & (1 << 1)) &&          /* TXS */
+                    ((ch->config >> 12) & 3) != 1)  /* TRM */
+        s->irqst |= 1 << (0 + 4 * chnum);       /* TX_EMPTY */
     omap_mcspi_interrupt_update(s);
     omap_mcspi_dmarequest_update(ch);
 }
@@ -125,7 +125,7 @@ void omap_mcspi_reset(struct omap_mcspi_s *s)
 
     for (ch = 0; ch < 4; ch ++) {
         s->ch[ch].config = 0x060000;
-        s->ch[ch].status = 2;				/* TXS */
+        s->ch[ch].status = 2;               /* TXS */
         s->ch[ch].control = 0;
 
         omap_mcspi_dmarequest_update(s->ch + ch);
@@ -145,28 +145,28 @@ static uint64_t omap_mcspi_read(void *opaque, hwaddr addr, unsigned size)
     }
 
     switch (addr) {
-    case 0x00:	/* MCSPI_REVISION */
+    case 0x00:  /* MCSPI_REVISION */
         return 0x91;
 
-    case 0x10:	/* MCSPI_SYSCONFIG */
+    case 0x10:  /* MCSPI_SYSCONFIG */
         return s->sysconfig;
 
-    case 0x14:	/* MCSPI_SYSSTATUS */
-        return 1;					/* RESETDONE */
+    case 0x14:  /* MCSPI_SYSSTATUS */
+        return 1;                   /* RESETDONE */
 
-    case 0x18:	/* MCSPI_IRQSTATUS */
+    case 0x18:  /* MCSPI_IRQSTATUS */
         return s->irqst;
 
-    case 0x1c:	/* MCSPI_IRQENABLE */
+    case 0x1c:  /* MCSPI_IRQENABLE */
         return s->irqen;
 
-    case 0x20:	/* MCSPI_WAKEUPENABLE */
+    case 0x20:  /* MCSPI_WAKEUPENABLE */
         return s->wken;
 
-    case 0x24:	/* MCSPI_SYST */
+    case 0x24:  /* MCSPI_SYST */
         return s->systest;
 
-    case 0x28:	/* MCSPI_MODULCTRL */
+    case 0x28:  /* MCSPI_MODULCTRL */
         return s->control;
 
     case 0x68: ch ++;
@@ -175,7 +175,7 @@ static uint64_t omap_mcspi_read(void *opaque, hwaddr addr, unsigned size)
         /* fall through */
     case 0x40: ch ++;
         /* fall through */
-    case 0x2c:	/* MCSPI_CHCONF */
+    case 0x2c:  /* MCSPI_CHCONF */
         return s->ch[ch].config;
 
     case 0x6c: ch ++;
@@ -184,7 +184,7 @@ static uint64_t omap_mcspi_read(void *opaque, hwaddr addr, unsigned size)
         /* fall through */
     case 0x44: ch ++;
         /* fall through */
-    case 0x30:	/* MCSPI_CHSTAT */
+    case 0x30:  /* MCSPI_CHSTAT */
         return s->ch[ch].status;
 
     case 0x70: ch ++;
@@ -193,7 +193,7 @@ static uint64_t omap_mcspi_read(void *opaque, hwaddr addr, unsigned size)
         /* fall through */
     case 0x48: ch ++;
         /* fall through */
-    case 0x34:	/* MCSPI_CHCTRL */
+    case 0x34:  /* MCSPI_CHCTRL */
         return s->ch[ch].control;
 
     case 0x74: ch ++;
@@ -202,7 +202,7 @@ static uint64_t omap_mcspi_read(void *opaque, hwaddr addr, unsigned size)
         /* fall through */
     case 0x4c: ch ++;
         /* fall through */
-    case 0x38:	/* MCSPI_TX */
+    case 0x38:  /* MCSPI_TX */
         return s->ch[ch].tx;
 
     case 0x78: ch ++;
@@ -211,8 +211,8 @@ static uint64_t omap_mcspi_read(void *opaque, hwaddr addr, unsigned size)
         /* fall through */
     case 0x50: ch ++;
         /* fall through */
-    case 0x3c:	/* MCSPI_RX */
-        s->ch[ch].status &= ~(1 << 0);			/* RXS */
+    case 0x3c:  /* MCSPI_RX */
+        s->ch[ch].status &= ~(1 << 0);          /* RXS */
         ret = s->ch[ch].rx;
         omap_mcspi_transfer_run(s, ch);
         return ret;
@@ -234,53 +234,53 @@ static void omap_mcspi_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* MCSPI_REVISION */
-    case 0x14:	/* MCSPI_SYSSTATUS */
-    case 0x30:	/* MCSPI_CHSTAT0 */
-    case 0x3c:	/* MCSPI_RX0 */
-    case 0x44:	/* MCSPI_CHSTAT1 */
-    case 0x50:	/* MCSPI_RX1 */
-    case 0x58:	/* MCSPI_CHSTAT2 */
-    case 0x64:	/* MCSPI_RX2 */
-    case 0x6c:	/* MCSPI_CHSTAT3 */
-    case 0x78:	/* MCSPI_RX3 */
+    case 0x00:  /* MCSPI_REVISION */
+    case 0x14:  /* MCSPI_SYSSTATUS */
+    case 0x30:  /* MCSPI_CHSTAT0 */
+    case 0x3c:  /* MCSPI_RX0 */
+    case 0x44:  /* MCSPI_CHSTAT1 */
+    case 0x50:  /* MCSPI_RX1 */
+    case 0x58:  /* MCSPI_CHSTAT2 */
+    case 0x64:  /* MCSPI_RX2 */
+    case 0x6c:  /* MCSPI_CHSTAT3 */
+    case 0x78:  /* MCSPI_RX3 */
         OMAP_RO_REG(addr);
         return;
 
-    case 0x10:	/* MCSPI_SYSCONFIG */
-        if (value & (1 << 1))				/* SOFTRESET */
+    case 0x10:  /* MCSPI_SYSCONFIG */
+        if (value & (1 << 1))               /* SOFTRESET */
             omap_mcspi_reset(s);
         s->sysconfig = value & 0x31d;
         break;
 
-    case 0x18:	/* MCSPI_IRQSTATUS */
+    case 0x18:  /* MCSPI_IRQSTATUS */
         if (!((s->control & (1 << 3)) && (s->systest & (1 << 11)))) {
             s->irqst &= ~value;
             omap_mcspi_interrupt_update(s);
         }
         break;
 
-    case 0x1c:	/* MCSPI_IRQENABLE */
+    case 0x1c:  /* MCSPI_IRQENABLE */
         s->irqen = value & 0x1777f;
         omap_mcspi_interrupt_update(s);
         break;
 
-    case 0x20:	/* MCSPI_WAKEUPENABLE */
+    case 0x20:  /* MCSPI_WAKEUPENABLE */
         s->wken = value & 1;
         break;
 
-    case 0x24:	/* MCSPI_SYST */
-        if (s->control & (1 << 3))			/* SYSTEM_TEST */
-            if (value & (1 << 11)) {			/* SSB */
+    case 0x24:  /* MCSPI_SYST */
+        if (s->control & (1 << 3))          /* SYSTEM_TEST */
+            if (value & (1 << 11)) {            /* SSB */
                 s->irqst |= 0x1777f;
                 omap_mcspi_interrupt_update(s);
             }
         s->systest = value & 0xfff;
         break;
 
-    case 0x28:	/* MCSPI_MODULCTRL */
-        if (value & (1 << 3))				/* SYSTEM_TEST */
-            if (s->systest & (1 << 11)) {		/* SSB */
+    case 0x28:  /* MCSPI_MODULCTRL */
+        if (value & (1 << 3))               /* SYSTEM_TEST */
+            if (s->systest & (1 << 11)) {       /* SSB */
                 s->irqst |= 0x1777f;
                 omap_mcspi_interrupt_update(s);
             }
@@ -293,8 +293,8 @@ static void omap_mcspi_write(void *opaque, hwaddr addr,
         /* fall through */
     case 0x40: ch ++;
         /* fall through */
-    case 0x2c:	/* MCSPI_CHCONF */
-        if ((value ^ s->ch[ch].config) & (3 << 14))	/* DMAR | DMAW */
+    case 0x2c:  /* MCSPI_CHCONF */
+        if ((value ^ s->ch[ch].config) & (3 << 14)) /* DMAR | DMAW */
             omap_mcspi_dmarequest_update(s->ch + ch);
         if (((value >> 12) & 3) == 3) { /* TRM */
             qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid TRM value (3)\n",
@@ -314,8 +314,8 @@ static void omap_mcspi_write(void *opaque, hwaddr addr,
         /* fall through */
     case 0x48: ch ++;
         /* fall through */
-    case 0x34:	/* MCSPI_CHCTRL */
-        if (value & ~s->ch[ch].control & 1) {		/* EN */
+    case 0x34:  /* MCSPI_CHCTRL */
+        if (value & ~s->ch[ch].control & 1) {       /* EN */
             s->ch[ch].control |= 1;
             omap_mcspi_transfer_run(s, ch);
         } else
@@ -328,9 +328,9 @@ static void omap_mcspi_write(void *opaque, hwaddr addr,
         /* fall through */
     case 0x4c: ch ++;
         /* fall through */
-    case 0x38:	/* MCSPI_TX */
+    case 0x38:  /* MCSPI_TX */
         s->ch[ch].tx = value;
-        s->ch[ch].status &= ~(1 << 1);			/* TXS */
+        s->ch[ch].status &= ~(1 << 1);          /* TXS */
         omap_mcspi_transfer_run(s, ch);
         break;
 
diff --git a/hw/timer/omap_gptimer.c b/hw/timer/omap_gptimer.c
index 34e6af7aff..cf5bde0ce3 100644
--- a/hw/timer/omap_gptimer.c
+++ b/hw/timer/omap_gptimer.c
@@ -69,13 +69,13 @@ struct omap_gp_timer_s {
     uint32_t match_val;
     int capt_num;
 
-    uint16_t writeh;	/* LSB */
-    uint16_t readh;	/* MSB */
+    uint16_t writeh;    /* LSB */
+    uint16_t readh; /* MSB */
 };
 
-#define GPT_TCAR_IT	(1 << 2)
-#define GPT_OVF_IT	(1 << 1)
-#define GPT_MAT_IT	(1 << 0)
+#define GPT_TCAR_IT (1 << 2)
+#define GPT_OVF_IT  (1 << 1)
+#define GPT_MAT_IT  (1 << 0)
 
 static inline void omap_gp_timer_intr(struct omap_gp_timer_s *timer, int it)
 {
@@ -265,26 +265,26 @@ static uint32_t omap_gp_timer_readw(void *opaque, hwaddr addr)
     struct omap_gp_timer_s *s = opaque;
 
     switch (addr) {
-    case 0x00:	/* TIDR */
+    case 0x00:  /* TIDR */
         return 0x21;
 
-    case 0x10:	/* TIOCP_CFG */
+    case 0x10:  /* TIOCP_CFG */
         return s->config;
 
-    case 0x14:	/* TISTAT */
+    case 0x14:  /* TISTAT */
         /* ??? When's this bit reset? */
-        return 1;						/* RESETDONE */
+        return 1;                       /* RESETDONE */
 
-    case 0x18:	/* TISR */
+    case 0x18:  /* TISR */
         return s->status;
 
-    case 0x1c:	/* TIER */
+    case 0x1c:  /* TIER */
         return s->it_ena;
 
-    case 0x20:	/* TWER */
+    case 0x20:  /* TWER */
         return s->wu_ena;
 
-    case 0x24:	/* TCLR */
+    case 0x24:  /* TCLR */
         return (s->inout << 14) |
                 (s->capt2 << 13) |
                 (s->pt << 12) |
@@ -297,28 +297,28 @@ static uint32_t omap_gp_timer_readw(void *opaque, hwaddr addr)
                 (s->ar << 1) |
                 (s->st << 0);
 
-    case 0x28:	/* TCRR */
+    case 0x28:  /* TCRR */
         return omap_gp_timer_read(s);
 
-    case 0x2c:	/* TLDR */
+    case 0x2c:  /* TLDR */
         return s->load_val;
 
-    case 0x30:	/* TTGR */
+    case 0x30:  /* TTGR */
         return 0xffffffff;
 
-    case 0x34:	/* TWPS */
-        return 0x00000000;	/* No posted writes pending.  */
+    case 0x34:  /* TWPS */
+        return 0x00000000;  /* No posted writes pending.  */
 
-    case 0x38:	/* TMAR */
+    case 0x38:  /* TMAR */
         return s->match_val;
 
-    case 0x3c:	/* TCAR1 */
+    case 0x3c:  /* TCAR1 */
         return s->capture_val[0];
 
-    case 0x40:	/* TSICR */
+    case 0x40:  /* TSICR */
         return s->posted << 2;
 
-    case 0x44:	/* TCAR2 */
+    case 0x44:  /* TCAR2 */
         return s->capture_val[1];
     }
 
@@ -345,39 +345,39 @@ static void omap_gp_timer_write(void *opaque, hwaddr addr, uint32_t value)
     struct omap_gp_timer_s *s = opaque;
 
     switch (addr) {
-    case 0x00:	/* TIDR */
-    case 0x14:	/* TISTAT */
-    case 0x34:	/* TWPS */
-    case 0x3c:	/* TCAR1 */
-    case 0x44:	/* TCAR2 */
+    case 0x00:  /* TIDR */
+    case 0x14:  /* TISTAT */
+    case 0x34:  /* TWPS */
+    case 0x3c:  /* TCAR1 */
+    case 0x44:  /* TCAR2 */
         OMAP_RO_REG(addr);
         break;
 
-    case 0x10:	/* TIOCP_CFG */
+    case 0x10:  /* TIOCP_CFG */
         s->config = value & 0x33d;
-        if (((value >> 3) & 3) == 3)				/* IDLEMODE */
+        if (((value >> 3) & 3) == 3)                /* IDLEMODE */
             fprintf(stderr, "%s: illegal IDLEMODE value in TIOCP_CFG\n",
                             __func__);
-        if (value & 2)						/* SOFTRESET */
+        if (value & 2)                      /* SOFTRESET */
             omap_gp_timer_reset(s);
         break;
 
-    case 0x18:	/* TISR */
+    case 0x18:  /* TISR */
         if (value & GPT_TCAR_IT)
             s->capt_num = 0;
         if (s->status && !(s->status &= ~value))
             qemu_irq_lower(s->irq);
         break;
 
-    case 0x1c:	/* TIER */
+    case 0x1c:  /* TIER */
         s->it_ena = value & 7;
         break;
 
-    case 0x20:	/* TWER */
+    case 0x20:  /* TWER */
         s->wu_ena = value & 7;
         break;
 
-    case 0x24:	/* TCLR */
+    case 0x24:  /* TCLR */
         omap_gp_timer_sync(s);
         s->inout = (value >> 14) & 1;
         s->capt2 = (value >> 13) & 1;
@@ -406,31 +406,31 @@ static void omap_gp_timer_write(void *opaque, hwaddr addr, uint32_t value)
         omap_gp_timer_update(s);
         break;
 
-    case 0x28:	/* TCRR */
+    case 0x28:  /* TCRR */
         s->time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         s->val = value;
         omap_gp_timer_update(s);
         break;
 
-    case 0x2c:	/* TLDR */
+    case 0x2c:  /* TLDR */
         s->load_val = value;
         break;
 
-    case 0x30:	/* TTGR */
+    case 0x30:  /* TTGR */
         s->time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         s->val = s->load_val;
         omap_gp_timer_update(s);
         break;
 
-    case 0x38:	/* TMAR */
+    case 0x38:  /* TMAR */
         omap_gp_timer_sync(s);
         s->match_val = value;
         omap_gp_timer_update(s);
         break;
 
-    case 0x40:	/* TSICR */
+    case 0x40:  /* TSICR */
         s->posted = (value >> 2) & 1;
-        if (value & 2)	/* How much exactly are we supposed to reset? */
+        if (value & 2)  /* How much exactly are we supposed to reset? */
             omap_gp_timer_reset(s);
         break;
 
diff --git a/hw/timer/omap_synctimer.c b/hw/timer/omap_synctimer.c
index d93a9344ed..23af6dbdb8 100644
--- a/hw/timer/omap_synctimer.c
+++ b/hw/timer/omap_synctimer.c
@@ -42,10 +42,10 @@ static uint32_t omap_synctimer_readw(void *opaque, hwaddr addr)
     struct omap_synctimer_s *s = opaque;
 
     switch (addr) {
-    case 0x00:	/* 32KSYNCNT_REV */
+    case 0x00:  /* 32KSYNCNT_REV */
         return 0x21;
 
-    case 0x10:	/* CR */
+    case 0x10:  /* CR */
         return omap_synctimer_read(s) - s->val;
     }
 
diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index 2ae5ae3212..18ddcc3625 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -19,42 +19,42 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 
-#define OSMR0	0x00
-#define OSMR1	0x04
-#define OSMR2	0x08
-#define OSMR3	0x0c
-#define OSMR4	0x80
-#define OSMR5	0x84
-#define OSMR6	0x88
-#define OSMR7	0x8c
-#define OSMR8	0x90
-#define OSMR9	0x94
-#define OSMR10	0x98
-#define OSMR11	0x9c
-#define OSCR	0x10	/* OS Timer Count */
-#define OSCR4	0x40
-#define OSCR5	0x44
-#define OSCR6	0x48
-#define OSCR7	0x4c
-#define OSCR8	0x50
-#define OSCR9	0x54
-#define OSCR10	0x58
-#define OSCR11	0x5c
-#define OSSR	0x14	/* Timer status register */
-#define OWER	0x18
-#define OIER	0x1c	/* Interrupt enable register  3-0 to E3-E0 */
-#define OMCR4	0xc0	/* OS Match Control registers */
-#define OMCR5	0xc4
-#define OMCR6	0xc8
-#define OMCR7	0xcc
-#define OMCR8	0xd0
-#define OMCR9	0xd4
-#define OMCR10	0xd8
-#define OMCR11	0xdc
-#define OSNR	0x20
-
-#define PXA25X_FREQ	3686400	/* 3.6864 MHz */
-#define PXA27X_FREQ	3250000	/* 3.25 MHz */
+#define OSMR0   0x00
+#define OSMR1   0x04
+#define OSMR2   0x08
+#define OSMR3   0x0c
+#define OSMR4   0x80
+#define OSMR5   0x84
+#define OSMR6   0x88
+#define OSMR7   0x8c
+#define OSMR8   0x90
+#define OSMR9   0x94
+#define OSMR10  0x98
+#define OSMR11  0x9c
+#define OSCR    0x10    /* OS Timer Count */
+#define OSCR4   0x40
+#define OSCR5   0x44
+#define OSCR6   0x48
+#define OSCR7   0x4c
+#define OSCR8   0x50
+#define OSCR9   0x54
+#define OSCR10  0x58
+#define OSCR11  0x5c
+#define OSSR    0x14    /* Timer status register */
+#define OWER    0x18
+#define OIER    0x1c    /* Interrupt enable register  3-0 to E3-E0 */
+#define OMCR4   0xc0    /* OS Match Control registers */
+#define OMCR5   0xc4
+#define OMCR6   0xc8
+#define OMCR7   0xcc
+#define OMCR8   0xd0
+#define OMCR9   0xd4
+#define OMCR10  0xd8
+#define OMCR11  0xdc
+#define OSNR    0x20
+
+#define PXA25X_FREQ 3686400 /* 3.6864 MHz */
+#define PXA27X_FREQ 3250000 /* 3.25 MHz */
 
 static int pxa2xx_timer4_freq[8] = {
     [0] = 0,
@@ -107,7 +107,7 @@ struct PXA2xxTimerInfo {
     PXA2xxTimer4 tm4[8];
 };
 
-#define PXA2XX_TIMER_HAVE_TM4	0
+#define PXA2XX_TIMER_HAVE_TM4   0
 
 static inline int pxa2xx_timer_has_tm4(PXA2xxTimerInfo *s)
 {
@@ -231,7 +231,7 @@ static uint64_t pxa2xx_timer_read(void *opaque, hwaddr offset,
                      NANOSECONDS_PER_SECOND);
     case OIER:
         return s->irq_enabled;
-    case OSSR:	/* Status register */
+    case OSSR:  /* Status register */
         return s->events;
     case OWER:
         return s->reset3;
@@ -337,7 +337,7 @@ static void pxa2xx_timer_write(void *opaque, hwaddr offset,
     case OIER:
         s->irq_enabled = value & 0xfff;
         break;
-    case OSSR:	/* Status register */
+    case OSSR:  /* Status register */
         value &= s->events;
         s->events &= ~value;
         for (i = 0; i < 4; i ++, value >>= 1)
@@ -346,7 +346,7 @@ static void pxa2xx_timer_write(void *opaque, hwaddr offset,
         if (pxa2xx_timer_has_tm4(s) && !(s->events & 0xff0) && value)
             qemu_irq_lower(s->irq4);
         break;
-    case OWER:	/* XXX: Reset on OSMR3 match? */
+    case OWER:  /* XXX: Reset on OSMR3 match? */
         s->reset3 = value;
         break;
     case OMCR7:  tm ++;
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index c275d9b681..84aa5efb4f 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -26,33 +26,33 @@
 #include "qemu/log.h"
 #include "qom/object.h"
 
-# define OMAP_EMIFS_BASE	0x00000000
-# define OMAP2_Q0_BASE		0x00000000
-# define OMAP_CS0_BASE		0x00000000
-# define OMAP_CS1_BASE		0x04000000
-# define OMAP_CS2_BASE		0x08000000
-# define OMAP_CS3_BASE		0x0c000000
-# define OMAP_EMIFF_BASE	0x10000000
-# define OMAP_IMIF_BASE		0x20000000
-# define OMAP_LOCALBUS_BASE	0x30000000
-# define OMAP2_Q1_BASE		0x40000000
-# define OMAP2_L4_BASE		0x48000000
-# define OMAP2_SRAM_BASE	0x40200000
-# define OMAP2_L3_BASE		0x68000000
-# define OMAP2_Q2_BASE		0x80000000
-# define OMAP2_Q3_BASE		0xc0000000
-# define OMAP_MPUI_BASE		0xe1000000
-
-# define OMAP730_SRAM_SIZE	0x00032000
-# define OMAP15XX_SRAM_SIZE	0x00030000
-# define OMAP16XX_SRAM_SIZE	0x00004000
-# define OMAP1611_SRAM_SIZE	0x0003e800
-# define OMAP242X_SRAM_SIZE	0x000a0000
-# define OMAP243X_SRAM_SIZE	0x00010000
-# define OMAP_CS0_SIZE		0x04000000
-# define OMAP_CS1_SIZE		0x04000000
-# define OMAP_CS2_SIZE		0x04000000
-# define OMAP_CS3_SIZE		0x04000000
+# define OMAP_EMIFS_BASE    0x00000000
+# define OMAP2_Q0_BASE      0x00000000
+# define OMAP_CS0_BASE      0x00000000
+# define OMAP_CS1_BASE      0x04000000
+# define OMAP_CS2_BASE      0x08000000
+# define OMAP_CS3_BASE      0x0c000000
+# define OMAP_EMIFF_BASE    0x10000000
+# define OMAP_IMIF_BASE     0x20000000
+# define OMAP_LOCALBUS_BASE 0x30000000
+# define OMAP2_Q1_BASE      0x40000000
+# define OMAP2_L4_BASE      0x48000000
+# define OMAP2_SRAM_BASE    0x40200000
+# define OMAP2_L3_BASE      0x68000000
+# define OMAP2_Q2_BASE      0x80000000
+# define OMAP2_Q3_BASE      0xc0000000
+# define OMAP_MPUI_BASE     0xe1000000
+
+# define OMAP730_SRAM_SIZE  0x00032000
+# define OMAP15XX_SRAM_SIZE 0x00030000
+# define OMAP16XX_SRAM_SIZE 0x00004000
+# define OMAP1611_SRAM_SIZE 0x0003e800
+# define OMAP242X_SRAM_SIZE 0x000a0000
+# define OMAP243X_SRAM_SIZE 0x00010000
+# define OMAP_CS0_SIZE      0x04000000
+# define OMAP_CS1_SIZE      0x04000000
+# define OMAP_CS2_SIZE      0x04000000
+# define OMAP_CS3_SIZE      0x04000000
 
 /* omap_clk.c */
 struct omap_mpu_state_s;
@@ -175,309 +175,309 @@ void omap_gpmc_attach_nand(struct omap_gpmc_s *s, int cs, DeviceState *nand);
  * Common IRQ numbers for level 1 interrupt handler
  * See /usr/include/asm-arm/arch-omap/irqs.h in Linux.
  */
-# define OMAP_INT_CAMERA		1
-# define OMAP_INT_FIQ			3
-# define OMAP_INT_RTDX			6
-# define OMAP_INT_DSP_MMU_ABORT		7
-# define OMAP_INT_HOST			8
-# define OMAP_INT_ABORT			9
-# define OMAP_INT_BRIDGE_PRIV		13
-# define OMAP_INT_GPIO_BANK1		14
-# define OMAP_INT_UART3			15
-# define OMAP_INT_TIMER3		16
-# define OMAP_INT_DMA_CH0_6		19
-# define OMAP_INT_DMA_CH1_7		20
-# define OMAP_INT_DMA_CH2_8		21
-# define OMAP_INT_DMA_CH3		22
-# define OMAP_INT_DMA_CH4		23
-# define OMAP_INT_DMA_CH5		24
-# define OMAP_INT_DMA_LCD		25
-# define OMAP_INT_TIMER1		26
-# define OMAP_INT_WD_TIMER		27
-# define OMAP_INT_BRIDGE_PUB		28
-# define OMAP_INT_TIMER2		30
-# define OMAP_INT_LCD_CTRL		31
+# define OMAP_INT_CAMERA        1
+# define OMAP_INT_FIQ           3
+# define OMAP_INT_RTDX          6
+# define OMAP_INT_DSP_MMU_ABORT     7
+# define OMAP_INT_HOST          8
+# define OMAP_INT_ABORT         9
+# define OMAP_INT_BRIDGE_PRIV       13
+# define OMAP_INT_GPIO_BANK1        14
+# define OMAP_INT_UART3         15
+# define OMAP_INT_TIMER3        16
+# define OMAP_INT_DMA_CH0_6     19
+# define OMAP_INT_DMA_CH1_7     20
+# define OMAP_INT_DMA_CH2_8     21
+# define OMAP_INT_DMA_CH3       22
+# define OMAP_INT_DMA_CH4       23
+# define OMAP_INT_DMA_CH5       24
+# define OMAP_INT_DMA_LCD       25
+# define OMAP_INT_TIMER1        26
+# define OMAP_INT_WD_TIMER      27
+# define OMAP_INT_BRIDGE_PUB        28
+# define OMAP_INT_TIMER2        30
+# define OMAP_INT_LCD_CTRL      31
 
 /*
  * Common OMAP-15xx IRQ numbers for level 1 interrupt handler
  */
-# define OMAP_INT_15XX_IH2_IRQ		0
-# define OMAP_INT_15XX_LB_MMU		17
-# define OMAP_INT_15XX_LOCAL_BUS	29
+# define OMAP_INT_15XX_IH2_IRQ      0
+# define OMAP_INT_15XX_LB_MMU       17
+# define OMAP_INT_15XX_LOCAL_BUS    29
 
 /*
  * OMAP-1510 specific IRQ numbers for level 1 interrupt handler
  */
-# define OMAP_INT_1510_SPI_TX		4
-# define OMAP_INT_1510_SPI_RX		5
-# define OMAP_INT_1510_DSP_MAILBOX1	10
-# define OMAP_INT_1510_DSP_MAILBOX2	11
+# define OMAP_INT_1510_SPI_TX       4
+# define OMAP_INT_1510_SPI_RX       5
+# define OMAP_INT_1510_DSP_MAILBOX1 10
+# define OMAP_INT_1510_DSP_MAILBOX2 11
 
 /*
  * OMAP-310 specific IRQ numbers for level 1 interrupt handler
  */
-# define OMAP_INT_310_McBSP2_TX		4
-# define OMAP_INT_310_McBSP2_RX		5
-# define OMAP_INT_310_HSB_MAILBOX1	12
-# define OMAP_INT_310_HSAB_MMU		18
+# define OMAP_INT_310_McBSP2_TX     4
+# define OMAP_INT_310_McBSP2_RX     5
+# define OMAP_INT_310_HSB_MAILBOX1  12
+# define OMAP_INT_310_HSAB_MMU      18
 
 /*
  * OMAP-1610 specific IRQ numbers for level 1 interrupt handler
  */
-# define OMAP_INT_1610_IH2_IRQ		0
-# define OMAP_INT_1610_IH2_FIQ		2
-# define OMAP_INT_1610_McBSP2_TX	4
-# define OMAP_INT_1610_McBSP2_RX	5
-# define OMAP_INT_1610_DSP_MAILBOX1	10
-# define OMAP_INT_1610_DSP_MAILBOX2	11
-# define OMAP_INT_1610_LCD_LINE		12
-# define OMAP_INT_1610_GPTIMER1		17
-# define OMAP_INT_1610_GPTIMER2		18
-# define OMAP_INT_1610_SSR_FIFO_0	29
+# define OMAP_INT_1610_IH2_IRQ      0
+# define OMAP_INT_1610_IH2_FIQ      2
+# define OMAP_INT_1610_McBSP2_TX    4
+# define OMAP_INT_1610_McBSP2_RX    5
+# define OMAP_INT_1610_DSP_MAILBOX1 10
+# define OMAP_INT_1610_DSP_MAILBOX2 11
+# define OMAP_INT_1610_LCD_LINE     12
+# define OMAP_INT_1610_GPTIMER1     17
+# define OMAP_INT_1610_GPTIMER2     18
+# define OMAP_INT_1610_SSR_FIFO_0   29
 
 /*
  * OMAP-730 specific IRQ numbers for level 1 interrupt handler
  */
-# define OMAP_INT_730_IH2_FIQ		0
-# define OMAP_INT_730_IH2_IRQ		1
-# define OMAP_INT_730_USB_NON_ISO	2
-# define OMAP_INT_730_USB_ISO		3
-# define OMAP_INT_730_ICR		4
-# define OMAP_INT_730_EAC		5
-# define OMAP_INT_730_GPIO_BANK1	6
-# define OMAP_INT_730_GPIO_BANK2	7
-# define OMAP_INT_730_GPIO_BANK3	8
-# define OMAP_INT_730_McBSP2TX		10
-# define OMAP_INT_730_McBSP2RX		11
-# define OMAP_INT_730_McBSP2RX_OVF	12
-# define OMAP_INT_730_LCD_LINE		14
-# define OMAP_INT_730_GSM_PROTECT	15
-# define OMAP_INT_730_TIMER3		16
-# define OMAP_INT_730_GPIO_BANK5	17
-# define OMAP_INT_730_GPIO_BANK6	18
-# define OMAP_INT_730_SPGIO_WR		29
+# define OMAP_INT_730_IH2_FIQ       0
+# define OMAP_INT_730_IH2_IRQ       1
+# define OMAP_INT_730_USB_NON_ISO   2
+# define OMAP_INT_730_USB_ISO       3
+# define OMAP_INT_730_ICR       4
+# define OMAP_INT_730_EAC       5
+# define OMAP_INT_730_GPIO_BANK1    6
+# define OMAP_INT_730_GPIO_BANK2    7
+# define OMAP_INT_730_GPIO_BANK3    8
+# define OMAP_INT_730_McBSP2TX      10
+# define OMAP_INT_730_McBSP2RX      11
+# define OMAP_INT_730_McBSP2RX_OVF  12
+# define OMAP_INT_730_LCD_LINE      14
+# define OMAP_INT_730_GSM_PROTECT   15
+# define OMAP_INT_730_TIMER3        16
+# define OMAP_INT_730_GPIO_BANK5    17
+# define OMAP_INT_730_GPIO_BANK6    18
+# define OMAP_INT_730_SPGIO_WR      29
 
 /*
  * Common IRQ numbers for level 2 interrupt handler
  */
-# define OMAP_INT_KEYBOARD		1
-# define OMAP_INT_uWireTX		2
-# define OMAP_INT_uWireRX		3
-# define OMAP_INT_I2C			4
-# define OMAP_INT_MPUIO			5
-# define OMAP_INT_USB_HHC_1		6
-# define OMAP_INT_McBSP3TX		10
-# define OMAP_INT_McBSP3RX		11
-# define OMAP_INT_McBSP1TX		12
-# define OMAP_INT_McBSP1RX		13
-# define OMAP_INT_UART1			14
-# define OMAP_INT_UART2			15
-# define OMAP_INT_USB_W2FC		20
-# define OMAP_INT_1WIRE			21
-# define OMAP_INT_OS_TIMER		22
-# define OMAP_INT_OQN			23
-# define OMAP_INT_GAUGE_32K		24
-# define OMAP_INT_RTC_TIMER		25
-# define OMAP_INT_RTC_ALARM		26
-# define OMAP_INT_DSP_MMU		28
+# define OMAP_INT_KEYBOARD      1
+# define OMAP_INT_uWireTX       2
+# define OMAP_INT_uWireRX       3
+# define OMAP_INT_I2C           4
+# define OMAP_INT_MPUIO         5
+# define OMAP_INT_USB_HHC_1     6
+# define OMAP_INT_McBSP3TX      10
+# define OMAP_INT_McBSP3RX      11
+# define OMAP_INT_McBSP1TX      12
+# define OMAP_INT_McBSP1RX      13
+# define OMAP_INT_UART1         14
+# define OMAP_INT_UART2         15
+# define OMAP_INT_USB_W2FC      20
+# define OMAP_INT_1WIRE         21
+# define OMAP_INT_OS_TIMER      22
+# define OMAP_INT_OQN           23
+# define OMAP_INT_GAUGE_32K     24
+# define OMAP_INT_RTC_TIMER     25
+# define OMAP_INT_RTC_ALARM     26
+# define OMAP_INT_DSP_MMU       28
 
 /*
  * OMAP-1510 specific IRQ numbers for level 2 interrupt handler
  */
-# define OMAP_INT_1510_BT_MCSI1TX	16
-# define OMAP_INT_1510_BT_MCSI1RX	17
-# define OMAP_INT_1510_SoSSI_MATCH	19
-# define OMAP_INT_1510_MEM_STICK	27
-# define OMAP_INT_1510_COM_SPI_RO	31
+# define OMAP_INT_1510_BT_MCSI1TX   16
+# define OMAP_INT_1510_BT_MCSI1RX   17
+# define OMAP_INT_1510_SoSSI_MATCH  19
+# define OMAP_INT_1510_MEM_STICK    27
+# define OMAP_INT_1510_COM_SPI_RO   31
 
 /*
  * OMAP-310 specific IRQ numbers for level 2 interrupt handler
  */
-# define OMAP_INT_310_FAC		0
-# define OMAP_INT_310_USB_HHC_2		7
-# define OMAP_INT_310_MCSI1_FE		16
-# define OMAP_INT_310_MCSI2_FE		17
-# define OMAP_INT_310_USB_W2FC_ISO	29
-# define OMAP_INT_310_USB_W2FC_NON_ISO	30
-# define OMAP_INT_310_McBSP2RX_OF	31
+# define OMAP_INT_310_FAC       0
+# define OMAP_INT_310_USB_HHC_2     7
+# define OMAP_INT_310_MCSI1_FE      16
+# define OMAP_INT_310_MCSI2_FE      17
+# define OMAP_INT_310_USB_W2FC_ISO  29
+# define OMAP_INT_310_USB_W2FC_NON_ISO  30
+# define OMAP_INT_310_McBSP2RX_OF   31
 
 /*
  * OMAP-1610 specific IRQ numbers for level 2 interrupt handler
  */
-# define OMAP_INT_1610_FAC		0
-# define OMAP_INT_1610_USB_HHC_2	7
-# define OMAP_INT_1610_USB_OTG		8
-# define OMAP_INT_1610_SoSSI		9
-# define OMAP_INT_1610_BT_MCSI1TX	16
-# define OMAP_INT_1610_BT_MCSI1RX	17
-# define OMAP_INT_1610_SoSSI_MATCH	19
-# define OMAP_INT_1610_MEM_STICK	27
-# define OMAP_INT_1610_McBSP2RX_OF	31
-# define OMAP_INT_1610_STI		32
-# define OMAP_INT_1610_STI_WAKEUP	33
-# define OMAP_INT_1610_GPTIMER3		34
-# define OMAP_INT_1610_GPTIMER4		35
-# define OMAP_INT_1610_GPTIMER5		36
-# define OMAP_INT_1610_GPTIMER6		37
-# define OMAP_INT_1610_GPTIMER7		38
-# define OMAP_INT_1610_GPTIMER8		39
-# define OMAP_INT_1610_GPIO_BANK2	40
-# define OMAP_INT_1610_GPIO_BANK3	41
-# define OMAP_INT_1610_MMC2		42
-# define OMAP_INT_1610_CF		43
-# define OMAP_INT_1610_WAKE_UP_REQ	46
-# define OMAP_INT_1610_GPIO_BANK4	48
-# define OMAP_INT_1610_SPI		49
-# define OMAP_INT_1610_DMA_CH6		53
-# define OMAP_INT_1610_DMA_CH7		54
-# define OMAP_INT_1610_DMA_CH8		55
-# define OMAP_INT_1610_DMA_CH9		56
-# define OMAP_INT_1610_DMA_CH10		57
-# define OMAP_INT_1610_DMA_CH11		58
-# define OMAP_INT_1610_DMA_CH12		59
-# define OMAP_INT_1610_DMA_CH13		60
-# define OMAP_INT_1610_DMA_CH14		61
-# define OMAP_INT_1610_DMA_CH15		62
-# define OMAP_INT_1610_NAND		63
+# define OMAP_INT_1610_FAC      0
+# define OMAP_INT_1610_USB_HHC_2    7
+# define OMAP_INT_1610_USB_OTG      8
+# define OMAP_INT_1610_SoSSI        9
+# define OMAP_INT_1610_BT_MCSI1TX   16
+# define OMAP_INT_1610_BT_MCSI1RX   17
+# define OMAP_INT_1610_SoSSI_MATCH  19
+# define OMAP_INT_1610_MEM_STICK    27
+# define OMAP_INT_1610_McBSP2RX_OF  31
+# define OMAP_INT_1610_STI      32
+# define OMAP_INT_1610_STI_WAKEUP   33
+# define OMAP_INT_1610_GPTIMER3     34
+# define OMAP_INT_1610_GPTIMER4     35
+# define OMAP_INT_1610_GPTIMER5     36
+# define OMAP_INT_1610_GPTIMER6     37
+# define OMAP_INT_1610_GPTIMER7     38
+# define OMAP_INT_1610_GPTIMER8     39
+# define OMAP_INT_1610_GPIO_BANK2   40
+# define OMAP_INT_1610_GPIO_BANK3   41
+# define OMAP_INT_1610_MMC2     42
+# define OMAP_INT_1610_CF       43
+# define OMAP_INT_1610_WAKE_UP_REQ  46
+# define OMAP_INT_1610_GPIO_BANK4   48
+# define OMAP_INT_1610_SPI      49
+# define OMAP_INT_1610_DMA_CH6      53
+# define OMAP_INT_1610_DMA_CH7      54
+# define OMAP_INT_1610_DMA_CH8      55
+# define OMAP_INT_1610_DMA_CH9      56
+# define OMAP_INT_1610_DMA_CH10     57
+# define OMAP_INT_1610_DMA_CH11     58
+# define OMAP_INT_1610_DMA_CH12     59
+# define OMAP_INT_1610_DMA_CH13     60
+# define OMAP_INT_1610_DMA_CH14     61
+# define OMAP_INT_1610_DMA_CH15     62
+# define OMAP_INT_1610_NAND     63
 
 /*
  * OMAP-730 specific IRQ numbers for level 2 interrupt handler
  */
-# define OMAP_INT_730_HW_ERRORS		0
-# define OMAP_INT_730_NFIQ_PWR_FAIL	1
-# define OMAP_INT_730_CFCD		2
-# define OMAP_INT_730_CFIREQ		3
-# define OMAP_INT_730_I2C		4
-# define OMAP_INT_730_PCC		5
-# define OMAP_INT_730_MPU_EXT_NIRQ	6
-# define OMAP_INT_730_SPI_100K_1	7
-# define OMAP_INT_730_SYREN_SPI		8
-# define OMAP_INT_730_VLYNQ		9
-# define OMAP_INT_730_GPIO_BANK4	10
-# define OMAP_INT_730_McBSP1TX		11
-# define OMAP_INT_730_McBSP1RX		12
-# define OMAP_INT_730_McBSP1RX_OF	13
-# define OMAP_INT_730_UART_MODEM_IRDA_2	14
-# define OMAP_INT_730_UART_MODEM_1	15
-# define OMAP_INT_730_MCSI		16
-# define OMAP_INT_730_uWireTX		17
-# define OMAP_INT_730_uWireRX		18
-# define OMAP_INT_730_SMC_CD		19
-# define OMAP_INT_730_SMC_IREQ		20
-# define OMAP_INT_730_HDQ_1WIRE		21
-# define OMAP_INT_730_TIMER32K		22
-# define OMAP_INT_730_MMC_SDIO		23
-# define OMAP_INT_730_UPLD		24
-# define OMAP_INT_730_USB_HHC_1		27
-# define OMAP_INT_730_USB_HHC_2		28
-# define OMAP_INT_730_USB_GENI		29
-# define OMAP_INT_730_USB_OTG		30
-# define OMAP_INT_730_CAMERA_IF		31
-# define OMAP_INT_730_RNG		32
-# define OMAP_INT_730_DUAL_MODE_TIMER	33
-# define OMAP_INT_730_DBB_RF_EN		34
-# define OMAP_INT_730_MPUIO_KEYPAD	35
-# define OMAP_INT_730_SHA1_MD5		36
-# define OMAP_INT_730_SPI_100K_2	37
-# define OMAP_INT_730_RNG_IDLE		38
-# define OMAP_INT_730_MPUIO		39
-# define OMAP_INT_730_LLPC_LCD_CTRL_OFF	40
-# define OMAP_INT_730_LLPC_OE_FALLING	41
-# define OMAP_INT_730_LLPC_OE_RISING	42
-# define OMAP_INT_730_LLPC_VSYNC	43
-# define OMAP_INT_730_WAKE_UP_REQ	46
-# define OMAP_INT_730_DMA_CH6		53
-# define OMAP_INT_730_DMA_CH7		54
-# define OMAP_INT_730_DMA_CH8		55
-# define OMAP_INT_730_DMA_CH9		56
-# define OMAP_INT_730_DMA_CH10		57
-# define OMAP_INT_730_DMA_CH11		58
-# define OMAP_INT_730_DMA_CH12		59
-# define OMAP_INT_730_DMA_CH13		60
-# define OMAP_INT_730_DMA_CH14		61
-# define OMAP_INT_730_DMA_CH15		62
-# define OMAP_INT_730_NAND		63
+# define OMAP_INT_730_HW_ERRORS     0
+# define OMAP_INT_730_NFIQ_PWR_FAIL 1
+# define OMAP_INT_730_CFCD      2
+# define OMAP_INT_730_CFIREQ        3
+# define OMAP_INT_730_I2C       4
+# define OMAP_INT_730_PCC       5
+# define OMAP_INT_730_MPU_EXT_NIRQ  6
+# define OMAP_INT_730_SPI_100K_1    7
+# define OMAP_INT_730_SYREN_SPI     8
+# define OMAP_INT_730_VLYNQ     9
+# define OMAP_INT_730_GPIO_BANK4    10
+# define OMAP_INT_730_McBSP1TX      11
+# define OMAP_INT_730_McBSP1RX      12
+# define OMAP_INT_730_McBSP1RX_OF   13
+# define OMAP_INT_730_UART_MODEM_IRDA_2 14
+# define OMAP_INT_730_UART_MODEM_1  15
+# define OMAP_INT_730_MCSI      16
+# define OMAP_INT_730_uWireTX       17
+# define OMAP_INT_730_uWireRX       18
+# define OMAP_INT_730_SMC_CD        19
+# define OMAP_INT_730_SMC_IREQ      20
+# define OMAP_INT_730_HDQ_1WIRE     21
+# define OMAP_INT_730_TIMER32K      22
+# define OMAP_INT_730_MMC_SDIO      23
+# define OMAP_INT_730_UPLD      24
+# define OMAP_INT_730_USB_HHC_1     27
+# define OMAP_INT_730_USB_HHC_2     28
+# define OMAP_INT_730_USB_GENI      29
+# define OMAP_INT_730_USB_OTG       30
+# define OMAP_INT_730_CAMERA_IF     31
+# define OMAP_INT_730_RNG       32
+# define OMAP_INT_730_DUAL_MODE_TIMER   33
+# define OMAP_INT_730_DBB_RF_EN     34
+# define OMAP_INT_730_MPUIO_KEYPAD  35
+# define OMAP_INT_730_SHA1_MD5      36
+# define OMAP_INT_730_SPI_100K_2    37
+# define OMAP_INT_730_RNG_IDLE      38
+# define OMAP_INT_730_MPUIO     39
+# define OMAP_INT_730_LLPC_LCD_CTRL_OFF 40
+# define OMAP_INT_730_LLPC_OE_FALLING   41
+# define OMAP_INT_730_LLPC_OE_RISING    42
+# define OMAP_INT_730_LLPC_VSYNC    43
+# define OMAP_INT_730_WAKE_UP_REQ   46
+# define OMAP_INT_730_DMA_CH6       53
+# define OMAP_INT_730_DMA_CH7       54
+# define OMAP_INT_730_DMA_CH8       55
+# define OMAP_INT_730_DMA_CH9       56
+# define OMAP_INT_730_DMA_CH10      57
+# define OMAP_INT_730_DMA_CH11      58
+# define OMAP_INT_730_DMA_CH12      59
+# define OMAP_INT_730_DMA_CH13      60
+# define OMAP_INT_730_DMA_CH14      61
+# define OMAP_INT_730_DMA_CH15      62
+# define OMAP_INT_730_NAND      63
 
 /*
  * OMAP-24xx common IRQ numbers
  */
-# define OMAP_INT_24XX_STI		4
-# define OMAP_INT_24XX_SYS_NIRQ		7
-# define OMAP_INT_24XX_L3_IRQ		10
-# define OMAP_INT_24XX_PRCM_MPU_IRQ	11
-# define OMAP_INT_24XX_SDMA_IRQ0	12
-# define OMAP_INT_24XX_SDMA_IRQ1	13
-# define OMAP_INT_24XX_SDMA_IRQ2	14
-# define OMAP_INT_24XX_SDMA_IRQ3	15
-# define OMAP_INT_243X_MCBSP2_IRQ	16
-# define OMAP_INT_243X_MCBSP3_IRQ	17
-# define OMAP_INT_243X_MCBSP4_IRQ	18
-# define OMAP_INT_243X_MCBSP5_IRQ	19
-# define OMAP_INT_24XX_GPMC_IRQ		20
-# define OMAP_INT_24XX_GUFFAW_IRQ	21
-# define OMAP_INT_24XX_IVA_IRQ		22
-# define OMAP_INT_24XX_EAC_IRQ		23
-# define OMAP_INT_24XX_CAM_IRQ		24
-# define OMAP_INT_24XX_DSS_IRQ		25
-# define OMAP_INT_24XX_MAIL_U0_MPU	26
-# define OMAP_INT_24XX_DSP_UMA		27
-# define OMAP_INT_24XX_DSP_MMU		28
-# define OMAP_INT_24XX_GPIO_BANK1	29
-# define OMAP_INT_24XX_GPIO_BANK2	30
-# define OMAP_INT_24XX_GPIO_BANK3	31
-# define OMAP_INT_24XX_GPIO_BANK4	32
-# define OMAP_INT_243X_GPIO_BANK5	33
-# define OMAP_INT_24XX_MAIL_U3_MPU	34
-# define OMAP_INT_24XX_WDT3		35
-# define OMAP_INT_24XX_WDT4		36
-# define OMAP_INT_24XX_GPTIMER1		37
-# define OMAP_INT_24XX_GPTIMER2		38
-# define OMAP_INT_24XX_GPTIMER3		39
-# define OMAP_INT_24XX_GPTIMER4		40
-# define OMAP_INT_24XX_GPTIMER5		41
-# define OMAP_INT_24XX_GPTIMER6		42
-# define OMAP_INT_24XX_GPTIMER7		43
-# define OMAP_INT_24XX_GPTIMER8		44
-# define OMAP_INT_24XX_GPTIMER9		45
-# define OMAP_INT_24XX_GPTIMER10	46
-# define OMAP_INT_24XX_GPTIMER11	47
-# define OMAP_INT_24XX_GPTIMER12	48
-# define OMAP_INT_24XX_PKA_IRQ		50
-# define OMAP_INT_24XX_SHA1MD5_IRQ	51
-# define OMAP_INT_24XX_RNG_IRQ		52
-# define OMAP_INT_24XX_MG_IRQ		53
-# define OMAP_INT_24XX_I2C1_IRQ		56
-# define OMAP_INT_24XX_I2C2_IRQ		57
-# define OMAP_INT_24XX_MCBSP1_IRQ_TX	59
-# define OMAP_INT_24XX_MCBSP1_IRQ_RX	60
-# define OMAP_INT_24XX_MCBSP2_IRQ_TX	62
-# define OMAP_INT_24XX_MCBSP2_IRQ_RX	63
-# define OMAP_INT_243X_MCBSP1_IRQ	64
-# define OMAP_INT_24XX_MCSPI1_IRQ	65
-# define OMAP_INT_24XX_MCSPI2_IRQ	66
-# define OMAP_INT_24XX_SSI1_IRQ0	67
-# define OMAP_INT_24XX_SSI1_IRQ1	68
-# define OMAP_INT_24XX_SSI2_IRQ0	69
-# define OMAP_INT_24XX_SSI2_IRQ1	70
-# define OMAP_INT_24XX_SSI_GDD_IRQ	71
-# define OMAP_INT_24XX_UART1_IRQ	72
-# define OMAP_INT_24XX_UART2_IRQ	73
-# define OMAP_INT_24XX_UART3_IRQ	74
-# define OMAP_INT_24XX_USB_IRQ_GEN	75
-# define OMAP_INT_24XX_USB_IRQ_NISO	76
-# define OMAP_INT_24XX_USB_IRQ_ISO	77
-# define OMAP_INT_24XX_USB_IRQ_HGEN	78
-# define OMAP_INT_24XX_USB_IRQ_HSOF	79
-# define OMAP_INT_24XX_USB_IRQ_OTG	80
-# define OMAP_INT_24XX_VLYNQ_IRQ	81
-# define OMAP_INT_24XX_MMC_IRQ		83
-# define OMAP_INT_24XX_MS_IRQ		84
-# define OMAP_INT_24XX_FAC_IRQ		85
-# define OMAP_INT_24XX_MCSPI3_IRQ	91
-# define OMAP_INT_243X_HS_USB_MC	92
-# define OMAP_INT_243X_HS_USB_DMA	93
-# define OMAP_INT_243X_CARKIT		94
-# define OMAP_INT_34XX_GPTIMER12	95
+# define OMAP_INT_24XX_STI      4
+# define OMAP_INT_24XX_SYS_NIRQ     7
+# define OMAP_INT_24XX_L3_IRQ       10
+# define OMAP_INT_24XX_PRCM_MPU_IRQ 11
+# define OMAP_INT_24XX_SDMA_IRQ0    12
+# define OMAP_INT_24XX_SDMA_IRQ1    13
+# define OMAP_INT_24XX_SDMA_IRQ2    14
+# define OMAP_INT_24XX_SDMA_IRQ3    15
+# define OMAP_INT_243X_MCBSP2_IRQ   16
+# define OMAP_INT_243X_MCBSP3_IRQ   17
+# define OMAP_INT_243X_MCBSP4_IRQ   18
+# define OMAP_INT_243X_MCBSP5_IRQ   19
+# define OMAP_INT_24XX_GPMC_IRQ     20
+# define OMAP_INT_24XX_GUFFAW_IRQ   21
+# define OMAP_INT_24XX_IVA_IRQ      22
+# define OMAP_INT_24XX_EAC_IRQ      23
+# define OMAP_INT_24XX_CAM_IRQ      24
+# define OMAP_INT_24XX_DSS_IRQ      25
+# define OMAP_INT_24XX_MAIL_U0_MPU  26
+# define OMAP_INT_24XX_DSP_UMA      27
+# define OMAP_INT_24XX_DSP_MMU      28
+# define OMAP_INT_24XX_GPIO_BANK1   29
+# define OMAP_INT_24XX_GPIO_BANK2   30
+# define OMAP_INT_24XX_GPIO_BANK3   31
+# define OMAP_INT_24XX_GPIO_BANK4   32
+# define OMAP_INT_243X_GPIO_BANK5   33
+# define OMAP_INT_24XX_MAIL_U3_MPU  34
+# define OMAP_INT_24XX_WDT3     35
+# define OMAP_INT_24XX_WDT4     36
+# define OMAP_INT_24XX_GPTIMER1     37
+# define OMAP_INT_24XX_GPTIMER2     38
+# define OMAP_INT_24XX_GPTIMER3     39
+# define OMAP_INT_24XX_GPTIMER4     40
+# define OMAP_INT_24XX_GPTIMER5     41
+# define OMAP_INT_24XX_GPTIMER6     42
+# define OMAP_INT_24XX_GPTIMER7     43
+# define OMAP_INT_24XX_GPTIMER8     44
+# define OMAP_INT_24XX_GPTIMER9     45
+# define OMAP_INT_24XX_GPTIMER10    46
+# define OMAP_INT_24XX_GPTIMER11    47
+# define OMAP_INT_24XX_GPTIMER12    48
+# define OMAP_INT_24XX_PKA_IRQ      50
+# define OMAP_INT_24XX_SHA1MD5_IRQ  51
+# define OMAP_INT_24XX_RNG_IRQ      52
+# define OMAP_INT_24XX_MG_IRQ       53
+# define OMAP_INT_24XX_I2C1_IRQ     56
+# define OMAP_INT_24XX_I2C2_IRQ     57
+# define OMAP_INT_24XX_MCBSP1_IRQ_TX    59
+# define OMAP_INT_24XX_MCBSP1_IRQ_RX    60
+# define OMAP_INT_24XX_MCBSP2_IRQ_TX    62
+# define OMAP_INT_24XX_MCBSP2_IRQ_RX    63
+# define OMAP_INT_243X_MCBSP1_IRQ   64
+# define OMAP_INT_24XX_MCSPI1_IRQ   65
+# define OMAP_INT_24XX_MCSPI2_IRQ   66
+# define OMAP_INT_24XX_SSI1_IRQ0    67
+# define OMAP_INT_24XX_SSI1_IRQ1    68
+# define OMAP_INT_24XX_SSI2_IRQ0    69
+# define OMAP_INT_24XX_SSI2_IRQ1    70
+# define OMAP_INT_24XX_SSI_GDD_IRQ  71
+# define OMAP_INT_24XX_UART1_IRQ    72
+# define OMAP_INT_24XX_UART2_IRQ    73
+# define OMAP_INT_24XX_UART3_IRQ    74
+# define OMAP_INT_24XX_USB_IRQ_GEN  75
+# define OMAP_INT_24XX_USB_IRQ_NISO 76
+# define OMAP_INT_24XX_USB_IRQ_ISO  77
+# define OMAP_INT_24XX_USB_IRQ_HGEN 78
+# define OMAP_INT_24XX_USB_IRQ_HSOF 79
+# define OMAP_INT_24XX_USB_IRQ_OTG  80
+# define OMAP_INT_24XX_VLYNQ_IRQ    81
+# define OMAP_INT_24XX_MMC_IRQ      83
+# define OMAP_INT_24XX_MS_IRQ       84
+# define OMAP_INT_24XX_FAC_IRQ      85
+# define OMAP_INT_24XX_MCSPI3_IRQ   91
+# define OMAP_INT_243X_HS_USB_MC    92
+# define OMAP_INT_243X_HS_USB_DMA   93
+# define OMAP_INT_243X_CARKIT       94
+# define OMAP_INT_34XX_GPTIMER12    95
 
 /* omap_dma.c */
 enum omap_dma_model {
@@ -507,9 +507,9 @@ struct dma_irq_map {
 enum omap_dma_port {
     emiff = 0,
     emifs,
-    imif,	/* omap16xx: ocp_t1 */
+    imif,   /* omap16xx: ocp_t1 */
     tipb,
-    local,	/* omap16xx: ocp_t2 */
+    local,  /* omap16xx: ocp_t2 */
     tipb_mpui,
     __omap_dma_port_last,
 };
@@ -572,133 +572,133 @@ struct omap_dma_lcd_channel_s {
  * DMA request numbers for OMAP1
  * See /usr/include/asm-arm/arch-omap/dma.h in Linux.
  */
-# define OMAP_DMA_NO_DEVICE		0
-# define OMAP_DMA_MCSI1_TX		1
-# define OMAP_DMA_MCSI1_RX		2
-# define OMAP_DMA_I2C_RX		3
-# define OMAP_DMA_I2C_TX		4
-# define OMAP_DMA_EXT_NDMA_REQ0		5
-# define OMAP_DMA_EXT_NDMA_REQ1		6
-# define OMAP_DMA_UWIRE_TX		7
-# define OMAP_DMA_MCBSP1_TX		8
-# define OMAP_DMA_MCBSP1_RX		9
-# define OMAP_DMA_MCBSP3_TX		10
-# define OMAP_DMA_MCBSP3_RX		11
-# define OMAP_DMA_UART1_TX		12
-# define OMAP_DMA_UART1_RX		13
-# define OMAP_DMA_UART2_TX		14
-# define OMAP_DMA_UART2_RX		15
-# define OMAP_DMA_MCBSP2_TX		16
-# define OMAP_DMA_MCBSP2_RX		17
-# define OMAP_DMA_UART3_TX		18
-# define OMAP_DMA_UART3_RX		19
-# define OMAP_DMA_CAMERA_IF_RX		20
-# define OMAP_DMA_MMC_TX		21
-# define OMAP_DMA_MMC_RX		22
-# define OMAP_DMA_NAND			23	/* Not in OMAP310 */
-# define OMAP_DMA_IRQ_LCD_LINE		24	/* Not in OMAP310 */
-# define OMAP_DMA_MEMORY_STICK		25	/* Not in OMAP310 */
-# define OMAP_DMA_USB_W2FC_RX0		26
-# define OMAP_DMA_USB_W2FC_RX1		27
-# define OMAP_DMA_USB_W2FC_RX2		28
-# define OMAP_DMA_USB_W2FC_TX0		29
-# define OMAP_DMA_USB_W2FC_TX1		30
-# define OMAP_DMA_USB_W2FC_TX2		31
+# define OMAP_DMA_NO_DEVICE     0
+# define OMAP_DMA_MCSI1_TX      1
+# define OMAP_DMA_MCSI1_RX      2
+# define OMAP_DMA_I2C_RX        3
+# define OMAP_DMA_I2C_TX        4
+# define OMAP_DMA_EXT_NDMA_REQ0     5
+# define OMAP_DMA_EXT_NDMA_REQ1     6
+# define OMAP_DMA_UWIRE_TX      7
+# define OMAP_DMA_MCBSP1_TX     8
+# define OMAP_DMA_MCBSP1_RX     9
+# define OMAP_DMA_MCBSP3_TX     10
+# define OMAP_DMA_MCBSP3_RX     11
+# define OMAP_DMA_UART1_TX      12
+# define OMAP_DMA_UART1_RX      13
+# define OMAP_DMA_UART2_TX      14
+# define OMAP_DMA_UART2_RX      15
+# define OMAP_DMA_MCBSP2_TX     16
+# define OMAP_DMA_MCBSP2_RX     17
+# define OMAP_DMA_UART3_TX      18
+# define OMAP_DMA_UART3_RX      19
+# define OMAP_DMA_CAMERA_IF_RX      20
+# define OMAP_DMA_MMC_TX        21
+# define OMAP_DMA_MMC_RX        22
+# define OMAP_DMA_NAND          23  /* Not in OMAP310 */
+# define OMAP_DMA_IRQ_LCD_LINE      24  /* Not in OMAP310 */
+# define OMAP_DMA_MEMORY_STICK      25  /* Not in OMAP310 */
+# define OMAP_DMA_USB_W2FC_RX0      26
+# define OMAP_DMA_USB_W2FC_RX1      27
+# define OMAP_DMA_USB_W2FC_RX2      28
+# define OMAP_DMA_USB_W2FC_TX0      29
+# define OMAP_DMA_USB_W2FC_TX1      30
+# define OMAP_DMA_USB_W2FC_TX2      31
 
 /* These are only for 1610 */
-# define OMAP_DMA_CRYPTO_DES_IN		32
-# define OMAP_DMA_SPI_TX		33
-# define OMAP_DMA_SPI_RX		34
-# define OMAP_DMA_CRYPTO_HASH		35
-# define OMAP_DMA_CCP_ATTN		36
-# define OMAP_DMA_CCP_FIFO_NOT_EMPTY	37
-# define OMAP_DMA_CMT_APE_TX_CHAN_0	38
-# define OMAP_DMA_CMT_APE_RV_CHAN_0	39
-# define OMAP_DMA_CMT_APE_TX_CHAN_1	40
-# define OMAP_DMA_CMT_APE_RV_CHAN_1	41
-# define OMAP_DMA_CMT_APE_TX_CHAN_2	42
-# define OMAP_DMA_CMT_APE_RV_CHAN_2	43
-# define OMAP_DMA_CMT_APE_TX_CHAN_3	44
-# define OMAP_DMA_CMT_APE_RV_CHAN_3	45
-# define OMAP_DMA_CMT_APE_TX_CHAN_4	46
-# define OMAP_DMA_CMT_APE_RV_CHAN_4	47
-# define OMAP_DMA_CMT_APE_TX_CHAN_5	48
-# define OMAP_DMA_CMT_APE_RV_CHAN_5	49
-# define OMAP_DMA_CMT_APE_TX_CHAN_6	50
-# define OMAP_DMA_CMT_APE_RV_CHAN_6	51
-# define OMAP_DMA_CMT_APE_TX_CHAN_7	52
-# define OMAP_DMA_CMT_APE_RV_CHAN_7	53
-# define OMAP_DMA_MMC2_TX		54
-# define OMAP_DMA_MMC2_RX		55
-# define OMAP_DMA_CRYPTO_DES_OUT	56
+# define OMAP_DMA_CRYPTO_DES_IN     32
+# define OMAP_DMA_SPI_TX        33
+# define OMAP_DMA_SPI_RX        34
+# define OMAP_DMA_CRYPTO_HASH       35
+# define OMAP_DMA_CCP_ATTN      36
+# define OMAP_DMA_CCP_FIFO_NOT_EMPTY    37
+# define OMAP_DMA_CMT_APE_TX_CHAN_0 38
+# define OMAP_DMA_CMT_APE_RV_CHAN_0 39
+# define OMAP_DMA_CMT_APE_TX_CHAN_1 40
+# define OMAP_DMA_CMT_APE_RV_CHAN_1 41
+# define OMAP_DMA_CMT_APE_TX_CHAN_2 42
+# define OMAP_DMA_CMT_APE_RV_CHAN_2 43
+# define OMAP_DMA_CMT_APE_TX_CHAN_3 44
+# define OMAP_DMA_CMT_APE_RV_CHAN_3 45
+# define OMAP_DMA_CMT_APE_TX_CHAN_4 46
+# define OMAP_DMA_CMT_APE_RV_CHAN_4 47
+# define OMAP_DMA_CMT_APE_TX_CHAN_5 48
+# define OMAP_DMA_CMT_APE_RV_CHAN_5 49
+# define OMAP_DMA_CMT_APE_TX_CHAN_6 50
+# define OMAP_DMA_CMT_APE_RV_CHAN_6 51
+# define OMAP_DMA_CMT_APE_TX_CHAN_7 52
+# define OMAP_DMA_CMT_APE_RV_CHAN_7 53
+# define OMAP_DMA_MMC2_TX       54
+# define OMAP_DMA_MMC2_RX       55
+# define OMAP_DMA_CRYPTO_DES_OUT    56
 
 /*
  * DMA request numbers for the OMAP2
  */
-# define OMAP24XX_DMA_NO_DEVICE		0
-# define OMAP24XX_DMA_XTI_DMA		1	/* Not in OMAP2420 */
-# define OMAP24XX_DMA_EXT_DMAREQ0	2
-# define OMAP24XX_DMA_EXT_DMAREQ1	3
-# define OMAP24XX_DMA_GPMC		4
-# define OMAP24XX_DMA_GFX		5	/* Not in OMAP2420 */
-# define OMAP24XX_DMA_DSS		6
-# define OMAP24XX_DMA_VLYNQ_TX		7	/* Not in OMAP2420 */
-# define OMAP24XX_DMA_CWT		8	/* Not in OMAP2420 */
-# define OMAP24XX_DMA_AES_TX		9	/* Not in OMAP2420 */
-# define OMAP24XX_DMA_AES_RX		10	/* Not in OMAP2420 */
-# define OMAP24XX_DMA_DES_TX		11	/* Not in OMAP2420 */
-# define OMAP24XX_DMA_DES_RX		12	/* Not in OMAP2420 */
-# define OMAP24XX_DMA_SHA1MD5_RX	13	/* Not in OMAP2420 */
-# define OMAP24XX_DMA_EXT_DMAREQ2	14
-# define OMAP24XX_DMA_EXT_DMAREQ3	15
-# define OMAP24XX_DMA_EXT_DMAREQ4	16
-# define OMAP24XX_DMA_EAC_AC_RD		17
-# define OMAP24XX_DMA_EAC_AC_WR		18
-# define OMAP24XX_DMA_EAC_MD_UL_RD	19
-# define OMAP24XX_DMA_EAC_MD_UL_WR	20
-# define OMAP24XX_DMA_EAC_MD_DL_RD	21
-# define OMAP24XX_DMA_EAC_MD_DL_WR	22
-# define OMAP24XX_DMA_EAC_BT_UL_RD	23
-# define OMAP24XX_DMA_EAC_BT_UL_WR	24
-# define OMAP24XX_DMA_EAC_BT_DL_RD	25
-# define OMAP24XX_DMA_EAC_BT_DL_WR	26
-# define OMAP24XX_DMA_I2C1_TX		27
-# define OMAP24XX_DMA_I2C1_RX		28
-# define OMAP24XX_DMA_I2C2_TX		29
-# define OMAP24XX_DMA_I2C2_RX		30
-# define OMAP24XX_DMA_MCBSP1_TX		31
-# define OMAP24XX_DMA_MCBSP1_RX		32
-# define OMAP24XX_DMA_MCBSP2_TX		33
-# define OMAP24XX_DMA_MCBSP2_RX		34
-# define OMAP24XX_DMA_SPI1_TX0		35
-# define OMAP24XX_DMA_SPI1_RX0		36
-# define OMAP24XX_DMA_SPI1_TX1		37
-# define OMAP24XX_DMA_SPI1_RX1		38
-# define OMAP24XX_DMA_SPI1_TX2		39
-# define OMAP24XX_DMA_SPI1_RX2		40
-# define OMAP24XX_DMA_SPI1_TX3		41
-# define OMAP24XX_DMA_SPI1_RX3		42
-# define OMAP24XX_DMA_SPI2_TX0		43
-# define OMAP24XX_DMA_SPI2_RX0		44
-# define OMAP24XX_DMA_SPI2_TX1		45
-# define OMAP24XX_DMA_SPI2_RX1		46
-
-# define OMAP24XX_DMA_UART1_TX		49
-# define OMAP24XX_DMA_UART1_RX		50
-# define OMAP24XX_DMA_UART2_TX		51
-# define OMAP24XX_DMA_UART2_RX		52
-# define OMAP24XX_DMA_UART3_TX		53
-# define OMAP24XX_DMA_UART3_RX		54
-# define OMAP24XX_DMA_USB_W2FC_TX0	55
-# define OMAP24XX_DMA_USB_W2FC_RX0	56
-# define OMAP24XX_DMA_USB_W2FC_TX1	57
-# define OMAP24XX_DMA_USB_W2FC_RX1	58
-# define OMAP24XX_DMA_USB_W2FC_TX2	59
-# define OMAP24XX_DMA_USB_W2FC_RX2	60
-# define OMAP24XX_DMA_MMC1_TX		61
-# define OMAP24XX_DMA_MMC1_RX		62
-# define OMAP24XX_DMA_MS		63	/* Not in OMAP2420 */
-# define OMAP24XX_DMA_EXT_DMAREQ5	64
+# define OMAP24XX_DMA_NO_DEVICE     0
+# define OMAP24XX_DMA_XTI_DMA       1   /* Not in OMAP2420 */
+# define OMAP24XX_DMA_EXT_DMAREQ0   2
+# define OMAP24XX_DMA_EXT_DMAREQ1   3
+# define OMAP24XX_DMA_GPMC      4
+# define OMAP24XX_DMA_GFX       5   /* Not in OMAP2420 */
+# define OMAP24XX_DMA_DSS       6
+# define OMAP24XX_DMA_VLYNQ_TX      7   /* Not in OMAP2420 */
+# define OMAP24XX_DMA_CWT       8   /* Not in OMAP2420 */
+# define OMAP24XX_DMA_AES_TX        9   /* Not in OMAP2420 */
+# define OMAP24XX_DMA_AES_RX        10  /* Not in OMAP2420 */
+# define OMAP24XX_DMA_DES_TX        11  /* Not in OMAP2420 */
+# define OMAP24XX_DMA_DES_RX        12  /* Not in OMAP2420 */
+# define OMAP24XX_DMA_SHA1MD5_RX    13  /* Not in OMAP2420 */
+# define OMAP24XX_DMA_EXT_DMAREQ2   14
+# define OMAP24XX_DMA_EXT_DMAREQ3   15
+# define OMAP24XX_DMA_EXT_DMAREQ4   16
+# define OMAP24XX_DMA_EAC_AC_RD     17
+# define OMAP24XX_DMA_EAC_AC_WR     18
+# define OMAP24XX_DMA_EAC_MD_UL_RD  19
+# define OMAP24XX_DMA_EAC_MD_UL_WR  20
+# define OMAP24XX_DMA_EAC_MD_DL_RD  21
+# define OMAP24XX_DMA_EAC_MD_DL_WR  22
+# define OMAP24XX_DMA_EAC_BT_UL_RD  23
+# define OMAP24XX_DMA_EAC_BT_UL_WR  24
+# define OMAP24XX_DMA_EAC_BT_DL_RD  25
+# define OMAP24XX_DMA_EAC_BT_DL_WR  26
+# define OMAP24XX_DMA_I2C1_TX       27
+# define OMAP24XX_DMA_I2C1_RX       28
+# define OMAP24XX_DMA_I2C2_TX       29
+# define OMAP24XX_DMA_I2C2_RX       30
+# define OMAP24XX_DMA_MCBSP1_TX     31
+# define OMAP24XX_DMA_MCBSP1_RX     32
+# define OMAP24XX_DMA_MCBSP2_TX     33
+# define OMAP24XX_DMA_MCBSP2_RX     34
+# define OMAP24XX_DMA_SPI1_TX0      35
+# define OMAP24XX_DMA_SPI1_RX0      36
+# define OMAP24XX_DMA_SPI1_TX1      37
+# define OMAP24XX_DMA_SPI1_RX1      38
+# define OMAP24XX_DMA_SPI1_TX2      39
+# define OMAP24XX_DMA_SPI1_RX2      40
+# define OMAP24XX_DMA_SPI1_TX3      41
+# define OMAP24XX_DMA_SPI1_RX3      42
+# define OMAP24XX_DMA_SPI2_TX0      43
+# define OMAP24XX_DMA_SPI2_RX0      44
+# define OMAP24XX_DMA_SPI2_TX1      45
+# define OMAP24XX_DMA_SPI2_RX1      46
+
+# define OMAP24XX_DMA_UART1_TX      49
+# define OMAP24XX_DMA_UART1_RX      50
+# define OMAP24XX_DMA_UART2_TX      51
+# define OMAP24XX_DMA_UART2_RX      52
+# define OMAP24XX_DMA_UART3_TX      53
+# define OMAP24XX_DMA_UART3_RX      54
+# define OMAP24XX_DMA_USB_W2FC_TX0  55
+# define OMAP24XX_DMA_USB_W2FC_RX0  56
+# define OMAP24XX_DMA_USB_W2FC_TX1  57
+# define OMAP24XX_DMA_USB_W2FC_RX1  58
+# define OMAP24XX_DMA_USB_W2FC_TX2  59
+# define OMAP24XX_DMA_USB_W2FC_RX2  60
+# define OMAP24XX_DMA_MMC1_TX       61
+# define OMAP24XX_DMA_MMC1_RX       62
+# define OMAP24XX_DMA_MS        63  /* Not in OMAP2420 */
+# define OMAP24XX_DMA_EXT_DMAREQ5   64
 
 /* omap[123].c */
 /* OMAP2 gp timer */
@@ -816,26 +816,26 @@ void omap_mmc_enable(struct omap_mmc_s *s, int enable);
 /* omap_i2c.c */
 I2CBus *omap_i2c_bus(DeviceState *omap_i2c);
 
-# define cpu_is_omap310(cpu)		(cpu->mpu_model == omap310)
-# define cpu_is_omap1510(cpu)		(cpu->mpu_model == omap1510)
-# define cpu_is_omap1610(cpu)		(cpu->mpu_model == omap1610)
-# define cpu_is_omap1710(cpu)		(cpu->mpu_model == omap1710)
-# define cpu_is_omap2410(cpu)		(cpu->mpu_model == omap2410)
-# define cpu_is_omap2420(cpu)		(cpu->mpu_model == omap2420)
-# define cpu_is_omap2430(cpu)		(cpu->mpu_model == omap2430)
-# define cpu_is_omap3430(cpu)		(cpu->mpu_model == omap3430)
+# define cpu_is_omap310(cpu)        (cpu->mpu_model == omap310)
+# define cpu_is_omap1510(cpu)       (cpu->mpu_model == omap1510)
+# define cpu_is_omap1610(cpu)       (cpu->mpu_model == omap1610)
+# define cpu_is_omap1710(cpu)       (cpu->mpu_model == omap1710)
+# define cpu_is_omap2410(cpu)       (cpu->mpu_model == omap2410)
+# define cpu_is_omap2420(cpu)       (cpu->mpu_model == omap2420)
+# define cpu_is_omap2430(cpu)       (cpu->mpu_model == omap2430)
+# define cpu_is_omap3430(cpu)       (cpu->mpu_model == omap3430)
 # define cpu_is_omap3630(cpu)           (cpu->mpu_model == omap3630)
 
-# define cpu_is_omap15xx(cpu)		\
+# define cpu_is_omap15xx(cpu)       \
         (cpu_is_omap310(cpu) || cpu_is_omap1510(cpu))
-# define cpu_is_omap16xx(cpu)		\
+# define cpu_is_omap16xx(cpu)       \
         (cpu_is_omap1610(cpu) || cpu_is_omap1710(cpu))
-# define cpu_is_omap24xx(cpu)		\
+# define cpu_is_omap24xx(cpu)       \
         (cpu_is_omap2410(cpu) || cpu_is_omap2420(cpu) || cpu_is_omap2430(cpu))
 
-# define cpu_class_omap1(cpu)		\
+# define cpu_class_omap1(cpu)       \
         (cpu_is_omap15xx(cpu) || cpu_is_omap16xx(cpu))
-# define cpu_class_omap2(cpu)		cpu_is_omap24xx(cpu)
+# define cpu_class_omap2(cpu)       cpu_is_omap24xx(cpu)
 # define cpu_class_omap3(cpu) \
         (cpu_is_omap3430(cpu) || cpu_is_omap3630(cpu))
 
@@ -1000,42 +1000,42 @@ void omap_badwidth_write32(void *opaque, hwaddr addr,
 
 void omap_mpu_wakeup(void *opaque, int irq, int req);
 
-# define OMAP_BAD_REG(paddr)		\
+# define OMAP_BAD_REG(paddr)        \
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad register %#08"HWADDR_PRIx"\n", \
                       __func__, paddr)
-# define OMAP_RO_REG(paddr)		\
+# define OMAP_RO_REG(paddr)     \
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Read-only register %#08" \
                                        HWADDR_PRIx "\n", \
                       __func__, paddr)
 
 /* OMAP-specific Linux bootloader tags for the ATAG_BOARD area
    (Board-specifc tags are not here)  */
-#define OMAP_TAG_CLOCK		0x4f01
-#define OMAP_TAG_MMC		0x4f02
-#define OMAP_TAG_SERIAL_CONSOLE	0x4f03
-#define OMAP_TAG_USB		0x4f04
-#define OMAP_TAG_LCD		0x4f05
-#define OMAP_TAG_GPIO_SWITCH	0x4f06
-#define OMAP_TAG_UART		0x4f07
-#define OMAP_TAG_FBMEM		0x4f08
-#define OMAP_TAG_STI_CONSOLE	0x4f09
-#define OMAP_TAG_CAMERA_SENSOR	0x4f0a
-#define OMAP_TAG_PARTITION	0x4f0b
-#define OMAP_TAG_TEA5761	0x4f10
-#define OMAP_TAG_TMP105		0x4f11
-#define OMAP_TAG_BOOT_REASON	0x4f80
-#define OMAP_TAG_FLASH_PART_STR	0x4f81
-#define OMAP_TAG_VERSION_STR	0x4f82
+#define OMAP_TAG_CLOCK      0x4f01
+#define OMAP_TAG_MMC        0x4f02
+#define OMAP_TAG_SERIAL_CONSOLE 0x4f03
+#define OMAP_TAG_USB        0x4f04
+#define OMAP_TAG_LCD        0x4f05
+#define OMAP_TAG_GPIO_SWITCH    0x4f06
+#define OMAP_TAG_UART       0x4f07
+#define OMAP_TAG_FBMEM      0x4f08
+#define OMAP_TAG_STI_CONSOLE    0x4f09
+#define OMAP_TAG_CAMERA_SENSOR  0x4f0a
+#define OMAP_TAG_PARTITION  0x4f0b
+#define OMAP_TAG_TEA5761    0x4f10
+#define OMAP_TAG_TMP105     0x4f11
+#define OMAP_TAG_BOOT_REASON    0x4f80
+#define OMAP_TAG_FLASH_PART_STR 0x4f81
+#define OMAP_TAG_VERSION_STR    0x4f82
 
 enum {
-    OMAP_GPIOSW_TYPE_COVER	= 0 << 4,
-    OMAP_GPIOSW_TYPE_CONNECTION	= 1 << 4,
-    OMAP_GPIOSW_TYPE_ACTIVITY	= 2 << 4,
+    OMAP_GPIOSW_TYPE_COVER  = 0 << 4,
+    OMAP_GPIOSW_TYPE_CONNECTION = 1 << 4,
+    OMAP_GPIOSW_TYPE_ACTIVITY   = 2 << 4,
 };
 
-#define OMAP_GPIOSW_INVERTED	0x0001
-#define OMAP_GPIOSW_OUTPUT	0x0002
+#define OMAP_GPIOSW_INVERTED    0x0001
+#define OMAP_GPIOSW_OUTPUT  0x0002
 
-# define OMAP_MPUI_REG_MASK		0x000007ff
+# define OMAP_MPUI_REG_MASK     0x000007ff
 
 #endif
diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index 54eb895e42..db955396c3 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -16,57 +16,57 @@
 #include "qom/object.h"
 
 /* Interrupt numbers */
-# define PXA2XX_PIC_SSP3	0
-# define PXA2XX_PIC_USBH2	2
-# define PXA2XX_PIC_USBH1	3
-# define PXA2XX_PIC_KEYPAD	4
-# define PXA2XX_PIC_PWRI2C	6
-# define PXA25X_PIC_HWUART	7
-# define PXA27X_PIC_OST_4_11	7
-# define PXA2XX_PIC_GPIO_0	8
-# define PXA2XX_PIC_GPIO_1	9
-# define PXA2XX_PIC_GPIO_X	10
-# define PXA2XX_PIC_I2S 	13
-# define PXA26X_PIC_ASSP	15
-# define PXA25X_PIC_NSSP	16
-# define PXA27X_PIC_SSP2	16
-# define PXA2XX_PIC_LCD		17
-# define PXA2XX_PIC_I2C		18
-# define PXA2XX_PIC_ICP		19
-# define PXA2XX_PIC_STUART	20
-# define PXA2XX_PIC_BTUART	21
-# define PXA2XX_PIC_FFUART	22
-# define PXA2XX_PIC_MMC		23
-# define PXA2XX_PIC_SSP		24
-# define PXA2XX_PIC_DMA		25
-# define PXA2XX_PIC_OST_0	26
-# define PXA2XX_PIC_RTC1HZ	30
-# define PXA2XX_PIC_RTCALARM	31
+# define PXA2XX_PIC_SSP3    0
+# define PXA2XX_PIC_USBH2   2
+# define PXA2XX_PIC_USBH1   3
+# define PXA2XX_PIC_KEYPAD  4
+# define PXA2XX_PIC_PWRI2C  6
+# define PXA25X_PIC_HWUART  7
+# define PXA27X_PIC_OST_4_11    7
+# define PXA2XX_PIC_GPIO_0  8
+# define PXA2XX_PIC_GPIO_1  9
+# define PXA2XX_PIC_GPIO_X  10
+# define PXA2XX_PIC_I2S     13
+# define PXA26X_PIC_ASSP    15
+# define PXA25X_PIC_NSSP    16
+# define PXA27X_PIC_SSP2    16
+# define PXA2XX_PIC_LCD     17
+# define PXA2XX_PIC_I2C     18
+# define PXA2XX_PIC_ICP     19
+# define PXA2XX_PIC_STUART  20
+# define PXA2XX_PIC_BTUART  21
+# define PXA2XX_PIC_FFUART  22
+# define PXA2XX_PIC_MMC     23
+# define PXA2XX_PIC_SSP     24
+# define PXA2XX_PIC_DMA     25
+# define PXA2XX_PIC_OST_0   26
+# define PXA2XX_PIC_RTC1HZ  30
+# define PXA2XX_PIC_RTCALARM    31
 
 /* DMA requests */
-# define PXA2XX_RX_RQ_I2S	2
-# define PXA2XX_TX_RQ_I2S	3
-# define PXA2XX_RX_RQ_BTUART	4
-# define PXA2XX_TX_RQ_BTUART	5
-# define PXA2XX_RX_RQ_FFUART	6
-# define PXA2XX_TX_RQ_FFUART	7
-# define PXA2XX_RX_RQ_SSP1	13
-# define PXA2XX_TX_RQ_SSP1	14
-# define PXA2XX_RX_RQ_SSP2	15
-# define PXA2XX_TX_RQ_SSP2	16
-# define PXA2XX_RX_RQ_ICP	17
-# define PXA2XX_TX_RQ_ICP	18
-# define PXA2XX_RX_RQ_STUART	19
-# define PXA2XX_TX_RQ_STUART	20
-# define PXA2XX_RX_RQ_MMCI	21
-# define PXA2XX_TX_RQ_MMCI	22
-# define PXA2XX_USB_RQ(x)	((x) + 24)
-# define PXA2XX_RX_RQ_SSP3	66
-# define PXA2XX_TX_RQ_SSP3	67
-
-# define PXA2XX_SDRAM_BASE	0xa0000000
-# define PXA2XX_INTERNAL_BASE	0x5c000000
-# define PXA2XX_INTERNAL_SIZE	0x40000
+# define PXA2XX_RX_RQ_I2S   2
+# define PXA2XX_TX_RQ_I2S   3
+# define PXA2XX_RX_RQ_BTUART    4
+# define PXA2XX_TX_RQ_BTUART    5
+# define PXA2XX_RX_RQ_FFUART    6
+# define PXA2XX_TX_RQ_FFUART    7
+# define PXA2XX_RX_RQ_SSP1  13
+# define PXA2XX_TX_RQ_SSP1  14
+# define PXA2XX_RX_RQ_SSP2  15
+# define PXA2XX_TX_RQ_SSP2  16
+# define PXA2XX_RX_RQ_ICP   17
+# define PXA2XX_TX_RQ_ICP   18
+# define PXA2XX_RX_RQ_STUART    19
+# define PXA2XX_TX_RQ_STUART    20
+# define PXA2XX_RX_RQ_MMCI  21
+# define PXA2XX_TX_RQ_MMCI  22
+# define PXA2XX_USB_RQ(x)   ((x) + 24)
+# define PXA2XX_RX_RQ_SSP3  66
+# define PXA2XX_TX_RQ_SSP3  67
+
+# define PXA2XX_SDRAM_BASE  0xa0000000
+# define PXA2XX_INTERNAL_BASE   0x5c000000
+# define PXA2XX_INTERNAL_SIZE   0x40000
 
 /* pxa2xx_pic.c */
 DeviceState *pxa2xx_pic_init(hwaddr base, ARMCPU *cpu);
@@ -191,7 +191,7 @@ struct PXA2xxI2SState {
     uint32_t fifo[16];
 };
 
-# define PA_FMT			"0x%08lx"
+# define PA_FMT         "0x%08lx"
 
 PXA2xxState *pxa270_init(unsigned int sdram_size, const char *revision);
 PXA2xxState *pxa255_init(unsigned int sdram_size);
diff --git a/include/hw/arm/sharpsl.h b/include/hw/arm/sharpsl.h
index e986b28c52..1e3992fcd0 100644
--- a/include/hw/arm/sharpsl.h
+++ b/include/hw/arm/sharpsl.h
@@ -11,7 +11,7 @@
 
 /* zaurus.c */
 
-#define SL_PXA_PARAM_BASE	0xa0000a00
+#define SL_PXA_PARAM_BASE   0xa0000a00
 void sl_bootparam_write(hwaddr ptr);
 
 #endif
diff --git a/include/hw/arm/soc_dma.h b/include/hw/arm/soc_dma.h
index e93a7499a8..bcdb91425a 100644
--- a/include/hw/arm/soc_dma.h
+++ b/include/hw/arm/soc_dma.h
@@ -54,7 +54,7 @@ struct soc_dma_ch_s {
     int bytes;
     /* Initialised by the DMA module, call soc_dma_ch_update after writing.  */
     enum soc_dma_access_type type[2];
-    hwaddr vaddr[2];	/* Updated by .transfer_fn().  */
+    hwaddr vaddr[2];    /* Updated by .transfer_fn().  */
     /* Private */
     void *paddr[2];
     soc_dma_io_t io_fn[2];
@@ -70,7 +70,7 @@ struct soc_dma_ch_s {
 struct soc_dma_s {
     /* Following fields are set by the SoC DMA module and can be used
      * by anybody.  */
-    uint64_t drqbmp;	/* Is zeroed by soc_dma_reset() */
+    uint64_t drqbmp;    /* Is zeroed by soc_dma_reset() */
     qemu_irq *drq;
     void *opaque;
     int64_t freq;
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index def2a189e6..013437393a 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -87,8 +87,8 @@ extern bool use_neon_instructions;
 #endif
 
 /* used for function call generation */
-#define TCG_TARGET_STACK_ALIGN		8
-#define TCG_TARGET_CALL_STACK_OFFSET	0
+#define TCG_TARGET_STACK_ALIGN      8
+#define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_EVEN
 #define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
-- 
2.34.1


