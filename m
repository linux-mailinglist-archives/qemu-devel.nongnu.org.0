Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE21A607EB3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 21:09:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxLe-0002Bj-Ju; Fri, 21 Oct 2022 15:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amarjargal16@gmail.com>)
 id 1olvN8-00044u-5h
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:59:50 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <amarjargal16@gmail.com>)
 id 1olvN1-0001hK-7P
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:59:49 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bu30so5903539wrb.8
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 09:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1r4k6FFfN1HCedfuW/oZH4cZL858jr/u+cigmm3535Q=;
 b=Oeu4dBB6yoFbTJK3Bhwb9Hoh7NEtJK9kvuxWkr3T5G6Wy8/FII5O3iWb92ONHZEQad
 46CWZ+Lr8G6sSXrICH0dZY+UV7TU1/HI4tA7Uxp6NL63/wj42mNLhKoGeunDdO2sq0VC
 K60vyUUiCV+ebRUrwGv7VTsHf2cL0rtziYfB9BapKQPPMGRFurseIfI0R4+cEBeLyf7b
 5LssZl3C1fGuySrqBOSbkB9cgxTGPw4POlQ3kvftqJeXcg7VYpjbcqdI+QqyH2ClG1rW
 d+aV04iA//t34n9sCysH+SZGycx1QtlWWgaSLQ0SXP9YCqeT0yB1C64zzGWr7HAGApDh
 Lp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1r4k6FFfN1HCedfuW/oZH4cZL858jr/u+cigmm3535Q=;
 b=znmGJsUDCwPjuhDZ5BxHM10o99h0UtMl5SOHdw+OXmJxyyD/kTrM2H07spDnulq1CO
 EZ+Y1nDw0XfgNvv+Oj8PULQ3ctj7yMP5bK630rTAvpYXcIhbFdoi8lK13NH5Oq4aocZb
 3q87eCSW64QqIRuR6ElELVpvB+Br0zIhHRiX/7/bbx9i7QbfeodoyjkA5sLrHpTMCS1/
 dXc6XrJkd/WVbLRQ7D2VBZyV/NlvE94VohjMtbC6RmfXvMe03szoVe3TP0+APuru94q3
 ARpNME/Rn8fYg5QV+TGnlzhYn62LQDbvaZn7p2TTpaLe/wJpqvOIWWzFYPZDW3ZSDsOm
 6hlw==
X-Gm-Message-State: ACrzQf2yk/m0jFkKowIyI6eejYK4fePn4O59g77NTC2Q46JynzX/WuAO
 u5TUxNGdkNrtRy23RxTRbezTgPuqWaBLdXTC
X-Google-Smtp-Source: AMsMyM6f5qhhoS6O+6HBl1RiRyXrGqigRb1xhmgNS82rbD8jomt1qZzOBcCLj9DTJ1jaiH+QSQcGnw==
X-Received: by 2002:a05:6000:c9:b0:22e:4055:559c with SMTP id
 q9-20020a05600000c900b0022e4055559cmr13221979wrx.438.1666371569025; 
 Fri, 21 Oct 2022 09:59:29 -0700 (PDT)
Received: from localhost.localdomain ([202.21.109.40])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b003b4cba4ef71sm94903wmo.41.2022.10.21.09.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:59:28 -0700 (PDT)
From: Amarjargal Gundjalam <amarjargal16@gmail.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, berrange@redhat.com, thuth@redhat.com,
 Amarjargal Gundjalam <amarjargal16@gmail.com>
Subject: [PATCH v3 3/4] hw/display: fix tab indentation
Date: Sat, 22 Oct 2022 00:59:07 +0800
Message-Id: <01faf3f21ef91724d9f744dd68f59a8114c26a35.1666371096.git.amarjargal16@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666371095.git.amarjargal16@gmail.com>
References: <cover.1666371095.git.amarjargal16@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=amarjargal16@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

The TABs should be replaced with spaces, to make sure that we have a
consistent coding style with an indentation of 4 spaces everywhere.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/370
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Signed-off-by: Amarjargal Gundjalam <amarjargal16@gmail.com>
---
 hw/display/blizzard.c   |  352 ++++-----
 hw/display/cirrus_vga.c | 1602 +++++++++++++++++++--------------------
 hw/display/omap_dss.c   |  598 +++++++--------
 hw/display/omap_lcdc.c  |   24 +-
 hw/display/pxa2xx_lcd.c |  196 ++---
 hw/display/tc6393xb.c   |   74 +-
 hw/display/vga.c        |    6 +-
 hw/display/vga_regs.h   |    6 +-
 hw/display/xenfb.c      |  260 +++----
 9 files changed, 1559 insertions(+), 1559 deletions(-)

diff --git a/hw/display/blizzard.c b/hw/display/blizzard.c
index 105241577d..ee847559db 100644
--- a/hw/display/blizzard.c
+++ b/hw/display/blizzard.c
@@ -123,14 +123,14 @@ typedef struct {
 /* Bytes(!) per pixel */
 static const int blizzard_iformat_bpp[0x10] = {
     0,
-    2,	/* RGB 5:6:5*/
-    3,	/* RGB 6:6:6 mode 1 */
-    3,	/* RGB 8:8:8 mode 1 */
+    2,    /* RGB 5:6:5*/
+    3,    /* RGB 6:6:6 mode 1 */
+    3,    /* RGB 8:8:8 mode 1 */
     0, 0,
-    4,	/* RGB 6:6:6 mode 2 */
-    4,	/* RGB 8:8:8 mode 2 */
-    0,	/* YUV 4:2:2 */
-    0,	/* YUV 4:2:0 */
+    4,    /* RGB 6:6:6 mode 2 */
+    4,    /* RGB 8:8:8 mode 2 */
+    0,    /* YUV 4:2:2 */
+    0,    /* YUV 4:2:0 */
     0, 0, 0, 0, 0, 0,
 };
 
@@ -281,196 +281,196 @@ static uint16_t blizzard_reg_read(void *opaque, uint8_t reg)
     BlizzardState *s = (BlizzardState *) opaque;
 
     switch (reg) {
-    case 0x00:	/* Revision Code */
+    case 0x00:    /* Revision Code */
         return 0xa5;
 
-    case 0x02:	/* Configuration Readback */
-        return 0x83;	/* Macrovision OK, CNF[2:0] = 3 */
+    case 0x02:    /* Configuration Readback */
+        return 0x83;    /* Macrovision OK, CNF[2:0] = 3 */
 
-    case 0x04:	/* PLL M-Divider */
+    case 0x04:    /* PLL M-Divider */
         return (s->pll - 1) | (1 << 7);
-    case 0x06:	/* PLL Lock Range Control */
+    case 0x06:    /* PLL Lock Range Control */
         return s->pll_range;
-    case 0x08:	/* PLL Lock Synthesis Control 0 */
+    case 0x08:    /* PLL Lock Synthesis Control 0 */
         return s->pll_ctrl & 0xff;
-    case 0x0a:	/* PLL Lock Synthesis Control 1 */
+    case 0x0a:    /* PLL Lock Synthesis Control 1 */
         return s->pll_ctrl >> 8;
-    case 0x0c:	/* PLL Mode Control 0 */
+    case 0x0c:    /* PLL Mode Control 0 */
         return s->pll_mode;
 
-    case 0x0e:	/* Clock-Source Select */
+    case 0x0e:    /* Clock-Source Select */
         return s->clksel;
 
-    case 0x10:	/* Memory Controller Activate */
-    case 0x14:	/* Memory Controller Bank 0 Status Flag */
+    case 0x10:    /* Memory Controller Activate */
+    case 0x14:    /* Memory Controller Bank 0 Status Flag */
         return s->memenable;
 
-    case 0x18:	/* Auto-Refresh Interval Setting 0 */
+    case 0x18:    /* Auto-Refresh Interval Setting 0 */
         return s->memrefresh & 0xff;
-    case 0x1a:	/* Auto-Refresh Interval Setting 1 */
+    case 0x1a:    /* Auto-Refresh Interval Setting 1 */
         return s->memrefresh >> 8;
 
-    case 0x1c:	/* Power-On Sequence Timing Control */
+    case 0x1c:    /* Power-On Sequence Timing Control */
         return s->timing[0];
-    case 0x1e:	/* Timing Control 0 */
+    case 0x1e:    /* Timing Control 0 */
         return s->timing[1];
-    case 0x20:	/* Timing Control 1 */
+    case 0x20:    /* Timing Control 1 */
         return s->timing[2];
 
-    case 0x24:	/* Arbitration Priority Control */
+    case 0x24:    /* Arbitration Priority Control */
         return s->priority;
 
-    case 0x28:	/* LCD Panel Configuration */
+    case 0x28:    /* LCD Panel Configuration */
         return s->lcd_config;
 
-    case 0x2a:	/* LCD Horizontal Display Width */
+    case 0x2a:    /* LCD Horizontal Display Width */
         return s->x >> 3;
-    case 0x2c:	/* LCD Horizontal Non-display Period */
+    case 0x2c:    /* LCD Horizontal Non-display Period */
         return s->hndp;
-    case 0x2e:	/* LCD Vertical Display Height 0 */
+    case 0x2e:    /* LCD Vertical Display Height 0 */
         return s->y & 0xff;
-    case 0x30:	/* LCD Vertical Display Height 1 */
+    case 0x30:    /* LCD Vertical Display Height 1 */
         return s->y >> 8;
-    case 0x32:	/* LCD Vertical Non-display Period */
+    case 0x32:    /* LCD Vertical Non-display Period */
         return s->vndp;
-    case 0x34:	/* LCD HS Pulse-width */
+    case 0x34:    /* LCD HS Pulse-width */
         return s->hsync;
-    case 0x36:	/* LCd HS Pulse Start Position */
+    case 0x36:    /* LCd HS Pulse Start Position */
         return s->skipx >> 3;
-    case 0x38:	/* LCD VS Pulse-width */
+    case 0x38:    /* LCD VS Pulse-width */
         return s->vsync;
-    case 0x3a:	/* LCD VS Pulse Start Position */
+    case 0x3a:    /* LCD VS Pulse Start Position */
         return s->skipy;
 
-    case 0x3c:	/* PCLK Polarity */
+    case 0x3c:    /* PCLK Polarity */
         return s->pclk;
 
-    case 0x3e:	/* High-speed Serial Interface Tx Configuration Port 0 */
+    case 0x3e:    /* High-speed Serial Interface Tx Configuration Port 0 */
         return s->hssi_config[0];
-    case 0x40:	/* High-speed Serial Interface Tx Configuration Port 1 */
+    case 0x40:    /* High-speed Serial Interface Tx Configuration Port 1 */
         return s->hssi_config[1];
-    case 0x42:	/* High-speed Serial Interface Tx Mode */
+    case 0x42:    /* High-speed Serial Interface Tx Mode */
         return s->hssi_config[2];
-    case 0x44:	/* TV Display Configuration */
+    case 0x44:    /* TV Display Configuration */
         return s->tv_config;
-    case 0x46 ... 0x4c:	/* TV Vertical Blanking Interval Data bits */
+    case 0x46 ... 0x4c:    /* TV Vertical Blanking Interval Data bits */
         return s->tv_timing[(reg - 0x46) >> 1];
-    case 0x4e:	/* VBI: Closed Caption / XDS Control / Status */
+    case 0x4e:    /* VBI: Closed Caption / XDS Control / Status */
         return s->vbi;
-    case 0x50:	/* TV Horizontal Start Position */
+    case 0x50:    /* TV Horizontal Start Position */
         return s->tv_x;
-    case 0x52:	/* TV Vertical Start Position */
+    case 0x52:    /* TV Vertical Start Position */
         return s->tv_y;
-    case 0x54:	/* TV Test Pattern Setting */
+    case 0x54:    /* TV Test Pattern Setting */
         return s->tv_test;
-    case 0x56:	/* TV Filter Setting */
+    case 0x56:    /* TV Filter Setting */
         return s->tv_filter_config;
-    case 0x58:	/* TV Filter Coefficient Index */
+    case 0x58:    /* TV Filter Coefficient Index */
         return s->tv_filter_idx;
-    case 0x5a:	/* TV Filter Coefficient Data */
+    case 0x5a:    /* TV Filter Coefficient Data */
         if (s->tv_filter_idx < 0x20)
             return s->tv_filter_coeff[s->tv_filter_idx ++];
         return 0;
 
-    case 0x60:	/* Input YUV/RGB Translate Mode 0 */
+    case 0x60:    /* Input YUV/RGB Translate Mode 0 */
         return s->yrc[0];
-    case 0x62:	/* Input YUV/RGB Translate Mode 1 */
+    case 0x62:    /* Input YUV/RGB Translate Mode 1 */
         return s->yrc[1];
-    case 0x64:	/* U Data Fix */
+    case 0x64:    /* U Data Fix */
         return s->u;
-    case 0x66:	/* V Data Fix */
+    case 0x66:    /* V Data Fix */
         return s->v;
 
-    case 0x68:	/* Display Mode */
+    case 0x68:    /* Display Mode */
         return s->mode;
 
-    case 0x6a:	/* Special Effects */
+    case 0x6a:    /* Special Effects */
         return s->effect;
 
-    case 0x6c:	/* Input Window X Start Position 0 */
+    case 0x6c:    /* Input Window X Start Position 0 */
         return s->ix[0] & 0xff;
-    case 0x6e:	/* Input Window X Start Position 1 */
+    case 0x6e:    /* Input Window X Start Position 1 */
         return s->ix[0] >> 3;
-    case 0x70:	/* Input Window Y Start Position 0 */
+    case 0x70:    /* Input Window Y Start Position 0 */
         return s->ix[0] & 0xff;
-    case 0x72:	/* Input Window Y Start Position 1 */
+    case 0x72:    /* Input Window Y Start Position 1 */
         return s->ix[0] >> 3;
-    case 0x74:	/* Input Window X End Position 0 */
+    case 0x74:    /* Input Window X End Position 0 */
         return s->ix[1] & 0xff;
-    case 0x76:	/* Input Window X End Position 1 */
+    case 0x76:    /* Input Window X End Position 1 */
         return s->ix[1] >> 3;
-    case 0x78:	/* Input Window Y End Position 0 */
+    case 0x78:    /* Input Window Y End Position 0 */
         return s->ix[1] & 0xff;
-    case 0x7a:	/* Input Window Y End Position 1 */
+    case 0x7a:    /* Input Window Y End Position 1 */
         return s->ix[1] >> 3;
-    case 0x7c:	/* Output Window X Start Position 0 */
+    case 0x7c:    /* Output Window X Start Position 0 */
         return s->ox[0] & 0xff;
-    case 0x7e:	/* Output Window X Start Position 1 */
+    case 0x7e:    /* Output Window X Start Position 1 */
         return s->ox[0] >> 3;
-    case 0x80:	/* Output Window Y Start Position 0 */
+    case 0x80:    /* Output Window Y Start Position 0 */
         return s->oy[0] & 0xff;
-    case 0x82:	/* Output Window Y Start Position 1 */
+    case 0x82:    /* Output Window Y Start Position 1 */
         return s->oy[0] >> 3;
-    case 0x84:	/* Output Window X End Position 0 */
+    case 0x84:    /* Output Window X End Position 0 */
         return s->ox[1] & 0xff;
-    case 0x86:	/* Output Window X End Position 1 */
+    case 0x86:    /* Output Window X End Position 1 */
         return s->ox[1] >> 3;
-    case 0x88:	/* Output Window Y End Position 0 */
+    case 0x88:    /* Output Window Y End Position 0 */
         return s->oy[1] & 0xff;
-    case 0x8a:	/* Output Window Y End Position 1 */
+    case 0x8a:    /* Output Window Y End Position 1 */
         return s->oy[1] >> 3;
 
-    case 0x8c:	/* Input Data Format */
+    case 0x8c:    /* Input Data Format */
         return s->iformat;
-    case 0x8e:	/* Data Source Select */
+    case 0x8e:    /* Data Source Select */
         return s->source;
-    case 0x90:	/* Display Memory Data Port */
+    case 0x90:    /* Display Memory Data Port */
         return 0;
 
-    case 0xa8:	/* Border Color 0 */
+    case 0xa8:    /* Border Color 0 */
         return s->border_r;
-    case 0xaa:	/* Border Color 1 */
+    case 0xaa:    /* Border Color 1 */
         return s->border_g;
-    case 0xac:	/* Border Color 2 */
+    case 0xac:    /* Border Color 2 */
         return s->border_b;
 
-    case 0xb4:	/* Gamma Correction Enable */
+    case 0xb4:    /* Gamma Correction Enable */
         return s->gamma_config;
-    case 0xb6:	/* Gamma Correction Table Index */
+    case 0xb6:    /* Gamma Correction Table Index */
         return s->gamma_idx;
-    case 0xb8:	/* Gamma Correction Table Data */
+    case 0xb8:    /* Gamma Correction Table Data */
         return s->gamma_lut[s->gamma_idx ++];
 
-    case 0xba:	/* 3x3 Matrix Enable */
+    case 0xba:    /* 3x3 Matrix Enable */
         return s->matrix_ena;
-    case 0xbc ... 0xde:	/* Coefficient Registers */
+    case 0xbc ... 0xde:    /* Coefficient Registers */
         return s->matrix_coeff[(reg - 0xbc) >> 1];
-    case 0xe0:	/* 3x3 Matrix Red Offset */
+    case 0xe0:    /* 3x3 Matrix Red Offset */
         return s->matrix_r;
-    case 0xe2:	/* 3x3 Matrix Green Offset */
+    case 0xe2:    /* 3x3 Matrix Green Offset */
         return s->matrix_g;
-    case 0xe4:	/* 3x3 Matrix Blue Offset */
+    case 0xe4:    /* 3x3 Matrix Blue Offset */
         return s->matrix_b;
 
-    case 0xe6:	/* Power-save */
+    case 0xe6:    /* Power-save */
         return s->pm;
-    case 0xe8:	/* Non-display Period Control / Status */
+    case 0xe8:    /* Non-display Period Control / Status */
         return s->status | (1 << 5);
-    case 0xea:	/* RGB Interface Control */
+    case 0xea:    /* RGB Interface Control */
         return s->rgbgpio_dir;
-    case 0xec:	/* RGB Interface Status */
+    case 0xec:    /* RGB Interface Status */
         return s->rgbgpio;
-    case 0xee:	/* General-purpose IO Pins Configuration */
+    case 0xee:    /* General-purpose IO Pins Configuration */
         return s->gpio_dir;
-    case 0xf0:	/* General-purpose IO Pins Status / Control */
+    case 0xf0:    /* General-purpose IO Pins Status / Control */
         return s->gpio;
-    case 0xf2:	/* GPIO Positive Edge Interrupt Trigger */
+    case 0xf2:    /* GPIO Positive Edge Interrupt Trigger */
         return s->gpio_edge[0];
-    case 0xf4:	/* GPIO Negative Edge Interrupt Trigger */
+    case 0xf4:    /* GPIO Negative Edge Interrupt Trigger */
         return s->gpio_edge[1];
-    case 0xf6:	/* GPIO Interrupt Status */
+    case 0xf6:    /* GPIO Interrupt Status */
         return s->gpio_irq;
-    case 0xf8:	/* GPIO Pull-down Control */
+    case 0xf8:    /* GPIO Pull-down Control */
         return s->gpio_pdown;
 
     default:
@@ -484,157 +484,157 @@ static void blizzard_reg_write(void *opaque, uint8_t reg, uint16_t value)
     BlizzardState *s = (BlizzardState *) opaque;
 
     switch (reg) {
-    case 0x04:	/* PLL M-Divider */
+    case 0x04:    /* PLL M-Divider */
         s->pll = (value & 0x3f) + 1;
         break;
-    case 0x06:	/* PLL Lock Range Control */
+    case 0x06:    /* PLL Lock Range Control */
         s->pll_range = value & 3;
         break;
-    case 0x08:	/* PLL Lock Synthesis Control 0 */
+    case 0x08:    /* PLL Lock Synthesis Control 0 */
         s->pll_ctrl &= 0xf00;
         s->pll_ctrl |= (value << 0) & 0x0ff;
         break;
-    case 0x0a:	/* PLL Lock Synthesis Control 1 */
+    case 0x0a:    /* PLL Lock Synthesis Control 1 */
         s->pll_ctrl &= 0x0ff;
         s->pll_ctrl |= (value << 8) & 0xf00;
         break;
-    case 0x0c:	/* PLL Mode Control 0 */
+    case 0x0c:    /* PLL Mode Control 0 */
         s->pll_mode = value & 0x77;
         if ((value & 3) == 0 || (value & 3) == 3)
             fprintf(stderr, "%s: wrong PLL Control bits (%i)\n",
                     __func__, value & 3);
         break;
 
-    case 0x0e:	/* Clock-Source Select */
+    case 0x0e:    /* Clock-Source Select */
         s->clksel = value & 0xff;
         break;
 
-    case 0x10:	/* Memory Controller Activate */
+    case 0x10:    /* Memory Controller Activate */
         s->memenable = value & 1;
         break;
-    case 0x14:	/* Memory Controller Bank 0 Status Flag */
+    case 0x14:    /* Memory Controller Bank 0 Status Flag */
         break;
 
-    case 0x18:	/* Auto-Refresh Interval Setting 0 */
+    case 0x18:    /* Auto-Refresh Interval Setting 0 */
         s->memrefresh &= 0xf00;
         s->memrefresh |= (value << 0) & 0x0ff;
         break;
-    case 0x1a:	/* Auto-Refresh Interval Setting 1 */
+    case 0x1a:    /* Auto-Refresh Interval Setting 1 */
         s->memrefresh &= 0x0ff;
         s->memrefresh |= (value << 8) & 0xf00;
         break;
 
-    case 0x1c:	/* Power-On Sequence Timing Control */
+    case 0x1c:    /* Power-On Sequence Timing Control */
         s->timing[0] = value & 0x7f;
         break;
-    case 0x1e:	/* Timing Control 0 */
+    case 0x1e:    /* Timing Control 0 */
         s->timing[1] = value & 0x17;
         break;
-    case 0x20:	/* Timing Control 1 */
+    case 0x20:    /* Timing Control 1 */
         s->timing[2] = value & 0x35;
         break;
 
-    case 0x24:	/* Arbitration Priority Control */
+    case 0x24:    /* Arbitration Priority Control */
         s->priority = value & 1;
         break;
 
-    case 0x28:	/* LCD Panel Configuration */
+    case 0x28:    /* LCD Panel Configuration */
         s->lcd_config = value & 0xff;
         if (value & (1 << 7))
             fprintf(stderr, "%s: data swap not supported!\n", __func__);
         break;
 
-    case 0x2a:	/* LCD Horizontal Display Width */
+    case 0x2a:    /* LCD Horizontal Display Width */
         s->x = value << 3;
         break;
-    case 0x2c:	/* LCD Horizontal Non-display Period */
+    case 0x2c:    /* LCD Horizontal Non-display Period */
         s->hndp = value & 0xff;
         break;
-    case 0x2e:	/* LCD Vertical Display Height 0 */
+    case 0x2e:    /* LCD Vertical Display Height 0 */
         s->y &= 0x300;
         s->y |= (value << 0) & 0x0ff;
         break;
-    case 0x30:	/* LCD Vertical Display Height 1 */
+    case 0x30:    /* LCD Vertical Display Height 1 */
         s->y &= 0x0ff;
         s->y |= (value << 8) & 0x300;
         break;
-    case 0x32:	/* LCD Vertical Non-display Period */
+    case 0x32:    /* LCD Vertical Non-display Period */
         s->vndp = value & 0xff;
         break;
-    case 0x34:	/* LCD HS Pulse-width */
+    case 0x34:    /* LCD HS Pulse-width */
         s->hsync = value & 0xff;
         break;
-    case 0x36:	/* LCD HS Pulse Start Position */
+    case 0x36:    /* LCD HS Pulse Start Position */
         s->skipx = value & 0xff;
         break;
-    case 0x38:	/* LCD VS Pulse-width */
+    case 0x38:    /* LCD VS Pulse-width */
         s->vsync = value & 0xbf;
         break;
-    case 0x3a:	/* LCD VS Pulse Start Position */
+    case 0x3a:    /* LCD VS Pulse Start Position */
         s->skipy = value & 0xff;
         break;
 
-    case 0x3c:	/* PCLK Polarity */
+    case 0x3c:    /* PCLK Polarity */
         s->pclk = value & 0x82;
         /* Affects calculation of s->hndp, s->hsync and s->skipx.  */
         break;
 
-    case 0x3e:	/* High-speed Serial Interface Tx Configuration Port 0 */
+    case 0x3e:    /* High-speed Serial Interface Tx Configuration Port 0 */
         s->hssi_config[0] = value;
         break;
-    case 0x40:	/* High-speed Serial Interface Tx Configuration Port 1 */
+    case 0x40:    /* High-speed Serial Interface Tx Configuration Port 1 */
         s->hssi_config[1] = value;
         if (((value >> 4) & 3) == 3)
             fprintf(stderr, "%s: Illegal active-data-links value\n",
                             __func__);
         break;
-    case 0x42:	/* High-speed Serial Interface Tx Mode */
+    case 0x42:    /* High-speed Serial Interface Tx Mode */
         s->hssi_config[2] = value & 0xbd;
         break;
 
-    case 0x44:	/* TV Display Configuration */
+    case 0x44:    /* TV Display Configuration */
         s->tv_config = value & 0xfe;
         break;
-    case 0x46 ... 0x4c:	/* TV Vertical Blanking Interval Data bits 0 */
+    case 0x46 ... 0x4c:    /* TV Vertical Blanking Interval Data bits 0 */
         s->tv_timing[(reg - 0x46) >> 1] = value;
         break;
-    case 0x4e:	/* VBI: Closed Caption / XDS Control / Status */
+    case 0x4e:    /* VBI: Closed Caption / XDS Control / Status */
         s->vbi = value;
         break;
-    case 0x50:	/* TV Horizontal Start Position */
+    case 0x50:    /* TV Horizontal Start Position */
         s->tv_x = value;
         break;
-    case 0x52:	/* TV Vertical Start Position */
+    case 0x52:    /* TV Vertical Start Position */
         s->tv_y = value & 0x7f;
         break;
-    case 0x54:	/* TV Test Pattern Setting */
+    case 0x54:    /* TV Test Pattern Setting */
         s->tv_test = value;
         break;
-    case 0x56:	/* TV Filter Setting */
+    case 0x56:    /* TV Filter Setting */
         s->tv_filter_config = value & 0xbf;
         break;
-    case 0x58:	/* TV Filter Coefficient Index */
+    case 0x58:    /* TV Filter Coefficient Index */
         s->tv_filter_idx = value & 0x1f;
         break;
-    case 0x5a:	/* TV Filter Coefficient Data */
+    case 0x5a:    /* TV Filter Coefficient Data */
         if (s->tv_filter_idx < 0x20)
             s->tv_filter_coeff[s->tv_filter_idx ++] = value;
         break;
 
-    case 0x60:	/* Input YUV/RGB Translate Mode 0 */
+    case 0x60:    /* Input YUV/RGB Translate Mode 0 */
         s->yrc[0] = value & 0xb0;
         break;
-    case 0x62:	/* Input YUV/RGB Translate Mode 1 */
+    case 0x62:    /* Input YUV/RGB Translate Mode 1 */
         s->yrc[1] = value & 0x30;
         break;
-    case 0x64:	/* U Data Fix */
+    case 0x64:    /* U Data Fix */
         s->u = value & 0xff;
         break;
-    case 0x66:	/* V Data Fix */
+    case 0x66:    /* V Data Fix */
         s->v = value & 0xff;
         break;
 
-    case 0x68:	/* Display Mode */
+    case 0x68:    /* Display Mode */
         if ((s->mode ^ value) & 3)
             s->invalidate = 1;
         s->mode = value & 0xb7;
@@ -644,83 +644,83 @@ static void blizzard_reg_write(void *opaque, uint8_t reg, uint16_t value)
             fprintf(stderr, "%s: Macrovision enable attempt!\n", __func__);
         break;
 
-    case 0x6a:	/* Special Effects */
+    case 0x6a:    /* Special Effects */
         s->effect = value & 0xfb;
         break;
 
-    case 0x6c:	/* Input Window X Start Position 0 */
+    case 0x6c:    /* Input Window X Start Position 0 */
         s->ix[0] &= 0x300;
         s->ix[0] |= (value << 0) & 0x0ff;
         break;
-    case 0x6e:	/* Input Window X Start Position 1 */
+    case 0x6e:    /* Input Window X Start Position 1 */
         s->ix[0] &= 0x0ff;
         s->ix[0] |= (value << 8) & 0x300;
         break;
-    case 0x70:	/* Input Window Y Start Position 0 */
+    case 0x70:    /* Input Window Y Start Position 0 */
         s->iy[0] &= 0x300;
         s->iy[0] |= (value << 0) & 0x0ff;
         break;
-    case 0x72:	/* Input Window Y Start Position 1 */
+    case 0x72:    /* Input Window Y Start Position 1 */
         s->iy[0] &= 0x0ff;
         s->iy[0] |= (value << 8) & 0x300;
         break;
-    case 0x74:	/* Input Window X End Position 0 */
+    case 0x74:    /* Input Window X End Position 0 */
         s->ix[1] &= 0x300;
         s->ix[1] |= (value << 0) & 0x0ff;
         break;
-    case 0x76:	/* Input Window X End Position 1 */
+    case 0x76:    /* Input Window X End Position 1 */
         s->ix[1] &= 0x0ff;
         s->ix[1] |= (value << 8) & 0x300;
         break;
-    case 0x78:	/* Input Window Y End Position 0 */
+    case 0x78:    /* Input Window Y End Position 0 */
         s->iy[1] &= 0x300;
         s->iy[1] |= (value << 0) & 0x0ff;
         break;
-    case 0x7a:	/* Input Window Y End Position 1 */
+    case 0x7a:    /* Input Window Y End Position 1 */
         s->iy[1] &= 0x0ff;
         s->iy[1] |= (value << 8) & 0x300;
         break;
-    case 0x7c:	/* Output Window X Start Position 0 */
+    case 0x7c:    /* Output Window X Start Position 0 */
         s->ox[0] &= 0x300;
         s->ox[0] |= (value << 0) & 0x0ff;
         break;
-    case 0x7e:	/* Output Window X Start Position 1 */
+    case 0x7e:    /* Output Window X Start Position 1 */
         s->ox[0] &= 0x0ff;
         s->ox[0] |= (value << 8) & 0x300;
         break;
-    case 0x80:	/* Output Window Y Start Position 0 */
+    case 0x80:    /* Output Window Y Start Position 0 */
         s->oy[0] &= 0x300;
         s->oy[0] |= (value << 0) & 0x0ff;
         break;
-    case 0x82:	/* Output Window Y Start Position 1 */
+    case 0x82:    /* Output Window Y Start Position 1 */
         s->oy[0] &= 0x0ff;
         s->oy[0] |= (value << 8) & 0x300;
         break;
-    case 0x84:	/* Output Window X End Position 0 */
+    case 0x84:    /* Output Window X End Position 0 */
         s->ox[1] &= 0x300;
         s->ox[1] |= (value << 0) & 0x0ff;
         break;
-    case 0x86:	/* Output Window X End Position 1 */
+    case 0x86:    /* Output Window X End Position 1 */
         s->ox[1] &= 0x0ff;
         s->ox[1] |= (value << 8) & 0x300;
         break;
-    case 0x88:	/* Output Window Y End Position 0 */
+    case 0x88:    /* Output Window Y End Position 0 */
         s->oy[1] &= 0x300;
         s->oy[1] |= (value << 0) & 0x0ff;
         break;
-    case 0x8a:	/* Output Window Y End Position 1 */
+    case 0x8a:    /* Output Window Y End Position 1 */
         s->oy[1] &= 0x0ff;
         s->oy[1] |= (value << 8) & 0x300;
         break;
 
-    case 0x8c:	/* Input Data Format */
+    case 0x8c:    /* Input Data Format */
         s->iformat = value & 0xf;
         s->bpp = blizzard_iformat_bpp[s->iformat];
         if (!s->bpp)
             fprintf(stderr, "%s: Illegal or unsupported input format %x\n",
                             __func__, s->iformat);
         break;
-    case 0x8e:	/* Data Source Select */
+    case 0x8e:    /* Data Source Select */
         s->source = value & 7;
         /* Currently all windows will be "destructive overlays".  */
         if ((!(s->effect & (1 << 3)) && (s->ix[0] != s->ox[0] ||
@@ -735,7 +735,7 @@ static void blizzard_reg_write(void *opaque, uint8_t reg, uint16_t value)
         blizzard_transfer_setup(s);
         break;
 
-    case 0x90:	/* Display Memory Data Port */
+    case 0x90:    /* Display Memory Data Port */
         if (!s->data.len && !blizzard_transfer_setup(s))
             break;
 
@@ -744,73 +744,73 @@ static void blizzard_reg_write(void *opaque, uint8_t reg, uint16_t value)
             blizzard_window(s);
         break;
 
-    case 0xa8:	/* Border Color 0 */
+    case 0xa8:    /* Border Color 0 */
         s->border_r = value;
         break;
-    case 0xaa:	/* Border Color 1 */
+    case 0xaa:    /* Border Color 1 */
         s->border_g = value;
         break;
-    case 0xac:	/* Border Color 2 */
+    case 0xac:    /* Border Color 2 */
         s->border_b = value;
         break;
 
-    case 0xb4:	/* Gamma Correction Enable */
+    case 0xb4:    /* Gamma Correction Enable */
         s->gamma_config = value & 0x87;
         break;
-    case 0xb6:	/* Gamma Correction Table Index */
+    case 0xb6:    /* Gamma Correction Table Index */
         s->gamma_idx = value;
         break;
-    case 0xb8:	/* Gamma Correction Table Data */
+    case 0xb8:    /* Gamma Correction Table Data */
         s->gamma_lut[s->gamma_idx ++] = value;
         break;
 
-    case 0xba:	/* 3x3 Matrix Enable */
+    case 0xba:    /* 3x3 Matrix Enable */
         s->matrix_ena = value & 1;
         break;
-    case 0xbc ... 0xde:	/* Coefficient Registers */
+    case 0xbc ... 0xde:    /* Coefficient Registers */
         s->matrix_coeff[(reg - 0xbc) >> 1] = value & ((reg & 2) ? 0x80 : 0xff);
         break;
-    case 0xe0:	/* 3x3 Matrix Red Offset */
+    case 0xe0:    /* 3x3 Matrix Red Offset */
         s->matrix_r = value;
         break;
-    case 0xe2:	/* 3x3 Matrix Green Offset */
+    case 0xe2:    /* 3x3 Matrix Green Offset */
         s->matrix_g = value;
         break;
-    case 0xe4:	/* 3x3 Matrix Blue Offset */
+    case 0xe4:    /* 3x3 Matrix Blue Offset */
         s->matrix_b = value;
         break;
 
-    case 0xe6:	/* Power-save */
+    case 0xe6:    /* Power-save */
         s->pm = value & 0x83;
         if (value & s->mode & 1)
             fprintf(stderr, "%s: The display must be disabled before entering "
                             "Standby Mode\n", __func__);
         break;
-    case 0xe8:	/* Non-display Period Control / Status */
+    case 0xe8:    /* Non-display Period Control / Status */
         s->status = value & 0x1b;
         break;
-    case 0xea:	/* RGB Interface Control */
+    case 0xea:    /* RGB Interface Control */
         s->rgbgpio_dir = value & 0x8f;
         break;
-    case 0xec:	/* RGB Interface Status */
+    case 0xec:    /* RGB Interface Status */
         s->rgbgpio = value & 0xcf;
         break;
-    case 0xee:	/* General-purpose IO Pins Configuration */
+    case 0xee:    /* General-purpose IO Pins Configuration */
         s->gpio_dir = value;
         break;
-    case 0xf0:	/* General-purpose IO Pins Status / Control */
+    case 0xf0:    /* General-purpose IO Pins Status / Control */
         s->gpio = value;
         break;
-    case 0xf2:	/* GPIO Positive Edge Interrupt Trigger */
+    case 0xf2:    /* GPIO Positive Edge Interrupt Trigger */
         s->gpio_edge[0] = value;
         break;
-    case 0xf4:	/* GPIO Negative Edge Interrupt Trigger */
+    case 0xf4:    /* GPIO Negative Edge Interrupt Trigger */
         s->gpio_edge[1] = value;
         break;
-    case 0xf6:	/* GPIO Interrupt Status */
+    case 0xf6:    /* GPIO Interrupt Status */
         s->gpio_irq &= value;
         break;
-    case 0xf8:	/* GPIO Pull-down Control */
+    case 0xf8:    /* GPIO Pull-down Control */
         s->gpio_pdown = value;
         break;
 
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 2577005d03..0c36cd2d25 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -76,12 +76,12 @@
 #define CIRRUS_MEMSIZE_512k        0x08
 #define CIRRUS_MEMSIZE_1M          0x10
 #define CIRRUS_MEMSIZE_2M          0x18
-#define CIRRUS_MEMFLAGS_BANKSWITCH 0x80	// bank switching is enabled.
+#define CIRRUS_MEMFLAGS_BANKSWITCH 0x80    // bank switching is enabled.
 
 // sequencer 0x12
 #define CIRRUS_CURSOR_SHOW         0x01
 #define CIRRUS_CURSOR_HIDDENPEL    0x02
-#define CIRRUS_CURSOR_LARGE        0x04	// 64x64 if set, 32x32 if clear
+#define CIRRUS_CURSOR_LARGE        0x04    // 64x64 if set, 32x32 if clear
 
 // sequencer 0x17
 #define CIRRUS_BUSTYPE_VLBFAST   0x10
@@ -89,12 +89,12 @@
 #define CIRRUS_BUSTYPE_VLBSLOW   0x30
 #define CIRRUS_BUSTYPE_ISA       0x38
 #define CIRRUS_MMIO_ENABLE       0x04
-#define CIRRUS_MMIO_USE_PCIADDR  0x40	// 0xb8000 if cleared.
+#define CIRRUS_MMIO_USE_PCIADDR  0x40    // 0xb8000 if cleared.
 #define CIRRUS_MEMSIZEEXT_DOUBLE 0x80
 
 // control 0x0b
 #define CIRRUS_BANKING_DUAL             0x01
-#define CIRRUS_BANKING_GRANULARITY_16K  0x20	// set:16k, clear:4k
+#define CIRRUS_BANKING_GRANULARITY_16K  0x20    // set:16k, clear:4k
 
 // control 0x30
 #define CIRRUS_BLTMODE_BACKWARDS        0x01
@@ -143,35 +143,35 @@
 #define CIRRUS_BLTMODEEXT_DWORDGRANULARITY 0x01
 
 // memory-mapped IO
-#define CIRRUS_MMIO_BLTBGCOLOR        0x00	// dword
-#define CIRRUS_MMIO_BLTFGCOLOR        0x04	// dword
-#define CIRRUS_MMIO_BLTWIDTH          0x08	// word
-#define CIRRUS_MMIO_BLTHEIGHT         0x0a	// word
-#define CIRRUS_MMIO_BLTDESTPITCH      0x0c	// word
-#define CIRRUS_MMIO_BLTSRCPITCH       0x0e	// word
-#define CIRRUS_MMIO_BLTDESTADDR       0x10	// dword
-#define CIRRUS_MMIO_BLTSRCADDR        0x14	// dword
-#define CIRRUS_MMIO_BLTWRITEMASK      0x17	// byte
-#define CIRRUS_MMIO_BLTMODE           0x18	// byte
-#define CIRRUS_MMIO_BLTROP            0x1a	// byte
-#define CIRRUS_MMIO_BLTMODEEXT        0x1b	// byte
-#define CIRRUS_MMIO_BLTTRANSPARENTCOLOR 0x1c	// word?
-#define CIRRUS_MMIO_BLTTRANSPARENTCOLORMASK 0x20	// word?
-#define CIRRUS_MMIO_LINEARDRAW_START_X 0x24	// word
-#define CIRRUS_MMIO_LINEARDRAW_START_Y 0x26	// word
-#define CIRRUS_MMIO_LINEARDRAW_END_X  0x28	// word
-#define CIRRUS_MMIO_LINEARDRAW_END_Y  0x2a	// word
-#define CIRRUS_MMIO_LINEARDRAW_LINESTYLE_INC 0x2c	// byte
-#define CIRRUS_MMIO_LINEARDRAW_LINESTYLE_ROLLOVER 0x2d	// byte
-#define CIRRUS_MMIO_LINEARDRAW_LINESTYLE_MASK 0x2e	// byte
-#define CIRRUS_MMIO_LINEARDRAW_LINESTYLE_ACCUM 0x2f	// byte
-#define CIRRUS_MMIO_BRESENHAM_K1      0x30	// word
-#define CIRRUS_MMIO_BRESENHAM_K3      0x32	// word
-#define CIRRUS_MMIO_BRESENHAM_ERROR   0x34	// word
-#define CIRRUS_MMIO_BRESENHAM_DELTA_MAJOR 0x36	// word
-#define CIRRUS_MMIO_BRESENHAM_DIRECTION 0x38	// byte
-#define CIRRUS_MMIO_LINEDRAW_MODE     0x39	// byte
-#define CIRRUS_MMIO_BLTSTATUS         0x40	// byte
+#define CIRRUS_MMIO_BLTBGCOLOR        0x00    // dword
+#define CIRRUS_MMIO_BLTFGCOLOR        0x04    // dword
+#define CIRRUS_MMIO_BLTWIDTH          0x08    // word
+#define CIRRUS_MMIO_BLTHEIGHT         0x0a    // word
+#define CIRRUS_MMIO_BLTDESTPITCH      0x0c    // word
+#define CIRRUS_MMIO_BLTSRCPITCH       0x0e    // word
+#define CIRRUS_MMIO_BLTDESTADDR       0x10    // dword
+#define CIRRUS_MMIO_BLTSRCADDR        0x14    // dword
+#define CIRRUS_MMIO_BLTWRITEMASK      0x17    // byte
+#define CIRRUS_MMIO_BLTMODE           0x18    // byte
+#define CIRRUS_MMIO_BLTROP            0x1a    // byte
+#define CIRRUS_MMIO_BLTMODEEXT        0x1b    // byte
+#define CIRRUS_MMIO_BLTTRANSPARENTCOLOR 0x1c    // word?
+#define CIRRUS_MMIO_BLTTRANSPARENTCOLORMASK 0x20    // word?
+#define CIRRUS_MMIO_LINEARDRAW_START_X 0x24    // word
+#define CIRRUS_MMIO_LINEARDRAW_START_Y 0x26    // word
+#define CIRRUS_MMIO_LINEARDRAW_END_X  0x28    // word
+#define CIRRUS_MMIO_LINEARDRAW_END_Y  0x2a    // word
+#define CIRRUS_MMIO_LINEARDRAW_LINESTYLE_INC 0x2c    // byte
+#define CIRRUS_MMIO_LINEARDRAW_LINESTYLE_ROLLOVER 0x2d    // byte
+#define CIRRUS_MMIO_LINEARDRAW_LINESTYLE_MASK 0x2e    // byte
+#define CIRRUS_MMIO_LINEARDRAW_LINESTYLE_ACCUM 0x2f    // byte
+#define CIRRUS_MMIO_BRESENHAM_K1      0x30    // word
+#define CIRRUS_MMIO_BRESENHAM_K3      0x32    // word
+#define CIRRUS_MMIO_BRESENHAM_ERROR   0x34    // word
+#define CIRRUS_MMIO_BRESENHAM_DELTA_MAJOR 0x36    // word
+#define CIRRUS_MMIO_BRESENHAM_DIRECTION 0x38    // byte
+#define CIRRUS_MMIO_LINEDRAW_MODE     0x39    // byte
+#define CIRRUS_MMIO_BLTSTATUS         0x40    // byte
 
 #define CIRRUS_PNPMMIO_SIZE         0x1000
 
@@ -628,8 +628,8 @@ static inline void cirrus_bitblt_bgcol(CirrusVGAState *s)
 }
 
 static void cirrus_invalidate_region(CirrusVGAState * s, int off_begin,
-				     int off_pitch, int bytesperline,
-				     int lines)
+                     int off_pitch, int bytesperline,
+                     int lines)
 {
     int y;
     int off_cur;
@@ -708,8 +708,8 @@ static int cirrus_bitblt_solidfill(CirrusVGAState *s, int blt_rop)
              s->cirrus_blt_dstpitch,
              s->cirrus_blt_width, s->cirrus_blt_height);
     cirrus_invalidate_region(s, s->cirrus_blt_dstaddr,
-			     s->cirrus_blt_dstpitch, s->cirrus_blt_width,
-			     s->cirrus_blt_height);
+                 s->cirrus_blt_dstpitch, s->cirrus_blt_width,
+                 s->cirrus_blt_height);
     cirrus_bitblt_reset(s);
     return 1;
 }
@@ -773,8 +773,8 @@ static int cirrus_do_copy(CirrusVGAState *s, int dst, int src, int w, int h)
 
     (*s->cirrus_rop) (s, s->cirrus_blt_dstaddr,
                       s->cirrus_blt_srcaddr,
-		      s->cirrus_blt_dstpitch, s->cirrus_blt_srcpitch,
-		      s->cirrus_blt_width, s->cirrus_blt_height);
+              s->cirrus_blt_dstpitch, s->cirrus_blt_srcpitch,
+              s->cirrus_blt_width, s->cirrus_blt_height);
 
     if (notify) {
         dpy_gfx_update(s->vga.con, dx, dy,
@@ -786,8 +786,8 @@ static int cirrus_do_copy(CirrusVGAState *s, int dst, int src, int w, int h)
        changed since qemu_console_copy implies this */
 
     cirrus_invalidate_region(s, s->cirrus_blt_dstaddr,
-				s->cirrus_blt_dstpitch, s->cirrus_blt_width,
-				s->cirrus_blt_height);
+                s->cirrus_blt_dstpitch, s->cirrus_blt_width,
+                s->cirrus_blt_height);
 
     return 1;
 }
@@ -854,7 +854,7 @@ static void cirrus_bitblt_reset(CirrusVGAState * s)
     int need_update;
 
     s->vga.gr[0x31] &=
-	~(CIRRUS_BLT_START | CIRRUS_BLT_BUSY | CIRRUS_BLT_FIFOUSED);
+    ~(CIRRUS_BLT_START | CIRRUS_BLT_BUSY | CIRRUS_BLT_FIFOUSED);
     need_update = s->cirrus_srcptr != &s->cirrus_bltbuf[0]
         || s->cirrus_srcptr_end != &s->cirrus_bltbuf[0];
     s->cirrus_srcptr = &s->cirrus_bltbuf[0];
@@ -878,24 +878,24 @@ static int cirrus_bitblt_cputovideo(CirrusVGAState * s)
     s->cirrus_srcptr_end = &s->cirrus_bltbuf[0];
 
     if (s->cirrus_blt_mode & CIRRUS_BLTMODE_PATTERNCOPY) {
-	if (s->cirrus_blt_mode & CIRRUS_BLTMODE_COLOREXPAND) {
-	    s->cirrus_blt_srcpitch = 8;
-	} else {
+    if (s->cirrus_blt_mode & CIRRUS_BLTMODE_COLOREXPAND) {
+        s->cirrus_blt_srcpitch = 8;
+    } else {
             /* XXX: check for 24 bpp */
-	    s->cirrus_blt_srcpitch = 8 * 8 * s->cirrus_blt_pixelwidth;
-	}
-	s->cirrus_srccounter = s->cirrus_blt_srcpitch;
+        s->cirrus_blt_srcpitch = 8 * 8 * s->cirrus_blt_pixelwidth;
+    }
+    s->cirrus_srccounter = s->cirrus_blt_srcpitch;
     } else {
-	if (s->cirrus_blt_mode & CIRRUS_BLTMODE_COLOREXPAND) {
+    if (s->cirrus_blt_mode & CIRRUS_BLTMODE_COLOREXPAND) {
             w = s->cirrus_blt_width / s->cirrus_blt_pixelwidth;
             if (s->cirrus_blt_modeext & CIRRUS_BLTMODEEXT_DWORDGRANULARITY)
                 s->cirrus_blt_srcpitch = ((w + 31) >> 5);
             else
                 s->cirrus_blt_srcpitch = ((w + 7) >> 3);
-	} else {
+    } else {
             /* always align input size to 32 bits */
-	    s->cirrus_blt_srcpitch = (s->cirrus_blt_width + 3) & ~3;
-	}
+        s->cirrus_blt_srcpitch = (s->cirrus_blt_width + 3) & ~3;
+    }
         s->cirrus_srccounter = s->cirrus_blt_srcpitch * s->cirrus_blt_height;
     }
 
@@ -921,12 +921,12 @@ static int cirrus_bitblt_videotovideo(CirrusVGAState * s)
     int ret;
 
     if (s->cirrus_blt_mode & CIRRUS_BLTMODE_PATTERNCOPY) {
-	ret = cirrus_bitblt_videotovideo_patterncopy(s);
+    ret = cirrus_bitblt_videotovideo_patterncopy(s);
     } else {
-	ret = cirrus_bitblt_videotovideo_copy(s);
+    ret = cirrus_bitblt_videotovideo_copy(s);
     }
     if (ret)
-	cirrus_bitblt_reset(s);
+    cirrus_bitblt_reset(s);
     return ret;
 }
 
