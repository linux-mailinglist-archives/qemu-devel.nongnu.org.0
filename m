Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0962E2207
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 22:29:06 +0100 (CET)
Received: from localhost ([::1]:59508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksBgv-0003Wd-7N
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 16:29:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBfc-000244-F0
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:27:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBfa-0004M0-07
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608758860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ex4+Kx9lo2yDl1wRvanh4ky/j3AmwT0o4hy43LL0SMQ=;
 b=RvdSO4HNF7zIoGrH6CVpAKLa0eQA6230aOVTFkDFDReHFUFR3b0SqgqCxfPCrBGAItqAx1
 wyafJAPFSiEwiMYWWWPpITPOjSLVxVYc2o9NJRV10WpemQsiTlPfqMtN24jD/FG1qefdWT
 wEwpfhLXDuq9YhLHptOIQyoaI4Hk9Ls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-_NVzgwNxMN6cGsV7aK1Skg-1; Wed, 23 Dec 2020 16:27:38 -0500
X-MC-Unique: _NVzgwNxMN6cGsV7aK1Skg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C77C10054FF;
 Wed, 23 Dec 2020 21:27:37 +0000 (UTC)
Received: from localhost (ovpn-113-96.rdu2.redhat.com [10.10.113.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12ED210013C1;
 Wed, 23 Dec 2020 21:27:36 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/15] Machine queue, 2020-12-23
Date: Wed, 23 Dec 2020 16:27:20 -0500
Message-Id: <20201223212735.512062-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a05f8ecd88f15273d033b6f044b850a8af84a5b8=
:=0D
=0D
  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-2=
0201217-1' into staging (2020-12-18 11:12:35 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request=0D
=0D
for you to fetch changes up to bdd5ce050d086e9f63874f1f36e9e39fa27a976c:=0D
=0D
  bugfix: hostmem: Free host_nodes list right after visited (2020-12-18 15:=
20:23 -0500)=0D
=0D
----------------------------------------------------------------=0D
Machine queue, 2020-12-23=0D
=0D
Cleanup:=0D
* qdev code cleanup (Eduardo Habkost)=0D
=0D
Bug fix:=0D
* hostmem: Free host_nodes list right after visited (Keqian Zhu)=0D
=0D
----------------------------------------------------------------=0D
=0D
Eduardo Habkost (14):=0D
  qdev: Move softmmu properties to qdev-properties-system.h=0D
  qdev: Reuse DEFINE_PROP in all DEFINE_PROP_* macros=0D
  sparc: Use DEFINE_PROP for nwindows property=0D
  qdev: Get just property name at error_set_from_qdev_prop_error()=0D
  qdev: Avoid using prop->name unnecessarily=0D
  qdev: Add name parameter to qdev_class_add_property()=0D
  qdev: Add name argument to PropertyInfo.create method=0D
  qdev: Wrap getters and setters in separate helpers=0D
  qdev: Move dev->realized check to qdev_property_set()=0D
  qdev: Make PropertyInfo.create return ObjectProperty*=0D
  qdev: Make qdev_class_add_property() more flexible=0D
  qdev: Move qdev_prop_tpm declaration to tpm_prop.h=0D
  qdev: Rename qdev_get_prop_ptr() to object_field_prop_ptr()=0D
  qdev: Avoid unnecessary DeviceState* variable at set_prop_arraylen()=0D
=0D
Keqian Zhu (1):=0D
  bugfix: hostmem: Free host_nodes list right after visited=0D
=0D
 hw/core/qdev-properties-system.c    | 147 +++++-----------=0D
 hw/core/qdev-properties.c           | 253 ++++++++++++----------------=0D
 audio/audio.h                       |   1 +=0D
 hw/tpm/tpm_prop.h                   |   2 +=0D
 include/hw/block/block.h            |   1 +=0D
 include/hw/qdev-properties-system.h |  77 +++++++++=0D
 include/hw/qdev-properties.h        | 197 +++++-----------------=0D
 include/net/net.h                   |   1 +=0D
 backends/hostmem.c                  |   1 +=0D
 backends/tpm/tpm_util.c             |  14 +-=0D
 hw/acpi/vmgenid.c                   |   1 +=0D
 hw/arm/pxa2xx.c                     |   1 +=0D
 hw/arm/strongarm.c                  |   1 +=0D
 hw/block/fdc.c                      |   1 +=0D
 hw/block/m25p80.c                   |   1 +=0D
 hw/block/nand.c                     |   1 +=0D
 hw/block/onenand.c                  |   1 +=0D
 hw/block/pflash_cfi01.c             |   1 +=0D
 hw/block/pflash_cfi02.c             |   1 +=0D
 hw/block/vhost-user-blk.c           |   1 +=0D
 hw/block/xen-block.c                |  10 +-=0D
 hw/char/avr_usart.c                 |   1 +=0D
 hw/char/bcm2835_aux.c               |   1 +=0D
 hw/char/cadence_uart.c              |   1 +=0D
 hw/char/cmsdk-apb-uart.c            |   1 +=0D
 hw/char/debugcon.c                  |   1 +=0D
 hw/char/digic-uart.c                |   1 +=0D
 hw/char/escc.c                      |   1 +=0D
 hw/char/etraxfs_ser.c               |   1 +=0D
 hw/char/exynos4210_uart.c           |   1 +=0D
 hw/char/grlib_apbuart.c             |   1 +=0D
 hw/char/ibex_uart.c                 |   1 +=0D
 hw/char/imx_serial.c                |   1 +=0D
 hw/char/ipoctal232.c                |   1 +=0D
 hw/char/lm32_juart.c                |   1 +=0D
 hw/char/lm32_uart.c                 |   1 +=0D
 hw/char/mcf_uart.c                  |   1 +=0D
 hw/char/milkymist-uart.c            |   1 +=0D
 hw/char/nrf51_uart.c                |   1 +=0D
 hw/char/parallel.c                  |   1 +=0D
 hw/char/pl011.c                     |   1 +=0D
 hw/char/renesas_sci.c               |   1 +=0D
 hw/char/sclpconsole-lm.c            |   1 +=0D
 hw/char/sclpconsole.c               |   1 +=0D
 hw/char/serial-pci-multi.c          |   1 +=0D
 hw/char/serial.c                    |   1 +=0D
 hw/char/spapr_vty.c                 |   1 +=0D
 hw/char/stm32f2xx_usart.c           |   1 +=0D
 hw/char/terminal3270.c              |   1 +=0D
 hw/char/virtio-console.c            |   1 +=0D
 hw/char/xilinx_uartlite.c           |   1 +=0D
 hw/hyperv/vmbus.c                   |   1 +=0D
 hw/i386/kvm/i8254.c                 |   1 +=0D
 hw/ide/qdev.c                       |   1 +=0D
 hw/ipmi/ipmi_bmc_extern.c           |   1 +=0D
 hw/ipmi/ipmi_bmc_sim.c              |   1 +=0D
 hw/misc/allwinner-sid.c             |   1 +=0D
 hw/misc/ivshmem.c                   |   1 +=0D
 hw/misc/mac_via.c                   |   1 +=0D
 hw/misc/sifive_u_otp.c              |   1 +=0D
 hw/net/rocker/rocker.c              |   1 +=0D
 hw/nvram/eeprom_at24c.c             |   1 +=0D
 hw/nvram/spapr_nvram.c              |   1 +=0D
 hw/pci-bridge/gen_pcie_root_port.c  |   1 +=0D
 hw/pci/pci.c                        |   1 +=0D
 hw/ppc/pnv_pnor.c                   |   1 +=0D
 hw/rdma/vmw/pvrdma_main.c           |   1 +=0D
 hw/rtc/mc146818rtc.c                |   1 +=0D
 hw/s390x/css.c                      |  12 +-=0D
 hw/s390x/s390-pci-bus.c             |  10 +-=0D
 hw/scsi/scsi-disk.c                 |   1 +=0D
 hw/scsi/scsi-generic.c              |   1 +=0D
 hw/scsi/vhost-user-scsi.c           |   1 +=0D
 hw/sd/sd.c                          |   1 +=0D
 hw/usb/ccid-card-passthru.c         |   1 +=0D
 hw/usb/dev-serial.c                 |   1 +=0D
 hw/usb/redirect.c                   |   1 +=0D
 hw/vfio/pci-quirks.c                |  10 +-=0D
 hw/vfio/pci.c                       |   1 +=0D
 hw/virtio/vhost-user-fs.c           |   1 +=0D
 hw/virtio/vhost-user-vsock.c        |   1 +=0D
 hw/virtio/virtio-iommu-pci.c        |   1 +=0D
 hw/xen/xen_pt.c                     |   1 +=0D
 migration/migration.c               |   1 +=0D
 target/sparc/cpu.c                  |   9 +-=0D
 85 files changed, 363 insertions(+), 452 deletions(-)=0D
 create mode 100644 include/hw/qdev-properties-system.h=0D
=0D
--=20=0D
2.28.0=0D
=0D


