Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B66D3735AA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:37:47 +0200 (CEST)
Received: from localhost ([::1]:35934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leC6M-0000ww-JO
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4b-0007aA-DZ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:35:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57700
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4W-00027q-JS
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:35:57 -0400
Received: from host81-154-26-71.range81-154.btcentralplus.com ([81.154.26.71]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4U-0000OI-6h; Wed, 05 May 2021 08:35:50 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  5 May 2021 08:35:33 +0100
Message-Id: <20210505073538.11438-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
References: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.154.26.71
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 05/10] hw/sparc/sun4m: Fix code style for checkpatch.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We are going to move this code, fix its style first.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20210503171303.822501-6-f4bug@amsat.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/sparc/sun4m.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index a625c41cd3..956216591b 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -1181,11 +1181,11 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .dma_base     = 0xef0400000ULL,
         .esp_base     = 0xef0800000ULL,
         .le_base      = 0xef0c00000ULL,
-        .apc_base     = 0xefa000000ULL, // XXX should not exist
+        .apc_base     = 0xefa000000ULL, /* XXX should not exist */
         .aux1_base    = 0xff1800000ULL,
         .aux2_base    = 0xff1a01000ULL,
         .ecc_base     = 0xf00000000ULL,
-        .ecc_version  = 0x10000000, // version 0, implementation 1
+        .ecc_version  = 0x10000000, /* version 0, implementation 1 */
         .nvram_machine_id = 0x72,
         .machine_id = ss10_id,
         .iommu_version = 0x03000000,
@@ -1204,11 +1204,11 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .dma_base     = 0xef0081000ULL,
         .esp_base     = 0xef0080000ULL,
         .le_base      = 0xef0060000ULL,
-        .apc_base     = 0xefa000000ULL, // XXX should not exist
+        .apc_base     = 0xefa000000ULL, /* XXX should not exist */
         .aux1_base    = 0xff1800000ULL,
-        .aux2_base    = 0xff1a01000ULL, // XXX should not exist
+        .aux2_base    = 0xff1a01000ULL, /* XXX should not exist */
         .ecc_base     = 0xf00000000ULL,
-        .ecc_version  = 0x00000000, // version 0, implementation 0
+        .ecc_version  = 0x00000000, /* version 0, implementation 0 */
         .nvram_machine_id = 0x71,
         .machine_id = ss600mp_id,
         .iommu_version = 0x01000000,
@@ -1230,7 +1230,7 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .esp_base     = 0xef0800000ULL,
         .le_base      = 0xef0c00000ULL,
         .bpp_base     = 0xef4800000ULL,
-        .apc_base     = 0xefa000000ULL, // XXX should not exist
+        .apc_base     = 0xefa000000ULL, /* XXX should not exist */
         .aux1_base    = 0xff1800000ULL,
         .aux2_base    = 0xff1a01000ULL,
         .dbri_base    = 0xee0000000ULL,
@@ -1249,7 +1249,7 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
             }
         },
         .ecc_base     = 0xf00000000ULL,
-        .ecc_version  = 0x20000000, // version 0, implementation 2
+        .ecc_version  = 0x20000000, /* version 0, implementation 2 */
         .nvram_machine_id = 0x72,
         .machine_id = ss20_id,
         .iommu_version = 0x13000000,
@@ -1270,7 +1270,7 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .dma_base     = 0x78400000,
         .esp_base     = 0x78800000,
         .le_base      = 0x78c00000,
-        .apc_base     = 0x71300000, // pmc
+        .apc_base     = 0x71300000, /* pmc */
         .aux1_base    = 0x71900000,
         .aux2_base    = 0x71910000,
         .nvram_machine_id = 0x80,
@@ -1352,7 +1352,7 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
     /* SPARCbook */
     {
         .iommu_base   = 0x10000000,
-        .tcx_base     = 0x50000000, // XXX
+        .tcx_base     = 0x50000000, /* XXX */
         .slavio_base  = 0x70000000,
         .ms_kb_base   = 0x71000000,
         .serial_base  = 0x71100000,
-- 
2.20.1


