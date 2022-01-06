Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EC1486735
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 17:03:10 +0100 (CET)
Received: from localhost ([::1]:53734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5VEL-00075u-IH
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 11:03:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1n5VCz-0005xa-Ot; Thu, 06 Jan 2022 11:01:49 -0500
Received: from [2607:f8b0:4864:20::932] (port=42774
 helo=mail-ua1-x932.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1n5VCx-0000Q5-DN; Thu, 06 Jan 2022 11:01:45 -0500
Received: by mail-ua1-x932.google.com with SMTP id p1so5112623uap.9;
 Thu, 06 Jan 2022 08:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1awCQq9wBbTjvju2Lpii9jXsWORES5chR4iuVWeLk4U=;
 b=BesBUtEbSrgOGPzHVlV89xTBq9QVhhzumg3AKETmmQndPSTutLwxsYnR1R+97/O9hU
 0uY0iU8a0Wdl/eDWXKcIoonIAb5UDMwNXkmbrqKP4G1ziDyX2UEtfduniePYoGKjH9JQ
 gRf2nsEcTpUQw5qKuCwhu43Gu1XsPRrz2dzo9t2GM0U/ZPftN98RJ4RrVSQcS8mU6vrf
 u1swnA53uVCGJn9lup0QL0CFl3GmD4OtNUfBM62ZuAynBKB3aXBoCFdzLY/EDsvjZn76
 tFVNw3opFe+F9ODmq7ChiMK5DJ3Ok1VdhbPqf8dVWC0/e7lz8eZMOMGbHkqCTcf6HGc9
 XXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1awCQq9wBbTjvju2Lpii9jXsWORES5chR4iuVWeLk4U=;
 b=gPT3bYe0UAzENGY14GW/epvpI/opS+iRIqXfLTkVBX1atY/PkTyP36uYqoV9UJtgI1
 vpFG8sedJy5xuuAjtW1JGelbzHl4fVeqJxvifSTqHzdiphifevBJFUXSrXtjdpJ2mY31
 zItmVR+aMHwuy2xuV2nGiZLR6a0RtJajr0aK2Cu0yj4v54FJ8I1uq1XxXFJ5+espOWBo
 XKIP3cX6+sWuruORx8bOVkQB2u/2PZIXGS4/GHViRmyvMkWLCr1+skAtZETA6OJZrhrb
 VVdp+O0euHsi2ILyiGxfXqVVJ6/to8YN9eO5T7g6CryTxRZXwkY7BjzdDyMgyw1F/KG3
 65Ig==
X-Gm-Message-State: AOAM532PvgKlYW0XMftbQC6qc+lgqzlkMPOWpdEvbN1oHtJt1YlpSe3d
 xNaqAgPv4c6dS5rWf7Iozz6SVar8h5AU0drv0TI=
X-Google-Smtp-Source: ABdhPJyg7qqzvRmtXTuzwdH/uwat2bwFOk02zNSyliE9sr7cEQB1qhop3wD4PJ/vd3EDTqwctqjr4O4czeL/ioJu0Mc=
X-Received: by 2002:a05:6102:d8a:: with SMTP id
 d10mr8769049vst.47.1641484895444; 
 Thu, 06 Jan 2022 08:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20210916122116.802-1-pl@kamp.de>
 <CAOi1vP8_em_m=orH+5L+164+7EgD+JD_5kmrh=mWBMjZSe79kg@mail.gmail.com>
 <8a6c60cb-ef5b-44a9-1872-27937a3a6967@kamp.de>
 <CAOi1vP84c5zX7319O8xRXBBJGh1baNpCzK2YU7uJp7Zyqmwe+Q@mail.gmail.com>
 <5e4aea9c-131e-c9a0-351b-deeb45774629@kamp.de>
In-Reply-To: <5e4aea9c-131e-c9a0-351b-deeb45774629@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 6 Jan 2022 17:01:33 +0100
Message-ID: <CAOi1vP_evZxARUDYBQyBFQSXe4Hc9Y0ra7yNDQ6mXpFR0ThGBg@mail.gmail.com>
Subject: Re: [PATCH V3] block/rbd: implement bdrv_co_block_status
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::932
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=idryomov@gmail.com; helo=mail-ua1-x932.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, ct@flyingcircus.io, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 6, 2022 at 4:27 PM Peter Lieven <pl@kamp.de> wrote:
>
> Am 05.10.21 um 10:36 schrieb Ilya Dryomov:
> > On Tue, Oct 5, 2021 at 10:19 AM Peter Lieven <pl@kamp.de> wrote:
> >> Am 05.10.21 um 09:54 schrieb Ilya Dryomov:
> >>> On Thu, Sep 16, 2021 at 2:21 PM Peter Lieven <pl@kamp.de> wrote:
> >>>> the qemu rbd driver currently lacks support for bdrv_co_block_status.
> >>>> This results mainly in incorrect progress during block operations (e.g.
> >>>> qemu-img convert with an rbd image as source).
> >>>>
> >>>> This patch utilizes the rbd_diff_iterate2 call from librbd to detect
> >>>> allocated and unallocated (all zero areas).
> >>>>
> >>>> To avoid querying the ceph OSDs for the answer this is only done if
> >>>> the image has the fast-diff feature which depends on the object-map and
> >>>> exclusive-lock features. In this case it is guaranteed that the information
> >>>> is present in memory in the librbd client and thus very fast.
> >>>>
> >>>> If fast-diff is not available all areas are reported to be allocated
> >>>> which is the current behaviour if bdrv_co_block_status is not implemented.
> >>>>
> >>>> Signed-off-by: Peter Lieven <pl@kamp.de>
> >>>> ---
> >>>> V2->V3:
> >>>> - check rbd_flags every time (they can change during runtime) [Ilya]
> >>>> - also check for fast-diff invalid flag [Ilya]
> >>>> - *map and *file cant be NULL [Ilya]
> >>>> - set ret = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID in case of an
> >>>>     unallocated area [Ilya]
> >>>> - typo: catched -> caught [Ilya]
> >>>> - changed wording about fast-diff, object-map and exclusive lock in
> >>>>     commit msg [Ilya]
> >>>>
> >>>> V1->V2:
> >>>> - add commit comment [Stefano]
> >>>> - use failed_post_open [Stefano]
> >>>> - remove redundant assert [Stefano]
> >>>> - add macro+comment for the magic -9000 value [Stefano]
> >>>> - always set *file if its non NULL [Stefano]
> >>>>
> >>>>    block/rbd.c | 126 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>>>    1 file changed, 126 insertions(+)
> >>>>
> >>>> diff --git a/block/rbd.c b/block/rbd.c
> >>>> index dcf82b15b8..3cb24f9981 100644
> >>>> --- a/block/rbd.c
> >>>> +++ b/block/rbd.c
> >>>> @@ -1259,6 +1259,131 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
> >>>>        return spec_info;
> >>>>    }
> >>>>
> >>>> +typedef struct rbd_diff_req {
> >>>> +    uint64_t offs;
> >>>> +    uint64_t bytes;
> >>>> +    int exists;
> >>> Hi Peter,
> >>>
> >>> Nit: make exists a bool.  The one in the callback has to be an int
> >>> because of the callback signature but let's not spread that.
> >>>
> >>>> +} rbd_diff_req;
> >>>> +
> >>>> +/*
> >>>> + * rbd_diff_iterate2 allows to interrupt the exection by returning a negative
> >>>> + * value in the callback routine. Choose a value that does not conflict with
> >>>> + * an existing exitcode and return it if we want to prematurely stop the
> >>>> + * execution because we detected a change in the allocation status.
> >>>> + */
> >>>> +#define QEMU_RBD_EXIT_DIFF_ITERATE2 -9000
> >>>> +
> >>>> +static int qemu_rbd_co_block_status_cb(uint64_t offs, size_t len,
> >>>> +                                       int exists, void *opaque)
> >>>> +{
> >>>> +    struct rbd_diff_req *req = opaque;
> >>>> +
> >>>> +    assert(req->offs + req->bytes <= offs);
> >>>> +
> >>>> +    if (req->exists && offs > req->offs + req->bytes) {
> >>>> +        /*
> >>>> +         * we started in an allocated area and jumped over an unallocated area,
> >>>> +         * req->bytes contains the length of the allocated area before the
> >>>> +         * unallocated area. stop further processing.
> >>>> +         */
> >>>> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
> >>>> +    }
> >>>> +    if (req->exists && !exists) {
> >>>> +        /*
> >>>> +         * we started in an allocated area and reached a hole. req->bytes
> >>>> +         * contains the length of the allocated area before the hole.
> >>>> +         * stop further processing.
> >>>> +         */
> >>>> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
> >>> Do you have a test case for when this branch is taken?
> >>
> >> That would happen if you diff from a snapshot, the question is if it can also happen if the image is a clone from a snapshot?
> >>
> >>
> >>>> +    }
> >>>> +    if (!req->exists && exists && offs > req->offs) {
> >>>> +        /*
> >>>> +         * we started in an unallocated area and hit the first allocated
> >>>> +         * block. req->bytes must be set to the length of the unallocated area
> >>>> +         * before the allocated area. stop further processing.
> >>>> +         */
> >>>> +        req->bytes = offs - req->offs;
> >>>> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
> >>>> +    }
> >>>> +
> >>>> +    /*
> >>>> +     * assert that we caught all cases above and allocation state has not
> >>>> +     * changed during callbacks.
> >>>> +     */
> >>>> +    assert(exists == req->exists || !req->bytes);
> >>>> +    req->exists = exists;
> >>>> +
> >>>> +    /*
> >>>> +     * assert that we either return an unallocated block or have got callbacks
> >>>> +     * for all allocated blocks present.
> >>>> +     */
> >>>> +    assert(!req->exists || offs == req->offs + req->bytes);
> >>>> +    req->bytes = offs + len - req->offs;
> >>>> +
> >>>> +    return 0;
> >>>> +}
> >>>> +
> >>>> +static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
> >>>> +                                                 bool want_zero, int64_t offset,
> >>>> +                                                 int64_t bytes, int64_t *pnum,
> >>>> +                                                 int64_t *map,
> >>>> +                                                 BlockDriverState **file)
> >>>> +{
> >>>> +    BDRVRBDState *s = bs->opaque;
> >>>> +    int ret, r;
> >>> Nit: I would rename ret to status or something like that to make
> >>> it clear(er) that it is an actual value and never an error.  Or,
> >>> even better, drop it entirely and return one of the two bitmasks
> >>> directly.
> >>>
> >>>> +    struct rbd_diff_req req = { .offs = offset };
> >>>> +    uint64_t features, flags;
> >>>> +
> >>>> +    assert(offset + bytes <= s->image_size);
> >>>> +
> >>>> +    /* default to all sectors allocated */
> >>>> +    ret = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
> >>>> +    *map = offset;
> >>>> +    *file = bs;
> >>>> +    *pnum = bytes;
> >>>> +
> >>>> +    /* check if RBD image supports fast-diff */
> >>>> +    r = rbd_get_features(s->image, &features);
> >>>> +    if (r < 0) {
> >>>> +        goto out;
> >>>> +    }
> >>>> +    if (!(features & RBD_FEATURE_FAST_DIFF)) {
> >>>> +        goto out;
> >>>> +    }
> >>>> +
> >>>> +    /* check if RBD fast-diff result is valid */
> >>>> +    r = rbd_get_flags(s->image, &flags);
> >>>> +    if (r < 0) {
> >>>> +        goto out;
> >>>> +    }
> >>>> +    if (flags & RBD_FLAG_FAST_DIFF_INVALID) {
> >>>> +        goto out;
> >>> Nit: I'm not a fan of labels that cover just the return statement.
> >>> Feel free to ignore this one but I would get rid of it and replace
> >>> these gotos with returns.
> >>
> >> That would be return with the bitmask directly coded in if I also
> >>
> >> drop the ret variable. I can change that, no problem.
> >>
> >>
> >>>> +    }
> >>>> +
> >>>> +    r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
> >>>> +                          qemu_rbd_co_block_status_cb, &req);
> >>>> +    if (r < 0 && r != QEMU_RBD_EXIT_DIFF_ITERATE2) {
> >>>> +        goto out;
> >>>> +    }
> >>>> +    assert(req.bytes <= bytes);
> >>>> +    if (!req.exists) {
> >>>> +        if (r == 0 && !req.bytes) {
> >>>> +            /*
> >>>> +             * rbd_diff_iterate2 does not invoke callbacks for unallocated areas
> >>>> +             * except for the case where an overlay has a hole where the parent
> >>>> +             * has not. This here catches the case where no callback was
> >>>> +             * invoked at all.
> >>>> +             */
> >>> The above is true in the case of diffing against a snapshot, i.e. when
> >>> the "from" snapshot has some data where the "to" revision (whether HEAD
> >>> or another snapshot) has a hole.  I don't think it is true for child vs
> >>> parent (but it has been a while since I looked at the diff code).  As
> >>> long as NULL is passed for fromsnapname, I would expect the callback to
> >>> be invoked only for allocated areas.  If I'm right, we could simplify
> >>> qemu_rbd_co_block_status_cb() considerably.
> >> See my comment in the callback. Can you look at the diff code or give
> >> me at least a pointer where I can find it. I am not that familiar with
> >> the librbd code yet.
> > I assumed that you added !exists handling because it came up in your
> > testing.  If you don't have a test case then let's proceed under the
> > assumption that it doesn't happen for clones.
>
>
> Hi Ilya,
>
>
> it seems that our assumption was false. I have an image which shows holes without diffing against
>
> a snapshot. Do you have an idea why?
>
>
> $ rbd --conf /etc/ceph/ceph-dev01.conf --id lieven info dhp-standard/c4ca7ee9-36ce-4fc9-9d3b-ece8a4f8b83e/c1ad11d0-4f6a-4cc1-8aa3-ff3c413c1471.raw
> rbd image 'c1ad11d0-4f6a-4cc1-8aa3-ff3c413c1471.raw':
>      size 20 GiB in 20000 objects
>      order 20 (1 MiB objects)
>      snapshot_count: 2
>      id: 3d6daa102e4d9f
>      block_name_prefix: rbd_data.3d6daa102e4d9f
>      format: 2
>      features: layering, exclusive-lock, object-map, fast-diff, deep-flatten
>      op_features:
>      flags:
>      create_timestamp: Tue Sep 21 14:16:56 2021
>      access_timestamp: Thu Jan  6 15:24:46 2022
>      modify_timestamp: Thu Jan  6 15:45:42 2022
>
>
> $ rbd --conf /etc/ceph/ceph-dev01.conf --id lieven snap ls dhp-standard/c4ca7ee9-36ce-4fc9-9d3b-ece8a4f8b83e/c1ad11d0-4f6a-4cc1-8aa3-ff3c413c1471.raw
> SNAPID  NAME                 SIZE    PROTECTED TIMESTAMP
>   12297  dlp-20210921-144509  20 GiB             Tue Sep 21 14:45:09 2021
>   17745  dlp-20220106-040000  20 GiB             Thu Jan  6 04:00:01 2022
>
>
> $ rbd --conf /etc/ceph/ceph-dev01.conf --id lieven diff --whole-object dhp-standard/c4ca7ee9-36ce-4fc9-9d3b-ece8a4f8b83e/c1ad11d0-4f6a-4cc1-8aa3-ff3c413c1471.raw | grep zero
> 204472320    1048576  zero
> 1114636288   1048576  zero
> 1115684864   1048576  zero
> 1116733440   1048576  zero
> 1117782016   1048576  zero
> 1218445312   1048576  zero
> 1219493888   1048576  zero
> 1220542464   1048576  zero

Hi Peter,

Yes, I stumbled upon this just yesterday while looking into another
librbd issue surfaced by this patch [1] and was going to email you and
the list after wrapping my head around this behavior.  I see where it
is coming from but I'm not sure what the right fix is.  I would prefer
to patch librbd but that may turn out to be not feasible.  Let me get
back on this next week.

[1] https://tracker.ceph.com/issues/53784

Thanks,

                Ilya

