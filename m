Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866DBA597A
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Sep 2019 16:37:07 +0200 (CEST)
Received: from localhost ([::1]:37108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4nS1-0003Kd-66
	for lists+qemu-devel@lfdr.de; Mon, 02 Sep 2019 10:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i4nQq-0002qV-Nj
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 10:35:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i4nQo-00047c-Fc
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 10:35:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34753)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i4nQi-0003ph-4i; Mon, 02 Sep 2019 10:35:40 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5D26F7F746;
 Mon,  2 Sep 2019 14:35:38 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-221.brq.redhat.com
 [10.40.204.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA60A1001938;
 Mon,  2 Sep 2019 14:35:36 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
References: <20190809161407.11920-1-mreitz@redhat.com>
 <20190809161407.11920-26-mreitz@redhat.com>
 <a9ca977d-d8d5-662f-748a-b1e53f95969f@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mreitz@redhat.com; prefer-encrypt=mutual; keydata=
 mQENBFXOJlcBCADEyyhOTsoa/2ujoTRAJj4MKA21dkxxELVj3cuILpLTmtachWj7QW+TVG8U
 /PsMCFbpwsQR7oEy8eHHZwuGQsNpEtNC2G/L8Yka0BIBzv7dEgrPzIu+W3anZXQW4702+uES
 U29G8TP/NGfXRRHGlbBIH9KNUnOSUD2vRtpOLXkWsV5CN6vQFYgQfFvmp5ZpPeUe6xNplu8V
 mcTw8OSEDW/ZnxJc8TekCKZSpdzYoxfzjm7xGmZqB18VFwgJZlIibt1HE0EB4w5GsD7x5ekh
 awIe3RwoZgZDLQMdOitJ1tUc8aqaxvgA4tz6J6st8D8pS//m1gAoYJWGwwIVj1DjTYLtABEB
 AAG0HU1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+iQFTBBMBCAA9AhsDBQkSzAMABQsJ
 CAcCBhUICQoLAgQWAgMBAh4BAheABQJVzie5FRhoa3A6Ly9rZXlzLmdudXBnLm5ldAAKCRD0
 B9sAYdXPQDcIB/9uNkbYEex1rHKz3mr12uxYMwLOOFY9fstP5aoVJQ1nWQVB6m2cfKGdcRe1
 2/nFaHSNAzT0NnKz2MjhZVmcrpyd2Gp2QyISCfb1FbT82GMtXFj1wiHmPb3CixYmWGQUUh+I
 AvUqsevLA+WihgBUyaJq/vuDVM1/K9Un+w+Tz5vpeMidlIsTYhcsMhn0L9wlCjoucljvbDy/
 8C9L2DUdgi3XTa0ORKeflUhdL4gucWoAMrKX2nmPjBMKLgU7WLBc8AtV+84b9OWFML6NEyo4
 4cP7cM/07VlJK53pqNg5cHtnWwjHcbpGkQvx6RUx6F1My3y52vM24rNUA3+ligVEgPYBuQEN
 BFXOJlcBCADAmcVUNTWT6yLWQHvxZ0o47KCP8OcLqD+67T0RCe6d0LP8GsWtrJdeDIQk+T+F
 xO7DolQPS6iQ6Ak2/lJaPX8L0BkEAiMuLCKFU6Bn3lFOkrQeKp3u05wCSV1iKnhg0UPji9V2
 W5eNfy8F4ZQHpeGUGy+liGXlxqkeRVhLyevUqfU0WgNqAJpfhHSGpBgihUupmyUg7lfUPeRM
 DzAN1pIqoFuxnN+BRHdAecpsLcbR8sQddXmDg9BpSKozO/JyBmaS1RlquI8HERQoe6EynJhd
 64aICHDfj61rp+/0jTIcevxIIAzW70IadoS/y3DVIkuhncgDBvGbF3aBtjrJVP+5ABEBAAGJ
 ASUEGAEIAA8FAlXOJlcCGwwFCRLMAwAACgkQ9AfbAGHVz0CbFwf9F/PXxQR9i4N0iipISYjU
 sxVdjJOM2TMut+ZZcQ6NSMvhZ0ogQxJ+iEQ5OjnIputKvPVd5U7WRh+4lF1lB/NQGrGZQ1ic
 alkj6ocscQyFwfib+xIe9w8TG1CVGkII7+TbS5pXHRxZH1niaRpoi/hYtgzkuOPp35jJyqT/
 /ELbqQTDAWcqtJhzxKLE/ugcOMK520dJDeb6x2xVES+S5LXby0D4juZlvUj+1fwZu+7Io5+B
 bkhSVPb/QdOVTpnz7zWNyNw+OONo1aBUKkhq2UIByYXgORPFnbfMY7QWHcjpBVw9MgC4tGeF
 R4bv+1nAMMxKmb5VvQCExr0eFhJUAHAhVg==
Message-ID: <bf35dca0-c965-6a28-49fc-3943d05b2909@redhat.com>
Date: Mon, 2 Sep 2019 16:35:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a9ca977d-d8d5-662f-748a-b1e53f95969f@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hXWx0WLwlHT6HgZiN6Wzdmq4WFqD756kW"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Mon, 02 Sep 2019 14:35:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6 25/42] mirror: Deal with filters
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hXWx0WLwlHT6HgZiN6Wzdmq4WFqD756kW
Content-Type: multipart/mixed; boundary="3GIRrdj3W0zqZ6TrcYcINyOa4NvgqviSu";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>
Message-ID: <bf35dca0-c965-6a28-49fc-3943d05b2909@redhat.com>
Subject: Re: [PATCH v6 25/42] mirror: Deal with filters
References: <20190809161407.11920-1-mreitz@redhat.com>
 <20190809161407.11920-26-mreitz@redhat.com>
 <a9ca977d-d8d5-662f-748a-b1e53f95969f@virtuozzo.com>
In-Reply-To: <a9ca977d-d8d5-662f-748a-b1e53f95969f@virtuozzo.com>

--3GIRrdj3W0zqZ6TrcYcINyOa4NvgqviSu
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 31.08.19 11:57, Vladimir Sementsov-Ogievskiy wrote:
> 09.08.2019 19:13, Max Reitz wrote:
>> This includes some permission limiting (for example, we only need to
>> take the RESIZE permission for active commits where the base is smalle=
r
>> than the top).
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   block/mirror.c | 117 ++++++++++++++++++++++++++++++++++++++---------=
--
>>   blockdev.c     |  47 +++++++++++++++++---
>>   2 files changed, 131 insertions(+), 33 deletions(-)
>>
>> diff --git a/block/mirror.c b/block/mirror.c
>> index 54bafdf176..6ddbfb9708 100644
>> --- a/block/mirror.c
>> +++ b/block/mirror.c
>> @@ -42,6 +42,7 @@ typedef struct MirrorBlockJob {
>>       BlockBackend *target;
>>       BlockDriverState *mirror_top_bs;
>>       BlockDriverState *base;
>> +    BlockDriverState *base_overlay;
>>  =20
>>       /* The name of the graph node to replace */
>>       char *replaces;
>> @@ -665,8 +666,10 @@ static int mirror_exit_common(Job *job)
>>                                &error_abort);
>>       if (!abort && s->backing_mode =3D=3D MIRROR_SOURCE_BACKING_CHAIN=
) {
>>           BlockDriverState *backing =3D s->is_none_mode ? src : s->bas=
e;
>> -        if (backing_bs(target_bs) !=3D backing) {
>> -            bdrv_set_backing_hd(target_bs, backing, &local_err);
>> +        BlockDriverState *unfiltered_target =3D bdrv_skip_rw_filters(=
target_bs);
>> +
>> +        if (bdrv_filtered_cow_bs(unfiltered_target) !=3D backing) {
>> +            bdrv_set_backing_hd(unfiltered_target, backing, &local_er=
r);
>>               if (local_err) {
>>                   error_report_err(local_err);
>>                   ret =3D -EPERM;
>> @@ -715,7 +718,7 @@ static int mirror_exit_common(Job *job)
>>        * valid.
>>        */
>>       block_job_remove_all_bdrv(bjob);
>> -    bdrv_replace_node(mirror_top_bs, backing_bs(mirror_top_bs), &erro=
r_abort);
>> +    bdrv_replace_node(mirror_top_bs, mirror_top_bs->backing->bs, &err=
or_abort);
>>  =20
>>       /* We just changed the BDS the job BB refers to (with either or =
both of the
>>        * bdrv_replace_node() calls), so switch the BB back so the clea=
nup does
>> @@ -812,7 +815,8 @@ static int coroutine_fn mirror_dirty_init(MirrorBl=
ockJob *s)
>>               return 0;
>>           }
>>  =20
>> -        ret =3D bdrv_is_allocated_above(bs, base, false, offset, byte=
s, &count);
>> +        ret =3D bdrv_is_allocated_above(bs, s->base_overlay, true, of=
fset, bytes,
>> +                                      &count);
>>           if (ret < 0) {
>>               return ret;
>>           }
>> @@ -908,7 +912,7 @@ static int coroutine_fn mirror_run(Job *job, Error=
 **errp)
>>       } else {
>>           s->target_cluster_size =3D BDRV_SECTOR_SIZE;
>>       }
>> -    if (backing_filename[0] && !target_bs->backing &&
>> +    if (backing_filename[0] && !bdrv_backing_chain_next(target_bs) &&=

>>           s->granularity < s->target_cluster_size) {
>>           s->buf_size =3D MAX(s->buf_size, s->target_cluster_size);
>>           s->cow_bitmap =3D bitmap_new(length);
>> @@ -1088,8 +1092,9 @@ static void mirror_complete(Job *job, Error **er=
rp)
>>       if (s->backing_mode =3D=3D MIRROR_OPEN_BACKING_CHAIN) {
>>           int ret;
>>  =20
>> -        assert(!target->backing);
>> -        ret =3D bdrv_open_backing_file(target, NULL, "backing", errp)=
;
>> +        assert(!bdrv_backing_chain_next(target));
>=20
> Preexisting, but seems we may crash here, I don't see where it is check=
ed before, to
> return error if there is some backing. And even if we do so, we don't p=
revent appearing
> of target backing during mirror operation.

The idea is that MIRROR_OPEN_BACKING_CHAIN is set only when using
drive-mirror with mode=3Dexisting.  In this case, we also set
BDRV_O_NO_BACKING for the target.

You=E2=80=99re right that a user could add a backing chain to the target =
during
the operation.  They really have to make an effort to shoot themselves
in the foot for this because the target must have an auto-generated node
name.

I suppose the best would be not to open the backing chain if the target
node already has a backing child?

>> +        ret =3D bdrv_open_backing_file(bdrv_skip_rw_filters(target), =
NULL,
>> +                                     "backing", errp);
>>           if (ret < 0) {
>>               return;
>>           }
>> @@ -1531,8 +1536,8 @@ static BlockJob *mirror_start_job(
>>       MirrorBlockJob *s;
>>       MirrorBDSOpaque *bs_opaque;
>>       BlockDriverState *mirror_top_bs;
>> -    bool target_graph_mod;
>>       bool target_is_backing;
>> +    uint64_t target_perms, target_shared_perms;
>>       Error *local_err =3D NULL;
>>       int ret;
>>  =20
>> @@ -1551,7 +1556,7 @@ static BlockJob *mirror_start_job(
>>           buf_size =3D DEFAULT_MIRROR_BUF_SIZE;
>>       }
>>  =20
>> -    if (bs =3D=3D target) {
>> +    if (bdrv_skip_rw_filters(bs) =3D=3D bdrv_skip_rw_filters(target))=
 {
>>           error_setg(errp, "Can't mirror node into itself");
>>           return NULL;
>>       }
>> @@ -1615,15 +1620,50 @@ static BlockJob *mirror_start_job(
>>        * In the case of active commit, things look a bit different, th=
ough,
>>        * because the target is an already populated backing file in ac=
tive use.
>>        * We can allow anything except resize there.*/
>> +
>> +    target_perms =3D BLK_PERM_WRITE;
>> +    target_shared_perms =3D BLK_PERM_WRITE_UNCHANGED;
>> +
>>       target_is_backing =3D bdrv_chain_contains(bs, target);
>> -    target_graph_mod =3D (backing_mode !=3D MIRROR_LEAVE_BACKING_CHAI=
N);
>> +    if (target_is_backing) {
>> +        int64_t bs_size, target_size;
>=20
> <empty after definitions>

Is that part of any of our guidelines? :-)

Sure, will add.

>> +        bs_size =3D bdrv_getlength(bs);
>> +        if (bs_size < 0) {
>> +            error_setg_errno(errp, -bs_size,
>> +                             "Could not inquire top image size");
>> +            goto fail;
>> +        }
>> +
>> +        target_size =3D bdrv_getlength(target);
>> +        if (target_size < 0) {
>> +            error_setg_errno(errp, -target_size,
>> +                             "Could not inquire base image size");
>> +            goto fail;
>> +        }
>> +
>> +        if (target_size < bs_size) {
>> +            target_perms |=3D BLK_PERM_RESIZE;
>> +        }
>> +
>> +        target_shared_perms |=3D BLK_PERM_CONSISTENT_READ
>> +                            |  BLK_PERM_WRITE
>> +                            |  BLK_PERM_GRAPH_MOD;
>> +    } else if (bdrv_chain_contains(bs, bdrv_skip_rw_filters(target)))=
 {
>> +        /*
>> +         * We may want to allow this in the future, but it would
>> +         * require taking some extra care.
>> +         */
>> +        error_setg(errp, "Cannot mirror to a filter on top of a node =
in the "
>> +                   "source's backing chain");
>> +        goto fail;
>> +    }
>> +
>> +    if (backing_mode !=3D MIRROR_LEAVE_BACKING_CHAIN) {
>> +        target_perms |=3D BLK_PERM_GRAPH_MOD;
>> +    }
>> +
>>       s->target =3D blk_new(s->common.job.aio_context,
>> -                        BLK_PERM_WRITE | BLK_PERM_RESIZE |
>> -                        (target_graph_mod ? BLK_PERM_GRAPH_MOD : 0),
>> -                        BLK_PERM_WRITE_UNCHANGED |
>> -                        (target_is_backing ? BLK_PERM_CONSISTENT_READ=
 |
>> -                                             BLK_PERM_WRITE |
>> -                                             BLK_PERM_GRAPH_MOD : 0))=
;
>> +                        target_perms, target_shared_perms);
>>       ret =3D blk_insert_bs(s->target, target, errp);
>>       if (ret < 0) {
>>           goto fail;
>> @@ -1647,6 +1687,7 @@ static BlockJob *mirror_start_job(
>>       s->backing_mode =3D backing_mode;
>>       s->copy_mode =3D copy_mode;
>>       s->base =3D base;
>> +    s->base_overlay =3D bdrv_find_overlay(bs, base);
>>       s->granularity =3D granularity;
>>       s->buf_size =3D ROUND_UP(buf_size, granularity);
>>       s->unmap =3D unmap;
>> @@ -1693,15 +1734,39 @@ static BlockJob *mirror_start_job(
>>       /* In commit_active_start() all intermediate nodes disappear, so=

>>        * any jobs in them must be blocked */
>>       if (target_is_backing) {
>> -        BlockDriverState *iter;
>> -        for (iter =3D backing_bs(bs); iter !=3D target; iter =3D back=
ing_bs(iter)) {
>> -            /* XXX BLK_PERM_WRITE needs to be allowed so we don't blo=
ck
>> -             * ourselves at s->base (if writes are blocked for a node=
, they are
>> -             * also blocked for its backing file). The other options =
would be a
>> -             * second filter driver above s->base (=3D=3D target). */=

>> +        BlockDriverState *iter, *filtered_target;
>> +        uint64_t iter_shared_perms;
>> +
>> +        /*
>> +         * The topmost node with
>> +         * bdrv_skip_rw_filters(filtered_target) =3D=3D bdrv_skip_rw_=
filters(target)
>> +         */
>> +        filtered_target =3D bdrv_filtered_cow_bs(bdrv_find_overlay(bs=
, target));
>> +
>> +        assert(bdrv_skip_rw_filters(filtered_target) =3D=3D
>> +               bdrv_skip_rw_filters(target));
>> +
>> +        /*
>> +         * XXX BLK_PERM_WRITE needs to be allowed so we don't block
>> +         * ourselves at s->base (if writes are blocked for a node, th=
ey are
>> +         * also blocked for its backing file). The other options woul=
d be a
>> +         * second filter driver above s->base (=3D=3D target).
>> +         */
>> +        iter_shared_perms =3D BLK_PERM_WRITE_UNCHANGED | BLK_PERM_WRI=
TE;
>> +
>> +        for (iter =3D bdrv_filtered_bs(bs); iter !=3D target;
>> +             iter =3D bdrv_filtered_bs(iter))
>> +        {
>> +            if (iter =3D=3D filtered_target) {
>> +                /*
>> +                 * From here on, all nodes are filters on the base.
>> +                 * This allows us to share BLK_PERM_CONSISTENT_READ.
>=20
> I'd prefere to add something like: "because we share it on target (see =
target BlockBackend creation
> and corresponding comment above)".

I=E2=80=99d rather not refer to other comments in case they change=E2=80=A6=
  Maybe just
=E2=80=9CThis allows us to share BLK_PERM_CONSISTENT_READ, as we do on th=
e
target.=E2=80=9D?  I think if someone is interested, they will scan the f=
ile for
what permissions are shared on the target anyway.

>> +                 */
>> +                iter_shared_perms |=3D BLK_PERM_CONSISTENT_READ;
>> +            }
>> +
>>               ret =3D block_job_add_bdrv(&s->common, "intermediate nod=
e", iter, 0,
>> -                                     BLK_PERM_WRITE_UNCHANGED | BLK_P=
ERM_WRITE,
>> -                                     errp);
>> +                                     iter_shared_perms, errp);
>>               if (ret < 0) {
>>                   goto fail;
>>               }
>> @@ -1737,7 +1802,7 @@ fail:
>>       bs_opaque->stop =3D true;
>>       bdrv_child_refresh_perms(mirror_top_bs, mirror_top_bs->backing,
>>                                &error_abort);
>> -    bdrv_replace_node(mirror_top_bs, backing_bs(mirror_top_bs), &erro=
r_abort);
>> +    bdrv_replace_node(mirror_top_bs, mirror_top_bs->backing->bs, &err=
or_abort);
>>  =20
>>       bdrv_unref(mirror_top_bs);
>>  =20
>> @@ -1764,7 +1829,7 @@ void mirror_start(const char *job_id, BlockDrive=
rState *bs,
>>           return;
>>       }
>>       is_none_mode =3D mode =3D=3D MIRROR_SYNC_MODE_NONE;
>> -    base =3D mode =3D=3D MIRROR_SYNC_MODE_TOP ? backing_bs(bs) : NULL=
;
>> +    base =3D mode =3D=3D MIRROR_SYNC_MODE_TOP ? bdrv_backing_chain_ne=
xt(bs) : NULL;
>>       mirror_start_job(job_id, bs, creation_flags, target, replaces,
>>                        speed, granularity, buf_size, backing_mode,
>>                        on_source_error, on_target_error, unmap, NULL, =
NULL,
>> diff --git a/blockdev.c b/blockdev.c
>> index c540802127..c451f553f7 100644
>=20
>=20
> block/mirroc.c is OK for me. Continue with blockdev.c...
>=20
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -3851,7 +3851,7 @@ static void blockdev_mirror_common(const char *j=
ob_id, BlockDriverState *bs,
>>           return;
>>       }
>>  =20
>> -    if (!bs->backing && sync =3D=3D MIRROR_SYNC_MODE_TOP) {
>> +    if (!bdrv_backing_chain_next(bs) && sync =3D=3D MIRROR_SYNC_MODE_=
TOP) {
>>           sync =3D MIRROR_SYNC_MODE_FULL;
>>       }
>>  =20
>> @@ -3900,7 +3900,7 @@ static void blockdev_mirror_common(const char *j=
ob_id, BlockDriverState *bs,
>>  =20
>>   void qmp_drive_mirror(DriveMirror *arg, Error **errp)
>>   {
>> -    BlockDriverState *bs;
>> +    BlockDriverState *bs, *unfiltered_bs;
>>       BlockDriverState *source, *target_bs;
>>       AioContext *aio_context;
>>       BlockMirrorBackingMode backing_mode;
>> @@ -3909,6 +3909,7 @@ void qmp_drive_mirror(DriveMirror *arg, Error **=
errp)
>>       int flags;
>>       int64_t size;
>>       const char *format =3D arg->format;
>> +    const char *replaces_node_name =3D NULL;
>>       int ret;
>>  =20
>>       bs =3D qmp_get_root_bs(arg->device, errp);
>> @@ -3921,6 +3922,16 @@ void qmp_drive_mirror(DriveMirror *arg, Error *=
*errp)
>>           return;
>>       }
>>  =20
>> +    /*
>> +     * If the user has not instructed us otherwise, we should let the=

>> +     * block job run from @bs (thus taking into account all filters o=
n
>> +     * it) but replace @unfiltered_bs when it finishes (thus not
>> +     * removing those filters).
>> +     * (And if there are any explicit filters, we should assume the
>> +     *  user knows how to use the @replaces option.)
>> +     */
>> +    unfiltered_bs =3D bdrv_skip_implicit_filters(bs);
>> +
>>       aio_context =3D bdrv_get_aio_context(bs);
>>       aio_context_acquire(aio_context);
>>  =20
>> @@ -3934,8 +3945,14 @@ void qmp_drive_mirror(DriveMirror *arg, Error *=
*errp)
>>       }
>>  =20
>>       flags =3D bs->open_flags | BDRV_O_RDWR;
>> -    source =3D backing_bs(bs);
>> +    source =3D bdrv_filtered_cow_bs(unfiltered_bs);
>>       if (!source && arg->sync =3D=3D MIRROR_SYNC_MODE_TOP) {
>=20
>=20
> Hmm, you handle this case a bit differently here and in blockdev_mirror=
_common..
> Can we handle it only in blockdev_mirror_common, to be consistent with =
qmp_blockdev_mirror?

What exactly do you mean?  The difference between skipping all filters
and just skipping implicit filters?  Hm.

First, the check in blockdev_mirror_common() should actually be
unnecessary.  In qmp_{blockdev,drive}_mirror(), we do nearly the same
check anyway (and then force sync=3Dfull if there is no backing file).  S=
o
if all three functions did the same check, we wouldn=E2=80=99t need it in=

blockdev_mirror_common().

Second, let=E2=80=99s look at the difference in an example: One where
blockdev_mirror_common() would not decide to enforce mode=3Dfull, but
qmp_{blockdev,drive}_mirror() would.
This happens when @bs is an explicit filter over some overlay with a
backing file, e.g.:

throttle --file--> qcow2 --backing--> raw

It=E2=80=99s correct to run the mirror job from the throttle node; but @s=
ource
should be bdrv_backing_chain_next() so it will point to the raw node.
Currently, it is NULL (because the throttle node does not have a COW chil=
d).

But then again, I=E2=80=99ve made qmp_{blockdev,drive}_mirror() throw an =
error
in such a case:

>> +        if (bdrv_filtered_bs(unfiltered_bs)) {
>> +            /* @unfiltered_bs is an explicit filter */
>> +            error_setg(errp, "Cannot perform sync=3Dtop mirror throug=
h an "
>> +                       "explicitly added filter node on the source");=

>> +            goto out;
>> +        }

So it isn=E2=80=99t really a problem.  Still, does the error make sense? =
 Should
we just allow that case by letting source be
bdrv_filtered_cow_bs(bdrv_skip_rw_filters(bs))?

(BTW, I just noticed that @base seems to be pretty much unused in
block/mirror.c.  It only really uses @base_overlay now.  So I suppose it
makes sense to remove it in v7.)

>>           arg->sync =3D MIRROR_SYNC_MODE_FULL;
>>       }
>>       if (arg->sync =3D=3D MIRROR_SYNC_MODE_NONE) {
>> @@ -3954,6 +3971,9 @@ void qmp_drive_mirror(DriveMirror *arg, Error **=
errp)
>>                                " named node of the graph");
>>               goto out;
>>           }
>> +        replaces_node_name =3D arg->replaces;
>> +    } else if (unfiltered_bs !=3D bs) {
>> +        replaces_node_name =3D unfiltered_bs->node_name;
>>       }
>>  =20
>>       if (arg->mode =3D=3D NEW_IMAGE_MODE_ABSOLUTE_PATHS) {
>> @@ -3973,6 +3993,9 @@ void qmp_drive_mirror(DriveMirror *arg, Error **=
errp)
>>           bdrv_img_create(arg->target, format,
>>                           NULL, NULL, NULL, size, flags, false, &local=
_err);
>>       } else {
>> +        /* Implicit filters should not appear in the filename */
>> +        BlockDriverState *explicit_backing =3D bdrv_skip_implicit_fil=
ters(source);
>> +
>>           switch (arg->mode) {
>>           case NEW_IMAGE_MODE_EXISTING:
>>               break;
>> @@ -3980,8 +4003,8 @@ void qmp_drive_mirror(DriveMirror *arg, Error **=
errp)
>>               /* create new image with backing file */
>>               bdrv_refresh_filename(source);
>>               bdrv_img_create(arg->target, format,
>> -                            source->filename,
>> -                            source->drv->format_name,
>> +                            explicit_backing->filename,
>> +                            explicit_backing->drv->format_name,
>>                               NULL, size, flags, false, &local_err);
>>               break;
>>           default:
>> @@ -4017,7 +4040,7 @@ void qmp_drive_mirror(DriveMirror *arg, Error **=
errp)
>>       }
>>  =20
>>       blockdev_mirror_common(arg->has_job_id ? arg->job_id : NULL, bs,=
 target_bs,
>> -                           arg->has_replaces, arg->replaces, arg->syn=
c,
>> +                           !!replaces_node_name, replaces_node_name, =
arg->sync,
>>                              backing_mode, arg->has_speed, arg->speed,=

>>                              arg->has_granularity, arg->granularity,
>>                              arg->has_buf_size, arg->buf_size,
>> @@ -4053,7 +4076,7 @@ void qmp_blockdev_mirror(bool has_job_id, const =
char *job_id,
>>                            bool has_auto_dismiss, bool auto_dismiss,
>>                            Error **errp)
>>   {
>> -    BlockDriverState *bs;
>> +    BlockDriverState *bs, *unfiltered_bs;
>>       BlockDriverState *target_bs;
>>       AioContext *aio_context;
>>       BlockMirrorBackingMode backing_mode =3D MIRROR_LEAVE_BACKING_CHA=
IN;
>> @@ -4065,6 +4088,16 @@ void qmp_blockdev_mirror(bool has_job_id, const=
 char *job_id,
>>           return;
>>       }
>>  =20
>> +    /*
>> +     * Same as in qmp_drive_mirror():
>=20
> Then, may be better do it in blockdev_mirror_common ?

Hm, maybe.  Should we decide to let @source be
bdrv_filtered_cow_bs(bdrv_skip_rw_filters(bs)) in qmp_drive_mirror(), I
don=E2=80=99t think we need @unfiltered_bs there to determine @source.

Max

>> We want to run the job from @bs,
>> +     * but we want to replace @unfiltered_bs on completion.
>> +     */
>> +    unfiltered_bs =3D bdrv_skip_implicit_filters(bs);
>> +    if (!has_replaces && unfiltered_bs !=3D bs) {
>> +        replaces =3D unfiltered_bs->node_name;
>> +        has_replaces =3D true;
>> +    }
>> +
>>       target_bs =3D bdrv_lookup_bs(target, target, errp);
>>       if (!target_bs) {
>>           return;
>>
>=20
>=20



--3GIRrdj3W0zqZ6TrcYcINyOa4NvgqviSu--

--hXWx0WLwlHT6HgZiN6Wzdmq4WFqD756kW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl1tKLcACgkQ9AfbAGHV
z0C0QQf9EOhWsemKJiTWqMOHgWqlSOkvYRDYUhj3pl9VVjS/yWPrrz0buJlz/aB+
ysChLLiYc7YdIx82tlEQYspeCkJPparvl/47lfgWmzVYxXcWwu2jJiGW5te04kkM
nYcYARn8HFS0lt7D9gxVZ1hnPWJ7Sgh2ZCmwLRvqfBe4/ebupA4JE6dQ/hFuA13j
Aw3f91x0aZbNZZ8ec51Xd/VGRYHOG76l1h7KuKBiZCb03sgxt/AZoUt9s2JLpfSp
/5NZkw2f9eFoBLnELdbLWacgpyL95xRxBTanPdrv5NlhpI5I5iYegIFoiIjzOn4+
CPBPRnIJTrkpuGPWmUyyNE8jHfHfNA==
=l/eI
-----END PGP SIGNATURE-----

--hXWx0WLwlHT6HgZiN6Wzdmq4WFqD756kW--

