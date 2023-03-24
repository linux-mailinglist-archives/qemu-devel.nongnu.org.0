Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81806C81A7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:44:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfjUH-0007Dk-26; Fri, 24 Mar 2023 11:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfjTu-00074V-UO
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:37:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfjTp-0001rp-Cd
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679672244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lnCL6F9s0N7/bBBRoT4sCgYkDxVlGpG0ip/bO3TfMaY=;
 b=JpOevhWF3nI2Gy0Ysh8Pk/enVJOud3N1NvIkG1V9nuF81LYeQwp1xnjIK+APRf81oJEaQG
 w1x1CLayxEOgcfSCNhvsFD8t03oFaZSYsZMS78Cz3myR707mLCHUN4bZ+vyj7q+JvAlhQz
 N/XgzE5P1IJGsV5pDCHhxtRrI4ADuWU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-5kMnPgg7NCecTHtXLbm2VA-1; Fri, 24 Mar 2023 11:36:20 -0400
X-MC-Unique: 5kMnPgg7NCecTHtXLbm2VA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 365CB280A335;
 Fri, 24 Mar 2023 15:36:19 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC62C140EBF4;
 Fri, 24 Mar 2023 15:36:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Yeqi Fu <fufuyqqqqqq@gmail.com>
Subject: [PULL 2/8] hw/block: replace TABs with space
Date: Fri, 24 Mar 2023 16:36:04 +0100
Message-Id: <20230324153610.224673-3-thuth@redhat.com>
In-Reply-To: <20230324153610.224673-1-thuth@redhat.com>
References: <20230324153610.224673-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Yeqi Fu <fufuyqqqqqq@gmail.com>

Bring the block files in line with the QEMU coding style, with spaces
for indentation. This patch partially resolves the issue 371.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/371
Signed-off-by: Yeqi Fu <fufuyqqqqqq@gmail.com>
Message-Id: <20230314095001.13801-1-fufuyqqqqqq@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/block/flash.h |  20 ++--
 hw/block/fdc.c           |   4 +-
 hw/block/nand.c          | 222 +++++++++++++++++++--------------------
 hw/block/onenand.c       | 128 +++++++++++-----------
 hw/block/tc58128.c       | 136 ++++++++++++------------
 5 files changed, 255 insertions(+), 255 deletions(-)

diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 86d8363bb0..7198953702 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -53,22 +53,22 @@ void nand_setio(DeviceState *dev, uint32_t value);
 uint32_t nand_getio(DeviceState *dev);
 uint32_t nand_getbuswidth(DeviceState *dev);
 
-#define NAND_MFR_TOSHIBA	0x98
-#define NAND_MFR_SAMSUNG	0xec
-#define NAND_MFR_FUJITSU	0x04
-#define NAND_MFR_NATIONAL	0x8f
-#define NAND_MFR_RENESAS	0x07
-#define NAND_MFR_STMICRO	0x20
-#define NAND_MFR_HYNIX		0xad
-#define NAND_MFR_MICRON		0x2c
+#define NAND_MFR_TOSHIBA    0x98
+#define NAND_MFR_SAMSUNG    0xec
+#define NAND_MFR_FUJITSU    0x04
+#define NAND_MFR_NATIONAL   0x8f
+#define NAND_MFR_RENESAS    0x07
+#define NAND_MFR_STMICRO    0x20
+#define NAND_MFR_HYNIX      0xad
+#define NAND_MFR_MICRON     0x2c
 
 /* onenand.c */
 void *onenand_raw_otp(DeviceState *onenand_device);
 
 /* ecc.c */
 typedef struct {
-    uint8_t cp;		/* Column parity */
-    uint16_t lp[2];	/* Line parity */
+    uint8_t cp;     /* Column parity */
+    uint16_t lp[2]; /* Line parity */
     uint16_t count;
 } ECCState;
 
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 64ae4a6899..d7cc4d3ec1 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -601,8 +601,8 @@ enum {
 };
 
 enum {
-    FD_STATE_MULTI  = 0x01,	/* multi track flag */
-    FD_STATE_FORMAT = 0x02,	/* format flag */
+    FD_STATE_MULTI  = 0x01, /* multi track flag */
+    FD_STATE_FORMAT = 0x02, /* format flag */
 };
 
 enum {
diff --git a/hw/block/nand.c b/hw/block/nand.c
index 1aee1cb2b1..9c1b89cfa6 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -30,33 +30,33 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 
-# define NAND_CMD_READ0		0x00
-# define NAND_CMD_READ1		0x01
-# define NAND_CMD_READ2		0x50
-# define NAND_CMD_LPREAD2	0x30
-# define NAND_CMD_NOSERIALREAD2	0x35
-# define NAND_CMD_RANDOMREAD1	0x05
-# define NAND_CMD_RANDOMREAD2	0xe0
-# define NAND_CMD_READID	0x90
-# define NAND_CMD_RESET		0xff
-# define NAND_CMD_PAGEPROGRAM1	0x80
-# define NAND_CMD_PAGEPROGRAM2	0x10
-# define NAND_CMD_CACHEPROGRAM2	0x15
-# define NAND_CMD_BLOCKERASE1	0x60
-# define NAND_CMD_BLOCKERASE2	0xd0
-# define NAND_CMD_READSTATUS	0x70
-# define NAND_CMD_COPYBACKPRG1	0x85
-
-# define NAND_IOSTATUS_ERROR	(1 << 0)
-# define NAND_IOSTATUS_PLANE0	(1 << 1)
-# define NAND_IOSTATUS_PLANE1	(1 << 2)
-# define NAND_IOSTATUS_PLANE2	(1 << 3)
-# define NAND_IOSTATUS_PLANE3	(1 << 4)
+# define NAND_CMD_READ0         0x00
+# define NAND_CMD_READ1         0x01
+# define NAND_CMD_READ2         0x50
+# define NAND_CMD_LPREAD2       0x30
+# define NAND_CMD_NOSERIALREAD2 0x35
+# define NAND_CMD_RANDOMREAD1   0x05
+# define NAND_CMD_RANDOMREAD2   0xe0
+# define NAND_CMD_READID        0x90
+# define NAND_CMD_RESET         0xff
+# define NAND_CMD_PAGEPROGRAM1  0x80
+# define NAND_CMD_PAGEPROGRAM2  0x10
+# define NAND_CMD_CACHEPROGRAM2 0x15
+# define NAND_CMD_BLOCKERASE1   0x60
+# define NAND_CMD_BLOCKERASE2   0xd0
+# define NAND_CMD_READSTATUS    0x70
+# define NAND_CMD_COPYBACKPRG1  0x85
+
+# define NAND_IOSTATUS_ERROR    (1 << 0)
+# define NAND_IOSTATUS_PLANE0   (1 << 1)
+# define NAND_IOSTATUS_PLANE1   (1 << 2)
+# define NAND_IOSTATUS_PLANE2   (1 << 3)
+# define NAND_IOSTATUS_PLANE3   (1 << 4)
 # define NAND_IOSTATUS_READY    (1 << 6)
-# define NAND_IOSTATUS_UNPROTCT	(1 << 7)
+# define NAND_IOSTATUS_UNPROTCT (1 << 7)
 
-# define MAX_PAGE		0x800
-# define MAX_OOB		0x40
+# define MAX_PAGE       0x800
+# define MAX_OOB        0x40
 
 typedef struct NANDFlashState NANDFlashState;
 struct NANDFlashState {
@@ -102,40 +102,40 @@ static void mem_and(uint8_t *dest, const uint8_t *src, size_t n)
     }
 }
 
