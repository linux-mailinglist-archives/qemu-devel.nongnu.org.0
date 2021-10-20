Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90B643471F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 10:41:38 +0200 (CEST)
Received: from localhost ([::1]:47762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md7AH-0003II-K4
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 04:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1md78N-0001d5-Cm
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:39:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1md78K-00049g-L2
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634719175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZIBxfjFsnaVnBMUvbDWAhLIpgQ4YpsxFbP1V/KFOz4=;
 b=NLRBYzKkc4l/t1N1HX5x9iBsPKUYgV/d4ZDFjpLVvVXLknEEvEmmOXlzaRT8AsJClBvM6A
 0+shblSruNm4hqPniWYWgC9dPd/zSZh49/xkdqyFh6quWC64nGknnLRw2BnTMfq723zrBx
 kEZtmhwl/+TYoudgq6xwHB/Awyv9DjI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-jSbSzscENVuregqclYpHdQ-1; Wed, 20 Oct 2021 04:39:32 -0400
X-MC-Unique: jSbSzscENVuregqclYpHdQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l39-20020a05600c1d2700b0030dba1dc6eeso2718665wms.7
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 01:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZdxLIYuD0negc8Cdt3gYbdHPi2dL4qYHorx/j5rHqNM=;
 b=o0d+8PbdZiKRVTyKdnhj92YzMC/o8N00yXrMyMqKgrBrqBF7HHeXKD0Mj18XyuTc89
 YvCtq0L6VE8Q1jJ6IEGuDYxbqObo9H4uOPhdmmqLrhPt75Ku9scMwkMjZc69mvikqeTC
 /tQxh37kj00eoJZlP43BSvVhCtTRvuj9WvqA0FF37O6eVhpFHvh3rIqVwP8FO8AQSFo5
 n4QivTlLWkM9zh570gXL6N1MdgTg26FWdAOK4J0iiRsgzIzjSYUv7YOnSpjys5KGGWYD
 N7IE6s+lbvPKVlyvVawbhAxXOkcZyX0f0kyQRaa9BGMGa8ycdgDY2iltOeK8svVnCgre
 UnaQ==
X-Gm-Message-State: AOAM533PdjX5tb8ewTVXj+CljxxLagQgoqh4kW7hR7bYNxXpPj8ABq+f
 cMFxba3X45EjPJ/SfGmih+JYxnMBfJerhf0nK1gZaIWmz0iJG/bdWXQvIWgnzcBtxZ/5RbTbRXo
 rwXackTVGcI+sTMQ=
X-Received: by 2002:adf:a48e:: with SMTP id g14mr50629652wrb.11.1634719171088; 
 Wed, 20 Oct 2021 01:39:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQe4lDweqDdMJRVwNEztjK0cArS0BXk237qXoz4AxzBIXw4tiM0Xf45ArS2c0yK1L7f1ERfg==
X-Received: by 2002:adf:a48e:: with SMTP id g14mr50629626wrb.11.1634719170855; 
 Wed, 20 Oct 2021 01:39:30 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id g3sm1559518wri.45.2021.10.20.01.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 01:39:30 -0700 (PDT)
Date: Wed, 20 Oct 2021 10:39:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL 00/29] pc,pci,virtio: features, fixes
Message-ID: <20211020103929.5cc1fb32@redhat.com>
In-Reply-To: <4cc1b92e-a3f0-bab9-6e71-112ef3fb13a1@linaro.org>
References: <20211019111923.679826-1-mst@redhat.com>
 <4cc1b92e-a3f0-bab9-6e71-112ef3fb13a1@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Oct 2021 11:38:08 -0700
Richard Henderson <richard.henderson@linaro.org> wrote:

