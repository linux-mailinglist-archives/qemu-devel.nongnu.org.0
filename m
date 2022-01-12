Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBB348C4EF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:35:55 +0100 (CET)
Received: from localhost ([::1]:56200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7dn6-0001kC-Gp
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:35:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1n7cdg-0006Au-9i; Wed, 12 Jan 2022 07:22:04 -0500
Received: from [2607:f8b0:4864:20::92f] (port=41493
 helo=mail-ua1-x92f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1n7cde-0003Zt-HI; Wed, 12 Jan 2022 07:22:03 -0500
Received: by mail-ua1-x92f.google.com with SMTP id p37so4337527uae.8;
 Wed, 12 Jan 2022 04:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nn7I+oK8Mac+8/P+XKqEAniKMh30HqVk4t+xnuTpGqw=;
 b=UwkvsHGcNhA+5qkJ/C3eGVbeasFJiUv7Ikae51PMrHqytHjGog98B+18CoBurFDMq7
 QVM68ZehRoRSD6Hww9iaXF13pykQMrLIKXaa+ZCVYpMULoxGF0ZehM3ANNQxW4RVtgmw
 XowWhPl24BJKiYi5P201vV/mCZgHqWgDVA4cGFjKNGOgyOSYawangCDuCI1/bhMd9vcL
 ynMOnJHYysrZrx1qt7T0VoF1mxcqdGxKPQyddaJR4NcPWPVei/HSzSaHeFnOiUlwmd27
 ieX8TJ0vI9yzdJHQNuXV1e2SXVrGneCJV93srLjOZ5VUQ8D7+o1RgzrYd+iYPHjJt50U
 RXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nn7I+oK8Mac+8/P+XKqEAniKMh30HqVk4t+xnuTpGqw=;
 b=jGukePqDQMrUl2W+0r4VZvxeMSgvIYf53PJPgHZIXe8lAHp9rFyFMJRrMJT2v/XDKR
 XrpaRFVnKHecw7HwuCU1dk38uKjh/+F7zgdG0DSaWu/dZUcqUFS1/9SGFkWwDjzNMS6U
 HMhSuMktqR48ILyWAxGioOJMK2X6q0riKwQm9Wf//qw4qnD9AprYYjoI2ssZ92DZajxl
 e8pcIflObxJK5kILqXSEShVHVl26dL6M2td5AKeGeskuI2r0X6tReA1pS5/rK/hPuCkK
 ZocqIXQSsO8T6uLF/3QMUbLUlzmHyK04b9tTnaeMnSMpto/piSHLuM0OhnIIWpYkM5c3
 HMFA==
X-Gm-Message-State: AOAM531Y+M1f3IpL98SASdwR5uni6dZA0UZIySYVr/+snvE3Btpm8l/A
 MUy6LBVcJmhPf0wrTBxeH2Sk6gVgrIj0crQg0PQntrHBM24=
X-Google-Smtp-Source: ABdhPJwmfptFp7gL6A1A6oL+I2A4n4zLdOKn34MDrcHO7frrhap4TUkptMMv/x4V9VRMtOPdiYLXzm5ujwauGHjZXGE=
X-Received: by 2002:a67:ef1c:: with SMTP id j28mr4266243vsr.13.1641990120291; 
 Wed, 12 Jan 2022 04:22:00 -0800 (PST)
MIME-Version: 1.0
References: <20220110114154.3774072-1-pl@kamp.de>
 <20220110114154.3774072-3-pl@kamp.de>
 <CAOi1vP8tLGvy7R3NLzfYkD-V=Tzokz6LOKvx--V-jHSSUfyyDw@mail.gmail.com>
 <2a2cc253-e7fc-085b-4982-df46432216d4@kamp.de>
In-Reply-To: <2a2cc253-e7fc-085b-4982-df46432216d4@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 12 Jan 2022 13:22:01 +0100
Message-ID: <CAOi1vP8xRRhaN=52=BCy92CSNrnpPcxNJvDAbz4xYNKsJiJ_bA@mail.gmail.com>
Subject: Re: [PATCH 2/2] block/rbd: workaround for ceph issue #53784
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=idryomov@gmail.com; helo=mail-ua1-x92f.google.com
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
 qemu-block@nongnu.org, qemu-devel@nongnu.org, ct@flyingcircus.io,
 qemu-stable@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 12:55 PM Peter Lieven <pl@kamp.de> wrote:
>
> Am 12.01.22 um 10:59 schrieb Ilya Dryomov:
> > On Mon, Jan 10, 2022 at 12:43 PM Peter Lieven <pl@kamp.de> wrote:
> >> librbd had a bug until early 2022 that affected all versions of ceph that
> >> supported fast-diff. This bug results in reporting of incorrect offsets
> >> if the offset parameter to rbd_diff_iterate2 is not object aligned.
> >> Work around this bug by rounding down the offset to object boundaries.
> >>
> >> Fixes: https://tracker.ceph.com/issues/53784
> > I don't think the Fixes tag is appropriate here.  Linking librbd
> > ticket is fine but this patch doesn't really fix anything.
>
>
> Okay, I will change that to See:

It's already linked in the source code, up to you if you also want to
link it in the description.

>
>
> >
> >> Cc: qemu-stable@nongnu.org
> >> Signed-off-by: Peter Lieven <pl@kamp.de>
> >> ---
> >>  block/rbd.c | 17 ++++++++++++++++-
> >>  1 file changed, 16 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/block/rbd.c b/block/rbd.c
> >> index 5e9dc91d81..260cb9f4b4 100644
> >> --- a/block/rbd.c
> >> +++ b/block/rbd.c
> >> @@ -1333,6 +1333,7 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
> >>      int status, r;
> >>      RBDDiffIterateReq req = { .offs = offset };
> >>      uint64_t features, flags;
> >> +    int64_t head;
> >>
> >>      assert(offset + bytes <= s->image_size);
> >>
> >> @@ -1360,6 +1361,19 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
> >>          return status;
> >>      }
> >>
> >> +    /*
> >> +     * librbd had a bug until early 2022 that affected all versions of ceph that
> >> +     * supported fast-diff. This bug results in reporting of incorrect offsets
> >> +     * if the offset parameter to rbd_diff_iterate2 is not object aligned.
> >> +     * Work around this bug by rounding down the offset to object boundaries.
> >> +     *
> >> +     * See: https://tracker.ceph.com/issues/53784
> >> +     */
> >> +    head = offset & (s->object_size - 1);
> >> +    offset -= head;
> >> +    req.offs -= head;
> >> +    bytes += head;
> > So it looks like the intention is to have more or less a permanent
> > workaround since all librbd versions are affected, right?  For that,
> > I think we would need to also reject custom striping patterns and
> > clones.  For the above to be reliable, the image has to be standalone
> > and have a default striping pattern (stripe_unit == object_size &&
> > stripe_count == 1).  Otherwise, behave as if fast-diff is disabled or
> > invalid.
>
>
> Do you have a fealing how many users use a different striping pattern than default?

Very few.

>
> What about EC backed pools?

In this context EC pools behave exactly the same as replicated pools.

>
> Do you have another idea how we can detect if the librbd version is broken?

No.  Initially I wanted to just fix these bugs in librbd, relying on
the assumption that setups with a new QEMU should also have a fairly
new librbd.  But after looking at various distros and realizing the
extent of rbd_diff_iterate2() issues, I think a long-term workaround
in QEMU makes sense.  A configure-time check for known good versions
of librbd can be added later if someone feels like it.

Thanks,

                Ilya