-# define NAND_NO_AUTOINCR	0x00000001
-# define NAND_BUSWIDTH_16	0x00000002
-# define NAND_NO_PADDING	0x00000004
-# define NAND_CACHEPRG		0x00000008
-# define NAND_COPYBACK		0x00000010
-# define NAND_IS_AND		0x00000020
-# define NAND_4PAGE_ARRAY	0x00000040
-# define NAND_NO_READRDY	0x00000100
-# define NAND_SAMSUNG_LP	(NAND_NO_PADDING | NAND_COPYBACK)
+# define NAND_NO_AUTOINCR   0x00000001
+# define NAND_BUSWIDTH_16   0x00000002
+# define NAND_NO_PADDING    0x00000004
+# define NAND_CACHEPRG      0x00000008
+# define NAND_COPYBACK      0x00000010
+# define NAND_IS_AND        0x00000020
+# define NAND_4PAGE_ARRAY   0x00000040
+# define NAND_NO_READRDY    0x00000100
+# define NAND_SAMSUNG_LP    (NAND_NO_PADDING | NAND_COPYBACK)
 
 # define NAND_IO
 
-# define PAGE(addr)		((addr) >> ADDR_SHIFT)
-# define PAGE_START(page)       (PAGE(page) * (NAND_PAGE_SIZE + OOB_SIZE))
-# define PAGE_MASK		((1 << ADDR_SHIFT) - 1)
-# define OOB_SHIFT		(PAGE_SHIFT - 5)
-# define OOB_SIZE		(1 << OOB_SHIFT)
-# define SECTOR(addr)		((addr) >> (9 + ADDR_SHIFT - PAGE_SHIFT))
-# define SECTOR_OFFSET(addr)	((addr) & ((511 >> PAGE_SHIFT) << 8))
-
-# define NAND_PAGE_SIZE         256
-# define PAGE_SHIFT		8
-# define PAGE_SECTORS		1
-# define ADDR_SHIFT		8
+# define PAGE(addr)          ((addr) >> ADDR_SHIFT)
+# define PAGE_START(page)    (PAGE(page) * (NAND_PAGE_SIZE + OOB_SIZE))
+# define PAGE_MASK           ((1 << ADDR_SHIFT) - 1)
+# define OOB_SHIFT           (PAGE_SHIFT - 5)
+# define OOB_SIZE            (1 << OOB_SHIFT)
+# define SECTOR(addr)        ((addr) >> (9 + ADDR_SHIFT - PAGE_SHIFT))
+# define SECTOR_OFFSET(addr) ((addr) & ((511 >> PAGE_SHIFT) << 8))
+
+# define NAND_PAGE_SIZE     256
+# define PAGE_SHIFT         8
+# define PAGE_SECTORS       1
+# define ADDR_SHIFT         8
 # include "nand.c"
