Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732084ED2D6
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 06:35:49 +0200 (CEST)
Received: from localhost ([::1]:60230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZmXD-0002kI-SK
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 00:35:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3-y5FYgcKCoYuywvynsqyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--komlodi.bounces.google.com>)
 id 1nZmUa-0000gF-P1
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 00:33:04 -0400
Received: from [2607:f8b0:4864:20::1049] (port=52088
 helo=mail-pj1-x1049.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3-y5FYgcKCoYuywvynsqyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--komlodi.bounces.google.com>)
 id 1nZmUY-0001OE-5y
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 00:33:04 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 le9-20020a17090b150900b001c6603efca4so11772475pjb.1
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 21:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=apirvvQcOIA1VoBJqUNI4bFk9NSfG8XSnZhL2aLj45U=;
 b=aSjfsprLhWf4p9GdZ/EcpTr2mhQMERiX7oh3BxSCzYObm+YkIFap+UEPg4Ox9SV9fp
 oIt6XMCUkB//htdcTGXtfl91wPUHQSxU9cvjE29jST5tXIrM4/rY3dWwpaJPfPDEWCuc
 YNDXUPoRKGOTTOGjwDcSivmzx8W2GrpcWuoCh6zzgihajvT9W2z5DqV2jYeACnN0THZa
 NqXnpBC37EADslBViBHidt3kcMxnoeU98q+WYzxuRR6n3ieAJSD3RQe0Ezn16Pzr+EKX
 l2xpjr0qH5fWOEc3mBALf/fKemsQp8qRS09kSg1n31Bp1pIuQWf7LPpL3bZ+AVHNMUb9
 wmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=apirvvQcOIA1VoBJqUNI4bFk9NSfG8XSnZhL2aLj45U=;
 b=Vt0A5+Y5/A2mJGEBSY/6ytBf4rwI8rTS1ignxa+ooI35pWMPS1vrwpOme86q/ibPZR
 osIK/IhIucgFMonXq/1MJjZzXeljxg1kDQUTKef+rm1rjk9rXxiyPrv9I0r2rFsgfJkN
 ccme49ScLeN5EvsMYk9SkaBRXwidNW+WHIvGbD2lHj+0goeQZDbWkUcrLfe1XHX8PK/M
 drz8+wflr6/dScyhsz1zgTtn2KYqx5lcdGQF4ASOto7i7t4/AE5UtwWPVWBLV4xv8wiV
 lg46h5lPiYSnCjso/VKZssPWi3lfb0dkHp+T7igQ3gF6a7+nWhzW5zKxHZ5zs4l6y0fJ
 zf+g==
X-Gm-Message-State: AOAM533e1LBAWWsOSfuv/9Ko0XvwOqVWO2hhC4MP8KQ9y5ONJbzQ3qih
 UhFR8cwHN2G/T3++s2FM9FRpLml1VT1fQ8JdXZ4oK+WnxxivUUn1sYjzsjYg2hch287C7A6SkFU
 YKVqwxPGWUtX5gF+bIczdFm7mSoexX7k445sphV481cSuZRLCSqKf6BT4VNwQdyg=
X-Google-Smtp-Source: ABdhPJxIPVVARi4TMitZjZS0nOUkMWypDLh1XsbBkjE1r8rMGSlV9azgu40RxI0cBtMTDSG8v8vlOk6rXQ01
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a05:6a00:1a4e:b0:4fb:4188:d72a with SMTP
 id h14-20020a056a001a4e00b004fb4188d72amr21942199pfv.24.1648701179915; Wed,
 30 Mar 2022 21:32:59 -0700 (PDT)
Date: Thu, 31 Mar 2022 04:32:48 +0000
In-Reply-To: <20220331043248.2237838-1-komlodi@google.com>
Message-Id: <20220331043248.2237838-8-komlodi@google.com>
Mime-Version: 1.0
References: <20220331043248.2237838-1-komlodi@google.com>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
Subject: [RFC PATCH 7/7] aspeed: i2c: Move regs and helpers to header file
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au, 
 venture@google.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1049
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3-y5FYgcKCoYuywvynsqyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--komlodi.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Moves register definitions and short commonly used inlined functiosn to
the header file to help tidy up the implementation file.

Signed-off-by: Joe Komlodi <komlodi@google.com>
Change-Id: I34dff7485b6bbe3c9482715ccd94dbd65dc5f324
---
 hw/i2c/aspeed_i2c.c         | 266 -----------------------------------
 include/hw/i2c/aspeed_i2c.h | 267 ++++++++++++++++++++++++++++++++++++
 2 files changed, 267 insertions(+), 266 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index f179f78ee9..8425e92889 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -31,272 +31,6 @@
 #include "hw/registerfields.h"
 #include "trace.h"
 
