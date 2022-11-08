Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF1A621598
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 15:13:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osPKa-0003FC-9q; Tue, 08 Nov 2022 09:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1osPKX-0003D9-Ge; Tue, 08 Nov 2022 09:11:57 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1osPKV-0000Wd-O8; Tue, 08 Nov 2022 09:11:57 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A7A1532006F5;
 Tue,  8 Nov 2022 09:11:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 08 Nov 2022 09:11:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1667916711; x=1668003111; bh=6q
 V+Q03eOr1Bb8mn6PmR8uyKcDSNxWb3fVJYG2gA0tY=; b=gGyodg3l6pL1ngTXXT
 87hVBDxCRyJOxqb26y3r5MGMT4Yic1O8yEMbak/gdgzV8v58LdBECU+pny+p4wIF
 Lu6XE4fn5tSBwf/hyEMoC8E5ckmqd6205LyObbfCKpq7aajAsqmGE2wtFBpxomFD
 zQyhLd6uIkrqeKsA+xhwKkf70f+GNFyioCy529kGzRTwqR8Gsun7rUlbty8FQ+ck
 3O8oUWX4cRPxf0zz5ECWvzF2jxO+HfKoguPRcq7fM6o7/J1xkyAW1K3aF+ZsNWoz
 Xf/PY7y1hzKmjyrdAqgVHGRGmF9zjG4gnOealsafxVCcA0v1U1SmT4HTMSsO1NcR
 tGvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1667916711; x=1668003111; bh=6qV+Q03eOr1Bb8mn6PmR8uyKcDSN
 xWb3fVJYG2gA0tY=; b=nZhHAeY2VpLLH0ZaXEShjgJjQJCF31ZrY7wOJ3/Gmmhy
 AItGgp+TXUVLJ000lnGFoFgVlSsjf21V2ylD2HuolrSgmNReShzeDQWwzwdjE/Jn
 2OWdWrAPJNDRzxRGt63tJmqgF71m3o8d3YopPt2RRFx06G3EJrBHPCapFqXrXKDW
 P1FxgQTr8jCEyWkSaxWGaoNUVV66cBOuy3d6hN7aFFdJR70R42tI2dUCxaaPAsB5
 gyeOVo25qVZCU3grA3oPPoU0H87vwNppuJFg4yl8xmIiLnS/JG6oAt1q3klGZSqI
 3adyFFliex+tN3Y8iqhrvGO4DkIoxPPVMMSmwqaVBA==
X-ME-Sender: <xms:pWNqY9ioPPLM_s8U-txHWiO7WE0Sfa_2RNDe6VHG1fYEnYs8xYMyhw>
 <xme:pWNqYyAQnOKRLqIlF7CT0mingN7IK6b4nvTfwkh0YLwtD9VDa0_NFv_OAcY4JUWd2
 BqbsCpzoZ9kgcYf7pY>
X-ME-Received: <xmr:pWNqY9H1z0enzJJSEbiLPX6c3aYuaxuWn1yKO5BkOo189KdWwDo4NiMSunhRqagNIQDQhV-9SvywmFTlq87fMh1G0RU5Rg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedtgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeekleduhedthfejueefgedtfeeuhefftdehtdfhtefhtdetheeukeeigeevheeu
 geenucffohhmrghinhepfihrihhtvgdrnhhonecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:pmNqYyTc9InWTDSD_wzVjxVtTlFQWdSN1Rv2oeNcPTSb4mLILbNDxA>
 <xmx:pmNqY6zXfSApb9mhSt5ZWi2rxAA6NGxkY9k2OCHHA1UnxZjRd-KrVA>
 <xmx:pmNqY474z2BvLWSq_BSadhS9QzP_KeAFldt4wWYH05JGWIDPUcZBXw>
 <xmx:p2NqYxrUMlx4YBjmnK6mXdfgs63h-cW_oEYz9Dj5Cy2OI_H-m8Vv7Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Nov 2022 09:11:48 -0500 (EST)
