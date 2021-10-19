Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B98433A66
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:30:05 +0200 (CEST)
Received: from localhost ([::1]:34872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcr40-0004Xl-Bw
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mcqLU-0003hG-Cz
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:44:04 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:41658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mcqLR-00038A-6d
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:44:04 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so73222pjb.0
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 07:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=8HdumYIHaqc+DSe67GI6ecQExuBLjgUjFbvhn8vDWCU=;
 b=4q9J/w2P3j8zADb4/Yk0PqexC0/bbf+4DQUTBsovzVOCdUnfmKeQuhdovIaH+2HbzI
 0t/jOxzD8QTydE7wy8krz1sthYx9OylQjbj3mMJjwQ1aUVdoRWVKC/+uaZDdb8wf9rcN
 XK6LegW7bknZtOKk2nvF4aRRwe8dRaU5+uSQkinEjM108CqrNjgEfJzLljaw9ynAcG1y
 bvdunMIq4b+K9tw3S/8OGY0C0caO9rZgLpkXvmBTLb61L3DILguJRmok8QLEyetgt6zH
 op+ZHBVXi9wDy7WFKjFBQ+SCbtte1ZqRjIXBqD+Z80zPtfXZ4o1eIjws8QBupR1HX98R
 127w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=8HdumYIHaqc+DSe67GI6ecQExuBLjgUjFbvhn8vDWCU=;
 b=b070nHViRKWPPrQJCLLzt3anrBVYlk/tZ4O+QdFYGZ8ls6UapHBQbjKy7SGJZBLXvf
 JgppdBraAoK2Psg5QvR5snCy/o1n+Ge4n0qB51sCZiUhXpf61no5e/Oze+LTIaHXfRbd
 uxEEaks72YSnVtNuEGZQqwA2QWtgciz4JI0gXpe8sH+S92w4k2ql9bP5LuM0iu9vVW9o
 CuDlu/VAnWH750IA3aenSLRZt9LASVNQ7v8hTfqiqoYr1AeMFP24O4um+PPPe218XFEj
 WSa9gqLG58Zb0ElY2MvdxO7p8Q6/GrL1+do2zbGehM+rUUh0TnXmDFNzGK3BckuRBYOd
 PGbw==
X-Gm-Message-State: AOAM5319C2qxIvDDCipPVCBRHl0ngAkUz6QrwmPRk2MHFkHLJrXQMWVW
 VZBCSRRB2IeWMY874+ZmmcTwiA==
X-Google-Smtp-Source: ABdhPJwRZ2zCwwbbdMcAhPMEANS2UpXlGtvGBqrIYpeYWtNBc4XbnGmIgXOEgLPDClMqtmi9U/pUgA==
X-Received: by 2002:a17:90b:3148:: with SMTP id
 ip8mr257144pjb.62.1634654638306; 
 Tue, 19 Oct 2021 07:43:58 -0700 (PDT)
Received: from 192.168.1.6 ([115.96.120.132])
 by smtp.googlemail.com with ESMTPSA id z2sm17165134pfe.210.2021.10.19.07.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 07:43:57 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 19 Oct 2021 20:13:52 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH 00/64] Patch Round-up for stable 6.0.1, freeze on
 2021-10-26
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
Message-ID: <alpine.DEB.2.22.394.2110192010430.172612@anisinha-lenovo>
References: <20211019140944.152419-1-michael.roth@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-1322676310-1634654637=:172612"
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: imammedo@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-1322676310-1634654637=:172612
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Tue, 19 Oct 2021, Michael Roth wrote:

> Hi everyone,
>
> The following new patches are queued for QEMU stable v6.0.1:
>
>   https://gitlab.com/qemu-project/qemu/-/commits/stable-6.0-staging/
>
> Patch freeze is 2021-10-26, and the release is planned for 2021-10-28:
>
>   https://wiki.qemu.org/Planning/6.0
>
> Please respond here or CC qemu-stable@nongnu.org on any additional patches
> you think should (or shouldn't) be included in the release.

I believe we should also include this patch:
https://lore.kernel.org/qemu-devel/20210916132838.3469580-2-ani@anisinha.ca/T/

It is also CC'd to qemu-stable@ but the patch itself was not tagged so (my
apologies for that).



