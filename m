Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B45475511
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 10:23:02 +0100 (CET)
Received: from localhost ([::1]:36232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxQV3-0000ua-U5
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 04:23:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxQT8-0007Y5-Dd
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 04:21:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxQT5-0004Xr-VL
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 04:21:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639560059;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MDtlePSVIELc2dZ8hRSEKz0iZbVHeBq+jWiR9eYF/3M=;
 b=UCD9bZ3+3/h/lgL3xyDahQ0dcP/0NRzkH6LapyBH52b/V1kKFFWN6dqYa1D80JUF6A2r77
 f7OfPYlvhp9x8EUw/0pCOGy+4ZM+hO23WnEwZ4wIuaUlVU3DSvaFBOw8xJb74MPH1mMV3S
 OCxUsq+Cr8lOeOQYLkO3HnoG/zFkAhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-tgMCmdBrMZ6fPVyEMJ905w-1; Wed, 15 Dec 2021 04:20:54 -0500
X-MC-Unique: tgMCmdBrMZ6fPVyEMJ905w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93431193411A;
 Wed, 15 Dec 2021 09:20:38 +0000 (UTC)
Received: from redhat.com (unknown [10.22.8.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E93B97BB94;
 Wed, 15 Dec 2021 09:20:36 +0000 (UTC)
Date: Wed, 15 Dec 2021 09:20:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH 00/47] Patch Round-up for stable 6.1.1, freeze on
 2021-12-21
Message-ID: <YbmzXzFJlXmzgLS8@redhat.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 06:00:38PM -0600, Michael Roth wrote:
> Hi everyone,
> 
> The following new patches are queued for QEMU stable v6.1.1:
> 
>   https://gitlab.com/qemu-project/qemu/-/commits/stable-6.1-staging/

FYI, this branch doesn't appear to have been pushed.

> Patch freeze is 2021-12-21, and the release is planned for 2021-12-23:
> 
>   https://wiki.qemu.org/Planning/6.1
> 
> Please respond here or CC qemu-stable@nongnu.org on any additional patches
> you think should (or shouldn't) be included in the release.

Based on critical fixes Fedora users hit in 6.1 we pulled in
the following fixes that you've not queued yet:

  eb94846280df3f1e2a91b6179fc05f9890b7e384 qxl: fix pre-save logic

  69e3895f9d37ca39536775b13ce63e8c291427ba target/i386: add missing bits to CR4_RESERVED_MASK

  b9537d5904f6e3df896264a6144883ab07db9608 tcg/arm: Reduce vector alignment requirement for NEON

  8e751e9c38e324737fd3d3aa0562f886313bba3c tests: tcg: Fix PVH test with binutils 2.36+

> ----------------------------------------------------------------
> Ani Sinha (6):
>       bios-tables-test: allow changes in DSDT ACPI tables for q35
>       hw/i386/acpi: fix conflicting IO address range for acpi pci hotplug in q35
>       bios-tables-test: Update ACPI DSDT table golden blobs for q35
>       tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT table blob
>       tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges for q35
>       tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge test
> 
> Ari Sundholm (1):
>       block/file-posix: Fix return value translation for AIO discards
> 
> Christian Schoenebeck (1):
>       9pfs: fix crash in v9fs_walk()
> 
> Daniil Tatianin (1):
>       chardev/wctable: don't free the instance in wctablet_chr_finalize
> 
> David Hildenbrand (3):
>       virtio-balloon: don't start free page hinting if postcopy is possible
>       virtio-mem-pci: Fix memory leak when creating MEMORY_DEVICE_SIZE_CHANGE event
>       libvhost-user: fix VHOST_USER_REM_MEM_REG skipping mmap_addr
> 
> Eric Blake (1):
>       nbd/server: Don't complain on certain client disconnects
> 
> Gerd Hoffmann (1):
>       uas: add stream number sanity checks.
> 
> Greg Kurz (2):
>       rcu: Introduce force_rcu notifier
>       accel/tcg: Register a force_rcu notifier
> 
> Helge Deller (1):
>       hw/display/artist: Fix bug in coordinate extraction in artist_vram_read() and artist_vram_write()
> 
> Igor Mammedov (1):
>       pcie: rename 'native-hotplug' to 'x-native-hotplug'
> 
> Jason Wang (3):
>       virtio-net: fix use after unmap/free for sg
>       virtio: use virtio accessor to access packed descriptor flags
>       virtio: use virtio accessor to access packed event
> 
> Jean-Philippe Brucker (2):
>       hw/arm/virt: Rename default_bus_bypass_iommu
>       hw/i386: Rename default_bus_bypass_iommu
> 
> Jessica Clarke (1):
>       Partially revert "build: -no-pie is no functional linker flag"
> 
> Jon Maloy (1):
>       e1000: fix tx re-entrancy problem
> 
> Klaus Jensen (1):
>       hw/nvme: fix buffer overrun in nvme_changed_nslist (CVE-2021-3947)
> 
> Laurent Vivier (1):
>       hw: m68k: virt: Add compat machine for 6.1
> 
> Mahmoud Mandour (1):
>       plugins/execlog: removed unintended "s" at the end of log lines.
> 
> Mark Mielke (1):
>       virtio-blk: Fix clean up of host notifiers for single MR transaction.
> 
> Markus Armbruster (1):
>       hmp: Unbreak "change vnc"
> 
> Mauro Matteo Cascella (1):
>       hw/scsi/scsi-disk: MODE_PAGE_ALLS not allowed in MODE SELECT commands
> 
> Michael S. Tsirkin (1):
>       pci: fix PCI resource reserve capability on BE
> 
> Michael Tokarev (1):
>       qemu-sockets: fix unix socket path copy (again)
> 
> Nir Soffer (1):
>       qemu-nbd: Change default cache mode to writeback
> 
> Paolo Bonzini (4):
>       plugins: do not limit exported symbols if modules are active
>       block: introduce max_hw_iov for use in scsi-generic
>       target-i386: mmu: use pg_mode instead of HF_LMA_MASK
>       target-i386: mmu: fix handling of noncanonical virtual addresses
> 
> Peng Liang (1):
>       vfio: Fix memory leak of hostwin
> 
> Peter Maydell (1):
>       target/arm: Don't skip M-profile reset entirely in user mode
> 
> Philippe Mathieu-Daudé (3):
>       hw/block/fdc: Extract blk_create_empty_drive()
>       hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
>       tests/qtest/fdc-test: Add a regression test for CVE-2021-20196
> 
> Prasad J Pandit (1):
>       net: vmxnet3: validate configuration values during activate (CVE-2021-20203)
> 
> Stefano Garzarella (1):
>       vhost-vsock: fix migration issue when seqpacket is supported
> 
> Xueming Li (1):
>       vhost-user: fix duplicated notifier MR init
> 
> Yang Zhong (1):
>       i386/cpu: Remove AVX_VNNI feature from Cooperlake cpu model
> 
>  accel/tcg/tcg-accel-ops-mttcg.c           |  26 ++++++++++++++++++++
>  accel/tcg/tcg-accel-ops-rr.c              |  10 ++++++++
>  block/block-backend.c                     |   6 +++++
>  block/file-posix.c                        |   6 ++---
>  block/io.c                                |   1 +
>  chardev/wctablet.c                        |   1 -
>  configure                                 |  10 +++++---
>  contrib/plugins/execlog.c                 |   2 +-
>  docs/tools/qemu-nbd.rst                   |   6 +++--
>  hw/9pfs/coth.h                            |   4 ++-
>  hw/arm/virt.c                             |   4 +--
>  hw/block/dataplane/virtio-blk.c           |   2 +-
>  hw/block/fdc.c                            |  23 +++++++++++++++---
>  hw/core/machine.c                         |   1 +
>  hw/display/artist.c                       |   8 +++---
>  hw/i386/pc.c                              |   2 +-
>  hw/i386/pc_q35.c                          |   2 +-
>  hw/m68k/virt.c                            |   9 ++++++-
>  hw/net/e1000.c                            |   7 ++++++
>  hw/net/virtio-net.c                       |  39 ++++++++++++++++++++++++------
>  hw/net/vmxnet3.c                          |  13 ++++++++++
>  hw/nvme/ctrl.c                            |   5 ++++
>  hw/pci/pci_bridge.c                       |  10 ++++----
>  hw/pci/pcie_port.c                        |   2 +-
>  hw/scsi/scsi-disk.c                       |   6 +++++
>  hw/scsi/scsi-generic.c                    |   2 +-
>  hw/usb/dev-uas.c                          |  11 +++++++++
>  hw/vfio/common.c                          |   8 ++++++
>  hw/virtio/vhost-user.c                    |   5 ++--
>  hw/virtio/vhost-vsock.c                   |  19 ++++++++++++---
>  hw/virtio/virtio-balloon.c                |  13 ++++++++++
>  hw/virtio/virtio-mem-pci.c                |   7 +-----
>  hw/virtio/virtio.c                        |  24 ++++++------------
>  include/block/block_int.h                 |   7 ++++++
>  include/hw/acpi/ich9.h                    |   2 +-
>  include/hw/virtio/vhost-vsock.h           |   3 +++
>  include/qemu/rcu.h                        |  15 ++++++++++++
>  include/sysemu/block-backend.h            |   1 +
>  monitor/hmp-cmds.c                        |   2 +-
>  nbd/server.c                              |   3 +++
>  plugins/meson.build                       |  14 ++++++-----
>  qemu-nbd.c                                |   6 +++--
>  subprojects/libvhost-user/libvhost-user.c |   1 +
>  target/arm/cpu.c                          |  19 +++++++++++++++
>  target/i386/cpu.c                         |   2 +-
>  target/i386/tcg/sysemu/excp_helper.c      |  25 ++++++++++---------
>  tests/data/acpi/q35/DSDT                  | Bin 8289 -> 8289 bytes
>  tests/data/acpi/q35/DSDT.acpihmat         | Bin 9614 -> 9614 bytes
>  tests/data/acpi/q35/DSDT.bridge           | Bin 11003 -> 11003 bytes
>  tests/data/acpi/q35/DSDT.cphp             | Bin 8753 -> 8753 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm          | Bin 9943 -> 9943 bytes
>  tests/data/acpi/q35/DSDT.ipmibt           | Bin 8364 -> 8364 bytes
>  tests/data/acpi/q35/DSDT.memhp            | Bin 9648 -> 9648 bytes
>  tests/data/acpi/q35/DSDT.mmio64           | Bin 9419 -> 9419 bytes
>  tests/data/acpi/q35/DSDT.multi-bridge     | Bin 0 -> 8583 bytes
>  tests/data/acpi/q35/DSDT.nohpet           | Bin 8147 -> 8147 bytes
>  tests/data/acpi/q35/DSDT.numamem          | Bin 8295 -> 8295 bytes
>  tests/data/acpi/q35/DSDT.tis              | Bin 8894 -> 8894 bytes
>  tests/qtest/bios-tables-test.c            |  18 ++++++++++++++
>  tests/qtest/fdc-test.c                    |  38 +++++++++++++++++++++++++++++
>  util/qemu-sockets.c                       |  13 ++++------
>  util/rcu.c                                |  19 +++++++++++++++
>  62 files changed, 386 insertions(+), 96 deletions(-)
>  create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
> 
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