Date: Tue, 8 Nov 2022 15:11:46 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: John Levon <levon@movementarian.org>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel <qemu-devel@nongnu.org>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@gmail.com>,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH v3 4/4] hw/nvme: add polling support
Message-ID: <Y2pjohnZi7kCA3m5@cormorant.local>
References: <20220827091258.3589230-1-fanjinhao21s@ict.ac.cn>
 <20220827091258.3589230-5-fanjinhao21s@ict.ac.cn>
 <Y1EswYz077swwhuc@cormorant.local>
 <D1741E76-294E-41F6-B87B-70C2A4CF778C@ict.ac.cn>
 <Y2OvzcfeawKWvvJ0@cormorant.local>
 <3ffebed8-997d-e276-bf4a-c75508b0be11@ict.ac.cn>
 <Y2Sx7O4MFHKrvXQA@cormorant.local>
 <Y2pOG89mnH3vGG/E@movementarian.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yiP7tnLbl2wZ6gW9"
Content-Disposition: inline
In-Reply-To: <Y2pOG89mnH3vGG/E@movementarian.org>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--yiP7tnLbl2wZ6gW9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov  8 12:39, John Levon wrote:
> On Fri, Nov 04, 2022 at 07:32:12AM +0100, Klaus Jensen wrote:
>=20
> > On Nov  3 21:19, Jinhao Fan wrote:
> > > On 11/3/2022 8:10 PM, Klaus Jensen wrote:
> > > > I agree that the spec is a little unclear on this point. In any cas=
e, in
> > > > Linux, when the driver has decided that the sq tail must be updated,
> > > > it will use this check:
> > > >=20
> > > >    (new_idx - event_idx - 1) < (new_idx - old)
> > >=20
> > > When eventidx is already behind, it's like:
> > >=20
> > >  0
> > >  1 <- event_idx
> > >  2 <- old
> > >  3 <- new_idx
> > >  4
> > >  .
> > >  .
> > >  .
> > >=20
> > > In this case, (new_idx - event_idx - 1) =3D 3-1-1 =3D 1 >=3D (new_idx=
 - old) =3D
> > > 3-2=3D1, so the host won't update sq tail. Where am I wrong in this e=
xample?
> >=20
> > That becomes 1 >=3D 1, i.e. "true". So this will result in the driver
> > doing an mmio doorbell write.
>=20
> The code is:
>=20
> static inline int nvme_dbbuf_need_event(u16 event_idx, u16 new_idx, u16 o=
ld)        =20
> {                                                                        =
       =20
>         return (u16)(new_idx - event_idx - 1) < (u16)(new_idx - old);    =
       =20
> }                                                                        =
       =20
>=20
> which per the above is "return 1 < 1;", or false. So the above case does =
*not*
> do an mmio write. No?
>=20

Whelp.

Looks like I'm in the wrong here, apologies!

--yiP7tnLbl2wZ6gW9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNqY6EACgkQTeGvMW1P
DenC/AgAgOly7HLnAAabLjjOmpnFob3u+6rQDM6NiD4yQcXKA0bbSXKKF+9Hg+Lv
15XkayNXCKj4L1rIPombw2ixm7GgD1IXO7f90lQjN6X0eWpj6G6IdmQuvJBuDLw0
SSHXUUmlvJ1vGLtHjiyE5VoVmvZjUT0ECOQXUmZsiNLnj2SXUReurMAMnRljIevI
2IM3ZcnZMNdQymQaOyrcASZR4rFZuBLdS+Ic2PDuQNvK9buJ65s7t5fgcvYeqxZm
IUD1glWe0CPKvFX8Fi9iqgW7zFpO94C7WGRLVslO6gqmi4fhctS2VEeoXZmsFvEW
4cXz+nz8GPGyp4YDJwHxgL+71OZjuA==
=M6nQ
-----END PGP SIGNATURE-----

--yiP7tnLbl2wZ6gW9--

