Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB14D3C3F45
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 22:43:10 +0200 (CEST)
Received: from localhost ([::1]:49280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gI9-0001WX-T5
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 16:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2g93-00031b-LP; Sun, 11 Jul 2021 16:33:45 -0400
Received: from mout.web.de ([212.227.15.14]:42499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2g91-0006Vg-Om; Sun, 11 Jul 2021 16:33:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626035607;
 bh=dVGAZd/c/b+BR7KEKl5PrQk5rtj6IqYJ8g0QO6exBxI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=hT0YMxBHapwTMg4EE1PJQlxWr5gdcbuumtuWsVpzKb54+FTo7KwNMzclvP02JQXNg
 HwzWKnAvxL94fCdc/pT5123lpgCQIxabdEblak+0lIAIEFf1xe4Vn7S7rh4XTiQXjo
 l6Lj49W8sD1h2br+TnOPtaZKZrNUlEx91qyb0pNU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.236]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mo6Jz-1lMDim1vel-00pOG0; Sun, 11
 Jul 2021 22:33:27 +0200
Date: Sun, 11 Jul 2021 22:33:18 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 4/4] replication: Remove workaround
Message-ID: <20210711223318.65e8e50c@gecko.fritz.box>
In-Reply-To: <1d86fa67-930c-2a6c-ab01-37a798c794d1@virtuozzo.com>
References: <cover.1625680555.git.lukasstraub2@web.de>
 <906c163474aa1fcdf4ffa3cdfb4ad39cb7fc49cb.1625680555.git.lukasstraub2@web.de>
 <1d86fa67-930c-2a6c-ab01-37a798c794d1@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U1ifeibfjPgd/swuKinrV_c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:BHSrRZjDVHeopv7ZPuldq18NgctmFJjBNAAvLLG/iSD5Wpzez1B
 X7gyPJU3G+Zz3IzWT+DtcXrhNk5zRYJ5QW7XyDzHv5k/7KcwkQfPgQBWSnBWsCDdXuVdLSl
 565a8+pxJB6kguwvlrX/YE12KCh+VdCqRm6W8z0wpKcqpPKWiffPGuuhizXuY4gPI/ElWn5
 5hSo0qJS0RIVp1ijHrA2w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u1hOl1JsBhg=:MtyKI6HC3kzl59k6p71xky
 671zONgBidJ5Nyw9p5E1ZoKEqMz6BMvlaHA7GKNRx9gwjzuoaXOO59lG5t2VswzcSj7n8ScMI
 CZ74Y6dZuyJpyoXM3n5ZjsTjGM23ZpsRLjNck1zdFrKTxIummxMyCTo2KzVa/zdLecds6HRJV
 8kHIWEVX4YH6WuJ/gHSVA7nlRpeH0yajwtC16Z5F9BVbWWxUFrq8lpdT+5N6i8NR7cTuDpuOY
 IdoLnU8SqDa9MHLnr96GJyjfvE/UpTxGWW+YIM2ipYD7gZKHhPKf5P8CstaToyhBk/8Fkt3P6
 /Cty9K8hPdcatTpYmkhcmBcBV8ThMCcAEfjRneWt9Az8ig0AKe9zevk908c+bKwDaBInt5XTl
 LG2GzMxRCTLeZbP4kFFizltPe0rWSobeGyxXDkvCUIij1IP6fdEQ2nJtjZ/OwicPv0MDilpDE
 4nQRgeLOvkE/PNkx5F8L1dm5eHePWAo7RB8P9x7EcPt+tCBY9IuJpXz8yIsSDInAQXkn5/8mC
 8EIeL8vCVZTQlAdSQGHI4LLaWxGFxqfASFB4FFY2OIaBqOJ3cbvzUzF0IwfAaRqh98tuMbD8t
 EMgmZQvcXEPh/hrr9CiXdDKJtbEwTy2aSow1KJUeZQXgNRIDSmtRD2KjTG+CfLvhX74rGNVpz
 ttG3VEKsHo220naP6BNlGLL1OVoUJFTS4dZ+9N8FkEfoNse/TVO99HVOALrk1hzgMPCNuJ24z
 Bw5ju+ua92QMDfQ++lGNs5U4hABn1VuDiw77FfL4r3EecqZvfiWADg6GJPXO+A8lwySvHYFg2
 wGZ67Hbc3WJrk+kBwUoTr8U1PmQgcFUeYKAqQ3URHfUfdlBBGfUaCsisIqtdlMNU773vutC24
 qNw6qQM9wZO3JXwuIRVyz0og9NH04/K0qtEVxefQSoC3G5YTEThCFgpbl5yBWTEtNbTnoO95B
 A1VqNo6u0HV7zvSd3289Br26SYxLJrstrPEMhuAe5TudgBJUhIzjpsGKAFTMnlTqk4TNNVNB7
 mvHEFG7ofGoU7xF91MY6+Gjn32dmpzr/K3nfzb4VFcf9OPSdigAZBIxxZTi9khljIJCl8mGSJ
 yb3z8/XpvmbfmuB3VdKNQKkRmxxkYB5s2sM
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/U1ifeibfjPgd/swuKinrV_c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Jul 2021 10:49:23 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:

