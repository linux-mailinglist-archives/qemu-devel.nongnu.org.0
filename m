Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BDB2681AC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 00:22:31 +0200 (CEST)
Received: from localhost ([::1]:43068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHaOE-0003Ig-P2
	for lists+qemu-devel@lfdr.de; Sun, 13 Sep 2020 18:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=518fa018e=dmitry.fomichev@wdc.com>)
 id 1kHaHZ-0000xT-OM; Sun, 13 Sep 2020 18:15:38 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:42054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=518fa018e=dmitry.fomichev@wdc.com>)
 id 1kHaHX-0001Hh-1X; Sun, 13 Sep 2020 18:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600035334; x=1631571334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4lmXrVv8vWfsQpV3JfcR+Z7HzkK2EhDx634mziV0q6w=;
 b=jFo9xaPhVlEgTahUeuVUXz7BAJKgGYCNSY2GoCKjgT0nd7fY/imuROlw
 LP0X/ZgQKCzMVVM2r8b1wmi/D2dxJ1jdF5uC5BiSUCaTnlxItmzGkQwDm
 x+Sgt1hv2lfvR5xYOTedmSGN/n9mHI7F9d5F3LWRrcITHRt2OlFBu61V6
 mgBbGsRn+TI0mCNKrRciVL1UFe+y90OUMnT0AmI2kI1KWezQdeREqv8By
 LAY37LZcJ9/MMoqlBug64m//7yDxLjGFBb9plfOew0UPgo9sX8U0oM4QB
 tWOS7zSgZ6Xx23X4LUh9H8HpkTy6R+RYQqAK+XQ1mNzAywnSL4OisF2UH Q==;
IronPort-SDR: mosYTyKC4m213p3djkBhTOmduJdD2i1WLLdh1vk4bBbS9rkIYz6gs2DHIl/87sOnTtibMTJtLb
 2rJ300GnDcQOJV0K51o/aVt0z5aJZ1hz6tTG+bYIqs4PWjYY5PBBvdZgM2CH+9Oj02j9MjIrNB
 PfAJ9yWkTb4DiO2gAINUq0hKAUUZULbhthlxiHxREav/B4QayryLgqjzAyLqmJuaY6rkbJVBSi
 2uZs27qvhGdDeyLlZt1bqvehkPYOu8fUA5aCmEPxc7zM5dPJbDQ3TMmxxB2FTN001hJoL4XAn7
 xqI=
X-IronPort-AV: E=Sophos;i="5.76,423,1592841600"; d="scan'208";a="147179075"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Sep 2020 06:15:16 +0800
IronPort-SDR: in056m9MESwZV+xb/CFiaA6dixclYuByFAxUX9/YwVZCVzZEghNwshaUkhmLgZCwxIyttN7jj9
 IKC7t9GowSaQ==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 15:02:29 -0700
IronPort-SDR: ljl7OXn+eZkvSrytXPmTTxbT5vKLbHhFQxXY+8vz8HLoFoLySyme5lI5+OmMpsWX8Are2mxJ+S
 6hoEakhdUO+Q==
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Sep 2020 15:15:15 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v3 15/15] hw/block/nvme: Document zoned parameters in usage
 text
Date: Mon, 14 Sep 2020 07:14:36 +0900
Message-Id: <20200913221436.22844-16-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200913221436.22844-1-dmitry.fomichev@wdc.com>
References: <20200913221436.22844-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=518fa018e=dmitry.fomichev@wdc.com; helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/13 18:14:44
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added brief descriptions of the new device properties that are
now available to users to configure features of Zoned Namespace
Command Set in the emulator.

This patch is for documentation only, no functionality change.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme.c | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 41f4c0dacd..d0900c2871 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -9,7 +9,7 @@
  */
 
 /**
- * Reference Specs: http://www.nvmexpress.org, 1.2, 1.1, 1.0e
+ * Reference Specs: http://www.nvmexpress.org, 1.4, 1.3, 1.2, 1.1, 1.0e
  *
  *  https://nvmexpress.org/developers/nvme-specification/
  */
@@ -22,7 +22,7 @@
  *              [pmrdev=<mem_backend_file_id>,] \
  *              max_ioqpairs=<N[optional]>, \
  *              aerl=<N[optional]>, aer_max_queued=<N[optional]>, \
- *              mdts=<N[optional]>
+ *              mdts=<N[optional]>, zoned=<true|false[optional]>
  *
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
  * offset 0 in BAR2 and supports only WDS, RDS and SQS for now.
@@ -48,6 +48,45 @@
  *   completion when there are no oustanding AERs. When the maximum number of
  *   enqueued events are reached, subsequent events will be dropped.
  *
+ * Setting `zoned` to true makes the device to support zoned namespaces.
+ * In this case, of the following options are available to configure zoned
+ * operation:
+ *     zone_size=<zone size in MiB, default: 128MiB>
+ *
+ *     zone_capacity=<zone capacity in MiB, default: zone_size>
+ *         The value 0 (default) forces zone capacity to be the same as zone
+ *         size. The value of this property may not exceed zone size.
+ *
+ *     zone_file=<zone metadata file name, default: none>
+ *         Zone metadata file, if specified, allows zone information
+ *         to be persistent across shutdowns and restarts.
+ *
+ *     zone_descr_ext_size=<zone descriptor extension size, default 0>
+ *         This value needs to be specified in 64B units. If it is zero,
+ *         namespace(s) will not support zone descriptor extensions.
+ *
+ *     max_active=<Maximum Active Resources (zones), default: 0 - no limit>
+ *
+ *     max_open=<Maximum Open Resources (zones), default: 0 - no limit>
+ *
+ *     zone_append_size_limit=<zone append size limit, in KiB, default: MDTS>
+ *         The maximum I/O size that can be supported by Zone Append
+ *         command. Since internally this this value is maintained as
+ *         ZASL = log2(<maximum append size> / <page size>), some
+ *         values assigned to this property may be rounded down and
+ *         result in a lower maximum ZA data size being in effect.
+ *         If MDTS property is not assigned, the default value of 128KiB is
+ *         used as ZASL.
+ *
+ *     offline_zones=<the number of offline zones to inject, default: 0>
+ *
+ *     rdonly_zones=<the number of read-only zones to inject, default: 0>
+ *
+ *     cross_zone_read=<enables Read Across Zone Boundaries, default: true>
+ *
+ *     fill_pattern=<data fill pattern, default: 0x00>
+ *         The byte pattern to return for any portions of unwritten data
+ *         during read.
  */
 
 #include "qemu/osdep.h"
-- 
2.21.0