-# define NAND_PAGE_SIZE         512
-# define PAGE_SHIFT		9
-# define PAGE_SECTORS		1
-# define ADDR_SHIFT		8
+# define NAND_PAGE_SIZE     512
+# define PAGE_SHIFT         9
+# define PAGE_SECTORS       1
+# define ADDR_SHIFT         8
 # include "nand.c"
-# define NAND_PAGE_SIZE         2048
-# define PAGE_SHIFT		11
-# define PAGE_SECTORS		4
-# define ADDR_SHIFT		16
+# define NAND_PAGE_SIZE     2048
+# define PAGE_SHIFT         11
+# define PAGE_SECTORS       4
+# define ADDR_SHIFT         16
 # include "nand.c"
 
 /* Information based on Linux drivers/mtd/nand/raw/nand_ids.c */
@@ -148,79 +148,79 @@ static const struct {
 } nand_flash_ids[0x100] = {
     [0 ... 0xff] = { 0 },
 
-    [0x6b] = { 4,	8,	9, 4, 0 },
-    [0xe3] = { 4,	8,	9, 4, 0 },
-    [0xe5] = { 4,	8,	9, 4, 0 },
-    [0xd6] = { 8,	8,	9, 4, 0 },
-    [0xe6] = { 8,	8,	9, 4, 0 },
-
-    [0x33] = { 16,	8,	9, 5, 0 },
-    [0x73] = { 16,	8,	9, 5, 0 },
-    [0x43] = { 16,	16,	9, 5, NAND_BUSWIDTH_16 },
-    [0x53] = { 16,	16,	9, 5, NAND_BUSWIDTH_16 },
-
-    [0x35] = { 32,	8,	9, 5, 0 },
-    [0x75] = { 32,	8,	9, 5, 0 },
-    [0x45] = { 32,	16,	9, 5, NAND_BUSWIDTH_16 },
-    [0x55] = { 32,	16,	9, 5, NAND_BUSWIDTH_16 },
-
-    [0x36] = { 64,	8,	9, 5, 0 },
-    [0x76] = { 64,	8,	9, 5, 0 },
-    [0x46] = { 64,	16,	9, 5, NAND_BUSWIDTH_16 },
-    [0x56] = { 64,	16,	9, 5, NAND_BUSWIDTH_16 },
-
-    [0x78] = { 128,	8,	9, 5, 0 },
-    [0x39] = { 128,	8,	9, 5, 0 },
-    [0x79] = { 128,	8,	9, 5, 0 },
-    [0x72] = { 128,	16,	9, 5, NAND_BUSWIDTH_16 },
-    [0x49] = { 128,	16,	9, 5, NAND_BUSWIDTH_16 },
-    [0x74] = { 128,	16,	9, 5, NAND_BUSWIDTH_16 },
-    [0x59] = { 128,	16,	9, 5, NAND_BUSWIDTH_16 },
-
-    [0x71] = { 256,	8,	9, 5, 0 },
+    [0x6b] = { 4,   8,  9, 4, 0 },
+    [0xe3] = { 4,   8,  9, 4, 0 },
+    [0xe5] = { 4,   8,  9, 4, 0 },
+    [0xd6] = { 8,   8,  9, 4, 0 },
+    [0xe6] = { 8,   8,  9, 4, 0 },
+
+    [0x33] = { 16,  8,  9, 5, 0 },
+    [0x73] = { 16,  8,  9, 5, 0 },
+    [0x43] = { 16,  16, 9, 5, NAND_BUSWIDTH_16 },
+    [0x53] = { 16,  16, 9, 5, NAND_BUSWIDTH_16 },
+
+    [0x35] = { 32,  8,  9, 5, 0 },
+    [0x75] = { 32,  8,  9, 5, 0 },
+    [0x45] = { 32,  16, 9, 5, NAND_BUSWIDTH_16 },
+    [0x55] = { 32,  16, 9, 5, NAND_BUSWIDTH_16 },
+
+    [0x36] = { 64,  8,  9, 5, 0 },
+    [0x76] = { 64,  8,  9, 5, 0 },
+    [0x46] = { 64,  16, 9, 5, NAND_BUSWIDTH_16 },
+    [0x56] = { 64,  16, 9, 5, NAND_BUSWIDTH_16 },
+
+    [0x78] = { 128, 8,  9, 5, 0 },
+    [0x39] = { 128, 8,  9, 5, 0 },
+    [0x79] = { 128, 8,  9, 5, 0 },
+    [0x72] = { 128, 16, 9, 5, NAND_BUSWIDTH_16 },
+    [0x49] = { 128, 16, 9, 5, NAND_BUSWIDTH_16 },
+    [0x74] = { 128, 16, 9, 5, NAND_BUSWIDTH_16 },
+    [0x59] = { 128, 16, 9, 5, NAND_BUSWIDTH_16 },
+
+    [0x71] = { 256, 8,  9, 5, 0 },
 
     /*
      * These are the new chips with large page size. The pagesize and the
      * erasesize is determined from the extended id bytes
      */
-# define LP_OPTIONS	(NAND_SAMSUNG_LP | NAND_NO_READRDY | NAND_NO_AUTOINCR)
-# define LP_OPTIONS16	(LP_OPTIONS | NAND_BUSWIDTH_16)
+# define LP_OPTIONS (NAND_SAMSUNG_LP | NAND_NO_READRDY | NAND_NO_AUTOINCR)
+# define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
 
     /* 512 Megabit */
-    [0xa2] = { 64,	8,	0, 0, LP_OPTIONS },
-    [0xf2] = { 64,	8,	0, 0, LP_OPTIONS },
-    [0xb2] = { 64,	16,	0, 0, LP_OPTIONS16 },
-    [0xc2] = { 64,	16,	0, 0, LP_OPTIONS16 },
+    [0xa2] = { 64,   8,  0, 0, LP_OPTIONS },
+    [0xf2] = { 64,   8,  0, 0, LP_OPTIONS },
+    [0xb2] = { 64,   16, 0, 0, LP_OPTIONS16 },
+    [0xc2] = { 64,   16, 0, 0, LP_OPTIONS16 },
 
     /* 1 Gigabit */
-    [0xa1] = { 128,	8,	0, 0, LP_OPTIONS },
-    [0xf1] = { 128,	8,	0, 0, LP_OPTIONS },
-    [0xb1] = { 128,	16,	0, 0, LP_OPTIONS16 },
-    [0xc1] = { 128,	16,	0, 0, LP_OPTIONS16 },
+    [0xa1] = { 128,  8,  0, 0, LP_OPTIONS },
+    [0xf1] = { 128,  8,  0, 0, LP_OPTIONS },
+    [0xb1] = { 128,  16, 0, 0, LP_OPTIONS16 },
+    [0xc1] = { 128,  16, 0, 0, LP_OPTIONS16 },
 
     /* 2 Gigabit */
-    [0xaa] = { 256,	8,	0, 0, LP_OPTIONS },
-    [0xda] = { 256,	8,	0, 0, LP_OPTIONS },
-    [0xba] = { 256,	16,	0, 0, LP_OPTIONS16 },
-    [0xca] = { 256,	16,	0, 0, LP_OPTIONS16 },
+    [0xaa] = { 256,  8,  0, 0, LP_OPTIONS },
+    [0xda] = { 256,  8,  0, 0, LP_OPTIONS },
+    [0xba] = { 256,  16, 0, 0, LP_OPTIONS16 },
+    [0xca] = { 256,  16, 0, 0, LP_OPTIONS16 },
 
     /* 4 Gigabit */
-    [0xac] = { 512,	8,	0, 0, LP_OPTIONS },
-    [0xdc] = { 512,	8,	0, 0, LP_OPTIONS },
-    [0xbc] = { 512,	16,	0, 0, LP_OPTIONS16 },
-    [0xcc] = { 512,	16,	0, 0, LP_OPTIONS16 },
+    [0xac] = { 512,  8,  0, 0, LP_OPTIONS },
+    [0xdc] = { 512,  8,  0, 0, LP_OPTIONS },
+    [0xbc] = { 512,  16, 0, 0, LP_OPTIONS16 },
+    [0xcc] = { 512,  16, 0, 0, LP_OPTIONS16 },
 
     /* 8 Gigabit */
-    [0xa3] = { 1024,	8,	0, 0, LP_OPTIONS },
-    [0xd3] = { 1024,	8,	0, 0, LP_OPTIONS },
-    [0xb3] = { 1024,	16,	0, 0, LP_OPTIONS16 },
-    [0xc3] = { 1024,	16,	0, 0, LP_OPTIONS16 },
+    [0xa3] = { 1024, 8,  0, 0, LP_OPTIONS },
+    [0xd3] = { 1024, 8,  0, 0, LP_OPTIONS },
+    [0xb3] = { 1024, 16, 0, 0, LP_OPTIONS16 },
+    [0xc3] = { 1024, 16, 0, 0, LP_OPTIONS16 },
 
     /* 16 Gigabit */
-    [0xa5] = { 2048,	8,	0, 0, LP_OPTIONS },
-    [0xd5] = { 2048,	8,	0, 0, LP_OPTIONS },
-    [0xb5] = { 2048,	16,	0, 0, LP_OPTIONS16 },
-    [0xc5] = { 2048,	16,	0, 0, LP_OPTIONS16 },
+    [0xa5] = { 2048, 8,  0, 0, LP_OPTIONS },
+    [0xd5] = { 2048, 8,  0, 0, LP_OPTIONS },
+    [0xb5] = { 2048, 16, 0, 0, LP_OPTIONS16 },
+    [0xc5] = { 2048, 16, 0, 0, LP_OPTIONS16 },
 };
 
 static void nand_reset(DeviceState *dev)
