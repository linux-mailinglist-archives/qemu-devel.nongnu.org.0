Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7412254507D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:18:30 +0200 (CEST)
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJvZ-0007oF-HJ
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1525abdf4=anthony.perard@citrix.com>)
 id 1nzIkD-0001T9-EN; Thu, 09 Jun 2022 10:02:41 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:31027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1525abdf4=anthony.perard@citrix.com>)
 id 1nzIkB-00082x-Cb; Thu, 09 Jun 2022 10:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1654783359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GCi02nV81YV0tmImsGwUdNEFIjjd2D3ncf0k9Oyr2J0=;
 b=L47WN67td54gmRSoWYPK6gk0VeIP4NWNDNayuB988LdoyE7HW3gNMszP
 jH+t7441B7xh24GbfjCqgNt4PXpjEbdsCgbo7AeED78zGBJXSFmf0JKZx
 +rpRmeOgWQSI3T6IPu+7kC2IMX1C7QcvO6swmZYXOX0TV9jit3qmWLkm0 c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73081441
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hxNNkKsJRYK5PaG/fUxY5bVxvefnVDteMUV32f8akzHdYApBsoF/q
 tZmKW6Cb62PNzakc95+b97l/EgO68eAyNNqTwM5+Xs0ESxB+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW13V6
 YupyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8pG/XrtfQQeCB4GnpRbbZP+7TBKGGw5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWU0NESZP0EWUrsRILMMuN/wmSDeSRJ7hkLE+asv5VjyyQMkhdABN/KKI4fXFK25hH2wp
 HnA+HvRGBwWNNWDjzGC9xqEn+LKgGbxXIUZF5W+8fhlhkDVwXYcYDUPWF6m5PW0lEO6c9RYL
 UMS52wpt6da3FerQ9/hUgyQr3uNvxpaUN1Ve9DW8ynUlPCSuVzAQDFZEHgRM7TKqfPaWxQq8
 weussPkLgVPuea6GWmU9bySpCq9bH19wXA5WcMUcecUy4C9/d1t00iTHokL/L2d1YOsR2ypq
 9yehG1n3uhI05ZWv0mu1Qqf6w9AsKQlWeLcCu//emu+pj10a4e+D2BDwQiKtK0QRGp1o7Tog
 ZTlpyR9xLpXZX11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8jeBgwaZxUJWGyO
 Cc/XD+9A7cKZBOXgVJfOdrtW6zGM4C7fTgaahwkRoUXOcUgHON21CpveVSRzwjQraTYqolmY
 c3zWZ/1VR4yUP07pBLrFrx1+eJ6mUgDKZb7GMmTI+KPiuLOOhZ4iN4tbTOzUwzOxPPc+lWMo
 o0PbqNnCXx3CYXDX8UeyqZLRXhiEJTxLcqeRxB/HgJbHjdbJQ==
IronPort-HdrOrdr: A9a23:Ub9Atai9rI0iFYRiGchwfehakXBQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.91,287,1647316800"; d="scan'208";a="73081441"
To: <qemu-devel@nongnu.org>
CC: Bernhard Beschow <shentey@gmail.com>, Anthony PERARD
 <anthony.perard@citrix.com>, John Snow <jsnow@redhat.com>,
 <qemu-block@nongnu.org>
Subject: [PULL 2/3] hw/ide/piix: Add some documentation to
 pci_piix3_xen_ide_unplug()
Date: Thu, 9 Jun 2022 15:02:01 +0100
Message-ID: <20220609140202.45227-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220609140202.45227-1-anthony.perard@citrix.com>
References: <20220609140202.45227-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=prvs=1525abdf4=anthony.perard@citrix.com;
 helo=esa6.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

The comment is based on commit message
ae4d2eb273b167dad748ea4249720319240b1ac2 'xen-platform: add missing disk
unplug option'. Since it seems to describe design decisions and
limitations that still apply it seems worth having.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Message-Id: <20220513180957.90514-3-shentey@gmail.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/ide/piix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 2345fe9e1d..bc1b37512a 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -173,6 +173,17 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     }
 }
 
+/*
+ * The Xen HVM unplug protocol [1] specifies a mechanism to allow guests to
+ * request unplug of 'aux' disks (which is stated to mean all IDE disks,
+ * except the primary master).
+ *
+ * NOTE: The semantics of what happens if unplug of all disks and 'aux' disks
+ *       is simultaneously requested is not clear. The implementation assumes
+ *       that an 'all' request overrides an 'aux' request.
+ *
+ * [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/hvm-emulated-unplug.pandoc
+ */
 int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
 {
     PCIIDEState *pci_ide;
-- 
Anthony PERARD


