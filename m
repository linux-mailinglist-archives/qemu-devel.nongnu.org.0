Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043D82F72BB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 07:07:24 +0100 (CET)
Received: from localhost ([::1]:55516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0IGY-00021M-B5
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 01:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l0IBK-00019H-Ga; Fri, 15 Jan 2021 01:01:58 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:45619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l0IBI-0003xR-3v; Fri, 15 Jan 2021 01:01:58 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 66FE65C00B0;
 Fri, 15 Jan 2021 01:01:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 15 Jan 2021 01:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=5jOU79ZxF3FIRNpq2Kq65j9L6hD
 b5aIVstsQXZmPNIc=; b=nlz57ICmn4gDU4ay+LzG0RALco8SbFDt7z+WGO+Awr5
 7xLJIy0jB22DB2SeDmcmHMyTx5Bcei2s1Rk0gqD3X6Kdp09CjziMOdI/EK/QF/r/
 TMxrJ/Z6358pdc5o69/gwdZtZ0kWDx2yltOFtMyJ6HCgZfGa5eavf/7I5EYQ+sSz
 dfac8MSotqRaVM9cvEcRpaLhGibOMARfGYD8sqpy6baVUIyymf5YF19o0KLsybIg
 f40UaxgwlrcbBTM7yOMQ62OEMyBHrst21jYdPa+syHdJ0L5bWwbHO+ytx3hIho0w
 cid0oMoY+01ea8C1hqw43ECD2QhBPbveZyimsogDFTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5jOU79
 ZxF3FIRNpq2Kq65j9L6hDb5aIVstsQXZmPNIc=; b=raHSnJJsyMTxisxNZmj7sr
 7HVeflAkKlQzVWGtCaWN8BHSIvGYVcFOK8uHzlGtC9jbldxdE7iyS7gX2QnNwk+H
 6HxAP6x6M+Xri1vcBSc1vowZQGC6ONPfS7SPXWLRSYMr1kK8qp4DoHLeEInG5UWS
 mLn0DKyXYwSV+1i2UWtWbOewUPk5TdEIjqy3xlsHnQm0nfVCZ4wpQzK9z7vcR7+y
 eUK2oNk6Yy1N9fKUXF7mOaa9lpmdHDMFRW/xE9fYQJOUTSl5IaxbPlNnMzAGvVea
 x/AdSdbaImrMHoR9Hx55Wc2p4B3kpCoDWjqFrYyAwzHMBGoE/CFFLbhzE8LgTwBA
 ==
X-ME-Sender: <xms:0S8BYJbo4rcEOKPNZNtaknHSyMU1YWA_29FCj_XZz_6QSz4HoV8oHg>
 <xme:0S8BYAbo0e79Mil367wWqihu5kibeYC6fnJWm7QdSHyPTvOiX3e-8P77AdED_CTza
 bvsrjhnO70ZesxQmL0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddugdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepveffkeehjeehheduiedtgffhhfehfeekjefhjeeguedvheevhfefjeeigeejhefh
 necuffhomhgrihhnpeifphdrrghsnecukfhppeektddrudeijedrleekrdduledtnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhr
 rhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:0S8BYL-GvVa3IgRD4SW2PjA06R1vDkG_UXTwMvpgyKCET444Gisi9A>
 <xmx:0S8BYHpluVSsOaQSLiHkWJO3CHy8dhQMoKzr6iQrMRmRsAENPi3hog>
 <xmx:0S8BYEqV1zgbp-QV0ZoPMOkFlE-2PEt7IM5-CRHHnpVHz3AbMdlhzg>
 <xmx:0i8BYNlpjLFbQjMykXjjoGBujwjNDkAd9OPIdAAmq1OwlEyYCLkEVg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 90570240057;
 Fri, 15 Jan 2021 01:01:52 -0500 (EST)
Date: Fri, 15 Jan 2021 07:01:49 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH] hw/block/nvme: fix zone write finalize
Message-ID: <YAEvzfXMZJ3f8uiN@apples.localdomain>
References: <20210112094235.188686-1-its@irrelevant.dk>
 <20210114230319.GC1511902@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TAa9iVN56Xuj1FuK"
