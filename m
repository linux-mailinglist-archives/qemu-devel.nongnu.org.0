Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCE2310289
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 03:06:11 +0100 (CET)
Received: from localhost ([::1]:41770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7qVe-0007U8-4i
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 21:06:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1l7qN8-0004Sm-Mu
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 20:57:22 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1l7qN2-0006wf-EW
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 20:57:22 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DWz5l5zb3zjHrM;
 Fri,  5 Feb 2021 09:55:39 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Feb 2021
 09:56:53 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <imammedo@redhat.com>
Subject: [PATCH 0/3] acpi: Add _CCA support for pxb devices
Date: Fri, 5 Feb 2021 01:56:42 +0000
Message-ID: <1612490205-48788-1-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangxingang5@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 04 Feb 2021 21:04:20 -0500
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

This patch series add fix for pxb support dma
1. Add _CCA attribute for pxb DSDT, because cache coherency attribute is
needed when check dma support for pxb device.
2. Update DSDT.pxb file

Xingang Wang (3):
  acpi: Allow pxb DSDT acpi table changes
  acpi/gpex: Fix cca attribute check for pxb device
  acpi: Update _CCA attribute in DSDT.pxb

 hw/pci-host/gpex-acpi.c       |   1 +
 tests/data/acpi/virt/DSDT.pxb | Bin 7689 -> 7695 bytes
 2 files changed, 1 insertion(+)

-- 
2.19.1


