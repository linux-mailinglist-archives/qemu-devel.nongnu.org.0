Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E9D2F9855
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 04:41:01 +0100 (CET)
Received: from localhost ([::1]:49186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1LPY-0006OA-Lg
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 22:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=645c2efc4=dmitry.fomichev@wdc.com>)
 id 1l1LO2-0005s6-2S; Sun, 17 Jan 2021 22:39:26 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:52722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=645c2efc4=dmitry.fomichev@wdc.com>)
 id 1l1LNy-00060t-Pa; Sun, 17 Jan 2021 22:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610941162; x=1642477162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NKFAM5nvhD6WJd8Z42eetx6GEXkMzPUI9giI17H63EM=;
 b=k/QpN75/X1tqlVcgq0m1iXlbvB9pBZwb6bCpvQqlhPwLND6C8Wv8HlQi
 fNp1HhgRb+U+oaMSoH54fiUwuKQlfVNMcynGD+0/w8HcTW1j+QLQxxCqc
 XHlW27AmydGn0tltcaYuSQu/JQVUZTJ3kyY4iXb0FMue+TyZHK5vUiPBr
 Lo18RrkWhvHiysXQNt95np3UxKk+HBu1wj00usbT2k0cPPnEPwxX8MKHE
 c59SO0lEtfPUVBQ+qNrKWkp1Ngi+1QbmqAP+dzcu8DSfTyZykJshs+zjr
 y0yuqHZfLDqsX/B/NC2BIbdNVxDJLP8wACDsGr1gxsb49eAl99Tz9skIL w==;
IronPort-SDR: inD1Iozx1GKBXrAqJ4EgNG7MvXDn2KXSxbfrsDK6tUXZxlgYwu7EX/niE7dVITAOqiAynN9D5R
 YgqWHlkUmQIq5pND4O0H0wuwNdwzn0I0C4/ZPxXttNLV1sPOSPm9GBsNaoROyAJTH2Kh9KwNyZ
 98rYimIkWkjxpdHu8+O9Yxq9taFQGqmvMyOoZyjNEWHM8JWGzZdW5an8EtRmehY19Vtt74Xo6Q
 f1Wwiwy1BYBDunlVjsDfdxTkbLN6N/pjGU2JOv8vK2lsOf8aSB5SOFM0g2jU1neGI7N/3PAhrO
 2HU=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="157664409"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 11:39:19 +0800
IronPort-SDR: j5Uq2bLm0djYWnjEUmsDEirabe1nN7nfMVfaCceTtYBDsLQ1iS4haq3ILoCwYLMsvELx2iokzm
 JAwW7rpbgXb6fwz756jgFQM4zl4hhs1iZzSwj+U79ZEPyBtxYPKxo/0qwN24VT+5jrXWRxQvUW
 N06+PX7dQB/EUgQpNB7GkOu7q4yF5OI82OUQlzb1R35XLvFvfu++ilG2NHliR2Hq3Nt/G4hpXK
 blg5gsK5lww7KjT5Y6ufhIKrW7fYIozOg556GSm+tlmh76BVesExE3e8ixnYgHnkkdXGGlzIvQ
 a3vUIA5PaUMd1EEhisDPAqUS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 19:21:56 -0800
IronPort-SDR: pDh3YdO8OCzhYVLDxGFbuBktLidGO0wZku/m1ie57u/w7l25+epDxqF/L7GbuF1+o45D7SVFBr
 sNqb3gOtrXVrWnNmEU9qqTSP5frepkh1QpYLIg4P4qgWOjUAElgeWEics5JiXdvs+Jnpdpic1D
 +ULzGGPyGocprI0t7Ya49YZHfGoMPcvlvZsYPXnUS7vhiCXkNXkDMBReQDPUe1BgArp1cWBkr8
 FmxP/cBuEK6e7Z3bfIRwlxOY0GNvfaPHrKUtWH49789LwCZ9MQIoCP5tEEc778YZC+pIU0LTz6
 zME=
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Jan 2021 19:39:18 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Klaus Jensen <k.jensen@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: Correct error status for unaligned ZA
Date: Mon, 18 Jan 2021 12:39:17 +0900
Message-Id: <20210118033917.5576-1-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=645c2efc4=dmitry.fomichev@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TP 4053 says (in section 2.3.1.1) -
... if a Zone Append command specifies a ZSLBA that is not the lowest
logical block address in that zone, then the controller shall abort
that command with a status code of Invalid Field In Command.

In the code, Zone Invalid Write is returned instead, fix this.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index a8dc13553d..f64676a930 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1150,7 +1150,7 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
         if (append) {
             if (unlikely(slba != zone->d.zslba)) {
                 trace_pci_nvme_err_append_not_at_start(slba, zone->d.zslba);
-                status = NVME_ZONE_INVALID_WRITE;
+                status = NVME_INVALID_FIELD;
             }
             if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
                 trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl);
-- 
2.28.0


