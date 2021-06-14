Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2165F3A6E6E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 20:54:14 +0200 (CEST)
Received: from localhost ([::1]:58148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsriu-0004Za-H4
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 14:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <email@aabouzied.com>)
 id 1lsrUQ-0000Mf-95
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 14:39:14 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <email@aabouzied.com>)
 id 1lsrUM-0005QL-IV
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 14:39:13 -0400
Received: by mail-ed1-x535.google.com with SMTP id r7so33393373edv.12
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 11:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aabouzied-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Pt7lJwWb8znT4niTjELFA2DSRR6HkyIZnZYmeoGiik=;
 b=IVA3Q6pWjzaUL6cqZ2pEHrW7pzgbkVmbOOcI8hTqriI7dVqQM8tXL7VtYSiNrF8PRv
 7a9BPhPKGSFIaVvlPpgBYkJFTmF9JYwiNbEr2z+Gu+a3fJVJJ5Zl5+KzGGdUqm2N+rr9
 D6umz+GzS0+lJXw75saepX6gZh/cWyMKMeua2nRZcaIFvEXzEXPJScphSEXYq7YQ0O4l
 9hoHbJ0AMbB8AZetsibf5BuC1KhApIOemvI3UhA0i0r/sZGN51Fpl6rOiYF9ITTnKPvQ
 tchGHTHYfnabJAkTwylPHgND99kC9iUBkNxHV4sJc6fciZ4VwNanRk7u5kzWXlEr7Ov/
 gqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Pt7lJwWb8znT4niTjELFA2DSRR6HkyIZnZYmeoGiik=;
 b=UCrF2hRrmub5gN7wvVZCXux5PI9VeQzQ2BZ9gqDxmtErukNTc3Hgjv028gDXck0P1f
 sCFbYlYfOT4C8+hQLp34Fu6fTjCATkGAFk1a8DtXg9X4cT4lLyYIl0Hg/mjoEPnRIUc4
 Xx8IDWUg54odcfun1dlcxsgFWNo0YHKBuy1+MkBDmn/n1mxv5Ha5KBYOlpHdoQE2U0+q
 N8k6CWCUmx5G0QbtYelP0uZOHoUQykGkZl58V3pGMjOZ6NOyfT5LMw5u/akCx5sZ5RBG
 wK/j8eyFYBXFpHoqngqoK7B9+1PoacRKWbsNpLc6fsMgD2SvEhxIl8dhqxB3ARTH/hR2
 bhSQ==
X-Gm-Message-State: AOAM532bgpkhkJIPDRBRxF8Q3WcLUZWEQA0rRxwOCIeZ/qucnYkc+8Jp
 hJFIYjAcHAEAjvhVtYwRmSCJ1s4n3V3fA336ZoXl0g==
X-Google-Smtp-Source: ABdhPJytaIVhmkqPKhJrt0ulC1v2g2Tzyb3pwPmrpl0JsvaWYphvUhw+E4K6EUaq1wZatCw6FtoOUQ==
X-Received: by 2002:a05:6402:1911:: with SMTP id
 e17mr18608720edz.62.1623695947388; 
 Mon, 14 Jun 2021 11:39:07 -0700 (PDT)
Received: from pythagoras.localdomain ([154.185.8.38])
 by smtp.gmail.com with ESMTPSA id f18sm5167472edu.5.2021.06.14.11.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 11:39:06 -0700 (PDT)
From: Ahmed Abouzied <email@aabouzied.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] net: Replace TAB indentations with spaces
Date: Mon, 14 Jun 2021 20:38:49 +0200
Message-Id: <20210614183849.20622-1-email@aabouzied.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::535;
 envelope-from=email@aabouzied.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NO_DNS_FOR_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, thuth@redhat.com,
 Ahmed Abouzied <email@aabouzied.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaces TABs with spaces, making sure to have a consistent coding style
of 4 space indentations in the net subsystem.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/377
Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
---
 hw/net/can/ctu_can_fd_frame.h |  180 ++---
 hw/net/can/ctu_can_fd_regs.h  | 1260 ++++++++++++++++-----------------
 hw/net/e1000_regs.h           |   30 +-
 hw/net/mcf_fec.c              |    8 +-
 hw/net/ne2000.c               |  138 ++--
 hw/net/pcnet.c                |  136 ++--
 hw/net/pcnet.h                |    4 +-
 net/tap-linux.h               |   10 +-
 8 files changed, 883 insertions(+), 883 deletions(-)

