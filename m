Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC36486D87
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 00:08:43 +0100 (CET)
Received: from localhost ([::1]:38202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5bs9-0007Lh-Vf
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 18:08:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5bqR-0006cR-Q0
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 18:06:55 -0500
Received: from [2607:f8b0:4864:20::102b] (port=51150
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5bqP-0003xt-Hi
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 18:06:55 -0500
Received: by mail-pj1-x102b.google.com with SMTP id gp5so3712034pjb.0
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 15:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cTUGsBwoHenUfTo7ZAvrWD+w/Q6dwFRBp7js0a3cQuU=;
 b=PzLKx/AGaFGkCeA9rH5mdhRdfcgU08kzaCkRlvOjwrrNfuAnba5uYcFuwe/+nfORJN
 gHQHY758QfWwl6s3siMMMbv+d7HCbSW5sy5keah0sNIlv+ZAEWEMuTqXiBFJ342bFq4c
 KIBAJCU7dNcxPuSOIdwpzC84rkLVh1iG6/txkKWI8SEGqnx9QzWMFhMvjeiqIHwyVUpb
 4wKXkiodhBjTox15rk+HngwTZOS0wFFt1TDnJuNJdhHXzJg84i+Mm22baRVu4gGerNBl
 HH5e/lGug/9dJrcY22ag2rdPX4HSJ1qbDgQ0N9yaQgl4RBB+rMma7cbnD9c01Fkec5/1
 CpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cTUGsBwoHenUfTo7ZAvrWD+w/Q6dwFRBp7js0a3cQuU=;
 b=NEXNHivuqFYF6TRj7Ej75y7KtCBvwq8tc1iLvHahT5aN3Bcq9D8DUAuJVZVgu25j5x
 MAqZ3OFKXgd+YxvItL1KXVp7t/aL9yEy3GeoZRJC8M2M4WNr+Ioy4cCpXdPssbzraV+d
 f4CN9cbPwVIdCCUdA8c8hxPnz+kYTqo/YGt8XEa+Ozawv0VewL4FNXThVwV1ugs2e1zI
 YcQBDfOpPBYNINBA2H4+I4T99wjpFy5wjihT3+4q7eXGPogaLr1BYHhAF0VY7VZ4HoIU
 64eYXP/n2TmK8mOaTG755oQI/u+Bb8AtD3MZIgGThyjptk+e9X5/SgcFwgfjyxLMs9ja
 EE/w==
X-Gm-Message-State: AOAM533PeNxP+S9U/SPpbh9xUkihJBQGtJLFvAWosaMQbe4KowkQjKKn
 LK1sTl9JVejrE28j8IG2XM2JTA==
X-Google-Smtp-Source: ABdhPJzNTMj1Aoi6hwZy0iAgOVf4BxPUu4p7B5sguyNGsOsOX7N1Pc+koccDxXzdQVpch+U1CIDVAg==
X-Received: by 2002:a17:902:c951:b0:149:ee13:8db8 with SMTP id
 i17-20020a170902c95100b00149ee138db8mr5550278pla.79.1641510411972; 
 Thu, 06 Jan 2022 15:06:51 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e20sm3577885pfv.219.2022.01.06.15.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 15:06:51 -0800 (PST)
Subject: Re: [PULL 00/52] virtio,pci,pc: features,fixes,cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20220106131534.423671-1-mst@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <37e10c3a-5541-14ac-c312-e552cd39e9bf@linaro.org>
Date: Thu, 6 Jan 2022 15:06:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/22 5:16 AM, Michael S. Tsirkin wrote:
> Big changes that were tagged originally but did not make the cut:
> - SRIOV/nvme (not sure they are my tree material anyway)
> - TPM (blocked over Igor's compat concerns)
> - ACPI ERST (some coding style violations)
> 
> The following changes since commit 7d4ae4d4978079d564d3b6354c90a949130409fe:
> 
>    Merge tag 'pull-request-2022-01-05' of https://gitlab.com/thuth/qemu into staging (2022-01-05 08:47:18 -0800)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to 9399c26697e7c9658d082c6390e143319decaef5:
> 
>    virtio/vhost-vsock: don't double close vhostfd, remove redundant cleanup (2022-01-06 07:16:25 -0500)
> 
> ----------------------------------------------------------------
> virtio,pci,pc: features,fixes,cleanups
> 
> New virtio mem options.
> A vhost-user cleanup.
> Control over smbios entry point type.
> Config interrupt support for vdpa.
> Fixes, cleanups all over the place.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ----------------------------------------------------------------
> Andy Pei (1):
>        hw/vhost-user-blk: turn on VIRTIO_BLK_F_SIZE_MAX feature for virtio blk device
> 
> Ani Sinha (2):
>        MAINTAINERS: Add a separate entry for acpi/VIOT tables
>        acpihp: simplify acpi_pcihp_disable_root_bus
> 
> Cindy Lu (10):
>        virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
>        virtio-pci: decouple notifier from interrupt process
>        virtio-pci: decouple the single vector from the interrupt process
>        vhost: introduce new VhostOps vhost_set_config_call
>        vhost-vdpa: add support for config interrupt
>        virtio: add support for configure interrupt
>        vhost: add support for configure interrupt
>        virtio-net: add support for configure interrupt
>        virtio-mmio: add support for configure interrupt
>        virtio-pci: add support for configure interrupt
> 
> Daniil Tatianin (3):
>        hw/scsi/vhost-scsi: don't leak vqs on error
>        hw/scsi/vhost-scsi: don't double close vhostfd on error
>        virtio/vhost-vsock: don't double close vhostfd, remove redundant cleanup
> 
> David Hildenbrand (12):
>        virtio-mem: Don't skip alignment checks when warning about block size
>        util/oslib-posix: Let touch_all_pages() return an error
>        util/oslib-posix: Support MADV_POPULATE_WRITE for os_mem_prealloc()
>        util/oslib-posix: Introduce and use MemsetContext for touch_all_pages()
>        util/oslib-posix: Don't create too many threads with small memory or little pages
>        util/oslib-posix: Avoid creating a single thread with MADV_POPULATE_WRITE
>        util/oslib-posix: Support concurrent os_mem_prealloc() invocation
>        util/oslib-posix: Forward SIGBUS to MCE handler under Linux
>        virtio-mem: Support "prealloc=on" option
>        linux-headers: sync VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
>        virtio-mem: Support VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
>        virtio-mem: Set "unplugged-inaccessible=auto" for the 7.0 machine on x86
> 
> Eduardo Habkost (3):
>        smbios: Rename SMBIOS_ENTRY_POINT_* enums
>        hw/smbios: Use qapi for SmbiosEntryPointType
>        hw/i386: expose a "smbios-entry-point-type" PC machine property
> 
> Frederic Barrat (2):
>        pci: Export the pci_intx() function
>        pcie_aer: Don't trigger a LSI if none are defined
> 
> Igor Mammedov (4):
>        acpi: fix QEMU crash when started with SLIC table
>        tests: acpi: whitelist expected blobs before changing them
>        tests: acpi: add SLIC table test
>        tests: acpi: SLIC: update expected blobs
> 
> Jason Wang (1):
>        intel-iommu: correctly check passthrough during translation
> 
> Laurent Vivier (1):
>        trace-events,pci: unify trace events format
> 
> Michael S. Tsirkin (1):
>        acpi: validate hotplug selector on access
> 
> Roman Kagan (9):
>        vhost-user-blk: reconnect on any error during realize
>        chardev/char-socket: tcp_chr_recv: don't clobber errno
>        chardev/char-socket: tcp_chr_sync_read: don't clobber errno
>        vhost-backend: avoid overflow on memslots_limit
>        vhost-backend: stick to -errno error return convention
>        vhost-vdpa: stick to -errno error return convention
>        vhost-user: stick to -errno error return convention
>        vhost: stick to -errno error return convention
>        vhost-user-blk: propagate error return from generic vhost
> 
> Stefan Hajnoczi (1):
>        virtio: signal after wrapping packed used_idx
> 
> Thomas Huth (2):
>        hw/i386/pc: Add missing property descriptions
>        docs: reSTify virtio-balloon-stats documentation and move to docs/interop
> 
>   qapi/machine.json                                  |  12 +
>   hw/virtio/virtio-pci.h                             |   4 +-
>   include/hw/firmware/smbios.h                       |  10 +-
>   include/hw/i386/pc.h                               |   4 +
>   include/hw/pci/pci.h                               |   5 +
>   include/hw/virtio/vhost-backend.h                  |   3 +
>   include/hw/virtio/vhost.h                          |   4 +
>   include/hw/virtio/virtio-mem.h                     |  12 +
>   include/hw/virtio/virtio.h                         |   7 +
>   include/net/vhost_net.h                            |   2 +
>   include/qemu/osdep.h                               |   7 +
>   include/standard-headers/linux/virtio_mem.h        |   9 +-
>   chardev/char-socket.c                              |  17 +-
>   hw/acpi/core.c                                     |   4 +-
>   hw/acpi/pcihp.c                                    |  12 +-
>   hw/arm/virt.c                                      |   2 +-
>   hw/block/vhost-user-blk.c                          |   5 +-
>   hw/display/vhost-user-gpu.c                        |   6 +
>   hw/i386/acpi-build.c                               |   2 +
>   hw/i386/intel_iommu.c                              |  38 +-
>   hw/i386/pc.c                                       |  38 +-
>   hw/i386/pc_piix.c                                  |   2 +-
>   hw/i386/pc_q35.c                                   |   2 +-
>   hw/net/vhost_net.c                                 |   9 +
>   hw/net/virtio-net.c                                |  10 +-
>   hw/pci/pci.c                                       |   9 +-
>   hw/pci/pci_host.c                                  |   6 +-
>   hw/pci/pcie_aer.c                                  |   4 +-
>   hw/scsi/vhost-scsi.c                               |  15 +-
>   hw/smbios/smbios.c                                 |   8 +-
>   hw/virtio/vhost-backend.c                          |   4 +-
>   hw/virtio/vhost-user-fs.c                          |   6 +
>   hw/virtio/vhost-user.c                             | 401 ++++++++++++---------
>   hw/virtio/vhost-vdpa.c                             |  44 ++-
>   hw/virtio/vhost-vsock-common.c                     |   6 +
>   hw/virtio/vhost-vsock.c                            |  11 +-
>   hw/virtio/vhost.c                                  | 174 ++++++---
>   hw/virtio/virtio-crypto.c                          |   6 +
>   hw/virtio/virtio-mem.c                             | 105 +++++-
>   hw/virtio/virtio-mmio.c                            |  27 ++
>   hw/virtio/virtio-pci.c                             | 281 ++++++++++-----
>   hw/virtio/virtio.c                                 |  30 ++
>   softmmu/cpus.c                                     |   4 +
>   tests/qtest/bios-tables-test.c                     |  15 +
>   util/oslib-posix.c                                 | 233 +++++++++---
>   MAINTAINERS                                        |   8 +
>   docs/interop/index.rst                             |   1 +
>   .../virtio-balloon-stats.rst}                      |  58 +--
>   hw/pci/trace-events                                |   8 +-
>   hw/virtio/trace-events                             |   1 +
>   tests/data/acpi/q35/FACP.slic                      | Bin 0 -> 244 bytes
>   tests/data/acpi/q35/SLIC.slic                      | Bin 0 -> 36 bytes
>   52 files changed, 1191 insertions(+), 500 deletions(-)
>   rename docs/{virtio-balloon-stats.txt => interop/virtio-balloon-stats.rst} (66%)
>   create mode 100644 tests/data/acpi/q35/FACP.slic
>   create mode 100644 tests/data/acpi/q35/SLIC.slic

Two classes of failures:

https://gitlab.com/qemu-project/qemu/-/jobs/1949636950

../util/oslib-posix.c:486:5: error: implicit declaration of function 'warn_report' 
[-Werror=implicit-function-declaration]
   486 |     warn_report("os_mem_prealloc: unrelated SIGBUS detected and ignored");
       |     ^~~~~~~~~~~
../util/oslib-posix.c:486:5: error: nested extern declaration of 'warn_report' 
[-Werror=nested-externs]

https://gitlab.com/qemu-project/qemu/-/jobs/1949636980

C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw32/bin/../lib/gcc/i686-w64-mingw32/11.2.0/../../../../i686-w64-mingw32/bin/ld.exe: 
libqemu-ppc64-softmmu.fa.p/hw_net_virtio-net.c.obj: in function 
`virtio_net_guest_notifier_pending':
C:\GitLab-Runner\builds\qemu-project\qemu\output/../hw/net/virtio-net.c:3172: undefined 
reference to `vhost_net_config_pending'
C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw32/bin/../lib/gcc/i686-w64-mingw32/11.2.0/../../../../i686-w64-mingw32/bin/ld.exe: 
libqemu-ppc64-softmmu.fa.p/hw_net_virtio-net.c.obj: in function 
`virtio_net_guest_notifier_mask':
C:\GitLab-Runner\builds\qemu-project\qemu\output/../hw/net/virtio-net.c:3184: undefined 
reference to `vhost_net_config_mask'

with 11 instances.


r~

