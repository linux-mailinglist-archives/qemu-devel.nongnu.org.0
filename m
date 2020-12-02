Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121022CBD18
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 13:37:00 +0100 (CET)
Received: from localhost ([::1]:41096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkRNT-0006iw-5V
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 07:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kkRLf-0005Kf-BQ; Wed, 02 Dec 2020 07:35:09 -0500
Received: from mout.web.de ([212.227.15.4]:47303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kkRLa-0001WQ-Kp; Wed, 02 Dec 2020 07:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1606912494;
 bh=IlD6yMPjz4mmMchDwayrAp6MGLVs2d8uODALOTDmBSs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=VrqPQXFw4A0VyD5w/Gw/4iZc0cy3PB21ly1tvCKXK3PzeUjEwi286+KiGWbLwEN03
 WpwYCd+nrgmVX2AunxwIzzub3hTLCNLy5+8OYy/8ueQAKG2t5M9naup7g+4MsPqapM
 pxSJhtyyApgOjqblwUxvworxKfRi3Y9O0+N097Hw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([87.123.206.35]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lm4TR-1kApPb0HoX-00ZgPX; Wed, 02
 Dec 2020 13:34:54 +0100
Date: Wed, 2 Dec 2020 13:34:36 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v11 2/7] block/nbd.c: Add yank feature
Message-ID: <20201202133436.45df98f4@luklap>
In-Reply-To: <aa30fc7e-5817-6986-54a7-56731e8c043f@virtuozzo.com>
References: <cover.1605439674.git.lukasstraub2@web.de>
 <14b78aebabb64b9f2ffaac025ee3b683bd7c9167.1605439674.git.lukasstraub2@web.de>
 <aa30fc7e-5817-6986-54a7-56731e8c043f@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iyP9Ru18d0+Qdb2KHmw3dlU";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:65e0F+lTxVbfi8x2o8jtDl1jGpDz0G+4CQ6+BTbkzLy7d6jrjpv
 VrO024vfYy7xB4cvi8gw/jGNSN9W9GSSX7aqDbNTaAztOfcWdkzRvo/fEjfMIS3X36E1SPK
 HdNPQ19/Jz78jvBbGxhEpzOlcTbFe7gTp9W3aL70mhHPcAskKOvHVSAneDYDcB/y0Ue1CuT
 WnutATsDD2/+cRp7p0oWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mFaGUJnL4fE=:nPUW0nxbl4VgbezyLE5JS7
 vjqmdsOpLZpxhA4WP2Klrd/M88fekRRQW2EAFqjITMxYRoHzM2Gl987Wz7W5DMZNt1xXZKKDa
 G3TlG+UdrkKqOwaj6egP6RP8TyJ/rGdds79/ZyCE47TbDp+o+4Y7UFuvbiGK8WuiRh1mRTaC+
 aH/Lbk47eKF+J6HbE9l0a2yDKw1TFZfogPzllr8f5hbYp9Mah9rALpQpxZ7kzAbGUAfxs8M13
 rncNZ1EdkBw/iz+1Td1mrM2pYPCtOTLeJxssH1DGdEvj/hF/YRWnn0dMcnUhbjcN0JVLUYRUZ
 RBRY80wlzzxitoz6ZsPUnLIVemh44JHbDSxCwAzcNC9OFdNxnYNoTK8jSY+fICYbxVFRydo/S
 BWoDiZ7NLH8eRDCxUWtQ+dynAL11SvhoCMznMfwGlbKfM2PSAUdvqYbairSzeURrjumYPZkIO
 AnhAYFLcIkBHxIFq+uN2xXz03xXZwrfs3WrR3QpxhfX9E07kbeROzpbbYhZziUlM6I4wStDm+
 Kw65Y/9bmd5uDcpUYItHySlV8xmjYmucsze9UkchefwxumWET5iShribO8C16PRowoPfaFDHJ
 pVnvjYXkPjd5fNeNaXX2jPWGVf6EShPi2lYKFDRg4lVXj/DdcaZU+aatz8Ij9HBtuot0tUSYE
 6nyzTblMjvZNO3yuPkI1CUNwivxtIH6i4ECSJrbCCkBlXmTNAOnNY2xjWCFsyHtW7/0LGWHpS
 pxUjG0XeoeIalQGKV61jm/WORbKrZzriGc0+iLlIGNEgye2BfGpuySs4fplzm8l/mX8EvzdD4
 SPQxLsIFOZDbJC1jXkzzR4Lji9AkeUV089sndTSf8rbWSq3ZmgGGcSeolyXXiSMQPZkPeO0/E
 6uD9JZSwmhlwAH4a3ByQhG3rT3eyoLP8qcKTHz+Kk=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/iyP9Ru18d0+Qdb2KHmw3dlU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Dec 2020 15:18:48 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:

> 15.11.2020 14:36, Lukas Straub wrote:
> > Register a yank function which shuts down the socket and sets
> > s->state =3D NBD_CLIENT_QUIT. This is the same behaviour as if an
> > error occured.
> >=20
> > Signed-off-by: Lukas Straub<lukasstraub2@web.de>
> > Acked-by: Stefan Hajnoczi<stefanha@redhat.com> =20
>=20
> Hi! Could I ask, what's the reason for qatomic_load_acquire access to s->=
state? Is there same bug fixed? Or is it related somehow to new feature?
>=20

Hi,
This is for the new feature, as the yank function runs in a separate thread.

Regards,
Lukas Straub

--=20


--Sig_/iyP9Ru18d0+Qdb2KHmw3dlU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/HidwACgkQNasLKJxd
slhWlBAAvJjP3iYwSxc65VSAHoNzO1qJbVupYlRwHqhBrpchB1UalSiqPpz1jNzP
PiI0gq0SohKHcM3w57inWMUekQ+5+NjnIltO5ds2bPnqY3qRanQqfMlmO0r3nqbQ
5O5063Qr+Ql9lMthJ3CmRhZQ40VHKqAwNQDFYD//aD73AGpLkoVe6RA2xNosZOK8
ULwdUXXLsRVRCbAfyjonU+ukkcBnfArErJjgyiUJXqcoRglcICc+UqpZcvXkVELH
iOqGEHdZEGm4KE0xorWVb4V0J8X4qiPOnSGofZn1XGlsseeX+mrmEJZiNE2DHmIe
yWKL1KqDaJAygne8ZQxRMcsO0Af/df6Mwhlt6DLEVAXqa1TnpsxvVBrX080sQ4Bo
MtZGCWAMNsvLPrD6rVf9REwNdcPMBc42nTKSsUc41yfEhQs1BLxCAa7UMlh80qcx
L08n4TyyP6/e4xa0P260iXDE/WAMw4OleHknoTG6fD36a1vdrErqoR/yucbAKvmu
M9FyKUPygc651TWUct4xR+BsXDCK7OQ+5aMDHvnv2QR4zgrQMjWsRcMCRUf3HU8Z
SWEdx7rbgjTJb/Apd23/m2vHrxM9QXhlfX02cpj3navgxD+MuZpCWaABO4FIj997
pAL6SNL4nCBU8ld4K+KgIGPFl7ZnN2i14weWtWporaRFLQcDP3c=
=XtYO
-----END PGP SIGNATURE-----

--Sig_/iyP9Ru18d0+Qdb2KHmw3dlU--