@@ -945,9 +945,9 @@ static void cirrus_bitblt_start(CirrusVGAState * s)
     s->cirrus_blt_dstpitch = (s->vga.gr[0x24] | (s->vga.gr[0x25] << 8));
     s->cirrus_blt_srcpitch = (s->vga.gr[0x26] | (s->vga.gr[0x27] << 8));
     s->cirrus_blt_dstaddr =
-	(s->vga.gr[0x28] | (s->vga.gr[0x29] << 8) | (s->vga.gr[0x2a] << 16));
+    (s->vga.gr[0x28] | (s->vga.gr[0x29] << 8) | (s->vga.gr[0x2a] << 16));
     s->cirrus_blt_srcaddr =
-	(s->vga.gr[0x2c] | (s->vga.gr[0x2d] << 8) | (s->vga.gr[0x2e] << 16));
+    (s->vga.gr[0x2c] | (s->vga.gr[0x2d] << 8) | (s->vga.gr[0x2e] << 16));
     s->cirrus_blt_mode = s->vga.gr[0x30];
     s->cirrus_blt_modeext = s->vga.gr[0x33];
     blt_rop = s->vga.gr[0x32];
@@ -968,31 +968,31 @@ static void cirrus_bitblt_start(CirrusVGAState * s)
 
     switch (s->cirrus_blt_mode & CIRRUS_BLTMODE_PIXELWIDTHMASK) {
     case CIRRUS_BLTMODE_PIXELWIDTH8:
-	s->cirrus_blt_pixelwidth = 1;
-	break;
+    s->cirrus_blt_pixelwidth = 1;
+    break;
     case CIRRUS_BLTMODE_PIXELWIDTH16:
-	s->cirrus_blt_pixelwidth = 2;
-	break;
+    s->cirrus_blt_pixelwidth = 2;
+    break;
     case CIRRUS_BLTMODE_PIXELWIDTH24:
-	s->cirrus_blt_pixelwidth = 3;
-	break;
+    s->cirrus_blt_pixelwidth = 3;
+    break;
     case CIRRUS_BLTMODE_PIXELWIDTH32:
-	s->cirrus_blt_pixelwidth = 4;
-	break;
+    s->cirrus_blt_pixelwidth = 4;
+    break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "cirrus: bitblt - pixel width is unknown\n");
-	goto bitblt_ignore;
+    goto bitblt_ignore;
     }
     s->cirrus_blt_mode &= ~CIRRUS_BLTMODE_PIXELWIDTHMASK;
 
     if ((s->
-	 cirrus_blt_mode & (CIRRUS_BLTMODE_MEMSYSSRC |
-			    CIRRUS_BLTMODE_MEMSYSDEST))
-	== (CIRRUS_BLTMODE_MEMSYSSRC | CIRRUS_BLTMODE_MEMSYSDEST)) {
+     cirrus_blt_mode & (CIRRUS_BLTMODE_MEMSYSSRC |
+                CIRRUS_BLTMODE_MEMSYSDEST))
+    == (CIRRUS_BLTMODE_MEMSYSSRC | CIRRUS_BLTMODE_MEMSYSDEST)) {
         qemu_log_mask(LOG_UNIMP,
                       "cirrus: bitblt - memory-to-memory copy requested\n");
-	goto bitblt_ignore;
+    goto bitblt_ignore;
     }
 
     if ((s->cirrus_blt_modeext & CIRRUS_BLTMODEEXT_SOLIDFILL) &&
@@ -1036,30 +1036,30 @@ static void cirrus_bitblt_start(CirrusVGAState * s)
                 s->cirrus_rop = cirrus_patternfill[rop_to_index[blt_rop]][s->cirrus_blt_pixelwidth - 1];
             }
         } else {
-	    if (s->cirrus_blt_mode & CIRRUS_BLTMODE_TRANSPARENTCOMP) {
-		if (s->cirrus_blt_pixelwidth > 2) {
+        if (s->cirrus_blt_mode & CIRRUS_BLTMODE_TRANSPARENTCOMP) {
+        if (s->cirrus_blt_pixelwidth > 2) {
                     qemu_log_mask(LOG_GUEST_ERROR,
                                   "cirrus: src transparent without colorexpand "
                                   "must be 8bpp or 16bpp\n");
-		    goto bitblt_ignore;
-		}
-		if (s->cirrus_blt_mode & CIRRUS_BLTMODE_BACKWARDS) {
-		    s->cirrus_blt_dstpitch = -s->cirrus_blt_dstpitch;
-		    s->cirrus_blt_srcpitch = -s->cirrus_blt_srcpitch;
-		    s->cirrus_rop = cirrus_bkwd_transp_rop[rop_to_index[blt_rop]][s->cirrus_blt_pixelwidth - 1];
-		} else {
-		    s->cirrus_rop = cirrus_fwd_transp_rop[rop_to_index[blt_rop]][s->cirrus_blt_pixelwidth - 1];
-		}
-	    } else {
-		if (s->cirrus_blt_mode & CIRRUS_BLTMODE_BACKWARDS) {
-		    s->cirrus_blt_dstpitch = -s->cirrus_blt_dstpitch;
-		    s->cirrus_blt_srcpitch = -s->cirrus_blt_srcpitch;
-		    s->cirrus_rop = cirrus_bkwd_rop[rop_to_index[blt_rop]];
-		} else {
-		    s->cirrus_rop = cirrus_fwd_rop[rop_to_index[blt_rop]];
-		}
-	    }
-	}
+            goto bitblt_ignore;
+        }
+        if (s->cirrus_blt_mode & CIRRUS_BLTMODE_BACKWARDS) {
+            s->cirrus_blt_dstpitch = -s->cirrus_blt_dstpitch;
+            s->cirrus_blt_srcpitch = -s->cirrus_blt_srcpitch;
+            s->cirrus_rop = cirrus_bkwd_transp_rop[rop_to_index[blt_rop]][s->cirrus_blt_pixelwidth - 1];
+        } else {
+            s->cirrus_rop = cirrus_fwd_transp_rop[rop_to_index[blt_rop]][s->cirrus_blt_pixelwidth - 1];
+        }
+        } else {
+        if (s->cirrus_blt_mode & CIRRUS_BLTMODE_BACKWARDS) {
+            s->cirrus_blt_dstpitch = -s->cirrus_blt_dstpitch;
+            s->cirrus_blt_srcpitch = -s->cirrus_blt_srcpitch;
+            s->cirrus_rop = cirrus_bkwd_rop[rop_to_index[blt_rop]];
+        } else {
+            s->cirrus_rop = cirrus_fwd_rop[rop_to_index[blt_rop]];
+        }
+        }
+    }
         // setup bitblt engine.
         if (s->cirrus_blt_mode & CIRRUS_BLTMODE_MEMSYSSRC) {
             if (!cirrus_bitblt_cputovideo(s))
@@ -1085,11 +1085,11 @@ static void cirrus_write_bitblt(CirrusVGAState * s, unsigned reg_value)
     s->vga.gr[0x31] = reg_value;
 
     if (((old_value & CIRRUS_BLT_RESET) != 0) &&
-	((reg_value & CIRRUS_BLT_RESET) == 0)) {
-	cirrus_bitblt_reset(s);
+    ((reg_value & CIRRUS_BLT_RESET) == 0)) {
+    cirrus_bitblt_reset(s);
     } else if (((old_value & CIRRUS_BLT_START) == 0) &&
-	       ((reg_value & CIRRUS_BLT_START) != 0)) {
-	cirrus_bitblt_start(s);
+           ((reg_value & CIRRUS_BLT_START) != 0)) {
+    cirrus_bitblt_start(s);
     }
 }
 
