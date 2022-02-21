Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F47C4BEB56
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 20:48:27 +0100 (CET)
Received: from localhost ([::1]:32860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMEfa-0006iH-Ho
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 14:48:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMEcs-0004MP-MX
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:45:39 -0500
Received: from [2607:f8b0:4864:20::b34] (port=42847
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMEcq-0006R5-5t
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:45:38 -0500
Received: by mail-yb1-xb34.google.com with SMTP id e140so36470163ybh.9
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 11:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HgYWGh3DJ1sN5bnkKwSrDClqmpezuqVNmSHF1zVFOW0=;
 b=Y/xSY8W7LxjIAe8K9MryGhl0uIFNZ7wUjGJQ73McidDnZhJkppF01rV3GL9iayZhj4
 l7cUaCFVI82mLri2Wa0JkpfGIqqhUpZAt7udzHGMFU92BDYMeVN60ETwq4u3s4L+DBMm
 eysba68xbe6GaQUP8S8wYUkuigJ5cF5soVnOkmVJV/heG+1ZaS/ksIe8JLdauttSxG9K
 a1wjkaDJ9bnNMyIOF4sE8qi7Py1rfNSpfqb/AxFqZYzMtfbZaqohblVig2NYvDmwkrQz
 HQLYbsZmJVixNUvN3aFRuYBIVRlhK01YmkuWWgyqM0sj50J5eLQmN79JlJjzDkEgecXz
 5mNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HgYWGh3DJ1sN5bnkKwSrDClqmpezuqVNmSHF1zVFOW0=;
 b=R5u6n9nMBSpxvzhR7OiVIqtBh/wsM5vVOC0gHE4wmsF26l9pRYyL2u5zlpYmhfdCtf
 nF6TaYDN6nUpGdDMMHOp8WOQnspnWqYXOiT8LxHQ7BwmX8z2InFugZj4E+9tvTuLU2hF
 pVQokLMIQedejG9NYP4tyXzxLcGNAbIHrxSjDbhRcRUwNoaSxzx02irmcHwJ6yEKFhlL
 pepOuAGhHlXK1WrDhgD8r3/QoYVHkx7CI9yKQ+ApLx3T4uSQOWvth9FZJUfTT7jE3a7k
 NKz/V7NpBb5C4/JX1uHblKGgt7CQQk0qRD+fwCa4wLoH2DoCCcfJEwLAzceMVjjwy7FP
 URAw==
X-Gm-Message-State: AOAM531yD0b5ULdlpbn/08MA3rHmQE/r77pgiQ+2QI80cKUleR1tdLts
 RdsDvR7hoz6RaCpW0a1RnN/L4ET/aXobkIbHlOyaFw==
X-Google-Smtp-Source: ABdhPJwrha46UPOy3ZlPG5EfhDwan2wBFC/rAqtQzVCrJnV3y0uSs41KP4CVov+INK0RY30auIJMVt2n+OuduZCX+gI=
X-Received: by 2002:a25:5011:0:b0:61d:853e:ef96 with SMTP id
 e17-20020a255011000000b0061d853eef96mr20233563ybb.288.1645472734526; Mon, 21
 Feb 2022 11:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20220128165535.2550899-1-peter.maydell@linaro.org>
 <a26290d8-558c-ba85-ccf9-b56051a6dd75@redhat.com>
In-Reply-To: <a26290d8-558c-ba85-ccf9-b56051a6dd75@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Feb 2022 19:45:23 +0000
Message-ID: <CAFEAcA8_=dTPqAAptA_Ua8fAr15d8PtVQP_TWxHzN7y7NXBhAw@mail.gmail.com>
Subject: Re: [PATCH] block/curl.c: Check error return from curl_easy_setopt()
To: Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Feb 2022 at 11:25, Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 28.01.22 17:55, Peter Maydell wrote:
> > Coverity points out that we aren't checking the return value
> > from curl_easy_setopt() for any of the calls to it we make
> > in block/curl.c.
> >
> > Fixes: Coverity CID 1459336, 1459482, 1460331
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Big fat disclaimer: tested only with 'make check', which I suspect
> > may not be exercising this block backend. Hints on how to test
> > more thoroughly are welcome.
> >
> >   block/curl.c | 90 +++++++++++++++++++++++++++++++++------------------=
-
> >   1 file changed, 58 insertions(+), 32 deletions(-)
>
> One problem I see in general is that most of the setopt functions are
> (indirectly) called from `curl_open()`, which is supposed to return an
> error message.  Its `out` label seems to expect some error description
> in `state->errmsg`.  The error handling here doesn=E2=80=99t set such a d=
escription.

Ah, yes, I hadn't noticed that -- it's a pre-existing bug, where
we do this:

    if (curl_init_state(s, state) < 0) {
        goto out;
    }

and curl_init_state() already has an error path (for when curl_easy_init()
fails) that can take that goto without setting state->errmsg...

> Then again, there are enough existing error paths that don=E2=80=99t set =
this
> description either, so it isn=E2=80=99t quite this patch=E2=80=99s duty t=
o fix that
> situation.

...as you've already noticed :-)

> I guess it would be nice if we had a wrapper for
> `curl_easy_setopt()` with an `Error **` parameter, so we could easily
> generate error messages that describe key and value (and then
> `curl_init_state()` should have an `Error **` parameter, too).
>
> But this patch doesn=E2=80=99t make anything worse than it already is, so=
 that=E2=80=99d
> rather be an idea for future clean-up.
>
> > diff --git a/block/curl.c b/block/curl.c
> > index 6a6cd729758..aaee1b17bef 100644
> > --- a/block/curl.c
> > +++ b/block/curl.c
>
> [...]
>
> > @@ -879,7 +902,10 @@ static void curl_setup_preadv(BlockDriverState *bs=
, CURLAIOCB *acb)
> >
> >       snprintf(state->range, 127, "%" PRIu64 "-%" PRIu64, start, end);
> >       trace_curl_setup_preadv(acb->bytes, start, state->range);
> > -    curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range);
> > +    if (curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range)) {
> > +        curl_clean_state(state);
> > +        goto out;
>
> I think we need to mark the request as failed by setting `acb->ret` to a
> negative value (and probably also clear `state->acb[0]` like the error
> path below does).

OK; or I could roll the two curl calls into the same if:

    if (curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range) ||
        curl_multi_add_handle(s->multi, state->curl) !=3D CURLM_OK) {
        /* existing error handling and goto-out code */
    }

thanks
-- PMM

