Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981013AD90E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:37:11 +0200 (CEST)
Received: from localhost ([::1]:35964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXPa-00028X-IF
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1luXLI-0006bT-Hc; Sat, 19 Jun 2021 05:32:44 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:60451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1luXLE-0000CM-82; Sat, 19 Jun 2021 05:32:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G6Vv04Mk6z9sSn; Sat, 19 Jun 2021 19:32:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624095148;
 bh=F1hBrKdMeE6lT8A+0RvgH619JuaPJu4Qb9iCf0E3pv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NBMB98Etn4Nn7q+3JAVC1OJ2k6cSQI8ClCmPnbdsM0DDO96yQeO6v8M6CjaVvYmDz
 oki4AeyDcSKcSsVk8SY4duqw4Wb6KYhpDlhrluPJwrgr80CiE2wNtL9+5arE87Ej1/
 VYs46PQsNGos7uNmEv3xEbMQaFooKHtFws1rY2G0=
Date: Sat, 19 Jun 2021 19:28:57 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v21] spapr: Implement Open Firmware client interface
Message-ID: <YM242SrxRv+iPJvZ@yekko>
References: <20210615070612.22679-1-aik@ozlabs.ru>
 <8987bd7c-dfe1-cb73-e388-ae26ed5a69@eik.bme.hu>
 <1200c803-a397-78cf-2180-5b21dc0839f1@ozlabs.ru>
 <7c7b75a1-d849-ca66-75d3-f9919366b95d@eik.bme.hu>
 <274ae416-3af0-65f3-c30c-0681ad9716a1@ozlabs.ru>
 <33b662dc-6a97-6e61-c17-c21a4a44d8fb@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+Xrm+0fDmim9pB0p"
Content-Disposition: inline
In-Reply-To: <33b662dc-6a97-6e61-c17-c21a4a44d8fb@eik.bme.hu>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+Xrm+0fDmim9pB0p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 11:16:19AM +0200, BALATON Zoltan wrote:
> On Thu, 17 Jun 2021, Alexey Kardashevskiy wrote:
> > On 16/06/2021 20:34, BALATON Zoltan wrote:
> > > On Wed, 16 Jun 2021, Alexey Kardashevskiy wrote:
> > > > On 6/15/21 20:29, BALATON Zoltan wrote:
> > > > > On Tue, 15 Jun 2021, Alexey Kardashevskiy wrote:
> > > > > > The PAPR platform describes an OS environment that's presented =
by
> > > > > > a combination of a hypervisor and firmware. The features it spe=
cifies
> > > > > > require collaboration between the firmware and the hypervisor.
> > > > > >=20
> > > > > > Since the beginning, the runtime component of the firmware (RTA=
S) has
> > > > > > been implemented as a 20 byte shim which simply forwards it to
> > > > > > a hypercall implemented in qemu. The boot time firmware compone=
nt is
> > > > > > SLOF - but a build that's specific to qemu, and has always need=
ed to be
> > > > > > updated in sync with it. Even though we've managed to limit the=
 amount
> > > > > > of runtime communication we need between qemu and SLOF, there's=
 some,
> > > > > > and it has become increasingly awkward to handle as we've imple=
mented
> > > > > > new features.
> > > > > >=20
> > > > > > This implements a boot time OF client interface (CI) which is
> > > > > > enabled by a new "x-vof" pseries machine option (stands
> > > > > > for "Virtual Open
> > > > > > Firmware). When enabled, QEMU implements the custom H_OF_CLIENT=
 hcall
> > > > > > which implements Open Firmware Client Interface (OF CI). This a=
llows
> > > > > > using a smaller stateless firmware which does not have to manage
> > > > > > the device tree.
> > > > > >=20
> > > > > > The new "vof.bin" firmware image is included with source code u=
nder
> > > > > > pc-bios/. It also includes RTAS blob.
> > > > > >=20
> > > > > > This implements a handful of CI methods just to get -kernel/-in=
itrd
> > > > > > working. In particular, this implements the device tree fetchin=
g and
> > > > > > simple memory allocator - "claim" (an OF CI memory
> > > > > > allocator) and updates
> > > > > > "/memory@0/available" to report the client about available memo=
ry.
> > > > > >=20
> > > > > > This implements changing some device tree properties which we k=
now how
> > > > > > to deal with, the rest is ignored. To allow changes, this skips
> > > > > > fdt_pack() when x-vof=3Don as not packing the blob leaves some =
room for
> > > > > > appending.
> > > > > >=20
> > > > > > In absence of SLOF, this assigns phandles to device tree nodes =
to make
> > > > > > device tree traversing work.
> > > > > >=20
> > > > > > When x-vof=3Don, this adds "/chosen" every time QEMU (re)builds=
 a tree.