@@ -812,4 +812,4 @@ static void glue(nand_init_, NAND_PAGE_SIZE)(NANDFlashState *s)
 # undef PAGE_SHIFT
 # undef PAGE_SECTORS
 # undef ADDR_SHIFT
-#endif	/* NAND_IO */
+#endif /* NAND_IO */
diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 1fde975024..50d3d1c985 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -35,10 +35,10 @@
 #include "qom/object.h"
 
 /* 11 for 2kB-page OneNAND ("2nd generation") and 10 for 1kB-page chips */
-#define PAGE_SHIFT	11
+#define PAGE_SHIFT 11
 
 /* Fixed */
-#define BLOCK_SHIFT	(PAGE_SHIFT + 6)
+#define BLOCK_SHIFT (PAGE_SHIFT + 6)
 
 #define TYPE_ONE_NAND "onenand"
 OBJECT_DECLARE_SIMPLE_TYPE(OneNANDState, ONE_NAND)
@@ -408,23 +408,23 @@ static void onenand_command(OneNANDState *s)
     int b;
     int sec;
     void *buf;
-#define SETADDR(block, page)			\
-    sec = (s->addr[page] & 3) +			\
-            ((((s->addr[page] >> 2) & 0x3f) +	\
-              (((s->addr[block] & 0xfff) |	\
-                (s->addr[block] >> 15 ?		\
-                 s->density_mask : 0)) << 6)) << (PAGE_SHIFT - 9));
-#define SETBUF_M()				\
-    buf = (s->bufaddr & 8) ?			\
-            s->data[(s->bufaddr >> 2) & 1][0] : s->boot[0];	\
+#define SETADDR(block, page)                                \
+    sec = (s->addr[page] & 3) +                             \
+          ((((s->addr[page] >> 2) & 0x3f) +                 \
+            (((s->addr[block] & 0xfff) |                    \
+              (s->addr[block] >> 15 ? s->density_mask : 0)) \
+             << 6))                                         \
+           << (PAGE_SHIFT - 9));
+#define SETBUF_M()                                                           \
+    buf = (s->bufaddr & 8) ? s->data[(s->bufaddr >> 2) & 1][0] : s->boot[0]; \
     buf += (s->bufaddr & 3) << 9;
