Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9331D13965F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 17:30:17 +0100 (CET)
Received: from localhost ([::1]:52606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir2bY-0008RK-Lk
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 11:30:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49738)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1ir2Zn-0007gd-Ne
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 11:28:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1ir2Zl-0004SZ-Cu
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 11:28:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33933
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1ir2Zl-0004RE-8d
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 11:28:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578932903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Teu5pbkjdAz4BmeDIWf/6d/0o2Ectv5SGWU9UAtgFKg=;
 b=exhe6g68YQhn+q0cj0qB6cAnZkDJqKAyWgQqvI3UF3mtKOzYKJM+Zs5/XwqKSPKainVf2v
 vSrJwp1XmOYfZVopH1utuPv8Wgdit+xs54bYGbEVgl2XW0wDczUrYQvTOlEuP096yepQ/h
 iXUdxewYhHFLkwSd06MG4y02B/FTR4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-vmwDEuy7PrKWjr8BesJP5w-1; Mon, 13 Jan 2020 11:28:22 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CB0C107AD88;
 Mon, 13 Jan 2020 16:28:21 +0000 (UTC)
Received: from w520.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22B9D50A8F;
 Mon, 13 Jan 2020 16:28:21 +0000 (UTC)
Date: Mon, 13 Jan 2020 09:28:20 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: yurij <lnkgyv@gmail.com>
Subject: Re: PCIe device paththrough via vfio issue
Message-ID: <20200113092820.7af3b10c@w520.home>
In-Reply-To: <9ebac151-0a9b-3f64-ccd8-0709088fa2b3@gmail.com>
References: <9ebac151-0a9b-3f64-ccd8-0709088fa2b3@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: vmwDEuy7PrKWjr8BesJP5w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Jan 2020 18:49:21 +0300
yurij <lnkgyv@gmail.com> wrote:

