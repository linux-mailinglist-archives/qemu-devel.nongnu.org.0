Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4067268724
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 10:24:40 +0200 (CEST)
Received: from localhost ([::1]:58934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHjmx-0002rj-Jd
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 04:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1kHjeM-0003ho-4E
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 04:15:46 -0400
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:46964)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1kHjeJ-0000vv-7f
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 04:15:45 -0400
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 08E8EMMP043036;
 Mon, 14 Sep 2020 10:14:22 +0200 (CEST)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 08E8ELd4006057; Mon, 14 Sep 2020 10:14:21 +0200
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 08E8ELPt006055;
 Mon, 14 Sep 2020 10:14:21 +0200
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH v3 7/7] hw/net/can: Correct Kconfig dependencies after switch
 to meson build.
Date: Mon, 14 Sep 2020 10:13:42 +0200
Message-Id: <dd332de687bfe52bbec37f5de1d861fb8e620d74.1600069689.git.pisa@cmp.felk.cvut.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1600069689.git.pisa@cmp.felk.cvut.cz>
References: <cover.1600069689.git.pisa@cmp.felk.cvut.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 08E8EMMP043036
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached, score=-0.1, 
 required 6, BAYES_00 -0.50, KHOP_HELO_FCRDNS 0.40,
 SPF_HELO_NONE 0.00, SPF_NONE 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1600676068.86087@P/U2A9iJUHDKWWrpFq4lOQ
Received-SPF: none client-ip=2001:718:2:1611:0:1:0:70;
 envelope-from=pisa@cmp.felk.cvut.cz; helo=relay.felk.cvut.cz
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 04:11:16
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Jiri Novak <jnovak@fel.cvut.cz>, Stefan Hajnoczi <stefanha@gmail.com>,
 Deniz Eren <deniz.eren@icloud.com>, Markus Armbruster <armbru@redhat.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Konrad Frederic <frederic.konrad@adacore.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Jan Charvat <charvj10@fel.cvut.cz>,
 Oliver Hartkopp <socketcan@hartkopp.net>, Ondrej Ille <ondrej.ille@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The original CAN_PCI config option enables multiple SJA1000 PCI boards
emulation build. These boards bridge SJA1000 into I/O or memory
address space of the host CPU and depend on SJA1000 emulation.

Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
---
 hw/net/Kconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/net/Kconfig b/hw/net/Kconfig
index 225d948841..6d795ec752 100644
--- a/hw/net/Kconfig
+++ b/hw/net/Kconfig
@@ -132,16 +132,15 @@ config ROCKER
 config CAN_BUS
     bool
 
-config CAN_PCI
+config CAN_SJA1000
     bool
     default y if PCI_DEVICES
-    depends on PCI
     select CAN_BUS
 
-config CAN_SJA1000
+config CAN_PCI
     bool
     default y if PCI_DEVICES
-    depends on PCI
+    depends on PCI && CAN_SJA1000
     select CAN_BUS
 
 config CAN_CTUCANFD
-- 
2.20.1


