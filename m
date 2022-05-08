Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4141751F0EC
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 22:01:14 +0200 (CEST)
Received: from localhost ([::1]:51434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnn5d-0006cV-5x
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 16:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn1p-0004Tn-Jj
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:57:17 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn1o-0006x5-6X
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:57:17 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn0o-0000yR-Ew; Sun, 08 May 2022 20:56:18 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Sun,  8 May 2022 20:55:58 +0100
Message-Id: <20220508195650.28590-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
References: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 01/53] dino: checkpatch fixes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220504092600.10048-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/dino.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index eab96dd84e..4031cfb7f0 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -101,8 +101,10 @@ static const uint32_t reg800_keep_bits[DINO800_REGS] = {
 struct DinoState {
     PCIHostState parent_obj;
 
-    /* PCI_CONFIG_ADDR is parent_obj.config_reg, via pci_host_conf_be_ops,
-       so that we can map PCI_CONFIG_DATA to pci_host_data_be_ops.  */
+    /*
+     * PCI_CONFIG_ADDR is parent_obj.config_reg, via pci_host_conf_be_ops,
+     * so that we can map PCI_CONFIG_DATA to pci_host_data_be_ops.
+     */
     uint32_t config_reg_dino; /* keep original copy, including 2 lowest bits */
 
     uint32_t iar0;
-- 
2.20.1