> On 10/19/21 4:19 AM, Michael S. Tsirkin wrote:
> > The following changes since commit 9c050b661d3a43dfe2fd44106e559b39706d=
1296:
> >=20
> >    Merge remote-tracking branch 'remotes/philmd/tags/mips-20211018' int=
o staging (2021-10-18 09:16:51 -0700)
> >=20
> > are available in the Git repository at:
> >=20
> >    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >=20
> > for you to fetch changes up to bf2dd99b7d536cdba157fd6687810ce7b8340ccc=
:
> >=20
> >    failover: fix a regression introduced by JSON'ification of -device (=
2021-10-19 07:15:34 -0400)
> >=20
> > ----------------------------------------------------------------
> > pc,pci,virtio: features, fixes
> >=20
> > vhost user rng
> > Fixes, cleanups all over the place.
> >=20
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >=20
> > ----------------------------------------------------------------
> > Ani Sinha (3):
> >        tests/acpi/bios-tables-test: add and allow changes to a new q35 =
DSDT table blob
> >        tests/acpi/pcihp: add unit tests for hotplug on multifunction br=
idges for q35
> >        tests/acpi/bios-tables-test: update DSDT blob for multifunction =
bridge test
> >=20
> > David Hildenbrand (1):
> >        libvhost-user: fix VHOST_USER_REM_MEM_REG skipping mmap_addr
> >=20
> > Eric Auger (2):
> >        virtio-iommu: Remove the non transitional name
> >        virtio-iommu: Drop base_name and change generic_name
> >=20
> > Eugenio P=C3=A9rez (3):
> >        vdpa: Skip protected ram IOMMU mappings
> >        vdpa: Add vhost_vdpa_section_end
> >        vdpa: Check for iova range at mappings changes
> >=20
> > Igor Mammedov (15):
> >        tests: acpi: dump table with failed checksum
> >        tests: qtest: add qtest_has_accel() to check if tested binary su=
pports accelerator
> >        tests: acpi: whitelist expected tables for acpi/q35/xapic testca=
se
> >        tests: acpi: q35: test for x2APIC entries in SRAT
> >        tests: acpi: update expected tables blobs
> >        tests: acpi: whitelist new expected table tests/data/acpi/q35/DM=
AR.dmar
> >        tests: acpi: add testcase for intel_iommu (DMAR table)
> >        tests: acpi: add expected blob for DMAR table
> >        tests: acpi: whitelist expected blobs for new acpi/q35/ivrs test=
case
> >        tests: acpi: add testcase for amd-iommu (IVRS table)
> >        tests: acpi: update expected blobs
> >        tests: acpi: arm/virt: drop redundant test_acpi_one() in test_ac=
pi_virt_tcg()
> >        tests: arm-cpu-features: use qtest_has_kvm() API
> >        tests: migration-test: use qtest_has_accel() API
> >        tests: bios-tables-test: use qtest_has_accel() API to register T=
CG only tests
> >=20
> > Laurent Vivier (1):
> >        failover: fix a regression introduced by JSON'ification of -devi=
ce
> >=20
> > Mathieu Poirier (3):
> >        vhost-user-rng: Add vhost-user-rng implementation
> >        vhost-user-rng-pci: Add vhost-user-rng-pci implementation
> >        docs: Add documentation for vhost based RNG implementation
> >=20
> > Xueming Li (1):
> >        vhost-user: fix duplicated notifier MR init
> >=20
> >   include/hw/virtio/vhost-user-rng.h        |  33 ++++
> >   include/hw/virtio/vhost-vdpa.h            |   2 +
> >   include/hw/virtio/virtio-iommu.h          |   2 +-
> >   tests/qtest/libqos/libqtest.h             |   8 +
> >   hw/net/virtio-net.c                       |  24 ++-
> >   hw/virtio/vhost-user-rng-pci.c            |  79 ++++++++
> >   hw/virtio/vhost-user-rng.c                | 289 +++++++++++++++++++++=
+++++++++
> >   hw/virtio/vhost-user.c                    |   5 +-
> >   hw/virtio/vhost-vdpa.c                    |  81 ++++++---
> >   hw/virtio/virtio-iommu-pci.c              |   4 +-
> >   subprojects/libvhost-user/libvhost-user.c |   1 +
> >   tests/qtest/acpi-utils.c                  |  14 ++
> >   tests/qtest/arm-cpu-features.c            |  29 +--
> >   tests/qtest/bios-tables-test.c            |  90 ++++++++--
> >   tests/qtest/libqtest.c                    |  27 +++
> >   tests/qtest/migration-test.c              |  15 +-
> >   docs/system/device-emulation.rst          |   1 +
> >   docs/system/devices/vhost-user-rng.rst    |  39 ++++
> >   hw/virtio/Kconfig                         |   5 +
> >   hw/virtio/meson.build                     |   2 +
> >   hw/virtio/trace-events                    |   1 +
> >   meson.build                               |   6 +
> >   tests/data/acpi/q35/APIC.xapic            | Bin 0 -> 2686 bytes
> >   tests/data/acpi/q35/DMAR.dmar             | Bin 0 -> 120 bytes
> >   tests/data/acpi/q35/DSDT.ivrs             | Bin 0 -> 8306 bytes
> >   tests/data/acpi/q35/DSDT.multi-bridge     | Bin 0 -> 8583 bytes
> >   tests/data/acpi/q35/DSDT.xapic            | Bin 0 -> 35652 bytes
> >   tests/data/acpi/q35/FACP.xapic            | Bin 0 -> 244 bytes
> >   tests/data/acpi/q35/IVRS.ivrs             | Bin 0 -> 104 bytes
> >   tests/data/acpi/q35/SRAT.xapic            | Bin 0 -> 5080 bytes
> >   30 files changed, 672 insertions(+), 85 deletions(-)
> >   create mode 100644 include/hw/virtio/vhost-user-rng.h
> >   create mode 100644 hw/virtio/vhost-user-rng-pci.c
> >   create mode 100644 hw/virtio/vhost-user-rng.c
> >   create mode 100644 docs/system/devices/vhost-user-rng.rst
> >   create mode 100644 tests/data/acpi/q35/APIC.xapic
> >   create mode 100644 tests/data/acpi/q35/DMAR.dmar
> >   create mode 100644 tests/data/acpi/q35/DSDT.ivrs
> >   create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
> >   create mode 100644 tests/data/acpi/q35/DSDT.xapic
> >   create mode 100644 tests/data/acpi/q35/FACP.xapic
> >   create mode 100644 tests/data/acpi/q35/IVRS.ivrs
> >   create mode 100644 tests/data/acpi/q35/SRAT.xapic =20
>=20
> 32-bit printf errors:
>=20
> ../hw/virtio/vhost-vdpa.c: In function 'vhost_vdpa_listener_skipped_secti=
on':
> ../hw/virtio/vhost-vdpa.c:55:22: error: format '%lu' expects argument of =
type 'long=20
> unsigned int', but argument 2 has type 'uint64_t' {aka 'long long unsigne=
d int'}=20
> [-Werror=3Dformat=3D]
>           error_report("RAM section out of device range (min=3D%lu, addr=
=3D%lu)",
>                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>                        iova_min, section->offset_within_address_space);
>                        ~~~~~~~~
> ../hw/virtio/vhost-vdpa.c:55:22: error: format '%lu' expects argument of =
type 'long=20
> unsigned int', but argument 3 has type 'hwaddr' {aka 'long long unsigned =
int'}=20
> [-Werror=3Dformat=3D]
> ../hw/virtio/vhost-vdpa.c:62:22: error: format '%lu' expects argument of =
type 'long=20
> unsigned int', but argument 2 has type 'uint64_t' {aka 'long long unsigne=
d int'}=20
> [-Werror=3Dformat=3D]
>           error_report("RAM section out of device range (max=3D%lu, end a=
ddr=3D%lu)",
>                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
>                        iova_max, int128_get64(llend));
>                        ~~~~~~~~
> ../hw/virtio/vhost-vdpa.c:62:22: error: format '%lu' expects argument of =
type 'long=20
> unsigned int', but argument 3 has type 'uint64_t' {aka 'long long unsigne=
d int'}=20
> [-Werror=3Dformat=3D]
> cc1: all warnings being treated as errors
>
=20
>
> Also fails s390x host testing:
>=20
>=20
> ERROR:../tests/qtest/boot-sector.c:170:boot_sector_test: assertion failed=
 (signature =3D=3D=20
> SIGNATURE): (0x00000000 =3D=3D 0x0000dead)
> ERROR qtest-i386/bios-tables-test - Bail out!=20
> ERROR:../tests/qtest/boot-sector.c:170:boot_sector_test: assertion failed=
 (signature =3D=3D=20
> SIGNATURE): (0x00000000 =3D=3D 0x0000dead)
> Makefile.mtest:368: recipe for target 'run-test-44' failed

it might happen if VM is too slow
   /* Wait at most 600 seconds ...
=20
Let me find s390 host and see if it's reproducable

> r~
>=20