-#define SETBUF_S()				\
-    buf = (s->bufaddr & 8) ?			\
-            s->data[(s->bufaddr >> 2) & 1][1] : s->boot[1];	\
+#define SETBUF_S()                                          \
+    buf = (s->bufaddr & 8) ?                                \
+            s->data[(s->bufaddr >> 2) & 1][1] : s->boot[1]; \
     buf += (s->bufaddr & 3) << 4;
 
     switch (s->command) {
-    case 0x00:	/* Load single/multiple sector data unit into buffer */
+    case 0x00:  /* Load single/multiple sector data unit into buffer */
         SETADDR(ONEN_BUF_BLOCK, ONEN_BUF_PAGE)
 
         SETBUF_M()
@@ -443,7 +443,7 @@ static void onenand_command(OneNANDState *s)
          */
         s->intstatus |= ONEN_INT | ONEN_INT_LOAD;
         break;
-    case 0x13:	/* Load single/multiple spare sector into buffer */
+    case 0x13:  /* Load single/multiple spare sector into buffer */
         SETADDR(ONEN_BUF_BLOCK, ONEN_BUF_PAGE)
 
         SETBUF_S()
@@ -456,7 +456,7 @@ static void onenand_command(OneNANDState *s)
          */
         s->intstatus |= ONEN_INT | ONEN_INT_LOAD;
         break;
-    case 0x80:	/* Program single/multiple sector data unit from buffer */
+    case 0x80:  /* Program single/multiple sector data unit from buffer */
         SETADDR(ONEN_BUF_BLOCK, ONEN_BUF_PAGE)
 
         SETBUF_M()
@@ -475,7 +475,7 @@ static void onenand_command(OneNANDState *s)
          */
         s->intstatus |= ONEN_INT | ONEN_INT_PROG;
         break;
-    case 0x1a:	/* Program single/multiple spare area sector from buffer */
+    case 0x1a:  /* Program single/multiple spare area sector from buffer */
         SETADDR(ONEN_BUF_BLOCK, ONEN_BUF_PAGE)
 
         SETBUF_S()
@@ -488,7 +488,7 @@ static void onenand_command(OneNANDState *s)
          */
         s->intstatus |= ONEN_INT | ONEN_INT_PROG;
         break;
-    case 0x1b:	/* Copy-back program */
+    case 0x1b:  /* Copy-back program */
         SETBUF_S()
 
         SETADDR(ONEN_BUF_BLOCK, ONEN_BUF_PAGE)
@@ -504,7 +504,7 @@ static void onenand_command(OneNANDState *s)
         s->intstatus |= ONEN_INT | ONEN_INT_PROG;
         break;
 
-    case 0x23:	/* Unlock NAND array block(s) */
+    case 0x23:  /* Unlock NAND array block(s) */
         s->intstatus |= ONEN_INT;
 
         /* XXX the previous (?) area should be locked automatically */
@@ -519,7 +519,7 @@ static void onenand_command(OneNANDState *s)
             s->wpstatus = s->blockwp[b] = ONEN_LOCK_UNLOCKED;
         }
         break;
-    case 0x27:	/* Unlock All NAND array blocks */
+    case 0x27:  /* Unlock All NAND array blocks */
         s->intstatus |= ONEN_INT;
 
         for (b = 0; b < s->blocks; b ++) {
@@ -530,7 +530,7 @@ static void onenand_command(OneNANDState *s)
         }
         break;
 
-    case 0x2a:	/* Lock NAND array block(s) */
+    case 0x2a:  /* Lock NAND array block(s) */
         s->intstatus |= ONEN_INT;
 
         for (b = s->unladdr[0]; b <= s->unladdr[1]; b ++) {
@@ -544,7 +544,7 @@ static void onenand_command(OneNANDState *s)
             s->wpstatus = s->blockwp[b] = ONEN_LOCK_LOCKED;
         }
         break;