>
> Thanks!
>
> ----------------------------------------------------------------
> David Hildenbrand (2):
>       virtio-balloon: don't start free page hinting if postcopy is possible
>       virtio-mem-pci: Fix memory leak when creating MEMORY_DEVICE_SIZE_CHANGE event
>
> Dr. David Alan Gilbert (1):
>       audio: Never send migration section
>
> Gerd Hoffmann (3):
>       uas: add stream number sanity checks.
>       usb/redir: avoid dynamic stack allocation (CVE-2021-3527)
>       usb: limit combined packets to 1 MiB (CVE-2021-3527)
>
> Giuseppe Musacchio (1):
>       target/ppc: Fix load endianness for lxvwsx/lxvdsx
>
> Gollu Appalanaidu (1):
>       hw/block/nvme: align with existing style
>
> Greg Kurz (1):
>       docs/system: Document the removal of "compat" property for POWER CPUs
>
> Igor Mammedov (3):
>       tests: acpi: prepare for changing DSDT tables
>       acpi: pc: revert back to v5.2 PCI slot enumeration
>       tests: acpi: pc: update expected DSDT blobs
>
> Jason Wang (2):
>       vhost-vdpa: don't initialize backend_features
>       virtio-net: fix use after unmap/free for sg
>
> Kevin Wolf (1):
>       hmp: Fix loadvm to resume the VM on success instead of failure
>
> Klaus Jensen (2):
>       hw/nvme: fix missing check for PMR capability
>       hw/nvme: fix pin-based interrupt behavior (again)
>
> Kunkun Jiang (1):
>       vfio: Fix unregister SaveVMHandler in vfio_migration_finalize
>
> Leonardo Bras (1):
>       yank: Unregister function when using TLS migration
>
> Li Qiang (7):
>       vhost-user-gpu: fix memory disclosure in virgl_cmd_get_capset_info (CVE-2021-3545)
>       vhost-user-gpu: fix resource leak in 'vg_resource_create_2d' (CVE-2021-3544)
>       vhost-user-gpu: fix memory leak in vg_resource_attach_backing (CVE-2021-3544)
>       vhost-user-gpu: fix memory leak while calling 'vg_resource_unref' (CVE-2021-3544)
>       vhost-user-gpu: fix memory leak in 'virgl_cmd_resource_unref' (CVE-2021-3544)
>       vhost-user-gpu: fix memory leak in 'virgl_resource_attach_backing' (CVE-2021-3544)
>       vhost-user-gpu: fix OOB write in 'virgl_cmd_get_capset' (CVE-2021-3546)
>
> Li Zhijian (1):
>       migration/rdma: Fix cm_event used before being initialized
>
> Marcel Apfelbaum (3):
>       hw/rdma: Fix possible mremap overflow in the pvrdma device (CVE-2021-3582)
>       pvrdma: Ensure correct input on ring init (CVE-2021-3607)
>       pvrdma: Fix the ring init error flow (CVE-2021-3608)
>
> Mark Cave-Ayland (2):
>       esp: only assert INTR_DC interrupt flag if selection fails
>       esp: only set ESP_RSEQ at the start of the select sequence
>
> Markus Armbruster (1):
>       hmp: Unbreak "change vnc"
>
> Max Filippov (1):
>       target/xtensa: fix access ring in l32ex
>
> Nir Soffer (1):
>       qemu-nbd: Change default cache mode to writeback
>
> Paolo Bonzini (7):
>       vl: allow not specifying size in -m when using -M memory-backend
>       qemu-option: support accept-any QemuOptsList in qemu_opts_absorb_qdict
>       qemu-config: load modules when instantiating option groups
>       qemu-config: parse configuration files to a QDict
>       vl: plumb keyval-based options into -readconfig
>       vl: plug -object back into -readconfig
>       configure: fix detection of gdbus-codegen
>
> Pavel Pisa (1):
>       hw/net/can: sja1000 fix buff2frame_bas and buff2frame_pel when dlc is out of std CAN 8 bytes
>
> Peng Liang (1):
>       runstate: Initialize Error * to NULL
>
> Peter Maydell (1):
>       target/arm: Don't skip M-profile reset entirely in user mode
>
> Philippe Mathieu-Daudé (11):
>       hw/pci-host/q35: Ignore write of reserved PCIEXBAR LENGTH field
>       block/nvme: Fix VFIO_MAP_DMA failed: No space left on device
>       crypto/tlscreds: Introduce qcrypto_tls_creds_check_endpoint() helper
>       block/nbd: Use qcrypto_tls_creds_check_endpoint()
>       qemu-nbd: Use qcrypto_tls_creds_check_endpoint()
>       chardev/socket: Use qcrypto_tls_creds_check_endpoint()
>       migration/tls: Use qcrypto_tls_creds_check_endpoint()
>       ui/vnc: Use qcrypto_tls_creds_check_endpoint()
>       crypto: Make QCryptoTLSCreds* structures private
>       hw/sd/sdcard: Document out-of-range addresses for SEND_WRITE_PROT
>       hw/sd/sdcard: Fix assertion accessing out-of-range addresses with CMD30
>
> Richard Henderson (4):
>       linux-user/aarch64: Enable hwcap for RND, BTI, and MTE
>       target/i386: Exit tb after wrmsr
>       tcg/sparc: Fix temp_allocate_frame vs sparc stack bias
>       tcg: Allocate sufficient storage in temp_allocate_frame
>
> Stefan Hajnoczi (1):
>       sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog
>
> Stefan Reiter (1):
>       monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB
>
> Zenghui Yu (1):
>       multi-process: Initialize variables declared with g_auto*
>
> Zhenzhong Duan (1):
>       vl: Fix an assert failure in error path
>
>  audio/audio.c                           |  10 +++
>  block/nbd.c                             |   6 +-
>  block/nvme.c                            |  22 ++++++
>  blockdev-nbd.c                          |   6 +-
>  chardev/char-socket.c                   |  18 ++---
>  configure                               |   4 +-
>  contrib/vhost-user-gpu/vhost-user-gpu.c |   7 ++
>  contrib/vhost-user-gpu/virgl.c          |  17 ++++-
>  crypto/tls-cipher-suites.c              |   7 ++
>  crypto/tlscreds.c                       |  12 +++
>  crypto/tlscredsanon.c                   |   2 +
>  crypto/tlscredspriv.h                   |  45 +++++++++++
>  crypto/tlscredspsk.c                    |   2 +
>  crypto/tlscredsx509.c                   |   1 +
>  crypto/tlssession.c                     |   1 +
>  docs/system/removed-features.rst        |   6 ++
>  docs/tools/qemu-nbd.rst                 |   6 +-
>  hw/block/nvme-ns.c                      |   2 +-
>  hw/block/nvme.c                         |  89 ++++++++++++++--------
>  hw/block/nvme.h                         |   1 +
>  hw/i386/acpi-build.c                    |   9 ++-
>  hw/net/can/can_sja1000.c                |   8 ++
>  hw/net/virtio-net.c                     |  39 ++++++++--
>  hw/pci-host/q35.c                       |   3 +
>  hw/rdma/vmw/pvrdma_cmd.c                |   7 ++
>  hw/rdma/vmw/pvrdma_dev_ring.c           |   2 +-
>  hw/rdma/vmw/pvrdma_main.c               |   5 ++
>  hw/remote/memory.c                      |   5 +-
>  hw/remote/proxy.c                       |   3 +-
>  hw/scsi/esp.c                           |  13 +++-
>  hw/sd/sd.c                              |   9 ++-
>  hw/usb/combined-packet.c                |   4 +-
>  hw/usb/dev-uas.c                        |  11 +++
>  hw/usb/redirect.c                       |   6 +-
>  hw/vfio/migration.c                     |   1 +
>  hw/virtio/vhost-vdpa.c                  |   3 -
>  hw/virtio/virtio-balloon.c              |  13 ++++
>  hw/virtio/virtio-mem-pci.c              |   7 +-
>  include/block/nvme.h                    |  10 +--
>  include/block/qdict.h                   |   2 -
>  include/crypto/tls-cipher-suites.h      |   6 --
>  include/crypto/tlscreds.h               |  30 ++++----
>  include/crypto/tlscredsanon.h           |  12 ---
>  include/crypto/tlscredspsk.h            |  12 ---
>  include/crypto/tlscredsx509.h           |  10 ---
>  include/qapi/qmp/qdict.h                |   3 +
>  include/qemu/config-file.h              |   7 +-
>  linux-user/elfload.c                    |  13 ++++
>  migration/channel.c                     |  26 ++++---
>  migration/multifd.c                     |   3 +-
>  migration/qemu-file-channel.c           |   4 +-
>  migration/rdma.c                        |   1 -
>  migration/tls.c                         |   6 +-
>  monitor/hmp-cmds.c                      |   4 +-
>  monitor/qmp.c                           |  40 +++++-----
>  qemu-nbd.c                              |  25 +++---
>  softmmu/runstate.c                      |   2 +-
>  softmmu/vl.c                            | 130 +++++++++++++++++++++++---------
>  stubs/meson.build                       |   1 +
>  stubs/module-opts.c                     |   6 ++
>  target/arm/cpu.c                        |  19 +++++
>  target/i386/tcg/translate.c             |   2 +
>  target/ppc/translate/vsx-impl.c.inc     |   4 +-
>  target/xtensa/translate.c               |   2 +-
>  tcg/sparc/tcg-target.c.inc              |  16 ++--
>  tcg/tcg.c                               |  40 +++++++---
>  tests/data/acpi/pc/DSDT                 | Bin 6002 -> 6002 bytes
>  tests/data/acpi/pc/DSDT.acpihmat        | Bin 7327 -> 7327 bytes
>  tests/data/acpi/pc/DSDT.bridge          | Bin 8668 -> 8668 bytes
>  tests/data/acpi/pc/DSDT.cphp            | Bin 6466 -> 6466 bytes
>  tests/data/acpi/pc/DSDT.dimmpxm         | Bin 7656 -> 7656 bytes
>  tests/data/acpi/pc/DSDT.hpbridge        | Bin 5969 -> 5969 bytes
>  tests/data/acpi/pc/DSDT.ipmikcs         | Bin 6074 -> 6074 bytes
>  tests/data/acpi/pc/DSDT.memhp           | Bin 7361 -> 7361 bytes
>  tests/data/acpi/pc/DSDT.nohpet          | Bin 5860 -> 5860 bytes
>  tests/data/acpi/pc/DSDT.numamem         | Bin 6008 -> 6008 bytes
>  ui/vnc.c                                |   7 +-
>  util/qemu-config.c                      |  99 ++++++++++++++++--------
>  util/qemu-option.c                      |   3 +-
>  util/qemu-sockets.c                     |  29 +++++--
>  80 files changed, 685 insertions(+), 301 deletions(-)
>  create mode 100644 stubs/module-opts.c
>
>
>
>
--2088271309-1322676310-1634654637=:172612--

