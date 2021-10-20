Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385C7434F33
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 17:36:51 +0200 (CEST)
Received: from localhost ([::1]:49628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdDe6-0001ou-9B
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 11:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mapfelba@redhat.com>)
 id 1mdDbt-0000MD-BW
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 11:34:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mapfelba@redhat.com>)
 id 1mdDbn-00086h-1r
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 11:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634744066;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ugRAa+MLNMtL1KD9p/dSNVd8wmmE1eSPUi2P0p1PxII=;
 b=ZWUYl6mcMV2MBZhNbt0U+DKHj/3bUxVSqWe2GDfp4RdipSnxfVWJDCUFnm2tyxU8F19ulm
 fSatL5ZHnpskop0GcC7KAYtudgkNheO8Jp+gqNC6gjsqUoJ1xzfI1ycoDx8ddYeps4VZPU
 UcTkZHE2lNQ+ngTxQ0de0L+sV5tQeW8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-MnhHA-4-NpGAxTSI3Wd3_g-1; Wed, 20 Oct 2021 11:34:21 -0400
X-MC-Unique: MnhHA-4-NpGAxTSI3Wd3_g-1
Received: by mail-ed1-f72.google.com with SMTP id
 cy14-20020a0564021c8e00b003db8c9a6e30so21371460edb.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 08:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=ugRAa+MLNMtL1KD9p/dSNVd8wmmE1eSPUi2P0p1PxII=;
 b=qUJ2WIdNvjs5lvvJoN9PVPjP3gHMD9c2MJr8AgUXM6UIOVvtL0c8DTZARiAxcE3BXg
 WGcVHy+oPyEu9I/TCngGCsF7k7Nk2B+a8EdvuoZY3LLN2C/UR4rQj1ZzsFuqUFbJOeCM
 cQOkatdzpQqvmiIeNksPawZ3wYldLG5Ycus5d+t4ZV9Ac0PwY6FgcRxd74XjynGklgk3
 JgHMCU0wEDNxQA3fOcHmnlhZkh6PVP0cwGV335ybMMcXwMe9kpRf2FbXw2StwzHh7SLt
 sg+/8r11sZo1eUZZeVSA56fJOl13/6akyYgSWNDzgKW+B8dST0MXo/Md6WbkwoWSz2yu
 PESQ==
X-Gm-Message-State: AOAM532bPT3Knjwr2MljTKcFCsHcR3SjiaJiKdSvVHCH05u+VZCRJDu4
 OdE+vav8qPPXXvO0CxfYVYgK39EVTiu4fJdpcewddVRMfbELDFPGHzO5L6SH19Q/iPVi3Df/IOk
 RkqoF/wxk6PEodx027FqLItPJxF3vzSk=
X-Received: by 2002:a17:906:4fc7:: with SMTP id i7mr107166ejw.14.1634744060519; 
 Wed, 20 Oct 2021 08:34:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwzAt1X6fsfuTK1aNSTBL9E/HHyXBc1Yk56pY3SW9KvtMR9ttrJIavCilb45rnGm9UwITwiwZwc29ru65dNZg=
X-Received: by 2002:a17:906:4fc7:: with SMTP id i7mr107138ejw.14.1634744060279; 
 Wed, 20 Oct 2021 08:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211019111923.679826-1-mst@redhat.com>
 <4cc1b92e-a3f0-bab9-6e71-112ef3fb13a1@linaro.org>
 <20211020103929.5cc1fb32@redhat.com>
 <f2a6b49c-f1f7-f50c-0ff6-49e37427007c@redhat.com>
 <20211020054105-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211020054105-mutt-send-email-mst@kernel.org>