diff --git a/hw/net/can/ctu_can_fd_frame.h b/hw/net/can/ctu_can_fd_frame.h
index 04d956c84e..8ca199df7d 100644
--- a/hw/net/can/ctu_can_fd_frame.h
+++ b/hw/net/can/ctu_can_fd_frame.h
@@ -34,156 +34,156 @@
 
 /* CAN_Frame_format memory map */
 enum ctu_can_fd_can_frame_format {
-	CTU_CAN_FD_FRAME_FORM_W        = 0x0,
-	CTU_CAN_FD_IDENTIFIER_W        = 0x4,
-	CTU_CAN_FD_TIMESTAMP_L_W       = 0x8,
-	CTU_CAN_FD_TIMESTAMP_U_W       = 0xc,
-	CTU_CAN_FD_DATA_1_4_W         = 0x10,
-	CTU_CAN_FD_DATA_5_8_W         = 0x14,
-	CTU_CAN_FD_DATA_61_64_W       = 0x4c,
+    CTU_CAN_FD_FRAME_FORM_W        = 0x0,
+    CTU_CAN_FD_IDENTIFIER_W        = 0x4,
+    CTU_CAN_FD_TIMESTAMP_L_W       = 0x8,
+    CTU_CAN_FD_TIMESTAMP_U_W       = 0xc,
+    CTU_CAN_FD_DATA_1_4_W         = 0x10,
+    CTU_CAN_FD_DATA_5_8_W         = 0x14,
+    CTU_CAN_FD_DATA_61_64_W       = 0x4c,
 };
 
 
 /* Register descriptions: */
 union ctu_can_fd_frame_form_w {
-	uint32_t u32;
-	struct ctu_can_fd_frame_form_w_s {
+    uint32_t u32;
+    struct ctu_can_fd_frame_form_w_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* FRAME_FORM_W */
-		uint32_t dlc                     : 4;
-		uint32_t reserved_4              : 1;
-		uint32_t rtr                     : 1;
-		uint32_t ide                     : 1;
-		uint32_t fdf                     : 1;
-		uint32_t reserved_8              : 1;
-		uint32_t brs                     : 1;
-		uint32_t esi_rsv                 : 1;
-		uint32_t rwcnt                   : 5;
-		uint32_t reserved_31_16         : 16;
+        uint32_t dlc                     : 4;
+        uint32_t reserved_4              : 1;
+        uint32_t rtr                     : 1;
+        uint32_t ide                     : 1;
+        uint32_t fdf                     : 1;
+        uint32_t reserved_8              : 1;
+        uint32_t brs                     : 1;
+        uint32_t esi_rsv                 : 1;
+        uint32_t rwcnt                   : 5;
+        uint32_t reserved_31_16         : 16;
 #else
-		uint32_t reserved_31_16         : 16;
-		uint32_t rwcnt                   : 5;
-		uint32_t esi_rsv                 : 1;
-		uint32_t brs                     : 1;
-		uint32_t reserved_8              : 1;
-		uint32_t fdf                     : 1;
-		uint32_t ide                     : 1;
-		uint32_t rtr                     : 1;
-		uint32_t reserved_4              : 1;
-		uint32_t dlc                     : 4;
+        uint32_t reserved_31_16         : 16;
+        uint32_t rwcnt                   : 5;
+        uint32_t esi_rsv                 : 1;
+        uint32_t brs                     : 1;
+        uint32_t reserved_8              : 1;
+        uint32_t fdf                     : 1;
+        uint32_t ide                     : 1;
+        uint32_t rtr                     : 1;
+        uint32_t reserved_4              : 1;
+        uint32_t dlc                     : 4;
 #endif
-	} s;
+    } s;
 };
 
 enum ctu_can_fd_frame_form_w_rtr {
-	NO_RTR_FRAME       = 0x0,
-	RTR_FRAME          = 0x1,
+    NO_RTR_FRAME       = 0x0,
+    RTR_FRAME          = 0x1,
 };
 
 enum ctu_can_fd_frame_form_w_ide {
-	BASE           = 0x0,
-	EXTENDED       = 0x1,
+    BASE           = 0x0,
+    EXTENDED       = 0x1,
 };
 
 enum ctu_can_fd_frame_form_w_fdf {
-	NORMAL_CAN       = 0x0,
-	FD_CAN           = 0x1,
+    NORMAL_CAN       = 0x0,
+    FD_CAN           = 0x1,
 };
 
 enum ctu_can_fd_frame_form_w_brs {
-	BR_NO_SHIFT       = 0x0,
-	BR_SHIFT          = 0x1,
+    BR_NO_SHIFT       = 0x0,
+    BR_SHIFT          = 0x1,
 };
 
 enum ctu_can_fd_frame_form_w_esi_rsv {
-	ESI_ERR_ACTIVE       = 0x0,
-	ESI_ERR_PASIVE       = 0x1,
+    ESI_ERR_ACTIVE       = 0x0,
+    ESI_ERR_PASIVE       = 0x1,
 };
 
 union ctu_can_fd_identifier_w {
-	uint32_t u32;
-	struct ctu_can_fd_identifier_w_s {
+    uint32_t u32;
+    struct ctu_can_fd_identifier_w_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* IDENTIFIER_W */
-		uint32_t identifier_ext         : 18;
-		uint32_t identifier_base        : 11;
-		uint32_t reserved_31_29          : 3;
+        uint32_t identifier_ext         : 18;
+        uint32_t identifier_base        : 11;
+        uint32_t reserved_31_29          : 3;
 #else
-		uint32_t reserved_31_29          : 3;
-		uint32_t identifier_base        : 11;
-		uint32_t identifier_ext         : 18;
+        uint32_t reserved_31_29          : 3;
+        uint32_t identifier_base        : 11;
+        uint32_t identifier_ext         : 18;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_timestamp_l_w {
-	uint32_t u32;
-	struct ctu_can_fd_timestamp_l_w_s {
+    uint32_t u32;
+    struct ctu_can_fd_timestamp_l_w_s {
   /* TIMESTAMP_L_W */
-		uint32_t time_stamp_31_0        : 32;
-	} s;
+        uint32_t time_stamp_31_0        : 32;
+    } s;
 };
 
 union ctu_can_fd_timestamp_u_w {
-	uint32_t u32;
-	struct ctu_can_fd_timestamp_u_w_s {
+    uint32_t u32;
+    struct ctu_can_fd_timestamp_u_w_s {
   /* TIMESTAMP_U_W */
-		uint32_t timestamp_l_w          : 32;
-	} s;
+        uint32_t timestamp_l_w          : 32;
+    } s;
 };
 
 union ctu_can_fd_data_1_4_w {
-	uint32_t u32;
-	struct ctu_can_fd_data_1_4_w_s {
+    uint32_t u32;
+    struct ctu_can_fd_data_1_4_w_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* DATA_1_4_W */
-		uint32_t data_1                  : 8;
-		uint32_t data_2                  : 8;
-		uint32_t data_3                  : 8;
-		uint32_t data_4                  : 8;
+        uint32_t data_1                  : 8;
+        uint32_t data_2                  : 8;
+        uint32_t data_3                  : 8;
+        uint32_t data_4                  : 8;
 #else
-		uint32_t data_4                  : 8;
-		uint32_t data_3                  : 8;
-		uint32_t data_2                  : 8;
-		uint32_t data_1                  : 8;
+        uint32_t data_4                  : 8;
+        uint32_t data_3                  : 8;
+        uint32_t data_2                  : 8;
+        uint32_t data_1                  : 8;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_data_5_8_w {
-	uint32_t u32;
-	struct ctu_can_fd_data_5_8_w_s {
+    uint32_t u32;
+    struct ctu_can_fd_data_5_8_w_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* DATA_5_8_W */
-		uint32_t data_5                  : 8;
-		uint32_t data_6                  : 8;
-		uint32_t data_7                  : 8;
-		uint32_t data_8                  : 8;
+        uint32_t data_5                  : 8;
+        uint32_t data_6                  : 8;
+        uint32_t data_7                  : 8;
+        uint32_t data_8                  : 8;
 #else
-		uint32_t data_8                  : 8;
-		uint32_t data_7                  : 8;
-		uint32_t data_6                  : 8;
-		uint32_t data_5                  : 8;
+        uint32_t data_8                  : 8;
+        uint32_t data_7                  : 8;
+        uint32_t data_6                  : 8;
+        uint32_t data_5                  : 8;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_data_61_64_w {
-	uint32_t u32;
-	struct ctu_can_fd_data_61_64_w_s {
+    uint32_t u32;
+    struct ctu_can_fd_data_61_64_w_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* DATA_61_64_W */
-		uint32_t data_61                 : 8;
-		uint32_t data_62                 : 8;
-		uint32_t data_63                 : 8;
-		uint32_t data_64                 : 8;
+        uint32_t data_61                 : 8;
+        uint32_t data_62                 : 8;
+        uint32_t data_63                 : 8;
+        uint32_t data_64                 : 8;
 #else
-		uint32_t data_64                 : 8;
-		uint32_t data_63                 : 8;
-		uint32_t data_62                 : 8;
-		uint32_t data_61                 : 8;
+        uint32_t data_64                 : 8;
+        uint32_t data_63                 : 8;
+        uint32_t data_62                 : 8;
+        uint32_t data_61                 : 8;
 #endif
-	} s;
+    } s;
 };
 
 #endif
diff --git a/hw/net/can/ctu_can_fd_regs.h b/hw/net/can/ctu_can_fd_regs.h
index 450f4b9fb3..ccd7d1670b 100644
--- a/hw/net/can/ctu_can_fd_regs.h
+++ b/hw/net/can/ctu_can_fd_regs.h
@@ -34,938 +34,938 @@
 
 /* CAN_Registers memory map */
 enum ctu_can_fd_can_registers {
-	CTU_CAN_FD_DEVICE_ID             = 0x0,
-	CTU_CAN_FD_VERSION               = 0x2,
-	CTU_CAN_FD_MODE                  = 0x4,
-	CTU_CAN_FD_SETTINGS              = 0x6,
-	CTU_CAN_FD_STATUS                = 0x8,
-	CTU_CAN_FD_COMMAND               = 0xc,
-	CTU_CAN_FD_INT_STAT             = 0x10,
-	CTU_CAN_FD_INT_ENA_SET          = 0x14,
-	CTU_CAN_FD_INT_ENA_CLR          = 0x18,
-	CTU_CAN_FD_INT_MASK_SET         = 0x1c,
-	CTU_CAN_FD_INT_MASK_CLR         = 0x20,
-	CTU_CAN_FD_BTR                  = 0x24,
-	CTU_CAN_FD_BTR_FD               = 0x28,
-	CTU_CAN_FD_EWL                  = 0x2c,
-	CTU_CAN_FD_ERP                  = 0x2d,
-	CTU_CAN_FD_FAULT_STATE          = 0x2e,
-	CTU_CAN_FD_REC                  = 0x30,
-	CTU_CAN_FD_TEC                  = 0x32,
-	CTU_CAN_FD_ERR_NORM             = 0x34,
-	CTU_CAN_FD_ERR_FD               = 0x36,
-	CTU_CAN_FD_CTR_PRES             = 0x38,
-	CTU_CAN_FD_FILTER_A_MASK        = 0x3c,
-	CTU_CAN_FD_FILTER_A_VAL         = 0x40,
-	CTU_CAN_FD_FILTER_B_MASK        = 0x44,
-	CTU_CAN_FD_FILTER_B_VAL         = 0x48,
-	CTU_CAN_FD_FILTER_C_MASK        = 0x4c,
-	CTU_CAN_FD_FILTER_C_VAL         = 0x50,
-	CTU_CAN_FD_FILTER_RAN_LOW       = 0x54,
-	CTU_CAN_FD_FILTER_RAN_HIGH      = 0x58,
-	CTU_CAN_FD_FILTER_CONTROL       = 0x5c,
-	CTU_CAN_FD_FILTER_STATUS        = 0x5e,
-	CTU_CAN_FD_RX_MEM_INFO          = 0x60,
-	CTU_CAN_FD_RX_POINTERS          = 0x64,
-	CTU_CAN_FD_RX_STATUS            = 0x68,
-	CTU_CAN_FD_RX_SETTINGS          = 0x6a,
-	CTU_CAN_FD_RX_DATA              = 0x6c,
-	CTU_CAN_FD_TX_STATUS            = 0x70,
-	CTU_CAN_FD_TX_COMMAND           = 0x74,
-	CTU_CAN_FD_TX_PRIORITY          = 0x78,
-	CTU_CAN_FD_ERR_CAPT             = 0x7c,
-	CTU_CAN_FD_ALC                  = 0x7e,
-	CTU_CAN_FD_TRV_DELAY            = 0x80,
-	CTU_CAN_FD_SSP_CFG              = 0x82,
-	CTU_CAN_FD_RX_FR_CTR            = 0x84,
-	CTU_CAN_FD_TX_FR_CTR            = 0x88,
-	CTU_CAN_FD_DEBUG_REGISTER       = 0x8c,
-	CTU_CAN_FD_YOLO_REG             = 0x90,
-	CTU_CAN_FD_TIMESTAMP_LOW        = 0x94,
-	CTU_CAN_FD_TIMESTAMP_HIGH       = 0x98,
-	CTU_CAN_FD_TXTB1_DATA_1        = 0x100,
-	CTU_CAN_FD_TXTB1_DATA_2        = 0x104,
-	CTU_CAN_FD_TXTB1_DATA_20       = 0x14c,
-	CTU_CAN_FD_TXTB2_DATA_1        = 0x200,
-	CTU_CAN_FD_TXTB2_DATA_2        = 0x204,
-	CTU_CAN_FD_TXTB2_DATA_20       = 0x24c,
-	CTU_CAN_FD_TXTB3_DATA_1        = 0x300,
-	CTU_CAN_FD_TXTB3_DATA_2        = 0x304,
-	CTU_CAN_FD_TXTB3_DATA_20       = 0x34c,
-	CTU_CAN_FD_TXTB4_DATA_1        = 0x400,
-	CTU_CAN_FD_TXTB4_DATA_2        = 0x404,
-	CTU_CAN_FD_TXTB4_DATA_20       = 0x44c,
+    CTU_CAN_FD_DEVICE_ID             = 0x0,
+    CTU_CAN_FD_VERSION               = 0x2,
+    CTU_CAN_FD_MODE                  = 0x4,
+    CTU_CAN_FD_SETTINGS              = 0x6,
+    CTU_CAN_FD_STATUS                = 0x8,
+    CTU_CAN_FD_COMMAND               = 0xc,
+    CTU_CAN_FD_INT_STAT             = 0x10,
+    CTU_CAN_FD_INT_ENA_SET          = 0x14,
+    CTU_CAN_FD_INT_ENA_CLR          = 0x18,
+    CTU_CAN_FD_INT_MASK_SET         = 0x1c,
+    CTU_CAN_FD_INT_MASK_CLR         = 0x20,
+    CTU_CAN_FD_BTR                  = 0x24,
+    CTU_CAN_FD_BTR_FD               = 0x28,
+    CTU_CAN_FD_EWL                  = 0x2c,
+    CTU_CAN_FD_ERP                  = 0x2d,
+    CTU_CAN_FD_FAULT_STATE          = 0x2e,
+    CTU_CAN_FD_REC                  = 0x30,
+    CTU_CAN_FD_TEC                  = 0x32,
+    CTU_CAN_FD_ERR_NORM             = 0x34,
+    CTU_CAN_FD_ERR_FD               = 0x36,
+    CTU_CAN_FD_CTR_PRES             = 0x38,
+    CTU_CAN_FD_FILTER_A_MASK        = 0x3c,
+    CTU_CAN_FD_FILTER_A_VAL         = 0x40,
+    CTU_CAN_FD_FILTER_B_MASK        = 0x44,
+    CTU_CAN_FD_FILTER_B_VAL         = 0x48,
+    CTU_CAN_FD_FILTER_C_MASK        = 0x4c,
+    CTU_CAN_FD_FILTER_C_VAL         = 0x50,
+    CTU_CAN_FD_FILTER_RAN_LOW       = 0x54,
+    CTU_CAN_FD_FILTER_RAN_HIGH      = 0x58,
+    CTU_CAN_FD_FILTER_CONTROL       = 0x5c,
+    CTU_CAN_FD_FILTER_STATUS        = 0x5e,
+    CTU_CAN_FD_RX_MEM_INFO          = 0x60,
+    CTU_CAN_FD_RX_POINTERS          = 0x64,
+    CTU_CAN_FD_RX_STATUS            = 0x68,
+    CTU_CAN_FD_RX_SETTINGS          = 0x6a,
+    CTU_CAN_FD_RX_DATA              = 0x6c,
+    CTU_CAN_FD_TX_STATUS            = 0x70,
+    CTU_CAN_FD_TX_COMMAND           = 0x74,
+    CTU_CAN_FD_TX_PRIORITY          = 0x78,
+    CTU_CAN_FD_ERR_CAPT             = 0x7c,
+    CTU_CAN_FD_ALC                  = 0x7e,
+    CTU_CAN_FD_TRV_DELAY            = 0x80,
+    CTU_CAN_FD_SSP_CFG              = 0x82,
+    CTU_CAN_FD_RX_FR_CTR            = 0x84,
+    CTU_CAN_FD_TX_FR_CTR            = 0x88,
+    CTU_CAN_FD_DEBUG_REGISTER       = 0x8c,
+    CTU_CAN_FD_YOLO_REG             = 0x90,
+    CTU_CAN_FD_TIMESTAMP_LOW        = 0x94,
+    CTU_CAN_FD_TIMESTAMP_HIGH       = 0x98,
+    CTU_CAN_FD_TXTB1_DATA_1        = 0x100,
+    CTU_CAN_FD_TXTB1_DATA_2        = 0x104,
+    CTU_CAN_FD_TXTB1_DATA_20       = 0x14c,
+    CTU_CAN_FD_TXTB2_DATA_1        = 0x200,
+    CTU_CAN_FD_TXTB2_DATA_2        = 0x204,
+    CTU_CAN_FD_TXTB2_DATA_20       = 0x24c,
+    CTU_CAN_FD_TXTB3_DATA_1        = 0x300,
+    CTU_CAN_FD_TXTB3_DATA_2        = 0x304,
+    CTU_CAN_FD_TXTB3_DATA_20       = 0x34c,
+    CTU_CAN_FD_TXTB4_DATA_1        = 0x400,
+    CTU_CAN_FD_TXTB4_DATA_2        = 0x404,
+    CTU_CAN_FD_TXTB4_DATA_20       = 0x44c,
 };
 
 
 /* Register descriptions: */
 union ctu_can_fd_device_id_version {
-	uint32_t u32;
-	struct ctu_can_fd_device_id_version_s {
+    uint32_t u32;
+    struct ctu_can_fd_device_id_version_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* DEVICE_ID */
-		uint32_t device_id              : 16;
+        uint32_t device_id              : 16;
   /* VERSION */
-		uint32_t ver_minor               : 8;
-		uint32_t ver_major               : 8;
+        uint32_t ver_minor               : 8;
+        uint32_t ver_major               : 8;
 #else
-		uint32_t ver_major               : 8;
-		uint32_t ver_minor               : 8;
-		uint32_t device_id              : 16;
+        uint32_t ver_major               : 8;
+        uint32_t ver_minor               : 8;
+        uint32_t device_id              : 16;
 #endif
-	} s;
+    } s;
 };
 
 enum ctu_can_fd_device_id_device_id {
-	CTU_CAN_FD_ID    = 0xcafd,
+    CTU_CAN_FD_ID    = 0xcafd,
 };
 
 union ctu_can_fd_mode_settings {
-	uint32_t u32;
-	struct ctu_can_fd_mode_settings_s {
+    uint32_t u32;
+    struct ctu_can_fd_mode_settings_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* MODE */
-		uint32_t rst                     : 1;
-		uint32_t lom                     : 1;
-		uint32_t stm                     : 1;
-		uint32_t afm                     : 1;
-		uint32_t fde                     : 1;
-		uint32_t reserved_6_5            : 2;
-		uint32_t acf                     : 1;
-		uint32_t tstm                    : 1;
-		uint32_t reserved_15_9           : 7;
+        uint32_t rst                     : 1;
+        uint32_t lom                     : 1;
+        uint32_t stm                     : 1;
+        uint32_t afm                     : 1;
+        uint32_t fde                     : 1;
+        uint32_t reserved_6_5            : 2;
+        uint32_t acf                     : 1;
+        uint32_t tstm                    : 1;
+        uint32_t reserved_15_9           : 7;
   /* SETTINGS */
-		uint32_t rtrle                   : 1;
-		uint32_t rtrth                   : 4;
-		uint32_t ilbp                    : 1;
-		uint32_t ena                     : 1;
-		uint32_t nisofd                  : 1;
-		uint32_t pex                     : 1;
-		uint32_t reserved_31_25          : 7;
-#else
-		uint32_t reserved_31_25          : 7;
-		uint32_t pex                     : 1;
-		uint32_t nisofd                  : 1;
-		uint32_t ena                     : 1;
-		uint32_t ilbp                    : 1;
-		uint32_t rtrth                   : 4;
-		uint32_t rtrle                   : 1;
-		uint32_t reserved_15_9           : 7;
-		uint32_t tstm                    : 1;
-		uint32_t acf                     : 1;
-		uint32_t reserved_6_5            : 2;
-		uint32_t fde                     : 1;
-		uint32_t afm                     : 1;
-		uint32_t stm                     : 1;
-		uint32_t lom                     : 1;
-		uint32_t rst                     : 1;
-#endif
-	} s;
+        uint32_t rtrle                   : 1;
+        uint32_t rtrth                   : 4;
+        uint32_t ilbp                    : 1;
+        uint32_t ena                     : 1;
+        uint32_t nisofd                  : 1;
+        uint32_t pex                     : 1;
+        uint32_t reserved_31_25          : 7;
+#else
+        uint32_t reserved_31_25          : 7;
+        uint32_t pex                     : 1;
+        uint32_t nisofd                  : 1;
+        uint32_t ena                     : 1;
+        uint32_t ilbp                    : 1;
+        uint32_t rtrth                   : 4;
+        uint32_t rtrle                   : 1;
+        uint32_t reserved_15_9           : 7;
+        uint32_t tstm                    : 1;
+        uint32_t acf                     : 1;
+        uint32_t reserved_6_5            : 2;
+        uint32_t fde                     : 1;
+        uint32_t afm                     : 1;
+        uint32_t stm                     : 1;
+        uint32_t lom                     : 1;
+        uint32_t rst                     : 1;
+#endif
+    } s;
 };
 
 enum ctu_can_fd_mode_lom {
-	LOM_DISABLED       = 0x0,
-	LOM_ENABLED        = 0x1,
+    LOM_DISABLED       = 0x0,
+    LOM_ENABLED        = 0x1,
 };
 
 enum ctu_can_fd_mode_stm {
-	STM_DISABLED       = 0x0,
-	STM_ENABLED        = 0x1,
+    STM_DISABLED       = 0x0,
+    STM_ENABLED        = 0x1,
 };
 
 enum ctu_can_fd_mode_afm {
-	AFM_DISABLED       = 0x0,
-	AFM_ENABLED        = 0x1,
+    AFM_DISABLED       = 0x0,
+    AFM_ENABLED        = 0x1,
 };
 
 enum ctu_can_fd_mode_fde {
-	FDE_DISABLE       = 0x0,
-	FDE_ENABLE        = 0x1,
+    FDE_DISABLE       = 0x0,
+    FDE_ENABLE        = 0x1,
 };
 
 enum ctu_can_fd_mode_acf {
-	ACF_DISABLED       = 0x0,
-	ACF_ENABLED        = 0x1,
+    ACF_DISABLED       = 0x0,
+    ACF_ENABLED        = 0x1,
 };
 
 enum ctu_can_fd_settings_rtrle {
-	RTRLE_DISABLED       = 0x0,
-	RTRLE_ENABLED        = 0x1,
+    RTRLE_DISABLED       = 0x0,
+    RTRLE_ENABLED        = 0x1,
 };
 
 enum ctu_can_fd_settings_ilbp {
-	INT_LOOP_DISABLED       = 0x0,
-	INT_LOOP_ENABLED        = 0x1,
+    INT_LOOP_DISABLED       = 0x0,
+    INT_LOOP_ENABLED        = 0x1,
 };
 
 enum ctu_can_fd_settings_ena {
-	CTU_CAN_DISABLED       = 0x0,
-	CTU_CAN_ENABLED        = 0x1,
+    CTU_CAN_DISABLED       = 0x0,
+    CTU_CAN_ENABLED        = 0x1,
 };
 
 enum ctu_can_fd_settings_nisofd {
-	ISO_FD           = 0x0,
-	NON_ISO_FD       = 0x1,
+    ISO_FD           = 0x0,
+    NON_ISO_FD       = 0x1,
 };
 
 enum ctu_can_fd_settings_pex {
-	PROTOCOL_EXCEPTION_DISABLED       = 0x0,
-	PROTOCOL_EXCEPTION_ENABLED        = 0x1,
+    PROTOCOL_EXCEPTION_DISABLED       = 0x0,
+    PROTOCOL_EXCEPTION_ENABLED        = 0x1,
 };
 
 union ctu_can_fd_status {
-	uint32_t u32;
-	struct ctu_can_fd_status_s {
+    uint32_t u32;
+    struct ctu_can_fd_status_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* STATUS */
-		uint32_t rxne                    : 1;
-		uint32_t dor                     : 1;
-		uint32_t txnf                    : 1;
-		uint32_t eft                     : 1;
-		uint32_t rxs                     : 1;
-		uint32_t txs                     : 1;
-		uint32_t ewl                     : 1;
-		uint32_t idle                    : 1;
-		uint32_t reserved_31_8          : 24;
-#else
-		uint32_t reserved_31_8          : 24;
-		uint32_t idle                    : 1;
-		uint32_t ewl                     : 1;
-		uint32_t txs                     : 1;
-		uint32_t rxs                     : 1;
-		uint32_t eft                     : 1;
-		uint32_t txnf                    : 1;
-		uint32_t dor                     : 1;
-		uint32_t rxne                    : 1;
-#endif
-	} s;
+        uint32_t rxne                    : 1;
+        uint32_t dor                     : 1;
+        uint32_t txnf                    : 1;
+        uint32_t eft                     : 1;
+        uint32_t rxs                     : 1;
+        uint32_t txs                     : 1;
+        uint32_t ewl                     : 1;
+        uint32_t idle                    : 1;
+        uint32_t reserved_31_8          : 24;
+#else
+        uint32_t reserved_31_8          : 24;
+        uint32_t idle                    : 1;
+        uint32_t ewl                     : 1;
+        uint32_t txs                     : 1;
+        uint32_t rxs                     : 1;
+        uint32_t eft                     : 1;
+        uint32_t txnf                    : 1;
+        uint32_t dor                     : 1;
+        uint32_t rxne                    : 1;
+#endif
+    } s;
 };
 
 union ctu_can_fd_command {
-	uint32_t u32;
-	struct ctu_can_fd_command_s {
+    uint32_t u32;
+    struct ctu_can_fd_command_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
-		uint32_t reserved_1_0            : 2;
+        uint32_t reserved_1_0            : 2;
   /* COMMAND */
-		uint32_t rrb                     : 1;
-		uint32_t cdo                     : 1;
-		uint32_t ercrst                  : 1;
-		uint32_t rxfcrst                 : 1;
-		uint32_t txfcrst                 : 1;
-		uint32_t reserved_31_7          : 25;
+        uint32_t rrb                     : 1;
+        uint32_t cdo                     : 1;
+        uint32_t ercrst                  : 1;
+        uint32_t rxfcrst                 : 1;
+        uint32_t txfcrst                 : 1;
+        uint32_t reserved_31_7          : 25;
 #else
-		uint32_t reserved_31_7          : 25;
-		uint32_t txfcrst                 : 1;
-		uint32_t rxfcrst                 : 1;
-		uint32_t ercrst                  : 1;
-		uint32_t cdo                     : 1;
-		uint32_t rrb                     : 1;
-		uint32_t reserved_1_0            : 2;
+        uint32_t reserved_31_7          : 25;
+        uint32_t txfcrst                 : 1;
+        uint32_t rxfcrst                 : 1;
+        uint32_t ercrst                  : 1;
+        uint32_t cdo                     : 1;
+        uint32_t rrb                     : 1;
+        uint32_t reserved_1_0            : 2;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_int_stat {
-	uint32_t u32;
-	struct ctu_can_fd_int_stat_s {
+    uint32_t u32;
+    struct ctu_can_fd_int_stat_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* INT_STAT */
-		uint32_t rxi                     : 1;
-		uint32_t txi                     : 1;
-		uint32_t ewli                    : 1;
-		uint32_t doi                     : 1;
-		uint32_t fcsi                    : 1;
-		uint32_t ali                     : 1;
-		uint32_t bei                     : 1;
-		uint32_t ofi                     : 1;
-		uint32_t rxfi                    : 1;
-		uint32_t bsi                     : 1;
-		uint32_t rbnei                   : 1;
-		uint32_t txbhci                  : 1;
-		uint32_t reserved_31_12         : 20;
-#else
-		uint32_t reserved_31_12         : 20;
-		uint32_t txbhci                  : 1;
-		uint32_t rbnei                   : 1;
-		uint32_t bsi                     : 1;
-		uint32_t rxfi                    : 1;
-		uint32_t ofi                     : 1;
-		uint32_t bei                     : 1;
-		uint32_t ali                     : 1;
-		uint32_t fcsi                    : 1;
-		uint32_t doi                     : 1;
-		uint32_t ewli                    : 1;
-		uint32_t txi                     : 1;
-		uint32_t rxi                     : 1;
-#endif
-	} s;
+        uint32_t rxi                     : 1;
+        uint32_t txi                     : 1;
+        uint32_t ewli                    : 1;
+        uint32_t doi                     : 1;
+        uint32_t fcsi                    : 1;
+        uint32_t ali                     : 1;
+        uint32_t bei                     : 1;
+        uint32_t ofi                     : 1;
+        uint32_t rxfi                    : 1;
+        uint32_t bsi                     : 1;
+        uint32_t rbnei                   : 1;
+        uint32_t txbhci                  : 1;
+        uint32_t reserved_31_12         : 20;
+#else
+        uint32_t reserved_31_12         : 20;
+        uint32_t txbhci                  : 1;
+        uint32_t rbnei                   : 1;
+        uint32_t bsi                     : 1;
+        uint32_t rxfi                    : 1;
+        uint32_t ofi                     : 1;
+        uint32_t bei                     : 1;
+        uint32_t ali                     : 1;
+        uint32_t fcsi                    : 1;
+        uint32_t doi                     : 1;
+        uint32_t ewli                    : 1;
+        uint32_t txi                     : 1;
+        uint32_t rxi                     : 1;
+#endif
+    } s;
 };
 
 union ctu_can_fd_int_ena_set {
-	uint32_t u32;
-	struct ctu_can_fd_int_ena_set_s {
+    uint32_t u32;
+    struct ctu_can_fd_int_ena_set_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* INT_ENA_SET */
-		uint32_t int_ena_set            : 12;
-		uint32_t reserved_31_12         : 20;
+        uint32_t int_ena_set            : 12;
+        uint32_t reserved_31_12         : 20;
 #else
-		uint32_t reserved_31_12         : 20;
-		uint32_t int_ena_set            : 12;
+        uint32_t reserved_31_12         : 20;
+        uint32_t int_ena_set            : 12;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_int_ena_clr {
-	uint32_t u32;
-	struct ctu_can_fd_int_ena_clr_s {
+    uint32_t u32;
+    struct ctu_can_fd_int_ena_clr_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* INT_ENA_CLR */
-		uint32_t int_ena_clr            : 12;
-		uint32_t reserved_31_12         : 20;
+        uint32_t int_ena_clr            : 12;
+        uint32_t reserved_31_12         : 20;
 #else
-		uint32_t reserved_31_12         : 20;
-		uint32_t int_ena_clr            : 12;
+        uint32_t reserved_31_12         : 20;
+        uint32_t int_ena_clr            : 12;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_int_mask_set {
-	uint32_t u32;
-	struct ctu_can_fd_int_mask_set_s {
+    uint32_t u32;
+    struct ctu_can_fd_int_mask_set_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* INT_MASK_SET */
-		uint32_t int_mask_set           : 12;
-		uint32_t reserved_31_12         : 20;
+        uint32_t int_mask_set           : 12;
+        uint32_t reserved_31_12         : 20;
 #else
-		uint32_t reserved_31_12         : 20;
-		uint32_t int_mask_set           : 12;
+        uint32_t reserved_31_12         : 20;
+        uint32_t int_mask_set           : 12;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_int_mask_clr {
-	uint32_t u32;
-	struct ctu_can_fd_int_mask_clr_s {
+    uint32_t u32;
+    struct ctu_can_fd_int_mask_clr_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* INT_MASK_CLR */
-		uint32_t int_mask_clr           : 12;
-		uint32_t reserved_31_12         : 20;
+        uint32_t int_mask_clr           : 12;
+        uint32_t reserved_31_12         : 20;
 #else
-		uint32_t reserved_31_12         : 20;
-		uint32_t int_mask_clr           : 12;
+        uint32_t reserved_31_12         : 20;
+        uint32_t int_mask_clr           : 12;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_btr {
-	uint32_t u32;
-	struct ctu_can_fd_btr_s {
+    uint32_t u32;
+    struct ctu_can_fd_btr_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* BTR */
-		uint32_t prop                    : 7;
-		uint32_t ph1                     : 6;
-		uint32_t ph2                     : 6;
-		uint32_t brp                     : 8;
-		uint32_t sjw                     : 5;
+        uint32_t prop                    : 7;
+        uint32_t ph1                     : 6;
+        uint32_t ph2                     : 6;
+        uint32_t brp                     : 8;
+        uint32_t sjw                     : 5;
 #else
-		uint32_t sjw                     : 5;
-		uint32_t brp                     : 8;
-		uint32_t ph2                     : 6;
-		uint32_t ph1                     : 6;
-		uint32_t prop                    : 7;
+        uint32_t sjw                     : 5;
+        uint32_t brp                     : 8;
+        uint32_t ph2                     : 6;
+        uint32_t ph1                     : 6;
+        uint32_t prop                    : 7;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_btr_fd {
-	uint32_t u32;
-	struct ctu_can_fd_btr_fd_s {
+    uint32_t u32;
+    struct ctu_can_fd_btr_fd_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* BTR_FD */
-		uint32_t prop_fd                 : 6;
-		uint32_t reserved_6              : 1;
-		uint32_t ph1_fd                  : 5;
-		uint32_t reserved_12             : 1;
-		uint32_t ph2_fd                  : 5;
-		uint32_t reserved_18             : 1;
-		uint32_t brp_fd                  : 8;
-		uint32_t sjw_fd                  : 5;
-#else
-		uint32_t sjw_fd                  : 5;
-		uint32_t brp_fd                  : 8;
-		uint32_t reserved_18             : 1;
-		uint32_t ph2_fd                  : 5;
-		uint32_t reserved_12             : 1;
-		uint32_t ph1_fd                  : 5;
-		uint32_t reserved_6              : 1;
-		uint32_t prop_fd                 : 6;
-#endif
-	} s;
+        uint32_t prop_fd                 : 6;
+        uint32_t reserved_6              : 1;
+        uint32_t ph1_fd                  : 5;
+        uint32_t reserved_12             : 1;
+        uint32_t ph2_fd                  : 5;
+        uint32_t reserved_18             : 1;
+        uint32_t brp_fd                  : 8;
+        uint32_t sjw_fd                  : 5;
+#else
+        uint32_t sjw_fd                  : 5;
+        uint32_t brp_fd                  : 8;
+        uint32_t reserved_18             : 1;
+        uint32_t ph2_fd                  : 5;
+        uint32_t reserved_12             : 1;
+        uint32_t ph1_fd                  : 5;
+        uint32_t reserved_6              : 1;
+        uint32_t prop_fd                 : 6;
+#endif
+    } s;
 };
 
 union ctu_can_fd_ewl_erp_fault_state {
-	uint32_t u32;
-	struct ctu_can_fd_ewl_erp_fault_state_s {
+    uint32_t u32;
+    struct ctu_can_fd_ewl_erp_fault_state_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* EWL */
-		uint32_t ew_limit                : 8;
+        uint32_t ew_limit                : 8;
   /* ERP */
-		uint32_t erp_limit               : 8;
+        uint32_t erp_limit               : 8;
   /* FAULT_STATE */
-		uint32_t era                     : 1;
-		uint32_t erp                     : 1;
-		uint32_t bof                     : 1;
-		uint32_t reserved_31_19         : 13;
+        uint32_t era                     : 1;
+        uint32_t erp                     : 1;
+        uint32_t bof                     : 1;
+        uint32_t reserved_31_19         : 13;
 #else
-		uint32_t reserved_31_19         : 13;
-		uint32_t bof                     : 1;
-		uint32_t erp                     : 1;
-		uint32_t era                     : 1;
-		uint32_t erp_limit               : 8;
-		uint32_t ew_limit                : 8;
+        uint32_t reserved_31_19         : 13;
+        uint32_t bof                     : 1;
+        uint32_t erp                     : 1;
+        uint32_t era                     : 1;
+        uint32_t erp_limit               : 8;
+        uint32_t ew_limit                : 8;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_rec_tec {
-	uint32_t u32;
-	struct ctu_can_fd_rec_tec_s {
+    uint32_t u32;
+    struct ctu_can_fd_rec_tec_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* REC */
-		uint32_t rec_val                 : 9;
-		uint32_t reserved_15_9           : 7;
+        uint32_t rec_val                 : 9;
+        uint32_t reserved_15_9           : 7;
   /* TEC */
-		uint32_t tec_val                 : 9;
-		uint32_t reserved_31_25          : 7;
+        uint32_t tec_val                 : 9;
+        uint32_t reserved_31_25          : 7;
 #else
-		uint32_t reserved_31_25          : 7;
-		uint32_t tec_val                 : 9;
-		uint32_t reserved_15_9           : 7;
-		uint32_t rec_val                 : 9;
+        uint32_t reserved_31_25          : 7;
+        uint32_t tec_val                 : 9;
+        uint32_t reserved_15_9           : 7;
+        uint32_t rec_val                 : 9;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_err_norm_err_fd {
-	uint32_t u32;
-	struct ctu_can_fd_err_norm_err_fd_s {
+    uint32_t u32;
+    struct ctu_can_fd_err_norm_err_fd_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* ERR_NORM */
-		uint32_t err_norm_val           : 16;
+        uint32_t err_norm_val           : 16;
   /* ERR_FD */
-		uint32_t err_fd_val             : 16;
+        uint32_t err_fd_val             : 16;
 #else
-		uint32_t err_fd_val             : 16;
-		uint32_t err_norm_val           : 16;
+        uint32_t err_fd_val             : 16;
+        uint32_t err_norm_val           : 16;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_ctr_pres {
-	uint32_t u32;
-	struct ctu_can_fd_ctr_pres_s {
+    uint32_t u32;
+    struct ctu_can_fd_ctr_pres_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* CTR_PRES */
-		uint32_t ctpv                    : 9;
-		uint32_t ptx                     : 1;
-		uint32_t prx                     : 1;
-		uint32_t enorm                   : 1;
-		uint32_t efd                     : 1;
-		uint32_t reserved_31_13         : 19;
+        uint32_t ctpv                    : 9;
+        uint32_t ptx                     : 1;
+        uint32_t prx                     : 1;
+        uint32_t enorm                   : 1;
+        uint32_t efd                     : 1;
+        uint32_t reserved_31_13         : 19;
 #else
-		uint32_t reserved_31_13         : 19;
-		uint32_t efd                     : 1;
-		uint32_t enorm                   : 1;
-		uint32_t prx                     : 1;
-		uint32_t ptx                     : 1;
-		uint32_t ctpv                    : 9;
+        uint32_t reserved_31_13         : 19;
+        uint32_t efd                     : 1;
+        uint32_t enorm                   : 1;
+        uint32_t prx                     : 1;
+        uint32_t ptx                     : 1;
+        uint32_t ctpv                    : 9;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_filter_a_mask {
-	uint32_t u32;
-	struct ctu_can_fd_filter_a_mask_s {
+    uint32_t u32;
+    struct ctu_can_fd_filter_a_mask_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* FILTER_A_MASK */
-		uint32_t bit_mask_a_val         : 29;
-		uint32_t reserved_31_29          : 3;
+        uint32_t bit_mask_a_val         : 29;
+        uint32_t reserved_31_29          : 3;
 #else
-		uint32_t reserved_31_29          : 3;
-		uint32_t bit_mask_a_val         : 29;
+        uint32_t reserved_31_29          : 3;
+        uint32_t bit_mask_a_val         : 29;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_filter_a_val {
-	uint32_t u32;
-	struct ctu_can_fd_filter_a_val_s {
+    uint32_t u32;
+    struct ctu_can_fd_filter_a_val_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* FILTER_A_VAL */
-		uint32_t bit_val_a_val          : 29;
-		uint32_t reserved_31_29          : 3;
+        uint32_t bit_val_a_val          : 29;
+        uint32_t reserved_31_29          : 3;
 #else
-		uint32_t reserved_31_29          : 3;
-		uint32_t bit_val_a_val          : 29;
+        uint32_t reserved_31_29          : 3;
+        uint32_t bit_val_a_val          : 29;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_filter_b_mask {
-	uint32_t u32;
-	struct ctu_can_fd_filter_b_mask_s {
+    uint32_t u32;
+    struct ctu_can_fd_filter_b_mask_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* FILTER_B_MASK */
-		uint32_t bit_mask_b_val         : 29;
-		uint32_t reserved_31_29          : 3;
+        uint32_t bit_mask_b_val         : 29;
+        uint32_t reserved_31_29          : 3;
 #else
-		uint32_t reserved_31_29          : 3;
-		uint32_t bit_mask_b_val         : 29;
+        uint32_t reserved_31_29          : 3;
+        uint32_t bit_mask_b_val         : 29;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_filter_b_val {
-	uint32_t u32;
-	struct ctu_can_fd_filter_b_val_s {
+    uint32_t u32;
+    struct ctu_can_fd_filter_b_val_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* FILTER_B_VAL */
-		uint32_t bit_val_b_val          : 29;
-		uint32_t reserved_31_29          : 3;
+        uint32_t bit_val_b_val          : 29;
+        uint32_t reserved_31_29          : 3;
 #else
-		uint32_t reserved_31_29          : 3;
-		uint32_t bit_val_b_val          : 29;
+        uint32_t reserved_31_29          : 3;
+        uint32_t bit_val_b_val          : 29;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_filter_c_mask {
-	uint32_t u32;
-	struct ctu_can_fd_filter_c_mask_s {
+    uint32_t u32;
+    struct ctu_can_fd_filter_c_mask_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* FILTER_C_MASK */
-		uint32_t bit_mask_c_val         : 29;
-		uint32_t reserved_31_29          : 3;
+        uint32_t bit_mask_c_val         : 29;
+        uint32_t reserved_31_29          : 3;
 #else
-		uint32_t reserved_31_29          : 3;
-		uint32_t bit_mask_c_val         : 29;
+        uint32_t reserved_31_29          : 3;
+        uint32_t bit_mask_c_val         : 29;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_filter_c_val {
-	uint32_t u32;
-	struct ctu_can_fd_filter_c_val_s {
+    uint32_t u32;
+    struct ctu_can_fd_filter_c_val_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* FILTER_C_VAL */
-		uint32_t bit_val_c_val          : 29;
-		uint32_t reserved_31_29          : 3;
+        uint32_t bit_val_c_val          : 29;
+        uint32_t reserved_31_29          : 3;
 #else
-		uint32_t reserved_31_29          : 3;
-		uint32_t bit_val_c_val          : 29;
+        uint32_t reserved_31_29          : 3;
+        uint32_t bit_val_c_val          : 29;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_filter_ran_low {
-	uint32_t u32;
-	struct ctu_can_fd_filter_ran_low_s {
+    uint32_t u32;
+    struct ctu_can_fd_filter_ran_low_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* FILTER_RAN_LOW */
-		uint32_t bit_ran_low_val        : 29;
-		uint32_t reserved_31_29          : 3;
+        uint32_t bit_ran_low_val        : 29;
+        uint32_t reserved_31_29          : 3;
 #else
-		uint32_t reserved_31_29          : 3;
-		uint32_t bit_ran_low_val        : 29;
+        uint32_t reserved_31_29          : 3;
+        uint32_t bit_ran_low_val        : 29;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_filter_ran_high {
-	uint32_t u32;
-	struct ctu_can_fd_filter_ran_high_s {
+    uint32_t u32;
+    struct ctu_can_fd_filter_ran_high_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* FILTER_RAN_HIGH */
-		uint32_t bit_ran_high_val       : 29;
-		uint32_t reserved_31_29          : 3;
+        uint32_t bit_ran_high_val       : 29;
+        uint32_t reserved_31_29          : 3;
 #else
-		uint32_t reserved_31_29          : 3;
-		uint32_t bit_ran_high_val       : 29;
+        uint32_t reserved_31_29          : 3;
+        uint32_t bit_ran_high_val       : 29;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_filter_control_filter_status {
-	uint32_t u32;
-	struct ctu_can_fd_filter_control_filter_status_s {
+    uint32_t u32;
+    struct ctu_can_fd_filter_control_filter_status_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* FILTER_CONTROL */
-		uint32_t fanb                    : 1;
-		uint32_t fane                    : 1;
-		uint32_t fafb                    : 1;
-		uint32_t fafe                    : 1;
-		uint32_t fbnb                    : 1;
-		uint32_t fbne                    : 1;
-		uint32_t fbfb                    : 1;
-		uint32_t fbfe                    : 1;
-		uint32_t fcnb                    : 1;
-		uint32_t fcne                    : 1;
-		uint32_t fcfb                    : 1;
-		uint32_t fcfe                    : 1;
-		uint32_t frnb                    : 1;
-		uint32_t frne                    : 1;
-		uint32_t frfb                    : 1;
-		uint32_t frfe                    : 1;
+        uint32_t fanb                    : 1;
+        uint32_t fane                    : 1;
+        uint32_t fafb                    : 1;
+        uint32_t fafe                    : 1;
+        uint32_t fbnb                    : 1;
+        uint32_t fbne                    : 1;
+        uint32_t fbfb                    : 1;
+        uint32_t fbfe                    : 1;
+        uint32_t fcnb                    : 1;
+        uint32_t fcne                    : 1;
+        uint32_t fcfb                    : 1;
+        uint32_t fcfe                    : 1;
+        uint32_t frnb                    : 1;
+        uint32_t frne                    : 1;
+        uint32_t frfb                    : 1;
+        uint32_t frfe                    : 1;
   /* FILTER_STATUS */
-		uint32_t sfa                     : 1;
-		uint32_t sfb                     : 1;
-		uint32_t sfc                     : 1;
-		uint32_t sfr                     : 1;
-		uint32_t reserved_31_20         : 12;
-#else
-		uint32_t reserved_31_20         : 12;
-		uint32_t sfr                     : 1;
-		uint32_t sfc                     : 1;
-		uint32_t sfb                     : 1;
-		uint32_t sfa                     : 1;
-		uint32_t frfe                    : 1;
-		uint32_t frfb                    : 1;
-		uint32_t frne                    : 1;
-		uint32_t frnb                    : 1;
-		uint32_t fcfe                    : 1;
-		uint32_t fcfb                    : 1;
-		uint32_t fcne                    : 1;
-		uint32_t fcnb                    : 1;
-		uint32_t fbfe                    : 1;
-		uint32_t fbfb                    : 1;
-		uint32_t fbne                    : 1;
-		uint32_t fbnb                    : 1;
-		uint32_t fafe                    : 1;
-		uint32_t fafb                    : 1;
-		uint32_t fane                    : 1;
-		uint32_t fanb                    : 1;
-#endif
-	} s;
+        uint32_t sfa                     : 1;
+        uint32_t sfb                     : 1;
+        uint32_t sfc                     : 1;
+        uint32_t sfr                     : 1;
+        uint32_t reserved_31_20         : 12;
+#else
+        uint32_t reserved_31_20         : 12;
+        uint32_t sfr                     : 1;
+        uint32_t sfc                     : 1;
+        uint32_t sfb                     : 1;
+        uint32_t sfa                     : 1;
+        uint32_t frfe                    : 1;
+        uint32_t frfb                    : 1;
+        uint32_t frne                    : 1;
+        uint32_t frnb                    : 1;
+        uint32_t fcfe                    : 1;
+        uint32_t fcfb                    : 1;
+        uint32_t fcne                    : 1;
+        uint32_t fcnb                    : 1;
+        uint32_t fbfe                    : 1;
+        uint32_t fbfb                    : 1;
+        uint32_t fbne                    : 1;
+        uint32_t fbnb                    : 1;
+        uint32_t fafe                    : 1;
+        uint32_t fafb                    : 1;
+        uint32_t fane                    : 1;
+        uint32_t fanb                    : 1;
+#endif
+    } s;
 };
 
 union ctu_can_fd_rx_mem_info {
-	uint32_t u32;
-	struct ctu_can_fd_rx_mem_info_s {
+    uint32_t u32;
+    struct ctu_can_fd_rx_mem_info_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* RX_MEM_INFO */
-		uint32_t rx_buff_size           : 13;
-		uint32_t reserved_15_13          : 3;
-		uint32_t rx_mem_free            : 13;
-		uint32_t reserved_31_29          : 3;
+        uint32_t rx_buff_size           : 13;
+        uint32_t reserved_15_13          : 3;
+        uint32_t rx_mem_free            : 13;
+        uint32_t reserved_31_29          : 3;
 #else
-		uint32_t reserved_31_29          : 3;
-		uint32_t rx_mem_free            : 13;
-		uint32_t reserved_15_13          : 3;
-		uint32_t rx_buff_size           : 13;
+        uint32_t reserved_31_29          : 3;
+        uint32_t rx_mem_free            : 13;
+        uint32_t reserved_15_13          : 3;
+        uint32_t rx_buff_size           : 13;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_rx_pointers {
-	uint32_t u32;
-	struct ctu_can_fd_rx_pointers_s {
+    uint32_t u32;
+    struct ctu_can_fd_rx_pointers_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* RX_POINTERS */
-		uint32_t rx_wpp                 : 12;
-		uint32_t reserved_15_12          : 4;
-		uint32_t rx_rpp                 : 12;
-		uint32_t reserved_31_28          : 4;
+        uint32_t rx_wpp                 : 12;
+        uint32_t reserved_15_12          : 4;
+        uint32_t rx_rpp                 : 12;
+        uint32_t reserved_31_28          : 4;
 #else
-		uint32_t reserved_31_28          : 4;
-		uint32_t rx_rpp                 : 12;
-		uint32_t reserved_15_12          : 4;
-		uint32_t rx_wpp                 : 12;
+        uint32_t reserved_31_28          : 4;
+        uint32_t rx_rpp                 : 12;
+        uint32_t reserved_15_12          : 4;
+        uint32_t rx_wpp                 : 12;
 #endif
-	} s;
+    } s;
 };
 
 union ctu_can_fd_rx_status_rx_settings {
-	uint32_t u32;
-	struct ctu_can_fd_rx_status_rx_settings_s {
+    uint32_t u32;
+    struct ctu_can_fd_rx_status_rx_settings_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* RX_STATUS */
-		uint32_t rxe                     : 1;
-		uint32_t rxf                     : 1;
-		uint32_t reserved_3_2            : 2;
-		uint32_t rxfrc                  : 11;
-		uint32_t reserved_15             : 1;
+        uint32_t rxe                     : 1;
+        uint32_t rxf                     : 1;
+        uint32_t reserved_3_2            : 2;
+        uint32_t rxfrc                  : 11;
+        uint32_t reserved_15             : 1;
   /* RX_SETTINGS */
-		uint32_t rtsop                   : 1;
-		uint32_t reserved_31_17         : 15;
+        uint32_t rtsop                   : 1;
+        uint32_t reserved_31_17         : 15;
 #else
-		uint32_t reserved_31_17         : 15;
-		uint32_t rtsop                   : 1;
-		uint32_t reserved_15             : 1;
-		uint32_t rxfrc                  : 11;
-		uint32_t reserved_3_2            : 2;
-		uint32_t rxf                     : 1;
-		uint32_t rxe                     : 1;
+        uint32_t reserved_31_17         : 15;
+        uint32_t rtsop                   : 1;
+        uint32_t reserved_15             : 1;
+        uint32_t rxfrc                  : 11;
+        uint32_t reserved_3_2            : 2;
+        uint32_t rxf                     : 1;
+        uint32_t rxe                     : 1;
 #endif
-	} s;
+    } s;
 };
 
 enum ctu_can_fd_rx_settings_rtsop {
-	RTS_END       = 0x0,
-	RTS_BEG       = 0x1,
+    RTS_END       = 0x0,
+    RTS_BEG       = 0x1,
 };
 
 union ctu_can_fd_rx_data {
-	uint32_t u32;
-	struct ctu_can_fd_rx_data_s {
+    uint32_t u32;
+    struct ctu_can_fd_rx_data_s {
   /* RX_DATA */
-		uint32_t rx_data                : 32;
-	} s;
+        uint32_t rx_data                : 32;
+    } s;
 };
 
 union ctu_can_fd_tx_status {
-	uint32_t u32;
-	struct ctu_can_fd_tx_status_s {
+    uint32_t u32;
+    struct ctu_can_fd_tx_status_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* TX_STATUS */
-		uint32_t tx1s                    : 4;
-		uint32_t tx2s                    : 4;
-		uint32_t tx3s                    : 4;
-		uint32_t tx4s                    : 4;
-		uint32_t reserved_31_16         : 16;
+        uint32_t tx1s                    : 4;
+        uint32_t tx2s                    : 4;
+        uint32_t tx3s                    : 4;
+        uint32_t tx4s                    : 4;
+        uint32_t reserved_31_16         : 16;
 #else
-		uint32_t reserved_31_16         : 16;
-		uint32_t tx4s                    : 4;
-		uint32_t tx3s                    : 4;
-		uint32_t tx2s                    : 4;
-		uint32_t tx1s                    : 4;
+        uint32_t reserved_31_16         : 16;
+        uint32_t tx4s                    : 4;
+        uint32_t tx3s                    : 4;
+        uint32_t tx2s                    : 4;
+        uint32_t tx1s                    : 4;
 #endif
-	} s;
+    } s;
 };
 
 enum ctu_can_fd_tx_status_tx1s {
-	TXT_RDY        = 0x1,
-	TXT_TRAN       = 0x2,
-	TXT_ABTP       = 0x3,
-	TXT_TOK        = 0x4,
-	TXT_ERR        = 0x6,
-	TXT_ABT        = 0x7,
-	TXT_ETY        = 0x8,
+    TXT_RDY        = 0x1,
+    TXT_TRAN       = 0x2,
+    TXT_ABTP       = 0x3,
+    TXT_TOK        = 0x4,
+    TXT_ERR        = 0x6,
+    TXT_ABT        = 0x7,
+    TXT_ETY        = 0x8,
 };
 
 union ctu_can_fd_tx_command {
-	uint32_t u32;
-	struct ctu_can_fd_tx_command_s {
+    uint32_t u32;
+    struct ctu_can_fd_tx_command_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* TX_COMMAND */
-		uint32_t txce                    : 1;
-		uint32_t txcr                    : 1;
-		uint32_t txca                    : 1;
-		uint32_t reserved_7_3            : 5;
-		uint32_t txb1                    : 1;
-		uint32_t txb2                    : 1;
-		uint32_t txb3                    : 1;
-		uint32_t txb4                    : 1;
-		uint32_t reserved_31_12         : 20;
-#else
-		uint32_t reserved_31_12         : 20;
-		uint32_t txb4                    : 1;
-		uint32_t txb3                    : 1;
-		uint32_t txb2                    : 1;
-		uint32_t txb1                    : 1;
-		uint32_t reserved_7_3            : 5;
-		uint32_t txca                    : 1;
-		uint32_t txcr                    : 1;
-		uint32_t txce                    : 1;
-#endif
-	} s;
+        uint32_t txce                    : 1;
+        uint32_t txcr                    : 1;
+        uint32_t txca                    : 1;
+        uint32_t reserved_7_3            : 5;
+        uint32_t txb1                    : 1;
+        uint32_t txb2                    : 1;
+        uint32_t txb3                    : 1;
+        uint32_t txb4                    : 1;
+        uint32_t reserved_31_12         : 20;
+#else
+        uint32_t reserved_31_12         : 20;
+        uint32_t txb4                    : 1;
+        uint32_t txb3                    : 1;
+        uint32_t txb2                    : 1;
+        uint32_t txb1                    : 1;
+        uint32_t reserved_7_3            : 5;
+        uint32_t txca                    : 1;
+        uint32_t txcr                    : 1;
+        uint32_t txce                    : 1;
+#endif
+    } s;
 };
 
 union ctu_can_fd_tx_priority {
-	uint32_t u32;
-	struct ctu_can_fd_tx_priority_s {
+    uint32_t u32;
+    struct ctu_can_fd_tx_priority_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* TX_PRIORITY */
-		uint32_t txt1p                   : 3;
-		uint32_t reserved_3              : 1;
-		uint32_t txt2p                   : 3;
-		uint32_t reserved_7              : 1;
-		uint32_t txt3p                   : 3;
-		uint32_t reserved_11             : 1;
-		uint32_t txt4p                   : 3;
-		uint32_t reserved_31_15         : 17;
-#else
-		uint32_t reserved_31_15         : 17;
-		uint32_t txt4p                   : 3;
-		uint32_t reserved_11             : 1;
-		uint32_t txt3p                   : 3;
-		uint32_t reserved_7              : 1;
-		uint32_t txt2p                   : 3;
-		uint32_t reserved_3              : 1;
-		uint32_t txt1p                   : 3;
-#endif
-	} s;
+        uint32_t txt1p                   : 3;
+        uint32_t reserved_3              : 1;
+        uint32_t txt2p                   : 3;
+        uint32_t reserved_7              : 1;
+        uint32_t txt3p                   : 3;
+        uint32_t reserved_11             : 1;
+        uint32_t txt4p                   : 3;
+        uint32_t reserved_31_15         : 17;
+#else
+        uint32_t reserved_31_15         : 17;
+        uint32_t txt4p                   : 3;
+        uint32_t reserved_11             : 1;
+        uint32_t txt3p                   : 3;
+        uint32_t reserved_7              : 1;
+        uint32_t txt2p                   : 3;
+        uint32_t reserved_3              : 1;
+        uint32_t txt1p                   : 3;
+#endif
+    } s;
 };
 
 union ctu_can_fd_err_capt_alc {
-	uint32_t u32;
-	struct ctu_can_fd_err_capt_alc_s {
+    uint32_t u32;
+    struct ctu_can_fd_err_capt_alc_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* ERR_CAPT */
-		uint32_t err_pos                 : 5;
-		uint32_t err_type                : 3;
-		uint32_t reserved_15_8           : 8;
+        uint32_t err_pos                 : 5;
+        uint32_t err_type                : 3;
+        uint32_t reserved_15_8           : 8;
   /* ALC */
-		uint32_t alc_bit                 : 5;
-		uint32_t alc_id_field            : 3;
-		uint32_t reserved_31_24          : 8;
+        uint32_t alc_bit                 : 5;
+        uint32_t alc_id_field            : 3;
+        uint32_t reserved_31_24          : 8;
 #else
-		uint32_t reserved_31_24          : 8;
-		uint32_t alc_id_field            : 3;
-		uint32_t alc_bit                 : 5;
-		uint32_t reserved_15_8           : 8;
-		uint32_t err_type                : 3;
-		uint32_t err_pos                 : 5;
+        uint32_t reserved_31_24          : 8;
+        uint32_t alc_id_field            : 3;
+        uint32_t alc_bit                 : 5;
+        uint32_t reserved_15_8           : 8;
+        uint32_t err_type                : 3;
+        uint32_t err_pos                 : 5;
 #endif
-	} s;
+    } s;
 };
 
 enum ctu_can_fd_err_capt_err_pos {
-	ERC_POS_SOF         = 0x0,
-	ERC_POS_ARB         = 0x1,
-	ERC_POS_CTRL        = 0x2,
-	ERC_POS_DATA        = 0x3,
-	ERC_POS_CRC         = 0x4,
-	ERC_POS_ACK         = 0x5,
-	ERC_POS_EOF         = 0x6,
-	ERC_POS_ERR         = 0x7,
-	ERC_POS_OVRL        = 0x8,
-	ERC_POS_OTHER      = 0x1f,
+    ERC_POS_SOF         = 0x0,
+    ERC_POS_ARB         = 0x1,
+    ERC_POS_CTRL        = 0x2,
+    ERC_POS_DATA        = 0x3,
+    ERC_POS_CRC         = 0x4,
+    ERC_POS_ACK         = 0x5,
+    ERC_POS_EOF         = 0x6,
+    ERC_POS_ERR         = 0x7,
+    ERC_POS_OVRL        = 0x8,
+    ERC_POS_OTHER      = 0x1f,
 };
 
 enum ctu_can_fd_err_capt_err_type {
-	ERC_BIT_ERR        = 0x0,
-	ERC_CRC_ERR        = 0x1,
-	ERC_FRM_ERR        = 0x2,
-	ERC_ACK_ERR        = 0x3,
-	ERC_STUF_ERR       = 0x4,
+    ERC_BIT_ERR        = 0x0,
+    ERC_CRC_ERR        = 0x1,
+    ERC_FRM_ERR        = 0x2,
+    ERC_ACK_ERR        = 0x3,
+    ERC_STUF_ERR       = 0x4,
 };
 
 enum ctu_can_fd_alc_alc_id_field {
-	ALC_RSVD            = 0x0,
-	ALC_BASE_ID         = 0x1,
-	ALC_SRR_RTR         = 0x2,
-	ALC_IDE             = 0x3,
-	ALC_EXTENSION       = 0x4,
-	ALC_RTR             = 0x5,
+    ALC_RSVD            = 0x0,
+    ALC_BASE_ID         = 0x1,
+    ALC_SRR_RTR         = 0x2,
+    ALC_IDE             = 0x3,
+    ALC_EXTENSION       = 0x4,
+    ALC_RTR             = 0x5,
 };
 
 union ctu_can_fd_trv_delay_ssp_cfg {
-	uint32_t u32;
-	struct ctu_can_fd_trv_delay_ssp_cfg_s {
+    uint32_t u32;
+    struct ctu_can_fd_trv_delay_ssp_cfg_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* TRV_DELAY */
-		uint32_t trv_delay_value         : 7;
-		uint32_t reserved_15_7           : 9;
+        uint32_t trv_delay_value         : 7;
+        uint32_t reserved_15_7           : 9;
   /* SSP_CFG */
-		uint32_t ssp_offset              : 8;
-		uint32_t ssp_src                 : 2;
-		uint32_t reserved_31_26          : 6;
+        uint32_t ssp_offset              : 8;
+        uint32_t ssp_src                 : 2;
+        uint32_t reserved_31_26          : 6;
 #else
-		uint32_t reserved_31_26          : 6;
-		uint32_t ssp_src                 : 2;
-		uint32_t ssp_offset              : 8;
-		uint32_t reserved_15_7           : 9;
-		uint32_t trv_delay_value         : 7;
+        uint32_t reserved_31_26          : 6;
+        uint32_t ssp_src                 : 2;
+        uint32_t ssp_offset              : 8;
+        uint32_t reserved_15_7           : 9;
+        uint32_t trv_delay_value         : 7;
 #endif
-	} s;
+    } s;
 };
 
 enum ctu_can_fd_ssp_cfg_ssp_src {
-	SSP_SRC_MEAS_N_OFFSET       = 0x0,
-	SSP_SRC_NO_SSP              = 0x1,
-	SSP_SRC_OFFSET              = 0x2,
+    SSP_SRC_MEAS_N_OFFSET       = 0x0,
+    SSP_SRC_NO_SSP              = 0x1,
+    SSP_SRC_OFFSET              = 0x2,
 };
 
 union ctu_can_fd_rx_fr_ctr {
-	uint32_t u32;
-	struct ctu_can_fd_rx_fr_ctr_s {
+    uint32_t u32;
+    struct ctu_can_fd_rx_fr_ctr_s {
   /* RX_FR_CTR */
-		uint32_t rx_fr_ctr_val          : 32;
-	} s;
+        uint32_t rx_fr_ctr_val          : 32;
+    } s;
 };
 
 union ctu_can_fd_tx_fr_ctr {
-	uint32_t u32;
-	struct ctu_can_fd_tx_fr_ctr_s {
+    uint32_t u32;
+    struct ctu_can_fd_tx_fr_ctr_s {
   /* TX_FR_CTR */
-		uint32_t tx_fr_ctr_val          : 32;
-	} s;
+        uint32_t tx_fr_ctr_val          : 32;
+    } s;
 };
 
 union ctu_can_fd_debug_register {
-	uint32_t u32;
-	struct ctu_can_fd_debug_register_s {
+    uint32_t u32;
+    struct ctu_can_fd_debug_register_s {
 #ifdef __LITTLE_ENDIAN_BITFIELD
   /* DEBUG_REGISTER */
-		uint32_t stuff_count             : 3;
-		uint32_t destuff_count           : 3;
-		uint32_t pc_arb                  : 1;
-		uint32_t pc_con                  : 1;
-		uint32_t pc_dat                  : 1;
-		uint32_t pc_stc                  : 1;
-		uint32_t pc_crc                  : 1;
-		uint32_t pc_crcd                 : 1;
-		uint32_t pc_ack                  : 1;
-		uint32_t pc_ackd                 : 1;
-		uint32_t pc_eof                  : 1;
-		uint32_t pc_int                  : 1;
-		uint32_t pc_susp                 : 1;
-		uint32_t pc_ovr                  : 1;
-		uint32_t pc_sof                  : 1;
-		uint32_t reserved_31_19         : 13;
-#else
-		uint32_t reserved_31_19         : 13;
-		uint32_t pc_sof                  : 1;
-		uint32_t pc_ovr                  : 1;
-		uint32_t pc_susp                 : 1;
-		uint32_t pc_int                  : 1;
-		uint32_t pc_eof                  : 1;
-		uint32_t pc_ackd                 : 1;
-		uint32_t pc_ack                  : 1;
-		uint32_t pc_crcd                 : 1;
-		uint32_t pc_crc                  : 1;
-		uint32_t pc_stc                  : 1;
-		uint32_t pc_dat                  : 1;
-		uint32_t pc_con                  : 1;
-		uint32_t pc_arb                  : 1;
-		uint32_t destuff_count           : 3;
-		uint32_t stuff_count             : 3;
-#endif
-	} s;
+        uint32_t stuff_count             : 3;
+        uint32_t destuff_count           : 3;
+        uint32_t pc_arb                  : 1;
+        uint32_t pc_con                  : 1;
+        uint32_t pc_dat                  : 1;
+        uint32_t pc_stc                  : 1;
+        uint32_t pc_crc                  : 1;
+        uint32_t pc_crcd                 : 1;
+        uint32_t pc_ack                  : 1;
+        uint32_t pc_ackd                 : 1;
+        uint32_t pc_eof                  : 1;
+        uint32_t pc_int                  : 1;
+        uint32_t pc_susp                 : 1;
+        uint32_t pc_ovr                  : 1;
+        uint32_t pc_sof                  : 1;
+        uint32_t reserved_31_19         : 13;
+#else
+        uint32_t reserved_31_19         : 13;
+        uint32_t pc_sof                  : 1;
+        uint32_t pc_ovr                  : 1;
+        uint32_t pc_susp                 : 1;
+        uint32_t pc_int                  : 1;
+        uint32_t pc_eof                  : 1;
+        uint32_t pc_ackd                 : 1;
+        uint32_t pc_ack                  : 1;
+        uint32_t pc_crcd                 : 1;
+        uint32_t pc_crc                  : 1;
+        uint32_t pc_stc                  : 1;
+        uint32_t pc_dat                  : 1;
+        uint32_t pc_con                  : 1;
+        uint32_t pc_arb                  : 1;
+        uint32_t destuff_count           : 3;
+        uint32_t stuff_count             : 3;
+#endif
+    } s;
 };
 
 union ctu_can_fd_yolo_reg {
-	uint32_t u32;
-	struct ctu_can_fd_yolo_reg_s {
+    uint32_t u32;
+    struct ctu_can_fd_yolo_reg_s {
   /* YOLO_REG */
-		uint32_t yolo_val               : 32;
-	} s;
+        uint32_t yolo_val               : 32;
+    } s;
 };
 
 union ctu_can_fd_timestamp_low {
-	uint32_t u32;
-	struct ctu_can_fd_timestamp_low_s {
+    uint32_t u32;
+    struct ctu_can_fd_timestamp_low_s {
   /* TIMESTAMP_LOW */
-		uint32_t timestamp_low          : 32;
-	} s;
+        uint32_t timestamp_low          : 32;
+    } s;
 };
 
 union ctu_can_fd_timestamp_high {
-	uint32_t u32;
-	struct ctu_can_fd_timestamp_high_s {
+    uint32_t u32;
+    struct ctu_can_fd_timestamp_high_s {
   /* TIMESTAMP_HIGH */
-		uint32_t timestamp_high         : 32;
-	} s;
+        uint32_t timestamp_high         : 32;
+    } s;
 };
 
 #endif
diff --git a/hw/net/e1000_regs.h b/hw/net/e1000_regs.h
index ae99f58bab..444681e24f 100644
--- a/hw/net/e1000_regs.h
+++ b/hw/net/e1000_regs.h
@@ -552,21 +552,21 @@
 #define MII_CR_RESET            0x8000 /* 0 = normal, 1 = PHY reset */
 
 /* PHY Status Register */
-#define MII_SR_EXTENDED_CAPS     0x0001	/* Extended register capabilities */
-#define MII_SR_JABBER_DETECT     0x0002	/* Jabber Detected */
-#define MII_SR_LINK_STATUS       0x0004	/* Link Status 1 = link */
-#define MII_SR_AUTONEG_CAPS      0x0008	/* Auto Neg Capable */
-#define MII_SR_REMOTE_FAULT      0x0010	/* Remote Fault Detect */
-#define MII_SR_AUTONEG_COMPLETE  0x0020	/* Auto Neg Complete */
-#define MII_SR_PREAMBLE_SUPPRESS 0x0040	/* Preamble may be suppressed */
-#define MII_SR_EXTENDED_STATUS   0x0100	/* Ext. status info in Reg 0x0F */
-#define MII_SR_100T2_HD_CAPS     0x0200	/* 100T2 Half Duplex Capable */
-#define MII_SR_100T2_FD_CAPS     0x0400	/* 100T2 Full Duplex Capable */
-#define MII_SR_10T_HD_CAPS       0x0800	/* 10T   Half Duplex Capable */
-#define MII_SR_10T_FD_CAPS       0x1000	/* 10T   Full Duplex Capable */
-#define MII_SR_100X_HD_CAPS      0x2000	/* 100X  Half Duplex Capable */
-#define MII_SR_100X_FD_CAPS      0x4000	/* 100X  Full Duplex Capable */
-#define MII_SR_100T4_CAPS        0x8000	/* 100T4 Capable */
+#define MII_SR_EXTENDED_CAPS     0x0001    /* Extended register capabilities */
+#define MII_SR_JABBER_DETECT     0x0002    /* Jabber Detected */
+#define MII_SR_LINK_STATUS       0x0004    /* Link Status 1 = link */
+#define MII_SR_AUTONEG_CAPS      0x0008    /* Auto Neg Capable */
+#define MII_SR_REMOTE_FAULT      0x0010    /* Remote Fault Detect */
+#define MII_SR_AUTONEG_COMPLETE  0x0020    /* Auto Neg Complete */
+#define MII_SR_PREAMBLE_SUPPRESS 0x0040    /* Preamble may be suppressed */
+#define MII_SR_EXTENDED_STATUS   0x0100    /* Ext. status info in Reg 0x0F */
+#define MII_SR_100T2_HD_CAPS     0x0200    /* 100T2 Half Duplex Capable */
+#define MII_SR_100T2_FD_CAPS     0x0400    /* 100T2 Full Duplex Capable */
+#define MII_SR_10T_HD_CAPS       0x0800    /* 10T   Half Duplex Capable */
+#define MII_SR_10T_FD_CAPS       0x1000    /* 10T   Full Duplex Capable */
+#define MII_SR_100X_HD_CAPS      0x2000    /* 100X  Half Duplex Capable */
+#define MII_SR_100X_FD_CAPS      0x4000    /* 100X  Full Duplex Capable */
+#define MII_SR_100T4_CAPS        0x8000    /* 100T4 Capable */
 
 /* PHY Link Partner Ability Register */
 #define MII_LPAR_LPACK           0x4000 /* Acked by link partner */
diff --git a/hw/net/mcf_fec.c b/hw/net/mcf_fec.c
index 25e3e453ab..4e9c1c7d66 100644
--- a/hw/net/mcf_fec.c
+++ b/hw/net/mcf_fec.c
@@ -313,10 +313,10 @@ static void mcf_fec_reset(DeviceState *dev)
     s->rfsr = 0x500;
 }
 
-#define MMFR_WRITE_OP	(1 << 28)
-#define MMFR_READ_OP	(2 << 28)
-#define MMFR_PHYADDR(v)	(((v) >> 23) & 0x1f)
-#define MMFR_REGNUM(v)	(((v) >> 18) & 0x1f)
+#define MMFR_WRITE_OP    (1 << 28)
+#define MMFR_READ_OP    (2 << 28)
+#define MMFR_PHYADDR(v)    (((v) >> 23) & 0x1f)
+#define MMFR_REGNUM(v)    (((v) >> 18) & 0x1f)
 
 static uint64_t mcf_fec_read_mdio(mcf_fec_state *s)
 {
diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
index 6c17ee1ae2..46ed36e798 100644
--- a/hw/net/ne2000.c
+++ b/hw/net/ne2000.c
@@ -36,89 +36,89 @@
 
 #define MAX_ETH_FRAME_SIZE 1514
 
-#define E8390_CMD	0x00  /* The command register (for all pages) */
+#define E8390_CMD    0x00  /* The command register (for all pages) */
 /* Page 0 register offsets. */
-#define EN0_CLDALO	0x01	/* Low byte of current local dma addr  RD */
-#define EN0_STARTPG	0x01	/* Starting page of ring bfr WR */
-#define EN0_CLDAHI	0x02	/* High byte of current local dma addr  RD */
-#define EN0_STOPPG	0x02	/* Ending page +1 of ring bfr WR */
-#define EN0_BOUNDARY	0x03	/* Boundary page of ring bfr RD WR */
-#define EN0_TSR		0x04	/* Transmit status reg RD */
-#define EN0_TPSR	0x04	/* Transmit starting page WR */
-#define EN0_NCR		0x05	/* Number of collision reg RD */
-#define EN0_TCNTLO	0x05	/* Low  byte of tx byte count WR */
-#define EN0_FIFO	0x06	/* FIFO RD */
-#define EN0_TCNTHI	0x06	/* High byte of tx byte count WR */
-#define EN0_ISR		0x07	/* Interrupt status reg RD WR */
-#define EN0_CRDALO	0x08	/* low byte of current remote dma address RD */
-#define EN0_RSARLO	0x08	/* Remote start address reg 0 */
-#define EN0_CRDAHI	0x09	/* high byte, current remote dma address RD */
-#define EN0_RSARHI	0x09	/* Remote start address reg 1 */
-#define EN0_RCNTLO	0x0a	/* Remote byte count reg WR */
-#define EN0_RTL8029ID0	0x0a	/* Realtek ID byte #1 RD */
-#define EN0_RCNTHI	0x0b	/* Remote byte count reg WR */
-#define EN0_RTL8029ID1	0x0b	/* Realtek ID byte #2 RD */
-#define EN0_RSR		0x0c	/* rx status reg RD */
-#define EN0_RXCR	0x0c	/* RX configuration reg WR */
-#define EN0_TXCR	0x0d	/* TX configuration reg WR */
-#define EN0_COUNTER0	0x0d	/* Rcv alignment error counter RD */
-#define EN0_DCFG	0x0e	/* Data configuration reg WR */
-#define EN0_COUNTER1	0x0e	/* Rcv CRC error counter RD */
-#define EN0_IMR		0x0f	/* Interrupt mask reg WR */
-#define EN0_COUNTER2	0x0f	/* Rcv missed frame error counter RD */
+#define EN0_CLDALO    0x01    /* Low byte of current local dma addr  RD */
+#define EN0_STARTPG    0x01    /* Starting page of ring bfr WR */
+#define EN0_CLDAHI    0x02    /* High byte of current local dma addr  RD */
+#define EN0_STOPPG    0x02    /* Ending page +1 of ring bfr WR */
+#define EN0_BOUNDARY    0x03    /* Boundary page of ring bfr RD WR */
+#define EN0_TSR        0x04    /* Transmit status reg RD */
+#define EN0_TPSR    0x04    /* Transmit starting page WR */
+#define EN0_NCR        0x05    /* Number of collision reg RD */
+#define EN0_TCNTLO    0x05    /* Low  byte of tx byte count WR */
+#define EN0_FIFO    0x06    /* FIFO RD */
+#define EN0_TCNTHI    0x06    /* High byte of tx byte count WR */
+#define EN0_ISR        0x07    /* Interrupt status reg RD WR */
+#define EN0_CRDALO    0x08    /* low byte of current remote dma address RD */
+#define EN0_RSARLO    0x08    /* Remote start address reg 0 */
+#define EN0_CRDAHI    0x09    /* high byte, current remote dma address RD */
+#define EN0_RSARHI    0x09    /* Remote start address reg 1 */
+#define EN0_RCNTLO    0x0a    /* Remote byte count reg WR */
+#define EN0_RTL8029ID0    0x0a    /* Realtek ID byte #1 RD */
+#define EN0_RCNTHI    0x0b    /* Remote byte count reg WR */
+#define EN0_RTL8029ID1    0x0b    /* Realtek ID byte #2 RD */
+#define EN0_RSR        0x0c    /* rx status reg RD */
+#define EN0_RXCR    0x0c    /* RX configuration reg WR */
+#define EN0_TXCR    0x0d    /* TX configuration reg WR */
+#define EN0_COUNTER0    0x0d    /* Rcv alignment error counter RD */
+#define EN0_DCFG    0x0e    /* Data configuration reg WR */
+#define EN0_COUNTER1    0x0e    /* Rcv CRC error counter RD */
+#define EN0_IMR        0x0f    /* Interrupt mask reg WR */
+#define EN0_COUNTER2    0x0f    /* Rcv missed frame error counter RD */
 
 #define EN1_PHYS        0x11
 #define EN1_CURPAG      0x17
 #define EN1_MULT        0x18
 
-#define EN2_STARTPG	0x21	/* Starting page of ring bfr RD */
-#define EN2_STOPPG	0x22	/* Ending page +1 of ring bfr RD */
+#define EN2_STARTPG    0x21    /* Starting page of ring bfr RD */
+#define EN2_STOPPG    0x22    /* Ending page +1 of ring bfr RD */
 
-#define EN3_CONFIG0	0x33
-#define EN3_CONFIG1	0x34
-#define EN3_CONFIG2	0x35
-#define EN3_CONFIG3	0x36
+#define EN3_CONFIG0    0x33
+#define EN3_CONFIG1    0x34
+#define EN3_CONFIG2    0x35
+#define EN3_CONFIG3    0x36
 
 /*  Register accessed at EN_CMD, the 8390 base addr.  */
-#define E8390_STOP	0x01	/* Stop and reset the chip */
-#define E8390_START	0x02	/* Start the chip, clear reset */
-#define E8390_TRANS	0x04	/* Transmit a frame */
-#define E8390_RREAD	0x08	/* Remote read */
-#define E8390_RWRITE	0x10	/* Remote write  */
-#define E8390_NODMA	0x20	/* Remote DMA */
-#define E8390_PAGE0	0x00	/* Select page chip registers */
-#define E8390_PAGE1	0x40	/* using the two high-order bits */
-#define E8390_PAGE2	0x80	/* Page 3 is invalid. */
+#define E8390_STOP    0x01    /* Stop and reset the chip */
+#define E8390_START    0x02    /* Start the chip, clear reset */
+#define E8390_TRANS    0x04    /* Transmit a frame */
+#define E8390_RREAD    0x08    /* Remote read */
+#define E8390_RWRITE    0x10    /* Remote write  */
+#define E8390_NODMA    0x20    /* Remote DMA */
+#define E8390_PAGE0    0x00    /* Select page chip registers */
+#define E8390_PAGE1    0x40    /* using the two high-order bits */
+#define E8390_PAGE2    0x80    /* Page 3 is invalid. */
 
 /* Bits in EN0_ISR - Interrupt status register */
-#define ENISR_RX	0x01	/* Receiver, no error */
-#define ENISR_TX	0x02	/* Transmitter, no error */
-#define ENISR_RX_ERR	0x04	/* Receiver, with error */
-#define ENISR_TX_ERR	0x08	/* Transmitter, with error */
-#define ENISR_OVER	0x10	/* Receiver overwrote the ring */
-#define ENISR_COUNTERS	0x20	/* Counters need emptying */
-#define ENISR_RDC	0x40	/* remote dma complete */
-#define ENISR_RESET	0x80	/* Reset completed */
-#define ENISR_ALL	0x3f	/* Interrupts we will enable */
+#define ENISR_RX    0x01    /* Receiver, no error */
+#define ENISR_TX    0x02    /* Transmitter, no error */
+#define ENISR_RX_ERR    0x04    /* Receiver, with error */
+#define ENISR_TX_ERR    0x08    /* Transmitter, with error */
+#define ENISR_OVER    0x10    /* Receiver overwrote the ring */
+#define ENISR_COUNTERS    0x20    /* Counters need emptying */
+#define ENISR_RDC    0x40    /* remote dma complete */
+#define ENISR_RESET    0x80    /* Reset completed */
+#define ENISR_ALL    0x3f    /* Interrupts we will enable */
 
 /* Bits in received packet status byte and EN0_RSR*/
-#define ENRSR_RXOK	0x01	/* Received a good packet */
-#define ENRSR_CRC	0x02	/* CRC error */
-#define ENRSR_FAE	0x04	/* frame alignment error */
-#define ENRSR_FO	0x08	/* FIFO overrun */
-#define ENRSR_MPA	0x10	/* missed pkt */
-#define ENRSR_PHY	0x20	/* physical/multicast address */
-#define ENRSR_DIS	0x40	/* receiver disable. set in monitor mode */
-#define ENRSR_DEF	0x80	/* deferring */
+#define ENRSR_RXOK    0x01    /* Received a good packet */
+#define ENRSR_CRC    0x02    /* CRC error */
+#define ENRSR_FAE    0x04    /* frame alignment error */
+#define ENRSR_FO    0x08    /* FIFO overrun */
+#define ENRSR_MPA    0x10    /* missed pkt */
+#define ENRSR_PHY    0x20    /* physical/multicast address */
+#define ENRSR_DIS    0x40    /* receiver disable. set in monitor mode */
+#define ENRSR_DEF    0x80    /* deferring */
 
 /* Transmitted packet status, EN0_TSR. */
-#define ENTSR_PTX 0x01	/* Packet transmitted without error */
-#define ENTSR_ND  0x02	/* The transmit wasn't deferred. */
-#define ENTSR_COL 0x04	/* The transmit collided at least once. */
+#define ENTSR_PTX 0x01    /* Packet transmitted without error */
+#define ENTSR_ND  0x02    /* The transmit wasn't deferred. */
+#define ENTSR_COL 0x04    /* The transmit collided at least once. */
 #define ENTSR_ABT 0x08  /* The transmit collided 16 times, and was deferred. */
-#define ENTSR_CRS 0x10	/* The carrier sense was lost. */
+#define ENTSR_CRS 0x10    /* The carrier sense was lost. */
 #define ENTSR_FU  0x20  /* A "FIFO underrun" occurred during transmit. */
-#define ENTSR_CDH 0x40	/* The collision detect "heartbeat" signal was lost. */
+#define ENTSR_CDH 0x40    /* The collision detect "heartbeat" signal was lost. */
 #define ENTSR_OWC 0x80  /* There was an out-of-window collision. */
 
 void ne2000_reset(NE2000State *s)
@@ -425,13 +425,13 @@ static uint32_t ne2000_ioport_read(void *opaque, uint32_t addr)
             ret = 0x43;
             break;
         case EN3_CONFIG0:
-            ret = 0;		/* 10baseT media */
+            ret = 0;        /* 10baseT media */
             break;
         case EN3_CONFIG2:
-            ret = 0x40;		/* 10baseT active */
+            ret = 0x40;        /* 10baseT active */
             break;
         case EN3_CONFIG3:
-            ret = 0x40;		/* Full duplex */
+            ret = 0x40;        /* Full duplex */
             break;
         default:
             ret = 0x00;
diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index dcd3fc4948..ba20afefc4 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -370,7 +370,7 @@ static inline void pcnet_rmd_load(PCNetState *s, struct pcnet_RMD *rmd,
             uint32_t rbadr;
             int16_t buf_length;
             int16_t msg_length;
-	} rda;
+    } rda;
         s->phys_mem_read(s->dma_opaque, addr, (void *)&rda, sizeof(rda), 0);
         rmd->rbadr = le32_to_cpu(rda.rbadr) & 0xffffff;
         rmd->buf_length = le16_to_cpu(rda.buf_length);
@@ -524,77 +524,77 @@ static inline void pcnet_rmd_store(PCNetState *s, struct pcnet_RMD *rmd,
            be16_to_cpu(hdr->ether_type));       \
 } while (0)
 
-#define CRC(crc, ch)	 (crc = (crc >> 8) ^ crctab[(crc ^ (ch)) & 0xff])
+#define CRC(crc, ch)     (crc = (crc >> 8) ^ crctab[(crc ^ (ch)) & 0xff])
 
 /* generated using the AUTODIN II polynomial
- *	x^32 + x^26 + x^23 + x^22 + x^16 +
- *	x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x^1 + 1
+ *    x^32 + x^26 + x^23 + x^22 + x^16 +
+ *    x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x^1 + 1
  */
 static const uint32_t crctab[256] = {
-	0x00000000, 0x77073096, 0xee0e612c, 0x990951ba,
-	0x076dc419, 0x706af48f, 0xe963a535, 0x9e6495a3,
-	0x0edb8832, 0x79dcb8a4, 0xe0d5e91e, 0x97d2d988,
-	0x09b64c2b, 0x7eb17cbd, 0xe7b82d07, 0x90bf1d91,
-	0x1db71064, 0x6ab020f2, 0xf3b97148, 0x84be41de,
-	0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7,
-	0x136c9856, 0x646ba8c0, 0xfd62f97a, 0x8a65c9ec,
-	0x14015c4f, 0x63066cd9, 0xfa0f3d63, 0x8d080df5,
-	0x3b6e20c8, 0x4c69105e, 0xd56041e4, 0xa2677172,
-	0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b,
-	0x35b5a8fa, 0x42b2986c, 0xdbbbc9d6, 0xacbcf940,
-	0x32d86ce3, 0x45df5c75, 0xdcd60dcf, 0xabd13d59,
-	0x26d930ac, 0x51de003a, 0xc8d75180, 0xbfd06116,
-	0x21b4f4b5, 0x56b3c423, 0xcfba9599, 0xb8bda50f,
-	0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924,
-	0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d,
-	0x76dc4190, 0x01db7106, 0x98d220bc, 0xefd5102a,
-	0x71b18589, 0x06b6b51f, 0x9fbfe4a5, 0xe8b8d433,
-	0x7807c9a2, 0x0f00f934, 0x9609a88e, 0xe10e9818,
-	0x7f6a0dbb, 0x086d3d2d, 0x91646c97, 0xe6635c01,
-	0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e,
-	0x6c0695ed, 0x1b01a57b, 0x8208f4c1, 0xf50fc457,
-	0x65b0d9c6, 0x12b7e950, 0x8bbeb8ea, 0xfcb9887c,
-	0x62dd1ddf, 0x15da2d49, 0x8cd37cf3, 0xfbd44c65,
-	0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2,
-	0x4adfa541, 0x3dd895d7, 0xa4d1c46d, 0xd3d6f4fb,
-	0x4369e96a, 0x346ed9fc, 0xad678846, 0xda60b8d0,
-	0x44042d73, 0x33031de5, 0xaa0a4c5f, 0xdd0d7cc9,
-	0x5005713c, 0x270241aa, 0xbe0b1010, 0xc90c2086,
-	0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
-	0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4,
-	0x59b33d17, 0x2eb40d81, 0xb7bd5c3b, 0xc0ba6cad,
-	0xedb88320, 0x9abfb3b6, 0x03b6e20c, 0x74b1d29a,
-	0xead54739, 0x9dd277af, 0x04db2615, 0x73dc1683,
-	0xe3630b12, 0x94643b84, 0x0d6d6a3e, 0x7a6a5aa8,
-	0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1,
-	0xf00f9344, 0x8708a3d2, 0x1e01f268, 0x6906c2fe,
-	0xf762575d, 0x806567cb, 0x196c3671, 0x6e6b06e7,
-	0xfed41b76, 0x89d32be0, 0x10da7a5a, 0x67dd4acc,
-	0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5,
-	0xd6d6a3e8, 0xa1d1937e, 0x38d8c2c4, 0x4fdff252,
-	0xd1bb67f1, 0xa6bc5767, 0x3fb506dd, 0x48b2364b,
-	0xd80d2bda, 0xaf0a1b4c, 0x36034af6, 0x41047a60,
-	0xdf60efc3, 0xa867df55, 0x316e8eef, 0x4669be79,
-	0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236,
-	0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f,
-	0xc5ba3bbe, 0xb2bd0b28, 0x2bb45a92, 0x5cb36a04,
-	0xc2d7ffa7, 0xb5d0cf31, 0x2cd99e8b, 0x5bdeae1d,
-	0x9b64c2b0, 0xec63f226, 0x756aa39c, 0x026d930a,
-	0x9c0906a9, 0xeb0e363f, 0x72076785, 0x05005713,
-	0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38,
-	0x92d28e9b, 0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21,
-	0x86d3d2d4, 0xf1d4e242, 0x68ddb3f8, 0x1fda836e,
-	0x81be16cd, 0xf6b9265b, 0x6fb077e1, 0x18b74777,
-	0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c,
-	0x8f659eff, 0xf862ae69, 0x616bffd3, 0x166ccf45,
-	0xa00ae278, 0xd70dd2ee, 0x4e048354, 0x3903b3c2,
-	0xa7672661, 0xd06016f7, 0x4969474d, 0x3e6e77db,
-	0xaed16a4a, 0xd9d65adc, 0x40df0b66, 0x37d83bf0,
-	0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,
-	0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6,
-	0xbad03605, 0xcdd70693, 0x54de5729, 0x23d967bf,
-	0xb3667a2e, 0xc4614ab8, 0x5d681b02, 0x2a6f2b94,
-	0xb40bbe37, 0xc30c8ea1, 0x5a05df1b, 0x2d02ef8d,
+    0x00000000, 0x77073096, 0xee0e612c, 0x990951ba,
+    0x076dc419, 0x706af48f, 0xe963a535, 0x9e6495a3,
+    0x0edb8832, 0x79dcb8a4, 0xe0d5e91e, 0x97d2d988,
+    0x09b64c2b, 0x7eb17cbd, 0xe7b82d07, 0x90bf1d91,
+    0x1db71064, 0x6ab020f2, 0xf3b97148, 0x84be41de,
+    0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7,
+    0x136c9856, 0x646ba8c0, 0xfd62f97a, 0x8a65c9ec,
+    0x14015c4f, 0x63066cd9, 0xfa0f3d63, 0x8d080df5,
+    0x3b6e20c8, 0x4c69105e, 0xd56041e4, 0xa2677172,
+    0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b,
+    0x35b5a8fa, 0x42b2986c, 0xdbbbc9d6, 0xacbcf940,
+    0x32d86ce3, 0x45df5c75, 0xdcd60dcf, 0xabd13d59,
+    0x26d930ac, 0x51de003a, 0xc8d75180, 0xbfd06116,
+    0x21b4f4b5, 0x56b3c423, 0xcfba9599, 0xb8bda50f,
+    0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924,
+    0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d,
+    0x76dc4190, 0x01db7106, 0x98d220bc, 0xefd5102a,
+    0x71b18589, 0x06b6b51f, 0x9fbfe4a5, 0xe8b8d433,
+    0x7807c9a2, 0x0f00f934, 0x9609a88e, 0xe10e9818,
+    0x7f6a0dbb, 0x086d3d2d, 0x91646c97, 0xe6635c01,
+    0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e,
+    0x6c0695ed, 0x1b01a57b, 0x8208f4c1, 0xf50fc457,
+    0x65b0d9c6, 0x12b7e950, 0x8bbeb8ea, 0xfcb9887c,
+    0x62dd1ddf, 0x15da2d49, 0x8cd37cf3, 0xfbd44c65,
+    0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2,
+    0x4adfa541, 0x3dd895d7, 0xa4d1c46d, 0xd3d6f4fb,
+    0x4369e96a, 0x346ed9fc, 0xad678846, 0xda60b8d0,
+    0x44042d73, 0x33031de5, 0xaa0a4c5f, 0xdd0d7cc9,
+    0x5005713c, 0x270241aa, 0xbe0b1010, 0xc90c2086,
+    0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
+    0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4,
+    0x59b33d17, 0x2eb40d81, 0xb7bd5c3b, 0xc0ba6cad,
+    0xedb88320, 0x9abfb3b6, 0x03b6e20c, 0x74b1d29a,
+    0xead54739, 0x9dd277af, 0x04db2615, 0x73dc1683,
+    0xe3630b12, 0x94643b84, 0x0d6d6a3e, 0x7a6a5aa8,
+    0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1,
+    0xf00f9344, 0x8708a3d2, 0x1e01f268, 0x6906c2fe,
+    0xf762575d, 0x806567cb, 0x196c3671, 0x6e6b06e7,
+    0xfed41b76, 0x89d32be0, 0x10da7a5a, 0x67dd4acc,
+    0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5,
+    0xd6d6a3e8, 0xa1d1937e, 0x38d8c2c4, 0x4fdff252,
+    0xd1bb67f1, 0xa6bc5767, 0x3fb506dd, 0x48b2364b,
+    0xd80d2bda, 0xaf0a1b4c, 0x36034af6, 0x41047a60,
+    0xdf60efc3, 0xa867df55, 0x316e8eef, 0x4669be79,
+    0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236,
+    0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f,
+    0xc5ba3bbe, 0xb2bd0b28, 0x2bb45a92, 0x5cb36a04,
+    0xc2d7ffa7, 0xb5d0cf31, 0x2cd99e8b, 0x5bdeae1d,
+    0x9b64c2b0, 0xec63f226, 0x756aa39c, 0x026d930a,
+    0x9c0906a9, 0xeb0e363f, 0x72076785, 0x05005713,
+    0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38,
+    0x92d28e9b, 0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21,
+    0x86d3d2d4, 0xf1d4e242, 0x68ddb3f8, 0x1fda836e,
+    0x81be16cd, 0xf6b9265b, 0x6fb077e1, 0x18b74777,
+    0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c,
+    0x8f659eff, 0xf862ae69, 0x616bffd3, 0x166ccf45,
+    0xa00ae278, 0xd70dd2ee, 0x4e048354, 0x3903b3c2,
+    0xa7672661, 0xd06016f7, 0x4969474d, 0x3e6e77db,
+    0xaed16a4a, 0xd9d65adc, 0x40df0b66, 0x37d83bf0,
+    0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,
+    0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6,
+    0xbad03605, 0xcdd70693, 0x54de5729, 0x23d967bf,
+    0xb3667a2e, 0xc4614ab8, 0x5d681b02, 0x2a6f2b94,
+    0xb40bbe37, 0xc30c8ea1, 0x5a05df1b, 0x2d02ef8d,
 };
 
 static inline int padr_match(PCNetState *s, const uint8_t *buf, int size)
diff --git a/hw/net/pcnet.h b/hw/net/pcnet.h
index f49b213c57..768aff26a0 100644
--- a/hw/net/pcnet.h
+++ b/hw/net/pcnet.h
@@ -4,8 +4,8 @@
 #define PCNET_IOPORT_SIZE       0x20
 #define PCNET_PNPMMIO_SIZE      0x20
 
-#define PCNET_LOOPTEST_CRC	1
-#define PCNET_LOOPTEST_NOCRC	2
+#define PCNET_LOOPTEST_CRC    1
+#define PCNET_LOOPTEST_NOCRC    2
 
 #include "exec/memory.h"
 #include "hw/irq.h"
diff --git a/net/tap-linux.h b/net/tap-linux.h
index 1d06fe0de6..272d514256 100644
--- a/net/tap-linux.h
+++ b/net/tap-linux.h
@@ -45,10 +45,10 @@
 #define IFF_DETACH_QUEUE 0x0400
 
 /* Features for GSO (TUNSETOFFLOAD). */
-#define TUN_F_CSUM	0x01	/* You can hand me unchecksummed packets. */
-#define TUN_F_TSO4	0x02	/* I can handle TSO for IPv4 packets */
-#define TUN_F_TSO6	0x04	/* I can handle TSO for IPv6 packets */
-#define TUN_F_TSO_ECN	0x08	/* I can handle TSO with ECN bits. */
-#define TUN_F_UFO	0x10	/* I can handle UFO packets */
+#define TUN_F_CSUM    0x01    /* You can hand me unchecksummed packets. */
+#define TUN_F_TSO4    0x02    /* I can handle TSO for IPv4 packets */
+#define TUN_F_TSO6    0x04    /* I can handle TSO for IPv6 packets */
+#define TUN_F_TSO_ECN    0x08    /* I can handle TSO with ECN bits. */
+#define TUN_F_UFO    0x10    /* I can handle UFO packets */
 
 #endif /* QEMU_TAP_LINUX_H */
-- 
2.25.1


