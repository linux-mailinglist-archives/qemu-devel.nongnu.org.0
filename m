Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3352C802A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 09:39:44 +0100 (CET)
Received: from localhost ([::1]:59208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjeil-00057c-6S
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 03:39:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kjegX-0002yO-KP; Mon, 30 Nov 2020 03:37:25 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kjegU-0000Ot-8Q; Mon, 30 Nov 2020 03:37:25 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Ckz9P6QbxzkjNt;
 Mon, 30 Nov 2020 16:36:41 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Nov 2020
 16:37:03 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 00/12] Categorize some uncategorized devices
Date: Mon, 30 Nov 2020 16:36:18 +0800
Message-ID: <20201130083630.2520597-1-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=ganqixin@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: kuhn.chenqun@huawei.com, thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 Gan Qixin <ganqixin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1->v2:

-Patch2: Add Pankaj Gupta reviewed tag.
-Patch3: Add Philippe Mathieu-Daudé reviewed tag.
-Patch9:
    Changes suggested by Gerd Hoffmann:
    Put u2f-passthru into 'misc' category.
-Patch12: 
    Add Alistair Francis and Philippe Mathieu-Daudé reviewed tag.
-Patch13:
    bcm2835_cprman is not an usable device, so delete the patch that categorize
it.

Gan Qixin (12):
  pc-dimm: put it into the 'storage' category
  virtio-pmem: put it into the 'storage' category
  vmmouse: put it into the 'input' category
  nvdimm: put it into the 'storage' category
  mc146818rtc: put it into the 'misc' category
  ipmi: put some ipmi devices into the correct category
  tpm: put some tpm devices into the correct category
  AMDVI-PCI: put it into the 'misc' category
  u2f-passthru: put it into the 'misc' category
  tosa-ssp: put it into the 'misc' category
  spitz: put some Spitz-family devices into the correct category
  SPI flash devices: put them into the 'storage' category

 hw/arm/spitz.c            | 2 ++
 hw/arm/tosa.c             | 2 ++
 hw/block/m25p80.c         | 1 +
 hw/i386/amd_iommu.c       | 8 ++++++++
 hw/i386/vmmouse.c         | 1 +
 hw/ipmi/ipmi_bmc_extern.c | 1 +
 hw/ipmi/ipmi_bmc_sim.c    | 1 +
 hw/ipmi/isa_ipmi_bt.c     | 1 +
 hw/ipmi/isa_ipmi_kcs.c    | 1 +
 hw/ipmi/pci_ipmi_bt.c     | 1 +
 hw/ipmi/pci_ipmi_kcs.c    | 1 +
 hw/mem/nvdimm.c           | 1 +
 hw/mem/pc-dimm.c          | 1 +
 hw/rtc/mc146818rtc.c      | 1 +
 hw/tpm/tpm_tis_isa.c      | 1 +
 hw/tpm/tpm_tis_sysbus.c   | 1 +
 hw/usb/u2f-passthru.c     | 1 +
 hw/virtio/virtio-pmem.c   | 1 +
 18 files changed, 27 insertions(+)

-- 
2.23.0


