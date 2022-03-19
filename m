Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E272E4DE7E9
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 13:42:42 +0100 (CET)
Received: from localhost ([::1]:36328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVYPp-00033k-Vv
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 08:42:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1nVYNC-0001PB-CB; Sat, 19 Mar 2022 08:39:58 -0400
Received: from [2607:f8b0:4864:20::a2d] (port=43549
 helo=mail-vk1-xa2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1nVYNA-00022u-P8; Sat, 19 Mar 2022 08:39:58 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id 6so2632122vkc.10;
 Sat, 19 Mar 2022 05:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q27BkwObJmDD4Xd8QgkFxGlMuUvG94v1anEANk+z1Ww=;
 b=Zjj64k4ISbdrD31Qv5UcCpmMwIskX07q6gSilOukdt4c2H7Ho5YxFVPP5PFvMszYnX
 MdtMFxf4wdXHrN96+HmthPvm6yMe/piUdX4N5UPk4mspC/o5TJuI0wzbwYdeaPqCmzrO
 ctJDS9EjFNRivmOAELtioHuhisuOQlMHJ3KNV24tqAs6v2AOvFrSPn/JOMp0D9OvltH8
 98nQAV0jM2+eCMcNOIWnGCQIMaJBlTIstU40b/vvJtKnmxbZsiGUQ22BwCNMzjy24dam
 46K26dScgUHIrG/AuBTH1riyCdvR0CsyIHMgmUrgQ6nqNe3DojiZroIaFdnnN+iTX8Nh
 cnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q27BkwObJmDD4Xd8QgkFxGlMuUvG94v1anEANk+z1Ww=;
 b=cmeRsv8MKrZNv+z2JF1pXP4mHGx/KSvPxagT4ZLVMXE+zWEM7r6PFih8h9yELuFk+B
 xDOT1SjmdRBLCDNaUXPaR6E0UH5y0nlOHhvXy7Z0PYRTgxvn4nc1GmQ+QJHfNJvxnWZQ
 801RUglesoS4KxJOBtNJAhoUZXmFpQdhnvW39EJF3ATc7+hZpEb48CZ11iKOSQDGpKBG
 c83fCvKz4hspVAvWt9/8nvsx1EGeDxi1NEpaeWCFjgzimy8aYv1m/6hU6ztrWYpZcL/D
 RrBpNBl/8YuRy02KutDY4yVxrMlbLeCRBBpqzR6Zu7BQBWp8hYaLfdEmQ+DfIHbeVDn4
 yGvA==
X-Gm-Message-State: AOAM532hZTEFHzxcTdJv7K6j8XaZq+YSR0vgA90+kOIXV3OHKl4ZHckd
 1SMFAOCAJTpTGLf+7xF0YdaCKL6tbsPYOA4F3ho=
X-Google-Smtp-Source: ABdhPJwinmgne7O1LrHmFpXiAovMpSGSqDU31bHeFraGAowVNcLMk39Nh/8jbuV4jX4Wks5divJitdUoA45QerKWlLM=
X-Received: by 2002:a1f:2e95:0:b0:33e:bd23:f1f with SMTP id
 u143-20020a1f2e95000000b0033ebd230f1fmr2069792vku.1.1647693595138; Sat, 19
 Mar 2022 05:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220317162638.41192-1-sgarzare@redhat.com>
 <CAC868B4-D120-4EB4-A0E9-78F38BA20FA7@kamp.de>
 <20220318082504.qxqcarorpo2jxnfk@sgarzare-redhat>
In-Reply-To: <20220318082504.qxqcarorpo2jxnfk@sgarzare-redhat>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Sat, 19 Mar 2022 13:40:27 +0100
Message-ID: <CAOi1vP8Y-_LkuTaH6BCLiUhAUcBBbu-3scpM5d5gwz+xxvkYCw@mail.gmail.com>
Subject: Re: [PATCH] block/rbd: fix write zeroes with growing images
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=idryomov@gmail.com; helo=mail-vk1-xa2d.google.com
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

On Fri, Mar 18, 2022 at 9:25 AM Stefano Garzarella <sgarzare@redhat.com> wr=
ote:
>
> On Thu, Mar 17, 2022 at 07:27:05PM +0100, Peter Lieven wrote:
> >
> >
> >> Am 17.03.2022 um 17:26 schrieb Stefano Garzarella <sgarzare@redhat.com=
>:
> >>
> >> =EF=BB=BFCommit d24f80234b ("block/rbd: increase dynamically the image=
 size")
> >> added a workaround to support growing images (eg. qcow2), resizing
> >> the image before write operations that exceed the current size.
> >>
> >> We recently added support for write zeroes and without the
> >> workaround we can have problems with qcow2.
> >>
> >> So let's move the resize into qemu_rbd_start_co() and do it when
> >> the command is RBD_AIO_WRITE or RBD_AIO_WRITE_ZEROES.
> >>
> >> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2020993
> >> Fixes: c56ac27d2a ("block/rbd: add write zeroes support")
> >> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> >> ---
> >> block/rbd.c | 26 ++++++++++++++------------
> >> 1 file changed, 14 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/block/rbd.c b/block/rbd.c
> >> index 8f183eba2a..6caf35cbba 100644
> >> --- a/block/rbd.c
> >> +++ b/block/rbd.c
> >> @@ -1107,6 +1107,20 @@ static int coroutine_fn qemu_rbd_start_co(Block=
DriverState *bs,
> >>
> >>     assert(!qiov || qiov->size =3D=3D bytes);
> >>
> >> +    if (cmd =3D=3D RBD_AIO_WRITE || cmd =3D=3D RBD_AIO_WRITE_ZEROES) =
{
> >> +        /*
> >> +         * RBD APIs don't allow us to write more than actual size, so=
 in order
> >> +         * to support growing images, we resize the image before writ=
e
> >> +         * operations that exceed the current size.
> >> +         */
> >> +        if (offset + bytes > s->image_size) {
> >> +            int r =3D qemu_rbd_resize(bs, offset + bytes);
> >> +            if (r < 0) {
> >> +                return r;
> >> +            }
> >> +        }
> >> +    }
> >> +
> >>     r =3D rbd_aio_create_completion(&task,
> >>                                   (rbd_callback_t) qemu_rbd_completion=
_cb, &c);
> >>     if (r < 0) {
> >> @@ -1182,18 +1196,6 @@ coroutine_fn qemu_rbd_co_pwritev(BlockDriverSta=
te *bs, int64_t offset,
> >>                                  int64_t bytes, QEMUIOVector *qiov,
> >>                                  BdrvRequestFlags flags)
> >> {
> >> -    BDRVRBDState *s =3D bs->opaque;
> >> -    /*
> >> -     * RBD APIs don't allow us to write more than actual size, so in =
order
> >> -     * to support growing images, we resize the image before write
> >> -     * operations that exceed the current size.
> >> -     */
> >> -    if (offset + bytes > s->image_size) {
> >> -        int r =3D qemu_rbd_resize(bs, offset + bytes);
> >> -        if (r < 0) {
> >> -            return r;
> >> -        }
> >> -    }
> >>     return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_W=
RITE);
> >> }
> >>
> >> --
> >> 2.35.1
> >>
> >
> >Do we really have a use case for growing rbd images?
>
> The use case is to have a qcow2 image on rbd.
> I don't think it's very common, but some people use it and here [1] we
> had a little discussion about features that could be interesting (e.g.
> persistent dirty bitmaps for incremental backup).

RBD supports that natively (object-map and fast-diff image features).
The granularity is higher than a typical QCOW2 granularity (64K vs 4M)
but I have never heard of that being a concern.

Thanks,

                Ilya