> 07.07.2021 21:15, Lukas Straub wrote:
> > Remove the workaround introduced in commit
> > 6ecbc6c52672db5c13805735ca02784879ce8285
> > "replication: Avoid blk_make_empty() on read-only child".
> >=20
> > It is not needed anymore since s->hidden_disk is guaranteed to be
> > writable when secondary_do_checkpoint() runs. Because replication_start=
(),
> > _do_checkpoint() and _stop() are only called by COLO migration code
> > and COLO-migration doesn't inactivate disks. =20
>=20
> If look at replication_child_perm() you should also be sure that it alway=
s works only with RW disks..
>=20
> Actually, I think that it would be correct just require BLK_PERM_WRITE in=
 replication_child_perm() unconditionally. Let generic layer care about all=
 these RD/WR things. In _child_perm() we can require WRITE and don't care. =
If something goes wrong and we can't get WRITE permission we should see cle=
an error-out.
>=20
> Opposite, if we don't require WRITE permission in some case and still do =
WRITE request, it may crash.
>=20
> Still, this may be considered as a preexisting problem of replication_chi=
ld_perm() and fixed separately.

Hmm, unconditionally requesting write doesn't work, since qemu on the
secondary side is started with "-miration incoming", it goes into
runstate RUN_STATE_INMIGRATE from the beginning and then blockdev_init()
opens every blockdev with BDRV_O_INACTIVE and then it errors out with
-drive driver=3Dreplication,...: Block node is read-only.

> >=20
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de> =20
>=20
> So, for this one commit (with probably updated commit message accordingly=
 to my comments, or even rebased on fixed replication_child_perm()):
>=20
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>=20
>=20
> > ---
> >   block/replication.c | 12 +-----------
> >   1 file changed, 1 insertion(+), 11 deletions(-)
> >=20
> > diff --git a/block/replication.c b/block/replication.c
> > index c0d4a6c264..68b46d65a8 100644
> > --- a/block/replication.c
> > +++ b/block/replication.c
> > @@ -348,17 +348,7 @@ static void secondary_do_checkpoint(BlockDriverSta=
te *bs, Error **errp)
> >           return;
> >       }
> >=20
> > -    BlockBackend *blk =3D blk_new(qemu_get_current_aio_context(),
> > -                                BLK_PERM_WRITE, BLK_PERM_ALL);
> > -    blk_insert_bs(blk, s->hidden_disk->bs, &local_err);
> > -    if (local_err) {
> > -        error_propagate(errp, local_err);
> > -        blk_unref(blk);
> > -        return;
> > -    }
> > -
> > -    ret =3D blk_make_empty(blk, errp);
> > -    blk_unref(blk);
> > +    ret =3D bdrv_make_empty(s->hidden_disk, errp);
> >       if (ret < 0) {
> >           return;
> >       }
> > --
> > 2.20.1
> >  =20
>=20
>=20



--=20


--Sig_/U1ifeibfjPgd/swuKinrV_c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDrVY4ACgkQNasLKJxd
slhhrg/+Pypzak+DdvyxNcWjWBQ+7gloJZCDwDko5zt7K6vOjHuBkCJi9KhlQPX8
SQ9sTuYsdHNOOi0E9WHRTqBkMe316WbC9p7txbD0Q7DU/7Ctqd3T/1dwJjCLLxGI
6pUkMqzYrIju3VcWJJF8tdD4ohwG+Y+m/TjXirEWwA3Hsf5X5HvmF/imli+9UKCp
M1gWCZCAcBCkgDTfI/ZnL7LcRe9J4LoU+N0aXO8JkBLAqqxT27zFwgFXpsFbWEp1
3fFJIqaaRsGZF8Plch8gJO//VuYfKa3SdO+eXwY8LMEto0us9Z2/YTjhslcr55bL
8Eim+/G9wxWsEvV0kPo0FeDcbplgcko8ENtc6Od1lu8dToqX0luy18mQJw2w3Eg5
gcociaONdPGhkt6dQWtpfKfQeskpwwxezJafVDejkJx1cJem45jpUSxJLBVTJpSn
wYVh9I60IySHqgf6tCKAYN/NH1qpuOSuzT3/RcOer7/dPzRL1RnuhZezjez2vx+4
7t3Gso+jUILzTNEmfxrxO+4r0Bkcgb803VLts5QE/jV1kKJ5WvpLdTCdtSszoSR8
3C56uCti/JagUmWVzIYulFZTnts0IMsCHYEg0FN/rdRt6J0kgzpu0qtCTyrbUhpF
1QaOIZFv0dldkpYab8U3/FGmrQv0PsEXhaOR6igvsyfGhJBccv0=
=LyPG
-----END PGP SIGNATURE-----

--Sig_/U1ifeibfjPgd/swuKinrV_c--

