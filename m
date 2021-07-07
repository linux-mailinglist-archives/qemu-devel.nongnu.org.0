Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAE73BEA1C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 16:55:12 +0200 (CEST)
Received: from localhost ([::1]:37738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m18xD-0000QE-8R
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 10:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m18w3-00083x-Kl; Wed, 07 Jul 2021 10:53:59 -0400
Received: from mout.web.de ([212.227.17.12]:41835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m18w1-0005aO-50; Wed, 07 Jul 2021 10:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1625669619;
 bh=kiqlIouQnx2I/JfxhRKQvnXmCEYSOkv4BEJsjaB329M=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=TgIeAMr0+5bYRKM6w7E9tnvfjhugiZyDV5RCqVZEvNlNOLk8B25Cle+nuuwX7r2KZ
 XO+P/ZvW4UCj6s4F83YRNYL9bLwpxnF2JWtrIRBJRoPxSkOPEJGDnKOQtuddw9R6nq
 Gc4Vu2k2lukB5c3fBWBGm0Iaj/CClirIzHYz77iQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.194]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LdF0f-1lIhIB3YsT-00iVog; Wed, 07
 Jul 2021 16:53:38 +0200
Date: Wed, 7 Jul 2021 16:53:28 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] block/replication.c: Properly attach children
Message-ID: <20210707165328.68e10535@gecko.fritz.box>
In-Reply-To: <3dee7e1a-00ff-5f98-fb22-ffb248e1094e@virtuozzo.com>
References: <20210706181138.1c0bacd8@gecko.fritz.box>
 <3dee7e1a-00ff-5f98-fb22-ffb248e1094e@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tbPlAhHocqNsJIraA+GgC4j";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:OlPhngcn8X/xiYq3Tj2+TnNjQFkoMCVDW2ujzxFKGQ2hEjYXoQd
 7cjJeWSSJZhHdoKqPglZ/tElb3tbHQ50SUncdj5xvQr8n5ICYmrB59nQouXwOfuYa8z+WU1
 Iy55XoPgWh1LtTBlVcHNJuzN0oyCaMNqMPjNRlqrt14uBZBvsrptdM3F78QOmGvl30KtLMK
 ZDMePDv4+opQ2A+gnFMdA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KXm3fTTd+ls=:shGSultk4KkFZnCp556QLU
 2cGUA7bOHimCACYguavQcrPzB3BKbGQFqBZFfKSWr8j8fCgtVqV0i310gZP96rC86kTR0Ia1S
 xq6iZPO1kleyOlVkbHIuFIPZ7jQTrXEdSWHHfwGKCpWJJmeSaq5p+R61+cNYggeWDyaUeJKMb
 qDm624rWZDgzLKZclQPYCQI6kauqES1gRiZN+qh26CvoEY1XK6crAy1OZiy/86m9zA5hEQwOR
 3CaBlSbgnwbzp2jiuZqKTLK/fRZqjtS4CpeisrHt1dwd/4TQdu3moHAOjQ3FCjM1a1hXfKMDM
 WetJ9ARGS9mozvs+e4331MfnfOM1XSXx8KPFQ8S1socZsmw3WvSyt6ARxHDMRUdkyarkc00FY
 Mj577H1+7vQ/iLYawHZXWoRvqghnWFgf0nc3qnccikSgFKqoCuVk0LEoVp5iZw/43z6fu7LlE
 C8GI0fs51yU70N/x5CXQBIWqm0LmftaKUBghHMrIxBI8tQ5NKx/Bv+ixkCdSUABW/FN699Zvt
 QfvvQtlLKcmcp+RzzbRVG5F+3+sdUI4yQ5KHJfUS+QYAiGo5xEzXNb/H/aSl9AUVNF0s1DbcN
 EHEJefLv8vIpPIMLhJYuQaypzH4t1jJ1PMtUXUbVCjyp7JWXUBHKg/zlysY+5patJZIlB0BMq
 Xul1AbcgESMoa8oQ1mqemEK09P+dXlrrOEm8GHrNwruzec0ibIziK9CdU7OrH1tfRZtqm9qGD
 AVawqPGg91FNqQaBsct1eT+aECRvqXGBFIWZkAN65pBxMa3E0hPxkGlWtPeBmdo3EmFNmKQAE
 9UJVzIcnKj/yl4ChXU/ezieJ5XLwjb49GFQ/KEzZcM+P57TVGxC9JBEwqAwqYWloSXNcDMEAV
 lDVbpPlPp6fMxVmuE+nWFGDlzMWzo/fpv24HibbGIoWUV+wvy7vpgknKMCgHggkX8PfA/ZR3g
 mWxJESoVxcZfjYuaXdmRGTmpgYHnGUPVbyzDujEJPs4dos7RWUk05rqimFZcARPGwOzXyh0+U
 /xQXZb6zp6pcWTBjRBcBfrnJ5Zt/CicSBm30kgmJHjpuM7Pq94F0bqmIQiZLNqZWnWNR5B43z
 m0esU65tq5lhaXccv/kKrm1Xt5yuD9vUwQouXb34YOs4ZDqIabC/U3Isw==
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