@@ -1109,15 +1109,15 @@ static void cirrus_get_offsets(VGACommonState *s1,
     uint32_t start_addr, line_offset, line_compare;
 
     line_offset = s->vga.cr[0x13]
-	| ((s->vga.cr[0x1b] & 0x10) << 4);
+    | ((s->vga.cr[0x1b] & 0x10) << 4);
     line_offset <<= 3;
     *pline_offset = line_offset;
 
     start_addr = (s->vga.cr[0x0c] << 8)
-	| s->vga.cr[0x0d]
-	| ((s->vga.cr[0x1b] & 0x01) << 16)
-	| ((s->vga.cr[0x1b] & 0x0c) << 15)
-	| ((s->vga.cr[0x1d] & 0x80) << 12);
+    | s->vga.cr[0x0d]
+    | ((s->vga.cr[0x1b] & 0x01) << 16)
+    | ((s->vga.cr[0x1b] & 0x0c) << 15)
+    | ((s->vga.cr[0x1d] & 0x80) << 12);
     *pstart_addr = start_addr;
 
     line_compare = s->vga.cr[0x18] |
@@ -1132,17 +1132,17 @@ static uint32_t cirrus_get_bpp16_depth(CirrusVGAState * s)
 
     switch (s->cirrus_hidden_dac_data & 0xf) {
     case 0:
-	ret = 15;
-	break;			/* Sierra HiColor */
+    ret = 15;
+    break;            /* Sierra HiColor */
     case 1:
-	ret = 16;
-	break;			/* XGA HiColor */
+    ret = 16;
+    break;            /* XGA HiColor */
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "cirrus: invalid DAC value 0x%x in 16bpp\n",
                       (s->cirrus_hidden_dac_data & 0xf));
-	ret = 15;		/* XXX */
-	break;
+    ret = 15;        /* XXX */
+    break;
     }
     return ret;
 }
@@ -1153,33 +1153,33 @@ static int cirrus_get_bpp(VGACommonState *s1)
     uint32_t ret = 8;
 
     if ((s->vga.sr[0x07] & 0x01) != 0) {
-	/* Cirrus SVGA */
-	switch (s->vga.sr[0x07] & CIRRUS_SR7_BPP_MASK) {
-	case CIRRUS_SR7_BPP_8:
-	    ret = 8;
-	    break;
-	case CIRRUS_SR7_BPP_16_DOUBLEVCLK:
-	    ret = cirrus_get_bpp16_depth(s);
-	    break;
-	case CIRRUS_SR7_BPP_24:
-	    ret = 24;
-	    break;
-	case CIRRUS_SR7_BPP_16:
-	    ret = cirrus_get_bpp16_depth(s);
-	    break;
-	case CIRRUS_SR7_BPP_32:
-	    ret = 32;
-	    break;
-	default:
+    /* Cirrus SVGA */
+    switch (s->vga.sr[0x07] & CIRRUS_SR7_BPP_MASK) {
+    case CIRRUS_SR7_BPP_8:
+        ret = 8;
+        break;
+    case CIRRUS_SR7_BPP_16_DOUBLEVCLK:
+        ret = cirrus_get_bpp16_depth(s);
+        break;
+    case CIRRUS_SR7_BPP_24:
+        ret = 24;
+        break;
+    case CIRRUS_SR7_BPP_16:
+        ret = cirrus_get_bpp16_depth(s);
+        break;
+    case CIRRUS_SR7_BPP_32:
+        ret = 32;
+        break;
+    default:
 #ifdef DEBUG_CIRRUS
-	    printf("cirrus: unknown bpp - sr7=%x\n", s->vga.sr[0x7]);
+        printf("cirrus: unknown bpp - sr7=%x\n", s->vga.sr[0x7]);
 #endif
-	    ret = 8;
-	    break;
-	}
+        ret = 8;
+        break;
+    }
     } else {
-	/* VGA */
-	ret = 0;
+    /* VGA */
+    ret = 0;
     }
 
     return ret;
@@ -1212,36 +1212,36 @@ static void cirrus_update_bank_ptr(CirrusVGAState * s, unsigned bank_index)
     unsigned offset;
     unsigned limit;
 
-    if ((s->vga.gr[0x0b] & 0x01) != 0)	/* dual bank */
-	offset = s->vga.gr[0x09 + bank_index];
-    else			/* single bank */
-	offset = s->vga.gr[0x09];
+    if ((s->vga.gr[0x0b] & 0x01) != 0)    /* dual bank */
+    offset = s->vga.gr[0x09 + bank_index];
+    else            /* single bank */
+    offset = s->vga.gr[0x09];
 
     if ((s->vga.gr[0x0b] & 0x20) != 0)
-	offset <<= 14;
+    offset <<= 14;
     else
-	offset <<= 12;
+    offset <<= 12;
 
     if (s->real_vram_size <= offset)
-	limit = 0;
+    limit = 0;
     else
-	limit = s->real_vram_size - offset;
+    limit = s->real_vram_size - offset;
 
     if (((s->vga.gr[0x0b] & 0x01) == 0) && (bank_index != 0)) {
-	if (limit > 0x8000) {
-	    offset += 0x8000;
-	    limit -= 0x8000;
-	} else {
-	    limit = 0;
-	}
+    if (limit > 0x8000) {
+        offset += 0x8000;
+        limit -= 0x8000;
+    } else {
+        limit = 0;
+    }
     }
 
     if (limit > 0) {
-	s->cirrus_bank_base[bank_index] = offset;
-	s->cirrus_bank_limit[bank_index] = limit;
+    s->cirrus_bank_base[bank_index] = offset;
+    s->cirrus_bank_limit[bank_index] = limit;
     } else {
-	s->cirrus_bank_base[bank_index] = 0;
-	s->cirrus_bank_limit[bank_index] = 0;
+    s->cirrus_bank_base[bank_index] = 0;
+    s->cirrus_bank_limit[bank_index] = 0;
     }
 }
 
@@ -1254,148 +1254,148 @@ static void cirrus_update_bank_ptr(CirrusVGAState * s, unsigned bank_index)
 static int cirrus_vga_read_sr(CirrusVGAState * s)
 {
     switch (s->vga.sr_index) {
-    case 0x00:			// Standard VGA
-    case 0x01:			// Standard VGA
-    case 0x02:			// Standard VGA
-    case 0x03:			// Standard VGA
-    case 0x04:			// Standard VGA
-	return s->vga.sr[s->vga.sr_index];
-    case 0x06:			// Unlock Cirrus extensions
-	return s->vga.sr[s->vga.sr_index];
+    case 0x00:            // Standard VGA
+    case 0x01:            // Standard VGA
+    case 0x02:            // Standard VGA
+    case 0x03:            // Standard VGA
+    case 0x04:            // Standard VGA
+    return s->vga.sr[s->vga.sr_index];
+    case 0x06:            // Unlock Cirrus extensions
+    return s->vga.sr[s->vga.sr_index];
     case 0x10:
     case 0x30:
     case 0x50:
-    case 0x70:			// Graphics Cursor X
+    case 0x70:            // Graphics Cursor X
     case 0x90:
     case 0xb0:
     case 0xd0:
-    case 0xf0:			// Graphics Cursor X
-	return s->vga.sr[0x10];
+    case 0xf0:            // Graphics Cursor X
+    return s->vga.sr[0x10];
     case 0x11:
     case 0x31:
     case 0x51:
-    case 0x71:			// Graphics Cursor Y
+    case 0x71:            // Graphics Cursor Y
     case 0x91:
     case 0xb1:
     case 0xd1:
-    case 0xf1:			// Graphics Cursor Y
-	return s->vga.sr[0x11];
-    case 0x05:			// ???
-    case 0x07:			// Extended Sequencer Mode
-    case 0x08:			// EEPROM Control
-    case 0x09:			// Scratch Register 0
-    case 0x0a:			// Scratch Register 1
-    case 0x0b:			// VCLK 0
-    case 0x0c:			// VCLK 1
-    case 0x0d:			// VCLK 2
-    case 0x0e:			// VCLK 3
-    case 0x0f:			// DRAM Control
-    case 0x12:			// Graphics Cursor Attribute
-    case 0x13:			// Graphics Cursor Pattern Address
-    case 0x14:			// Scratch Register 2
-    case 0x15:			// Scratch Register 3
-    case 0x16:			// Performance Tuning Register
-    case 0x17:			// Configuration Readback and Extended Control
-    case 0x18:			// Signature Generator Control
-    case 0x19:			// Signal Generator Result
-    case 0x1a:			// Signal Generator Result
-    case 0x1b:			// VCLK 0 Denominator & Post
-    case 0x1c:			// VCLK 1 Denominator & Post
-    case 0x1d:			// VCLK 2 Denominator & Post
-    case 0x1e:			// VCLK 3 Denominator & Post
-    case 0x1f:			// BIOS Write Enable and MCLK select
+    case 0xf1:            // Graphics Cursor Y
+    return s->vga.sr[0x11];
+    case 0x05:            // ???
+    case 0x07:            // Extended Sequencer Mode
+    case 0x08:            // EEPROM Control
+    case 0x09:            // Scratch Register 0
+    case 0x0a:            // Scratch Register 1
+    case 0x0b:            // VCLK 0
+    case 0x0c:            // VCLK 1
+    case 0x0d:            // VCLK 2
+    case 0x0e:            // VCLK 3
+    case 0x0f:            // DRAM Control
+    case 0x12:            // Graphics Cursor Attribute
+    case 0x13:            // Graphics Cursor Pattern Address
+    case 0x14:            // Scratch Register 2
+    case 0x15:            // Scratch Register 3
+    case 0x16:            // Performance Tuning Register
+    case 0x17:            // Configuration Readback and Extended Control
+    case 0x18:            // Signature Generator Control
+    case 0x19:            // Signal Generator Result
+    case 0x1a:            // Signal Generator Result
+    case 0x1b:            // VCLK 0 Denominator & Post
+    case 0x1c:            // VCLK 1 Denominator & Post
+    case 0x1d:            // VCLK 2 Denominator & Post
+    case 0x1e:            // VCLK 3 Denominator & Post
+    case 0x1f:            // BIOS Write Enable and MCLK select
 #ifdef DEBUG_CIRRUS
-	printf("cirrus: handled inport sr_index %02x\n", s->vga.sr_index);
+    printf("cirrus: handled inport sr_index %02x\n", s->vga.sr_index);
 #endif
-	return s->vga.sr[s->vga.sr_index];
+    return s->vga.sr[s->vga.sr_index];
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "cirrus: inport sr_index 0x%02x\n", s->vga.sr_index);
-	return 0xff;
+    return 0xff;
     }
 }
 
 static void cirrus_vga_write_sr(CirrusVGAState * s, uint32_t val)
 {
     switch (s->vga.sr_index) {
-    case 0x00:			// Standard VGA
-    case 0x01:			// Standard VGA
-    case 0x02:			// Standard VGA
-    case 0x03:			// Standard VGA
-    case 0x04:			// Standard VGA
-	s->vga.sr[s->vga.sr_index] = val & sr_mask[s->vga.sr_index];
-	if (s->vga.sr_index == 1)
+    case 0x00:            // Standard VGA
+    case 0x01:            // Standard VGA
+    case 0x02:            // Standard VGA
+    case 0x03:            // Standard VGA
+    case 0x04:            // Standard VGA
+    s->vga.sr[s->vga.sr_index] = val & sr_mask[s->vga.sr_index];
+    if (s->vga.sr_index == 1)
             s->vga.update_retrace_info(&s->vga);
         break;
-    case 0x06:			// Unlock Cirrus extensions
-	val &= 0x17;
-	if (val == 0x12) {
-	    s->vga.sr[s->vga.sr_index] = 0x12;
-	} else {
-	    s->vga.sr[s->vga.sr_index] = 0x0f;
-	}
-	break;
+    case 0x06:            // Unlock Cirrus extensions
+    val &= 0x17;
+    if (val == 0x12) {
+        s->vga.sr[s->vga.sr_index] = 0x12;
+    } else {
+        s->vga.sr[s->vga.sr_index] = 0x0f;
+    }
+    break;
     case 0x10:
     case 0x30:
     case 0x50:
-    case 0x70:			// Graphics Cursor X
+    case 0x70:            // Graphics Cursor X
     case 0x90:
     case 0xb0:
     case 0xd0:
-    case 0xf0:			// Graphics Cursor X
-	s->vga.sr[0x10] = val;
+    case 0xf0:            // Graphics Cursor X
+    s->vga.sr[0x10] = val;
         s->vga.hw_cursor_x = (val << 3) | (s->vga.sr_index >> 5);
-	break;
+    break;
     case 0x11:
     case 0x31:
     case 0x51:
-    case 0x71:			// Graphics Cursor Y
+    case 0x71:            // Graphics Cursor Y
     case 0x91:
     case 0xb1:
     case 0xd1:
-    case 0xf1:			// Graphics Cursor Y
-	s->vga.sr[0x11] = val;
+    case 0xf1:            // Graphics Cursor Y
+    s->vga.sr[0x11] = val;
         s->vga.hw_cursor_y = (val << 3) | (s->vga.sr_index >> 5);
-	break;
-    case 0x07:			// Extended Sequencer Mode
+    break;
+    case 0x07:            // Extended Sequencer Mode
         cirrus_update_memory_access(s);
         /* fall through */
-    case 0x08:			// EEPROM Control
-    case 0x09:			// Scratch Register 0
-    case 0x0a:			// Scratch Register 1
-    case 0x0b:			// VCLK 0
-    case 0x0c:			// VCLK 1
-    case 0x0d:			// VCLK 2
-    case 0x0e:			// VCLK 3
-    case 0x0f:			// DRAM Control
-    case 0x13:			// Graphics Cursor Pattern Address
-    case 0x14:			// Scratch Register 2
-    case 0x15:			// Scratch Register 3
-    case 0x16:			// Performance Tuning Register
-    case 0x18:			// Signature Generator Control
-    case 0x19:			// Signature Generator Result
-    case 0x1a:			// Signature Generator Result
-    case 0x1b:			// VCLK 0 Denominator & Post
-    case 0x1c:			// VCLK 1 Denominator & Post
-    case 0x1d:			// VCLK 2 Denominator & Post
-    case 0x1e:			// VCLK 3 Denominator & Post
-    case 0x1f:			// BIOS Write Enable and MCLK select
-	s->vga.sr[s->vga.sr_index] = val;
+    case 0x08:            // EEPROM Control
+    case 0x09:            // Scratch Register 0
+    case 0x0a:            // Scratch Register 1
+    case 0x0b:            // VCLK 0
+    case 0x0c:            // VCLK 1
+    case 0x0d:            // VCLK 2
+    case 0x0e:            // VCLK 3
+    case 0x0f:            // DRAM Control
+    case 0x13:            // Graphics Cursor Pattern Address
+    case 0x14:            // Scratch Register 2
+    case 0x15:            // Scratch Register 3
+    case 0x16:            // Performance Tuning Register
+    case 0x18:            // Signature Generator Control
+    case 0x19:            // Signature Generator Result
+    case 0x1a:            // Signature Generator Result
+    case 0x1b:            // VCLK 0 Denominator & Post
+    case 0x1c:            // VCLK 1 Denominator & Post
+    case 0x1d:            // VCLK 2 Denominator & Post
+    case 0x1e:            // VCLK 3 Denominator & Post
+    case 0x1f:            // BIOS Write Enable and MCLK select
+    s->vga.sr[s->vga.sr_index] = val;
 #ifdef DEBUG_CIRRUS
-	printf("cirrus: handled outport sr_index %02x, sr_value %02x\n",
-	       s->vga.sr_index, val);
+    printf("cirrus: handled outport sr_index %02x, sr_value %02x\n",
+           s->vga.sr_index, val);
 #endif
-	break;
-    case 0x12:			// Graphics Cursor Attribute
-	s->vga.sr[0x12] = val;
+    break;
+    case 0x12:            // Graphics Cursor Attribute
+    s->vga.sr[0x12] = val;
         s->vga.force_shadow = !!(val & CIRRUS_CURSOR_SHOW);
 #ifdef DEBUG_CIRRUS
         printf("cirrus: cursor ctl SR12=%02x (force shadow: %d)\n",
                val, s->vga.force_shadow);
 #endif
         break;
-    case 0x17:			// Configuration Readback and Extended Control
-	s->vga.sr[s->vga.sr_index] = (s->vga.sr[s->vga.sr_index] & 0x38)
+    case 0x17:            // Configuration Readback and Extended Control
+    s->vga.sr[s->vga.sr_index] = (s->vga.sr[s->vga.sr_index] & 0x38)
                                    | (val & 0xc7);
         cirrus_update_memory_access(s);
         break;
@@ -1403,7 +1403,7 @@ static void cirrus_vga_write_sr(CirrusVGAState * s, uint32_t val)
         qemu_log_mask(LOG_GUEST_ERROR,
                       "cirrus: outport sr_index 0x%02x, sr_value 0x%02x\n",
                       s->vga.sr_index, val);
-	break;
+    break;
     }
 }
 
@@ -1425,9 +1425,9 @@ static int cirrus_read_hidden_dac(CirrusVGAState * s)
 static void cirrus_write_hidden_dac(CirrusVGAState * s, int reg_value)
 {
     if (s->cirrus_hidden_dac_lockindex == 4) {
-	s->cirrus_hidden_dac_data = reg_value;
+    s->cirrus_hidden_dac_data = reg_value;
 #if defined(DEBUG_CIRRUS)
-	printf("cirrus: outport hidden DAC, value %02x\n", reg_value);
+    printf("cirrus: outport hidden DAC, value %02x\n", reg_value);
 #endif
     }
     s->cirrus_hidden_dac_lockindex = 0;
@@ -1450,8 +1450,8 @@ static int cirrus_vga_read_palette(CirrusVGAState * s)
         val = s->vga.palette[s->vga.dac_read_index * 3 + s->vga.dac_sub_index];
     }
     if (++s->vga.dac_sub_index == 3) {
-	s->vga.dac_sub_index = 0;
-	s->vga.dac_read_index++;
+    s->vga.dac_sub_index = 0;
+    s->vga.dac_read_index++;
     }
     return val;
 }
@@ -1467,8 +1467,8 @@ static void cirrus_vga_write_palette(CirrusVGAState * s, int reg_value)
             memcpy(&s->vga.palette[s->vga.dac_write_index * 3], s->vga.dac_cache, 3);
         }
         /* XXX update cursor */
-	s->vga.dac_sub_index = 0;
-	s->vga.dac_write_index++;
+    s->vga.dac_sub_index = 0;
+    s->vga.dac_write_index++;
     }
 }
 
@@ -1485,24 +1485,24 @@ static int cirrus_vga_read_gr(CirrusVGAState * s, unsigned reg_index)
         return s->cirrus_shadow_gr0;
     case 0x01: // Standard VGA, FGCOLOR 0x000000ff
         return s->cirrus_shadow_gr1;
-    case 0x02:			// Standard VGA
-    case 0x03:			// Standard VGA
-    case 0x04:			// Standard VGA
-    case 0x06:			// Standard VGA
-    case 0x07:			// Standard VGA
-    case 0x08:			// Standard VGA
+    case 0x02:            // Standard VGA
+    case 0x03:            // Standard VGA
+    case 0x04:            // Standard VGA
+    case 0x06:            // Standard VGA
+    case 0x07:            // Standard VGA
+    case 0x08:            // Standard VGA
         return s->vga.gr[s->vga.gr_index];
-    case 0x05:			// Standard VGA, Cirrus extended mode
+    case 0x05:            // Standard VGA, Cirrus extended mode
     default:
-	break;
+    break;
     }
 
     if (reg_index < 0x3a) {
-	return s->vga.gr[reg_index];
+    return s->vga.gr[reg_index];
     } else {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "cirrus: inport gr_index 0x%02x\n", reg_index);
-	return 0xff;
+    return 0xff;
     }
 }
 
@@ -1511,87 +1511,87 @@ cirrus_vga_write_gr(CirrusVGAState * s, unsigned reg_index, int reg_value)
 {
     trace_vga_cirrus_write_gr(reg_index, reg_value);
     switch (reg_index) {
-    case 0x00:			// Standard VGA, BGCOLOR 0x000000ff
-	s->vga.gr[reg_index] = reg_value & gr_mask[reg_index];
-	s->cirrus_shadow_gr0 = reg_value;
-	break;
-    case 0x01:			// Standard VGA, FGCOLOR 0x000000ff
-	s->vga.gr[reg_index] = reg_value & gr_mask[reg_index];
-	s->cirrus_shadow_gr1 = reg_value;
-	break;
-    case 0x02:			// Standard VGA
-    case 0x03:			// Standard VGA
-    case 0x04:			// Standard VGA
-    case 0x06:			// Standard VGA
-    case 0x07:			// Standard VGA
-    case 0x08:			// Standard VGA
-	s->vga.gr[reg_index] = reg_value & gr_mask[reg_index];
+    case 0x00:            // Standard VGA, BGCOLOR 0x000000ff
+    s->vga.gr[reg_index] = reg_value & gr_mask[reg_index];
+    s->cirrus_shadow_gr0 = reg_value;
+    break;
+    case 0x01:            // Standard VGA, FGCOLOR 0x000000ff
+    s->vga.gr[reg_index] = reg_value & gr_mask[reg_index];
+    s->cirrus_shadow_gr1 = reg_value;
+    break;
+    case 0x02:            // Standard VGA
+    case 0x03:            // Standard VGA
+    case 0x04:            // Standard VGA
+    case 0x06:            // Standard VGA
+    case 0x07:            // Standard VGA
+    case 0x08:            // Standard VGA
+    s->vga.gr[reg_index] = reg_value & gr_mask[reg_index];
         break;
-    case 0x05:			// Standard VGA, Cirrus extended mode
-	s->vga.gr[reg_index] = reg_value & 0x7f;
+    case 0x05:            // Standard VGA, Cirrus extended mode
+    s->vga.gr[reg_index] = reg_value & 0x7f;
         cirrus_update_memory_access(s);
-	break;
-    case 0x09:			// bank offset #0
-    case 0x0A:			// bank offset #1
-	s->vga.gr[reg_index] = reg_value;
-	cirrus_update_bank_ptr(s, 0);
-	cirrus_update_bank_ptr(s, 1);
+    break;
+    case 0x09:            // bank offset #0
+    case 0x0A:            // bank offset #1
+    s->vga.gr[reg_index] = reg_value;
+    cirrus_update_bank_ptr(s, 0);
+    cirrus_update_bank_ptr(s, 1);
         cirrus_update_memory_access(s);
         break;
     case 0x0B:
-	s->vga.gr[reg_index] = reg_value;
-	cirrus_update_bank_ptr(s, 0);
-	cirrus_update_bank_ptr(s, 1);
+    s->vga.gr[reg_index] = reg_value;
+    cirrus_update_bank_ptr(s, 0);
+    cirrus_update_bank_ptr(s, 1);
         cirrus_update_memory_access(s);
-	break;
-    case 0x10:			// BGCOLOR 0x0000ff00
-    case 0x11:			// FGCOLOR 0x0000ff00
-    case 0x12:			// BGCOLOR 0x00ff0000
-    case 0x13:			// FGCOLOR 0x00ff0000
-    case 0x14:			// BGCOLOR 0xff000000
-    case 0x15:			// FGCOLOR 0xff000000
-    case 0x20:			// BLT WIDTH 0x0000ff
-    case 0x22:			// BLT HEIGHT 0x0000ff
-    case 0x24:			// BLT DEST PITCH 0x0000ff
-    case 0x26:			// BLT SRC PITCH 0x0000ff
-    case 0x28:			// BLT DEST ADDR 0x0000ff
-    case 0x29:			// BLT DEST ADDR 0x00ff00
-    case 0x2c:			// BLT SRC ADDR 0x0000ff
-    case 0x2d:			// BLT SRC ADDR 0x00ff00
+    break;
+    case 0x10:            // BGCOLOR 0x0000ff00
+    case 0x11:            // FGCOLOR 0x0000ff00
+    case 0x12:            // BGCOLOR 0x00ff0000
+    case 0x13:            // FGCOLOR 0x00ff0000
+    case 0x14:            // BGCOLOR 0xff000000
+    case 0x15:            // FGCOLOR 0xff000000
+    case 0x20:            // BLT WIDTH 0x0000ff
+    case 0x22:            // BLT HEIGHT 0x0000ff
+    case 0x24:            // BLT DEST PITCH 0x0000ff
+    case 0x26:            // BLT SRC PITCH 0x0000ff
+    case 0x28:            // BLT DEST ADDR 0x0000ff
+    case 0x29:            // BLT DEST ADDR 0x00ff00
+    case 0x2c:            // BLT SRC ADDR 0x0000ff
+    case 0x2d:            // BLT SRC ADDR 0x00ff00
     case 0x2f:                  // BLT WRITEMASK
-    case 0x30:			// BLT MODE
-    case 0x32:			// RASTER OP
-    case 0x33:			// BLT MODEEXT
-    case 0x34:			// BLT TRANSPARENT COLOR 0x00ff
-    case 0x35:			// BLT TRANSPARENT COLOR 0xff00
-    case 0x38:			// BLT TRANSPARENT COLOR MASK 0x00ff
-    case 0x39:			// BLT TRANSPARENT COLOR MASK 0xff00
-	s->vga.gr[reg_index] = reg_value;
-	break;
-    case 0x21:			// BLT WIDTH 0x001f00
-    case 0x23:			// BLT HEIGHT 0x001f00
-    case 0x25:			// BLT DEST PITCH 0x001f00
-    case 0x27:			// BLT SRC PITCH 0x001f00
-	s->vga.gr[reg_index] = reg_value & 0x1f;
-	break;
-    case 0x2a:			// BLT DEST ADDR 0x3f0000
-	s->vga.gr[reg_index] = reg_value & 0x3f;
+    case 0x30:            // BLT MODE
+    case 0x32:            // RASTER OP
+    case 0x33:            // BLT MODEEXT
+    case 0x34:            // BLT TRANSPARENT COLOR 0x00ff
+    case 0x35:            // BLT TRANSPARENT COLOR 0xff00
+    case 0x38:            // BLT TRANSPARENT COLOR MASK 0x00ff
+    case 0x39:            // BLT TRANSPARENT COLOR MASK 0xff00
+    s->vga.gr[reg_index] = reg_value;
+    break;
+    case 0x21:            // BLT WIDTH 0x001f00
+    case 0x23:            // BLT HEIGHT 0x001f00
+    case 0x25:            // BLT DEST PITCH 0x001f00
+    case 0x27:            // BLT SRC PITCH 0x001f00
+    s->vga.gr[reg_index] = reg_value & 0x1f;
+    break;
+    case 0x2a:            // BLT DEST ADDR 0x3f0000
+    s->vga.gr[reg_index] = reg_value & 0x3f;
         /* if auto start mode, starts bit blt now */
         if (s->vga.gr[0x31] & CIRRUS_BLT_AUTOSTART) {
             cirrus_bitblt_start(s);
         }
-	break;
-    case 0x2e:			// BLT SRC ADDR 0x3f0000
-	s->vga.gr[reg_index] = reg_value & 0x3f;
-	break;
-    case 0x31:			// BLT STATUS/START
-	cirrus_write_bitblt(s, reg_value);
-	break;
+    break;
+    case 0x2e:            // BLT SRC ADDR 0x3f0000
+    s->vga.gr[reg_index] = reg_value & 0x3f;
+    break;
+    case 0x31:            // BLT STATUS/START
+    cirrus_write_bitblt(s, reg_value);
+    break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "cirrus: outport gr_index 0x%02x, gr_value 0x%02x\n",
                       reg_index, reg_value);
-	break;
+    break;
     }
 }
 
