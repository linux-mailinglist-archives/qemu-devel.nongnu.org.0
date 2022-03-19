Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2634DE824
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 14:24:55 +0100 (CET)
Received: from localhost ([::1]:49510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVZ4g-0007xX-In
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 09:24:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1nVZ2f-0006s5-BC; Sat, 19 Mar 2022 09:22:49 -0400
Received: from [2607:f8b0:4864:20::a33] (port=36832
 helo=mail-vk1-xa33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1nVZ2d-00006S-Fm; Sat, 19 Mar 2022 09:22:49 -0400
Received: by mail-vk1-xa33.google.com with SMTP id w128so5802224vkd.3;
 Sat, 19 Mar 2022 06:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hc/5SHR/MXdi5pnpdzgjrclmjCTPyhKIA7vJMAq7l94=;
 b=RRERX19YcWotS2Gzw/tzvkgnqdKb1bL5de5V+mg93PBpnujfA02S/l1PywIVhZSVFx
 BiP+znny8ECUHsfHxYLdjHWpe/o7S6DuP8S1sn/CLaDhKZ5MIukhwmXPnqNpD8cIA+Kn
 bnz4h9dDTkLT7stZGYIUqZove0h2rtTxEiRAARkuWRGqpJweeDzf1q1C7wGPUzdoncqA
 b3ympdkhgzYuSj6V5lreB7ITc1x+npReZWfi5zE51AFrfwzfZhsHk2eFoNwIyVNPioJ0
 ACuelxD2OvI8ssgz/XhqBFKGoz0rCh4KSNU+AZjLg9b1ATHNdNAAQDvI+YEKTtG/oblU
 XyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hc/5SHR/MXdi5pnpdzgjrclmjCTPyhKIA7vJMAq7l94=;
 b=j75MP/6t7wgoJTZJim5hRQIMfG+56xuLKHTiEnlIAninGogb+pv5XruskRCaijQ8wG
 1GtUspU69OWdNVgJydknm0d2YfPSnq/h8SnEMjP3VYPMO4k71mMSdl5MfcLeax5BjydP
 m5S+7Rr4M5SBCdS9YdmUz1/VixKOKwg/4DNolrFW+cGHFmbwSqzabz7vz6qTbJAHU/UM
 g23+xYXQo2XKW6yW4ZbClHh38s/dariysnGJVAeUQi1PD5MOivV09NaQVb9GqDsc2Vmf
 ySNk7FndJrlHCbdnZ4BkoKAPrNqAX39MUa8nr8oaHg16KAhmQfo/tY4k9Qo2PxMbc5qZ
 3dxQ==
X-Gm-Message-State: AOAM532OczBfT/bMqtaqoLbaVK8y7SNuPJOkNpVmV8C90WUOjyXYlE3s
 A7b4yUqV2zB8pbA9ElD29hDdRkkYkNy9S3BAb6c=
X-Google-Smtp-Source: ABdhPJwL16I4Zr8C/V7ZJSrDxLNdpgfkgCn9CaA+eTSH/alEQ9NE/LNd3F/ss06T6TYr/4ZTuKfqg7SpStdyrP6gx74=
X-Received: by 2002:a05:6122:91d:b0:33e:8751:834c with SMTP id
 j29-20020a056122091d00b0033e8751834cmr4551778vka.11.1647696166140; Sat, 19
 Mar 2022 06:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220317162638.41192-1-sgarzare@redhat.com>
 <CAC868B4-D120-4EB4-A0E9-78F38BA20FA7@kamp.de>
 <20220318082504.qxqcarorpo2jxnfk@sgarzare-redhat>
 <CAOi1vP8Y-_LkuTaH6BCLiUhAUcBBbu-3scpM5d5gwz+xxvkYCw@mail.gmail.com>
In-Reply-To: <CAOi1vP8Y-_LkuTaH6BCLiUhAUcBBbu-3scpM5d5gwz+xxvkYCw@mail.gmail.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Sat, 19 Mar 2022 14:23:18 +0100
Message-ID: <CAOi1vP8aqApM5ubScq1M=uiAuA=N0eSChjP9uoWg7as0-RFcbg@mail.gmail.com>
Subject: Re: [PATCH] block/rbd: fix write zeroes with growing images
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=idryomov@gmail.com; helo=mail-vk1-xa33.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 qemu block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 19, 2022 at 1:40 PM Ilya Dryomov <idryomov@gmail.com> wrote:
>
> On Fri, Mar 18, 2022 at 9:25 AM Stefano Garzarella <sgarzare@redhat.com> =
wrote:
> >
> > On Thu, Mar 17, 2022 at 07:27:05PM +0100, Peter Lieven wrote:
> > >
> > >
> > >> Am 17.03.2022 um 17:26 schrieb Stefano Garzarella <sgarzare@redhat.c=
om>:
> > >>
> > >> =EF=BB=BFCommit d24f80234b ("block/rbd: increase dynamically the ima=
ge size")
> > >> added a workaround to support growing images (eg. qcow2), resizing
> > >> the image before write operations that exceed the current size.
> > >>
> > >> We recently added support for write zeroes and without the
> > >> workaround we can have problems with qcow2.
> > >>
> > >> So let's move the resize into qemu_rbd_start_co() and do it when
> > >> the command is RBD_AIO_WRITE or RBD_AIO_WRITE_ZEROES.
> > >>
> > >> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2020993
> > >> Fixes: c56ac27d2a ("block/rbd: add write zeroes support")
> > >> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > >> ---
> > >> block/rbd.c | 26 ++++++++++++++------------
> > >> 1 file changed, 14 insertions(+), 12 deletions(-)
> > >>
> > >> diff --git a/block/rbd.c b/block/rbd.c
> > >> index 8f183eba2a..6caf35cbba 100644
> > >> --- a/block/rbd.c
> > >> +++ b/block/rbd.c
> > >> @@ -1107,6 +1107,20 @@ static int coroutine_fn qemu_rbd_start_co(Blo=
ckDriverState *bs,
> > >>
> > >>     assert(!qiov || qiov->size =3D=3D bytes);
> > >>
> > >> +    if (cmd =3D=3D RBD_AIO_WRITE || cmd =3D=3D RBD_AIO_WRITE_ZEROES=
) {
> > >> +        /*
> > >> +         * RBD APIs don't allow us to write more than actual size, =
so in order
> > >> +         * to support growing images, we resize the image before wr=
ite
> > >> +         * operations that exceed the current size.
> > >> +         */
> > >> +        if (offset + bytes > s->image_size) {
> > >> +            int r =3D qemu_rbd_resize(bs, offset + bytes);
> > >> +            if (r < 0) {
> > >> +                return r;
> > >> +            }
> > >> +        }
> > >> +    }
> > >> +
> > >>     r =3D rbd_aio_create_completion(&task,
> > >>                                   (rbd_callback_t) qemu_rbd_completi=
on_cb, &c);
> > >>     if (r < 0) {
> > >> @@ -1182,18 +1196,6 @@ coroutine_fn qemu_rbd_co_pwritev(BlockDriverS=
tate *bs, int64_t offset,
> > >>                                  int64_t bytes, QEMUIOVector *qiov,
> > >>                                  BdrvRequestFlags flags)
> > >> {
> > >> -    BDRVRBDState *s =3D bs->opaque;
> > >> -    /*
> > >> -     * RBD APIs don't allow us to write more than actual size, so i=
n order
> > >> -     * to support growing images, we resize the image before write
> > >> -     * operations that exceed the current size.
> > >> -     */
> > >> -    if (offset + bytes > s->image_size) {
> > >> -        int r =3D qemu_rbd_resize(bs, offset + bytes);
> > >> -        if (r < 0) {
> > >> -            return r;
> > >> -        }
> > >> -    }
> > >>     return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO=
_WRITE);
> > >> }
> > >>
> > >> --
> > >> 2.35.1
> > >>
> > >
> > >Do we really have a use case for growing rbd images?
> >
> > The use case is to have a qcow2 image on rbd.
> > I don't think it's very common, but some people use it and here [1] we
> > had a little discussion about features that could be interesting (e.g.
> > persistent dirty bitmaps for incremental backup).
>
> RBD supports that natively (object-map and fast-diff image features).
> The granularity is higher than a typical QCOW2 granularity (64K vs 4M)
> but I have never heard of that being a concern.

Sorry, I meant to say lower (more coarse grained) above.

RBD's default object size is 4M and that is the granularity at which
dirtiness is typically tracked.  It is possible to ask for a byte-level
incremental diff but it is obviously slow.

Thanks,

                Ilya

