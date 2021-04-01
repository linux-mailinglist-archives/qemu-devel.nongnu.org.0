Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CB4350D03
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 05:16:34 +0200 (CEST)
Received: from localhost ([::1]:50718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRnou-0003kC-Qv
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 23:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRnnb-00038v-CK; Wed, 31 Mar 2021 23:15:11 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:56703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRnnZ-0005tR-4X; Wed, 31 Mar 2021 23:15:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F9pFz5CVbz9sX5; Thu,  1 Apr 2021 14:15:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617246903;
 bh=zWQL/FPafX2NIv3xWBRD6hS0PJSNM706Rl67pD3dSn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XgIoPEp7ENrtceWQEhvK8MqKIHfLs64aDiKcXHeIRKdFXN1Dl2PFMaOBBxg7oTTDp
 rncVxuUbV2hQZuPjN2QPKsFm0TBY4ierd4m1S6FJKUL5jK93HpJ2jMknI8uTsB79kX
 oJcpza5Z6Pc0qv/EHM6kNwLN3NbIwMR/3zzLNAGI=
Date: Thu, 1 Apr 2021 14:10:33 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v16] spapr: Implement Open Firmware client interface
Message-ID: <YGU5qYPSgV39qPn6@yekko.fritz.box>
References: <20210323025830.104781-1-aik@ozlabs.ru>
 <YFv69rtZd6yzKAtU@yekko.fritz.box>
 <98565b10-debd-be0a-79f7-9f08737a49d1@ozlabs.ru>
 <YGPKcKqPtKCTdMCi@yekko.fritz.box>
 <2880d500-94bb-5579-8aba-4b78d35ba504@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zgWkP+O3Z32dL1/e"
Content-Disposition: inline
In-Reply-To: <2880d500-94bb-5579-8aba-4b78d35ba504@ozlabs.ru>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zgWkP+O3Z32dL1/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 01, 2021 at 11:17:39AM +1100, Alexey Kardashevskiy wrote:
>=20
>=20
> On 31/03/2021 12:03, David Gibson wrote:
> > On Thu, Mar 25, 2021 at 02:25:33PM +1100, Alexey Kardashevskiy wrote:
> > >=20
> > >=20
> > > On 25/03/2021 13:52, David Gibson wrote:
> > > > On Tue, Mar 23, 2021 at 01:58:30PM +1100, Alexey Kardashevskiy wrot=
e:
> > > > > The PAPR platform which describes an OS environment that's presen=
ted by
> > > > > a combination of a hypervisor and firmware. The features it speci=
fies
> > > > > require collaboration between the firmware and the hypervisor.
> > > > >=20
> > > > > Since the beginning, the runtime component of the firmware (RTAS)=
 has
> > > > > been implemented as a 20 byte shim which simply forwards it to
> > > > > a hypercall implemented in qemu. The boot time firmware component=
 is
> > > > > SLOF - but a build that's specific to qemu, and has always needed=
 to be
> > > > > updated in sync with it. Even though we've managed to limit the a=
mount
> > > > > of runtime communication we need between qemu and SLOF, there's s=
ome,
> > > > > and it has become increasingly awkward to handle as we've impleme=
nted
> > > > > new features.
> > > > >=20
> > > > > This implements a boot time OF client interface (CI) which is
> > > > > enabled by a new "x-vof" pseries machine option (stands for "Virt=
ual Open
> > > > > Firmware). When enabled, QEMU implements the custom H_OF_CLIENT h=
call
> > > > > which implements Open Firmware Client Interface (OF CI). This all=
ows
> > > > > using a smaller stateless firmware which does not have to manage
> > > > > the device tree.
> > > > >=20
> > > > > The new "vof.bin" firmware image is included with source code und=
er
> > > > > pc-bios/. It also includes RTAS blob.
> > > > >=20
> > > > > This implements a handful of CI methods just to get -kernel/-init=
rd
> > > > > working. In particular, this implements the device tree fetching =
and
> > > > > simple memory allocator - "claim" (an OF CI memory allocator) and=
 updates