From: Marcel Apfelbaum <mapfelba@redhat.com>
Date: Wed, 20 Oct 2021 18:34:08 +0300
Message-ID: <CA+aaKfAbsDTErbGKO5XPQyCPU-aCYBJf+mUPTnwH+mqUKgsZUw@mail.gmail.com>
Subject: Re: [PULL 00/29] pc,pci,virtio: features, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mapfelba@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000003147c05ceca8356"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mapfelba@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: marcel@redhat.com
Cc: Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000003147c05ceca8356
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Wed, Oct 20, 2021 at 12:41 PM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Wed, Oct 20, 2021 at 11:39:28AM +0200, Thomas Huth wrote:
> > On 20/10/2021 10.39, Igor Mammedov wrote:
> > > On Tue, 19 Oct 2021 11:38:08 -0700
> > > Richard Henderson <richard.henderson@linaro.org> wrote:
> > >
> > > > On 10/19/21 4:19 AM, Michael S. Tsirkin wrote:
> > > > > The following changes since commit
> 9c050b661d3a43dfe2fd44106e559b39706d1296:
> > > > >
> > > > >     Merge remote-tracking branch
> 'remotes/philmd/tags/mips-20211018' into staging (2021-10-18 09:16:51 -07=
00)
> > > > >
> > > > > are available in the Git repository at:
> > > > >
> > > > >     git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git
> tags/for_upstream
> > > > >
> > > > > for you to fetch changes up to
> bf2dd99b7d536cdba157fd6687810ce7b8340ccc:
> > > > >
> > > > >     failover: fix a regression introduced by JSON'ification of
> -device (2021-10-19 07:15:34 -0400)
> > > > >
> > > > > ----------------------------------------------------------------
> > > > > pc,pci,virtio: features, fixes
> > > > >
> > > > > vhost user rng
> > > > > Fixes, cleanups all over the place.
> > > > >
> > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > >
> > > > > ----------------------------------------------------------------
> > > > > Ani Sinha (3):
> > > > >         tests/acpi/bios-tables-test: add and allow changes to a
> new q35 DSDT table blob
> > > > >         tests/acpi/pcihp: add unit tests for hotplug on
> multifunction bridges for q35
> > > > >         tests/acpi/bios-tables-test: update DSDT blob for
> multifunction bridge test
> > > > >
> > > > > David Hildenbrand (1):
> > > > >         libvhost-user: fix VHOST_USER_REM_MEM_REG skipping
> mmap_addr
> > > > >
> > > > > Eric Auger (2):
> > > > >         virtio-iommu: Remove the non transitional name
> > > > >         virtio-iommu: Drop base_name and change generic_name
> > > > >
> > > > > Eugenio P=C3=A9rez (3):
> > > > >         vdpa: Skip protected ram IOMMU mappings
> > > > >         vdpa: Add vhost_vdpa_section_end
> > > > >         vdpa: Check for iova range at mappings changes
> > > > >
> > > > > Igor Mammedov (15):
> > > > >         tests: acpi: dump table with failed checksum
> > > > >         tests: qtest: add qtest_has_accel() to check if tested
> binary supports accelerator
> > > > >         tests: acpi: whitelist expected tables for acpi/q35/xapic
> testcase
> > > > >         tests: acpi: q35: test for x2APIC entries in SRAT
> > > > >         tests: acpi: update expected tables blobs
> > > > >         tests: acpi: whitelist new expected table
> tests/data/acpi/q35/DMAR.dmar
> > > > >         tests: acpi: add testcase for intel_iommu (DMAR table)
> > > > >         tests: acpi: add expected blob for DMAR table
> > > > >         tests: acpi: whitelist expected blobs for new
> acpi/q35/ivrs testcase
> > > > >         tests: acpi: add testcase for amd-iommu (IVRS table)
> > > > >         tests: acpi: update expected blobs
> > > > >         tests: acpi: arm/virt: drop redundant test_acpi_one() in
> test_acpi_virt_tcg()
> > > > >         tests: arm-cpu-features: use qtest_has_kvm() API
> > > > >         tests: migration-test: use qtest_has_accel() API
> > > > >         tests: bios-tables-test: use qtest_has_accel() API to
> register TCG only tests
> > > > >
> > > > > Laurent Vivier (1):
> > > > >         failover: fix a regression introduced by JSON'ification o=
f
> -device
> > > > >
> > > > > Mathieu Poirier (3):
> > > > >         vhost-user-rng: Add vhost-user-rng implementation
> > > > >         vhost-user-rng-pci: Add vhost-user-rng-pci implementation
> > > > >         docs: Add documentation for vhost based RNG implementatio=
n
> > > > >
> > > > > Xueming Li (1):
> > > > >         vhost-user: fix duplicated notifier MR init
> > > > >
> > > > >    include/hw/virtio/vhost-user-rng.h        |  33 ++++
> > > > >    include/hw/virtio/vhost-vdpa.h            |   2 +
> > > > >    include/hw/virtio/virtio-iommu.h          |   2 +-
> > > > >    tests/qtest/libqos/libqtest.h             |   8 +
> > > > >    hw/net/virtio-net.c                       |  24 ++-
> > > > >    hw/virtio/vhost-user-rng-pci.c            |  79 ++++++++
> > > > >    hw/virtio/vhost-user-rng.c                | 289
> ++++++++++++++++++++++++++++++
> > > > >    hw/virtio/vhost-user.c                    |   5 +-
> > > > >    hw/virtio/vhost-vdpa.c                    |  81 ++++++---
> > > > >    hw/virtio/virtio-iommu-pci.c              |   4 +-
> > > > >    subprojects/libvhost-user/libvhost-user.c |   1 +
> > > > >    tests/qtest/acpi-utils.c                  |  14 ++
> > > > >    tests/qtest/arm-cpu-features.c            |  29 +--
> > > > >    tests/qtest/bios-tables-test.c            |  90 ++++++++--
> > > > >    tests/qtest/libqtest.c                    |  27 +++
> > > > >    tests/qtest/migration-test.c              |  15 +-
> > > > >    docs/system/device-emulation.rst          |   1 +
> > > > >    docs/system/devices/vhost-user-rng.rst    |  39 ++++
> > > > >    hw/virtio/Kconfig                         |   5 +
> > > > >    hw/virtio/meson.build                     |   2 +
> > > > >    hw/virtio/trace-events                    |   1 +
> > > > >    meson.build                               |   6 +
> > > > >    tests/data/acpi/q35/APIC.xapic            | Bin 0 -> 2686 byte=
s
> > > > >    tests/data/acpi/q35/DMAR.dmar             | Bin 0 -> 120 bytes
> > > > >    tests/data/acpi/q35/DSDT.ivrs             | Bin 0 -> 8306 byte=
s
> > > > >    tests/data/acpi/q35/DSDT.multi-bridge     | Bin 0 -> 8583 byte=
s
> > > > >    tests/data/acpi/q35/DSDT.xapic            | Bin 0 -> 35652 byt=
es
> > > > >    tests/data/acpi/q35/FACP.xapic            | Bin 0 -> 244 bytes
> > > > >    tests/data/acpi/q35/IVRS.ivrs             | Bin 0 -> 104 bytes
> > > > >    tests/data/acpi/q35/SRAT.xapic            | Bin 0 -> 5080 byte=
s
> > > > >    30 files changed, 672 insertions(+), 85 deletions(-)
> > > > >    create mode 100644 include/hw/virtio/vhost-user-rng.h
> > > > >    create mode 100644 hw/virtio/vhost-user-rng-pci.c
> > > > >    create mode 100644 hw/virtio/vhost-user-rng.c
> > > > >    create mode 100644 docs/system/devices/vhost-user-rng.rst
> > > > >    create mode 100644 tests/data/acpi/q35/APIC.xapic
> > > > >    create mode 100644 tests/data/acpi/q35/DMAR.dmar
> > > > >    create mode 100644 tests/data/acpi/q35/DSDT.ivrs
> > > > >    create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
> > > > >    create mode 100644 tests/data/acpi/q35/DSDT.xapic
> > > > >    create mode 100644 tests/data/acpi/q35/FACP.xapic
> > > > >    create mode 100644 tests/data/acpi/q35/IVRS.ivrs
> > > > >    create mode 100644 tests/data/acpi/q35/SRAT.xapic
> > > >
> > > > 32-bit printf errors:
> > > >
> > > > ../hw/virtio/vhost-vdpa.c: In function
> 'vhost_vdpa_listener_skipped_section':
> > > > ../hw/virtio/vhost-vdpa.c:55:22: error: format '%lu' expects
> argument of type 'long
> > > > unsigned int', but argument 2 has type 'uint64_t' {aka 'long long
> unsigned int'}
> > > > [-Werror=3Dformat=3D]
> > > >            error_report("RAM section out of device range (min=3D%lu=
,
> addr=3D%lu)",
> > > >
>  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >                         iova_min,
> section->offset_within_address_space);
> > > >                         ~~~~~~~~
> > > > ../hw/virtio/vhost-vdpa.c:55:22: error: format '%lu' expects
> argument of type 'long
> > > > unsigned int', but argument 3 has type 'hwaddr' {aka 'long long
> unsigned int'}
> > > > [-Werror=3Dformat=3D]
> > > > ../hw/virtio/vhost-vdpa.c:62:22: error: format '%lu' expects
> argument of type 'long
> > > > unsigned int', but argument 2 has type 'uint64_t' {aka 'long long
> unsigned int'}
> > > > [-Werror=3Dformat=3D]
> > > >            error_report("RAM section out of device range (max=3D%lu=
,
> end addr=3D%lu)",
> > > >
>  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >                         iova_max, int128_get64(llend));
> > > >                         ~~~~~~~~
> > > > ../hw/virtio/vhost-vdpa.c:62:22: error: format '%lu' expects
> argument of type 'long
> > > > unsigned int', but argument 3 has type 'uint64_t' {aka 'long long
> unsigned int'}
> > > > [-Werror=3Dformat=3D]
> > > > cc1: all warnings being treated as errors
> > > >
> > > >
> > > > Also fails s390x host testing:
> > > >
> > > >
> > > > ERROR:../tests/qtest/boot-sector.c:170:boot_sector_test: assertion
> failed (signature =3D=3D
> > > > SIGNATURE): (0x00000000 =3D=3D 0x0000dead)
> > > > ERROR qtest-i386/bios-tables-test - Bail out!
> > > > ERROR:../tests/qtest/boot-sector.c:170:boot_sector_test: assertion
> failed (signature =3D=3D
> > > > SIGNATURE): (0x00000000 =3D=3D 0x0000dead)
> > > > Makefile.mtest:368: recipe for target 'run-test-44' failed
> > >
> > > it might happen if VM is too slow
> > >     /* Wait at most 600 seconds ...
> > > Let me find s390 host and see if it's reproducable
> >
> > Micheal already asked Cornelia and me off-list whether it's reproducibl=
e,
> > and it is. It's the new multif-bridge test that is hanging, but it seem=
s
> > like this only uncovered a pre-existing problem: SeaBIOS does bail out =
as
> > soon as QEMU is started with "-device pcie-root-port" on a s390x host.
> I've
> > already enabled the serial debug in SeaBIOS and got this output:
> >
> > $ build/qemu-system-x86_64 -nographic -machine q35  -vga none  -device
> > pcie-root-port -bios ~/bios.bin
> > Changing serial settings was 0/0 now 3/0
> > SeaBIOS (version rel-1.14.0-0-g155821a)
> > BUILD: gcc: (GCC) 8.4.1 20200928 (Red Hat 8.4.1-1) binutils: version
> 2.30-93.el8
> > No Xen hypervisor found.
> > Running on QEMU (q35)
> > Found QEMU fw_cfg
> > QEMU fw_cfg DMA interface supported
> > qemu/e820: addr 0x0000000000000000 len 0x0000000008000000 [RAM]
> > Relocating init from 0x000d6400 to 0x07faa7a0 (size 88000)
> > Moving pm_base to 0x600
> > =3D=3D=3D PCI bus & bridge init =3D=3D=3D
> > PCI: pci_bios_init_bus_rec bus =3D 0x0
> > PCI: pci_bios_init_bus_rec bdf =3D 0x10
> > PCI: primary bus =3D 0x0
> > PCI: secondary bus =3D 0xff -> 0x1
> > PCI: pci_bios_init_bus_rec bus =3D 0x1
> > PCI: subordinate bus =3D 0x0 -> 0x1
> > =3D=3D=3D PCI device probing =3D=3D=3D
> > Found 6 PCI devices (max PCI bus is 01)
> > PCIe: using q35 mmconfig at 0xb0000000
> > =3D=3D=3D PCI new allocation pass #1 =3D=3D=3D
> > PCI: check devices
> > PCI: QEMU resource reserve cap: size 10000000000000 type io
> > PCI: secondary bus 1 size 10000000000000 type io
> > PCI: secondary bus 1 size 00200000 type mem
> > PCI: secondary bus 1 size 00200000 type prefmem
> > =3D=3D=3D PCI new allocation pass #2 =3D=3D=3D
> > PCI: out of I/O address space
> >
> > I also noticed that the problem did not occur on older versions of QEMU=
,
> so
> > I just bisected and ended up with this commit here:
> >
> > e2a6290aab578b2170c1f5909fa556385dc0d820 is the first bad commit
> > commit e2a6290aab578b2170c1f5909fa556385dc0d820
> > Author: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > Date:   Mon Aug 2 12:00:57 2021 +0300
> >
> >     hw/pcie-root-port: Fix hotplug for PCI devices requiring IO
> >
> > Seems like something goes wrong with setting up the IO space on big
> endian
> > hosts?
>

Thank you for finding the issue! Indeed it was there from the start.


> >
> >  Thomas
>
> Yep. The bug is older though, going back to when we first
> added the vendor specific capability.

Does this help?
>
> diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
> index d1f902ee86..da34c8ebcd 100644
> --- a/hw/pci/pci_bridge.c
> +++ b/hw/pci/pci_bridge.c
> @@ -448,11 +448,11 @@ int pci_bridge_qemu_reserve_cap_init(PCIDevice *dev=
,
> int cap_offset,
>      PCIBridgeQemuCap cap =3D {
>              .len =3D cap_len,
>              .type =3D REDHAT_PCI_CAP_RESOURCE_RESERVE,
> -            .bus_res =3D res_reserve.bus,
> -            .io =3D res_reserve.io,
> -            .mem =3D res_reserve.mem_non_pref,
> -            .mem_pref_32 =3D res_reserve.mem_pref_32,
> -            .mem_pref_64 =3D res_reserve.mem_pref_64
> +            .bus_res =3D cpu_to_le32(res_reserve.bus),
> +            .io =3D cpu_to_le64(res_reserve.io),
> +            .mem =3D cpu_to_le32(res_reserve.mem_non_pref),
> +            .mem_pref_32 =3D cpu_to_le32(res_reserve.mem_pref_32),
> +            .mem_pref_64 =3D cpu_to_le64(res_reserve.mem_pref_64)
>      };
>
>      int offset =3D pci_add_capability(dev, PCI_CAP_ID_VNDR,
>
>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Thanks,
Marcel

--00000000000003147c05ceca8356
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Thomas,</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 20, 2021 at 12:41 P=
M Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Wed, Oct 20, 2021 at 11:39:28AM +0200, Thomas Huth wrote:<br>
&gt; On 20/10/2021 10.39, Igor Mammedov wrote:<br>
&gt; &gt; On Tue, 19 Oct 2021 11:38:08 -0700<br>
&gt; &gt; Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.=
org" target=3D"_blank">richard.henderson@linaro.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; &gt; On 10/19/21 4:19 AM, Michael S. Tsirkin wrote:<br>
&gt; &gt; &gt; &gt; The following changes since commit 9c050b661d3a43dfe2fd=
44106e559b39706d1296:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Merge remote-tracking branch &#39;re=
motes/philmd/tags/mips-20211018&#39; into staging (2021-10-18 09:16:51 -070=
0)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; are available in the Git repository at:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.kernel.o=
rg/pub/scm/virt/kvm/mst/qemu.git" rel=3D"noreferrer" target=3D"_blank">git.=
kernel.org/pub/scm/virt/kvm/mst/qemu.git</a> tags/for_upstream<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; for you to fetch changes up to bf2dd99b7d536cdba157fd66=
87810ce7b8340ccc:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0failover: fix a regression introduce=
d by JSON&#39;ification of -device (2021-10-19 07:15:34 -0400)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; -------------------------------------------------------=
---------<br>
&gt; &gt; &gt; &gt; pc,pci,virtio: features, fixes<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; vhost user rng<br>
&gt; &gt; &gt; &gt; Fixes, cleanups all over the place.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"mailto=
:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; -------------------------------------------------------=
---------<br>
&gt; &gt; &gt; &gt; Ani Sinha (3):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests/acpi/bios-tables=
-test: add and allow changes to a new q35 DSDT table blob<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests/acpi/pcihp: add =
unit tests for hotplug on multifunction bridges for q35<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests/acpi/bios-tables=
-test: update DSDT blob for multifunction bridge test<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; David Hildenbrand (1):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libvhost-user: fix VHO=
ST_USER_REM_MEM_REG skipping mmap_addr<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Eric Auger (2):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtio-iommu: Remove t=
he non transitional name<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtio-iommu: Drop bas=
e_name and change generic_name<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Eugenio P=C3=A9rez (3):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdpa: Skip protected r=
am IOMMU mappings<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdpa: Add vhost_vdpa_s=
ection_end<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdpa: Check for iova r=
ange at mappings changes<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Igor Mammedov (15):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests: acpi: dump tabl=
e with failed checksum<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests: qtest: add qtes=
t_has_accel() to check if tested binary supports accelerator<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests: acpi: whitelist=
 expected tables for acpi/q35/xapic testcase<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests: acpi: q35: test=
 for x2APIC entries in SRAT<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests: acpi: update ex=
pected tables blobs<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests: acpi: whitelist=
 new expected table tests/data/acpi/q35/DMAR.dmar<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests: acpi: add testc=
ase for intel_iommu (DMAR table)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests: acpi: add expec=
ted blob for DMAR table<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests: acpi: whitelist=
 expected blobs for new acpi/q35/ivrs testcase<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests: acpi: add testc=
ase for amd-iommu (IVRS table)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests: acpi: update ex=
pected blobs<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests: acpi: arm/virt:=
 drop redundant test_acpi_one() in test_acpi_virt_tcg()<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests: arm-cpu-feature=
s: use qtest_has_kvm() API<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests: migration-test:=
 use qtest_has_accel() API<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests: bios-tables-tes=
t: use qtest_has_accel() API to register TCG only tests<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Laurent Vivier (1):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failover: fix a regres=
sion introduced by JSON&#39;ification of -device<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Mathieu Poirier (3):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vhost-user-rng: Add vh=
ost-user-rng implementation<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vhost-user-rng-pci: Ad=
d vhost-user-rng-pci implementation<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0docs: Add documentatio=
n for vhost based RNG implementation<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Xueming Li (1):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vhost-user: fix duplic=
ated notifier MR init<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 include/hw/virtio/vhost-user-rng.h=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 33 ++++<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 include/hw/virtio/vhost-vdpa.h=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 include/hw/virtio/virtio-iommu.h=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 tests/qtest/libqos/libqtest.h=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 hw/net/virtio-net.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 24 ++=
-<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 hw/virtio/vhost-user-rng-pci.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 79 ++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 hw/virtio/vhost-user-rng.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 289 +++++++++++++++++++++++++++=
+++<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 hw/virtio/vhost-user.c=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 hw/virtio/vhost-vdpa.c=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 81 ++++++---<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 hw/virtio/virtio-iommu-pci.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 subprojects/libvhost-user/libvhost-user.c =
|=C2=A0 =C2=A01 +<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 tests/qtest/acpi-utils.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 ++<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 tests/qtest/arm-cpu-features.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 29 +--<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 tests/qtest/bios-tables-test.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 90 ++++++++--<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 tests/qtest/libqtest.c=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 27 +++<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 tests/qtest/migration-test.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 15 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 docs/system/device-emulation.rst=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 docs/system/devices/vhost-user-rng.rst=C2=
=A0 =C2=A0 |=C2=A0 39 ++++<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 hw/virtio/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A05 +<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 hw/virtio/meson.build=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br=
>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 hw/virtio/trace-events=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A06 +<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 tests/data/acpi/q35/APIC.xapic=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Bin 0 -&gt; 2686 bytes<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 tests/data/acpi/q35/DMAR.dmar=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Bin 0 -&gt; 120 bytes<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 tests/data/acpi/q35/DSDT.ivrs=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Bin 0 -&gt; 8306 bytes<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 tests/data/acpi/q35/DSDT.multi-bridge=C2=
=A0 =C2=A0 =C2=A0| Bin 0 -&gt; 8583 bytes<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 tests/data/acpi/q35/DSDT.xapic=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Bin 0 -&gt; 35652 bytes<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 tests/data/acpi/q35/FACP.xapic=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Bin 0 -&gt; 244 bytes<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 tests/data/acpi/q35/IVRS.ivrs=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Bin 0 -&gt; 104 bytes<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 tests/data/acpi/q35/SRAT.xapic=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Bin 0 -&gt; 5080 bytes<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 30 files changed, 672 insertions(+), 85 de=
letions(-)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 create mode 100644 include/hw/virtio/vhost=
-user-rng.h<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 create mode 100644 hw/virtio/vhost-user-rn=
g-pci.c<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 create mode 100644 hw/virtio/vhost-user-rn=
g.c<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 create mode 100644 docs/system/devices/vho=
st-user-rng.rst<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 create mode 100644 tests/data/acpi/q35/API=
C.xapic<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 create mode 100644 tests/data/acpi/q35/DMA=
R.dmar<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 create mode 100644 tests/data/acpi/q35/DSD=
T.ivrs<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 create mode 100644 tests/data/acpi/q35/DSD=
T.multi-bridge<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 create mode 100644 tests/data/acpi/q35/DSD=
T.xapic<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 create mode 100644 tests/data/acpi/q35/FAC=
P.xapic<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 create mode 100644 tests/data/acpi/q35/IVR=
S.ivrs<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 create mode 100644 tests/data/acpi/q35/SRA=
T.xapic<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; 32-bit printf errors:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ../hw/virtio/vhost-vdpa.c: In function &#39;vhost_vdpa_liste=
ner_skipped_section&#39;:<br>
&gt; &gt; &gt; ../hw/virtio/vhost-vdpa.c:55:22: error: format &#39;%lu&#39;=
 expects argument of type &#39;long<br>
&gt; &gt; &gt; unsigned int&#39;, but argument 2 has type &#39;uint64_t&#39=
; {aka &#39;long long unsigned int&#39;}<br>
&gt; &gt; &gt; [-Werror=3Dformat=3D]<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;=
RAM section out of device range (min=3D%lu, addr=3D%lu)&quot;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iova_min, section-&gt;offset_within_address_=
space);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~~~~~~~<br>
&gt; &gt; &gt; ../hw/virtio/vhost-vdpa.c:55:22: error: format &#39;%lu&#39;=
 expects argument of type &#39;long<br>
&gt; &gt; &gt; unsigned int&#39;, but argument 3 has type &#39;hwaddr&#39; =
{aka &#39;long long unsigned int&#39;}<br>
&gt; &gt; &gt; [-Werror=3Dformat=3D]<br>
&gt; &gt; &gt; ../hw/virtio/vhost-vdpa.c:62:22: error: format &#39;%lu&#39;=
 expects argument of type &#39;long<br>
&gt; &gt; &gt; unsigned int&#39;, but argument 2 has type &#39;uint64_t&#39=
; {aka &#39;long long unsigned int&#39;}<br>
&gt; &gt; &gt; [-Werror=3Dformat=3D]<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;=
RAM section out of device range (max=3D%lu, end addr=3D%lu)&quot;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iova_max, int128_get64(llend));<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~~~~~~~<br>
&gt; &gt; &gt; ../hw/virtio/vhost-vdpa.c:62:22: error: format &#39;%lu&#39;=
 expects argument of type &#39;long<br>
&gt; &gt; &gt; unsigned int&#39;, but argument 3 has type &#39;uint64_t&#39=
; {aka &#39;long long unsigned int&#39;}<br>
&gt; &gt; &gt; [-Werror=3Dformat=3D]<br>
&gt; &gt; &gt; cc1: all warnings being treated as errors<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Also fails s390x host testing:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ERROR:../tests/qtest/boot-sector.c:170:boot_sector_test: ass=
ertion failed (signature =3D=3D<br>
&gt; &gt; &gt; SIGNATURE): (0x00000000 =3D=3D 0x0000dead)<br>
&gt; &gt; &gt; ERROR qtest-i386/bios-tables-test - Bail out!<br>
&gt; &gt; &gt; ERROR:../tests/qtest/boot-sector.c:170:boot_sector_test: ass=
ertion failed (signature =3D=3D<br>
&gt; &gt; &gt; SIGNATURE): (0x00000000 =3D=3D 0x0000dead)<br>
&gt; &gt; &gt; Makefile.mtest:368: recipe for target &#39;run-test-44&#39; =
failed<br>
&gt; &gt; <br>
&gt; &gt; it might happen if VM is too slow<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0/* Wait at most 600 seconds ...<br>
&gt; &gt; Let me find s390 host and see if it&#39;s reproducable<br>
&gt; <br>
&gt; Micheal already asked Cornelia and me off-list whether it&#39;s reprod=
ucible,<br>
&gt; and it is. It&#39;s the new multif-bridge test that is hanging, but it=
 seems<br>
&gt; like this only uncovered a pre-existing problem: SeaBIOS does bail out=
 as<br>
&gt; soon as QEMU is started with &quot;-device pcie-root-port&quot; on a s=
390x host. I&#39;ve<br>
&gt; already enabled the serial debug in SeaBIOS and got this output:<br>
&gt; <br>
&gt; $ build/qemu-system-x86_64 -nographic -machine q35=C2=A0 -vga none=C2=
=A0 -device<br>
&gt; pcie-root-port -bios ~/bios.bin<br>
&gt; Changing serial settings was 0/0 now 3/0<br>
&gt; SeaBIOS (version rel-1.14.0-0-g155821a)<br>
&gt; BUILD: gcc: (GCC) 8.4.1 20200928 (Red Hat 8.4.1-1) binutils: version 2=
.30-93.el8<br>
&gt; No Xen hypervisor found.<br>
&gt; Running on QEMU (q35)<br>
&gt; Found QEMU fw_cfg<br>
&gt; QEMU fw_cfg DMA interface supported<br>
&gt; qemu/e820: addr 0x0000000000000000 len 0x0000000008000000 [RAM]<br>
&gt; Relocating init from 0x000d6400 to 0x07faa7a0 (size 88000)<br>
&gt; Moving pm_base to 0x600<br>
&gt; =3D=3D=3D PCI bus &amp; bridge init =3D=3D=3D<br>
&gt; PCI: pci_bios_init_bus_rec bus =3D 0x0<br>
&gt; PCI: pci_bios_init_bus_rec bdf =3D 0x10<br>
&gt; PCI: primary bus =3D 0x0<br>
&gt; PCI: secondary bus =3D 0xff -&gt; 0x1<br>
&gt; PCI: pci_bios_init_bus_rec bus =3D 0x1<br>
&gt; PCI: subordinate bus =3D 0x0 -&gt; 0x1<br>
&gt; =3D=3D=3D PCI device probing =3D=3D=3D<br>
&gt; Found 6 PCI devices (max PCI bus is 01)<br>
&gt; PCIe: using q35 mmconfig at 0xb0000000<br>
&gt; =3D=3D=3D PCI new allocation pass #1 =3D=3D=3D<br>
&gt; PCI: check devices<br>
&gt; PCI: QEMU resource reserve cap: size 10000000000000 type io<br>
&gt; PCI: secondary bus 1 size 10000000000000 type io<br>
&gt; PCI: secondary bus 1 size 00200000 type mem<br>
&gt; PCI: secondary bus 1 size 00200000 type prefmem<br>
&gt; =3D=3D=3D PCI new allocation pass #2 =3D=3D=3D<br>
&gt; PCI: out of I/O address space<br>
&gt; <br>
&gt; I also noticed that the problem did not occur on older versions of QEM=
U, so<br>
&gt; I just bisected and ended up with this commit here:<br>
&gt; <br>
&gt; e2a6290aab578b2170c1f5909fa556385dc0d820 is the first bad commit<br>
&gt; commit e2a6290aab578b2170c1f5909fa556385dc0d820<br>
&gt; Author: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel.apfelbaum@gmail.=
com" target=3D"_blank">marcel.apfelbaum@gmail.com</a>&gt;<br>
&gt; Date:=C2=A0 =C2=A0Mon Aug 2 12:00:57 2021 +0300<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0hw/pcie-root-port: Fix hotplug for PCI devices requ=
iring IO<br>
&gt; <br>
&gt; Seems like something goes wrong with setting up the IO space on big en=
dian<br>
&gt; hosts?<br></blockquote><div><br></div><div>Thank you for finding the i=
ssue! Indeed it was there from the start.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt;=C2=A0 Thomas<br>
<br>
Yep. The bug is older though, going back to when we first<br>
added the vendor specific capability.</blockquote><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Does this help?<br>
<br>
diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c<br>
index d1f902ee86..da34c8ebcd 100644<br>
--- a/hw/pci/pci_bridge.c<br>
+++ b/hw/pci/pci_bridge.c<br>
@@ -448,11 +448,11 @@ int pci_bridge_qemu_reserve_cap_init(PCIDevice *dev, =
int cap_offset,<br>
=C2=A0 =C2=A0 =C2=A0PCIBridgeQemuCap cap =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.len =3D cap_len,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D REDHAT_PCI_CAP_RE=
SOURCE_RESERVE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bus_res =3D res_reserve.bus,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .io =3D <a href=3D"http://res_re=
serve.io" rel=3D"noreferrer" target=3D"_blank">res_reserve.io</a>,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .mem =3D res_reserve.mem_non_pre=
f,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .mem_pref_32 =3D res_reserve.mem=
_pref_32,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .mem_pref_64 =3D res_reserve.mem=
_pref_64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bus_res =3D cpu_to_le32(res_res=
erve.bus),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .io =3D cpu_to_le64(<a href=3D"h=
ttp://res_reserve.io" rel=3D"noreferrer" target=3D"_blank">res_reserve.io</=
a>),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .mem =3D cpu_to_le32(res_reserve=
.mem_non_pref),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .mem_pref_32 =3D cpu_to_le32(res=
_reserve.mem_pref_32),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .mem_pref_64 =3D cpu_to_le64(res=
_reserve.mem_pref_64)<br>
=C2=A0 =C2=A0 =C2=A0};<br>
<br>
=C2=A0 =C2=A0 =C2=A0int offset =3D pci_add_capability(dev, PCI_CAP_ID_VNDR,=
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Marcel Apfelbaum &lt;<a h=
ref=3D"mailto:marcel.apfelbaum@gmail.com">marcel.apfelbaum@gmail.com</a>&gt=
;</div><div><br></div><div>Thanks,</div><div>Marcel</div><div>=C2=A0</div><=
/div></div>

--00000000000003147c05ceca8356--


