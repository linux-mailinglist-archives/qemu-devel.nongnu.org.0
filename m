Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23982B3FA9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 10:25:35 +0100 (CET)
Received: from localhost ([::1]:34516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kealS-0000OX-R9
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 04:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1keaif-0006j2-9r; Mon, 16 Nov 2020 04:22:41 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1keaiZ-00047W-3o; Mon, 16 Nov 2020 04:22:40 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CZNrR0sM5z15M6Q;
 Mon, 16 Nov 2020 17:22:15 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Nov 2020
 17:22:20 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 00/13] Categorize some uncategorized devices
Date: Mon, 16 Nov 2020 02:48:50 +0800
Message-ID: <20201115184903.1292715-1-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=ganqixin@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:22:28
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi all,

By running "qemu-system-x86_64 -device help" and "qemu-system-arm -M none
-device help", I found many uncategorized devices. Therefore, I categorized them.

Thanks,
Gan Qixin

Gan Qixin (13):
  pc-dimm: put it into the 'storage' category
  virtio-pmem: put it into the 'storage' category
  vmmouse: put it into the 'input' category
  nvdimm: put it into the 'storage' category
  mc146818rtc: put it into the 'misc' category
  ipmi: put some ipmi devices into the correct category
  tpm: put some tpm devices into the correct category
  AMDVI-PCI: put it into the 'misc' category
  u2f-passthru: put it into the 'usb' category
  tosa-ssp: put it into the 'misc' category
  spitz: put some Spitz-family devices into the correct category
  SPI flash devices: put them into the 'storage' category
  bcm2835_cprman: put some peripherals of bcm2835 cprman into the 'misc'
    category

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
 hw/misc/bcm2835_cprman.c  | 4 ++++
 hw/rtc/mc146818rtc.c      | 1 +
 hw/tpm/tpm_tis_isa.c      | 1 +
 hw/tpm/tpm_tis_sysbus.c   | 1 +
 hw/usb/u2f-passthru.c     | 1 +
 hw/virtio/virtio-pmem.c   | 1 +
 19 files changed, 31 insertions(+)

-- 
2.23.0