@@ -1604,122 +1604,122 @@ cirrus_vga_write_gr(CirrusVGAState * s, unsigned reg_index, int reg_value)
 static int cirrus_vga_read_cr(CirrusVGAState * s, unsigned reg_index)
 {
     switch (reg_index) {
-    case 0x00:			// Standard VGA
-    case 0x01:			// Standard VGA
-    case 0x02:			// Standard VGA
-    case 0x03:			// Standard VGA
-    case 0x04:			// Standard VGA
-    case 0x05:			// Standard VGA
-    case 0x06:			// Standard VGA
-    case 0x07:			// Standard VGA
-    case 0x08:			// Standard VGA
-    case 0x09:			// Standard VGA
-    case 0x0a:			// Standard VGA
-    case 0x0b:			// Standard VGA
-    case 0x0c:			// Standard VGA
-    case 0x0d:			// Standard VGA
-    case 0x0e:			// Standard VGA
-    case 0x0f:			// Standard VGA
-    case 0x10:			// Standard VGA
-    case 0x11:			// Standard VGA
-    case 0x12:			// Standard VGA
-    case 0x13:			// Standard VGA
-    case 0x14:			// Standard VGA
-    case 0x15:			// Standard VGA
-    case 0x16:			// Standard VGA
-    case 0x17:			// Standard VGA
-    case 0x18:			// Standard VGA
-	return s->vga.cr[s->vga.cr_index];
-    case 0x24:			// Attribute Controller Toggle Readback (R)
+    case 0x00:            // Standard VGA
+    case 0x01:            // Standard VGA
+    case 0x02:            // Standard VGA
+    case 0x03:            // Standard VGA
+    case 0x04:            // Standard VGA
+    case 0x05:            // Standard VGA
+    case 0x06:            // Standard VGA
+    case 0x07:            // Standard VGA
+    case 0x08:            // Standard VGA
+    case 0x09:            // Standard VGA
+    case 0x0a:            // Standard VGA
+    case 0x0b:            // Standard VGA
+    case 0x0c:            // Standard VGA
+    case 0x0d:            // Standard VGA
+    case 0x0e:            // Standard VGA
+    case 0x0f:            // Standard VGA
+    case 0x10:            // Standard VGA
+    case 0x11:            // Standard VGA
+    case 0x12:            // Standard VGA
+    case 0x13:            // Standard VGA
+    case 0x14:            // Standard VGA
+    case 0x15:            // Standard VGA
+    case 0x16:            // Standard VGA
+    case 0x17:            // Standard VGA
+    case 0x18:            // Standard VGA
+    return s->vga.cr[s->vga.cr_index];
+    case 0x24:            // Attribute Controller Toggle Readback (R)
         return (s->vga.ar_flip_flop << 7);
-    case 0x19:			// Interlace End
-    case 0x1a:			// Miscellaneous Control
-    case 0x1b:			// Extended Display Control
-    case 0x1c:			// Sync Adjust and Genlock
-    case 0x1d:			// Overlay Extended Control
-    case 0x22:			// Graphics Data Latches Readback (R)
-    case 0x25:			// Part Status
-    case 0x27:			// Part ID (R)
-	return s->vga.cr[s->vga.cr_index];
-    case 0x26:			// Attribute Controller Index Readback (R)
-	return s->vga.ar_index & 0x3f;
+    case 0x19:            // Interlace End
+    case 0x1a:            // Miscellaneous Control
+    case 0x1b:            // Extended Display Control
+    case 0x1c:            // Sync Adjust and Genlock
+    case 0x1d:            // Overlay Extended Control
+    case 0x22:            // Graphics Data Latches Readback (R)
+    case 0x25:            // Part Status
+    case 0x27:            // Part ID (R)
+    return s->vga.cr[s->vga.cr_index];
+    case 0x26:            // Attribute Controller Index Readback (R)
+    return s->vga.ar_index & 0x3f;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "cirrus: inport cr_index 0x%02x\n", reg_index);
-	return 0xff;
+    return 0xff;
     }
 }
 
 static void cirrus_vga_write_cr(CirrusVGAState * s, int reg_value)
 {
     switch (s->vga.cr_index) {
-    case 0x00:			// Standard VGA
-    case 0x01:			// Standard VGA
-    case 0x02:			// Standard VGA
-    case 0x03:			// Standard VGA
-    case 0x04:			// Standard VGA
-    case 0x05:			// Standard VGA
-    case 0x06:			// Standard VGA
-    case 0x07:			// Standard VGA
-    case 0x08:			// Standard VGA
-    case 0x09:			// Standard VGA
-    case 0x0a:			// Standard VGA
-    case 0x0b:			// Standard VGA
-    case 0x0c:			// Standard VGA
-    case 0x0d:			// Standard VGA
-    case 0x0e:			// Standard VGA
-    case 0x0f:			// Standard VGA
-    case 0x10:			// Standard VGA
-    case 0x11:			// Standard VGA
-    case 0x12:			// Standard VGA
-    case 0x13:			// Standard VGA
-    case 0x14:			// Standard VGA
-    case 0x15:			// Standard VGA
-    case 0x16:			// Standard VGA
-    case 0x17:			// Standard VGA
-    case 0x18:			// Standard VGA
-	/* handle CR0-7 protection */
-	if ((s->vga.cr[0x11] & 0x80) && s->vga.cr_index <= 7) {
-	    /* can always write bit 4 of CR7 */
-	    if (s->vga.cr_index == 7)
-		s->vga.cr[7] = (s->vga.cr[7] & ~0x10) | (reg_value & 0x10);
-	    return;
-	}
-	s->vga.cr[s->vga.cr_index] = reg_value;
-	switch(s->vga.cr_index) {
-	case 0x00:
-	case 0x04:
-	case 0x05:
-	case 0x06:
-	case 0x07:
-	case 0x11:
-	case 0x17:
-	    s->vga.update_retrace_info(&s->vga);
-	    break;
-	}
+    case 0x00:            // Standard VGA
+    case 0x01:            // Standard VGA
+    case 0x02:            // Standard VGA
+    case 0x03:            // Standard VGA
+    case 0x04:            // Standard VGA
+    case 0x05:            // Standard VGA
+    case 0x06:            // Standard VGA
+    case 0x07:            // Standard VGA
+    case 0x08:            // Standard VGA
+    case 0x09:            // Standard VGA
+    case 0x0a:            // Standard VGA
+    case 0x0b:            // Standard VGA
+    case 0x0c:            // Standard VGA
+    case 0x0d:            // Standard VGA
+    case 0x0e:            // Standard VGA
+    case 0x0f:            // Standard VGA
+    case 0x10:            // Standard VGA
+    case 0x11:            // Standard VGA
+    case 0x12:            // Standard VGA
+    case 0x13:            // Standard VGA
+    case 0x14:            // Standard VGA
+    case 0x15:            // Standard VGA
+    case 0x16:            // Standard VGA
+    case 0x17:            // Standard VGA
+    case 0x18:            // Standard VGA
+    /* handle CR0-7 protection */
+    if ((s->vga.cr[0x11] & 0x80) && s->vga.cr_index <= 7) {
+        /* can always write bit 4 of CR7 */
+        if (s->vga.cr_index == 7)
+        s->vga.cr[7] = (s->vga.cr[7] & ~0x10) | (reg_value & 0x10);
+        return;
+    }
+    s->vga.cr[s->vga.cr_index] = reg_value;
+    switch(s->vga.cr_index) {
+    case 0x00:
+    case 0x04:
+    case 0x05:
+    case 0x06:
+    case 0x07:
+    case 0x11:
+    case 0x17:
+        s->vga.update_retrace_info(&s->vga);
         break;
-    case 0x19:			// Interlace End
-    case 0x1a:			// Miscellaneous Control
-    case 0x1b:			// Extended Display Control
-    case 0x1c:			// Sync Adjust and Genlock
-    case 0x1d:			// Overlay Extended Control
-	s->vga.cr[s->vga.cr_index] = reg_value;
+    }
+        break;
+    case 0x19:            // Interlace End
+    case 0x1a:            // Miscellaneous Control
+    case 0x1b:            // Extended Display Control
+    case 0x1c:            // Sync Adjust and Genlock
+    case 0x1d:            // Overlay Extended Control
+    s->vga.cr[s->vga.cr_index] = reg_value;
 #ifdef DEBUG_CIRRUS
-	printf("cirrus: handled outport cr_index %02x, cr_value %02x\n",
-	       s->vga.cr_index, reg_value);
+    printf("cirrus: handled outport cr_index %02x, cr_value %02x\n",
+           s->vga.cr_index, reg_value);
 #endif
-	break;
-    case 0x22:			// Graphics Data Latches Readback (R)
-    case 0x24:			// Attribute Controller Toggle Readback (R)
-    case 0x26:			// Attribute Controller Index Readback (R)
-    case 0x27:			// Part ID (R)
-	break;
-    case 0x25:			// Part Status
+    break;
+    case 0x22:            // Graphics Data Latches Readback (R)
+    case 0x24:            // Attribute Controller Toggle Readback (R)
+    case 0x26:            // Attribute Controller Index Readback (R)
+    case 0x27:            // Part ID (R)
+    break;
+    case 0x25:            // Part Status
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "cirrus: outport cr_index 0x%02x, cr_value 0x%02x\n",
                       s->vga.cr_index, reg_value);
-	break;
+    break;
     }
 }
 
@@ -1735,102 +1735,102 @@ static uint8_t cirrus_mmio_blt_read(CirrusVGAState * s, unsigned address)
 
     switch (address) {
     case (CIRRUS_MMIO_BLTBGCOLOR + 0):
-	value = cirrus_vga_read_gr(s, 0x00);
-	break;
+    value = cirrus_vga_read_gr(s, 0x00);
+    break;
     case (CIRRUS_MMIO_BLTBGCOLOR + 1):
-	value = cirrus_vga_read_gr(s, 0x10);
-	break;
+    value = cirrus_vga_read_gr(s, 0x10);
+    break;
     case (CIRRUS_MMIO_BLTBGCOLOR + 2):
-	value = cirrus_vga_read_gr(s, 0x12);
-	break;
+    value = cirrus_vga_read_gr(s, 0x12);
+    break;
     case (CIRRUS_MMIO_BLTBGCOLOR + 3):
-	value = cirrus_vga_read_gr(s, 0x14);
-	break;
+    value = cirrus_vga_read_gr(s, 0x14);
+    break;
     case (CIRRUS_MMIO_BLTFGCOLOR + 0):
-	value = cirrus_vga_read_gr(s, 0x01);
-	break;
+    value = cirrus_vga_read_gr(s, 0x01);
+    break;
     case (CIRRUS_MMIO_BLTFGCOLOR + 1):
-	value = cirrus_vga_read_gr(s, 0x11);
-	break;
+    value = cirrus_vga_read_gr(s, 0x11);
+    break;
     case (CIRRUS_MMIO_BLTFGCOLOR + 2):
-	value = cirrus_vga_read_gr(s, 0x13);
-	break;
+    value = cirrus_vga_read_gr(s, 0x13);
+    break;
     case (CIRRUS_MMIO_BLTFGCOLOR + 3):
-	value = cirrus_vga_read_gr(s, 0x15);
-	break;
+    value = cirrus_vga_read_gr(s, 0x15);
+    break;
     case (CIRRUS_MMIO_BLTWIDTH + 0):
-	value = cirrus_vga_read_gr(s, 0x20);
-	break;
+    value = cirrus_vga_read_gr(s, 0x20);
+    break;
     case (CIRRUS_MMIO_BLTWIDTH + 1):
-	value = cirrus_vga_read_gr(s, 0x21);
-	break;
+    value = cirrus_vga_read_gr(s, 0x21);
+    break;
     case (CIRRUS_MMIO_BLTHEIGHT + 0):
-	value = cirrus_vga_read_gr(s, 0x22);
-	break;
+    value = cirrus_vga_read_gr(s, 0x22);
+    break;
     case (CIRRUS_MMIO_BLTHEIGHT + 1):
-	value = cirrus_vga_read_gr(s, 0x23);
-	break;
+    value = cirrus_vga_read_gr(s, 0x23);
+    break;
     case (CIRRUS_MMIO_BLTDESTPITCH + 0):
-	value = cirrus_vga_read_gr(s, 0x24);
-	break;
+    value = cirrus_vga_read_gr(s, 0x24);
+    break;
     case (CIRRUS_MMIO_BLTDESTPITCH + 1):
-	value = cirrus_vga_read_gr(s, 0x25);
-	break;
+    value = cirrus_vga_read_gr(s, 0x25);
+    break;
     case (CIRRUS_MMIO_BLTSRCPITCH + 0):
-	value = cirrus_vga_read_gr(s, 0x26);
-	break;
+    value = cirrus_vga_read_gr(s, 0x26);
+    break;
     case (CIRRUS_MMIO_BLTSRCPITCH + 1):
-	value = cirrus_vga_read_gr(s, 0x27);
-	break;
+    value = cirrus_vga_read_gr(s, 0x27);
+    break;
     case (CIRRUS_MMIO_BLTDESTADDR + 0):
-	value = cirrus_vga_read_gr(s, 0x28);
-	break;
+    value = cirrus_vga_read_gr(s, 0x28);
+    break;
     case (CIRRUS_MMIO_BLTDESTADDR + 1):
-	value = cirrus_vga_read_gr(s, 0x29);
-	break;
+    value = cirrus_vga_read_gr(s, 0x29);
+    break;
     case (CIRRUS_MMIO_BLTDESTADDR + 2):
-	value = cirrus_vga_read_gr(s, 0x2a);
-	break;
+    value = cirrus_vga_read_gr(s, 0x2a);
+    break;
     case (CIRRUS_MMIO_BLTSRCADDR + 0):
-	value = cirrus_vga_read_gr(s, 0x2c);
-	break;
+    value = cirrus_vga_read_gr(s, 0x2c);
+    break;
     case (CIRRUS_MMIO_BLTSRCADDR + 1):
-	value = cirrus_vga_read_gr(s, 0x2d);
-	break;
+    value = cirrus_vga_read_gr(s, 0x2d);
+    break;
     case (CIRRUS_MMIO_BLTSRCADDR + 2):
-	value = cirrus_vga_read_gr(s, 0x2e);
-	break;
+    value = cirrus_vga_read_gr(s, 0x2e);
+    break;
     case CIRRUS_MMIO_BLTWRITEMASK:
-	value = cirrus_vga_read_gr(s, 0x2f);
-	break;
+    value = cirrus_vga_read_gr(s, 0x2f);
+    break;
     case CIRRUS_MMIO_BLTMODE:
-	value = cirrus_vga_read_gr(s, 0x30);
-	break;
+    value = cirrus_vga_read_gr(s, 0x30);
+    break;
     case CIRRUS_MMIO_BLTROP:
-	value = cirrus_vga_read_gr(s, 0x32);
-	break;
+    value = cirrus_vga_read_gr(s, 0x32);
+    break;
     case CIRRUS_MMIO_BLTMODEEXT:
-	value = cirrus_vga_read_gr(s, 0x33);
-	break;
+    value = cirrus_vga_read_gr(s, 0x33);
+    break;
     case (CIRRUS_MMIO_BLTTRANSPARENTCOLOR + 0):
-	value = cirrus_vga_read_gr(s, 0x34);
-	break;
+    value = cirrus_vga_read_gr(s, 0x34);
+    break;
     case (CIRRUS_MMIO_BLTTRANSPARENTCOLOR + 1):
-	value = cirrus_vga_read_gr(s, 0x35);
-	break;
+    value = cirrus_vga_read_gr(s, 0x35);
+    break;
     case (CIRRUS_MMIO_BLTTRANSPARENTCOLORMASK + 0):
-	value = cirrus_vga_read_gr(s, 0x38);
-	break;
+    value = cirrus_vga_read_gr(s, 0x38);
+    break;
     case (CIRRUS_MMIO_BLTTRANSPARENTCOLORMASK + 1):
-	value = cirrus_vga_read_gr(s, 0x39);
-	break;
+    value = cirrus_vga_read_gr(s, 0x39);
+    break;
     case CIRRUS_MMIO_BLTSTATUS:
-	value = cirrus_vga_read_gr(s, 0x31);
-	break;
+    value = cirrus_vga_read_gr(s, 0x31);
+    break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "cirrus: mmio read - address 0x%04x\n", address);
-	break;
+    break;
     }
 
     trace_vga_cirrus_write_blt(address, value);
@@ -1838,111 +1838,111 @@ static uint8_t cirrus_mmio_blt_read(CirrusVGAState * s, unsigned address)
 }
 
 static void cirrus_mmio_blt_write(CirrusVGAState * s, unsigned address,
-				  uint8_t value)
+                  uint8_t value)
 {
     trace_vga_cirrus_write_blt(address, value);
     switch (address) {
     case (CIRRUS_MMIO_BLTBGCOLOR + 0):
-	cirrus_vga_write_gr(s, 0x00, value);
-	break;
+    cirrus_vga_write_gr(s, 0x00, value);
+    break;
     case (CIRRUS_MMIO_BLTBGCOLOR + 1):
-	cirrus_vga_write_gr(s, 0x10, value);
-	break;
+    cirrus_vga_write_gr(s, 0x10, value);
+    break;
     case (CIRRUS_MMIO_BLTBGCOLOR + 2):
-	cirrus_vga_write_gr(s, 0x12, value);
-	break;
+    cirrus_vga_write_gr(s, 0x12, value);
+    break;
     case (CIRRUS_MMIO_BLTBGCOLOR + 3):
-	cirrus_vga_write_gr(s, 0x14, value);
-	break;
+    cirrus_vga_write_gr(s, 0x14, value);
+    break;
     case (CIRRUS_MMIO_BLTFGCOLOR + 0):
-	cirrus_vga_write_gr(s, 0x01, value);
-	break;
+    cirrus_vga_write_gr(s, 0x01, value);
+    break;
     case (CIRRUS_MMIO_BLTFGCOLOR + 1):
-	cirrus_vga_write_gr(s, 0x11, value);
-	break;
+    cirrus_vga_write_gr(s, 0x11, value);
+    break;
     case (CIRRUS_MMIO_BLTFGCOLOR + 2):
-	cirrus_vga_write_gr(s, 0x13, value);
-	break;
+    cirrus_vga_write_gr(s, 0x13, value);
+    break;
     case (CIRRUS_MMIO_BLTFGCOLOR + 3):
-	cirrus_vga_write_gr(s, 0x15, value);
-	break;
+    cirrus_vga_write_gr(s, 0x15, value);
+    break;
     case (CIRRUS_MMIO_BLTWIDTH + 0):
-	cirrus_vga_write_gr(s, 0x20, value);
-	break;
+    cirrus_vga_write_gr(s, 0x20, value);
+    break;
     case (CIRRUS_MMIO_BLTWIDTH + 1):
-	cirrus_vga_write_gr(s, 0x21, value);
-	break;
+    cirrus_vga_write_gr(s, 0x21, value);
+    break;
     case (CIRRUS_MMIO_BLTHEIGHT + 0):
-	cirrus_vga_write_gr(s, 0x22, value);
-	break;
+    cirrus_vga_write_gr(s, 0x22, value);
+    break;
     case (CIRRUS_MMIO_BLTHEIGHT + 1):
-	cirrus_vga_write_gr(s, 0x23, value);
-	break;
+    cirrus_vga_write_gr(s, 0x23, value);
+    break;
     case (CIRRUS_MMIO_BLTDESTPITCH + 0):
-	cirrus_vga_write_gr(s, 0x24, value);
-	break;
+    cirrus_vga_write_gr(s, 0x24, value);
+    break;
     case (CIRRUS_MMIO_BLTDESTPITCH + 1):
-	cirrus_vga_write_gr(s, 0x25, value);
-	break;
+    cirrus_vga_write_gr(s, 0x25, value);
+    break;
     case (CIRRUS_MMIO_BLTSRCPITCH + 0):
-	cirrus_vga_write_gr(s, 0x26, value);
-	break;
+    cirrus_vga_write_gr(s, 0x26, value);
+    break;
     case (CIRRUS_MMIO_BLTSRCPITCH + 1):
-	cirrus_vga_write_gr(s, 0x27, value);
-	break;
+    cirrus_vga_write_gr(s, 0x27, value);
+    break;
     case (CIRRUS_MMIO_BLTDESTADDR + 0):
-	cirrus_vga_write_gr(s, 0x28, value);
-	break;
+    cirrus_vga_write_gr(s, 0x28, value);
+    break;
     case (CIRRUS_MMIO_BLTDESTADDR + 1):
-	cirrus_vga_write_gr(s, 0x29, value);
-	break;
+    cirrus_vga_write_gr(s, 0x29, value);
+    break;
     case (CIRRUS_MMIO_BLTDESTADDR + 2):
-	cirrus_vga_write_gr(s, 0x2a, value);
-	break;
+    cirrus_vga_write_gr(s, 0x2a, value);
+    break;
     case (CIRRUS_MMIO_BLTDESTADDR + 3):
-	/* ignored */
-	break;
+    /* ignored */
+    break;
     case (CIRRUS_MMIO_BLTSRCADDR + 0):
-	cirrus_vga_write_gr(s, 0x2c, value);
-	break;
+    cirrus_vga_write_gr(s, 0x2c, value);
+    break;
     case (CIRRUS_MMIO_BLTSRCADDR + 1):
-	cirrus_vga_write_gr(s, 0x2d, value);
-	break;
+    cirrus_vga_write_gr(s, 0x2d, value);
+    break;
     case (CIRRUS_MMIO_BLTSRCADDR + 2):
-	cirrus_vga_write_gr(s, 0x2e, value);
-	break;
+    cirrus_vga_write_gr(s, 0x2e, value);
+    break;
     case CIRRUS_MMIO_BLTWRITEMASK:
-	cirrus_vga_write_gr(s, 0x2f, value);
-	break;
+    cirrus_vga_write_gr(s, 0x2f, value);
+    break;
     case CIRRUS_MMIO_BLTMODE:
-	cirrus_vga_write_gr(s, 0x30, value);
-	break;
+    cirrus_vga_write_gr(s, 0x30, value);
+    break;
     case CIRRUS_MMIO_BLTROP:
-	cirrus_vga_write_gr(s, 0x32, value);
-	break;
+    cirrus_vga_write_gr(s, 0x32, value);
+    break;
     case CIRRUS_MMIO_BLTMODEEXT:
-	cirrus_vga_write_gr(s, 0x33, value);
-	break;
+    cirrus_vga_write_gr(s, 0x33, value);
+    break;
     case (CIRRUS_MMIO_BLTTRANSPARENTCOLOR + 0):
-	cirrus_vga_write_gr(s, 0x34, value);
-	break;
+    cirrus_vga_write_gr(s, 0x34, value);
+    break;
     case (CIRRUS_MMIO_BLTTRANSPARENTCOLOR + 1):
-	cirrus_vga_write_gr(s, 0x35, value);
-	break;
+    cirrus_vga_write_gr(s, 0x35, value);
+    break;
     case (CIRRUS_MMIO_BLTTRANSPARENTCOLORMASK + 0):
-	cirrus_vga_write_gr(s, 0x38, value);
-	break;
+    cirrus_vga_write_gr(s, 0x38, value);
+    break;
     case (CIRRUS_MMIO_BLTTRANSPARENTCOLORMASK + 1):
-	cirrus_vga_write_gr(s, 0x39, value);
-	break;
+    cirrus_vga_write_gr(s, 0x39, value);
+    break;
     case CIRRUS_MMIO_BLTSTATUS:
-	cirrus_vga_write_gr(s, 0x31, value);
-	break;
+    cirrus_vga_write_gr(s, 0x31, value);
+    break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "cirrus: mmio write - addr 0x%04x val 0x%02x (ignored)\n",
                       address, value);
-	break;
+    break;
     }
 }
 