-/* Tx State Machine */
-#define   I2CD_TX_STATE_MASK                  0xf
-#define     I2CD_IDLE                         0x0
-#define     I2CD_MACTIVE                      0x8
-#define     I2CD_MSTART                       0x9
-#define     I2CD_MSTARTR                      0xa
-#define     I2CD_MSTOP                        0xb
-#define     I2CD_MTXD                         0xc
-#define     I2CD_MRXACK                       0xd
-#define     I2CD_MRXD                         0xe
-#define     I2CD_MTXACK                       0xf
-#define     I2CD_SWAIT                        0x1
-#define     I2CD_SRXD                         0x4
-#define     I2CD_STXACK                       0x5
-#define     I2CD_STXD                         0x6
-#define     I2CD_SRXACK                       0x7
-#define     I2CD_RECOVER                      0x3
-
-/* I2C Global Register */
-REG32(I2C_CTRL_STATUS, 0x0) /* Device Interrupt Status */
-REG32(I2C_CTRL_ASSIGN, 0x8) /* Device Interrupt Target Assignment */
-REG32(I2C_CTRL_GLOBAL, 0xC) /* Global Control Register */
-    FIELD(I2C_CTRL_GLOBAL, REG_MODE, 2, 1)
-    FIELD(I2C_CTRL_GLOBAL, SRAM_EN, 0, 1)
-REG32(I2C_CTRL_NEW_CLK_DIVIDER, 0x10) /* New mode clock divider */
-
-/* I2C Old Mode Device (Bus) Register */
-REG32(I2CD_FUN_CTRL, 0x0) /* I2CD Function Control  */
-    FIELD(I2CD_FUN_CTRL, POOL_PAGE_SEL, 20, 3) /* AST2400 */
-    SHARED_FIELD(M_SDA_LOCK_EN, 16, 1)
-    SHARED_FIELD(MULTI_MASTER_DIS, 15, 1)
-    SHARED_FIELD(M_SCL_DRIVE_EN, 14, 1)
-    SHARED_FIELD(MSB_STS, 9, 1)
-    SHARED_FIELD(SDA_DRIVE_IT_EN, 8, 1)
-    SHARED_FIELD(M_SDA_DRIVE_IT_EN, 7, 1)
-    SHARED_FIELD(M_HIGH_SPEED_EN, 6, 1)
-    SHARED_FIELD(DEF_ADDR_EN, 5, 1)
-    SHARED_FIELD(DEF_ALERT_EN, 4, 1)
-    SHARED_FIELD(DEF_ARP_EN, 3, 1)
-    SHARED_FIELD(DEF_GCALL_EN, 2, 1)
-    SHARED_FIELD(SLAVE_EN, 1, 1)
-    SHARED_FIELD(MASTER_EN, 0, 1)
-REG32(I2CD_AC_TIMING1, 0x04) /* Clock and AC Timing Control #1 */
-REG32(I2CD_AC_TIMING2, 0x08) /* Clock and AC Timing Control #2 */
-REG32(I2CD_INTR_CTRL, 0x0C)  /* I2CD Interrupt Control */
-REG32(I2CD_INTR_STS, 0x10)   /* I2CD Interrupt Status */
-    SHARED_FIELD(SLAVE_ADDR_MATCH, 31, 1)    /* 0: addr1 1: addr2 */
-    SHARED_FIELD(SLAVE_ADDR_RX_PENDING, 29, 1)
-    SHARED_FIELD(SLAVE_INACTIVE_TIMEOUT, 15, 1)
-    SHARED_FIELD(SDA_DL_TIMEOUT, 14, 1)
-    SHARED_FIELD(BUS_RECOVER_DONE, 13, 1)
-    SHARED_FIELD(SMBUS_ALERT, 12, 1)                    /* Bus [0-3] only */
-    FIELD(I2CD_INTR_STS, SMBUS_ARP_ADDR, 11, 1)         /* Removed */
-    FIELD(I2CD_INTR_STS, SMBUS_DEV_ALERT_ADDR, 10, 1)   /* Removed */
-    FIELD(I2CD_INTR_STS, SMBUS_DEF_ADDR, 9, 1)          /* Removed */
-    FIELD(I2CD_INTR_STS, GCALL_ADDR, 8, 1)              /* Removed */
-    FIELD(I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, 7, 1)     /* use RX_DONE */
-    SHARED_FIELD(SCL_TIMEOUT, 6, 1)
-    SHARED_FIELD(ABNORMAL, 5, 1)
-    SHARED_FIELD(NORMAL_STOP, 4, 1)
-    SHARED_FIELD(ARBIT_LOSS, 3, 1)
-    SHARED_FIELD(RX_DONE, 2, 1)
-    SHARED_FIELD(TX_NAK, 1, 1)
-    SHARED_FIELD(TX_ACK, 0, 1)
-REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
-    SHARED_FIELD(SDA_OE, 28, 1)
-    SHARED_FIELD(SDA_O, 27, 1)
-    SHARED_FIELD(SCL_OE, 26, 1)
-    SHARED_FIELD(SCL_O, 25, 1)
-    SHARED_FIELD(TX_TIMING, 23, 2)
-    SHARED_FIELD(TX_STATE, 19, 4)
-    SHARED_FIELD(SCL_LINE_STS, 18, 1)
-    SHARED_FIELD(SDA_LINE_STS, 17, 1)
-    SHARED_FIELD(BUS_BUSY_STS, 16, 1)
-    SHARED_FIELD(SDA_OE_OUT_DIR, 15, 1)
-    SHARED_FIELD(SDA_O_OUT_DIR, 14, 1)
-    SHARED_FIELD(SCL_OE_OUT_DIR, 13, 1)
-    SHARED_FIELD(SCL_O_OUT_DIR, 12, 1)
-    SHARED_FIELD(BUS_RECOVER_CMD_EN, 11, 1)
-    SHARED_FIELD(S_ALT_EN, 10, 1)
-    /* Command Bits */
-    SHARED_FIELD(RX_DMA_EN, 9, 1)
-    SHARED_FIELD(TX_DMA_EN, 8, 1)
-    SHARED_FIELD(RX_BUFF_EN, 7, 1)
-    SHARED_FIELD(TX_BUFF_EN, 6, 1)
-    SHARED_FIELD(M_STOP_CMD, 5, 1)
-    SHARED_FIELD(M_S_RX_CMD_LAST, 4, 1)
-    SHARED_FIELD(M_RX_CMD, 3, 1)
-    SHARED_FIELD(S_TX_CMD, 2, 1)
-    SHARED_FIELD(M_TX_CMD, 1, 1)
-    SHARED_FIELD(M_START_CMD, 0, 1)
-REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
-REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
-    SHARED_FIELD(RX_COUNT, 24, 5)
-    SHARED_FIELD(RX_SIZE, 16, 5)
-    SHARED_FIELD(TX_COUNT, 9, 5)
-    FIELD(I2CD_POOL_CTRL, OFFSET, 2, 6) /* AST2400 */
-REG32(I2CD_BYTE_BUF, 0x20) /* Transmit/Receive Byte Buffer */
-    SHARED_FIELD(RX_BUF, 8, 8)
-    SHARED_FIELD(TX_BUF, 0, 8)
-REG32(I2CD_DMA_ADDR, 0x24) /* DMA Buffer Address */
-REG32(I2CD_DMA_LEN, 0x28) /* DMA Transfer Length < 4KB */
-
-/* I2C New Mode Device (Bus) Register */
-REG32(I2CC_FUN_CTRL, 0x0)
-    FIELD(I2CC_FUN_CTRL, RB_EARLY_DONE_EN, 22, 1)
-    FIELD(I2CC_FUN_CTRL, DMA_DIS_AUTO_RECOVER, 21, 1)
-    FIELD(I2CC_FUN_CTRL, S_SAVE_ADDR, 20, 1)
-    FIELD(I2CC_FUN_CTRL, M_PKT_RETRY_CNT, 18, 2)
-    /* 17:0 shared with I2CD_FUN_CTRL[17:0] */
-REG32(I2CC_AC_TIMING, 0x04)
-REG32(I2CC_MS_TXRX_BYTE_BUF, 0x08)
-    /* 31:16 shared with I2CD_CMD[31:16] */
-    /* 15:0  shared with I2CD_BYTE_BUF[15:0] */
-REG32(I2CC_POOL_CTRL, 0x0c)
-    /* 31:0 shared with I2CD_POOL_CTRL[31:0] */
-REG32(I2CM_INTR_CTRL, 0x10)
-REG32(I2CM_INTR_STS, 0x14)
-    FIELD(I2CM_INTR_STS, PKT_STATE, 28, 4)
-    FIELD(I2CM_INTR_STS, PKT_CMD_TIMEOUT, 18, 1)
-    FIELD(I2CM_INTR_STS, PKT_CMD_FAIL, 17, 1)
-    FIELD(I2CM_INTR_STS, PKT_CMD_DONE, 16, 1)
-    FIELD(I2CM_INTR_STS, BUS_RECOVER_FAIL, 15, 1)
-    /* 14:0 shared with I2CD_INTR_STS[14:0] */
-REG32(I2CM_CMD, 0x18)
-    FIELD(I2CM_CMD, W1_CTRL, 31, 1)
-    FIELD(I2CM_CMD, PKT_DEV_ADDR, 24, 7)
-    FIELD(I2CM_CMD, HS_MASTER_MODE_LSB, 17, 3)
-    FIELD(I2CM_CMD, PKT_OP_EN, 16, 1)
-    /* 15:0 shared with I2CD_CMD[15:0] */
-REG32(I2CM_DMA_LEN, 0x1c)
-    FIELD(I2CM_DMA_LEN, RX_BUF_LEN_W1T, 31, 1)
-    FIELD(I2CM_DMA_LEN, RX_BUF_LEN, 16, 11)
-    FIELD(I2CM_DMA_LEN, TX_BUF_LEN_W1T, 15, 1)
-    FIELD(I2CM_DMA_LEN, TX_BUF_LEN, 0, 11)
-REG32(I2CS_INTR_CTRL, 0x20)
-REG32(I2CS_INTR_STS, 0x24)
-    /* 31:29 shared with I2CD_INTR_STS[31:29] */
-    FIELD(I2CS_INTR_STS, SLAVE_PARKING_STS, 24, 2)
-    FIELD(I2CS_INTR_STS, SLAVE_ADDR3_NAK, 22, 1)
-    FIELD(I2CS_INTR_STS, SLAVE_ADDR2_NAK, 21, 1)
-    FIELD(I2CS_INTR_STS, SLAVE_ADDR1_NAK, 20, 1)
-    FIELD(I2CS_INTR_STS, SLAVE_ADDR_INDICATOR, 18, 2)
-    FIELD(I2CS_INTR_STS, PKT_CMD_FAIL, 17, 1)
-    FIELD(I2CS_INTR_STS, PKT_CMD_DONE, 16, 1)
-    /* 14:0 shared with I2CD_INTR_STS[14:0] */
-REG32(I2CS_CMD, 0x28)
-    FIELD(I2CS_CMD, W1_CTRL, 31, 1)
-    FIELD(I2CS_CMD, PKT_MODE_ACTIVE_ADDR, 17, 2)
-    FIELD(I2CS_CMD, PKT_MODE_EN, 16, 1)
-    FIELD(I2CS_CMD, AUTO_NAK_INACTIVE_ADDR, 15, 1)
-    FIELD(I2CS_CMD, AUTO_NAK_ACTIVE_ADDR, 14, 1)
-    /* 13:0 shared with I2CD_CMD[13:0] */
-REG32(I2CS_DMA_LEN, 0x2c)
-    FIELD(I2CS_DMA_LEN, RX_BUF_LEN_W1T, 31, 1)
-    FIELD(I2CS_DMA_LEN, RX_BUF_LEN, 16, 11)
-    FIELD(I2CS_DMA_LEN, TX_BUF_LEN_W1T, 15, 1)
-    FIELD(I2CS_DMA_LEN, TX_BUF_LEN, 0, 11)
-REG32(I2CM_DMA_TX_ADDR, 0x30)
-    FIELD(I2CM_DMA_TX_ADDR, ADDR, 0, 31)
-REG32(I2CM_DMA_RX_ADDR, 0x34)
-    FIELD(I2CM_DMA_RX_ADDR, ADDR, 0, 31)
-REG32(I2CS_DMA_TX_ADDR, 0x38)
-    FIELD(I2CS_DMA_TX_ADDR, ADDR, 0, 31)
-REG32(I2CS_DMA_RX_ADDR, 0x3c)
-    FIELD(I2CS_DMA_RX_ADDR, ADDR, 0, 31)
-REG32(I2CS_DEV_ADDR, 0x40)
-REG32(I2CM_DMA_LEN_STS, 0x48)
-    FIELD(I2CM_DMA_LEN_STS, RX_LEN, 16, 13)
-    FIELD(I2CM_DMA_LEN_STS, TX_LEN, 0, 13)
-REG32(I2CS_DMA_LEN_STS, 0x4c)
-    FIELD(I2CS_DMA_LEN_STS, RX_LEN, 16, 13)
-    FIELD(I2CS_DMA_LEN_STS, TX_LEN, 0, 13)
-REG32(I2CC_DMA_ADDR, 0x50)
-REG32(I2CC_DMA_LEN, 0x54)
-
-static inline bool aspeed_i2c_is_new_mode(AspeedI2CState *s)
-{
-    return FIELD_EX32(s->ctrl_global, I2C_CTRL_GLOBAL, REG_MODE);
-}
-
-static inline bool aspeed_i2c_bus_pkt_mode_en(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return ARRAY_FIELD_EX32(bus->regs, I2CM_CMD, PKT_OP_EN);
-    }
-    return false;
-}
-
-static inline uint32_t aspeed_i2c_bus_ctrl_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CC_FUN_CTRL;
-    }
-    return R_I2CD_FUN_CTRL;
-}
-
-static inline uint32_t aspeed_i2c_bus_cmd_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CM_CMD;
-    }
-    return R_I2CD_CMD;
-}
-
-static inline uint32_t aspeed_i2c_bus_intr_ctrl_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CM_INTR_CTRL;
-    }
-    return R_I2CD_INTR_CTRL;
-}
-
-static inline uint32_t aspeed_i2c_bus_intr_sts_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CM_INTR_STS;
-    }
-    return R_I2CD_INTR_STS;
-}
-
-static inline uint32_t aspeed_i2c_bus_pool_ctrl_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CC_POOL_CTRL;
-    }
-    return R_I2CD_POOL_CTRL;
-}
-
-static inline uint32_t aspeed_i2c_bus_byte_buf_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CC_MS_TXRX_BYTE_BUF;
-    }
-    return R_I2CD_BYTE_BUF;
-}
-
-static inline uint32_t aspeed_i2c_bus_dma_len_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CC_DMA_LEN;
-    }
-    return R_I2CD_DMA_LEN;
-}
-
-static inline uint32_t aspeed_i2c_bus_dma_addr_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CC_DMA_ADDR;
-    }
-    return R_I2CD_DMA_ADDR;
-}
-
-static inline bool aspeed_i2c_bus_is_master(AspeedI2CBus *bus)
-{
-    return SHARED_ARRAY_FIELD_EX32(bus->regs, aspeed_i2c_bus_ctrl_offset(bus),
-                                   MASTER_EN);
-}
-
-static inline bool aspeed_i2c_bus_is_enabled(AspeedI2CBus *bus)
-{
-    uint32_t ctrl_reg = aspeed_i2c_bus_ctrl_offset(bus);
-    return SHARED_ARRAY_FIELD_EX32(bus->regs, ctrl_reg, MASTER_EN) ||
-           SHARED_ARRAY_FIELD_EX32(bus->regs, ctrl_reg, SLAVE_EN);
-}
-
 static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
 {
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 86b18d6751..506bcf1a9d 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -23,6 +23,7 @@
 
 #include "hw/i2c/i2c.h"
 #include "hw/sysbus.h"
+#include "hw/registerfields.h"
 #include "qom/object.h"
 
 #define TYPE_ASPEED_I2C "aspeed.i2c"
@@ -36,6 +37,182 @@ OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
 #define ASPEED_I2C_OLD_NUM_REG 11
 #define ASPEED_I2C_NEW_NUM_REG 22
 
+/* Tx State Machine */
+#define   I2CD_TX_STATE_MASK                  0xf
+#define     I2CD_IDLE                         0x0
+#define     I2CD_MACTIVE                      0x8
+#define     I2CD_MSTART                       0x9
+#define     I2CD_MSTARTR                      0xa
+#define     I2CD_MSTOP                        0xb
+#define     I2CD_MTXD                         0xc
+#define     I2CD_MRXACK                       0xd
+#define     I2CD_MRXD                         0xe
+#define     I2CD_MTXACK                       0xf
+#define     I2CD_SWAIT                        0x1
+#define     I2CD_SRXD                         0x4
+#define     I2CD_STXACK                       0x5
+#define     I2CD_STXD                         0x6
+#define     I2CD_SRXACK                       0x7
+#define     I2CD_RECOVER                      0x3
+
+/* I2C Global Register */
+REG32(I2C_CTRL_STATUS, 0x0) /* Device Interrupt Status */
+REG32(I2C_CTRL_ASSIGN, 0x8) /* Device Interrupt Target Assignment */
+REG32(I2C_CTRL_GLOBAL, 0xC) /* Global Control Register */
+    FIELD(I2C_CTRL_GLOBAL, REG_MODE, 2, 1)
+    FIELD(I2C_CTRL_GLOBAL, SRAM_EN, 0, 1)
+REG32(I2C_CTRL_NEW_CLK_DIVIDER, 0x10) /* New mode clock divider */
+
+/* I2C Old Mode Device (Bus) Register */
+REG32(I2CD_FUN_CTRL, 0x0) /* I2CD Function Control  */
+    FIELD(I2CD_FUN_CTRL, POOL_PAGE_SEL, 20, 3) /* AST2400 */
+    SHARED_FIELD(M_SDA_LOCK_EN, 16, 1)
+    SHARED_FIELD(MULTI_MASTER_DIS, 15, 1)
+    SHARED_FIELD(M_SCL_DRIVE_EN, 14, 1)
+    SHARED_FIELD(MSB_STS, 9, 1)
+    SHARED_FIELD(SDA_DRIVE_IT_EN, 8, 1)
+    SHARED_FIELD(M_SDA_DRIVE_IT_EN, 7, 1)
+    SHARED_FIELD(M_HIGH_SPEED_EN, 6, 1)
+    SHARED_FIELD(DEF_ADDR_EN, 5, 1)
+    SHARED_FIELD(DEF_ALERT_EN, 4, 1)
+    SHARED_FIELD(DEF_ARP_EN, 3, 1)
+    SHARED_FIELD(DEF_GCALL_EN, 2, 1)
+    SHARED_FIELD(SLAVE_EN, 1, 1)
+    SHARED_FIELD(MASTER_EN, 0, 1)
+REG32(I2CD_AC_TIMING1, 0x04) /* Clock and AC Timing Control #1 */
+REG32(I2CD_AC_TIMING2, 0x08) /* Clock and AC Timing Control #2 */
+REG32(I2CD_INTR_CTRL, 0x0C)  /* I2CD Interrupt Control */
+REG32(I2CD_INTR_STS, 0x10)   /* I2CD Interrupt Status */
+    SHARED_FIELD(SLAVE_ADDR_MATCH, 31, 1)    /* 0: addr1 1: addr2 */
+    SHARED_FIELD(SLAVE_ADDR_RX_PENDING, 29, 1)
+    SHARED_FIELD(SLAVE_INACTIVE_TIMEOUT, 15, 1)
+    SHARED_FIELD(SDA_DL_TIMEOUT, 14, 1)
+    SHARED_FIELD(BUS_RECOVER_DONE, 13, 1)
+    SHARED_FIELD(SMBUS_ALERT, 12, 1)                    /* Bus [0-3] only */
+    FIELD(I2CD_INTR_STS, SMBUS_ARP_ADDR, 11, 1)         /* Removed */
+    FIELD(I2CD_INTR_STS, SMBUS_DEV_ALERT_ADDR, 10, 1)   /* Removed */
+    FIELD(I2CD_INTR_STS, SMBUS_DEF_ADDR, 9, 1)          /* Removed */
+    FIELD(I2CD_INTR_STS, GCALL_ADDR, 8, 1)              /* Removed */
+    FIELD(I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, 7, 1)     /* use RX_DONE */
+    SHARED_FIELD(SCL_TIMEOUT, 6, 1)
+    SHARED_FIELD(ABNORMAL, 5, 1)
+    SHARED_FIELD(NORMAL_STOP, 4, 1)
+    SHARED_FIELD(ARBIT_LOSS, 3, 1)
+    SHARED_FIELD(RX_DONE, 2, 1)
+    SHARED_FIELD(TX_NAK, 1, 1)
+    SHARED_FIELD(TX_ACK, 0, 1)
+REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
+    SHARED_FIELD(SDA_OE, 28, 1)
+    SHARED_FIELD(SDA_O, 27, 1)
+    SHARED_FIELD(SCL_OE, 26, 1)
+    SHARED_FIELD(SCL_O, 25, 1)
+    SHARED_FIELD(TX_TIMING, 23, 2)
+    SHARED_FIELD(TX_STATE, 19, 4)
+    SHARED_FIELD(SCL_LINE_STS, 18, 1)
+    SHARED_FIELD(SDA_LINE_STS, 17, 1)
+    SHARED_FIELD(BUS_BUSY_STS, 16, 1)
+    SHARED_FIELD(SDA_OE_OUT_DIR, 15, 1)
+    SHARED_FIELD(SDA_O_OUT_DIR, 14, 1)
+    SHARED_FIELD(SCL_OE_OUT_DIR, 13, 1)
+    SHARED_FIELD(SCL_O_OUT_DIR, 12, 1)
+    SHARED_FIELD(BUS_RECOVER_CMD_EN, 11, 1)
+    SHARED_FIELD(S_ALT_EN, 10, 1)
+    /* Command Bits */
+    SHARED_FIELD(RX_DMA_EN, 9, 1)
+    SHARED_FIELD(TX_DMA_EN, 8, 1)
+    SHARED_FIELD(RX_BUFF_EN, 7, 1)
+    SHARED_FIELD(TX_BUFF_EN, 6, 1)
+    SHARED_FIELD(M_STOP_CMD, 5, 1)
+    SHARED_FIELD(M_S_RX_CMD_LAST, 4, 1)
+    SHARED_FIELD(M_RX_CMD, 3, 1)
+    SHARED_FIELD(S_TX_CMD, 2, 1)
+    SHARED_FIELD(M_TX_CMD, 1, 1)
+    SHARED_FIELD(M_START_CMD, 0, 1)
+REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
+REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
+    SHARED_FIELD(RX_COUNT, 24, 5)
+    SHARED_FIELD(RX_SIZE, 16, 5)
+    SHARED_FIELD(TX_COUNT, 9, 5)
+    FIELD(I2CD_POOL_CTRL, OFFSET, 2, 6) /* AST2400 */
+REG32(I2CD_BYTE_BUF, 0x20) /* Transmit/Receive Byte Buffer */
+    SHARED_FIELD(RX_BUF, 8, 8)
+    SHARED_FIELD(TX_BUF, 0, 8)
+REG32(I2CD_DMA_ADDR, 0x24) /* DMA Buffer Address */
+REG32(I2CD_DMA_LEN, 0x28) /* DMA Transfer Length < 4KB */
+
+/* I2C New Mode Device (Bus) Register */
+REG32(I2CC_FUN_CTRL, 0x0)
+    FIELD(I2CC_FUN_CTRL, RB_EARLY_DONE_EN, 22, 1)
+    FIELD(I2CC_FUN_CTRL, DMA_DIS_AUTO_RECOVER, 21, 1)
+    FIELD(I2CC_FUN_CTRL, S_SAVE_ADDR, 20, 1)
+    FIELD(I2CC_FUN_CTRL, M_PKT_RETRY_CNT, 18, 2)
+    /* 17:0 shared with I2CD_FUN_CTRL[17:0] */
+REG32(I2CC_AC_TIMING, 0x04)
+REG32(I2CC_MS_TXRX_BYTE_BUF, 0x08)
+    /* 31:16 shared with I2CD_CMD[31:16] */
+    /* 15:0  shared with I2CD_BYTE_BUF[15:0] */
+REG32(I2CC_POOL_CTRL, 0x0c)
+    /* 31:0 shared with I2CD_POOL_CTRL[31:0] */
+REG32(I2CM_INTR_CTRL, 0x10)
+REG32(I2CM_INTR_STS, 0x14)
+    FIELD(I2CM_INTR_STS, PKT_STATE, 28, 4)
+    FIELD(I2CM_INTR_STS, PKT_CMD_TIMEOUT, 18, 1)
+    FIELD(I2CM_INTR_STS, PKT_CMD_FAIL, 17, 1)
+    FIELD(I2CM_INTR_STS, PKT_CMD_DONE, 16, 1)
+    FIELD(I2CM_INTR_STS, BUS_RECOVER_FAIL, 15, 1)
+    /* 14:0 shared with I2CD_INTR_STS[14:0] */
+REG32(I2CM_CMD, 0x18)
+    FIELD(I2CM_CMD, W1_CTRL, 31, 1)
+    FIELD(I2CM_CMD, PKT_DEV_ADDR, 24, 7)
+    FIELD(I2CM_CMD, HS_MASTER_MODE_LSB, 17, 3)
+    FIELD(I2CM_CMD, PKT_OP_EN, 16, 1)
+    /* 15:0 shared with I2CD_CMD[15:0] */
+REG32(I2CM_DMA_LEN, 0x1c)
+    FIELD(I2CM_DMA_LEN, RX_BUF_LEN_W1T, 31, 1)
+    FIELD(I2CM_DMA_LEN, RX_BUF_LEN, 16, 11)
+    FIELD(I2CM_DMA_LEN, TX_BUF_LEN_W1T, 15, 1)
+    FIELD(I2CM_DMA_LEN, TX_BUF_LEN, 0, 11)
+REG32(I2CS_INTR_CTRL, 0x20)
+REG32(I2CS_INTR_STS, 0x24)
+    /* 31:29 shared with I2CD_INTR_STS[31:29] */
+    FIELD(I2CS_INTR_STS, SLAVE_PARKING_STS, 24, 2)
+    FIELD(I2CS_INTR_STS, SLAVE_ADDR3_NAK, 22, 1)
+    FIELD(I2CS_INTR_STS, SLAVE_ADDR2_NAK, 21, 1)
+    FIELD(I2CS_INTR_STS, SLAVE_ADDR1_NAK, 20, 1)
+    FIELD(I2CS_INTR_STS, SLAVE_ADDR_INDICATOR, 18, 2)
+    FIELD(I2CS_INTR_STS, PKT_CMD_FAIL, 17, 1)
+    FIELD(I2CS_INTR_STS, PKT_CMD_DONE, 16, 1)
+    /* 14:0 shared with I2CD_INTR_STS[14:0] */
+REG32(I2CS_CMD, 0x28)
+    FIELD(I2CS_CMD, W1_CTRL, 31, 1)
+    FIELD(I2CS_CMD, PKT_MODE_ACTIVE_ADDR, 17, 2)
+    FIELD(I2CS_CMD, PKT_MODE_EN, 16, 1)
+    FIELD(I2CS_CMD, AUTO_NAK_INACTIVE_ADDR, 15, 1)
+    FIELD(I2CS_CMD, AUTO_NAK_ACTIVE_ADDR, 14, 1)
+    /* 13:0 shared with I2CD_CMD[13:0] */
+REG32(I2CS_DMA_LEN, 0x2c)
+    FIELD(I2CS_DMA_LEN, RX_BUF_LEN_W1T, 31, 1)
+    FIELD(I2CS_DMA_LEN, RX_BUF_LEN, 16, 11)
+    FIELD(I2CS_DMA_LEN, TX_BUF_LEN_W1T, 15, 1)
+    FIELD(I2CS_DMA_LEN, TX_BUF_LEN, 0, 11)
+REG32(I2CM_DMA_TX_ADDR, 0x30)
+    FIELD(I2CM_DMA_TX_ADDR, ADDR, 0, 31)
+REG32(I2CM_DMA_RX_ADDR, 0x34)
+    FIELD(I2CM_DMA_RX_ADDR, ADDR, 0, 31)
+REG32(I2CS_DMA_TX_ADDR, 0x38)
+    FIELD(I2CS_DMA_TX_ADDR, ADDR, 0, 31)
+REG32(I2CS_DMA_RX_ADDR, 0x3c)
+    FIELD(I2CS_DMA_RX_ADDR, ADDR, 0, 31)
+REG32(I2CS_DEV_ADDR, 0x40)
+REG32(I2CM_DMA_LEN_STS, 0x48)
+    FIELD(I2CM_DMA_LEN_STS, RX_LEN, 16, 13)
+    FIELD(I2CM_DMA_LEN_STS, TX_LEN, 0, 13)
+REG32(I2CS_DMA_LEN_STS, 0x4c)
+    FIELD(I2CS_DMA_LEN_STS, RX_LEN, 16, 13)
+    FIELD(I2CS_DMA_LEN_STS, TX_LEN, 0, 13)
+REG32(I2CC_DMA_ADDR, 0x50)
+REG32(I2CC_DMA_LEN, 0x54)
+
 struct AspeedI2CState;
 
 #define TYPE_ASPEED_I2C_BUS "aspeed.i2c.bus"
@@ -90,6 +267,96 @@ struct AspeedI2CClass {
 
 };
 
+static inline bool aspeed_i2c_is_new_mode(AspeedI2CState *s)
+{
+    return FIELD_EX32(s->ctrl_global, I2C_CTRL_GLOBAL, REG_MODE);
+}
+
+static inline bool aspeed_i2c_bus_pkt_mode_en(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return ARRAY_FIELD_EX32(bus->regs, I2CM_CMD, PKT_OP_EN);
+    }
+    return false;
+}
+
+static inline uint32_t aspeed_i2c_bus_ctrl_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CC_FUN_CTRL;
+    }
+    return R_I2CD_FUN_CTRL;
+}
+
+static inline uint32_t aspeed_i2c_bus_cmd_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CM_CMD;
+    }
+    return R_I2CD_CMD;
+}
+
+static inline uint32_t aspeed_i2c_bus_intr_ctrl_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CM_INTR_CTRL;
+    }
+    return R_I2CD_INTR_CTRL;
+}
+
+static inline uint32_t aspeed_i2c_bus_intr_sts_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CM_INTR_STS;
+    }
+    return R_I2CD_INTR_STS;
+}
+
+static inline uint32_t aspeed_i2c_bus_pool_ctrl_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CC_POOL_CTRL;
+    }
+    return R_I2CD_POOL_CTRL;
+}
+
+static inline uint32_t aspeed_i2c_bus_byte_buf_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CC_MS_TXRX_BYTE_BUF;
+    }
+    return R_I2CD_BYTE_BUF;
+}
+
+static inline uint32_t aspeed_i2c_bus_dma_len_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CC_DMA_LEN;
+    }
+    return R_I2CD_DMA_LEN;
+}
+
+static inline uint32_t aspeed_i2c_bus_dma_addr_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CC_DMA_ADDR;
+    }
+    return R_I2CD_DMA_ADDR;
+}
+
+static inline bool aspeed_i2c_bus_is_master(AspeedI2CBus *bus)
+{
+    return SHARED_ARRAY_FIELD_EX32(bus->regs, aspeed_i2c_bus_ctrl_offset(bus),
+                                   MASTER_EN);
+}
+
+static inline bool aspeed_i2c_bus_is_enabled(AspeedI2CBus *bus)
+{
+    uint32_t ctrl_reg = aspeed_i2c_bus_ctrl_offset(bus);
+    return SHARED_ARRAY_FIELD_EX32(bus->regs, ctrl_reg, MASTER_EN) ||
+           SHARED_ARRAY_FIELD_EX32(bus->regs, ctrl_reg, SLAVE_EN);
+}
+
 I2CBus *aspeed_i2c_get_bus(AspeedI2CState *s, int busnr);
 
 #endif /* ASPEED_I2C_H */
-- 
2.35.1.1021.g381101b075-goog