> > > > > >=20
> > > > > > This adds basic instances support which are managed by a hash m=
ap
> > > > > > ihandle -> [phandle].
> > > > > >=20
> > > > > > Before the guest started, the used memory is:
> > > > > > 0..e60 - the initial firmware
> > > > > > 8000..10000 - stack
> > > > > > 400000.. - kernel
> > > > > > 3ea0000.. - initramdisk
> > > > > >=20
> > > > > > This OF CI does not implement "interpret".
> > > > > >=20
> > > > > > Unlike SLOF, this does not format uninitialized nvram. Instead,=
 this
> > > > > > includes a disk image with pre-formatted nvram.
> > > > > >=20
> > > > > > With this basic support, this can only boot into kernel directl=
y.
> > > > > > However this is just enough for the petitboot kernel and initra=
dmdisk to
> > > > > > boot from any possible source. Note this requires
> > > > > > reasonably recent guest
> > > > > > kernel with:
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3Ddf5be5be8735
> > > > > > The immediate benefit is much faster booting time which
> > > > > > especially
> > > > > > crucial with fully emulated early CPU bring up environments. Al=
so this
> > > > > > may come handy when/if GRUB-in-the-userspace sees light of the =
day.
> > > > > >=20
> > > > > > This separates VOF and sPAPR in a hope that VOF bits may be reu=
sed by
> > > > > > other POWERPC boards which do not support pSeries.
> > > > > >=20
> > > > > > This make VOF optional, it is disabled by default, add --enable=
-vof
> > > > > > to ./configure to enable it.
> > > > > >=20
> > > > > > This assumes potential support for booting from QEMU backends
> > > > > > such as blockdev or netdev without devices/drivers used.
> > > > > >=20
> > > > > > Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > > > > > ---
> > > > > >=20
> > > > > > The example command line is:
> > > > > >=20
> > > > > > /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc6=
4 \
> > > > > > -nodefaults \
> > > > > > -chardev stdio,id=3DSTDIO0,signal=3Doff,mux=3Don \
> > > > > > -device spapr-vty,id=3Dsvty0,reg=3D0x71000110,chardev=3DSTDIO0 \
> > > > > > -mon id=3DMON0,chardev=3DSTDIO0,mode=3Dreadline \
> > > > > > -nographic \
> > > > > > -vga none \
> > > > > > -enable-kvm \
> > > > > > -m 8G \
> > > > > > -machine pseries,x-vof=3Don,cap-cfpc=3Dbroken,cap-sbbc=3Dbroken=
,cap-ibs=3Dbroken,cap-ccf-assist=3Doff
> > > > > > \
> > > > > > -kernel pbuild/kernel-le-guest/vmlinux \
> > > > > > -initrd pb/rootfs.cpio.xz \
> > > > > > -drive id=3DDRIVE0,if=3Dnone,file=3D./p/qemu-killslof/pc-bios/v=
of-nvram.bin,format=3Draw
> > > > > > \
> > > > > > -global spapr-nvram.drive=3DDRIVE0 \
> > > > > > -snapshot \
> > > > > > -smp 8,threads=3D8 \
> > > > > > -L /home/aik/t/qemu-ppc64-bios/ \
> > > > > > -trace events=3Dqemu_trace_events \
> > > > > > -d guest_errors \
> > > > > > -chardev socket,id=3DSOCKET0,server,nowait,path=3Dqemu.mon.tmux=
26 \
> > > > > > -mon chardev=3DSOCKET0,mode=3Dcontrol
> > > > >=20
> > > > > I haven't looked at it in detail yet, just some quick
> > > > > comments I have on first skim through.
> > > > >=20
> > > > > > ---
> > > > > > Changes:
> > > > > > v21:
> > > > > > * s/ld/ldz/ in entry.S
> > > > >=20
> > > > > Typo? Has this become lwz?
> > > >=20
> > > > Yup, lwz.
> > > >=20
> > > > >=20
> > > > > > * moved CONFIG_VOF from
> > > > > > default-configs/devices/ppc64-softmmu.mak to Kconfig
> > > > > > * made CONFIG_VOF optional
> > > > >=20
> > > > > This won't work for pegasos2, see below.
> > > > >=20
> > > > > > * s/l.lds/vof.lds/
> > > > > > * force 32 BE in spapr_machine_reset() instead of the firmware
> > > > > > * added checks for non-null methods of VofMachineIfClass
> > > > > > * moved OF_STACK_SIZE to vof.h, renamed to VOF_...,
> > > > > > added a better comment
> > > > > > * added=A0 path_offset wrapper for handling mixed case for addr=
esses
> > > > > > after "@" in node names
> > > > > > * changed getprop() to check for actual "name" property in the =
fdt
> > > > > > * moved VOF_MEM_READ/VOF_MEM_WRITE to vof.h for sharing
> > > > > > as (unlike similar
> > > > > > rtas_ld/ldl_be_*) they return error codes
> > > > > > * VOF_MEM_READ uses now address_space_read (it was
> > > > > > address_space_read_full
> > > > > > before, not sure why)
> > > > > [...]
> > > > > > ---
> > > > > > configure=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0 =
9 +
> > > > > > pc-bios/vof/Makefile=A0=A0=A0 |=A0=A0 23 +
> > > > > > include/hw/ppc/spapr.h=A0 |=A0=A0 25 +-
> > > > > > include/hw/ppc/vof.h=A0=A0=A0 |=A0=A0 55 ++
> > > > > > pc-bios/vof/vof.h=A0=A0=A0=A0=A0=A0 |=A0=A0 43 ++
> > > > > > hw/ppc/spapr.c=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 87 +++-
> > > > > > hw/ppc/spapr_hcall.c=A0=A0=A0 |=A0=A0 29 +-
> > > > > > hw/ppc/spapr_vof.c=A0=A0=A0=A0=A0 |=A0 153 ++++++
> > > > > > hw/ppc/vof.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 1052 ++++++++++=
+++++++++++++++++++++++++++++
> > > > > > pc-bios/vof/bootmem.c=A0=A0 |=A0=A0 14 +
> > > > > > pc-bios/vof/ci.c=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 91 ++++
> > > > > > pc-bios/vof/libc.c=A0=A0=A0=A0=A0 |=A0=A0 92 ++++
> > > > > > pc-bios/vof/main.c=A0=A0=A0=A0=A0 |=A0=A0 21 +
> > > > > > tests/qtest/rtas-test.c |=A0=A0 17 +-
> > > > > > MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 12 +
> > > > > > hw/ppc/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0 3 +
> > > > > > hw/ppc/meson.build=A0=A0=A0=A0=A0 |=A0=A0=A0 3 +
> > > > > > hw/ppc/trace-events=A0=A0=A0=A0 |=A0=A0 24 +
> > > > > > meson.build=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0 1 +
> > > > > > pc-bios/README=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0 2 +
> > > > > > pc-bios/vof-nvram.bin=A0=A0 |=A0 Bin 0 -> 16384 bytes
> > > > > > pc-bios/vof.bin=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 Bin 0 -> 3784 bytes
> > > > > > pc-bios/vof/entry.S=A0=A0=A0=A0 |=A0=A0 49 ++
> > > > > > pc-bios/vof/vof.lds=A0=A0=A0=A0 |=A0=A0 48 ++
> > > > > > 24 files changed, 1840 insertions(+), 13 deletions(-)
> > > > > > create mode 100644 pc-bios/vof/Makefile
> > > > > > create mode 100644 include/hw/ppc/vof.h
> > > > > > create mode 100644 pc-bios/vof/vof.h
> > > > > > create mode 100644 hw/ppc/spapr_vof.c
> > > > > > create mode 100644 hw/ppc/vof.c
> > > > > > create mode 100644 pc-bios/vof/bootmem.c
> > > > > > create mode 100644 pc-bios/vof/ci.c
> > > > > > create mode 100644 pc-bios/vof/libc.c
> > > > > > create mode 100644 pc-bios/vof/main.c
> > > > > > create mode 100644 pc-bios/vof-nvram.bin
> > > > > > create mode 100755 pc-bios/vof.bin
> > > > > > create mode 100644 pc-bios/vof/entry.S
> > > > > > create mode 100644 pc-bios/vof/vof.lds
> > > > > >=20
> [...]
> > > > > > diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
> > > > > > new file mode 100644
> > > > > > index 000000000000..65ca2fed0d41
> > > > > > --- /dev/null
> > > > > > +++ b/include/hw/ppc/vof.h
> > > > > > @@ -0,0 +1,55 @@
> > > > > > +/*
> > > > > > + * Virtual Open Firmware
> > > > > > + *
> > > > > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > > > > + */
> > > > > > +#ifndef HW_VOF_H
> > > > > > +#define HW_VOF_H
> > > > > > +
> > > > > > +typedef struct Vof {
> > > > > > +=A0=A0=A0 uint64_t top_addr; /* copied from rma_size */
> > > > > > +=A0=A0=A0 GArray *claimed; /* array of SpaprOfClaimed */
> > > > > > +=A0=A0=A0 uint64_t claimed_base;
> > > > > > +=A0=A0=A0 GHashTable *of_instances; /* ihandle -> SpaprOfInsta=
nce */
> > > > > > +=A0=A0=A0 uint32_t of_instance_last;
> > > > > > +=A0=A0=A0 char *bootargs;
> > > > > > +=A0=A0=A0 long fw_size;
> > > > > > +} Vof;
> > > > > > +
> > > > > > +int vof_client_call(MachineState *ms, Vof *vof, void *fdt,
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 targ=
et_ulong args_real);
> > > > > > +uint64_t vof_claim(Vof *vof, uint64_t virt, uint64_t
> > > > > > size, uint64_t align);
> > > > > > +void vof_init(Vof *vof, uint64_t top_addr, Error **errp);
> > > > > > +void vof_cleanup(Vof *vof);
> > > > > > +void vof_build_dt(void *fdt, Vof *vof);
> > > > > > +uint32_t vof_client_open_store(void *fdt, Vof *vof,
> > > > > > const char *nodename,
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const char *prop, const char *path);
> > > > > > +
> > > > > > +#define TYPE_VOF_MACHINE_IF "vof-machine-if"
> > > > > > +
> > > > > > +typedef struct VofMachineIfClass VofMachineIfClass;
> > > > > > +DECLARE_CLASS_CHECKERS(VofMachineIfClass, VOF_MACHINE,
> > > > > > TYPE_VOF_MACHINE_IF)
> > > > > > +
> > > > > > +struct VofMachineIfClass {
> > > > > > +=A0=A0=A0 InterfaceClass parent;
> > > > > > +=A0=A0=A0 target_ulong
> > > > > > (*client_architecture_support)(MachineState *ms,
> > > > > > CPUState *cs,
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 target_ulong vec);
> > > > > > +=A0=A0=A0 void (*quiesce)(MachineState *ms);
> > > > > > +=A0=A0=A0 bool (*setprop)(MachineState *ms, const char *path,
> > > > > > const char *propname,
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 void=
 *val, int vallen);
> > > > > > +};
> > > > > > +
> > > > > > +/*
> > > > > > + * Initial stack size is from
> > > > > > + * https://www.devicetree.org/open-firmware/bindings/ppc/relea=
se/ppc-2_1.html
> > > > > > + */
> > > > > > +#define VOF_STACK_SIZE=A0=A0=A0=A0=A0=A0 0x8000
> > > > >=20
> > > > > Maybe also add a define for RTAS_SIZE here? We'll need to
> > > > > put that in the device tree but it depends on the rtas shim
> > > > > size that's part of VOF so it should be defined here instead
> > > > > of hardcoding it in boards that use VOF so it can be updated
> > > > > later at one place if needed.
> > > >=20
> > > > This is rtas-size for pseries:
> > > >=20
> > > > _FDT(fdt_setprop_cell(fdt, rtas, "rtas-size", RTAS_ERROR_LOG_MAX +
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 ms->smp.max_cpus * sizeof(uint64_t)*2 + si=
zeof(uint64_t)));
> > > >=20
> > > > =3D> depends on cpus =3D> depends on the command line.
> > > >=20
> > > >=20
> > > > RTAS_SIZE is not used by anything in pseries anymore, I'll send
> > > > a patch to ditch it.
> > >=20
> > > I mean you need to have at least the size of code in
> > > pc-bios/vof/entry.S hv_rtas where also hv_rtas_size is defined but
> > > that value is not available in QEMU where one needs to add it to the
> > > device tree. So a define for that should be here in vof.h. Currently
> > > I've counted instructions and have
> > >=20
> > >  =A0=A0=A0 qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-size", 20);
> > >=20
> > > in pegasos2.c but that 20 should be some VOF_RTAS_SIZE instead that
> > > you define corresponding to hv_rtas_size. You'll probably need the
> > > same even after changing above rtas size calculation in spapr
> > > because client has to allocate memory for instantiate-rtas.
> >=20
> >=20
> > Ah fair point. I do not like "20" here and I think the right thing will
> > be adding whatever number of bytes to rtas-size in the firmware itself
> > and update it in QEMU via "setprop" as we do for "linux,rtas-base". And
> > then do the same in SLOF.
>=20
> This is not the base address but the size of the shim with the hypercall
> that instantiate-rtas copies. Why does it need to be updated? And why does
> it need to be more bytes than necessary? I don't know what you do for spa=
pr
> and why do you need larger rtas-size than this but for pegasos2 this
> /rtas/rtas-size property is only used by guests to allocate memory for rt=
as
> so all I need is how many bytes are needed for hv_rtas in
> pc-bios/vof/entry.S which is what should be #defined in vof.h. I've found=
 20