> > > > > "/memory@0/available" to report the client about available memory.
> > > > >=20
> > > > > This implements changing some device tree properties which we kno=
w how
> > > > > to deal with, the rest is ignored. To allow changes, this skips
> > > > > fdt_pack() when x-vof=3Don as not packing the blob leaves some ro=
om for
> > > > > appending.
> > > > >=20
> > > > > In absence of SLOF, this assigns phandles to device tree nodes to=
 make
> > > > > device tree traversing work.
> > > > >=20
> > > > > When x-vof=3Don, this adds "/chosen" every time QEMU (re)builds a=
 tree.
> > > > >=20
> > > > > This adds basic instances support which are managed by a hash map
> > > > > ihandle -> [phandle].
> > > > >=20
> > > > > Before the guest started, the used memory is:
> > > > > 0..e60 - the initial firmware
> > > > > 8000..10000 - stack
> > > > > 400000.. - kernel
> > > > > 3ea0000.. - initramdisk
> > > > >=20
> > > > > This OF CI does not implement "interpret".
> > > > >=20
> > > > > Unlike SLOF, this does not format uninitialized nvram. Instead, t=
his
> > > > > includes a disk image with pre-formatted nvram.
> > > > >=20
> > > > > With this basic support, this can only boot into kernel directly.
> > > > > However this is just enough for the petitboot kernel and initradm=
disk to
> > > > > boot from any possible source. Note this requires reasonably rece=
nt guest
> > > > > kernel with:
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ddf5be5be8735
> > > > >=20
> > > > > The immediate benefit is much faster booting time which especially
> > > > > crucial with fully emulated early CPU bring up environments. Also=
 this
> > > > > may come handy when/if GRUB-in-the-userspace sees light of the da=
y.
> > > > >=20
> > > > > This separates VOF and sPAPR in a hope that VOF bits may be reuse=
d by
> > > > > other POWERPC boards which do not support pSeries.
> > > > >=20
> > > > > This is coded in assumption that later on we might be adding supp=
ort for
> > > > > booting from QEMU backends (blockdev is the first candidate) with=
out
> > > > > devices/drivers in between as OF1275 does not require that and
> > > > > it is quite easy to so.
> > > > >=20
> > > > > Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > > >=20
> > > > I have some comments below, but they're basically all trivial at th=
is
> > > > point.  We've missed qemu-6.0 obviously, but I'm hoping I can merge
> > > > the next spin to my ppc-for-6.1 tree.
> > > >=20
> > > > > ---
> > > > >=20
> > > > > The example command line is:
> > > > >=20
> > > > > /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
> > > > > -nodefaults \
> > > > > -chardev stdio,id=3DSTDIO0,signal=3Doff,mux=3Don \
> > > > > -device spapr-vty,id=3Dsvty0,reg=3D0x71000110,chardev=3DSTDIO0 \
> > > > > -mon id=3DMON0,chardev=3DSTDIO0,mode=3Dreadline \
> > > > > -nographic \
> > > > > -vga none \
> > > > > -enable-kvm \
> > > > > -m 2G \
> > > > > -machine pseries,x-vof=3Don,cap-cfpc=3Dbroken,cap-sbbc=3Dbroken,c=
ap-ibs=3Dbroken,cap-ccf-assist=3Doff \
> > > > > -kernel pbuild/kernel-le-guest/vmlinux \
> > > > > -initrd pb/rootfs.cpio.xz \
> > > > > -drive id=3DDRIVE0,if=3Dnone,file=3D./p/qemu-killslof/pc-bios/vof=
-nvram.bin,format=3Draw \
> > > >=20
> > > > Removing the need for a prebuild NVRAM image is something I'd like =
to
> > > > see as a followup.
> > >=20
> > >=20
> > > We do not _need_ NVRAM in the VM to begin with, or is this a requirem=
ent?
> >=20
> > Actually.. I'm not certain.
>=20
>=20
> Have you heard of using it, ever? What do people store in there in practi=
ce?

Well... I've never heard of someone actually bothering to set up a
persistent NVRAM, so it's unlikely that we care about anything stored
in there.  However, I think some tools/scripts in userspace might poke
at it nvsetenv, not knowing that (and for the PowerVM case).  So we
probably don't want nvsetenv to outright fail.

