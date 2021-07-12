Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCAE3C5B2C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 13:15:54 +0200 (CEST)
Received: from localhost ([::1]:59596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2tuj-0008TX-MD
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 07:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2tsf-0006SO-MF; Mon, 12 Jul 2021 07:13:45 -0400
Received: from mout.web.de ([212.227.15.14]:53743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2trW-0007MO-23; Mon, 12 Jul 2021 07:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626088337;
 bh=TbV8guR5dWJ7t/o/2CW8Ha8vRwSmNNELkUspntiv2W8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=seyUsdKjHFWlj2pvc8mJQyuHL7Q+qD0Tr9GTiOrO3qFkQHjXbLPQmjp7kWOYbfnfD
 /zbk44l3DXSNPvcNtvPFgdCBPjLDTBUnpFvTLLZOIs2xoVQJBOVi/rH2WQ7S+I5cU8
 38fhhgND/Ymb3qhGVwpGOLub1eah774zjdqkLDt8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.76]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LyUy6-1l7LQl0Phe-015pj2; Mon, 12
 Jul 2021 13:12:17 +0200
Date: Mon, 12 Jul 2021 13:12:07 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 4/4] replication: Remove workaround
Message-ID: <20210712131207.59b03db9@gecko.fritz.box>
In-Reply-To: <3dfeee12-4803-36fe-504a-77537e8ebad7@virtuozzo.com>
References: <cover.1625680555.git.lukasstraub2@web.de>
 <906c163474aa1fcdf4ffa3cdfb4ad39cb7fc49cb.1625680555.git.lukasstraub2@web.de>
 <1d86fa67-930c-2a6c-ab01-37a798c794d1@virtuozzo.com>
 <20210711223318.65e8e50c@gecko.fritz.box>
 <3dfeee12-4803-36fe-504a-77537e8ebad7@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+ktIwLEg5/gZbxVchWn_eL4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:CzJPW+LAa9TIh1mta6G7hmaiJpiP0gWswXJisQCDSCGjLdDDvq9
 HuyfY8okAri4eGHyagQmW5KkdHQZ6q+2+cm8uKjRluUZoSFODNaxifNilV9TR7VpKrMq+Nd
 NS8E1Lk04H1Ttiym1O9zsxHk8UxZHGNOV9pYQ7cgfWZCZ9/Cpqh1L3TtrKQbRG8G50sAqAg
 gQfBM0XmyQv73RlWie2DA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gTgs/oxDMqE=:MRHhjDaHR6oVMZgQgCOBIK
 ct1exyGnUKRSA/JAAHJUSIdNnwfbVxQSXnZrxh3u/8yvEmGcyMuGW8Ipaod/3xX8H57NTE46U
 7hWBwXaePl0s00/9SQztalSv5ohD6yex/xvk4DmSr7lYMdexyUMyUzAchKi0vOdFkdV72Dz0k
 iEVOJZoBY1G3NE1les5EmMzNkK9YmlXDWEmH5PzOY/0ACy2SX5bOyB1+DnIX5I1Gmwk1204VP
 T2s8qQZGT+ia2sExOUbivnYEFrNQLroXrX5yW3oeSaVs9dtSTwjojHF3rj1owke5fWad2W165
 EXx9/ghK68MdOcdl+9xZ0DiyBBlCfK2uIxjDbNCBl6dB/YKKIBRnQA/FltrZEqjuHU6GF9n+M
 nX3j7JpTsy7BpLA60neKnWGCXL+VlMrP5oZAuRn0AjEc+qE67afx1hh79D59rCX1cxQaks8ST
 p2r0m8TcVhhkAil6eTHDnA/mH114hp9vf6B9ux3pYuh4PCJetp2evxevwSCwbBEO16VinUS2f
 qaLl7iEvdYWsE+oeoNEQSdOcfchY3mDX16utJDfcH910zHCoV0b4cyiFvZ141xPgKOzM7oqvj
 p11XnTTJAKR4Qrp5obk9YLL3//NggDrMQvR45HgTGXg7NwQEkoFEcnZhf9NCJDd8+gB2XBK/I
 KuId4LOBjzMR/sJ+T3zmHD7McnSh33vpidxQTMW3TdYvH+JEl5/bO1XRBjHY90AHwHkrMIukF
 wPp+GhBTiEpLtn5UcpWMq11JPcbrhPHmQ9CQBkDQe3MERRu7TtarHbT5wLq/WzTw+z0IukGN+
 szinhSe0eNqG+I4w+drfeESnGHp2UX8SEoWFtFD1L/iLnBAG8CayH5gGI6mFAwNPyeRybfiJc
 PmM+/XIQzlS6GIesykC/be7GfSyGBEqyfZeTXuxJ/OhbTF54gpb8eaDArfmvYxs+conNsPXLo
 6jTv2hp+ebTkth0TJgIy37NH4gIEXos+UEoV07fPJ9NeIqWNxcRQ8yZKcuPucScFkRX6pj01X
 yCRXdjbP1PCylQIXaAe94OkLgFtRHcK1rc7daMzwCqXde4AtxH2yUTFNP5418065uVv4T7isA
 OsnRISbhpuR+KmRSZshQknrVsYreyrl8MXF
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

--Sig_/+ktIwLEg5/gZbxVchWn_eL4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Jul 2021 13:06:19 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:

> 11.07.2021 23:33, Lukas Straub wrote:
> > On Fri, 9 Jul 2021 10:49:23 +0300
> > Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> >  =20
> >> 07.07.2021 21:15, Lukas Straub wrote: =20
> >>> Remove the workaround introduced in commit
> >>> 6ecbc6c52672db5c13805735ca02784879ce8285
> >>> "replication: Avoid blk_make_empty() on read-only child".
> >>>
> >>> It is not needed anymore since s->hidden_disk is guaranteed to be
> >>> writable when secondary_do_checkpoint() runs. Because replication_sta=
rt(),
> >>> _do_checkpoint() and _stop() are only called by COLO migration code
> >>> and COLO-migration doesn't inactivate disks. =20
> >>
> >> If look at replication_child_perm() you should also be sure that it al=
ways works only with RW disks..
> >>
> >> Actually, I think that it would be correct just require BLK_PERM_WRITE=
 in replication_child_perm() unconditionally. Let generic layer care about =
all these RD/WR things. In _child_perm() we can require WRITE and don't car=
e. If something goes wrong and we can't get WRITE permission we should see =
clean error-out.
> >>
> >> Opposite, if we don't require WRITE permission in some case and still =
do WRITE request, it may crash.
> >>
> >> Still, this may be considered as a preexisting problem of replication_=
child_perm() and fixed separately. =20
> >=20
> > Hmm, unconditionally requesting write doesn't work, since qemu on the
> > secondary side is started with "-miration incoming", it goes into
> > runstate RUN_STATE_INMIGRATE from the beginning and then blockdev_init()
> > opens every blockdev with BDRV_O_INACTIVE and then it errors out with
> > -drive driver=3Dreplication,...: Block node is read-only. =20
>=20
> Ah, OK. So we need this check in _child_perm().. Then, maybe, leave check=
 or assertion in secondary_do_checkpoint, that hidden_disk is writable?

Good Idea. I will add assertions to secondary_do_checkpoint and replication=
_co_writev too.

> >  =20
> >>>
> >>> Signed-off-by: Lukas Straub <lukasstraub2@web.de> =20
> >>
> >> So, for this one commit (with probably updated commit message accordin=
gly to my comments, or even rebased on fixed replication_child_perm()):
> >>
> >> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> >>
> >> =20
> >>> ---
> >>>    block/replication.c | 12 +-----------
> >>>    1 file changed, 1 insertion(+), 11 deletions(-)
> >>>
> >>> diff --git a/block/replication.c b/block/replication.c
> >>> index c0d4a6c264..68b46d65a8 100644
> >>> --- a/block/replication.c
> >>> +++ b/block/replication.c
> >>> @@ -348,17 +348,7 @@ static void secondary_do_checkpoint(BlockDriverS=
tate *bs, Error **errp)
> >>>            return;
> >>>        }
> >>>
> >>> -    BlockBackend *blk =3D blk_new(qemu_get_current_aio_context(),
> >>> -                                BLK_PERM_WRITE, BLK_PERM_ALL);
> >>> -    blk_insert_bs(blk, s->hidden_disk->bs, &local_err);
> >>> -    if (local_err) {
> >>> -        error_propagate(errp, local_err);
> >>> -        blk_unref(blk);
> >>> -        return;
> >>> -    }
> >>> -
> >>> -    ret =3D blk_make_empty(blk, errp);
> >>> -    blk_unref(blk);
> >>> +    ret =3D bdrv_make_empty(s->hidden_disk, errp);
> >>>        if (ret < 0) {
> >>>            return;
> >>>        }
> >>> --
> >>> 2.20.1
> >>>     =20
> >>
> >> =20
> >=20
> >=20
> >  =20
>=20
>=20



--=20


--Sig_/+ktIwLEg5/gZbxVchWn_eL4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDsI4cACgkQNasLKJxd
slhgpg/7BwhJ83Oe+7xPf3JvC4Be7nW+LsPiaMMk0xNfnfWNtZNYxxtKB4kFvpyP
/MvD2EYuo3j6pDHg06LsXnHRnUV+o6DBbn2p6i8JDNzK2xhpTnCxN/QB85mtPoGg
vPHR1BEEl5wNbwianAEPAenrm6Nqd2pis6Hjyvq8j4pE6SrYCxBffGYWe/3DcUkM
Q0D8N4oS1PMYi+x+2XbYzcAuhKsxW/iqtK0w0HPuj4E5jTY31gB3ShUT6EaLBQ6o
sCkjAGKFL94MinFvGrPVUM7/IGvvxe90uIHKcIDtKAlNe93xbZ32EIjSu4Y9KB9b
3KE+SpaBEAX0jgCC03kyJM4N4slmIp08mCTPx99ubMuGchD1C6W0e4jDlMb/HSR2
AYA2CNje3kIkOxBVdI71mkawLzQVlJtbgZhP2voxlqIExD3CEXpZlT+NqcDO2VzJ
n9iCfVFczWTMljbCcGj+0D53a7y2rRFXAN6dPaj9/MwI1BpTf2JnAiq51wSXZ0do
WZzBWsBjuE608c/RL+Ezk5c6agfpk48u6Sc5M6s/EGByZ59u4fN2a0+4DGJlDARo
9mzZlDAOrH971kAHau7PvS75NtQQOCCm1d7amQ7vqDKyR4mfC3q8c7Qj5i+CJQqG
zVOqnZP86sAhSpq3n17Tkd/rawkF06ZLx4hWaHs6YjyuR+ftz2s=
=G49d
-----END PGP SIGNATURE-----

--Sig_/+ktIwLEg5/gZbxVchWn_eL4--

