Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642614D1338
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 10:20:34 +0100 (CET)
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRW1A-0005TZ-VS
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 04:20:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRVzX-0004ec-PI
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:18:52 -0500
Received: from [2607:f8b0:4864:20::112c] (port=42772
 helo=mail-yw1-x112c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRVzW-0008CW-1S
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:18:51 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2dbd97f9bfcso194016307b3.9
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 01:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bZwS7qjZf0MABCZavxA3Ozg9JBrTH/Si1Lamknriovg=;
 b=Cy9XVh4fVq293gWi3PSMa1xZIxoyskY9okLrRdx1Ovwphz9y4xG5qCdah8CQixBzJn
 B4zC380St01vG97pJGkOMos/Z9TDs6ASVXSNgJf7VZDY2hoLKUbdMjrKaKbbJwcF+0Sh
 NwjsHnpKGVRDn+UuLex5R50+E1oxPqiNe3Fi+ZaO1hNBilYllTMJmK+GMlOnK0G/QTZs
 TYrhmtVdy6xjm7HRRk5qbxD0b32nwghiB5DbdreaPekHwfa79mOn4x56Y8Mkdo3elOS1
 0BH/U+Jr/LLSZ4+5jI0W0RzUX/gOx9UZBrjLS45HOzRh4pcNLy7R13hylMaKeVCniuNA
 AgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bZwS7qjZf0MABCZavxA3Ozg9JBrTH/Si1Lamknriovg=;
 b=PgYwgoeR++XJyJfatCprb1H3HWRUB29Vu5xY8kfCsKqBvm6c8oF38ljVF0ntR6cQPU
 Vt4qDaG7abKDxhrrg3uds5kXoLpKTkPFAWYyHcGelSrb2tvudJe+2raQ8wxrksWUh0T9
 ygZlV1JJJy9TBYCP1txkoQuAWy1HINEALQPkbhmTUcum9vyvenNoOw9+RVo/fWu0gbpI
 dZzHL18qeh0ust+BJlZ6vZl6sx0Drp6UadTyfThLpV9QEt43yOrC8/VTwFJqfXA7evYT
 0ImHpnuqb8McPFIrpSiKy1Wou7g0TEIyIMtiLi5ydhUjuPgjhcB1b9zlQvYThWWx5x70
 urZQ==
X-Gm-Message-State: AOAM533KZxKZQ96fLyXQPbOpzUu/+zm8npZscVuDa7tI5bizDH6OnU2Z
 9EuevtRbASzPGCeIc7xSXQiAmKxT13NsWY1W27B3ChnqQgBvZA==
X-Google-Smtp-Source: ABdhPJxCMgdvN8gJTOIGs+dRPaqJ+HHfYtroGZREPpo3S7tWm4Qlf02YSV07whDcAP5eL/RfiF2yBWWYLhxsGNrcf38=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr12602225ywb.257.1646731129021; Tue, 08
 Mar 2022 01:18:49 -0800 (PST)
MIME-Version: 1.0
References: <20220307191553.429236-1-danielhb413@gmail.com>
 <CAFEAcA-=--vfvh9ZddyRKfcXqoW7fnjLVcqZpyP2tM8b8vhO=A@mail.gmail.com>
 <74b35947-b6f2-6155-45de-93777545753c@gmail.com>
In-Reply-To: <74b35947-b6f2-6155-45de-93777545753c@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 09:18:37 +0000
Message-ID: <CAFEAcA9koxjGmN1X0JNHfTuAthsy50zfB93XR6OEo48QzCx3pQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] add LOG_UNSUPP log type + mark hcalls as unsupp
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Cc: david@gibson.dropbear.id.au, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 22:00, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
>
>
> On 3/7/22 17:21, Peter Maydell wrote:
> > On Mon, 7 Mar 2022 at 19:19, Daniel Henrique Barboza
> > <danielhb413@gmail.com> wrote:
> >>
> >> Hi,
> >>
> >> I got a lot of noise trying to debug an AIX guest in a pseries machine when running with
> >> '-d unimp'. The reason is that there is no distinction between features
> >> (in my case, hypercalls) that are unimplemented because we never considered,
> >> versus features that we made a design choice not to implement.
> >>
> >> This series adds a new log type, LOG_UNSUPP, as a way to filter the
> >> second case. After changing the log level of existing unsupported
> >> pseries hypercalls, -d unimp was reporting just the ones that I need to
> >> worry about and decide whether we should implement it or mark as
> >> unsupported in our model. After this series there's still one hypercall
> >> thgat is being thrown by AIX. We'll deal with that another day.
> >
> > So the intention of the distinction is:
> >    LOG_UNIMP: we don't implement this, but we should
> >    LOG_UNSUPP: we don't implement this, and that's OK because it's optional
> >
> > ?
>
> The idea is that LOG_UNIMP is too broad and it's used to indicate features that are
> unknown to QEMU and also features that QEMU knows about but does not support it. It's
> not necessarily a way of telling "we should implement this" but more like "we know/do
> not know what this is".

From the point of view of debugging the guest, I don't care
whether the QEMU developers know that they've not got round
to something or whether they've just forgotten it. I care
about "is this because I, the guest program, did something wrong,
or is it because QEMU is not completely emulating something
I should really be able to expect to be present". This is why we
distinguish LOG_UNIMP from LOG_GUEST_ERROR.

> > I think I'd be happier about adding a new log category if we had
> > some examples of where we should be using it other than just in
> > the spapr hcall code, to indicate that it's a bit more broadly
> > useful. If this is a distinction that only makes sense for that
> > narrow use case, then as Philippe says a tracepoint might be a
> > better choice.
>
> target/arm/translate.c, do_coproc_insn():

> This use of LOG_UNIMP is logging something that we don't know about, it's unknown.

(Some of the things that get logged here will really be things that
we conceptually "know about" and don't implement -- the logging
is a catch-all for any kind of unimplemented register, whether the
specs define it or not.)

> And hw/arm/smmuv3.c, decode_ste():

> This is something we know what it is and are deciding not to support it. Both are being
> logged as LOG_UNIMP. This is the distinction I was trying to achieve with this new
> log type. The example in decode_ste() could be logged as LOG_UNSUPP.

I don't see much benefit in distinguishing these two cases, to be
honest. You could maybe have sold me on "you're accessing something
that is optional and we happen not to provide it" vs "you're
accessing something that should be there and isn't", because that's
a distinction that guest code authors might plausibly care about.
To the extent that you want to helpfully say "this is because
QEMU doesn't implement an entire feature" you can say that in the
free-form text message.

-- PMM

