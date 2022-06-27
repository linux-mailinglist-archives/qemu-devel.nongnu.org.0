Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D883255B98F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 14:42:43 +0200 (CEST)
Received: from localhost ([::1]:58968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5o4g-00041R-Bv
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 08:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=170689b83=niklas.cassel@wdc.com>)
 id 1o5o2D-0002M6-IJ; Mon, 27 Jun 2022 08:40:09 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:24027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=170689b83=niklas.cassel@wdc.com>)
 id 1o5o29-0006qD-7M; Mon, 27 Jun 2022 08:40:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656333603; x=1687869603;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fn1KlF13qDfgLw1e0loGuTFjcLj/mUt4TmviWRUZlag=;
 b=iS7AcC1w/xzbAxFl7YPE27ZUm9dNglM77tNqLpN1VLuNM0DyrcbSjJds
 oZfZ5R8RwpGXSLjTJ3z/l8rtPTDNUT4wMKGHoskME6824kq7RJeyG8JbT
 yYRIMlupJYaVieHUnX5uNCfMIenJHtlZHYE20uPSDdFzr48GYDxk3LR2O
 6QPO2NaD+np3lOP/HPP9jlxY4OC53Emdo7q+pCcMb/HF8nn7hKRYpKWu/
 jrbSLXk1IUvRIaNFl4vBVwxHaDWdrm8NVC9F/2z+F/wOh1gpyuTKM9w4i
 Nhp6MDCxJZDYG7NyV8+s9d7f3ICCe/qL+WnTLOsJxNd4EttIXcmjgZy5o g==;
X-IronPort-AV: E=Sophos;i="5.92,226,1650902400"; d="scan'208";a="204193747"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jun 2022 20:39:59 +0800
IronPort-SDR: Y0nzwQ1cUECkhOCOMaosl3C9H6N6snzoxAzVShSS2WZnqjl8VheA9pjGpBVLNHT6WBi/nPQ94j
 I0Tnon0UFkicA7U9Dk7EL8nhR46Z6HrEHRvBqgPJbnvN+s5JXyTxG2qgGdmQqjV7GuyoJRKNQR
 kHXTRu7mMCiDBHwGSZGcBs63GBDJy9zYCtuStHeiYlnZCOkdLU0Qt213QcNkJx5kDv9ujrhily
 TvcVDX2uBn5r4RcgadnzTVMbWcfEru49Fng7OK55sgiDaN+tTD2l3lirkyVGnQn3X4peVGLMre
 zQdS/Ib8QnjFYyMn78m9IWfX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jun 2022 04:57:42 -0700
IronPort-SDR: yD5P3uZOJsmzlZ7z1pV70/aqhLeV/UXiSNkfw053GtaP/w1YukFlQwFe7sirdlPvZz8VY4cjlI
 EmnWsYt8bxBFfj+tFGw1AOA2kQ3D6Ht1Bn8NS91dZmfNIK3PA86ZBw8JmfRd6Lga9mKbMaBSRl
 9smNGFzMg57LnluCDtffhRPHxIi6L2dHFhjgwkqR3rMHFr/AyaIWw5YqzUGuKcTLx4GuVk/R9C
 hzc/4a3TKKzyzv+SM15riX9V7toj33VxVPp9Pg3VVA86OdAkpKDGIalC9Horr2o1cK8OxHGz3X
 t2w=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.108])
 by uls-op-cesaip01.wdc.com with ESMTP; 27 Jun 2022 05:40:00 -0700
To: kbusch@kernel.org,
	its@irrelevant.dk
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH] hw/nvme: fix example serial in documentation
Date: Mon, 27 Jun 2022 14:39:57 +0200
Message-Id: <20220627123957.363889-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=170689b83=niklas.cassel@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-to:  Niklas Cassel <niklas.cassel@wdc.com>
From:  Niklas Cassel via <qemu-devel@nongnu.org>

The serial prop on the controller is actually describing the nvme
subsystem serial, which has to be identical for all controllers within
the same nvme subsystem.

This is enforced since commit a859eb9f8f64 ("hw/nvme: enforce common
serial per subsystem").

Fix the documentation, so that people copying the qemu command line
example won't get an error on qemu start.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 docs/system/devices/nvme.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
index aba253304e..30f841ef62 100644
--- a/docs/system/devices/nvme.rst
+++ b/docs/system/devices/nvme.rst
@@ -104,8 +104,8 @@ multipath I/O.
 .. code-block:: console
 
    -device nvme-subsys,id=nvme-subsys-0,nqn=subsys0
-   -device nvme,serial=a,subsys=nvme-subsys-0
-   -device nvme,serial=b,subsys=nvme-subsys-0
+   -device nvme,serial=deadbeef,subsys=nvme-subsys-0
+   -device nvme,serial=deadbeef,subsys=nvme-subsys-0
 
 This will create an NVM subsystem with two controllers. Having controllers
 linked to an ``nvme-subsys`` device allows additional ``nvme-ns`` parameters:
-- 
2.36.1


