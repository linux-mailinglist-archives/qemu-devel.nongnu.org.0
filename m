Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37E839D3AD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 05:55:15 +0200 (CEST)
Received: from localhost ([::1]:43482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq6M6-0004YL-Uo
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 23:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hz-0003rM-1o; Sun, 06 Jun 2021 23:51:00 -0400
Received: from ozlabs.org ([203.11.71.1]:38439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Ht-0002mT-TX; Sun, 06 Jun 2021 23:50:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fyzt23tQvz9sX5; Mon,  7 Jun 2021 13:50:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623037834;
 bh=nEJLCZAcXTd302exxM4ueqgeh5Fc6Im/5IfrlRuBXgE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lP3xeznThoTeJJhENOtQN2BDXyL7JV2gbp6MujjfjsPIR0amJGPIPueH7GfR4q8j2
 MmpmnOaABsU9upv+h10nbozEF12d4qpCF15TTDSLUxKTLmpe2+l/7v8IezJ9AEnVpy
 eVrImyDcKxVZ6TFuvpST6qBLaowfSm90tyBxcPk8=
Date: Mon, 7 Jun 2021 13:02:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Message-ID: <YL2MYH4sxCBnVwUK@yekko>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <c13d557a-5feb-33ad-33ec-22a28cddb8d@eik.bme.hu>
 <7e71f593-c2b9-5c7-4dd0-2a189bee771@eik.bme.hu>
 <d86c8379-871f-53d4-03b3-55055fc0b56a@ozlabs.ru>
 <9236fd6d-e231-7b3b-3cec-d17733d04e2c@eik.bme.hu>
 <YLnGbJJGP8XqRqoj@yekko>
 <8966ef58-7695-436c-97f9-566c129eb7c@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Xz/a54qlQo1E9ZkH"
Content-Disposition: inline
In-Reply-To: <8966ef58-7695-436c-97f9-566c129eb7c@eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Xz/a54qlQo1E9ZkH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 03:27:12PM +0200, BALATON Zoltan wrote:
> On Fri, 4 Jun 2021, David Gibson wrote:
> > On Tue, Jun 01, 2021 at 04:12:44PM +0200, BALATON Zoltan wrote:
> > > On Tue, 1 Jun 2021, Alexey Kardashevskiy wrote:
> > > > On 31/05/2021 23:07, BALATON Zoltan wrote:
> > > > > On Sun, 30 May 2021, BALATON Zoltan wrote:
> > > > > > On Thu, 20 May 2021, Alexey Kardashevskiy wrote:
> > > > > > > diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..a283b7d251a7
> > > > > > > --- /dev/null
> > > > > > > +++ b/hw/ppc/vof.c
> > > > > > > @@ -0,0 +1,1021 @@
> > > > > > > +/*
> > > > > > > + * QEMU PowerPC Virtual Open Firmware.
> > > > > > > + *
> > > > > > > + * This implements client interface from OpenFirmware
> > > > > > > IEEE1275 on the QEMU
> > > > > > > + * side to leave only a very basic firmware in the VM.
> > > > > > > + *
> > > > > > > + * Copyright (c) 2021 IBM Corporation.
> > > > > > > + *
> > > > > > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > > > > > + */
> > > > > > > +
> > > > > > > +#include "qemu/osdep.h"
> > > > > > > +#include "qemu-common.h"
> > > > > > > +#include "qemu/timer.h"
> > > > > > > +#include "qemu/range.h"
> > > > > > > +#include "qemu/units.h"
> > > > > > > +#include "qapi/error.h"
> > > > > > > +#include <sys/ioctl.h>
> > > > > > > +#include "exec/ram_addr.h"
> > > > > > > +#include "exec/address-spaces.h"
> > > > > > > +#include "hw/ppc/vof.h"
> > > > > > > +#include "hw/ppc/fdt.h"
> > > > > > > +#include "sysemu/runstate.h"
> > > > > > > +#include "qom/qom-qobject.h"
> > > > > > > +#include "trace.h"
> > > > > > > +
> > > > > > > +#include <libfdt.h>
> > > > > > > +
> > > > > > > +/*
> > > > > > > + * OF 1275 "nextprop" description suggests is it 32 bytes ma=
x but
> > > > > > > + * LoPAPR defines "ibm,query-interrupt-source-number" which
> > > > > > > is 33 chars long.
> > > > > > > + */
> > > > > > > +#define OF_PROPNAME_LEN_MAX 64
> > > > > > > +
> > > > > > > +#define VOF_MAX_PATH=A0=A0=A0=A0=A0=A0=A0 256
> > > > > > > +#define VOF_MAX_SETPROPLEN=A0 2048
> > > > > > > +#define VOF_MAX_METHODLEN=A0=A0 256
> > > > > > > +#define VOF_MAX_FORTHCODE=A0=A0 256
> > > > > > > +#define VOF_VTY_BUF_SIZE=A0=A0=A0 256
> > > > > > > +
> > > > > > > +typedef struct {
> > > > > > > +=A0=A0=A0 uint64_t start;
> > > > > > > +=A0=A0=A0 uint64_t size;
> > > > > > > +} OfClaimed;
> > > > > > > +
> > > > > > > +typedef struct {
> > > > > > > +=A0=A0=A0 char *path; /* the path used to open the instance =
*/
> > > > > > > +=A0=A0=A0 uint32_t phandle;
> > > > > > > +} OfInstance;
> > > > > > > +
> > > > > > > +#define VOF_MEM_READ(pa, buf, size) \
> > > > > > > +=A0=A0=A0 address_space_read_full(&address_space_memory, \
> > > > > > > +=A0=A0=A0 (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
> > > > > > > +#define VOF_MEM_WRITE(pa, buf, size) \
> > > > > > > +=A0=A0=A0 address_space_write(&address_space_memory, \
> > > > > > > +=A0=A0=A0 (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
> > > > > > > +
> > > > > > > +static int readstr(hwaddr pa, char *buf, int size)
> > > > > > > +{
> > > > > > > +=A0=A0=A0 if (VOF_MEM_READ(pa, buf, size) !=3D MEMTX_OK) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return -1;
> > > > > > > +=A0=A0=A0 }
> > > > > > > +=A0=A0=A0 if (strnlen(buf, size) =3D=3D size) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 buf[size - 1] =3D '\0';
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 trace_vof_error_str_truncated(buf, siz=
e);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return -1;
> > > > > > > +=A0=A0=A0 }
> > > > > > > +=A0=A0=A0 return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static bool cmpservice(const char *s, unsigned nargs, unsign=
ed nret,
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 const char *s1, unsigned nargscheck,
> > > > > > > unsigned nretcheck)
> > > > > > > +{
> > > > > > > +=A0=A0=A0 if (strcmp(s, s1)) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return false;
> > > > > > > +=A0=A0=A0 }
> > > > > > > +=A0=A0=A0 if ((nargscheck && (nargs !=3D nargscheck)) ||
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 (nretcheck && (nret !=3D nretcheck))) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 trace_vof_error_param(s, nargscheck, n=
retcheck, nargs, nret);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return false;
> > > > > > > +=A0=A0=A0 }
> > > > > > > +
> > > > > > > +=A0=A0=A0 return true;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void prop_format(char *tval, int tlen, const void *pr=
op, int len)
> > > > > > > +{
> > > > > > > +=A0=A0=A0 int i;
> > > > > > > +=A0=A0=A0 const unsigned char *c;
> > > > > > > +=A0=A0=A0 char *t;
> > > > > > > +=A0=A0=A0 const char bin[] =3D "...";
> > > > > > > +
> > > > > > > +=A0=A0=A0 for (i =3D 0, c =3D prop; i < len; ++i, ++c) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 if (*c =3D=3D '\0' && i =3D=3D len - 1=
) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 strncpy(tval, prop, tlen -=
 1);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 if (*c < 0x20 || *c >=3D 0x80) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > +=A0=A0=A0 }
> > > > > > > +
> > > > > > > +=A0=A0=A0 for (i =3D 0, c =3D prop, t =3D tval; i < len; ++i=
, ++c) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 if (t >=3D tval + tlen - sizeof(bin) -=
 1 - 2 - 1) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 strcpy(t, bin);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 if (i && i % 4 =3D=3D 0 && i !=3D len =
- 1) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 strcat(t, " ");
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ++t;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 t +=3D sprintf(t, "%02X", *c & 0xFF);
> > > > > > > +=A0=A0=A0 }
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int get_path(const void *fdt, int offset, char *buf, =
int len)
> > > > > > > +{
> > > > > > > +=A0=A0=A0 int ret;
> > > > > > > +
> > > > > > > +=A0=A0=A0 ret =3D fdt_get_path(fdt, offset, buf, len - 1);
> > > > > > > +=A0=A0=A0 if (ret < 0) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return ret;
> > > > > > > +=A0=A0=A0 }
> > > > > > > +
> > > > > > > +=A0=A0=A0 buf[len - 1] =3D '\0';
> > > > > > > +
> > > > > > > +=A0=A0=A0 return strlen(buf) + 1;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int phandle_to_path(const void *fdt, uint32_t ph,
> > > > > > > char *buf, int len)
> > > > > > > +{
> > > > > > > +=A0=A0=A0 int ret;
> > > > > > > +
> > > > > > > +=A0=A0=A0 ret =3D fdt_node_offset_by_phandle(fdt, ph);
> > > > > > > +=A0=A0=A0 if (ret < 0) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return ret;
> > > > > > > +=A0=A0=A0 }
> > > > > > > +
> > > > > > > +=A0=A0=A0 return get_path(fdt, ret, buf, len);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static uint32_t vof_finddevice(const void *fdt, uint32_t nod=
eaddr)
> > > > > > > +{
> > > > > > > +=A0=A0=A0 char fullnode[VOF_MAX_PATH];
> > > > > > > +=A0=A0=A0 uint32_t ret =3D -1;
> > > > > > > +=A0=A0=A0 int offset;
> > > > > > > +
> > > > > > > +=A0=A0=A0 if (readstr(nodeaddr, fullnode, sizeof(fullnode)))=
 {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return (uint32_t) ret;
> > > > > > > +=A0=A0=A0 }
> > > > > > > +
> > > > > > > +=A0=A0=A0 offset =3D fdt_path_offset(fdt, fullnode);
> > > > > > > +=A0=A0=A0 if (offset >=3D 0) {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 ret =3D fdt_get_phandle(fdt, offset);
> > > > > > > +=A0=A0=A0 }
> > > > > > > +=A0=A0=A0 trace_vof_finddevice(fullnode, ret);
> > > > > > > +=A0=A0=A0 return (uint32_t) ret;
> > > > > > > +}
> > > > > >=20
> > > > > > The Linux init function that runs on pegasos2 here:
> > > > > >=20
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.gi=
t/tree/arch/powerpc/kernel/prom_init.c?h=3Dv4.14.234#n2658
> > > > > >=20
> > > > > > calls finddevice once with isa@c and next with isa@C (small and
> > > > > > capital C) both of which works with the board firmware but with
> > > > > > vof the comparison is case sensitive and one of these fails so I
> > > > > > can't make it work. I don't know if this is a problem in libfdt
> > > > > > or the vof_finddevice above should do something else to get case
> > > > > > insensitive comparison.
> > > > >=20
> > > > > This fixes the issue with Linux but I'm not sure if there's any
> > > > > better solution or would it break anything else.
> > > >=20
> > > > The bit after "@" is an address and needs to be case insensitive and
> > > > I'll fix this indeed. I'm not so sure about the part before "@", I
> > > > cannot imagine what could break if I made search insensitive to cas=
e. Hm
> > > > :-/
> > >=20
> > > Fixing the match in the address part is probably enough as the name s=
ent by
> > > guests is probably always lower case
> >=20
> > I'm confused, I thought you just said that it looked for both isa@c
> > and isa@C, which seems to contradict guests always using lower case.
>=20
> I mean the part before the @ sign (that is the name part, "isa" above) is
> always lower case. I haven't seen guests trying to query that with other
> than lower case

Ah, I see.  Yes, I think you can count on that, because I believe even
in traditional OF the part before the @ *is* case-sensitive.  At least
there are certainly conventions about how the vendor is capitalized,
so I assume it is.

> but the part after @ can be different even in the same guest
> code just a few lines apart as in the Linux kernel. So fixing the compari=
son
> to e.g. do toupper in the address part after @ should work I think even if
> we continue to do case sensitive comparison in the name part. Alexey said
> he'll fix that so there's no problem.

Yeah, that will probably work fine in practice.  It's not technically
correct in all cases, because how you're supposed to do the comparison
depends on the bus type.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Xz/a54qlQo1E9ZkH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9jF4ACgkQbDjKyiDZ
s5Lxww/+NJt/wXPpB02qnPS2jzOexeOsLVzZxgusWUCHlu5XM+47NfU67FG3D13I
JW1k3D8YqNG7/XD0tHbFp4BpueFySTVzbJ7OEAz5+a/tCgG3CngKixClw8cv9whV
Yo39oUBYXprRxeg1Syc6wyPKf0dD2S3RtMXwrzDhyj+pTO4s8QOz9SyIvHZxqCEq
klhMvwZR2POE3B1hfroUt8Z3RhFdKcNXeBIw1u95rLT1yERZ3itTfsMAgvdI61GE
27znCbqWoTfWzFJNbD0HemGxKd/N/Wv2dUx5XqDaRNCpgzTf1MH8fwmsGFqgz9++
NRmdmDiL3oemvKlOBlaTOG6On4JV/NnyEOafnc9NWJbsKy/9NxS9fIHi74RGPwBV
ohDsXionntNpwmuXoi0y6G/Whx4C2Vx8+aTYirCK1Jrm7QAm482KVv7GajOIsfX2
EVrIsld5KJI2PMWqBdNbfq3ltRZfXQSvBgfg1a5WorjXdEEpZvtP88W2wmc7MzfD
aQ6YK2FksirbLaSA+aNCs8aWzQWxNIoYdqtoxiw6SI6Ebe53EC2izZUvW9/6AXV5
jzikIMU8sXqI+ZcoKwRhE+b528T78gN5T615nGis51VYs9bAmmAPzp+fev9ocoDZ
LegchD7/V/rKWJeuy+cZ844c1iU3vMmA6zpcujAFKUm+qndY18U=
=LwdJ
-----END PGP SIGNATURE-----

--Xz/a54qlQo1E9ZkH--

