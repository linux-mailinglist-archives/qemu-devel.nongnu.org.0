Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697CE33FA6E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 22:25:43 +0100 (CET)
Received: from localhost ([::1]:37758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMdfh-0000ZK-VJ
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 17:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lMdeQ-00089n-0m
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:24:22 -0400
Received: from mout.web.de ([217.72.192.78]:50721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lMdeO-0000nf-Ck
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:24:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616016240;
 bh=GQfREHb+R+4UNKGG0ixNqVYgjeZbrVYSd7HkHPcak/A=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=abUOl7FBH3K38g7fcwoadEWx/gi9FgpU+FZDMFXJRM9wsaM3TtI38gVdrPG4YJdP8
 50cHaAgLixCS6uwnKzM5giXyYinUuKE1sK1zksVXmlpGOtDwyqSWZ4iyAox+qyONtB
 CxPGt2BwsFiuPuOODhchZ3HaH9XWeyunhdpg5AT8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.38]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LmLgE-1lvQEU3Gcc-00Zvol; Wed, 17
 Mar 2021 22:24:00 +0100
Date: Wed, 17 Mar 2021 22:23:58 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: "Zhang, Chen" <chen.zhang@intel.com>
Subject: Re: [PATCH 0/2] colo-compare: Fix memory leak for non-tcp packet
Message-ID: <20210317222358.31864ded@gecko.fritz.box>
In-Reply-To: <2cee934e177e4a778b3bcc8d5085f4f0@intel.com>
References: <cover.1605438886.git.lukasstraub2@web.de>
 <2cee934e177e4a778b3bcc8d5085f4f0@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dT5586B9W4D9elpPeZ3oEWA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:bLMr+lusqujGpirV2XG1ElE1W4NsqiTnjZMOYblJ2lg0l6bmMxE
 o2xZPLCwu+j/HlbGpsOYls0VSLGhgCJeq1s0YoNxlFXOT+QHi8eVfhxwUo3VO1ZeujBCfsx
 Hm6fmWfK5YLef2kr4JFCBuNUg3kO7GN8nTNUDb/CxCItkniBwuyL1rd3o05hC2+57ytfXsp
 Sk6UBfNLlnTInCWR9mIdA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wdmI+ipUq5U=:nDgKT0Q9vqdYvgTOkV/k30
 8UaSVT7Ll4hhmieLuv7JnS8bthm7DHGX2MDIprn4aybTpBx9ZwmYHhTPACxCsLDeqLDpv+zYC
 kSDUhcITVZ6FMYI43JOoTl+UVe437lRw5zsipiJQA8oWK9N8EzP/MMCEV4SqxHwsO7CZjWoJz
 Z/bGKMALSPi87jql7POBAwgA7i0cI9gom20Uc+gKUOVIYJR0k3mDrNPS6u7tuaVPq4YlPbLug
 CuORMdyHTZLfVcCNi37a9IWNp67OfI+0Fetl6MpHfNt55N3kirHnY2AfDbt6vVK6Ukx/CvdIF
 dxk1O0kqmwlnnokPq12aMTJhhsXS34TLs6vMHxcT26GI0Ym2ukVcBwra/FuglmlSi6NVtmKQK
 CdZGV1NBI0zfowY2ymeG+PGgiTd5smErlgWLZFIl7wX+X2Pg/ynHaoqOP9ovbVabrjks3Xk9g
 q3F0r/Bff4FF7E8C2AD+nuc6JL4kYkFagk0+cmko4rWiJf67vj3RiiMGZucND/uc/P8whGeni
 BKbRNBPsHgVEySiJEgOgZyMQkdb1PZLGuSZ8/0fn+EpFKilshy/Yc8R0vkjx3OremqsI1Q5B2
 OYZBSuQ6dR1JmhBIL+2bfbdW7Q66qDq4s1VQMKMtw0uC/oz+2O9B5EobpAJjtTx5Kfnp9pt+Y
 j+cwIw5+Az9dUoOqp29Um115bBZKE9gIEnELSrievkp6VCpSSq8PtIRLGlel9/Mlr2J6RLCHC
 g/7Av1tvUTLo5KW1g3uXtZCFoz/4WaEeRXO/2sWiUO5j4gdC4PvM05CnnKJnB9KsMMHS6a0RE
 A+5dRJ8zxBj2N8t0oqMoAfOWTBpRetA3/mX2O7SIaiOTKPd5n6E16NTDoeuY/rozP/hy+WLCZ
 tc4o3feLtUnzUR+/THzQ==
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/dT5586B9W4D9elpPeZ3oEWA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,
This hasn't been merged yet.

Regards,
Lukas Straub

On Mon, 16 Nov 2020 07:32:22 +0000
"Zhang, Chen" <chen.zhang@intel.com> wrote:

> Queued this series to COLO tree.
>=20
> Thanks
> Chen
>=20
> > -----Original Message-----
> > From: Lukas Straub <lukasstraub2@web.de>
> > Sent: Sunday, November 15, 2020 7:19 PM
> > To: qemu-devel <qemu-devel@nongnu.org>
> > Cc: Zhang, Chen <chen.zhang@intel.com>; Li Zhijian
> > <lizhijian@cn.fujitsu.com>; Jason Wang <jasowang@redhat.com>
> > Subject: [PATCH 0/2] colo-compare: Fix memory leak for non-tcp packet
> >=20
> > Hello Everyone,
> > This fixes a memory leak for non-tcp packets and optimizes the removal =
from
> > the queue.
> >=20
> > Lukas Straub (2):
> >   net/colo-compare.c: Fix memory leak for non-tcp packet
> >   net/colo-compare.c: Optimize removal of secondary packet
> >=20
> >  net/colo-compare.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > --
> > 2.20.1 =20



--=20


--Sig_/dT5586B9W4D9elpPeZ3oEWA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBSc24ACgkQNasLKJxd
slh1dA//SkjFX7WTYqlKEP3bz9kvIgbs4uY47rREoifEzxs7wx0fOeTePtGJnQY6
IPQxYOAWvb3c0B0+JFZwhHrNPdsvXXC5FvS3g82zqEcuNQfW2+0b8fgSmyicnUlq
1iOn5amofcSRjPV6sUK4RA/07oSncBegjxaO31IHXjIj9PhUNREFSSX2DRhe875g
WLL0W8UrDqGfd+b8kvJic/oR4dhJ8KEiSlB/Zbsen/yaCsvLT8Ea2al8/db6DzTL
W7Im7wQecocwE4IaKKmtqVcqPrT2AqJgTAeYxafu8S1sHQx6BvUwPh+j5Ffo6jGM
We1g+K8blIOiKkylrMrDBkU39yRBHm9fKvKm2N4WH/kWayH90SbgSFy0MtFUcXHg
P5EWHEnSc24mkN+fvdSFXfNqpsKzpks5X0j5YCHqX/wnVrn6LHHcbcPHQPOsohXe
4FmlDPL9ck/NiIfTUPC6KZt4JJwuOUUhZfRuBGi8RnfesEqa2Nw6+lRtxfhRTCif
saK3iw/rWZit/YSYZgruW4K7a52/ZTFR1QxYBxnbZE/YlqqZ6lVYuQm1wBA8jpgF
JZt+1DzV8Indl5O2Pe2GFJDiqIRdOJoxkCFuOeBxOx59AXc1FmVmuM5vZpq8PKDw
AcTzWZ/GXtq5TFFs6ZJ4dWSP0cq6acoFMRxa7u5Znzx8YqWUa60=
=wbxC
-----END PGP SIGNATURE-----

--Sig_/dT5586B9W4D9elpPeZ3oEWA--