> Hello everybody!
>=20
> I have a specific PCIe device (sorry, but I can't tell about what is it=
=20
> and what it does) but PCI configuration space consists of 4 BARs (lspci=
=20
> output brief):
>=20
> lspci -s 84:00.00 -vvv
>=20
> . . .
> Region 0: Memory at fa000000 (64-bit, non-prefetchable) [size=3D16M]
> =09Region 2: Memory at fb001000 (32-bit, non-prefetchable) [size=3D4K]
> =09Region 3: Memory at fb000000 (32-bit, non-prefetchable) [size=3D4K]
> =09Region 4: Memory at f9000000 (64-bit, non-prefetchable) [size=3D16M]
> . . .
> Kernel driver in use: vfio-pci
> . . .
>=20
> BAR0 merged with BAR1, BAR4 merged with BAR5 so they are 64 bit width.
>=20
> I put this PCIe device in virtual machine via vfio:
>=20
> -device vfio-pci,host=3D84:00.0,id=3Dhostdev0,bus=3Dpci.6,addr=3D0x0
>=20
> Virtual machine successfully boot. PCI configuration space in virtual=20
> environment looks OK (lspci output brief):
>=20
> lspci -s 06:00.0 -vvv
>=20
> . . .
> Region 0: Memory at f8000000 (64-bit, non-prefetchable) [size=3D16M]
> =09Region 2: Memory at fa000000 (32-bit, non-prefetchable) [size=3D4K]
> =09Region 3: Memory at fa001000 (32-bit, non-prefetchable) [size=3D4K]
> =09Region 4: Memory at f9000000 (64-bit, non-prefetchable) [size=3D16M]
> . . .
> Kernel driver in use: custom_driver
>=20
> BAR0 merged with BAR1 and BAR4 merged with BAR5 and so they are also 64=
=20
> bit width.
>=20
> The main problem in 4K HOLE in REGION 0 in virtual environment. So some=
=20
> device features don't work.
>=20
> I have enabled iommu trace in host system (trace_event=3Diommu) and=20
> display all events (for i in $(find=20
> /sys/kernel/debug/tracing/events/iommu/ -name enable);do echo 1 > $i;=20
> done). I saw next events during virtual machine booting:
>=20
> # cat /sys/kernel/debug/tracing/trace
> . . .
>         CPU 0/KVM-3046  [051] .... 63113.338894: map: IOMMU:=20
> iova=3D0x00000000f8000000 paddr=3D0x00000000fa000000 size=3D24576
>         CPU 0/KVM-3046  [051] .... 63113.339177: map: IOMMU:=20
> iova=3D0x00000000f8007000 paddr=3D0x00000000fa007000 size=3D16748544
>         CPU 0/KVM-3046  [051] .... 63113.339444: map: IOMMU:=20
> iova=3D0x00000000fa000000 paddr=3D0x00000000fb001000 size=3D4096
>         CPU 0/KVM-3046  [051] .... 63113.339697: map: IOMMU:=20
> iova=3D0x00000000fa001000 paddr=3D0x00000000fb000000 size=3D4096
>         CPU 0/KVM-3046  [051] .... 63113.340209: map: IOMMU:=20
> iova=3D0x00000000f9000000 paddr=3D0x00000000f9000000 size=3D16777216
> . . .
>=20
> I have enabled qemu trace(-trace events=3D/root/qemu/trace_events). Trace=
=20
> file consists of the falling functions:
> vfio_region_mmap
> vfio_get_dev_region
> vfio_pci_size_rom
> vfio_pci_read_config
> vfio_pci_write_config
> vfio_iommu_map_notify
> vfio_listener_region_add_iommu
> vfio_listener_region_add_ram
>=20
> Some important brief from qemu trace:
> . . .
> =D1=8F=D0=BD=D0=B2 13 18:17:24 VM qemu-system-x86_64[7131]: vfio_region_m=
map Region=20
> 0000:84:00.0 BAR 0 mmaps[0] [0x0 - 0xffffff]
> =D1=8F=D0=BD=D0=B2 13 18:17:24 VM qemu-system-x86_64[7131]: vfio_region_m=
map Region=20
> 0000:84:00.0 BAR 2 mmaps[0] [0x0 - 0xfff]
> =D1=8F=D0=BD=D0=B2 13 18:17:24 VM qemu-system-x86_64[7131]: vfio_region_m=
map Region=20
> 0000:84:00.0 BAR 3 mmaps[0] [0x0 - 0xfff]
> =D1=8F=D0=BD=D0=B2 13 18:17:24 VM qemu-system-x86_64[7131]: vfio_region_m=
map Region=20
> 0000:84:00.0 BAR 4 mmaps[0] [0x0 - 0xffffff]
> . . .
> =D1=8F=D0=BD=D0=B2 13 18:17:37 VM qemu-system-x86_64[7131]:=20
> vfio_listener_region_add_ram region_add [ram] 0xf8000000 - 0xf8005fff=20
> [0x7f691e800000]
> =D1=8F=D0=BD=D0=B2 13 18:17:37 VM qemu-system-x86_64[7131]:=20
> vfio_listener_region_add_ram region_add [ram] 0xf8007000 - 0xf8ffffff=20
> [0x7f691e807000]
> =D1=8F=D0=BD=D0=B2 13 18:17:37 VM qemu-system-x86_64[7131]:=20
> vfio_listener_region_add_ram region_add [ram] 0xfa000000 - 0xfa000fff=20
> [0x7f6b5de37000]
> =D1=8F=D0=BD=D0=B2 13 18:17:37 VM qemu-system-x86_64[7131]:=20
> vfio_listener_region_add_ram region_add [ram] 0xfa001000 - 0xfa001fff=20
> [0x7f6b58004000]
> =D1=8F=D0=BD=D0=B2 13 18:17:37 VM qemu-system-x86_64[7131]:=20
> vfio_listener_region_add_ram region_add [ram] 0xf9000000 - 0xf9ffffff=20
> [0x7f691d800000]
>=20
> I use qemu 4.0.0 which I rebuild for tracing support=20
> (--enable-trace-backends=3Dsyslog).
>=20
> Please, help me solve this issue. Thank you!

Something has probably created a QEMU MemoryRegion overlapping the BAR,
we do this for quirks where we want to intercept a range of MMIO for
emulation, but the offset 0x6000 on BAR0 doesn't sound familiar to me.
Run the VM with a monitor and see if 'info mtree' provides any info on
the handling of that overlap.  Thanks,

Alex


