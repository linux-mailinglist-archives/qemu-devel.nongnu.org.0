Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F9969D29D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:16:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUAhg-0006z1-B2; Mon, 20 Feb 2023 13:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUAhF-0006Pt-8f
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:15:36 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUAhC-0007XJ-JU
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:15:28 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C23CD7470CA;
 Mon, 20 Feb 2023 19:15:10 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A19FF7470C8; Mon, 20 Feb 2023 19:15:10 +0100 (CET)
Message-Id: <03599fd4db313ac4f651cceb43340109ad6a14b8.1676916640.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1676916639.git.balaton@eik.bme.hu>
References: <cover.1676916639.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 7/7] hw/usb/hcd-ohci: Fix typo
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <"peter.maydell@linaro.org>, philmd"@linaro.org>
Date: Mon, 20 Feb 2023 19:15:10 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
[balaton: rebased on clean up series]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/usb/hcd-ohci.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 88bd42b14a..98315b2301 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -58,7 +58,7 @@ struct ohci_hcca {
 #define ED_WBACK_OFFSET offsetof(struct ohci_ed, head)
 #define ED_WBACK_SIZE   4
 
-/* Bitfields for the first word of an Endpoint Desciptor. */
+/* Bitfields for the first word of an Endpoint Descriptor. */
 #define OHCI_ED_FA_SHIFT  0
 #define OHCI_ED_FA_MASK   (0x7f << OHCI_ED_FA_SHIFT)
 #define OHCI_ED_EN_SHIFT  7
@@ -71,11 +71,11 @@ struct ohci_hcca {
 #define OHCI_ED_MPS_SHIFT 16
 #define OHCI_ED_MPS_MASK  (0x7ff << OHCI_ED_MPS_SHIFT)
 
-/* Flags in the head field of an Endpoint Desciptor. */
+/* Flags in the head field of an Endpoint Descriptor. */
 #define OHCI_ED_H         1
 #define OHCI_ED_C         2
 
-/* Bitfields for the first word of a Transfer Desciptor. */
+/* Bitfields for the first word of a Transfer Descriptor. */
 #define OHCI_TD_R         (1 << 18)
 #define OHCI_TD_DP_SHIFT  19
 #define OHCI_TD_DP_MASK   (3 << OHCI_TD_DP_SHIFT)
@@ -88,14 +88,14 @@ struct ohci_hcca {
 #define OHCI_TD_CC_SHIFT  28
 #define OHCI_TD_CC_MASK   (0xf << OHCI_TD_CC_SHIFT)
 
-/* Bitfields for the first word of an Isochronous Transfer Desciptor. */
-/* CC & DI - same as in the General Transfer Desciptor */
+/* Bitfields for the first word of an Isochronous Transfer Descriptor. */
+/* CC & DI - same as in the General Transfer Descriptor */
 #define OHCI_TD_SF_SHIFT  0
 #define OHCI_TD_SF_MASK   (0xffff << OHCI_TD_SF_SHIFT)
 #define OHCI_TD_FC_SHIFT  24
 #define OHCI_TD_FC_MASK   (7 << OHCI_TD_FC_SHIFT)
 
-/* Isochronous Transfer Desciptor - Offset / PacketStatusWord */
+/* Isochronous Transfer Descriptor - Offset / PacketStatusWord */
 #define OHCI_TD_PSW_CC_SHIFT 12
 #define OHCI_TD_PSW_CC_MASK  (0xf << OHCI_TD_PSW_CC_SHIFT)
 #define OHCI_TD_PSW_SIZE_SHIFT 0
-- 
2.30.7