@@ -1953,9 +1953,9 @@ static void cirrus_mmio_blt_write(CirrusVGAState * s, unsigned address,
  ***************************************/
 
 static void cirrus_mem_writeb_mode4and5_8bpp(CirrusVGAState * s,
-					     unsigned mode,
-					     unsigned offset,
-					     uint32_t mem_value)
+                         unsigned mode,
+                         unsigned offset,
+                         uint32_t mem_value)
 {
     int x;
     unsigned val = mem_value;
@@ -1963,20 +1963,20 @@ static void cirrus_mem_writeb_mode4and5_8bpp(CirrusVGAState * s,
 
     for (x = 0; x < 8; x++) {
         dst = s->vga.vram_ptr + ((offset + x) & s->cirrus_addr_mask);
-	if (val & 0x80) {
-	    *dst = s->cirrus_shadow_gr1;
-	} else if (mode == 5) {
-	    *dst = s->cirrus_shadow_gr0;
-	}
-	val <<= 1;
+    if (val & 0x80) {
+        *dst = s->cirrus_shadow_gr1;
+    } else if (mode == 5) {
+        *dst = s->cirrus_shadow_gr0;
+    }
+    val <<= 1;
     }
     memory_region_set_dirty(&s->vga.vram, offset, 8);
 }
 
 static void cirrus_mem_writeb_mode4and5_16bpp(CirrusVGAState * s,
-					      unsigned mode,
-					      unsigned offset,
-					      uint32_t mem_value)
+                          unsigned mode,
+                          unsigned offset,
+                          uint32_t mem_value)
 {
     int x;
     unsigned val = mem_value;
@@ -1984,14 +1984,14 @@ static void cirrus_mem_writeb_mode4and5_16bpp(CirrusVGAState * s,
 
     for (x = 0; x < 8; x++) {
         dst = s->vga.vram_ptr + ((offset + 2 * x) & s->cirrus_addr_mask & ~1);
-	if (val & 0x80) {
-	    *dst = s->cirrus_shadow_gr1;
-	    *(dst + 1) = s->vga.gr[0x11];
-	} else if (mode == 5) {
-	    *dst = s->cirrus_shadow_gr0;
-	    *(dst + 1) = s->vga.gr[0x10];
-	}
-	val <<= 1;
+    if (val & 0x80) {
+        *dst = s->cirrus_shadow_gr1;
+        *(dst + 1) = s->vga.gr[0x11];
+    } else if (mode == 5) {
+        *dst = s->cirrus_shadow_gr0;
+        *(dst + 1) = s->vga.gr[0x10];
+    }
+    val <<= 1;
     }
     memory_region_set_dirty(&s->vga.vram, offset, 16);
 }
@@ -2016,29 +2016,29 @@ static uint64_t cirrus_vga_mem_read(void *opaque,
     }
 
     if (addr < 0x10000) {
-	/* XXX handle bitblt */
-	/* video memory */
-	bank_index = addr >> 15;
-	bank_offset = addr & 0x7fff;
-	if (bank_offset < s->cirrus_bank_limit[bank_index]) {
-	    bank_offset += s->cirrus_bank_base[bank_index];
-	    if ((s->vga.gr[0x0B] & 0x14) == 0x14) {
-		bank_offset <<= 4;
-	    } else if (s->vga.gr[0x0B] & 0x02) {
-		bank_offset <<= 3;
-	    }
-	    bank_offset &= s->cirrus_addr_mask;
-	    val = *(s->vga.vram_ptr + bank_offset);
-	} else
-	    val = 0xff;
+    /* XXX handle bitblt */
+    /* video memory */
+    bank_index = addr >> 15;
+    bank_offset = addr & 0x7fff;
+    if (bank_offset < s->cirrus_bank_limit[bank_index]) {
+        bank_offset += s->cirrus_bank_base[bank_index];
+        if ((s->vga.gr[0x0B] & 0x14) == 0x14) {
+        bank_offset <<= 4;
+        } else if (s->vga.gr[0x0B] & 0x02) {
+        bank_offset <<= 3;
+        }
+        bank_offset &= s->cirrus_addr_mask;
+        val = *(s->vga.vram_ptr + bank_offset);
+    } else
+        val = 0xff;
     } else if (addr >= 0x18000 && addr < 0x18100) {
-	/* memory-mapped I/O */
-	val = 0xff;
-	if ((s->vga.sr[0x17] & 0x44) == 0x04) {
-	    val = cirrus_mmio_blt_read(s, addr & 0xff);
-	}
+    /* memory-mapped I/O */
+    val = 0xff;
+    if ((s->vga.sr[0x17] & 0x44) == 0x04) {
+        val = cirrus_mmio_blt_read(s, addr & 0xff);
+    }
     } else {
-	val = 0xff;
+    val = 0xff;
         qemu_log_mask(LOG_GUEST_ERROR,
                       "cirrus: mem_readb 0x" TARGET_FMT_plx "\n", addr);
     }
@@ -2061,47 +2061,47 @@ static void cirrus_vga_mem_write(void *opaque,
     }
 
     if (addr < 0x10000) {
-	if (s->cirrus_srcptr != s->cirrus_srcptr_end) {
-	    /* bitblt */
-	    *s->cirrus_srcptr++ = (uint8_t) mem_value;
-	    if (s->cirrus_srcptr >= s->cirrus_srcptr_end) {
-		cirrus_bitblt_cputovideo_next(s);
-	    }
-	} else {
-	    /* video memory */
-	    bank_index = addr >> 15;
-	    bank_offset = addr & 0x7fff;
-	    if (bank_offset < s->cirrus_bank_limit[bank_index]) {
-		bank_offset += s->cirrus_bank_base[bank_index];
-		if ((s->vga.gr[0x0B] & 0x14) == 0x14) {
-		    bank_offset <<= 4;
-		} else if (s->vga.gr[0x0B] & 0x02) {
-		    bank_offset <<= 3;
-		}
-		bank_offset &= s->cirrus_addr_mask;
-		mode = s->vga.gr[0x05] & 0x7;
-		if (mode < 4 || mode > 5 || ((s->vga.gr[0x0B] & 0x4) == 0)) {
-		    *(s->vga.vram_ptr + bank_offset) = mem_value;
+    if (s->cirrus_srcptr != s->cirrus_srcptr_end) {
+        /* bitblt */
+        *s->cirrus_srcptr++ = (uint8_t) mem_value;
+        if (s->cirrus_srcptr >= s->cirrus_srcptr_end) {
+        cirrus_bitblt_cputovideo_next(s);
+        }
+    } else {
+        /* video memory */
+        bank_index = addr >> 15;
+        bank_offset = addr & 0x7fff;
+        if (bank_offset < s->cirrus_bank_limit[bank_index]) {
+        bank_offset += s->cirrus_bank_base[bank_index];
+        if ((s->vga.gr[0x0B] & 0x14) == 0x14) {
+            bank_offset <<= 4;
+        } else if (s->vga.gr[0x0B] & 0x02) {
+            bank_offset <<= 3;
+        }
+        bank_offset &= s->cirrus_addr_mask;
+        mode = s->vga.gr[0x05] & 0x7;
+        if (mode < 4 || mode > 5 || ((s->vga.gr[0x0B] & 0x4) == 0)) {
+            *(s->vga.vram_ptr + bank_offset) = mem_value;
                     memory_region_set_dirty(&s->vga.vram, bank_offset,
                                             sizeof(mem_value));
-		} else {
-		    if ((s->vga.gr[0x0B] & 0x14) != 0x14) {
-			cirrus_mem_writeb_mode4and5_8bpp(s, mode,
-							 bank_offset,
-							 mem_value);
-		    } else {
-			cirrus_mem_writeb_mode4and5_16bpp(s, mode,
-							  bank_offset,
-							  mem_value);
-		    }
-		}
-	    }
-	}
+        } else {
+            if ((s->vga.gr[0x0B] & 0x14) != 0x14) {
+            cirrus_mem_writeb_mode4and5_8bpp(s, mode,
+                             bank_offset,
+                             mem_value);
+            } else {
+            cirrus_mem_writeb_mode4and5_16bpp(s, mode,
+                              bank_offset,
+                              mem_value);
+            }
+        }
+        }
+    }
     } else if (addr >= 0x18000 && addr < 0x18100) {
-	/* memory-mapped I/O */
-	if ((s->vga.sr[0x17] & 0x44) == 0x04) {
-	    cirrus_mmio_blt_write(s, addr & 0xff, mem_value);
-	}
+    /* memory-mapped I/O */
+    if ((s->vga.sr[0x17] & 0x44) == 0x04) {
+        cirrus_mmio_blt_write(s, addr & 0xff, mem_value);
+    }
     } else {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "cirrus: mem_writeb 0x" TARGET_FMT_plx " "
@@ -2326,20 +2326,20 @@ static uint64_t cirrus_linear_read(void *opaque, hwaddr addr,
 
     if (((s->vga.sr[0x17] & 0x44) == 0x44) &&
         ((addr & s->linear_mmio_mask) == s->linear_mmio_mask)) {
-	/* memory-mapped I/O */
-	ret = cirrus_mmio_blt_read(s, addr & 0xff);
+    /* memory-mapped I/O */
+    ret = cirrus_mmio_blt_read(s, addr & 0xff);
     } else if (0) {
-	/* XXX handle bitblt */
-	ret = 0xff;
+    /* XXX handle bitblt */
+    ret = 0xff;
     } else {
-	/* video memory */
-	if ((s->vga.gr[0x0B] & 0x14) == 0x14) {
-	    addr <<= 4;
-	} else if (s->vga.gr[0x0B] & 0x02) {
-	    addr <<= 3;
-	}
-	addr &= s->cirrus_addr_mask;
-	ret = *(s->vga.vram_ptr + addr);
+    /* video memory */
+    if ((s->vga.gr[0x0B] & 0x14) == 0x14) {
+        addr <<= 4;
+    } else if (s->vga.gr[0x0B] & 0x02) {
+        addr <<= 3;
+    }
+    addr &= s->cirrus_addr_mask;
+    ret = *(s->vga.vram_ptr + addr);
     }
 
     return ret;
@@ -2355,34 +2355,34 @@ static void cirrus_linear_write(void *opaque, hwaddr addr,
 
     if (((s->vga.sr[0x17] & 0x44) == 0x44) &&
         ((addr & s->linear_mmio_mask) ==  s->linear_mmio_mask)) {
-	/* memory-mapped I/O */
-	cirrus_mmio_blt_write(s, addr & 0xff, val);
+    /* memory-mapped I/O */
+    cirrus_mmio_blt_write(s, addr & 0xff, val);
     } else if (s->cirrus_srcptr != s->cirrus_srcptr_end) {
-	/* bitblt */
-	*s->cirrus_srcptr++ = (uint8_t) val;
-	if (s->cirrus_srcptr >= s->cirrus_srcptr_end) {
-	    cirrus_bitblt_cputovideo_next(s);
-	}
+    /* bitblt */
+    *s->cirrus_srcptr++ = (uint8_t) val;
+    if (s->cirrus_srcptr >= s->cirrus_srcptr_end) {
+        cirrus_bitblt_cputovideo_next(s);
+    }
     } else {
-	/* video memory */
-	if ((s->vga.gr[0x0B] & 0x14) == 0x14) {
-	    addr <<= 4;
-	} else if (s->vga.gr[0x0B] & 0x02) {
-	    addr <<= 3;
-	}
-	addr &= s->cirrus_addr_mask;
-
-	mode = s->vga.gr[0x05] & 0x7;
-	if (mode < 4 || mode > 5 || ((s->vga.gr[0x0B] & 0x4) == 0)) {
-	    *(s->vga.vram_ptr + addr) = (uint8_t) val;
+    /* video memory */
+    if ((s->vga.gr[0x0B] & 0x14) == 0x14) {
+        addr <<= 4;
+    } else if (s->vga.gr[0x0B] & 0x02) {
+        addr <<= 3;
+    }
+    addr &= s->cirrus_addr_mask;
+
+    mode = s->vga.gr[0x05] & 0x7;
+    if (mode < 4 || mode > 5 || ((s->vga.gr[0x0B] & 0x4) == 0)) {
+        *(s->vga.vram_ptr + addr) = (uint8_t) val;
             memory_region_set_dirty(&s->vga.vram, addr, 1);
-	} else {
-	    if ((s->vga.gr[0x0B] & 0x14) != 0x14) {
-		cirrus_mem_writeb_mode4and5_8bpp(s, mode, addr, val);
-	    } else {
-		cirrus_mem_writeb_mode4and5_16bpp(s, mode, addr, val);
-	    }
-	}
+    } else {
+        if ((s->vga.gr[0x0B] & 0x14) != 0x14) {
+        cirrus_mem_writeb_mode4and5_8bpp(s, mode, addr, val);
+        } else {
+        cirrus_mem_writeb_mode4and5_16bpp(s, mode, addr, val);
+        }
+    }
     }
 }
 
@@ -2415,11 +2415,11 @@ static void cirrus_linear_bitblt_write(void *opaque,
     CirrusVGAState *s = opaque;
 
     if (s->cirrus_srcptr != s->cirrus_srcptr_end) {
-	/* bitblt */
-	*s->cirrus_srcptr++ = (uint8_t) val;
-	if (s->cirrus_srcptr >= s->cirrus_srcptr_end) {
-	    cirrus_bitblt_cputovideo_next(s);
-	}
+    /* bitblt */
+    *s->cirrus_srcptr++ = (uint8_t) val;
+    if (s->cirrus_srcptr >= s->cirrus_srcptr_end) {
+        cirrus_bitblt_cputovideo_next(s);
+    }
     }
 }
 
@@ -2476,14 +2476,14 @@ static void cirrus_update_memory_access(CirrusVGAState *s)
     } else if (s->cirrus_srcptr != s->cirrus_srcptr_end) {
         goto generic_io;
     } else {
-	if ((s->vga.gr[0x0B] & 0x14) == 0x14) {
+    if ((s->vga.gr[0x0B] & 0x14) == 0x14) {
             goto generic_io;
-	} else if (s->vga.gr[0x0B] & 0x02) {
+    } else if (s->vga.gr[0x0B] & 0x02) {
             goto generic_io;
         }
 
-	mode = s->vga.gr[0x05] & 0x7;
-	if (mode < 4 || mode > 5 || ((s->vga.gr[0x0B] & 0x4) == 0)) {
+    mode = s->vga.gr[0x05] & 0x7;
+    if (mode < 4 || mode > 5 || ((s->vga.gr[0x0B] & 0x4) == 0)) {
             map_linear_vram(s);
         } else {
         generic_io:
@@ -2506,76 +2506,76 @@ static uint64_t cirrus_vga_ioport_read(void *opaque, hwaddr addr,
     addr += 0x3b0;
 
     if (vga_ioport_invalid(s, addr)) {
-	val = 0xff;
+    val = 0xff;
     } else {
-	switch (addr) {
-	case 0x3c0:
-	    if (s->ar_flip_flop == 0) {
-		val = s->ar_index;
-	    } else {
-		val = 0;
-	    }
-	    break;
-	case 0x3c1:
-	    index = s->ar_index & 0x1f;
-	    if (index < 21)
-		val = s->ar[index];
-	    else
-		val = 0;
-	    break;
-	case 0x3c2:
-	    val = s->st00;
-	    break;
-	case 0x3c4:
-	    val = s->sr_index;
-	    break;
-	case 0x3c5:
-	    val = cirrus_vga_read_sr(c);
+    switch (addr) {
+    case 0x3c0:
+        if (s->ar_flip_flop == 0) {
+        val = s->ar_index;
+        } else {
+        val = 0;
+        }
+        break;
+    case 0x3c1:
+        index = s->ar_index & 0x1f;
+        if (index < 21)
+        val = s->ar[index];
+        else
+        val = 0;
+        break;
+    case 0x3c2:
+        val = s->st00;
+        break;
+    case 0x3c4:
+        val = s->sr_index;
+        break;
+    case 0x3c5:
+        val = cirrus_vga_read_sr(c);
             break;
-	    break;
-	case 0x3c6:
-	    val = cirrus_read_hidden_dac(c);
-	    break;
-	case 0x3c7:
-	    val = s->dac_state;
-	    break;
-	case 0x3c8:
-	    val = s->dac_write_index;
-	    c->cirrus_hidden_dac_lockindex = 0;
-	    break;
+        break;
+    case 0x3c6:
+        val = cirrus_read_hidden_dac(c);
+        break;
+    case 0x3c7:
+        val = s->dac_state;
+        break;
+    case 0x3c8:
+        val = s->dac_write_index;
+        c->cirrus_hidden_dac_lockindex = 0;
+        break;
         case 0x3c9:
             val = cirrus_vga_read_palette(c);
             break;
-	case 0x3ca:
-	    val = s->fcr;
-	    break;
-	case 0x3cc:
-	    val = s->msr;
-	    break;
-	case 0x3ce:
-	    val = s->gr_index;
-	    break;
-	case 0x3cf:
-	    val = cirrus_vga_read_gr(c, s->gr_index);
-	    break;
-	case 0x3b4:
-	case 0x3d4:
-	    val = s->cr_index;
-	    break;
-	case 0x3b5:
-	case 0x3d5:
+    case 0x3ca:
+        val = s->fcr;
+        break;
+    case 0x3cc:
+        val = s->msr;
+        break;
+    case 0x3ce:
+        val = s->gr_index;
+        break;
+    case 0x3cf:
+        val = cirrus_vga_read_gr(c, s->gr_index);
+        break;
+    case 0x3b4:
+    case 0x3d4:
+        val = s->cr_index;
+        break;
+    case 0x3b5:
+    case 0x3d5:
             val = cirrus_vga_read_cr(c, s->cr_index);
-	    break;
-	case 0x3ba:
-	case 0x3da:
-	    /* just toggle to fool polling */
-	    val = s->st01 = s->retrace(s);
-	    s->ar_flip_flop = 0;
-	    break;
-	default:
-	    val = 0x00;
-	    break;
-	}
+        break;
+    case 0x3ba:
+    case 0x3da:
+        /* just toggle to fool polling */
+        val = s->st01 = s->retrace(s);
+        s->ar_flip_flop = 0;
+        break;
+    default:
+        val = 0x00;
+        break;
+    }
     }
     trace_vga_cirrus_read_io(addr, val);
     return val;
@@ -2592,86 +2592,86 @@ static void cirrus_vga_ioport_write(void *opaque, hwaddr addr, uint64_t val,
 
     /* check port range access depending on color/monochrome mode */
     if (vga_ioport_invalid(s, addr)) {
-	return;
+    return;
     }
     trace_vga_cirrus_write_io(addr, val);
 
     switch (addr) {
     case 0x3c0:
-	if (s->ar_flip_flop == 0) {
-	    val &= 0x3f;
-	    s->ar_index = val;
-	} else {
-	    index = s->ar_index & 0x1f;
-	    switch (index) {
-	    case 0x00 ... 0x0f:
-		s->ar[index] = val & 0x3f;
-		break;
-	    case 0x10:
-		s->ar[index] = val & ~0x10;
-		break;
-	    case 0x11:
-		s->ar[index] = val;
-		break;
-	    case 0x12:
-		s->ar[index] = val & ~0xc0;
-		break;
-	    case 0x13:
-		s->ar[index] = val & ~0xf0;
-		break;
-	    case 0x14:
-		s->ar[index] = val & ~0xf0;
-		break;
-	    default:
-		break;
-	    }
-	}
-	s->ar_flip_flop ^= 1;
-	break;
+    if (s->ar_flip_flop == 0) {
+        val &= 0x3f;
+        s->ar_index = val;
+    } else {
+        index = s->ar_index & 0x1f;
+        switch (index) {
+        case 0x00 ... 0x0f:
+        s->ar[index] = val & 0x3f;
+        break;
+        case 0x10:
+        s->ar[index] = val & ~0x10;
+        break;
+        case 0x11:
+        s->ar[index] = val;
+        break;
+        case 0x12:
+        s->ar[index] = val & ~0xc0;
+        break;
+        case 0x13:
+        s->ar[index] = val & ~0xf0;
+        break;
+        case 0x14:
+        s->ar[index] = val & ~0xf0;
+        break;
+        default:
+        break;
+        }
+    }
+    s->ar_flip_flop ^= 1;
+    break;
     case 0x3c2:
-	s->msr = val & ~0x10;
-	s->update_retrace_info(s);
-	break;
+    s->msr = val & ~0x10;
+    s->update_retrace_info(s);
+    break;
     case 0x3c4:
-	s->sr_index = val;
-	break;
+    s->sr_index = val;
+    break;
     case 0x3c5:
-	cirrus_vga_write_sr(c, val);
+    cirrus_vga_write_sr(c, val);
         break;
     case 0x3c6:
-	cirrus_write_hidden_dac(c, val);
-	break;
+    cirrus_write_hidden_dac(c, val);
+    break;
     case 0x3c7:
-	s->dac_read_index = val;
-	s->dac_sub_index = 0;
-	s->dac_state = 3;
-	break;
+    s->dac_read_index = val;
+    s->dac_sub_index = 0;
+    s->dac_state = 3;
+    break;
     case 0x3c8:
-	s->dac_write_index = val;
-	s->dac_sub_index = 0;
-	s->dac_state = 0;
-	break;
+    s->dac_write_index = val;
+    s->dac_sub_index = 0;
+    s->dac_state = 0;
+    break;
     case 0x3c9:
         cirrus_vga_write_palette(c, val);
         break;
     case 0x3ce:
-	s->gr_index = val;
-	break;
+    s->gr_index = val;
+    break;
     case 0x3cf:
-	cirrus_vga_write_gr(c, s->gr_index, val);
-	break;
+    cirrus_vga_write_gr(c, s->gr_index, val);
+    break;
     case 0x3b4:
     case 0x3d4:
-	s->cr_index = val;
-	break;
+    s->cr_index = val;
+    break;
     case 0x3b5:
     case 0x3d5:
-	cirrus_vga_write_cr(c, val);
-	break;
+    cirrus_vga_write_cr(c, val);
+    break;
     case 0x3ba:
     case 0x3da:
-	s->fcr = val & 0x10;
-	break;
+    s->fcr = val & 0x10;
+    break;
     }
 }
 
@@ -2699,7 +2699,7 @@ static void cirrus_mmio_write(void *opaque, hwaddr addr,
     CirrusVGAState *s = opaque;
 
     if (addr >= 0x100) {
-	cirrus_mmio_blt_write(s, addr - 0x100, val);
+    cirrus_mmio_blt_write(s, addr - 0x100, val);
     } else {
         cirrus_vga_ioport_write(s, addr + 0x10, val, size);
     }
@@ -2799,13 +2799,13 @@ static void cirrus_reset(void *opaque)
     s->vga.sr[0x06] = 0x0f;
     if (s->device_id == CIRRUS_ID_CLGD5446) {
         /* 4MB 64 bit memory config, always PCI */
-        s->vga.sr[0x1F] = 0x2d;		// MemClock
+        s->vga.sr[0x1F] = 0x2d;        // MemClock
         s->vga.gr[0x18] = 0x0f;             // fastest memory configuration
         s->vga.sr[0x0f] = 0x98;
         s->vga.sr[0x17] = 0x20;
         s->vga.sr[0x15] = 0x04; /* memory size, 3=2MB, 4=4MB */
     } else {
-        s->vga.sr[0x1F] = 0x22;		// MemClock
+        s->vga.sr[0x1F] = 0x22;        // MemClock
         s->vga.sr[0x0F] = CIRRUS_MEMSIZE_2M;
         s->vga.sr[0x17] = s->bustype;
         s->vga.sr[0x15] = 0x03; /* memory size, 3=2MB, 4=4MB */
diff --git a/hw/display/omap_dss.c b/hw/display/omap_dss.c
index 8c0e9ee700..a3eb52f8f0 100644
--- a/hw/display/omap_dss.c
+++ b/hw/display/omap_dss.c
@@ -182,25 +182,25 @@ static uint64_t omap_diss_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* DSS_REVISIONNUMBER */
+    case 0x00:    /* DSS_REVISIONNUMBER */
         return 0x20;
 
-    case 0x10:	/* DSS_SYSCONFIG */
+    case 0x10:    /* DSS_SYSCONFIG */
         return s->autoidle;
 
-    case 0x14:	/* DSS_SYSSTATUS */
-        return 1;						/* RESETDONE */
+    case 0x14:    /* DSS_SYSSTATUS */
+        return 1;                        /* RESETDONE */
 
-    case 0x40:	/* DSS_CONTROL */
+    case 0x40:    /* DSS_CONTROL */
         return s->control;
 
-    case 0x50:	/* DSS_PSA_LCD_REG_1 */
-    case 0x54:	/* DSS_PSA_LCD_REG_2 */
-    case 0x58:	/* DSS_PSA_VIDEO_REG */
+    case 0x50:    /* DSS_PSA_LCD_REG_1 */
+    case 0x54:    /* DSS_PSA_LCD_REG_2 */
+    case 0x58:    /* DSS_PSA_VIDEO_REG */
         /* TODO: fake some values when appropriate s->control bits are set */
         return 0;
 
-    case 0x5c:	/* DSS_STATUS */
+    case 0x5c:    /* DSS_STATUS */
         return 1 + (s->control & 1);
 
     default:
@@ -221,22 +221,22 @@ static void omap_diss_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* DSS_REVISIONNUMBER */
-    case 0x14:	/* DSS_SYSSTATUS */
-    case 0x50:	/* DSS_PSA_LCD_REG_1 */
-    case 0x54:	/* DSS_PSA_LCD_REG_2 */
-    case 0x58:	/* DSS_PSA_VIDEO_REG */
-    case 0x5c:	/* DSS_STATUS */
+    case 0x00:    /* DSS_REVISIONNUMBER */
+    case 0x14:    /* DSS_SYSSTATUS */
+    case 0x50:    /* DSS_PSA_LCD_REG_1 */
+    case 0x54:    /* DSS_PSA_LCD_REG_2 */
+    case 0x58:    /* DSS_PSA_VIDEO_REG */
+    case 0x5c:    /* DSS_STATUS */
         OMAP_RO_REG(addr);
         break;
 
-    case 0x10:	/* DSS_SYSCONFIG */
-        if (value & 2)						/* SOFTRESET */
+    case 0x10:    /* DSS_SYSCONFIG */
+        if (value & 2)                        /* SOFTRESET */
             omap_dss_reset(s);
         s->autoidle = value & 1;
         break;
 
-    case 0x40:	/* DSS_CONTROL */
+    case 0x40:    /* DSS_CONTROL */
         s->control = value & 0x3dd;
         break;
 
@@ -261,112 +261,112 @@ static uint64_t omap_disc_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x000:	/* DISPC_REVISION */
+    case 0x000:    /* DISPC_REVISION */
         return 0x20;
 
-    case 0x010:	/* DISPC_SYSCONFIG */
+    case 0x010:    /* DISPC_SYSCONFIG */
         return s->dispc.idlemode;
 
-    case 0x014:	/* DISPC_SYSSTATUS */
-        return 1;						/* RESETDONE */
+    case 0x014:    /* DISPC_SYSSTATUS */
+        return 1;                        /* RESETDONE */
 
-    case 0x018:	/* DISPC_IRQSTATUS */
+    case 0x018:    /* DISPC_IRQSTATUS */
         return s->dispc.irqst;
 
-    case 0x01c:	/* DISPC_IRQENABLE */
+    case 0x01c:    /* DISPC_IRQENABLE */
         return s->dispc.irqen;
 
-    case 0x040:	/* DISPC_CONTROL */
+    case 0x040:    /* DISPC_CONTROL */
         return s->dispc.control;
 
-    case 0x044:	/* DISPC_CONFIG */
+    case 0x044:    /* DISPC_CONFIG */
         return s->dispc.config;
 
-    case 0x048:	/* DISPC_CAPABLE */
+    case 0x048:    /* DISPC_CAPABLE */
         return s->dispc.capable;
 
-    case 0x04c:	/* DISPC_DEFAULT_COLOR0 */
+    case 0x04c:    /* DISPC_DEFAULT_COLOR0 */
         return s->dispc.bg[0];
-    case 0x050:	/* DISPC_DEFAULT_COLOR1 */
+    case 0x050:    /* DISPC_DEFAULT_COLOR1 */
         return s->dispc.bg[1];
-    case 0x054:	/* DISPC_TRANS_COLOR0 */
+    case 0x054:    /* DISPC_TRANS_COLOR0 */
         return s->dispc.trans[0];
-    case 0x058:	/* DISPC_TRANS_COLOR1 */
+    case 0x058:    /* DISPC_TRANS_COLOR1 */
         return s->dispc.trans[1];
 
-    case 0x05c:	/* DISPC_LINE_STATUS */
+    case 0x05c:    /* DISPC_LINE_STATUS */
         return 0x7ff;
-    case 0x060:	/* DISPC_LINE_NUMBER */
+    case 0x060:    /* DISPC_LINE_NUMBER */
         return s->dispc.line;
 
-    case 0x064:	/* DISPC_TIMING_H */
+    case 0x064:    /* DISPC_TIMING_H */
         return s->dispc.timing[0];
-    case 0x068:	/* DISPC_TIMING_V */
+    case 0x068:    /* DISPC_TIMING_V */
         return s->dispc.timing[1];
-    case 0x06c:	/* DISPC_POL_FREQ */
+    case 0x06c:    /* DISPC_POL_FREQ */
         return s->dispc.timing[2];
-    case 0x070:	/* DISPC_DIVISOR */
+    case 0x070:    /* DISPC_DIVISOR */
         return s->dispc.timing[3];
 
-    case 0x078:	/* DISPC_SIZE_DIG */
+    case 0x078:    /* DISPC_SIZE_DIG */
         return ((s->dig.ny - 1) << 16) | (s->dig.nx - 1);
-    case 0x07c:	/* DISPC_SIZE_LCD */
+    case 0x07c:    /* DISPC_SIZE_LCD */
         return ((s->lcd.ny - 1) << 16) | (s->lcd.nx - 1);
 
-    case 0x080:	/* DISPC_GFX_BA0 */
+    case 0x080:    /* DISPC_GFX_BA0 */
         return s->dispc.l[0].addr[0];
-    case 0x084:	/* DISPC_GFX_BA1 */
+    case 0x084:    /* DISPC_GFX_BA1 */
         return s->dispc.l[0].addr[1];
-    case 0x088:	/* DISPC_GFX_POSITION */
+    case 0x088:    /* DISPC_GFX_POSITION */
         return (s->dispc.l[0].posy << 16) | s->dispc.l[0].posx;
-    case 0x08c:	/* DISPC_GFX_SIZE */
+    case 0x08c:    /* DISPC_GFX_SIZE */
         return ((s->dispc.l[0].ny - 1) << 16) | (s->dispc.l[0].nx - 1);
-    case 0x0a0:	/* DISPC_GFX_ATTRIBUTES */
+    case 0x0a0:    /* DISPC_GFX_ATTRIBUTES */
         return s->dispc.l[0].attr;
-    case 0x0a4:	/* DISPC_GFX_FIFO_TRESHOLD */
+    case 0x0a4:    /* DISPC_GFX_FIFO_TRESHOLD */
         return s->dispc.l[0].tresh;
-    case 0x0a8:	/* DISPC_GFX_FIFO_SIZE_STATUS */
+    case 0x0a8:    /* DISPC_GFX_FIFO_SIZE_STATUS */
         return 256;
-    case 0x0ac:	/* DISPC_GFX_ROW_INC */
+    case 0x0ac:    /* DISPC_GFX_ROW_INC */
         return s->dispc.l[0].rowinc;
-    case 0x0b0:	/* DISPC_GFX_PIXEL_INC */
+    case 0x0b0:    /* DISPC_GFX_PIXEL_INC */
         return s->dispc.l[0].colinc;
-    case 0x0b4:	/* DISPC_GFX_WINDOW_SKIP */
+    case 0x0b4:    /* DISPC_GFX_WINDOW_SKIP */
         return s->dispc.l[0].wininc;
-    case 0x0b8:	/* DISPC_GFX_TABLE_BA */
+    case 0x0b8:    /* DISPC_GFX_TABLE_BA */
         return s->dispc.l[0].addr[2];
 
-    case 0x0bc:	/* DISPC_VID1_BA0 */
-    case 0x0c0:	/* DISPC_VID1_BA1 */
-    case 0x0c4:	/* DISPC_VID1_POSITION */
-    case 0x0c8:	/* DISPC_VID1_SIZE */
-    case 0x0cc:	/* DISPC_VID1_ATTRIBUTES */
-    case 0x0d0:	/* DISPC_VID1_FIFO_TRESHOLD */
-    case 0x0d4:	/* DISPC_VID1_FIFO_SIZE_STATUS */
-    case 0x0d8:	/* DISPC_VID1_ROW_INC */
-    case 0x0dc:	/* DISPC_VID1_PIXEL_INC */
-    case 0x0e0:	/* DISPC_VID1_FIR */
-    case 0x0e4:	/* DISPC_VID1_PICTURE_SIZE */
-    case 0x0e8:	/* DISPC_VID1_ACCU0 */
-    case 0x0ec:	/* DISPC_VID1_ACCU1 */
-    case 0x0f0 ... 0x140:	/* DISPC_VID1_FIR_COEF, DISPC_VID1_CONV_COEF */
-    case 0x14c:	/* DISPC_VID2_BA0 */
-    case 0x150:	/* DISPC_VID2_BA1 */
-    case 0x154:	/* DISPC_VID2_POSITION */
-    case 0x158:	/* DISPC_VID2_SIZE */
-    case 0x15c:	/* DISPC_VID2_ATTRIBUTES */
-    case 0x160:	/* DISPC_VID2_FIFO_TRESHOLD */
-    case 0x164:	/* DISPC_VID2_FIFO_SIZE_STATUS */
-    case 0x168:	/* DISPC_VID2_ROW_INC */
-    case 0x16c:	/* DISPC_VID2_PIXEL_INC */
-    case 0x170:	/* DISPC_VID2_FIR */
-    case 0x174:	/* DISPC_VID2_PICTURE_SIZE */
-    case 0x178:	/* DISPC_VID2_ACCU0 */
-    case 0x17c:	/* DISPC_VID2_ACCU1 */
-    case 0x180 ... 0x1d0:	/* DISPC_VID2_FIR_COEF, DISPC_VID2_CONV_COEF */
-    case 0x1d4:	/* DISPC_DATA_CYCLE1 */
-    case 0x1d8:	/* DISPC_DATA_CYCLE2 */
-    case 0x1dc:	/* DISPC_DATA_CYCLE3 */
+    case 0x0bc:    /* DISPC_VID1_BA0 */
+    case 0x0c0:    /* DISPC_VID1_BA1 */
+    case 0x0c4:    /* DISPC_VID1_POSITION */
+    case 0x0c8:    /* DISPC_VID1_SIZE */
+    case 0x0cc:    /* DISPC_VID1_ATTRIBUTES */
+    case 0x0d0:    /* DISPC_VID1_FIFO_TRESHOLD */
+    case 0x0d4:    /* DISPC_VID1_FIFO_SIZE_STATUS */
+    case 0x0d8:    /* DISPC_VID1_ROW_INC */
+    case 0x0dc:    /* DISPC_VID1_PIXEL_INC */
+    case 0x0e0:    /* DISPC_VID1_FIR */
+    case 0x0e4:    /* DISPC_VID1_PICTURE_SIZE */
+    case 0x0e8:    /* DISPC_VID1_ACCU0 */
+    case 0x0ec:    /* DISPC_VID1_ACCU1 */
+    case 0x0f0 ... 0x140:    /* DISPC_VID1_FIR_COEF, DISPC_VID1_CONV_COEF */
+    case 0x14c:    /* DISPC_VID2_BA0 */
+    case 0x150:    /* DISPC_VID2_BA1 */
+    case 0x154:    /* DISPC_VID2_POSITION */
+    case 0x158:    /* DISPC_VID2_SIZE */
+    case 0x15c:    /* DISPC_VID2_ATTRIBUTES */
+    case 0x160:    /* DISPC_VID2_FIFO_TRESHOLD */
+    case 0x164:    /* DISPC_VID2_FIFO_SIZE_STATUS */
+    case 0x168:    /* DISPC_VID2_ROW_INC */
+    case 0x16c:    /* DISPC_VID2_PIXEL_INC */
+    case 0x170:    /* DISPC_VID2_FIR */
+    case 0x174:    /* DISPC_VID2_PICTURE_SIZE */
+    case 0x178:    /* DISPC_VID2_ACCU0 */
+    case 0x17c:    /* DISPC_VID2_ACCU1 */
+    case 0x180 ... 0x1d0:    /* DISPC_VID2_FIR_COEF, DISPC_VID2_CONV_COEF */
+    case 0x1d4:    /* DISPC_DATA_CYCLE1 */
+    case 0x1d8:    /* DISPC_DATA_CYCLE2 */
+    case 0x1dc:    /* DISPC_DATA_CYCLE3 */
         return 0;
 
     default:
@@ -387,33 +387,33 @@ static void omap_disc_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x010:	/* DISPC_SYSCONFIG */
-        if (value & 2)						/* SOFTRESET */
+    case 0x010:    /* DISPC_SYSCONFIG */
+        if (value & 2)                        /* SOFTRESET */
             omap_dss_reset(s);
         s->dispc.idlemode = value & 0x301b;
         break;
 
-    case 0x018:	/* DISPC_IRQSTATUS */
+    case 0x018:    /* DISPC_IRQSTATUS */
         s->dispc.irqst &= ~value;
         omap_dispc_interrupt_update(s);
         break;
 
-    case 0x01c:	/* DISPC_IRQENABLE */
+    case 0x01c:    /* DISPC_IRQENABLE */
         s->dispc.irqen = value & 0xffff;
         omap_dispc_interrupt_update(s);
         break;
 
-    case 0x040:	/* DISPC_CONTROL */
+    case 0x040:    /* DISPC_CONTROL */
         s->dispc.control = value & 0x07ff9fff;
         s->dig.enable = (value >> 1) & 1;
         s->lcd.enable = (value >> 0) & 1;
-        if (value & (1 << 12))			/* OVERLAY_OPTIMIZATION */
+        if (value & (1 << 12))            /* OVERLAY_OPTIMIZATION */
             if (!((s->dispc.l[1].attr | s->dispc.l[2].attr) & 1)) {
                 fprintf(stderr, "%s: Overlay Optimization when no overlay "
                         "region effectively exists leads to "
                         "unpredictable behaviour!\n", __func__);
             }
-        if (value & (1 << 6)) {				/* GODIGITAL */
+        if (value & (1 << 6)) {                /* GODIGITAL */
             /* XXX: Shadowed fields are:
              * s->dispc.config
              * s->dispc.capable
@@ -444,13 +444,13 @@ static void omap_disc_write(void *opaque, hwaddr addr,
              * All they need to be loaded here from their shadow registers.
              */
         }
-        if (value & (1 << 5)) {				/* GOLCD */
+        if (value & (1 << 5)) {                /* GOLCD */
              /* XXX: Likewise for LCD here.  */
         }
         s->dispc.invalidate = 1;
         break;
 
-    case 0x044:	/* DISPC_CONFIG */
+    case 0x044:    /* DISPC_CONFIG */
         s->dispc.config = value & 0x3fff;
         /* XXX:
          * bits 2:1 (LOADMODE) reset to 0 after set to 1 and palette loaded
@@ -459,73 +459,73 @@ static void omap_disc_write(void *opaque, hwaddr addr,
         s->dispc.invalidate = 1;
         break;
 
-    case 0x048:	/* DISPC_CAPABLE */
+    case 0x048:    /* DISPC_CAPABLE */
         s->dispc.capable = value & 0x3ff;
         break;
 
-    case 0x04c:	/* DISPC_DEFAULT_COLOR0 */
+    case 0x04c:    /* DISPC_DEFAULT_COLOR0 */
         s->dispc.bg[0] = value & 0xffffff;
         s->dispc.invalidate = 1;
         break;
-    case 0x050:	/* DISPC_DEFAULT_COLOR1 */
+    case 0x050:    /* DISPC_DEFAULT_COLOR1 */
         s->dispc.bg[1] = value & 0xffffff;
         s->dispc.invalidate = 1;
         break;
-    case 0x054:	/* DISPC_TRANS_COLOR0 */
+    case 0x054:    /* DISPC_TRANS_COLOR0 */
         s->dispc.trans[0] = value & 0xffffff;
         s->dispc.invalidate = 1;
         break;
-    case 0x058:	/* DISPC_TRANS_COLOR1 */
+    case 0x058:    /* DISPC_TRANS_COLOR1 */
         s->dispc.trans[1] = value & 0xffffff;
         s->dispc.invalidate = 1;
         break;
 
-    case 0x060:	/* DISPC_LINE_NUMBER */
+    case 0x060:    /* DISPC_LINE_NUMBER */
         s->dispc.line = value & 0x7ff;
         break;
 
-    case 0x064:	/* DISPC_TIMING_H */
+    case 0x064:    /* DISPC_TIMING_H */
         s->dispc.timing[0] = value & 0x0ff0ff3f;
         break;
-    case 0x068:	/* DISPC_TIMING_V */
+    case 0x068:    /* DISPC_TIMING_V */
         s->dispc.timing[1] = value & 0x0ff0ff3f;
         break;
-    case 0x06c:	/* DISPC_POL_FREQ */
+    case 0x06c:    /* DISPC_POL_FREQ */
         s->dispc.timing[2] = value & 0x0003ffff;
         break;
-    case 0x070:	/* DISPC_DIVISOR */
+    case 0x070:    /* DISPC_DIVISOR */
         s->dispc.timing[3] = value & 0x00ff00ff;
         break;
 
-    case 0x078:	/* DISPC_SIZE_DIG */
-        s->dig.nx = ((value >>  0) & 0x7ff) + 1;		/* PPL */
-        s->dig.ny = ((value >> 16) & 0x7ff) + 1;		/* LPP */
+    case 0x078:    /* DISPC_SIZE_DIG */
+        s->dig.nx = ((value >>  0) & 0x7ff) + 1;        /* PPL */
+        s->dig.ny = ((value >> 16) & 0x7ff) + 1;        /* LPP */
         s->dispc.invalidate = 1;
         break;
-    case 0x07c:	/* DISPC_SIZE_LCD */
-        s->lcd.nx = ((value >>  0) & 0x7ff) + 1;		/* PPL */
-        s->lcd.ny = ((value >> 16) & 0x7ff) + 1;		/* LPP */
+    case 0x07c:    /* DISPC_SIZE_LCD */
+        s->lcd.nx = ((value >>  0) & 0x7ff) + 1;        /* PPL */
+        s->lcd.ny = ((value >> 16) & 0x7ff) + 1;        /* LPP */
         s->dispc.invalidate = 1;
         break;
-    case 0x080:	/* DISPC_GFX_BA0 */
+    case 0x080:    /* DISPC_GFX_BA0 */
         s->dispc.l[0].addr[0] = (hwaddr) value;
         s->dispc.invalidate = 1;
         break;
-    case 0x084:	/* DISPC_GFX_BA1 */
+    case 0x084:    /* DISPC_GFX_BA1 */
         s->dispc.l[0].addr[1] = (hwaddr) value;
         s->dispc.invalidate = 1;
         break;
-    case 0x088:	/* DISPC_GFX_POSITION */
-        s->dispc.l[0].posx = ((value >>  0) & 0x7ff);		/* GFXPOSX */
-        s->dispc.l[0].posy = ((value >> 16) & 0x7ff);		/* GFXPOSY */
+    case 0x088:    /* DISPC_GFX_POSITION */
+        s->dispc.l[0].posx = ((value >>  0) & 0x7ff);        /* GFXPOSX */
+        s->dispc.l[0].posy = ((value >> 16) & 0x7ff);        /* GFXPOSY */
         s->dispc.invalidate = 1;
         break;
-    case 0x08c:	/* DISPC_GFX_SIZE */
-        s->dispc.l[0].nx = ((value >>  0) & 0x7ff) + 1;		/* GFXSIZEX */
-        s->dispc.l[0].ny = ((value >> 16) & 0x7ff) + 1;		/* GFXSIZEY */
+    case 0x08c:    /* DISPC_GFX_SIZE */
+        s->dispc.l[0].nx = ((value >>  0) & 0x7ff) + 1;        /* GFXSIZEX */
+        s->dispc.l[0].ny = ((value >> 16) & 0x7ff) + 1;        /* GFXSIZEY */
         s->dispc.invalidate = 1;
         break;
-    case 0x0a0:	/* DISPC_GFX_ATTRIBUTES */
+    case 0x0a0:    /* DISPC_GFX_ATTRIBUTES */
         s->dispc.l[0].attr = value & 0x7ff;
         if (value & (3 << 9))
             fprintf(stderr, "%s: Big-endian pixel format not supported\n",
@@ -534,54 +534,54 @@ static void omap_disc_write(void *opaque, hwaddr addr,
         s->dispc.l[0].bpp = (value >> 1) & 0xf;
         s->dispc.invalidate = 1;
         break;
-    case 0x0a4:	/* DISPC_GFX_FIFO_TRESHOLD */
+    case 0x0a4:    /* DISPC_GFX_FIFO_TRESHOLD */
         s->dispc.l[0].tresh = value & 0x01ff01ff;
         break;
-    case 0x0ac:	/* DISPC_GFX_ROW_INC */
+    case 0x0ac:    /* DISPC_GFX_ROW_INC */
         s->dispc.l[0].rowinc = value;
         s->dispc.invalidate = 1;
         break;
-    case 0x0b0:	/* DISPC_GFX_PIXEL_INC */
+    case 0x0b0:    /* DISPC_GFX_PIXEL_INC */
         s->dispc.l[0].colinc = value;
         s->dispc.invalidate = 1;
         break;
-    case 0x0b4:	/* DISPC_GFX_WINDOW_SKIP */
+    case 0x0b4:    /* DISPC_GFX_WINDOW_SKIP */
         s->dispc.l[0].wininc = value;
         break;
-    case 0x0b8:	/* DISPC_GFX_TABLE_BA */
+    case 0x0b8:    /* DISPC_GFX_TABLE_BA */
         s->dispc.l[0].addr[2] = (hwaddr) value;
         s->dispc.invalidate = 1;
         break;
 
-    case 0x0bc:	/* DISPC_VID1_BA0 */
-    case 0x0c0:	/* DISPC_VID1_BA1 */
-    case 0x0c4:	/* DISPC_VID1_POSITION */
-    case 0x0c8:	/* DISPC_VID1_SIZE */
-    case 0x0cc:	/* DISPC_VID1_ATTRIBUTES */
-    case 0x0d0:	/* DISPC_VID1_FIFO_TRESHOLD */
-    case 0x0d8:	/* DISPC_VID1_ROW_INC */
-    case 0x0dc:	/* DISPC_VID1_PIXEL_INC */
-    case 0x0e0:	/* DISPC_VID1_FIR */
-    case 0x0e4:	/* DISPC_VID1_PICTURE_SIZE */
-    case 0x0e8:	/* DISPC_VID1_ACCU0 */
-    case 0x0ec:	/* DISPC_VID1_ACCU1 */
-    case 0x0f0 ... 0x140:	/* DISPC_VID1_FIR_COEF, DISPC_VID1_CONV_COEF */
-    case 0x14c:	/* DISPC_VID2_BA0 */
-    case 0x150:	/* DISPC_VID2_BA1 */
-    case 0x154:	/* DISPC_VID2_POSITION */
-    case 0x158:	/* DISPC_VID2_SIZE */
-    case 0x15c:	/* DISPC_VID2_ATTRIBUTES */
-    case 0x160:	/* DISPC_VID2_FIFO_TRESHOLD */
-    case 0x168:	/* DISPC_VID2_ROW_INC */
-    case 0x16c:	/* DISPC_VID2_PIXEL_INC */
-    case 0x170:	/* DISPC_VID2_FIR */
-    case 0x174:	/* DISPC_VID2_PICTURE_SIZE */
-    case 0x178:	/* DISPC_VID2_ACCU0 */
-    case 0x17c:	/* DISPC_VID2_ACCU1 */
-    case 0x180 ... 0x1d0:	/* DISPC_VID2_FIR_COEF, DISPC_VID2_CONV_COEF */
-    case 0x1d4:	/* DISPC_DATA_CYCLE1 */
-    case 0x1d8:	/* DISPC_DATA_CYCLE2 */
-    case 0x1dc:	/* DISPC_DATA_CYCLE3 */
+    case 0x0bc:    /* DISPC_VID1_BA0 */
+    case 0x0c0:    /* DISPC_VID1_BA1 */
+    case 0x0c4:    /* DISPC_VID1_POSITION */
+    case 0x0c8:    /* DISPC_VID1_SIZE */
+    case 0x0cc:    /* DISPC_VID1_ATTRIBUTES */
+    case 0x0d0:    /* DISPC_VID1_FIFO_TRESHOLD */
+    case 0x0d8:    /* DISPC_VID1_ROW_INC */
+    case 0x0dc:    /* DISPC_VID1_PIXEL_INC */
+    case 0x0e0:    /* DISPC_VID1_FIR */
+    case 0x0e4:    /* DISPC_VID1_PICTURE_SIZE */
+    case 0x0e8:    /* DISPC_VID1_ACCU0 */
+    case 0x0ec:    /* DISPC_VID1_ACCU1 */
+    case 0x0f0 ... 0x140:    /* DISPC_VID1_FIR_COEF, DISPC_VID1_CONV_COEF */
+    case 0x14c:    /* DISPC_VID2_BA0 */
+    case 0x150:    /* DISPC_VID2_BA1 */
+    case 0x154:    /* DISPC_VID2_POSITION */
+    case 0x158:    /* DISPC_VID2_SIZE */
+    case 0x15c:    /* DISPC_VID2_ATTRIBUTES */
+    case 0x160:    /* DISPC_VID2_FIFO_TRESHOLD */
+    case 0x168:    /* DISPC_VID2_ROW_INC */
+    case 0x16c:    /* DISPC_VID2_PIXEL_INC */
+    case 0x170:    /* DISPC_VID2_FIR */
+    case 0x174:    /* DISPC_VID2_PICTURE_SIZE */
+    case 0x178:    /* DISPC_VID2_ACCU0 */
+    case 0x17c:    /* DISPC_VID2_ACCU1 */
+    case 0x180 ... 0x1d0:    /* DISPC_VID2_FIR_COEF, DISPC_VID2_CONV_COEF */
+    case 0x1d4:    /* DISPC_DATA_CYCLE1 */
+    case 0x1d8:    /* DISPC_DATA_CYCLE2 */
+    case 0x1dc:    /* DISPC_DATA_CYCLE3 */
         break;
 
     default:
@@ -617,14 +617,14 @@ static void omap_rfbi_transfer_start(struct omap_dss_s *s)
     if (!s->rfbi.enable || s->rfbi.busy)
         return;
 
-    if (s->rfbi.control & (1 << 1)) {				/* BYPASS */
+    if (s->rfbi.control & (1 << 1)) {                /* BYPASS */
         /* TODO: in non-Bypass mode we probably need to just assert the
          * DRQ and wait for DMA to write the pixels.  */
         qemu_log_mask(LOG_UNIMP, "%s: Bypass mode unimplemented\n", __func__);
         return;
     }
 
-    if (!(s->dispc.control & (1 << 11)))			/* RFBIMODE */
+    if (!(s->dispc.control & (1 << 11)))            /* RFBIMODE */
         return;
     /* TODO: check that LCD output is enabled in DISPC.  */
 
@@ -665,7 +665,7 @@ static void omap_rfbi_transfer_start(struct omap_dss_s *s)
     omap_rfbi_transfer_stop(s);
 
     /* TODO */
-    s->dispc.irqst |= 1;					/* FRAMEDONE */
+    s->dispc.irqst |= 1;                    /* FRAMEDONE */
     omap_dispc_interrupt_update(s);
 }
 
@@ -679,57 +679,57 @@ static uint64_t omap_rfbi_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* RFBI_REVISION */
+    case 0x00:    /* RFBI_REVISION */
         return 0x10;
 
-    case 0x10:	/* RFBI_SYSCONFIG */
+    case 0x10:    /* RFBI_SYSCONFIG */
         return s->rfbi.idlemode;
 
-    case 0x14:	/* RFBI_SYSSTATUS */
-        return 1 | (s->rfbi.busy << 8);				/* RESETDONE */
+    case 0x14:    /* RFBI_SYSSTATUS */
+        return 1 | (s->rfbi.busy << 8);                /* RESETDONE */
 
-    case 0x40:	/* RFBI_CONTROL */
+    case 0x40:    /* RFBI_CONTROL */
         return s->rfbi.control;
 
-    case 0x44:	/* RFBI_PIXELCNT */
+    case 0x44:    /* RFBI_PIXELCNT */
         return s->rfbi.pixels;
 
-    case 0x48:	/* RFBI_LINE_NUMBER */
+    case 0x48:    /* RFBI_LINE_NUMBER */
         return s->rfbi.skiplines;
 
-    case 0x58:	/* RFBI_READ */
-    case 0x5c:	/* RFBI_STATUS */
+    case 0x58:    /* RFBI_READ */
+    case 0x5c:    /* RFBI_STATUS */
         return s->rfbi.rxbuf;
 
-    case 0x60:	/* RFBI_CONFIG0 */
+    case 0x60:    /* RFBI_CONFIG0 */
         return s->rfbi.config[0];
-    case 0x64:	/* RFBI_ONOFF_TIME0 */
+    case 0x64:    /* RFBI_ONOFF_TIME0 */
         return s->rfbi.time[0];
-    case 0x68:	/* RFBI_CYCLE_TIME0 */
+    case 0x68:    /* RFBI_CYCLE_TIME0 */
         return s->rfbi.time[1];
-    case 0x6c:	/* RFBI_DATA_CYCLE1_0 */
+    case 0x6c:    /* RFBI_DATA_CYCLE1_0 */
         return s->rfbi.data[0];
-    case 0x70:	/* RFBI_DATA_CYCLE2_0 */
+    case 0x70:    /* RFBI_DATA_CYCLE2_0 */
         return s->rfbi.data[1];
-    case 0x74:	/* RFBI_DATA_CYCLE3_0 */
+    case 0x74:    /* RFBI_DATA_CYCLE3_0 */
         return s->rfbi.data[2];
 
-    case 0x78:	/* RFBI_CONFIG1 */
+    case 0x78:    /* RFBI_CONFIG1 */
         return s->rfbi.config[1];
-    case 0x7c:	/* RFBI_ONOFF_TIME1 */
+    case 0x7c:    /* RFBI_ONOFF_TIME1 */
         return s->rfbi.time[2];
-    case 0x80:	/* RFBI_CYCLE_TIME1 */
+    case 0x80:    /* RFBI_CYCLE_TIME1 */
         return s->rfbi.time[3];
-    case 0x84:	/* RFBI_DATA_CYCLE1_1 */
+    case 0x84:    /* RFBI_DATA_CYCLE1_1 */
         return s->rfbi.data[3];
-    case 0x88:	/* RFBI_DATA_CYCLE2_1 */
+    case 0x88:    /* RFBI_DATA_CYCLE2_1 */
         return s->rfbi.data[4];
-    case 0x8c:	/* RFBI_DATA_CYCLE3_1 */
+    case 0x8c:    /* RFBI_DATA_CYCLE3_1 */
         return s->rfbi.data[5];
 
-    case 0x90:	/* RFBI_VSYNC_WIDTH */
+    case 0x90:    /* RFBI_VSYNC_WIDTH */
         return s->rfbi.vsync;
-    case 0x94:	/* RFBI_HSYNC_WIDTH */
+    case 0x94:    /* RFBI_HSYNC_WIDTH */
         return s->rfbi.hsync;
     }
     OMAP_BAD_REG(addr);
@@ -747,41 +747,41 @@ static void omap_rfbi_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x10:	/* RFBI_SYSCONFIG */
-        if (value & 2)						/* SOFTRESET */
+    case 0x10:    /* RFBI_SYSCONFIG */
+        if (value & 2)                        /* SOFTRESET */
             omap_rfbi_reset(s);
         s->rfbi.idlemode = value & 0x19;
         break;
 
-    case 0x40:	/* RFBI_CONTROL */
+    case 0x40:    /* RFBI_CONTROL */
         s->rfbi.control = value & 0xf;
         s->rfbi.enable = value & 1;
-        if (value & (1 << 4) &&					/* ITE */
+        if (value & (1 << 4) &&                    /* ITE */
                         !(s->rfbi.config[0] & s->rfbi.config[1] & 0xc))
             omap_rfbi_transfer_start(s);
         break;
 
-    case 0x44:	/* RFBI_PIXELCNT */
+    case 0x44:    /* RFBI_PIXELCNT */
         s->rfbi.pixels = value;
         break;
 
-    case 0x48:	/* RFBI_LINE_NUMBER */
+    case 0x48:    /* RFBI_LINE_NUMBER */
         s->rfbi.skiplines = value & 0x7ff;
         break;
 
-    case 0x4c:	/* RFBI_CMD */
+    case 0x4c:    /* RFBI_CMD */
         if ((s->rfbi.control & (1 << 2)) && s->rfbi.chip[0])
             s->rfbi.chip[0]->write(s->rfbi.chip[0]->opaque, 0, value & 0xffff);
         if ((s->rfbi.control & (1 << 3)) && s->rfbi.chip[1])
             s->rfbi.chip[1]->write(s->rfbi.chip[1]->opaque, 0, value & 0xffff);
         break;
-    case 0x50:	/* RFBI_PARAM */
+    case 0x50:    /* RFBI_PARAM */
         if ((s->rfbi.control & (1 << 2)) && s->rfbi.chip[0])
             s->rfbi.chip[0]->write(s->rfbi.chip[0]->opaque, 1, value & 0xffff);
         if ((s->rfbi.control & (1 << 3)) && s->rfbi.chip[1])
             s->rfbi.chip[1]->write(s->rfbi.chip[1]->opaque, 1, value & 0xffff);
         break;
-    case 0x54:	/* RFBI_DATA */
+    case 0x54:    /* RFBI_DATA */
         /* TODO: take into account the format set up in s->rfbi.config[?] and
          * s->rfbi.data[?], but special-case the most usual scenario so that
          * speed doesn't suffer.  */
@@ -796,7 +796,7 @@ static void omap_rfbi_write(void *opaque, hwaddr addr,
         if (!-- s->rfbi.pixels)
             omap_rfbi_transfer_stop(s);
         break;
-    case 0x58:	/* RFBI_READ */
+    case 0x58:    /* RFBI_READ */
         if ((s->rfbi.control & (1 << 2)) && s->rfbi.chip[0])
             s->rfbi.rxbuf = s->rfbi.chip[0]->read(s->rfbi.chip[0]->opaque, 1);
         else if ((s->rfbi.control & (1 << 3)) && s->rfbi.chip[1])
@@ -805,7 +805,7 @@ static void omap_rfbi_write(void *opaque, hwaddr addr,
             omap_rfbi_transfer_stop(s);
         break;
 
-    case 0x5c:	/* RFBI_STATUS */
+    case 0x5c:    /* RFBI_STATUS */
         if ((s->rfbi.control & (1 << 2)) && s->rfbi.chip[0])
             s->rfbi.rxbuf = s->rfbi.chip[0]->read(s->rfbi.chip[0]->opaque, 0);
         else if ((s->rfbi.control & (1 << 3)) && s->rfbi.chip[1])
@@ -814,49 +814,49 @@ static void omap_rfbi_write(void *opaque, hwaddr addr,
             omap_rfbi_transfer_stop(s);
         break;
 
-    case 0x60:	/* RFBI_CONFIG0 */
+    case 0x60:    /* RFBI_CONFIG0 */
         s->rfbi.config[0] = value & 0x003f1fff;
         break;
 
-    case 0x64:	/* RFBI_ONOFF_TIME0 */
+    case 0x64:    /* RFBI_ONOFF_TIME0 */
         s->rfbi.time[0] = value & 0x3fffffff;
         break;
-    case 0x68:	/* RFBI_CYCLE_TIME0 */
+    case 0x68:    /* RFBI_CYCLE_TIME0 */
         s->rfbi.time[1] = value & 0x0fffffff;
         break;
-    case 0x6c:	/* RFBI_DATA_CYCLE1_0 */
+    case 0x6c:    /* RFBI_DATA_CYCLE1_0 */
         s->rfbi.data[0] = value & 0x0f1f0f1f;
         break;
-    case 0x70:	/* RFBI_DATA_CYCLE2_0 */
+    case 0x70:    /* RFBI_DATA_CYCLE2_0 */
         s->rfbi.data[1] = value & 0x0f1f0f1f;
         break;
-    case 0x74:	/* RFBI_DATA_CYCLE3_0 */
+    case 0x74:    /* RFBI_DATA_CYCLE3_0 */
         s->rfbi.data[2] = value & 0x0f1f0f1f;
         break;
-    case 0x78:	/* RFBI_CONFIG1 */
+    case 0x78:    /* RFBI_CONFIG1 */
         s->rfbi.config[1] = value & 0x003f1fff;
         break;
 
-    case 0x7c:	/* RFBI_ONOFF_TIME1 */
+    case 0x7c:    /* RFBI_ONOFF_TIME1 */
         s->rfbi.time[2] = value & 0x3fffffff;
         break;
-    case 0x80:	/* RFBI_CYCLE_TIME1 */
+    case 0x80:    /* RFBI_CYCLE_TIME1 */
         s->rfbi.time[3] = value & 0x0fffffff;
         break;
-    case 0x84:	/* RFBI_DATA_CYCLE1_1 */
+    case 0x84:    /* RFBI_DATA_CYCLE1_1 */
         s->rfbi.data[3] = value & 0x0f1f0f1f;
         break;
-    case 0x88:	/* RFBI_DATA_CYCLE2_1 */
+    case 0x88:    /* RFBI_DATA_CYCLE2_1 */
         s->rfbi.data[4] = value & 0x0f1f0f1f;
         break;
-    case 0x8c:	/* RFBI_DATA_CYCLE3_1 */
+    case 0x8c:    /* RFBI_DATA_CYCLE3_1 */
         s->rfbi.data[5] = value & 0x0f1f0f1f;
         break;
 
-    case 0x90:	/* RFBI_VSYNC_WIDTH */
+    case 0x90:    /* RFBI_VSYNC_WIDTH */
         s->rfbi.vsync = value & 0xffff;
         break;
-    case 0x94:	/* RFBI_HSYNC_WIDTH */
+    case 0x94:    /* RFBI_HSYNC_WIDTH */
         s->rfbi.hsync = value & 0xffff;
         break;
 
@@ -879,49 +879,49 @@ static uint64_t omap_venc_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x00:	/* REV_ID */
-    case 0x04:	/* STATUS */
-    case 0x08:	/* F_CONTROL */
-    case 0x10:	/* VIDOUT_CTRL */
-    case 0x14:	/* SYNC_CTRL */
-    case 0x1c:	/* LLEN */
-    case 0x20:	/* FLENS */
-    case 0x24:	/* HFLTR_CTRL */
-    case 0x28:	/* CC_CARR_WSS_CARR */
-    case 0x2c:	/* C_PHASE */
-    case 0x30:	/* GAIN_U */
-    case 0x34:	/* GAIN_V */
-    case 0x38:	/* GAIN_Y */
-    case 0x3c:	/* BLACK_LEVEL */
-    case 0x40:	/* BLANK_LEVEL */
-    case 0x44:	/* X_COLOR */
-    case 0x48:	/* M_CONTROL */
-    case 0x4c:	/* BSTAMP_WSS_DATA */
-    case 0x50:	/* S_CARR */
-    case 0x54:	/* LINE21 */
-    case 0x58:	/* LN_SEL */
-    case 0x5c:	/* L21__WC_CTL */
-    case 0x60:	/* HTRIGGER_VTRIGGER */
-    case 0x64:	/* SAVID__EAVID */
-    case 0x68:	/* FLEN__FAL */
-    case 0x6c:	/* LAL__PHASE_RESET */
-    case 0x70:	/* HS_INT_START_STOP_X */
-    case 0x74:	/* HS_EXT_START_STOP_X */
-    case 0x78:	/* VS_INT_START_X */
-    case 0x7c:	/* VS_INT_STOP_X__VS_INT_START_Y */
-    case 0x80:	/* VS_INT_STOP_Y__VS_INT_START_X */
-    case 0x84:	/* VS_EXT_STOP_X__VS_EXT_START_Y */
-    case 0x88:	/* VS_EXT_STOP_Y */
-    case 0x90:	/* AVID_START_STOP_X */
-    case 0x94:	/* AVID_START_STOP_Y */
-    case 0xa0:	/* FID_INT_START_X__FID_INT_START_Y */
-    case 0xa4:	/* FID_INT_OFFSET_Y__FID_EXT_START_X */
-    case 0xa8:	/* FID_EXT_START_Y__FID_EXT_OFFSET_Y */
-    case 0xb0:	/* TVDETGP_INT_START_STOP_X */
-    case 0xb4:	/* TVDETGP_INT_START_STOP_Y */
-    case 0xb8:	/* GEN_CTRL */
-    case 0xc4:	/* DAC_TST__DAC_A */
-    case 0xc8:	/* DAC_B__DAC_C */
+    case 0x00:    /* REV_ID */
+    case 0x04:    /* STATUS */
+    case 0x08:    /* F_CONTROL */
+    case 0x10:    /* VIDOUT_CTRL */
+    case 0x14:    /* SYNC_CTRL */
+    case 0x1c:    /* LLEN */
+    case 0x20:    /* FLENS */
+    case 0x24:    /* HFLTR_CTRL */
+    case 0x28:    /* CC_CARR_WSS_CARR */
+    case 0x2c:    /* C_PHASE */
+    case 0x30:    /* GAIN_U */
+    case 0x34:    /* GAIN_V */
+    case 0x38:    /* GAIN_Y */
+    case 0x3c:    /* BLACK_LEVEL */
+    case 0x40:    /* BLANK_LEVEL */
+    case 0x44:    /* X_COLOR */
+    case 0x48:    /* M_CONTROL */
+    case 0x4c:    /* BSTAMP_WSS_DATA */
+    case 0x50:    /* S_CARR */
+    case 0x54:    /* LINE21 */
+    case 0x58:    /* LN_SEL */
+    case 0x5c:    /* L21__WC_CTL */
+    case 0x60:    /* HTRIGGER_VTRIGGER */
+    case 0x64:    /* SAVID__EAVID */
+    case 0x68:    /* FLEN__FAL */
+    case 0x6c:    /* LAL__PHASE_RESET */
+    case 0x70:    /* HS_INT_START_STOP_X */
+    case 0x74:    /* HS_EXT_START_STOP_X */
+    case 0x78:    /* VS_INT_START_X */
+    case 0x7c:    /* VS_INT_STOP_X__VS_INT_START_Y */
+    case 0x80:    /* VS_INT_STOP_Y__VS_INT_START_X */
+    case 0x84:    /* VS_EXT_STOP_X__VS_EXT_START_Y */
+    case 0x88:    /* VS_EXT_STOP_Y */
+    case 0x90:    /* AVID_START_STOP_X */
+    case 0x94:    /* AVID_START_STOP_Y */
+    case 0xa0:    /* FID_INT_START_X__FID_INT_START_Y */
+    case 0xa4:    /* FID_INT_OFFSET_Y__FID_EXT_START_X */
+    case 0xa8:    /* FID_EXT_START_Y__FID_EXT_OFFSET_Y */
+    case 0xb0:    /* TVDETGP_INT_START_STOP_X */
+    case 0xb4:    /* TVDETGP_INT_START_STOP_Y */
+    case 0xb8:    /* GEN_CTRL */
+    case 0xc4:    /* DAC_TST__DAC_A */
+    case 0xc8:    /* DAC_B__DAC_C */
         return 0;
 
     default:
@@ -940,47 +940,47 @@ static void omap_venc_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x08:	/* F_CONTROL */
-    case 0x10:	/* VIDOUT_CTRL */
-    case 0x14:	/* SYNC_CTRL */
-    case 0x1c:	/* LLEN */
-    case 0x20:	/* FLENS */
-    case 0x24:	/* HFLTR_CTRL */
-    case 0x28:	/* CC_CARR_WSS_CARR */
-    case 0x2c:	/* C_PHASE */
-    case 0x30:	/* GAIN_U */
-    case 0x34:	/* GAIN_V */
-    case 0x38:	/* GAIN_Y */
-    case 0x3c:	/* BLACK_LEVEL */
-    case 0x40:	/* BLANK_LEVEL */
-    case 0x44:	/* X_COLOR */
-    case 0x48:	/* M_CONTROL */
-    case 0x4c:	/* BSTAMP_WSS_DATA */
-    case 0x50:	/* S_CARR */
-    case 0x54:	/* LINE21 */
-    case 0x58:	/* LN_SEL */
-    case 0x5c:	/* L21__WC_CTL */
-    case 0x60:	/* HTRIGGER_VTRIGGER */
-    case 0x64:	/* SAVID__EAVID */
-    case 0x68:	/* FLEN__FAL */
-    case 0x6c:	/* LAL__PHASE_RESET */
-    case 0x70:	/* HS_INT_START_STOP_X */
-    case 0x74:	/* HS_EXT_START_STOP_X */
-    case 0x78:	/* VS_INT_START_X */
-    case 0x7c:	/* VS_INT_STOP_X__VS_INT_START_Y */
-    case 0x80:	/* VS_INT_STOP_Y__VS_INT_START_X */
-    case 0x84:	/* VS_EXT_STOP_X__VS_EXT_START_Y */
-    case 0x88:	/* VS_EXT_STOP_Y */
-    case 0x90:	/* AVID_START_STOP_X */
-    case 0x94:	/* AVID_START_STOP_Y */
-    case 0xa0:	/* FID_INT_START_X__FID_INT_START_Y */
-    case 0xa4:	/* FID_INT_OFFSET_Y__FID_EXT_START_X */
-    case 0xa8:	/* FID_EXT_START_Y__FID_EXT_OFFSET_Y */
-    case 0xb0:	/* TVDETGP_INT_START_STOP_X */
-    case 0xb4:	/* TVDETGP_INT_START_STOP_Y */
-    case 0xb8:	/* GEN_CTRL */
-    case 0xc4:	/* DAC_TST__DAC_A */
-    case 0xc8:	/* DAC_B__DAC_C */
+    case 0x08:    /* F_CONTROL */
+    case 0x10:    /* VIDOUT_CTRL */
+    case 0x14:    /* SYNC_CTRL */
+    case 0x1c:    /* LLEN */
+    case 0x20:    /* FLENS */
+    case 0x24:    /* HFLTR_CTRL */
+    case 0x28:    /* CC_CARR_WSS_CARR */
+    case 0x2c:    /* C_PHASE */
+    case 0x30:    /* GAIN_U */
+    case 0x34:    /* GAIN_V */
+    case 0x38:    /* GAIN_Y */
+    case 0x3c:    /* BLACK_LEVEL */
+    case 0x40:    /* BLANK_LEVEL */
+    case 0x44:    /* X_COLOR */
+    case 0x48:    /* M_CONTROL */
+    case 0x4c:    /* BSTAMP_WSS_DATA */
+    case 0x50:    /* S_CARR */
+    case 0x54:    /* LINE21 */
+    case 0x58:    /* LN_SEL */
+    case 0x5c:    /* L21__WC_CTL */
+    case 0x60:    /* HTRIGGER_VTRIGGER */
+    case 0x64:    /* SAVID__EAVID */
+    case 0x68:    /* FLEN__FAL */
+    case 0x6c:    /* LAL__PHASE_RESET */
+    case 0x70:    /* HS_INT_START_STOP_X */
+    case 0x74:    /* HS_EXT_START_STOP_X */
+    case 0x78:    /* VS_INT_START_X */
+    case 0x7c:    /* VS_INT_STOP_X__VS_INT_START_Y */
+    case 0x80:    /* VS_INT_STOP_Y__VS_INT_START_X */
+    case 0x84:    /* VS_EXT_STOP_X__VS_EXT_START_Y */
+    case 0x88:    /* VS_EXT_STOP_Y */
+    case 0x90:    /* AVID_START_STOP_X */
+    case 0x94:    /* AVID_START_STOP_Y */
+    case 0xa0:    /* FID_INT_START_X__FID_INT_START_Y */
+    case 0xa4:    /* FID_INT_OFFSET_Y__FID_EXT_START_X */
+    case 0xa8:    /* FID_EXT_START_Y__FID_EXT_OFFSET_Y */
+    case 0xb0:    /* TVDETGP_INT_START_STOP_X */
+    case 0xb4:    /* TVDETGP_INT_START_STOP_Y */
+    case 0xb8:    /* GEN_CTRL */
+    case 0xc4:    /* DAC_TST__DAC_A */
+    case 0xc8:    /* DAC_B__DAC_C */
         break;
 
     default:
@@ -1002,15 +1002,15 @@ static uint64_t omap_im3_read(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x0a8:	/* SBIMERRLOGA */
-    case 0x0b0:	/* SBIMERRLOG */
-    case 0x190:	/* SBIMSTATE */
-    case 0x198:	/* SBTMSTATE_L */
-    case 0x19c:	/* SBTMSTATE_H */
-    case 0x1a8:	/* SBIMCONFIG_L */
-    case 0x1ac:	/* SBIMCONFIG_H */
-    case 0x1f8:	/* SBID_L */
-    case 0x1fc:	/* SBID_H */
+    case 0x0a8:    /* SBIMERRLOGA */
+    case 0x0b0:    /* SBIMERRLOG */
+    case 0x190:    /* SBIMSTATE */
+    case 0x198:    /* SBTMSTATE_L */
+    case 0x19c:    /* SBTMSTATE_H */
+    case 0x1a8:    /* SBIMCONFIG_L */
+    case 0x1ac:    /* SBIMCONFIG_H */
+    case 0x1f8:    /* SBID_L */
+    case 0x1fc:    /* SBID_H */
         return 0;
 
     default:
@@ -1029,12 +1029,12 @@ static void omap_im3_write(void *opaque, hwaddr addr,
     }
 
     switch (addr) {
-    case 0x0b0:	/* SBIMERRLOG */
-    case 0x190:	/* SBIMSTATE */
-    case 0x198:	/* SBTMSTATE_L */
-    case 0x19c:	/* SBTMSTATE_H */
-    case 0x1a8:	/* SBIMCONFIG_L */
-    case 0x1ac:	/* SBIMCONFIG_H */
+    case 0x0b0:    /* SBIMERRLOG */
+    case 0x190:    /* SBIMSTATE */
+    case 0x198:    /* SBTMSTATE_L */
+    case 0x19c:    /* SBTMSTATE_H */
+    case 0x1a8:    /* SBIMCONFIG_L */
+    case 0x1ac:    /* SBIMCONFIG_H */
         break;
 
     default:
diff --git a/hw/display/omap_lcdc.c b/hw/display/omap_lcdc.c
index 0ba42ef637..79a8f2ef6b 100644
--- a/hw/display/omap_lcdc.c
+++ b/hw/display/omap_lcdc.c
@@ -382,24 +382,24 @@ static uint64_t omap_lcdc_read(void *opaque, hwaddr addr,
     struct omap_lcd_panel_s *s = (struct omap_lcd_panel_s *) opaque;
 
     switch (addr) {
-    case 0x00:	/* LCD_CONTROL */
+    case 0x00:    /* LCD_CONTROL */
         return (s->tft << 23) | (s->plm << 20) |
                 (s->tft << 7) | (s->interrupts << 3) |
                 (s->mono << 1) | s->enable | s->ctrl | 0xfe000c34;
 
-    case 0x04:	/* LCD_TIMING0 */
+    case 0x04:    /* LCD_TIMING0 */
         return (s->timing[0] << 10) | (s->width - 1) | 0x0000000f;
 
-    case 0x08:	/* LCD_TIMING1 */
+    case 0x08:    /* LCD_TIMING1 */
         return (s->timing[1] << 10) | (s->height - 1);
 
-    case 0x0c:	/* LCD_TIMING2 */
+    case 0x0c:    /* LCD_TIMING2 */
         return s->timing[2] | 0xfc000000;
 
-    case 0x10:	/* LCD_STATUS */
+    case 0x10:    /* LCD_STATUS */
         return (s->palette_done << 6) | (s->sync_error << 2) | s->frame_done;
 
-    case 0x14:	/* LCD_SUBPANEL */
+    case 0x14:    /* LCD_SUBPANEL */
         return s->subpanel;
 
     default:
@@ -415,7 +415,7 @@ static void omap_lcdc_write(void *opaque, hwaddr addr,
     struct omap_lcd_panel_s *s = (struct omap_lcd_panel_s *) opaque;
 
     switch (addr) {
-    case 0x00:	/* LCD_CONTROL */
+    case 0x00:    /* LCD_CONTROL */
         s->plm = (value >> 20) & 3;
         s->tft = (value >> 7) & 1;
         s->interrupts = (value >> 3) & 3;
@@ -427,24 +427,24 @@ static void omap_lcdc_write(void *opaque, hwaddr addr,
         }
         break;
 
-    case 0x04:	/* LCD_TIMING0 */
+    case 0x04:    /* LCD_TIMING0 */
         s->timing[0] = value >> 10;
         s->width = (value & 0x3ff) + 1;
         break;
 
-    case 0x08:	/* LCD_TIMING1 */
+    case 0x08:    /* LCD_TIMING1 */
         s->timing[1] = value >> 10;
         s->height = (value & 0x3ff) + 1;
         break;
 
-    case 0x0c:	/* LCD_TIMING2 */
+    case 0x0c:    /* LCD_TIMING2 */
         s->timing[2] = value;
         break;
 
-    case 0x10:	/* LCD_STATUS */
+    case 0x10:    /* LCD_STATUS */
         break;
 
-    case 0x14:	/* LCD_SUBPANEL */
+    case 0x14:    /* LCD_SUBPANEL */
         s->subpanel = value & 0xa1ffffff;
         break;
 
diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index 7859c5d1cd..4904265c49 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -86,106 +86,106 @@ typedef struct QEMU_PACKED {
     uint32_t ldcmd;
 } PXAFrameDescriptor;
 
-#define LCCR0	0x000	/* LCD Controller Control register 0 */
-#define LCCR1	0x004	/* LCD Controller Control register 1 */
-#define LCCR2	0x008	/* LCD Controller Control register 2 */
-#define LCCR3	0x00c	/* LCD Controller Control register 3 */
-#define LCCR4	0x010	/* LCD Controller Control register 4 */
-#define LCCR5	0x014	/* LCD Controller Control register 5 */
-
-#define FBR0	0x020	/* DMA Channel 0 Frame Branch register */
-#define FBR1	0x024	/* DMA Channel 1 Frame Branch register */
-#define FBR2	0x028	/* DMA Channel 2 Frame Branch register */
-#define FBR3	0x02c	/* DMA Channel 3 Frame Branch register */
-#define FBR4	0x030	/* DMA Channel 4 Frame Branch register */
-#define FBR5	0x110	/* DMA Channel 5 Frame Branch register */
-#define FBR6	0x114	/* DMA Channel 6 Frame Branch register */
-
-#define LCSR1	0x034	/* LCD Controller Status register 1 */
-#define LCSR0	0x038	/* LCD Controller Status register 0 */
-#define LIIDR	0x03c	/* LCD Controller Interrupt ID register */
-
-#define TRGBR	0x040	/* TMED RGB Seed register */
-#define TCR	0x044	/* TMED Control register */
-
-#define OVL1C1	0x050	/* Overlay 1 Control register 1 */
-#define OVL1C2	0x060	/* Overlay 1 Control register 2 */
-#define OVL2C1	0x070	/* Overlay 2 Control register 1 */
-#define OVL2C2	0x080	/* Overlay 2 Control register 2 */
-#define CCR	0x090	/* Cursor Control register */
-
-#define CMDCR	0x100	/* Command Control register */
-#define PRSR	0x104	/* Panel Read Status register */
-
-#define PXA_LCDDMA_CHANS	7
-#define DMA_FDADR		0x00	/* Frame Descriptor Address register */
-#define DMA_FSADR		0x04	/* Frame Source Address register */
-#define DMA_FIDR		0x08	/* Frame ID register */
-#define DMA_LDCMD		0x0c	/* Command register */
+#define LCCR0    0x000    /* LCD Controller Control register 0 */
+#define LCCR1    0x004    /* LCD Controller Control register 1 */
+#define LCCR2    0x008    /* LCD Controller Control register 2 */
+#define LCCR3    0x00c    /* LCD Controller Control register 3 */
+#define LCCR4    0x010    /* LCD Controller Control register 4 */
+#define LCCR5    0x014    /* LCD Controller Control register 5 */
+
+#define FBR0    0x020    /* DMA Channel 0 Frame Branch register */
+#define FBR1    0x024    /* DMA Channel 1 Frame Branch register */
+#define FBR2    0x028    /* DMA Channel 2 Frame Branch register */
+#define FBR3    0x02c    /* DMA Channel 3 Frame Branch register */
+#define FBR4    0x030    /* DMA Channel 4 Frame Branch register */
+#define FBR5    0x110    /* DMA Channel 5 Frame Branch register */
+#define FBR6    0x114    /* DMA Channel 6 Frame Branch register */
+
+#define LCSR1    0x034    /* LCD Controller Status register 1 */
+#define LCSR0    0x038    /* LCD Controller Status register 0 */
+#define LIIDR    0x03c    /* LCD Controller Interrupt ID register */
+
+#define TRGBR    0x040    /* TMED RGB Seed register */
+#define TCR      0x044    /* TMED Control register */
+
+#define OVL1C1    0x050    /* Overlay 1 Control register 1 */
+#define OVL1C2    0x060    /* Overlay 1 Control register 2 */
+#define OVL2C1    0x070    /* Overlay 2 Control register 1 */
+#define OVL2C2    0x080    /* Overlay 2 Control register 2 */
+#define CCR       0x090    /* Cursor Control register */
+
+#define CMDCR    0x100    /* Command Control register */
+#define PRSR     0x104    /* Panel Read Status register */
+
+#define PXA_LCDDMA_CHANS    7
+#define DMA_FDADR        0x00    /* Frame Descriptor Address register */
+#define DMA_FSADR        0x04    /* Frame Source Address register */
+#define DMA_FIDR         0x08    /* Frame ID register */
+#define DMA_LDCMD        0x0c    /* Command register */
 
 /* LCD Buffer Strength Control register */
-#define BSCNTR	0x04000054
+#define BSCNTR    0x04000054
 
 /* Bitfield masks */
-#define LCCR0_ENB	(1 << 0)
-#define LCCR0_CMS	(1 << 1)
-#define LCCR0_SDS	(1 << 2)
-#define LCCR0_LDM	(1 << 3)
-#define LCCR0_SOFM0	(1 << 4)
-#define LCCR0_IUM	(1 << 5)
-#define LCCR0_EOFM0	(1 << 6)
-#define LCCR0_PAS	(1 << 7)
-#define LCCR0_DPD	(1 << 9)
-#define LCCR0_DIS	(1 << 10)
-#define LCCR0_QDM	(1 << 11)
-#define LCCR0_PDD	(0xff << 12)
-#define LCCR0_BSM0	(1 << 20)
-#define LCCR0_OUM	(1 << 21)
-#define LCCR0_LCDT	(1 << 22)
-#define LCCR0_RDSTM	(1 << 23)
-#define LCCR0_CMDIM	(1 << 24)
-#define LCCR0_OUC	(1 << 25)
-#define LCCR0_LDDALT	(1 << 26)
-#define LCCR1_PPL(x)	((x) & 0x3ff)
-#define LCCR2_LPP(x)	((x) & 0x3ff)
-#define LCCR3_API	(15 << 16)
-#define LCCR3_BPP(x)	((((x) >> 24) & 7) | (((x) >> 26) & 8))
-#define LCCR3_PDFOR(x)	(((x) >> 30) & 3)
-#define LCCR4_K1(x)	(((x) >> 0) & 7)
-#define LCCR4_K2(x)	(((x) >> 3) & 7)
-#define LCCR4_K3(x)	(((x) >> 6) & 7)
-#define LCCR4_PALFOR(x)	(((x) >> 15) & 3)
-#define LCCR5_SOFM(ch)	(1 << (ch - 1))
-#define LCCR5_EOFM(ch)	(1 << (ch + 7))
-#define LCCR5_BSM(ch)	(1 << (ch + 15))
-#define LCCR5_IUM(ch)	(1 << (ch + 23))
-#define OVLC1_EN	(1 << 31)
-#define CCR_CEN		(1 << 31)
-#define FBR_BRA		(1 << 0)
-#define FBR_BINT	(1 << 1)
-#define FBR_SRCADDR	(0xfffffff << 4)
-#define LCSR0_LDD	(1 << 0)
-#define LCSR0_SOF0	(1 << 1)
-#define LCSR0_BER	(1 << 2)
-#define LCSR0_ABC	(1 << 3)
-#define LCSR0_IU0	(1 << 4)
-#define LCSR0_IU1	(1 << 5)
-#define LCSR0_OU	(1 << 6)
-#define LCSR0_QD	(1 << 7)
-#define LCSR0_EOF0	(1 << 8)
-#define LCSR0_BS0	(1 << 9)
-#define LCSR0_SINT	(1 << 10)
-#define LCSR0_RDST	(1 << 11)
-#define LCSR0_CMDINT	(1 << 12)
-#define LCSR0_BERCH(x)	(((x) & 7) << 28)
-#define LCSR1_SOF(ch)	(1 << (ch - 1))
-#define LCSR1_EOF(ch)	(1 << (ch + 7))
-#define LCSR1_BS(ch)	(1 << (ch + 15))
-#define LCSR1_IU(ch)	(1 << (ch + 23))
-#define LDCMD_LENGTH(x)	((x) & 0x001ffffc)
-#define LDCMD_EOFINT	(1 << 21)
-#define LDCMD_SOFINT	(1 << 22)
-#define LDCMD_PAL	(1 << 26)
+#define LCCR0_ENB         (1 << 0)
+#define LCCR0_CMS         (1 << 1)
+#define LCCR0_SDS         (1 << 2)
+#define LCCR0_LDM         (1 << 3)
+#define LCCR0_SOFM0       (1 << 4)
+#define LCCR0_IUM         (1 << 5)
+#define LCCR0_EOFM0       (1 << 6)
+#define LCCR0_PAS         (1 << 7)
+#define LCCR0_DPD         (1 << 9)
+#define LCCR0_DIS         (1 << 10)
+#define LCCR0_QDM         (1 << 11)
+#define LCCR0_PDD         (0xff << 12)
+#define LCCR0_BSM0        (1 << 20)
+#define LCCR0_OUM         (1 << 21)
+#define LCCR0_LCDT        (1 << 22)
+#define LCCR0_RDSTM       (1 << 23)
+#define LCCR0_CMDIM       (1 << 24)
+#define LCCR0_OUC         (1 << 25)
+#define LCCR0_LDDALT      (1 << 26)
+#define LCCR1_PPL(x)      ((x) & 0x3ff)
+#define LCCR2_LPP(x)      ((x) & 0x3ff)
+#define LCCR3_API         (15 << 16)
+#define LCCR3_BPP(x)      ((((x) >> 24) & 7) | (((x) >> 26) & 8))
+#define LCCR3_PDFOR(x)    (((x) >> 30) & 3)
+#define LCCR4_K1(x)       (((x) >> 0) & 7)
+#define LCCR4_K2(x)       (((x) >> 3) & 7)
+#define LCCR4_K3(x)       (((x) >> 6) & 7)
+#define LCCR4_PALFOR(x)   (((x) >> 15) & 3)
+#define LCCR5_SOFM(ch)    (1 << (ch - 1))
+#define LCCR5_EOFM(ch)    (1 << (ch + 7))
+#define LCCR5_BSM(ch)     (1 << (ch + 15))
+#define LCCR5_IUM(ch)     (1 << (ch + 23))
+#define OVLC1_EN          (1 << 31)
+#define CCR_CEN           (1 << 31)
+#define FBR_BRA           (1 << 0)
+#define FBR_BINT          (1 << 1)
+#define FBR_SRCADDR       (0xfffffff << 4)
+#define LCSR0_LDD         (1 << 0)
+#define LCSR0_SOF0        (1 << 1)
+#define LCSR0_BER         (1 << 2)
+#define LCSR0_ABC         (1 << 3)
+#define LCSR0_IU0         (1 << 4)
+#define LCSR0_IU1         (1 << 5)
+#define LCSR0_OU          (1 << 6)
+#define LCSR0_QD          (1 << 7)
+#define LCSR0_EOF0        (1 << 8)
+#define LCSR0_BS0         (1 << 9)
+#define LCSR0_SINT        (1 << 10)
+#define LCSR0_RDST        (1 << 11)
+#define LCSR0_CMDINT      (1 << 12)
+#define LCSR0_BERCH(x)    (((x) & 7) << 28)
+#define LCSR1_SOF(ch)     (1 << (ch - 1))
+#define LCSR1_EOF(ch)     (1 << (ch + 7))
+#define LCSR1_BS(ch)      (1 << (ch + 15))
+#define LCSR1_IU(ch)      (1 << (ch + 23))
+#define LDCMD_LENGTH(x)   ((x) & 0x001ffffc)
+#define LDCMD_EOFINT      (1 << 21)
+#define LDCMD_SOFINT      (1 << 22)
+#define LDCMD_PAL         (1 << 26)
 
 /* Size of a pixel in the QEMU UI output surface, in bytes */
 #define DEST_PIXEL_WIDTH 4
@@ -788,7 +788,7 @@ static uint64_t pxa2xx_lcdc_read(void *opaque, hwaddr offset,
     case TCR:
         return s->tcr;
 
-    case 0x200 ... 0x1000:	/* DMA per-channel registers */
+    case 0x200 ... 0x1000:    /* DMA per-channel registers */
         ch = (offset - 0x200) >> 4;
         if (!(ch >= 0 && ch < PXA_LCDDMA_CHANS))
             goto fail;
@@ -938,7 +938,7 @@ static void pxa2xx_lcdc_write(void *opaque, hwaddr offset,
         s->tcr = value & 0x7fff;
         break;
 
-    case 0x200 ... 0x1000:	/* DMA per-channel registers */
+    case 0x200 ... 0x1000:    /* DMA per-channel registers */
         ch = (offset - 0x200) >> 4;
         if (!(ch >= 0 && ch < PXA_LCDDMA_CHANS))
             goto fail;
diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index c7beba453b..478bc35c60 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -22,42 +22,42 @@
 #include "ui/pixel_ops.h"
 #include "sysemu/blockdev.h"
 
-#define IRQ_TC6393_NAND		0
-#define IRQ_TC6393_MMC		1
-#define IRQ_TC6393_OHCI		2
-#define IRQ_TC6393_SERIAL	3
-#define IRQ_TC6393_FB		4
-
-#define	TC6393XB_NR_IRQS	8
-
-#define TC6393XB_GPIOS  16
-
-#define SCR_REVID	0x08		/* b Revision ID	*/
-#define SCR_ISR		0x50		/* b Interrupt Status	*/
-#define SCR_IMR		0x52		/* b Interrupt Mask	*/
-#define SCR_IRR		0x54		/* b Interrupt Routing	*/
-#define SCR_GPER	0x60		/* w GP Enable		*/
-#define SCR_GPI_SR(i)	(0x64 + (i))	/* b3 GPI Status	*/
-#define SCR_GPI_IMR(i)	(0x68 + (i))	/* b3 GPI INT Mask	*/
-#define SCR_GPI_EDER(i)	(0x6c + (i))	/* b3 GPI Edge Detect Enable */
-#define SCR_GPI_LIR(i)	(0x70 + (i))	/* b3 GPI Level Invert	*/
-#define SCR_GPO_DSR(i)	(0x78 + (i))	/* b3 GPO Data Set	*/
-#define SCR_GPO_DOECR(i) (0x7c + (i))	/* b3 GPO Data OE Control */
-#define SCR_GP_IARCR(i)	(0x80 + (i))	/* b3 GP Internal Active Register Control */
-#define SCR_GP_IARLCR(i) (0x84 + (i))	/* b3 GP INTERNAL Active Register Level Control */
-#define SCR_GPI_BCR(i)	(0x88 + (i))	/* b3 GPI Buffer Control */
-#define SCR_GPA_IARCR	0x8c		/* w GPa Internal Active Register Control */
-#define SCR_GPA_IARLCR	0x90		/* w GPa Internal Active Register Level Control */
-#define SCR_GPA_BCR	0x94		/* w GPa Buffer Control */
-#define SCR_CCR		0x98		/* w Clock Control	*/
-#define SCR_PLL2CR	0x9a		/* w PLL2 Control	*/
-#define SCR_PLL1CR	0x9c		/* l PLL1 Control	*/
-#define SCR_DIARCR	0xa0		/* b Device Internal Active Register Control */
-#define SCR_DBOCR	0xa1		/* b Device Buffer Off Control */
-#define SCR_FER		0xe0		/* b Function Enable	*/
-#define SCR_MCR		0xe4		/* w Mode Control	*/
-#define SCR_CONFIG	0xfc		/* b Configuration Control */
-#define SCR_DEBUG	0xff		/* b Debug		*/
+#define IRQ_TC6393_NAND     0
+#define IRQ_TC6393_MMC      1
+#define IRQ_TC6393_OHCI     2
+#define IRQ_TC6393_SERIAL   3
+#define IRQ_TC6393_FB       4
+
+#define TC6393XB_NR_IRQS    8
+
+#define TC6393XB_GPIOS      16
+
+#define SCR_REVID         0x08        /* b Revision ID    */
+#define SCR_ISR           0x50        /* b Interrupt Status    */
+#define SCR_IMR           0x52        /* b Interrupt Mask    */
+#define SCR_IRR           0x54        /* b Interrupt Routing    */
+#define SCR_GPER          0x60        /* w GP Enable        */
+#define SCR_GPI_SR(i)     (0x64 + (i))    /* b3 GPI Status    */
+#define SCR_GPI_IMR(i)    (0x68 + (i))    /* b3 GPI INT Mask    */
+#define SCR_GPI_EDER(i)   (0x6c + (i))    /* b3 GPI Edge Detect Enable */
+#define SCR_GPI_LIR(i)    (0x70 + (i))    /* b3 GPI Level Invert    */
+#define SCR_GPO_DSR(i)    (0x78 + (i))    /* b3 GPO Data Set    */
+#define SCR_GPO_DOECR(i)  (0x7c + (i))    /* b3 GPO Data OE Control */
+#define SCR_GP_IARCR(i)   (0x80 + (i))    /* b3 GP Internal Active Register Control */
+#define SCR_GP_IARLCR(i)  (0x84 + (i))    /* b3 GP INTERNAL Active Register Level Control */
+#define SCR_GPI_BCR(i)    (0x88 + (i))    /* b3 GPI Buffer Control */
+#define SCR_GPA_IARCR     0x8c        /* w GPa Internal Active Register Control */
+#define SCR_GPA_IARLCR    0x90        /* w GPa Internal Active Register Level Control */
+#define SCR_GPA_BCR       0x94        /* w GPa Buffer Control */
+#define SCR_CCR           0x98        /* w Clock Control    */
+#define SCR_PLL2CR        0x9a        /* w PLL2 Control    */
+#define SCR_PLL1CR        0x9c        /* l PLL1 Control    */
+#define SCR_DIARCR        0xa0        /* b Device Internal Active Register Control */
+#define SCR_DBOCR         0xa1        /* b Device Buffer Off Control */
+#define SCR_FER           0xe0        /* b Function Enable    */
+#define SCR_MCR           0xe4        /* w Mode Control    */
+#define SCR_CONFIG        0xfc        /* b Configuration Control */
+#define SCR_DEBUG         0xff        /* b Debug        */
 
 #define NAND_CFG_COMMAND    0x04    /* w Command        */
 #define NAND_CFG_BASE       0x10    /* l Control Base Address */
@@ -368,7 +368,7 @@ static uint32_t tc6393xb_nand_readb(TC6393xbState *s, hwaddr addr) {
 }
 static void tc6393xb_nand_writeb(TC6393xbState *s, hwaddr addr, uint32_t value) {
 //    fprintf(stderr, "tc6393xb_nand: write at %08x: %02x\n",
-//					(uint32_t) addr, value & 0xff);
+//                    (uint32_t) addr, value & 0xff);
     switch (addr) {
         case NAND_DATA + 0:
         case NAND_DATA + 1:
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 50ecb1ad02..c5b6cfb1c6 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -1871,9 +1871,9 @@ static void vga_reset(void *opaque)
     vga_common_reset(s);
 }
 
-#define TEXTMODE_X(x)	((x) % width)
-#define TEXTMODE_Y(x)	((x) / width)
-#define VMEM2CHTYPE(v)	((v & 0xff0007ff) | \
+#define TEXTMODE_X(x)    ((x) % width)
+#define TEXTMODE_Y(x)    ((x) / width)
+#define VMEM2CHTYPE(v)    ((v & 0xff0007ff) | \
         ((v & 0x00000800) << 10) | ((v & 0x00007000) >> 1))
 /* relay text rendering to the display driver
  * instead of doing a full vga_update_display() */
diff --git a/hw/display/vga_regs.h b/hw/display/vga_regs.h
index 30a98b8736..5b4b1fb535 100644
--- a/hw/display/vga_regs.h
+++ b/hw/display/vga_regs.h
@@ -4,9 +4,9 @@
  * Copyright 1999 Jeff Garzik <jgarzik@pobox.com>
  *
  * Copyright history from vga16fb.c:
- *	Copyright 1999 Ben Pfaff and Petr Vandrovec
- *	Based on VGA info at http://www.osdever.net/FreeVGA/home.htm
- *	Based on VESA framebuffer (c) 1998 Gerd Knorr
+ *    Copyright 1999 Ben Pfaff and Petr Vandrovec
+ *    Based on VGA info at http://www.osdever.net/FreeVGA/home.htm
+ *    Based on VESA framebuffer (c) 1998 Gerd Knorr
  *
  * This file is subject to the terms and conditions of the GNU General
  * Public License.  See the file COPYING in the main directory of this
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 50857cd97a..5918855e44 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -76,7 +76,7 @@ struct XenFB {
     int               do_resize;
 
     struct {
-	int x,y,w,h;
+    int x,y,w,h;
     } up_rects[UP_QUEUE];
     int               up_count;
     int               up_fullscreen;
@@ -116,32 +116,32 @@ static void common_unbind(struct common *c)
     xen_pv_unbind_evtchn(&c->xendev);
     if (c->page) {
         xenforeignmemory_unmap(xen_fmem, c->page, 1);
-	c->page = NULL;
+    c->page = NULL;
     }
 }
 
 /* -------------------------------------------------------------------- */
 /* Send an event to the keyboard frontend driver */
 static int xenfb_kbd_event(struct XenInput *xenfb,
-			   union xenkbd_in_event *event)
+               union xenkbd_in_event *event)
 {
     struct xenkbd_page *page = xenfb->c.page;
     uint32_t prod;
 
     if (xenfb->c.xendev.be_state != XenbusStateConnected)
-	return 0;
+    return 0;
     if (!page)
         return 0;
 
     prod = page->in_prod;
     if (prod - page->in_cons == XENKBD_IN_RING_LEN) {
-	errno = EAGAIN;
-	return -1;
+    errno = EAGAIN;
+    return -1;
     }
 
-    xen_mb();		/* ensure ring space available */
+    xen_mb();        /* ensure ring space available */
     XENKBD_IN_RING_REF(page, prod) = *event;
-    xen_wmb();		/* ensure ring contents visible */
+    xen_wmb();        /* ensure ring contents visible */
     page->in_prod = prod + 1;
     return xen_pv_send_notify(&xenfb->c.xendev);
 }
@@ -161,7 +161,7 @@ static int xenfb_send_key(struct XenInput *xenfb, bool down, int keycode)
 
 /* Send a relative mouse movement event */
 static int xenfb_send_motion(struct XenInput *xenfb,
-			     int rel_x, int rel_y, int rel_z)
+                 int rel_x, int rel_y, int rel_z)
 {
     union xenkbd_in_event event;
 
@@ -176,7 +176,7 @@ static int xenfb_send_motion(struct XenInput *xenfb,
 
 /* Send an absolute mouse movement event */
 static int xenfb_send_position(struct XenInput *xenfb,
-			       int abs_x, int abs_y, int z)
+                   int abs_x, int abs_y, int z)
 {
     union xenkbd_in_event event;
 
@@ -354,7 +354,7 @@ static int input_initialise(struct XenLegacyDevice *xendev)
 
     rc = common_bind(&in->c);
     if (rc != 0)
-	return rc;
+    return rc;
 
     return 0;
 }
@@ -415,7 +415,7 @@ static void input_event(struct XenLegacyDevice *xendev)
 
     /* We don't understand any keyboard events, so just ignore them. */
     if (page->out_prod == page->out_cons)
-	return;
+    return;
     page->out_cons = page->out_prod;
     xen_pv_send_notify(&xenfb->c.xendev);
 }
@@ -429,7 +429,7 @@ static void xenfb_copy_mfns(int mode, int count, xen_pfn_t *dst, void *src)
     int i;
 
     for (i = 0; i < count; i++)
-	dst[i] = (mode == 32) ? src32[i] : src64[i];
+    dst[i] = (mode == 32) ? src32[i] : src64[i];
 }
 
 static int xenfb_map_fb(struct XenFB *xenfb)
@@ -447,43 +447,43 @@ static int xenfb_map_fb(struct XenFB *xenfb)
     mode = sizeof(unsigned long) * 8;
 
     if (!protocol) {
-	/*
-	 * Undefined protocol, some guesswork needed.
-	 *
-	 * Old frontends which don't set the protocol use
-	 * one page directory only, thus pd[1] must be zero.
-	 * pd[1] of the 32bit struct layout and the lower
-	 * 32 bits of pd[0] of the 64bit struct layout have
-	 * the same location, so we can check that ...
-	 */
-	uint32_t *ptr32 = NULL;
-	uint32_t *ptr64 = NULL;
+    /*
+     * Undefined protocol, some guesswork needed.
+     *
+     * Old frontends which don't set the protocol use
+     * one page directory only, thus pd[1] must be zero.
+     * pd[1] of the 32bit struct layout and the lower
+     * 32 bits of pd[0] of the 64bit struct layout have
+     * the same location, so we can check that ...
+     */
+    uint32_t *ptr32 = NULL;
+    uint32_t *ptr64 = NULL;
 #if defined(__i386__)
-	ptr32 = (void*)page->pd;
-	ptr64 = ((void*)page->pd) + 4;
+    ptr32 = (void*)page->pd;
+    ptr64 = ((void*)page->pd) + 4;
 #elif defined(__x86_64__)
-	ptr32 = ((void*)page->pd) - 4;
-	ptr64 = (void*)page->pd;
+    ptr32 = ((void*)page->pd) - 4;
+    ptr64 = (void*)page->pd;
 #endif
-	if (ptr32) {
-	    if (ptr32[1] == 0) {
-		mode = 32;
-		pd   = ptr32;
-	    } else {
-		mode = 64;
-		pd   = ptr64;
-	    }
-	}
+    if (ptr32) {
+        if (ptr32[1] == 0) {
+        mode = 32;
+        pd   = ptr32;
+        } else {
+        mode = 64;
+        pd   = ptr64;
+        }
+    }
 #if defined(__x86_64__)
     } else if (strcmp(protocol, XEN_IO_PROTO_ABI_X86_32) == 0) {
-	/* 64bit dom0, 32bit domU */
-	mode = 32;
-	pd   = ((void*)page->pd) - 4;
+    /* 64bit dom0, 32bit domU */
+    mode = 32;
+    pd   = ((void*)page->pd) - 4;
 #elif defined(__i386__)
     } else if (strcmp(protocol, XEN_IO_PROTO_ABI_X86_64) == 0) {
-	/* 32bit dom0, 64bit domU */
-	mode = 64;
-	pd   = ((void*)page->pd) + 4;
+    /* 32bit dom0, 64bit domU */
+    mode = 64;
+    pd   = ((void*)page->pd) + 4;
 #endif
     }
 
@@ -503,14 +503,14 @@ static int xenfb_map_fb(struct XenFB *xenfb)
     map = xenforeignmemory_map(xen_fmem, xenfb->c.xendev.dom,
                                PROT_READ, n_fbdirs, pgmfns, NULL);
     if (map == NULL)
-	goto out;
+    goto out;
     xenfb_copy_mfns(mode, xenfb->fbpages, fbmfns, map);
     xenforeignmemory_unmap(xen_fmem, map, n_fbdirs);
 
     xenfb->pixels = xenforeignmemory_map(xen_fmem, xenfb->c.xendev.dom,
             PROT_READ, xenfb->fbpages, fbmfns, NULL);
     if (xenfb->pixels == NULL)
-	goto out;
+    goto out;
 
     ret = 0; /* all is fine */
 
@@ -589,35 +589,35 @@ static int xenfb_configure_fb(struct XenFB *xenfb, size_t fb_len_lim,
 
 /* A convenient function for munging pixels between different depths */
 #define BLT(SRC_T,DST_T,RSB,GSB,BSB,RDB,GDB,BDB)                        \
-    for (line = y ; line < (y+h) ; line++) {				\
-	SRC_T *src = (SRC_T *)(xenfb->pixels				\
-			       + xenfb->offset				\
-			       + (line * xenfb->row_stride)		\
-			       + (x * xenfb->depth / 8));		\
-	DST_T *dst = (DST_T *)(data					\
-			       + (line * linesize)			\
-			       + (x * bpp / 8));			\
-	int col;							\
-	const int RSS = 32 - (RSB + GSB + BSB);				\
-	const int GSS = 32 - (GSB + BSB);				\
-	const int BSS = 32 - (BSB);					\
-	const uint32_t RSM = (~0U) << (32 - RSB);			\
-	const uint32_t GSM = (~0U) << (32 - GSB);			\
-	const uint32_t BSM = (~0U) << (32 - BSB);			\
-	const int RDS = 32 - (RDB + GDB + BDB);				\
-	const int GDS = 32 - (GDB + BDB);				\
-	const int BDS = 32 - (BDB);					\
-	const uint32_t RDM = (~0U) << (32 - RDB);			\
-	const uint32_t GDM = (~0U) << (32 - GDB);			\
-	const uint32_t BDM = (~0U) << (32 - BDB);			\
-	for (col = x ; col < (x+w) ; col++) {				\
-	    uint32_t spix = *src;					\
-	    *dst = (((spix << RSS) & RSM & RDM) >> RDS) |		\
-		(((spix << GSS) & GSM & GDM) >> GDS) |			\
-		(((spix << BSS) & BSM & BDM) >> BDS);			\
-	    src = (SRC_T *) ((unsigned long) src + xenfb->depth / 8);	\
-	    dst = (DST_T *) ((unsigned long) dst + bpp / 8);		\
-	}								\
+    for (line = y ; line < (y+h) ; line++) {                \
+    SRC_T *src = (SRC_T *)(xenfb->pixels                \
+                   + xenfb->offset                \
+                   + (line * xenfb->row_stride)        \
+                   + (x * xenfb->depth / 8));        \
+    DST_T *dst = (DST_T *)(data                    \
+                   + (line * linesize)            \
+                   + (x * bpp / 8));            \
+    int col;                            \
+    const int RSS = 32 - (RSB + GSB + BSB);                \
+    const int GSS = 32 - (GSB + BSB);                \
+    const int BSS = 32 - (BSB);                    \
+    const uint32_t RSM = (~0U) << (32 - RSB);            \
+    const uint32_t GSM = (~0U) << (32 - GSB);            \
+    const uint32_t BSM = (~0U) << (32 - BSB);            \
+    const int RDS = 32 - (RDB + GDB + BDB);                \
+    const int GDS = 32 - (GDB + BDB);                \
+    const int BDS = 32 - (BDB);                    \
+    const uint32_t RDM = (~0U) << (32 - RDB);            \
+    const uint32_t GDM = (~0U) << (32 - GDB);            \
+    const uint32_t BDM = (~0U) << (32 - BDB);            \
+    for (col = x ; col < (x+w) ; col++) {                \
+        uint32_t spix = *src;                    \
+        *dst = (((spix << RSS) & RSM & RDM) >> RDS) |        \
+        (((spix << GSS) & GSM & GDM) >> GDS) |            \
+        (((spix << BSS) & BSM & BDM) >> BDS);            \
+        src = (SRC_T *) ((unsigned long) src + xenfb->depth / 8);    \
+        dst = (DST_T *) ((unsigned long) dst + bpp / 8);        \
+    }                                \
     }
 
 
@@ -657,7 +657,7 @@ static void xenfb_guest_copy(struct XenFB *xenfb, int x, int y, int w, int h)
             break;
         default:
             oops = 1;
-	}
+    }
     }
     if (oops) /* should not happen */
         xen_pv_printf(&xenfb->c.xendev, 0, "%s: oops: convert %d -> %d bpp?\n",
@@ -816,60 +816,60 @@ static void xenfb_handle_events(struct XenFB *xenfb)
     if (prod - out_cons > XENFB_OUT_RING_LEN) {
         return;
     }
-    xen_rmb();		/* ensure we see ring contents up to prod */
+    xen_rmb();        /* ensure we see ring contents up to prod */
     for (cons = out_cons; cons != prod; cons++) {
-	union xenfb_out_event *event = &XENFB_OUT_RING_REF(page, cons);
+    union xenfb_out_event *event = &XENFB_OUT_RING_REF(page, cons);
         uint8_t type = event->type;
-	int x, y, w, h;
-
-	switch (type) {
-	case XENFB_TYPE_UPDATE:
-	    if (xenfb->up_count == UP_QUEUE)
-		xenfb->up_fullscreen = 1;
-	    if (xenfb->up_fullscreen)
-		break;
-	    x = MAX(event->update.x, 0);
-	    y = MAX(event->update.y, 0);
-	    w = MIN(event->update.width, xenfb->width - x);
-	    h = MIN(event->update.height, xenfb->height - y);
-	    if (w < 0 || h < 0) {
+    int x, y, w, h;
+
+    switch (type) {
+    case XENFB_TYPE_UPDATE:
+        if (xenfb->up_count == UP_QUEUE)
+        xenfb->up_fullscreen = 1;
+        if (xenfb->up_fullscreen)
+        break;
+        x = MAX(event->update.x, 0);
+        y = MAX(event->update.y, 0);
+        w = MIN(event->update.width, xenfb->width - x);
+        h = MIN(event->update.height, xenfb->height - y);
+        if (w < 0 || h < 0) {
                 xen_pv_printf(&xenfb->c.xendev, 1, "bogus update ignored\n");
-		break;
-	    }
-	    if (x != event->update.x ||
+        break;
+        }
+        if (x != event->update.x ||
                 y != event->update.y ||
-		w != event->update.width ||
-		h != event->update.height) {
+        w != event->update.width ||
+        h != event->update.height) {
                 xen_pv_printf(&xenfb->c.xendev, 1, "bogus update clipped\n");
-	    }
-	    if (w == xenfb->width && h > xenfb->height / 2) {
-		/* scroll detector: updated more than 50% of the lines,
-		 * don't bother keeping track of the rectangles then */
-		xenfb->up_fullscreen = 1;
-	    } else {
-		xenfb->up_rects[xenfb->up_count].x = x;
-		xenfb->up_rects[xenfb->up_count].y = y;
-		xenfb->up_rects[xenfb->up_count].w = w;
-		xenfb->up_rects[xenfb->up_count].h = h;
-		xenfb->up_count++;
-	    }
-	    break;
+        }
+        if (w == xenfb->width && h > xenfb->height / 2) {
+        /* scroll detector: updated more than 50% of the lines,
+         * don't bother keeping track of the rectangles then */
+        xenfb->up_fullscreen = 1;
+        } else {
+        xenfb->up_rects[xenfb->up_count].x = x;
+        xenfb->up_rects[xenfb->up_count].y = y;
+        xenfb->up_rects[xenfb->up_count].w = w;
+        xenfb->up_rects[xenfb->up_count].h = h;
+        xenfb->up_count++;
+        }
+        break;
 #ifdef XENFB_TYPE_RESIZE
-	case XENFB_TYPE_RESIZE:
-	    if (xenfb_configure_fb(xenfb, xenfb->fb_len,
-				   event->resize.width,
-				   event->resize.height,
-				   event->resize.depth,
-				   xenfb->fb_len,
-				   event->resize.offset,
-				   event->resize.stride) < 0)
-		break;
-	    xenfb_invalidate(xenfb);
-	    break;
+    case XENFB_TYPE_RESIZE:
+        if (xenfb_configure_fb(xenfb, xenfb->fb_len,
+                   event->resize.width,
+                   event->resize.height,
+                   event->resize.depth,
+                   xenfb->fb_len,
+                   event->resize.offset,
+                   event->resize.stride) < 0)
+        break;
+        xenfb_invalidate(xenfb);
+        break;
 #endif
-	}
     }
-    xen_mb();		/* ensure we're done with ring contents */
+    }
+    xen_mb();        /* ensure we're done with ring contents */
     page->out_cons = cons;
 }
 
@@ -889,32 +889,32 @@ static int fb_initialise(struct XenLegacyDevice *xendev)
     int rc;
 
     if (xenstore_read_fe_int(xendev, "videoram", &videoram) == -1)
-	videoram = 0;
+    videoram = 0;
 
     rc = common_bind(&fb->c);
     if (rc != 0)
-	return rc;
+    return rc;
 
     fb_page = fb->c.page;
     rc = xenfb_configure_fb(fb, videoram * MiB,
-			    fb_page->width, fb_page->height, fb_page->depth,
-			    fb_page->mem_length, 0, fb_page->line_length);
+                fb_page->width, fb_page->height, fb_page->depth,
+                fb_page->mem_length, 0, fb_page->line_length);
     if (rc != 0)
-	return rc;
+    return rc;
 
     rc = xenfb_map_fb(fb);
     if (rc != 0)
-	return rc;
+    return rc;
 
     fb->con = graphic_console_init(NULL, 0, &xenfb_ops, fb);
 
     if (xenstore_read_fe_int(xendev, "feature-update", &fb->feature_update) == -1)
-	fb->feature_update = 0;
+    fb->feature_update = 0;
     if (fb->feature_update)
-	xenstore_write_be_int(xendev, "request-update", 1);
+    xenstore_write_be_int(xendev, "request-update", 1);
 
     xen_pv_printf(xendev, 1, "feature-update=%d, videoram=%d\n",
-		  fb->feature_update, videoram);
+          fb->feature_update, videoram);
     return 0;
 }
 
-- 
2.25.1


