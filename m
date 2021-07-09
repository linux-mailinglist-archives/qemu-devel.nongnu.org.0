Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCCD3C234F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 14:13:50 +0200 (CEST)
Received: from localhost ([::1]:35784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1pO9-0005F7-E5
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 08:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m1pMJ-0004Mm-A1; Fri, 09 Jul 2021 08:11:55 -0400
Received: from mout.web.de ([212.227.15.4]:50239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m1pMD-0006kS-Ef; Fri, 09 Jul 2021 08:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1625832690;
 bh=WxupXUOaJTmwtGd8jmzUPE4n6QU/vNeNNP1T+Od9hMA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=F0n6sgq2rFhuYssYt6FaSzE4wEKOqYJrJ5CxkDkawT0ZZwzNiNNCjrhw06G5tCYIU
 WKBlCgKU5RqxTTm+oMA4Fhv7LFQ4eZuyAu0H3AtViUuTMIjk7f+oEJ7OaPZ3Im/y7E
 +bJzJ/KqV9T4hdY3GiK8xHb/Rb1UdYBYnVc3r1rc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.194]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lo4Lo-1lUwNF3uJs-00g3uQ; Fri, 09
 Jul 2021 14:11:30 +0200
Date: Fri, 9 Jul 2021 14:11:20 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 1/4] replication: Remove s->active_disk
Message-ID: <20210709141120.43767203@gecko.fritz.box>
In-Reply-To: <2351e7bf-f664-9c3a-126f-4741449ce0dd@virtuozzo.com>
References: <cover.1625680555.git.lukasstraub2@web.de>
 <dd6c3cd4bc77138918c31d590569bdf77b7cef0b.1625680555.git.lukasstraub2@web.de>
 <2351e7bf-f664-9c3a-126f-4741449ce0dd@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aFn9h9JJR4DWLfvrbd8ACpV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:lX9hYzJheciNS0PZEJuO2HAujWSsHPqJPLCj+3sp4HDEhZi5zN3
 KkUtf+CzdXkO9twvFO1/VuUxkirJfOnTO4fX4MfFnL/IjsVWGVqGKHII/wGmqUTVUd33ttf
 uEBXCTVHNJW/shR/QxXMe5t4igsmyw+aqTxOKqOlHako4Z8TwuUxKlubne5laGtLd6F0BkM
 N8M3AyhGB2q0U4qD1xWyw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tA8Uj4ry5C8=:xr8PIRCAkRJ5xn3AAgJlt7
 fiIeuOb1h7XNRsWoGK4s/0dF+gPxdkSDaD2LOo0NY6pjyvmhMoenFYIcZEWEI6hB/1520U4y5
 FhBxCXWNzdqTryC3UlE7T68JGtf7jbdOnJevvrP5at9c9u8YqEYPkSu9ISLJhLlkoknpzCahl
 SBSB1HhmOsbcGgbwt5KStGeNTn4uhQs6wZKRDTYs6kVfaXMhJ9fln8qKcqBvodB7Jk5H0D5Z+
 yHYXSCWbyTpAPgvRHXXYxlVm9lYRbfsEYLHdGSZDpkXFCfqrhWQ7gnN0vd7MVVn8ObcWBWx//
 fmEZvEVWx7Nwbu4rijcab5QCusSuXyFTlWqFlmkhgTs003xseggebNnvLsfvl2FnfM/hbt/5Z
 RVLple8FduO1WLTBi7543x5DSPDhwXNmvJ9B8ECKj2LLFeZKUy2BhxBjlQU64bJC7vyQ6fGGj
 bfScn0nS7zpYwBUtAsjgceH8Cdi1MFdsAfMe2PFNJkNi43S8Q4cDcXsyhxOSuk+wtDrqGV9Yc
 3Os0vtDWAGZKCxXsfBsSfyBo4UxULWW7OJZCG9xyc2dCFftRDWKW8MRc5egyD2fyUl8YigQqZ
 n+57XjXWEzlkmaaJFJJUPZ2ICAu8Zi+2Loveb4Cp2sB2bvQiGATxjL6Mn3mnWPJFP3IJseM05
 t8RaYMGbCGTQ8JKH56l20JTmBnQ4jbAzAei0AMj0CPJ8lmX/xn+qBhFQ1DIF7sR18CHkhJqTk
 K7rCfnUmrzvF9oP68oMlNlDQLKKYkxpt0raluWPWhQX5CEDt1V1/tYEruavc1h8vBsVug9o92
 Y2QP4ZHoVgv5yZ6Ahuwh80344WfpQ9dEmuMjA3W6ISNjrnvkKkzFYW7VGotG6pzIw5apfGEGe
 rEvzWfNyQpebHXnwvrdtpC7zSvDfD742kmDg6/jpsHJ9Fo0Ue9hKVHbNu2t2Cz6afg5fFstNw
 jfykzOy5Ubss9xczNoeix24YORK7LuyXwWiIdTwVXNNZJJ1EoYGOza0dQ3iwTKWeHVCak5wFg
 CiPwulR9MpfCM2SLMB0nj5/O9gIFHVcQ2LDqyeS9MANDc1Q0Yaszt+Xkp7GmptPRoWo97ntaA
 dHVLvdYSm5OB05JniVHbCJceOaesol6NsN6ljvKSApcjBZ/RcEB6OgH6A==
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/aFn9h9JJR4DWLfvrbd8ACpV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Jul 2021 10:11:15 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:

> 07.07.2021 21:15, Lukas Straub wrote:
> > s->active_disk is bs->file. Remove it and use local variables instead.
> >=20
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> > ---
> >   block/replication.c | 38 +++++++++++++++++++++-----------------
> >   1 file changed, 21 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/block/replication.c b/block/replication.c
> > index 52163f2d1f..50940fbe33 100644
> > --- a/block/replication.c
> > +++ b/block/replication.c
> > @@ -35,7 +35,6 @@ typedef enum {
> >   typedef struct BDRVReplicationState {
> >       ReplicationMode mode;
> >       ReplicationStage stage;
> > -    BdrvChild *active_disk;
> >       BlockJob *commit_job;
> >       BdrvChild *hidden_disk;
> >       BdrvChild *secondary_disk;
> > @@ -307,11 +306,15 @@ out:
> >       return ret;
> >   }
> >=20
> > -static void secondary_do_checkpoint(BDRVReplicationState *s, Error **e=
rrp)
> > +static void secondary_do_checkpoint(BlockDriverState *bs, Error **errp)
> >   {
> > +    BDRVReplicationState *s =3D bs->opaque;
> > +    BdrvChild *active_disk; =20
>=20
> Why not to combine initialization into definition:
>=20
> BdrvChild *active_disk =3D bs->file;

Ok, will fix.

> >       Error *local_err =3D NULL;
> >       int ret;
> >=20
> > +    active_disk =3D bs->file;
> > +
> >       if (!s->backup_job) {
> >           error_setg(errp, "Backup job was cancelled unexpectedly");
> >           return;
> > @@ -323,13 +326,13 @@ static void secondary_do_checkpoint(BDRVReplicati=
onState *s, Error **errp)
> >           return;
> >       }
> >=20
> > -    if (!s->active_disk->bs->drv) {
> > +    if (!active_disk->bs->drv) {
> >           error_setg(errp, "Active disk %s is ejected",
> > -                   s->active_disk->bs->node_name);
> > +                   active_disk->bs->node_name);
> >           return;
> >       }
> >=20
> > -    ret =3D bdrv_make_empty(s->active_disk, errp);
> > +    ret =3D bdrv_make_empty(active_disk, errp);
> >       if (ret < 0) {
> >           return;
> >       }
> > @@ -451,6 +454,7 @@ static void replication_start(ReplicationState *rs,=
 ReplicationMode mode,
> >       BlockDriverState *bs =3D rs->opaque;
> >       BDRVReplicationState *s;
> >       BlockDriverState *top_bs;
> > +    BdrvChild *active_disk;
> >       int64_t active_length, hidden_length, disk_length;
> >       AioContext *aio_context;
> >       Error *local_err =3D NULL;
> > @@ -488,15 +492,14 @@ static void replication_start(ReplicationState *r=
s, ReplicationMode mode,
> >       case REPLICATION_MODE_PRIMARY:
> >           break;
> >       case REPLICATION_MODE_SECONDARY:
> > -        s->active_disk =3D bs->file;
> > -        if (!s->active_disk || !s->active_disk->bs ||
> > -                                    !s->active_disk->bs->backing) {
> > +        active_disk =3D bs->file; =20
>=20
> Here initializing active_disk only here makes sense: we consider "active =
disk" only in secondary mode. Right?

Yes.

> > +        if (!active_disk || !active_disk->bs || !active_disk->bs->back=
ing) {
> >               error_setg(errp, "Active disk doesn't have backing file");
> >               aio_context_release(aio_context);
> >               return;
> >           }
> >=20
> > -        s->hidden_disk =3D s->active_disk->bs->backing;
> > +        s->hidden_disk =3D active_disk->bs->backing;
> >           if (!s->hidden_disk->bs || !s->hidden_disk->bs->backing) {
> >               error_setg(errp, "Hidden disk doesn't have backing file");
> >               aio_context_release(aio_context);
> > @@ -511,7 +514,7 @@ static void replication_start(ReplicationState *rs,=
 ReplicationMode mode,
> >           }
> >=20
> >           /* verify the length */
> > -        active_length =3D bdrv_getlength(s->active_disk->bs);
> > +        active_length =3D bdrv_getlength(active_disk->bs);
> >           hidden_length =3D bdrv_getlength(s->hidden_disk->bs);
> >           disk_length =3D bdrv_getlength(s->secondary_disk->bs);
> >           if (active_length < 0 || hidden_length < 0 || disk_length < 0=
 ||
> > @@ -523,9 +526,9 @@ static void replication_start(ReplicationState *rs,=
 ReplicationMode mode,
> >           }
> >=20
> >           /* Must be true, or the bdrv_getlength() calls would have fai=
led */
> > -        assert(s->active_disk->bs->drv && s->hidden_disk->bs->drv);
> > +        assert(active_disk->bs->drv && s->hidden_disk->bs->drv);
> >=20
> > -        if (!s->active_disk->bs->drv->bdrv_make_empty ||
> > +        if (!active_disk->bs->drv->bdrv_make_empty ||
> >               !s->hidden_disk->bs->drv->bdrv_make_empty) {
> >               error_setg(errp,
> >                          "Active disk or hidden disk doesn't support ma=
ke_empty");
> > @@ -579,7 +582,7 @@ static void replication_start(ReplicationState *rs,=
 ReplicationMode mode,
> >       s->stage =3D BLOCK_REPLICATION_RUNNING;
> >=20
> >       if (s->mode =3D=3D REPLICATION_MODE_SECONDARY) {
> > -        secondary_do_checkpoint(s, errp);
> > +        secondary_do_checkpoint(bs, errp);
> >       }
> >=20
> >       s->error =3D 0;
> > @@ -608,7 +611,7 @@ static void replication_do_checkpoint(ReplicationSt=
ate *rs, Error **errp)
> >       }
> >=20
> >       if (s->mode =3D=3D REPLICATION_MODE_SECONDARY) {
> > -        secondary_do_checkpoint(s, errp);
> > +        secondary_do_checkpoint(bs, errp);
> >       }
> >       aio_context_release(aio_context);
> >   }
> > @@ -645,7 +648,6 @@ static void replication_done(void *opaque, int ret)
> >       if (ret =3D=3D 0) {
> >           s->stage =3D BLOCK_REPLICATION_DONE;
> >=20
> > -        s->active_disk =3D NULL;
> >           s->secondary_disk =3D NULL;
> >           s->hidden_disk =3D NULL;
> >           s->error =3D 0;
> > @@ -659,11 +661,13 @@ static void replication_stop(ReplicationState *rs=
, bool failover, Error **errp)
> >   {
> >       BlockDriverState *bs =3D rs->opaque;
> >       BDRVReplicationState *s;
> > +    BdrvChild *active_disk;
> >       AioContext *aio_context;
> >=20
> >       aio_context =3D bdrv_get_aio_context(bs);
> >       aio_context_acquire(aio_context);
> >       s =3D bs->opaque;
> > +    active_disk =3D bs->file;
> >=20
> >       if (s->stage =3D=3D BLOCK_REPLICATION_DONE ||
> >           s->stage =3D=3D BLOCK_REPLICATION_FAILOVER) {
> > @@ -698,7 +702,7 @@ static void replication_stop(ReplicationState *rs, =
bool failover, Error **errp)
> >           }
> >=20
> >           if (!failover) {
> > -            secondary_do_checkpoint(s, errp);
> > +            secondary_do_checkpoint(bs, errp);
> >               s->stage =3D BLOCK_REPLICATION_DONE;
> >               aio_context_release(aio_context);
> >               return;
> > @@ -706,7 +710,7 @@ static void replication_stop(ReplicationState *rs, =
bool failover, Error **errp)
> >=20
> >           s->stage =3D BLOCK_REPLICATION_FAILOVER; =20
>=20
> For consistency, it seems right to initialize active_disk only in "case R=
EPLICATION_MODE_SECONDARY:", like above..
>=20
> But then, it becomes obvious that no sense in creating additional variabl=
e to use it once.. So here I'd just use bs->file->bs

Ok, will fix.

> >           s->commit_job =3D commit_active_start(
> > -                            NULL, s->active_disk->bs, s->secondary_dis=
k->bs,
> > +                            NULL, active_disk->bs, s->secondary_disk->=
bs,
> >                               JOB_INTERNAL, 0, BLOCKDEV_ON_ERROR_REPORT,
> >                               NULL, replication_done, bs, true, errp);
> >           break;
> > --
> > 2.20.1
> >  =20
>=20
>=20
> Anyway:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>=20

Thanks,
Lukas Straub

--=20


--Sig_/aFn9h9JJR4DWLfvrbd8ACpV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDoPOgACgkQNasLKJxd
slgN7hAAgcOYyHmfRdonqitBZrpSIuebN5QeGMRqNSxb5YdBLMerW/9XzkIwwDm+
blJ2mlTYZLFwdv4aS9vXsejvuEk6sVvi/RISAciq6UT1vbc9YF95SPuhMePV4WFJ
FTAjtXVcRufKe1f0DRQbMjjVBg4TSwbNscXFz5vp1vi49t0QSJtHUO783hRbHArE
XqnOnMbTllKJLxFPCI6605BF3ke9WbODrQtdP+ANbdTHYvtRu13Kv7o/sYF7nMit
GcrWy/kokkGsxr3izlFB6Fe7DhVNCOuAEADBmlXyNmr4aX/cul7Ag+oEjMySpIke
WqCdUq9RmgmrJvIx1KIvZuT19yq+WXnIrSs1gon5AI8kNd9BpLSFVCdm3Jm5hqFw
hpST2kcRDZQ/6zEyBI7nESE076hqv8/Aqt+0Jp33Mb3elUd3apsIOnRAg1nmpNEU
DsUp4NB4reLCkO8erHBdjkhpxUcNsB8wYa9SnGwtcnHQzrBw9cQZsZ5Dc5NYU29D
tgVaPsksAsEGXDyQnZtGC0tTpXZ9DB6+bemNHmz0aYb503p99FA5o9fsUMfx9fq4
z/VHxOFpHZHbcI8tGSMDPD5RBO57ihqig5nZFsufRPuAUgmxwLJobfjkmr2YRkZZ
taC18cmwUeIWHPcO7dhro4Ju5xOzyEzcVIZuCyy03FfCvbIf47M=
=dF2R
-----END PGP SIGNATURE-----

--Sig_/aFn9h9JJR4DWLfvrbd8ACpV--