-    case 0x2c:	/* Lock-tight NAND array block(s) */
+    case 0x2c:  /* Lock-tight NAND array block(s) */
         s->intstatus |= ONEN_INT;
 
         for (b = s->unladdr[0]; b <= s->unladdr[1]; b ++) {
@@ -559,13 +559,13 @@ static void onenand_command(OneNANDState *s)
         }
         break;
 
-    case 0x71:	/* Erase-Verify-Read */
+    case 0x71:  /* Erase-Verify-Read */
         s->intstatus |= ONEN_INT;
         break;
-    case 0x95:	/* Multi-block erase */
+    case 0x95:  /* Multi-block erase */
         qemu_irq_pulse(s->intr);
         /* Fall through.  */
-    case 0x94:	/* Block erase */
+    case 0x94:  /* Block erase */
         sec = ((s->addr[ONEN_BUF_BLOCK] & 0xfff) |
                         (s->addr[ONEN_BUF_BLOCK] >> 15 ? s->density_mask : 0))
                 << (BLOCK_SHIFT - 9);
@@ -574,20 +574,20 @@ static void onenand_command(OneNANDState *s)
 
         s->intstatus |= ONEN_INT | ONEN_INT_ERASE;
         break;
-    case 0xb0:	/* Erase suspend */
+    case 0xb0:  /* Erase suspend */
         break;
-    case 0x30:	/* Erase resume */
+    case 0x30:  /* Erase resume */
         s->intstatus |= ONEN_INT | ONEN_INT_ERASE;
         break;
 
-    case 0xf0:	/* Reset NAND Flash core */
+    case 0xf0:  /* Reset NAND Flash core */
         onenand_reset(s, 0);
         break;
-    case 0xf3:	/* Reset OneNAND */
+    case 0xf3:  /* Reset OneNAND */
         onenand_reset(s, 0);
         break;
 
-    case 0x65:	/* OTP Access */
+    case 0x65:  /* OTP Access */
         s->intstatus |= ONEN_INT;
         s->blk_cur = NULL;
         s->current = s->otp;
