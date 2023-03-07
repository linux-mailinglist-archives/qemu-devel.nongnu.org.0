Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EB86AD7FA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:10:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRRB-0007Uc-Tk; Tue, 07 Mar 2023 02:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRR6-0007UP-7l
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:08:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRR4-0005Hf-5P
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678172913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VyrL0rARfXF42lkdqUJPDk3D8DkKsmjHEZQVr+GxgwU=;
 b=Psmh9f+o+2iB0x7PKM/m7xhD0b+sQ1QGY8VtUXquPWyR/BWaAt0vGkvbFP4kGV7p27scWK
 MMFXemTA6mwB73px3IA7c3PpDX9myRzG3DODrz3x02d6LQF0mZOWijPKx50IAOxKHnDKc/
 FIOjvmUwbzY2g0phDUaJm+jFOYWC+Y8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-vfugHPeEOJKZupZ2S6wSLg-1; Tue, 07 Mar 2023 02:08:31 -0500
X-MC-Unique: vfugHPeEOJKZupZ2S6wSLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38A45101A521;
 Tue,  7 Mar 2023 07:08:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EA8940C10FA;
 Tue,  7 Mar 2023 07:08:29 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Jason Wang <jasowang@redhat.com>
Subject: [PULL 00/51] Net patches
Date: Tue,  7 Mar 2023 15:07:25 +0800
Message-Id: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 817fd33836e73812df2f1907612b57750fcb9491:

  Merge tag 'audio-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2023-03-06 14:06:06 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to c19b566a3898510ec2b3e881b3fb78614b240414:

  hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by EEPRO100() (2023-03-07 14:55:39 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Akihiko Odaki (43):
      e1000e: Fix the code style
      hw/net: Add more MII definitions
      fsl_etsec: Use hw/net/mii.h
      e1000: Use hw/net/mii.h
      e1000: Mask registers when writing
      e1000e: Introduce E1000E_LOW_BITS_SET_FUNC
      e1000e: Mask registers when writing
      e1000: Use more constant definitions
      e1000e: Use more constant definitions
      e1000: Use memcpy to intialize registers
      e1000e: Use memcpy to intialize registers
      e1000e: Remove pending interrupt flags
      e1000e: Improve software reset
      e1000: Configure ResettableClass
      e1000e: Configure ResettableClass
      e1000e: Introduce e1000_rx_desc_union
      e1000e: Set MII_ANER_NWAY
      e1000e: Remove extra pointer indirection
      net: Check L4 header size
      e1000x: Alter the signature of e1000x_is_vlan_packet
      net: Strip virtio-net header when dumping
      hw/net/net_tx_pkt: Automatically determine if virtio-net header is used
      hw/net/net_rx_pkt: Remove net_rx_pkt_has_virt_hdr
      e1000e: Perform software segmentation for loopback
      hw/net/net_tx_pkt: Implement TCP segmentation
      hw/net/net_tx_pkt: Check the payload length
      e1000e: Do not assert when MSI-X is disabled later
      MAINTAINERS: Add Akihiko Odaki as a e1000e reviewer
      MAINTAINERS: Add e1000e test files
      e1000e: Combine rx traces
      e1000: Count CRC in Tx statistics
      e1000e: Count CRC in Tx statistics
      net/eth: Report if headers are actually present
      e1000e: Implement system clock
      net/eth: Introduce EthL4HdrProto
      pcie: Introduce pcie_sriov_num_vfs
      e1000: Split header files
      Intrdocue igb device emulation
      tests/qtest/e1000e-test: Fabricate ethernet header
      tests/qtest/libqos/e1000e: Export macreg functions
      igb: Introduce qtest for igb device
      tests/avocado: Add igb test
      docs/system/devices/igb: Add igb documentation

Philippe Mathieu-Daudé (7):
      hw/net/eepro100: Abort if pci_add_capability() ever fail
      hw/net/eepro100: Introduce TYPE_EEPRO100 QOM abstract parent
      hw/net/eepro100: Convert reset handler to DeviceReset
      hw/net/eepro100: Pass E100PCIDeviceInfo as class init data
      hw/net/eepro100: Remove instance EEPRO100State::has_extended_tcb_support
      hw/net/eepro100: Remove instance's EEPRO100State::device
      hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by EEPRO100()

Shreesh Adiga (1):
      ebpf: fix compatibility with libbpf 1.0+

 MAINTAINERS                                        |   13 +
 docs/system/device-emulation.rst                   |    1 +
 docs/system/devices/igb.rst                        |   71 +
 ebpf/rss.bpf.skeleton.h                            | 1171 ++++--
 hw/core/machine.c                                  |    1 +
 hw/net/Kconfig                                     |    5 +
 hw/net/e1000.c                                     |  259 +-
 hw/net/e1000_common.h                              |  102 +
 hw/net/e1000_regs.h                                |  958 +----
 hw/net/e1000e.c                                    |  102 +-
 hw/net/e1000e_core.c                               |  719 ++--
 hw/net/e1000e_core.h                               |   70 +-
 hw/net/e1000x_common.c                             |   38 +-
 hw/net/e1000x_common.h                             |  133 +-
 hw/net/e1000x_regs.h                               |  967 +++++
 hw/net/eepro100.c                                  |  149 +-
 hw/net/fsl_etsec/etsec.c                           |   11 +-
 hw/net/fsl_etsec/etsec.h                           |   17 -
 hw/net/fsl_etsec/miim.c                            |    5 +-
 hw/net/igb.c                                       |  615 +++
 hw/net/igb_common.h                                |  146 +
 hw/net/igb_core.c                                  | 4077 ++++++++++++++++++++
 hw/net/igb_core.h                                  |  146 +
 hw/net/igb_regs.h                                  |  648 ++++
 hw/net/igbvf.c                                     |  327 ++
 hw/net/meson.build                                 |    2 +
 hw/net/net_rx_pkt.c                                |  102 +-
 hw/net/net_rx_pkt.h                                |   31 +-
 hw/net/net_tx_pkt.c                                |  332 +-
 hw/net/net_tx_pkt.h                                |   27 +-
 hw/net/trace-events                                |   50 +-
 hw/net/virtio-net.c                                |   85 +-
 hw/net/vmxnet3.c                                   |   58 +-
 hw/pci/pcie_sriov.c                                |    5 +
 include/hw/net/mii.h                               |   14 +-
 include/hw/pci/pcie_sriov.h                        |    3 +
 include/net/eth.h                                  |   15 +-
 include/net/net.h                                  |    6 +
 net/dump.c                                         |   11 +-
 net/eth.c                                          |  118 +-
 net/net.c                                          |   18 +
 net/tap.c                                          |   16 +
 scripts/ci/org.centos/stream/8/x86_64/test-avocado |    1 +
 tests/avocado/igb.py                               |   38 +
 tests/qtest/e1000e-test.c                          |   25 +-
 tests/qtest/fuzz/generic_fuzz_configs.h            |    5 +
 tests/qtest/igb-test.c                             |  243 ++
 tests/qtest/libqos/e1000e.c                        |   12 -
 tests/qtest/libqos/e1000e.h                        |   14 +
 tests/qtest/libqos/igb.c                           |  185 +
 tests/qtest/libqos/meson.build                     |    1 +
 tests/qtest/meson.build                            |    1 +
 tools/ebpf/Makefile.ebpf                           |    8 +-
 tools/ebpf/rss.bpf.c                               |   43 +-
 54 files changed, 9829 insertions(+), 2391 deletions(-)
 create mode 100644 docs/system/devices/igb.rst
 create mode 100644 hw/net/e1000_common.h
 create mode 100644 hw/net/e1000x_regs.h
 create mode 100644 hw/net/igb.c
 create mode 100644 hw/net/igb_common.h
 create mode 100644 hw/net/igb_core.c
 create mode 100644 hw/net/igb_core.h
 create mode 100644 hw/net/igb_regs.h
 create mode 100644 hw/net/igbvf.c
 create mode 100644 tests/avocado/igb.py
 create mode 100644 tests/qtest/igb-test.c
 create mode 100644 tests/qtest/libqos/igb.c