Not sure if the kernel itself ever looks at anything in the nvram.

> > > The whole VOF thing is more like a hack and I do not recall myself on=
 doing
> > > anything useful with NVRAM.
> > >=20
> > > If we really need it, then when to format it - in QEMU or VOF.bin? Th=
is
> > > alone will trigger a (lengthy) discussion :)
> >=20
> > I prefer qemu, but we can worry about that later.
>=20
>=20
> [...]
>=20
> > > > > +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
> > > > > +                     target_ulong *stack_ptr, Error **errp)
> > > > > +{
> > > > > +    Vof *vof =3D spapr->vof;
> > > > > +
> > > > > +    vof_cleanup(vof);
> > > > > +
> > > > > +    spapr_vof_client_dt_finalize(spapr, fdt);
> > > > > +
> > > > > +    if (vof_claim(spapr->fdt_blob, vof, 0, spapr->fw_size, 0) =
=3D=3D -1) {
> > > > > +        error_setg(errp, "Memory for firmware is in use");
> > > >=20
> > > > This could probably be an assert, yes?  IIUC this the very first
> > > > claim, so if this fails then we've placed things incorrectly in the
> > > > first place, so it's a code error rather than a user error.
> > >=20
> > >=20
> > > Passing &error_fatal as errp is an assert pretty much but more inform=
ative
> > > imho.
> >=20
> > Not quite.  Passing &error_abort is similar to an assert, but
> > &error_fatal is not.  The rule is that error_abort or assert() should
> > be used for things that can only occur as a result of a bug in qemu
> > itself, whereas error_fatal and other errors should be used for things
> > where the failure may be because of user configuration, or something
> > wrong on the host or in the guest.
> >=20
> > Since the VOF image is being provided by qemu and this is too early
> > for the guest to have messed with it, this counts as something that is
> > necessarily a problem in qemu itself.
>=20
>=20
> vof.bin can be passed via "-bios" which is +1 for error_fatal imho.

Ah... you do have a point there.

> Sorry I missed this reply when posted v18. Repost with error_abort? I do =
not
> care as much about this one.

Nah, leave it for now.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zgWkP+O3Z32dL1/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBlOacACgkQbDjKyiDZ
s5IVdxAA2FeUhS7Ojz3aYHRXk+FH9XIfuPxt4XQEqlO2+3SARspkleFDA2ega4ho
uFLtF39ISiNp7LGiUck/HmNu0G3dq586kBjK1KnSOHdFJ/9ctRIKvZjiy/z4dO85
5WcEgDgdsm8Nk2Ubiqq3R7UGrt1DSa7PYL3OZsSzvLgpp93FXhUzM2CACexax/eH
PjWZIJvB4PhXffzQrpqLHQRAYNHtZAknXYOPGeDDMaPCrw90PhuIsFiUwmB55FzC
Rw1cPUUW0NLqA09OqxpB9oMILyoXB3lD8W/yAABpEfyhNCGcmuJcTGD0TIHhh7jo
8Km33YQ0YVQQAC1D9CcFH2wy2Jzlf7diYaNHsEveTQjf748on7sYHEPkIMgi4Uw8
FHeFPhLdoX5Mkxkhhd+JcTIWhh75/nPClJygCB/qCcmyhddEp/eUpkqBUQ3B9RtO
RxNXPqW7fYDeRaS2wExrbdLZrXwLOHdLknReqRE56FuOqDByqvTULLPIyv9HuKa0
KydfnUabwkeBn8oEWtMdaVBNhiPwZhE0Io4Bj0ftdnwo3VSjBoXYXM16LdJ4iVTk
YlVfam6RdB07J8H8F7Qygz4hHo4bL3914OuFSM8QP9psqXzA6l7sfeurAx0vzhVi
jEEEsFkqlinLI6yzdaIUvt6i59E+BLAO644eZBs1X3QYs9RiIQY=
=gL4n
-----END PGP SIGNATURE-----

--zgWkP+O3Z32dL1/e--