--Sig_/tbPlAhHocqNsJIraA+GgC4j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,
Thanks for your review. More below.

Btw: There is a overview of the replication design in
docs/block-replication.txt

On Wed, 7 Jul 2021 16:01:31 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:

> 06.07.2021 19:11, Lukas Straub wrote:
> > The replication driver needs access to the children block-nodes of
> > it's child so it can issue bdrv_make_empty to manage the replication.
> > However, it does this by directly copying the BdrvChilds, which is
> > wrong.
> >=20
> > Fix this by properly attaching the block-nodes with
> > bdrv_attach_child().
> >=20
> > Also, remove a workaround introduced in commit
> > 6ecbc6c52672db5c13805735ca02784879ce8285
> > "replication: Avoid blk_make_empty() on read-only child".
> >=20
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> > ---
> >=20
> > -v2: Test for BDRV_CHILD_PRIMARY in replication_child_perm, since
> >       bs->file might not be set yet. (Vladimir)
> >=20
> >   block/replication.c | 94 +++++++++++++++++++++++++++++----------------
> >   1 file changed, 61 insertions(+), 33 deletions(-)
> >=20
> > diff --git a/block/replication.c b/block/replication.c
> > index 52163f2d1f..fd8cb728a3 100644
> > --- a/block/replication.c
> > +++ b/block/replication.c
> > @@ -166,7 +166,12 @@ static void replication_child_perm(BlockDriverStat=
e *bs, BdrvChild *c,
> >                                      uint64_t perm, uint64_t shared,
> >                                      uint64_t *nperm, uint64_t *nshared)
> >   {
> > -    *nperm =3D BLK_PERM_CONSISTENT_READ;
> > +    if (role & BDRV_CHILD_PRIMARY) {
> > +        *nperm =3D BLK_PERM_CONSISTENT_READ;
> > +    } else {
> > +        *nperm =3D 0;
> > +    } =20
>=20
> Why you drop READ access for other children? You don't mention it in comm=
it-msg..
>=20
> Upd: ok now I see that we are not going to read from hidden_disk child, a=
nd that's the only "other" child that worth to mention.
> Still, we should be sure that hidden_disk child gets WRITE permission in =
case we are going to call bdrv_make_empty on it.

The code below that in replication_child_perm() should make sure of
that or am i misunderstanding it?

Or do you mean that it should always request WRITE regardless of
bs->open_flags & BDRV_O_INACTIVE?

> > +
> >       if ((bs->open_flags & (BDRV_O_INACTIVE | BDRV_O_RDWR)) =3D=3D BDR=
V_O_RDWR) {
> >           *nperm |=3D BLK_PERM_WRITE;
> >       }
> > @@ -340,17 +345,7 @@ static void secondary_do_checkpoint(BDRVReplicatio=
nState *s, Error **errp)
> >           return;
> >       }
> >  =20
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
> > +    ret =3D bdrv_make_empty(s->hidden_disk, errp); =20
>=20
> So, here you rely on BLK_PERM_WRITE being set in replication_child_perm()=
.. Probably that's OK, however logic is changed. Shouldn't we always requir=
e write permission in replication_child_perm() for hidden_disk ?
>=20
> >       if (ret < 0) {
> >           return;
> >       }
> > @@ -365,27 +360,35 @@ static void reopen_backing_file(BlockDriverState =
*bs, bool writable,
> >                                   Error **errp)
> >   {
> >       BDRVReplicationState *s =3D bs->opaque;
> > +    BdrvChild *hidden_disk, *secondary_disk;
> >       BlockReopenQueue *reopen_queue =3D NULL;
> >  =20
> > +    /*
> > +     * s->hidden_disk and s->secondary_disk may not be set yet, as the=
y will
> > +     * only be set after the children are writable.
> > +     */
> > +    hidden_disk =3D bs->file->bs->backing;
> > +    secondary_disk =3D hidden_disk->bs->backing;
> > +
> >       if (writable) {
> > -        s->orig_hidden_read_only =3D bdrv_is_read_only(s->hidden_disk-=
>bs);
> > -        s->orig_secondary_read_only =3D bdrv_is_read_only(s->secondary=
_disk->bs);
> > +        s->orig_hidden_read_only =3D bdrv_is_read_only(hidden_disk->bs=
);
> > +        s->orig_secondary_read_only =3D bdrv_is_read_only(secondary_di=
sk->bs);
> >       }
> >  =20
> > -    bdrv_subtree_drained_begin(s->hidden_disk->bs);
> > -    bdrv_subtree_drained_begin(s->secondary_disk->bs);
> > +    bdrv_subtree_drained_begin(hidden_disk->bs);
> > +    bdrv_subtree_drained_begin(secondary_disk->bs); =20
>=20
> That kind of staff may be done as a separate preparation patch, with no-l=
ogic-change refactoring, this makes the main logic-change patch simpler.

Yes, makes sense. Will do in the next version.

> >  =20
> >       if (s->orig_hidden_read_only) {
> >           QDict *opts =3D qdict_new();
> >           qdict_put_bool(opts, BDRV_OPT_READ_ONLY, !writable);
> > -        reopen_queue =3D bdrv_reopen_queue(reopen_queue, s->hidden_dis=
k->bs,
> > +        reopen_queue =3D bdrv_reopen_queue(reopen_queue, hidden_disk->=
bs,
> >                                            opts, true);
> >       }
> >  =20
> >       if (s->orig_secondary_read_only) {
> >           QDict *opts =3D qdict_new();
> >           qdict_put_bool(opts, BDRV_OPT_READ_ONLY, !writable);
> > -        reopen_queue =3D bdrv_reopen_queue(reopen_queue, s->secondary_=
disk->bs,
> > +        reopen_queue =3D bdrv_reopen_queue(reopen_queue, secondary_dis=
k->bs,
> >                                            opts, true);
> >       }, probably it could be a separate patch if it is needed.
> >  =20
> > @@ -393,8 +396,8 @@ static void reopen_backing_file(BlockDriverState *b=
s, bool writable,
> >           bdrv_reopen_multiple(reopen_queue, errp);
> >       }
> >  =20
> > -    bdrv_subtree_drained_end(s->hidden_disk->bs);
> > -    bdrv_subtree_drained_end(s->secondary_disk->bs);
> > +    bdrv_subtree_drained_end(hidden_disk->bs);
> > +    bdrv_subtree_drained_end(secondary_disk->bs);
> >   }
> >  =20
> >   static void backup_job_cleanup(BlockDriverState *bs)
> > @@ -451,6 +454,7 @@ static void replication_start(ReplicationState *rs,=
 ReplicationMode mode,
> >       BlockDriverState *bs =3D rs->opaque;
> >       BDRVReplicationState *s;
> >       BlockDriverState *top_bs;
> > +    BdrvChild *active_disk, *hidden_disk, *secondary_disk;
> >       int64_t active_length, hidden_length, disk_length;
> >       AioContext *aio_context;
> >       Error *local_err =3D NULL;
> > @@ -488,32 +492,32 @@ static void replication_start(ReplicationState *r=
s, ReplicationMode mode,
> >       case REPLICATION_MODE_PRIMARY:
> >           break;
> >       case REPLICATION_MODE_SECONDARY:
> > -        s->active_disk =3D bs->file;
> > -        if (!s->active_disk || !s->active_disk->bs ||
> > -                                    !s->active_disk->bs->backing) {
> > +        active_disk =3D bs->file;
> > +        if (!active_disk || !active_disk->bs ||
> > +                                    !active_disk->bs->backing) {
> >               error_setg(errp, "Active disk doesn't have backing file");
> >               aio_context_release(aio_context);
> >               return;
> >           }
> >  =20
> > -        s->hidden_disk =3D s->active_disk->bs->backing;
> > -        if (!s->hidden_disk->bs || !s->hidden_disk->bs->backing) {
> > +        hidden_disk =3D active_disk->bs->backing;
> > +        if (!hidden_disk->bs || !hidden_disk->bs->backing) {
> >               error_setg(errp, "Hidden disk doesn't have backing file");
> >               aio_context_release(aio_context);
> >               return;
> >           }
> >  =20
> > -        s->secondary_disk =3D s->hidden_disk->bs->backing;
> > -        if (!s->secondary_disk->bs || !bdrv_has_blk(s->secondary_disk-=
>bs)) {
> > +        secondary_disk =3D hidden_disk->bs->backing;
> > +        if (!secondary_disk->bs || !bdrv_has_blk(secondary_disk->bs)) {
> >               error_setg(errp, "The secondary disk doesn't have block b=
ackend");
> >               aio_context_release(aio_context);
> >               return;
> >           }
> >   , probably it could be a separate patch if it is needed.

Ok.

> >           /* verify the length */
> > -        active_length =3D bdrv_getlength(s->active_disk->bs);
> > -        hidden_length =3D bdrv_getlength(s->hidden_disk->bs);
> > -        disk_length =3D bdrv_getlength(s->secondary_disk->bs);
> > +        active_length =3D bdrv_getlength(active_disk->bs);
> > +        hidden_length =3D bdrv_getlength(hidden_disk->bs);
> > +        disk_length =3D bdrv_getlength(secondary_disk->bs);
> >           if (active_length < 0 || hidden_length < 0 || disk_length < 0=
 ||
> >               active_length !=3D hidden_length || hidden_length !=3D di=
sk_length) {
> >               error_setg(errp, "Active disk, hidden disk, secondary dis=
k's length"
> > @@ -523,10 +527,10 @@ static void replication_start(ReplicationState *r=
s, ReplicationMode mode,
> >           }
> >  =20
> >           /* Must be true, or the bdrv_getlength() calls would have fai=
led */
> > -        assert(s->active_disk->bs->drv && s->hidden_disk->bs->drv);
> > +        assert(active_disk->bs->drv && hidden_disk->bs->drv);
> >  =20
> > -        if (!s->active_disk->bs->drv->bdrv_make_empty ||
> > -            !s->hidden_disk->bs->drv->bdrv_make_empty) {
> > +        if (!active_disk->bs->drv->bdrv_make_empty ||
> > +            !hidden_disk->bs->drv->bdrv_make_empty) {
> >               error_setg(errp,
> >                          "Active disk or hidden disk doesn't support ma=
ke_empty");
> >               aio_context_release(aio_context);
> > @@ -541,6 +545,28 @@ static void replication_start(ReplicationState *rs=
, ReplicationMode mode,
> >               return;
> >           }
> >  =20
> > +        s->active_disk =3D active_disk;
> > +
> > +        bdrv_ref(hidden_disk->bs);
> > +        s->hidden_disk =3D bdrv_attach_child(bs, hidden_disk->bs, "hid=
den disk",
> > +                                           &child_of_bds, BDRV_CHILD_D=
ATA,
> > +                                           &local_err);
> > +        if (local_err) {
> > +            error_propagate(errp, local_err);
> > +            aio_context_release(aio_context);
> > +            return;
> > +        } =20
>=20
> Ok, the point of creating hidden_disk is to call bdrv_make_empty on it.
>=20
> > +
> > +        bdrv_ref(secondary_disk->bs);
> > +        s->secondary_disk =3D bdrv_attach_child(bs, secondary_disk->bs,
> > +                                              "secondary disk", &child=
_of_bds,
> > +                                              BDRV_CHILD_DATA, &local_=
err);
> > +        if (local_err) {
> > +            error_propagate(errp, local_err);
> > +            aio_context_release(aio_context);
> > +            return;
> > +        } =20
>=20
> But s->secondary_disk child is actually unused.. No reason to create it.

It is used, look closely at replication_co_writev().

If the commit job (run during failover in replication_stop()) fails,
replication enters "failover failed" state. In that state it writes
directly to the secondary disk if possible (i.e. if the sector to write
is not already allocated on the active or hidden disk).

It does this so the active and hidden disks don't grow larger, since in
the COLO use-case they usually are put on a ramdisk with limited size.

> > +
> >           /* start backup job now */
> >           error_setg(&s->blocker,
> >                      "Block device is in use by internal backup job");
> > @@ -646,7 +672,9 @@ static void replication_done(void *opaque, int ret)
> >           s->stage =3D BLOCK_REPLICATION_DONE;
> >  =20
> >           s->active_disk =3D NULL;
> > +        bdrv_unref_child(bs, s->secondary_disk);
> >           s->secondary_disk =3D NULL;
> > +        bdrv_unref_child(bs, s->hidden_disk);
> >           s->hidden_disk =3D NULL;
> >           s->error =3D 0;
> >       } else {
> >  =20
>=20
> For me it looks like the good way to update is:
>=20
> 1. drop s->active_disk. it seems to be just a copy of bs->file, better to=
 use bs->file directly, like other drivers do.
> 2. reduce usage of s->hidden_disk and s->secondary_disk, like you do in t=
his patch, using local variables instead. Also probably just drop s->second=
ary_disk..
> 3. introduce a child, to be used with bdrv_make_empty(s->hidden_disk)
>=20
> And these are 3 separate patches. 1 and 2 may be merged, or instead 2 may=
 be divided into two (to refactor secondary_disk and hidden_disk separately=
)..

Sound good, will do.

> Still, I'm not a maintainer of replication, neither I have good understan=
ding of how it works, so don't take my advises to heart :)
>=20



--=20


--Sig_/tbPlAhHocqNsJIraA+GgC4j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDlv+gACgkQNasLKJxd
slgrAA/+Mhv2UPotiVc0jJpX9bHjE67/SFrGokygJiOowsiGsV+jrm+NDqkIbXwi
ACwAW87YReHm/A2m4IuQJ3JG3HWZH3md7ueUL+IdKD2Hytxmele+KfgqJN1A5j8U
qM+npib9LK7J1GpIICwWjpzD9IsaEVqZwBOYiEsgQPoJdqJS+Rb2xZ96D5LqpyJf
BbgP96aIgZrydR4Jy/DXbV84Sz29yBZv34poEOsaQahTzc351OsYbffuRrcuRa4A
Zf9U9hl7CSKWumGJgqEnfwlAo/c4SPy/Lj/Fm06Gkmr8eOjiTD4yFf+c5vjuYVro
TcNaniy0Q4VLjPpZDk3NaAFTlXpK0LUF7BYo6pmCxIKW2qx9amrfjkyw2h24JlhJ
TB1kpMzdhUiiBOTCzk2kUBATDqVod7yzdJsLaBEaOhVqwZJMsE77ZInxA9V8APur
VyQSaCsiHSCZ8pN08IEZt933zAND3llVfAa/bWhKmaVGkzSf1PWC031++Xj74OxI
BmYusDQY9hsou0LRxp+VVU+JMkS4Nd/FVLNy/bliMRD8TkgLjDmX9rc0QpS83Zor
g+x5Zi3hgBFAheNBE4RH9j8knT2wonKyT76UsxKgwLlNlw8f1NMqbF5hOpH6oCH7
Mb9JU1sLOQZq2/TX7Rn+ti/WTKyYA1F2rPeN9Tw54sO4z+QvleA=
=UR6J
-----END PGP SIGNATURE-----

--Sig_/tbPlAhHocqNsJIraA+GgC4j--