@@ -616,52 +616,52 @@ static uint64_t onenand_read(void *opaque, hwaddr addr,
     case 0x0000 ... 0xbffe:
         return lduw_le_p(s->boot[0] + addr);
 
-    case 0xf000:	/* Manufacturer ID */
+    case 0xf000:  /* Manufacturer ID */
         return s->id.man;
-    case 0xf001:	/* Device ID */
+    case 0xf001:  /* Device ID */
         return s->id.dev;
-    case 0xf002:	/* Version ID */
+    case 0xf002:  /* Version ID */
         return s->id.ver;
     /* TODO: get the following values from a real chip!  */
-    case 0xf003:	/* Data Buffer size */
+    case 0xf003:  /* Data Buffer size */
         return 1 << PAGE_SHIFT;
-    case 0xf004:	/* Boot Buffer size */
+    case 0xf004:  /* Boot Buffer size */
         return 0x200;
-    case 0xf005:	/* Amount of buffers */
+    case 0xf005:  /* Amount of buffers */
         return 1 | (2 << 8);
-    case 0xf006:	/* Technology */
+    case 0xf006:  /* Technology */
         return 0;
 
-    case 0xf100 ... 0xf107:	/* Start addresses */
+    case 0xf100 ... 0xf107:  /* Start addresses */
         return s->addr[offset - 0xf100];
 
-    case 0xf200:	/* Start buffer */
+    case 0xf200:  /* Start buffer */
         return (s->bufaddr << 8) | ((s->count - 1) & (1 << (PAGE_SHIFT - 10)));
 
-    case 0xf220:	/* Command */
+    case 0xf220:  /* Command */
         return s->command;
-    case 0xf221:	/* System Configuration 1 */
+    case 0xf221:  /* System Configuration 1 */
         return s->config[0] & 0xffe0;
-    case 0xf222:	/* System Configuration 2 */
+    case 0xf222:  /* System Configuration 2 */
         return s->config[1];
 
-    case 0xf240:	/* Controller Status */
+    case 0xf240:  /* Controller Status */
         return s->status;
-    case 0xf241:	/* Interrupt */
+    case 0xf241:  /* Interrupt */
         return s->intstatus;
-    case 0xf24c:	/* Unlock Start Block Address */
+    case 0xf24c:  /* Unlock Start Block Address */
         return s->unladdr[0];
-    case 0xf24d:	/* Unlock End Block Address */
+    case 0xf24d:  /* Unlock End Block Address */
         return s->unladdr[1];
-    case 0xf24e:	/* Write Protection Status */
+    case 0xf24e:  /* Write Protection Status */
         return s->wpstatus;
 
-    case 0xff00:	/* ECC Status */
+    case 0xff00:  /* ECC Status */
         return 0x00;
-    case 0xff01:	/* ECC Result of main area data */
-    case 0xff02:	/* ECC Result of spare area data */
-    case 0xff03:	/* ECC Result of main area data */
-    case 0xff04:	/* ECC Result of spare area data */
+    case 0xff01:  /* ECC Result of main area data */
+    case 0xff02:  /* ECC Result of spare area data */
+    case 0xff03:  /* ECC Result of main area data */
+    case 0xff04:  /* ECC Result of spare area data */
         qemu_log_mask(LOG_UNIMP,
                       "onenand: ECC result registers unimplemented\n");
         return 0x0000;
@@ -696,15 +696,15 @@ static void onenand_write(void *opaque, hwaddr addr,
         }
 
         switch (value) {
-        case 0x00f0:	/* Reset OneNAND */
+        case 0x00f0:  /* Reset OneNAND */
             onenand_reset(s, 0);
             break;
 
-        case 0x00e0:	/* Load Data into Buffer */
+        case 0x00e0:  /* Load Data into Buffer */
             s->cycle = 1;
             break;
 
-        case 0x0090:	/* Read Identification Data */
+        case 0x0090:  /* Read Identification Data */
             memset(s->boot[0], 0, 3 << s->shift);
             s->boot[0][0 << s->shift] = s->id.man & 0xff;
             s->boot[0][1 << s->shift] = s->id.dev & 0xff;
@@ -718,11 +718,11 @@ static void onenand_write(void *opaque, hwaddr addr,
         }
         break;
 
-    case 0xf100 ... 0xf107:	/* Start addresses */
+    case 0xf100 ... 0xf107:  /* Start addresses */
         s->addr[offset - 0xf100] = value;
         break;
 
-    case 0xf200:	/* Start buffer */
+    case 0xf200:  /* Start buffer */
         s->bufaddr = (value >> 8) & 0xf;
         if (PAGE_SHIFT == 11)
             s->count = (value & 3) ?: 4;
@@ -730,36 +730,36 @@ static void onenand_write(void *opaque, hwaddr addr,
             s->count = (value & 1) ?: 2;
         break;
 
-    case 0xf220:	/* Command */
+    case 0xf220:  /* Command */
         if (s->intstatus & (1 << 15))
             break;
         s->command = value;
         onenand_command(s);
         break;
-    case 0xf221:	/* System Configuration 1 */
+    case 0xf221:  /* System Configuration 1 */
         s->config[0] = value;
         onenand_intr_update(s);
         qemu_set_irq(s->rdy, (s->config[0] >> 7) & 1);
         break;
-    case 0xf222:	/* System Configuration 2 */
+    case 0xf222:  /* System Configuration 2 */
         s->config[1] = value;
         break;
 
-    case 0xf241:	/* Interrupt */
+    case 0xf241:  /* Interrupt */
         s->intstatus &= value;
         if ((1 << 15) & ~s->intstatus)
             s->status &= ~(ONEN_ERR_CMD | ONEN_ERR_ERASE |
                             ONEN_ERR_PROG | ONEN_ERR_LOAD);
         onenand_intr_update(s);
         break;
-    case 0xf24c:	/* Unlock Start Block Address */
+    case 0xf24c:  /* Unlock Start Block Address */
         s->unladdr[0] = value & (s->blocks - 1);
         /* For some reason we have to set the end address to by default
          * be same as start because the software forgets to write anything
          * in there.  */
         s->unladdr[1] = value & (s->blocks - 1);
         break;
-    case 0xf24d:	/* Unlock End Block Address */
+    case 0xf24d:  /* Unlock End Block Address */
         s->unladdr[1] = value & (s->blocks - 1);
         break;
 
diff --git a/hw/block/tc58128.c b/hw/block/tc58128.c
index bfc27ad899..d350126b27 100644
--- a/hw/block/tc58128.c
+++ b/hw/block/tc58128.c
@@ -62,24 +62,24 @@ static void init_dev(tc58128_dev * dev, const char *filename)
     dev->flash_contents = g_malloc(FLASH_SIZE);
     memset(dev->flash_contents, 0xff, FLASH_SIZE);
     if (filename) {
-	/* Load flash image skipping the first block */
+        /* Load flash image skipping the first block */
         ret = load_image_size(filename, dev->flash_contents + 528 * 32,
                               FLASH_SIZE - 528 * 32);
-	if (ret < 0) {
+        if (ret < 0) {
             if (!qtest_enabled()) {
                 error_report("Could not load flash image %s", filename);
                 exit(1);
             }
-	} else {
-	    /* Build first block with number of blocks */
+        } else {
+            /* Build first block with number of blocks */
             blocks = DIV_ROUND_UP(ret, 528 * 32);
-	    dev->flash_contents[0] = blocks & 0xff;
-	    dev->flash_contents[1] = (blocks >> 8) & 0xff;
-	    dev->flash_contents[2] = (blocks >> 16) & 0xff;
-	    dev->flash_contents[3] = (blocks >> 24) & 0xff;
-	    fprintf(stderr, "loaded %d bytes for %s into flash\n", ret,
-		    filename);
-	}
+            dev->flash_contents[0] = blocks & 0xff;
+            dev->flash_contents[1] = (blocks >> 8) & 0xff;
+            dev->flash_contents[2] = (blocks >> 16) & 0xff;
+            dev->flash_contents[3] = (blocks >> 24) & 0xff;
+            fprintf(stderr, "loaded %d bytes for %s into flash\n", ret,
+                    filename);
+        }
     }
 }
 
@@ -87,26 +87,26 @@ static void handle_command(tc58128_dev * dev, uint8_t command)
 {
     switch (command) {
     case 0xff:
-	fprintf(stderr, "reset flash device\n");
-	dev->state = WAIT;
-	break;
+        fprintf(stderr, "reset flash device\n");
+        dev->state = WAIT;
+        break;
     case 0x00:
-	fprintf(stderr, "read mode 1\n");
-	dev->state = READ1;
-	dev->address_cycle = 0;
-	break;
+        fprintf(stderr, "read mode 1\n");
+        dev->state = READ1;
+        dev->address_cycle = 0;
+        break;
     case 0x01:
-	fprintf(stderr, "read mode 2\n");
-	dev->state = READ2;
-	dev->address_cycle = 0;
-	break;
+        fprintf(stderr, "read mode 2\n");
+        dev->state = READ2;
+        dev->address_cycle = 0;
+        break;
     case 0x50:
-	fprintf(stderr, "read mode 3\n");
-	dev->state = READ3;
-	dev->address_cycle = 0;
-	break;
+        fprintf(stderr, "read mode 3\n");
+        dev->state = READ3;
+        dev->address_cycle = 0;
+        break;
     default:
-	fprintf(stderr, "unknown flash command 0x%02x\n", command);
+        fprintf(stderr, "unknown flash command 0x%02x\n", command);
         abort();
     }
 }
@@ -117,28 +117,28 @@ static void handle_address(tc58128_dev * dev, uint8_t data)
     case READ1:
     case READ2:
     case READ3:
-	switch (dev->address_cycle) {
-	case 0:
-	    dev->address = data;
-	    if (dev->state == READ2)
-		dev->address |= 0x100;
-	    else if (dev->state == READ3)
-		dev->address |= 0x200;
-	    break;
-	case 1:
-	    dev->address += data * 528 * 0x100;
-	    break;
-	case 2:
-	    dev->address += data * 528;
-	    fprintf(stderr, "address pointer in flash: 0x%08x\n",
-		    dev->address);
-	    break;
-	default:
-	    /* Invalid data */
+        switch (dev->address_cycle) {
+        case 0:
+            dev->address = data;
+            if (dev->state == READ2)
+                dev->address |= 0x100;
+            else if (dev->state == READ3)
+                dev->address |= 0x200;
+            break;
+        case 1:
+            dev->address += data * 528 * 0x100;
+            break;
+        case 2:
+            dev->address += data * 528;
+            fprintf(stderr, "address pointer in flash: 0x%08x\n",
+                    dev->address);
+            break;
+        default:
+            /* Invalid data */
             abort();
-	}
-	dev->address_cycle++;
-	break;
+        }
+        dev->address_cycle++;
+        break;
     default:
         abort();
     }
@@ -148,7 +148,7 @@ static uint8_t handle_read(tc58128_dev * dev)
 {
 #if 0
     if (dev->address % 0x100000 == 0)
-	fprintf(stderr, "reading flash at address 0x%08x\n", dev->address);
+        fprintf(stderr, "reading flash at address 0x%08x\n", dev->address);
 #endif
     return dev->flash_contents[dev->address++];
 }
@@ -163,31 +163,31 @@ static int tc58128_cb(uint16_t porta, uint16_t portb,
     int dev;
 
     if ((porta & CE1) == 0)
-	dev = 0;
+        dev = 0;
     else if ((porta & CE2) == 0)
-	dev = 1;
+        dev = 1;
     else
-	return 0;		/* No device selected */
+        return 0;        /* No device selected */
 
     if ((porta & RE) && (porta & WE)) {
-	/* Nothing to do, assert ready and return to input state */
-	*periph_portadir &= 0xff00;
-	*periph_portadir |= RDY(dev);
-	*periph_pdtra |= RDY(dev);
-	return 1;
+        /* Nothing to do, assert ready and return to input state */
+        *periph_portadir &= 0xff00;
+        *periph_portadir |= RDY(dev);
+        *periph_pdtra |= RDY(dev);
+        return 1;
     }
 
     if (porta & CLE) {
-	/* Command */
-	assert((porta & WE) == 0);
-	handle_command(&tc58128_devs[dev], porta & 0x00ff);
+        /* Command */
+        assert((porta & WE) == 0);
+        handle_command(&tc58128_devs[dev], porta & 0x00ff);
     } else if (porta & ALE) {
-	assert((porta & WE) == 0);
-	handle_address(&tc58128_devs[dev], porta & 0x00ff);
+        assert((porta & WE) == 0);
+        handle_address(&tc58128_devs[dev], porta & 0x00ff);
     } else if ((porta & RE) == 0) {
-	*periph_portadir |= 0x00ff;
-	*periph_pdtra &= 0xff00;
-	*periph_pdtra |= handle_read(&tc58128_devs[dev]);
+        *periph_portadir |= 0x00ff;
+        *periph_pdtra &= 0xff00;
+        *periph_pdtra |= handle_read(&tc58128_devs[dev]);
     } else {
         abort();
     }
@@ -195,9 +195,9 @@ static int tc58128_cb(uint16_t porta, uint16_t portb,
 }
 
 static sh7750_io_device tc58128 = {
-    RE | WE,			/* Port A triggers */
-    0,				/* Port B triggers */
-    tc58128_cb			/* Callback */
+    RE | WE,            /* Port A triggers */
+    0,                  /* Port B triggers */
+    tc58128_cb          /* Callback */
 };
 
 int tc58128_init(struct SH7750State *s, const char *zone1, const char *zone2)
-- 
2.31.1


