Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9942E3515
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 09:32:34 +0100 (CET)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktnxB-0007GL-Rt
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 03:32:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktnvZ-0006Hx-H0; Mon, 28 Dec 2020 03:30:53 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:35243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktnvX-0003je-Gc; Mon, 28 Dec 2020 03:30:53 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D49jN0xhjz9sVq; Mon, 28 Dec 2020 19:30:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609144232;
 bh=1qZyNMgc94i78U/KEd/D5rAoal0+xVVkgBAcENIujKM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PW+4t8Xm0aUJOmAfWdsagvW8mtYtKDNknRBjaq5z+Z2xaBgIemexF0LVuBTVmFLBR
 r71PYJyd46AkQ5KL5MdwPLdljHD+Je8PXE0ZRgLhng1BxYzZLA3XXAWVaFqbava3yX
 yeC/fOHjxCYhmx4SsV1rEN4GT72t0WHanOFz0pbY=
Date: Mon, 28 Dec 2020 19:30:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: gaojinhao <gaojinhao@huawei.com>
Subject: Re: [PATCH 4/8] spapr_pci: Fix memory leak of vmstate_spapr_pci
Message-ID: <20201228083013.GM6952@yekko.fritz.box>
References: <20201226103347.868-1-gaojinhao@huawei.com>
 <20201226103347.868-5-gaojinhao@huawei.com>
 <20201228065824.GB6952@yekko.fritz.box>
 <013a231c9cab4f3da7be9d88d87f34ae@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Pz/qqzCPDfGwIFOg"
Content-Disposition: inline
In-Reply-To: <013a231c9cab4f3da7be9d88d87f34ae@huawei.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Juan Quintela <quintela@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 zhukeqian <zhukeqian1@huawei.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Pz/qqzCPDfGwIFOg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 28, 2020 at 08:10:31AM +0000, gaojinhao wrote:
> Hi David,
> Firstly, thank you for you review. And then for your review, I worry
> that a memory leak will occur if QEMU exits after saves vmsd. So, we
> free it in post_save func.

If qemu exits, all its memory will be freed, so we don't care.

>=20
> Jinhao Gao
>=20
> -----Original Message-----
> From: David Gibson [mailto:david@gibson.dropbear.id.au]=20
> Sent: 2020-12-28 14:58
> To: gaojinhao <gaojinhao@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-ppc@nongnu.org; Marc-Andr=E9 Lureau <marc=
andre.lureau@redhat.com>; Stefan Berger <stefanb@linux.vnet.ibm.com>; Micha=
el S . Tsirkin <mst@redhat.com>; Jason Wang <jasowang@redhat.com>; Greg Kur=
z <groug@kaod.org>; Juan Quintela <quintela@redhat.com>; Dr . David Alan Gi=
lbert <dgilbert@redhat.com>; Wanghaibin (D) <wanghaibin.wang@huawei.com>; z=
hukeqian <zhukeqian1@huawei.com>
> Subject: Re: [PATCH 4/8] spapr_pci: Fix memory leak of vmstate_spapr_pci
>=20
> On Sat, Dec 26, 2020 at 06:33:43PM +0800, g00517791 wrote:
> > From: Jinhao Gao <gaojinhao@huawei.com>
> >=20
> > When VM migrate VMState of spapr_pci, the field(msi_devs) of spapr_pci=
=20
> > having a flag of VMS_ALLOC need to allocate memory. If the src doesn't=
=20
> > free memory of msi_devs in SaveStateEntry of spapr_pci after QEMUFile=
=20
> > save VMState of spapr_pci, it may result in memory leak of msi_devs.=20
> > We add the post_save func to free memory, which prevents memory leak.
> >=20
> > Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>
>=20
> Not really a memory leak, since it will get freed on the next pre_save.  =
But, we might as well free it earlier if we can ,so
>=20
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
>=20
> > ---
> >  hw/ppc/spapr_pci.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >=20
> > diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c index=20
> > 76d7c91e9c..1b2b940606 100644
> > --- a/hw/ppc/spapr_pci.c
> > +++ b/hw/ppc/spapr_pci.c
> > @@ -2173,6 +2173,16 @@ static int spapr_pci_pre_save(void *opaque)
> >      return 0;
> >  }
> > =20
> > +static int spapr_pci_post_save(void *opaque) {
> > +    SpaprPhbState *sphb =3D opaque;
> > +
> > +    g_free(sphb->msi_devs);
> > +    sphb->msi_devs =3D NULL;
> > +    sphb->msi_devs_num =3D 0;
> > +    return 0;
> > +}
> > +
> >  static int spapr_pci_post_load(void *opaque, int version_id)  {
> >      SpaprPhbState *sphb =3D opaque;
> > @@ -2205,6 +2215,7 @@ static const VMStateDescription vmstate_spapr_pci=
 =3D {
> >      .version_id =3D 2,
> >      .minimum_version_id =3D 2,
> >      .pre_save =3D spapr_pci_pre_save,
> > +    .post_save =3D spapr_pci_post_save,
> >      .post_load =3D spapr_pci_post_load,
> >      .fields =3D (VMStateField[]) {
> >          VMSTATE_UINT64_EQUAL(buid, SpaprPhbState, NULL),
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Pz/qqzCPDfGwIFOg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/pl5QACgkQbDjKyiDZ
s5IXlg//adZNglOtqLqkdDXXmIpZ3cB59bkaD6qCQOdpaOZm+Tqzq9h3mvKnZnk8
uQXzlJvcQdpVIOKrECpSH2T4ZKCppBvGrcGS20IpVxR3NVOe9blzTVrMu0ID2kAb
3KWaqE3oxB8Bb5YHAR+6F4E3c78AT+gipJZ0YcZ9l6YzgQVrQqTGvidwVB95V7Qa
oJfDHljMXsHCWcpdEpI7wHhq2rzVSkS4tEk7luLwJYT8hv45wgXTnoGKQEO3HNhE
J2ZG1xEWTZxUkhbrkoIc0kySHNiglr9Bpcl1orJbspVoIujOuxvCuTJpIpqgMdbJ
D7RB48HVgpO+jta4qPZT66E69AVVAGFMbFxajyon/sICIrV8L7/tQIodQA3ngx2n
dU0VGK8ZJ+M7TuLVF0liqS9BmebfqI9QM5QYytY0uzIsYPhyQ9yVcTYVXzsunZVM
+LMDCC2CIh05BW1Rcyznpk5PcD4g41y6g4J52zvelmqE3nz+Pi7kivHBVo5qQ4n2
krMG4AzgmuDZdEiJPEJ4StPwsOYJYk4bUEaqrq8OgIw/A5qBrjZvEpKYvSF22jrT
tAvj2h3a24cOdHriGy52TxZU0tfbEmYBpgzbLZZw9J/fzLvfDb6eByVQhuPx9MZi
klFxDxgvSOdX0vJgdzzzzTCp9Olez25NTJVWWxUDZbLJEQz6hyQ=
=3Ydb
-----END PGP SIGNATURE-----

--Pz/qqzCPDfGwIFOg--

