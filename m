Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0477848CD64
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 22:04:38 +0100 (CET)
Received: from localhost ([::1]:50156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7knM-00008j-KK
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 16:04:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1n7klI-0007Vx-5R; Wed, 12 Jan 2022 16:02:28 -0500
Received: from [2607:f8b0:4864:20::92e] (port=45985
 helo=mail-ua1-x92e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1n7klG-00083d-IL; Wed, 12 Jan 2022 16:02:27 -0500
Received: by mail-ua1-x92e.google.com with SMTP id x33so7250431uad.12;
 Wed, 12 Jan 2022 13:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IWzASuqvsidDi9aD7GDyRXbkn+/K0Xl7i85UIuliF4g=;
 b=kT5A9pP40xMRlTtiDmuLvOAdazxvm/MudE1tBtBcgxdKGOvr17DspQ5EmW3dW9OUfD
 QQrZTBKgMRLACt35QiarxyjFTQAw+MA1yC/J0uzryUso3agto3lAAcPax81huG7FUKrN
 amDXdqYSpIy5/0U6Xerwz3CEKRg3cwYERDgVlfN8xUZOEu/uPnhLeDV+njkdkRpQhnoF
 wg3j60S4U/BURy/o1CPB2dcO0P7J4Ksho8KswOyEiGAB1HJWQC86sonE6spDwcr2jwgy
 CuI95KKOIH1WSETeYXtxUE9BOnPu0OCj+xg10l6Tuzviqi8b6S24ykwijfwl8YhX3vPJ
 v6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IWzASuqvsidDi9aD7GDyRXbkn+/K0Xl7i85UIuliF4g=;
 b=yXmZEuODR1ANCGI223yDxjuRGCy/mKf7eUsdZZNlEK5v8XgQ+GCiLkRWe6eWqtNJko
 kCPjc7IoJdkOFYGS7Iu2qxKi8qX5G+i1phuGqR8QlJRdVVL2zgdU0k73FCAnDzI9kQ27
 AFk1JtvTIRUnFFs0FlP/mp0OhhvuG6sM4IWOH5kYBFxFRpCSpwrB2pQd4lhbWw2k5Itr
 c+zzS47CiZJZ9HlmGlz3mLrc+V4ycTSCJCvd7iBt/Vizz+6gHahON9G6d5wu56qvqewK
 XJoXP5+CJdYQqr/0m3xBIUWgqeISOOvzolCghiHSSyMT3f3vllGMgRhi6kxew//VsJBC
 a7Fg==
X-Gm-Message-State: AOAM532gN71gv1JsDASnYX9phJKnVumfkj8N2/9oYqWn72HeG/tR7dkh
 ILOXjSqEs0LJhFze9/N7xb3s5Q1N1I53fqNXDc0Vte7Pfmg=
X-Google-Smtp-Source: ABdhPJyTPLtJS+6RTTAtkRTS2t0xFZCw5CQplDlwsPDqSEzzPWqeRJ7NR6nqn1elI+kHumKZCCuBc8NTJP1O0Ql+FKo=
X-Received: by 2002:a05:6102:c8e:: with SMTP id
 f14mr1044164vst.57.1642021344982; 
 Wed, 12 Jan 2022 13:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20220110114154.3774072-1-pl@kamp.de>
 <20220110114154.3774072-2-pl@kamp.de>
 <CAOi1vP_nvvfmXXq=2kXYVoO-4UtzDmJ0X44_NnB1QCnSKTyGMA@mail.gmail.com>
 <6ae8a816-642e-d002-f0b5-31ccc0e4e31a@kamp.de>
In-Reply-To: <6ae8a816-642e-d002-f0b5-31ccc0e4e31a@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 12 Jan 2022 22:02:25 +0100
Message-ID: <CAOi1vP93pvs8tOxj_9RL=bUTxyvYhcOha_JEa39AtWcVcey2_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] block/rbd: fix handling of holes in
 .bdrv_co_block_status
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=idryomov@gmail.com; helo=mail-ua1-x92e.google.com
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
 qemu-block@nongnu.org, qemu-stable@nongnu.org, ct@flyingcircus.io,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 9:39 PM Peter Lieven <pl@kamp.de> wrote:
>
> Am 12.01.22 um 10:05 schrieb Ilya Dryomov:
> > On Mon, Jan 10, 2022 at 12:42 PM Peter Lieven <pl@kamp.de> wrote:
> >> the assumption that we can't hit a hole if we do not diff against a snapshot was wrong.
> >>
> >> We can see a hole in an image if we diff against base if there exists an older snapshot
> >> of the image and we have discarded blocks in the image where the snapshot has data.
> >>
> >> Fixes: 0347a8fd4c3faaedf119be04c197804be40a384b
> >> Cc: qemu-stable@nongnu.org
> >> Signed-off-by: Peter Lieven <pl@kamp.de>
> >> ---
> >>  block/rbd.c | 55 +++++++++++++++++++++++++++++++++--------------------
> >>  1 file changed, 34 insertions(+), 21 deletions(-)
> >>
> >> diff --git a/block/rbd.c b/block/rbd.c
> >> index def96292e0..5e9dc91d81 100644
> >> --- a/block/rbd.c
> >> +++ b/block/rbd.c
> >> @@ -1279,13 +1279,24 @@ static int qemu_rbd_diff_iterate_cb(uint64_t offs, size_t len,
> >>      RBDDiffIterateReq *req = opaque;
> >>
> >>      assert(req->offs + req->bytes <= offs);
> >> -    /*
> >> -     * we do not diff against a snapshot so we should never receive a callback
> >> -     * for a hole.
> >> -     */
> >> -    assert(exists);
> >>
> >> -    if (!req->exists && offs > req->offs) {
> >> +    if (req->exists && offs > req->offs + req->bytes) {
> >> +        /*
> >> +         * we started in an allocated area and jumped over an unallocated area,
> >> +         * req->bytes contains the length of the allocated area before the
> >> +         * unallocated area. stop further processing.
> >> +         */
> >> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
> >> +    }
> >> +    if (req->exists && !exists) {
> >> +        /*
> >> +         * we started in an allocated area and reached a hole. req->bytes
> >> +         * contains the length of the allocated area before the hole.
> >> +         * stop further processing.
> >> +         */
> >> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
> >> +    }
> >> +    if (!req->exists && exists && offs > req->offs) {
> >>          /*
> >>           * we started in an unallocated area and hit the first allocated
> >>           * block. req->bytes must be set to the length of the unallocated area
> >> @@ -1295,17 +1306,19 @@ static int qemu_rbd_diff_iterate_cb(uint64_t offs, size_t len,
> >>          return QEMU_RBD_EXIT_DIFF_ITERATE2;
> >>      }
> >>
> >> -    if (req->exists && offs > req->offs + req->bytes) {
> >> -        /*
> >> -         * we started in an allocated area and jumped over an unallocated area,
> >> -         * req->bytes contains the length of the allocated area before the
> >> -         * unallocated area. stop further processing.
> >> -         */
> >> -        return QEMU_RBD_EXIT_DIFF_ITERATE2;
> >> -    }
> >> +    /*
> >> +     * assert that we caught all cases above and allocation state has not
> >> +     * changed during callbacks.
> >> +     */
> >> +    assert(exists == req->exists || !req->bytes);
> >> +    req->exists = exists;
> >>
> >> -    req->bytes += len;
> >> -    req->exists = true;
> >> +    /*
> >> +     * assert that we either return an unallocated block or have got callbacks
> >> +     * for all allocated blocks present.
> >> +     */
> >> +    assert(!req->exists || offs == req->offs + req->bytes);
> >> +    req->bytes = offs + len - req->offs;
> >>
> >>      return 0;
> >>  }
> >> @@ -1354,13 +1367,13 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
> >>      }
> >>      assert(req.bytes <= bytes);
> >>      if (!req.exists) {
> >> -        if (r == 0) {
> >> +        if (r == 0 && !req.bytes) {
> >>              /*
> >> -             * rbd_diff_iterate2 does not invoke callbacks for unallocated
> >> -             * areas. This here catches the case where no callback was
> >> -             * invoked at all (req.bytes == 0).
> >> +             * rbd_diff_iterate2 does not invoke callbacks for unallocated areas
> >> +             * except for the case where an overlay has a hole where the parent
> >> +             * or an older snapshot of the image has not. This here catches the
> >> +             * case where no callback was invoked at all.
> >>               */
> >> -            assert(req.bytes == 0);
> >>              req.bytes = bytes;
> >>          }
> >>          status = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID;
> >> --
> >> 2.25.1
> >>
> >>
> > Hi Peter,
> >
> > Can we just skip these "holes" by replacing the existing assert with
> > an if statement that would simply bail from the callback on !exists?
> >
> > Just trying to keep the logic as simple as possible since as it turns
> > out we get to contend with ages-old librbd bugs here...
>
>
> I'm afraid I think this would not work. Consider qemu-img convert.
>
> If we bail out we would immediately call get_block_status with the offset
>
> where we stopped and hit the !exist again.

I'm suggesting bailing from the callback (i.e. return 0), not from the
entire rbd_diff_iterate2() instance.  The iteration would move on and
either stumble upon an allocated area within the requested range or run
off the end of the requested range.  Both of these cases are already
handled by the existing code.

Thanks,

                Ilya