Content-Disposition: inline
In-Reply-To: <20210114230319.GC1511902@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TAa9iVN56Xuj1FuK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 14 15:03, Keith Busch wrote:
> On Tue, Jan 12, 2021 at 10:42:35AM +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > The zone write pointer is unconditionally advanced, even for write
> > faults. Make sure that the zone is always transitioned to Full if the
> > write pointer reaches zone capacity.
>=20
> Looks like some spec weirdness. It says we can transition to full:
>=20
>   b) as a result of successful completion of a write operation that
>      writes one or more logical blocks that causes the zone to reach its
>      writeable zone capacity;
>=20
> But a failed write also advances the write pointer as you've pointed
> out, so they might want to strike "successful".
>=20

Yes, its slightly inconsistent.

Empty/Closed to Opened is also kinda fuzzy in the spec. The wording is
slightly different when transitioning from Empty and Closed to
Implicitly Opened. ZSE->ZSIO just says "and a write operation writes on
or more logical blocks of that zone". ZSC->ZSIO says "and a write
operation that writes one or more logical blocks to the zone completes
succesfully". This has given me some headaches on if the transition
should occur when "preparing/submitting" the write or when the write
completes. But I guess this is pretty much an implementation detail of
the device.

I should mention this to my representatives ;)

> Looks fine to me.
>=20
> Reviewed-by: Keith Busch <kbusch@kernel.org>
>=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> > ---
> >  hw/block/nvme.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 0854ee307227..280b31b4459d 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -1268,10 +1268,13 @@ static void nvme_finalize_zoned_write(NvmeNames=
pace *ns, NvmeRequest *req,
> >      nlb =3D le16_to_cpu(rw->nlb) + 1;
> >      zone =3D nvme_get_zone_by_slba(ns, slba);
> > =20
> > +    zone->d.wp +=3D nlb;
> > +
> >      if (failed) {
> >          res->slba =3D 0;
> > -        zone->d.wp +=3D nlb;
> > -    } else if (zone->w_ptr =3D=3D nvme_zone_wr_boundary(zone)) {
> > +    }
> > +
> > +    if (zone->d.wp =3D=3D nvme_zone_wr_boundary(zone)) {
>=20
> The previous check was using 'zone->w_ptr', but now it's 'zone->d.wp'.
> As far as I can tell, this difference will mean the zone won't finalize
> until the last write completes, where before it could finalize after the
> zone's last write is submitted. Either way looks okay, but I think these
> two values ought to always be in sync.
>=20

Right - the zone will transition to Full on the last completed write. I
really not sure if this models devices better or not. But I would argue
that a real device would not relinquish resources until the last write
completes.

An issue is that for QD>1 (zone append), we can easily end up with
appends A and B completing in reversed order such that d.wp is advanced
by B_nlb, but we left a "hole" of A_nlb in the zone because that write
has not completed yet.

But - I think *some* inconsistency on the write pointer value is to be
expected when using Zone Append. The host can only ever depend on a
consistent value of the write pointer by quiescing I/O to the zone and
then getting a zone report - and d.wp and d.w_ptr will always
converge in that case.

--TAa9iVN56Xuj1FuK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmABL8wACgkQTeGvMW1P
Del5xwf/X00w+qaPh5iifDsY73k9+XpxNkSx0M7bLNd9qDi2KkHfwjE0a+6lRaP/
bmtqK9PYIrmFm3gFq0i+jvLZ3pofz8B4MVppTPmoInxxkp3BKXAE1x7HwYVrBJYN
535d5UiSkcN9ZrpX7+wkPKv8M3HksQXo1/AXvKY3MyLp/sER87oSUZ0lDZbhFQF0
6Q6/6w7cquKfNM9lU3JlOuat0XMfGwTeQF7WnBuHfBr5legePu/Y+RNaNZ/rK1Jp
x5Iezedmq3MEtBVv8RMteyzy1J8OszZIKqA1qOpM1QNjsc2nIysYXdY8c7JC8S0T
DJEP2LPjVFsCntqCoN3xh8+LX+Rsgg==
=PU9L
-----END PGP SIGNATURE-----

--TAa9iVN56Xuj1FuK--