> is just enough so you could add that to vof.h.

Because spapr has fwnmi, a firmware assisted dump mechanism which logs
things into part of the RTAS space.  It's a stupid interface, but
that's how PAPR specifies it.  You neither need nor want that for
Pegasos, so you can just have the rtas-size be the 20 bytes for the
tiny hypercall shim.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+Xrm+0fDmim9pB0p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDNuNgACgkQbDjKyiDZ
s5KXVhAAjBTaDYxeAneGlggqE7pEfog328o089i5gm0l4q9Xi6s0Ex/6aFx/9Ivm
DoIT0DJ92iqQuz0+2NvSR7VtlQXyraeKMaZMq+M2NVqnd5xmoZDRs9doX1ev7hn6
qYaUQ8iJ0cPAdvYlGESbb/AE4+c99feXrktRlVQKEtMSoBXFeMWykyx4F1Ts4303
eqZ4FKheLqiopjmGAtsI1qkoQ7Q9N/XJCWhKlGBBrmvGnxWP6IxfoR5pG98nmhRT
NgzdtjICOi1p8mMjbhWmv4m/FgXBUItT6rNCRim3+ITM0YCUTw8/PRYk6caeCmLp
CsmByNM950ZsStFsJz4A+800yQFbjsYYzBwt4HU9/i9FtgU0zckCtyQVIU03XFIw
oFbjUGf+8Fdv0hPIuQCfUeDZqIOhjNF/LbcgvrMuZRcQeOxV+kbi1WSoaNAfqpDg
Omn1sw8atEGZaEtPRLwhwyhRcPVyBPMpxuxUQfc58mZ1mQS+Qjw2kQFLRL1A8cox
8ou1JVHiCtV+3UIQG3DNXe9X+y9kK90liBJeeKKhMAMjMg9K1WFEPJqsSSDtiFuV
au9py1Ylb57PukFC1j1yGS3S32bWDY2rgUQqwkJ7+Mr8DFqke6k/4qs8CiEpWhrr
Ychk6lCV8tYk/sVky5rSxILwqpHksW6owNoYWg8MzcUuYb9R84I=
=lycM
-----END PGP SIGNATURE-----

--+Xrm+0fDmim9pB0p--

