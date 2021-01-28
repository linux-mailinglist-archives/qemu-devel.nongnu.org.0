Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233CB308270
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 01:36:22 +0100 (CET)
Received: from localhost ([::1]:59180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Hls-0003Ab-W1
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 19:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5Hk4-0001NJ-6p; Thu, 28 Jan 2021 19:34:28 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37295 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5Hk1-0003Il-Jz; Thu, 28 Jan 2021 19:34:27 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DRdd91LD6z9sWL; Fri, 29 Jan 2021 11:34:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611880461;
 bh=m0zC8biG1g/dSjLhVsGS40nMTYrGEGtCGMTuTCg0mbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bWsREiEqKaLCXpzHlnt9UGv6vpBzxl9fHh+OLj0Uvl1b3EAgfJBYjEbk3lzcS9RtN
 gFOwLPCyr25gmlT1VOnJvz2ovWskoILNNv/EjNmdU6gqmYbM8yH9mjtHEVrJNbKmLp
 a/Al5Xa+EYerJ3j6LX+rK7CuIoMzJB2rp/A+5dsg=
Date: Fri, 29 Jan 2021 09:36:50 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 3/7] ppc/pnv: Use skiboot addresses to load kernel and
 ramfs
Message-ID: <20210128223650.GA6951@yekko.fritz.box>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-4-clg@kaod.org>
 <CACPK8Xdp12MC2yg23t61pLjFL-HEQg1tqL=aOjrQ-jrZ17b=cQ@mail.gmail.com>
 <48a1fc34-88fe-105c-35af-729dae73e1fb@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
In-Reply-To: <48a1fc34-88fe-105c-35af-729dae73e1fb@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 08:02:41AM +0100, C=E9dric Le Goater wrote:
> On 1/28/21 1:45 AM, Joel Stanley wrote:
> > On Tue, 26 Jan 2021 at 17:11, C=E9dric Le Goater <clg@kaod.org> wrote:
> >>
> >> The current settings are useful to load large kernels (with debug) but
> >> it moves the initrd image in a memory region not protected by
> >> skiboot. If skiboot is compiled with DEBUG=3D1, memory poisoning will
> >> corrupt the initrd.
> >>
> >> Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> >> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> >=20
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> >=20
> > Note that the machine's default ram size will change with this patch:
> >=20
> >  mc->default_ram_size =3D INITRD_LOAD_ADDR + INITRD_MAX_SIZE;
>=20
> Ah yes. I missed that.
>=20
> > So we will go from 1.75GB to 768MB. Does anything break when the
> > machine has less than 1GB of ram?
>=20
> There is a warning if the machine has less than 1GB but we should
> also change the default RAM size to 1G to be on the safe side.

I've merged the patch, but I'm happy to replace it with an updated
version, or fold in a change, if that helps.

>=20
> Thanks,
>=20
> C.=20
>=20
> >=20
> >> ---
> >>
> >>  If we want to increase the kernel size limit as commit b45b56baeecd
> >>  ("ppc/pnv: increase kernel size limit to 256MiB") intented to do, I
> >>  think we should add a machine option.
> >>
> >>  hw/ppc/pnv.c | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> >> index 14fc9758a973..e500c2e2437e 100644
> >> --- a/hw/ppc/pnv.c
> >> +++ b/hw/ppc/pnv.c
> >> @@ -65,9 +65,9 @@
> >>  #define FW_MAX_SIZE             (16 * MiB)
> >>
> >>  #define KERNEL_LOAD_ADDR        0x20000000
> >> -#define KERNEL_MAX_SIZE         (256 * MiB)
> >> -#define INITRD_LOAD_ADDR        0x60000000
> >> -#define INITRD_MAX_SIZE         (256 * MiB)
> >> +#define KERNEL_MAX_SIZE         (128 * MiB)
> >> +#define INITRD_LOAD_ADDR        0x28000000
> >> +#define INITRD_MAX_SIZE         (128 * MiB)
> >>
> >>  static const char *pnv_chip_core_typename(const PnvChip *o)
> >>  {
> >>
> >>
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmATPIAACgkQbDjKyiDZ
s5J+rw//X9CxXbwsuc8P3zKPG4KdZZfWrVlFi7E3jTWg+bZWIgVDYoAmBO2vvrpr
cfLdGg4YnDIwEabbwb23KeWbWnzeQtomrhWXgjoBmfTtuYvn1Un9H/qAzh/TaMoZ
xdYmTs0HA8qK51+C/HaAhG4pv6alIpuhIBJdMjDlYzAbRgm488JzOanWG5l11WMS
1VOXC1huYRauVh/NxZ53bkTxyUj8lou6LFdPoNu68mOwXIikaoh+bP02E19MUsdo
kjkp0odwSdFgR6/5/dlfptuFOH3rUwyUjgNc9YD5EENbuwMxcPmdfpkss7XGhhWa
gK6MUENGBHdsRtk4LpMdgR8kcHylfMeBVEixl+0WmT/A8lpQuc18/z4m2QMAV1BU
xocEe7YaV1waQNEqwx6K82KszED1FKnIWXskItNDZf6jG4UA9moMTDIkLMJW0Gjb
6f5B1zuVPWnYkFEeeB40NL8hvtRm807/tX+6q+/Qy49cWA+mBzDlvQutMAq8VY1o
HVVFO8OVxajWfgELwAskIxtTnJM3Kfrbe1R63UuRO/AhDmX1O6hnG5BcsRPdkiz4
8zVwSzG/y/ZN64usPLdCZj+N+y9Z0Frf0P92MjBKUcTs3X01e/JsYF7vNQJAbN3o
jKk9/oXhDLnANTSZ9inbg6015iF/vf8I3gZpdGEW63pzfrFhDQs=
=mcRW
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--

