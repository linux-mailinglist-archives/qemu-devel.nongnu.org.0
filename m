Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBB14C6E95
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:50:01 +0100 (CET)
Received: from localhost ([::1]:47950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgPY-0000Eh-K7
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:50:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOgCJ-0005Br-Of
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:36:20 -0500
Received: from [2607:f8b0:4864:20::1134] (port=46290
 helo=mail-yw1-x1134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOgCH-0004Wz-6U
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:36:19 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2d07c4a0d06so107853457b3.13
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 05:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l46N7ZKZGcqPsRhG5851/H2PTyV+UEPGuaOm/bhWQHQ=;
 b=zK3bQouOTk5bqLpcEU6imNJDtmlwfvtq2Yzh+QliTL32Z1IHLu2As3Vg8t0CzMSl8U
 F/vyjW8T5wTZByflq6NxQwR6vwWaePnMso91RrCTp1Y5x78VXvDpfTA/gLvB/SCrYojO
 HpjdTurpP371Hgk6P0a40fkbiNM6AgH3uhLzznW24YWzmehQglIEWlXy718beRk+0Bsf
 bGvwyJ7PmLGL/51bIR0TX1XyUKe/AbUC7zDSY/jFKRcQCyjJen2yO9PyXn+atkreLGzh
 9mpEzgLQ+JjjnwkqvEZ8SvP/09rbnLYkM9FVFAwG8bB8k9PO0MMOyWa3HDgGo7A+YIkU
 RnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l46N7ZKZGcqPsRhG5851/H2PTyV+UEPGuaOm/bhWQHQ=;
 b=Mkvv+6FCqPcYpvU9I71ZjUk1vbyBWEDBIF6OQ9grE8e5jtrBhYrns6ZpevgmH07R6+
 CDSZ4OlD0VEGkpSFhCEwFK6s4mT77TYgaF1KdltSIUrsfZB+X341aXAUbbvsya8PiDyS
 6hzZ41AyXZ7T1aPD7jjKQU4JB6ZZQqqeNtaLNYmvhLH81J4wGZ9mrb2cfZhRjWEJEEMf
 +J/plmahDcUEI5nko9apM8vwPUqLVCeT88BnlkIHiKoSA4x87omMtsnSlLPYfApdC+uz
 kMBEqohpozd6boVdA0UYYZ4+uibWJi8E5XYUnmZ46AXZK73/tWAZlaGxuVfWjZZri0e6
 3egA==
X-Gm-Message-State: AOAM53226W3vr+2eNcnP5LyGEUMGf044N+vmRvb9PZCCqmrsQp/BI6GX
 YPvd0z2LQiYXybiyLZEvzv2FEAnJ0b4fIrXAOWJCJA==
X-Google-Smtp-Source: ABdhPJzTysjYSGADwLruU0lkt1XHeIU3Fx6sheTO4yWTnKj2OTItsRg05oSTxI2kCfcaOTFcGTrp5anBqYTbcU05U8k=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr19970750ywh.329.1646055374615; Mon, 28
 Feb 2022 05:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20220228120720.722632-1-marcandre.lureau@redhat.com>
 <20220228120720.722632-2-marcandre.lureau@redhat.com>
 <CAFEAcA_a+0Nz5b3uU052FquVLOLRTvejPD13NSxvHTu_yZTBiQ@mail.gmail.com>
 <CAMxuvaw-q06u7TfjzueZWwiiXCjwFh+QfQaM+cTKHQcmYBW-iQ@mail.gmail.com>
In-Reply-To: <CAMxuvaw-q06u7TfjzueZWwiiXCjwFh+QfQaM+cTKHQcmYBW-iQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 13:36:03 +0000
Message-ID: <CAFEAcA8Qz1gpb+m7c4isagPG357NjwLtm3hfrmrnG8zYqEqKdw@mail.gmail.com>
Subject: Re: [PATCH 2/2] meson: fix CONFIG_ATOMIC128 check
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 13:28, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> On Mon, Feb 28, 2022 at 5:24 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
> >
> > On Mon, 28 Feb 2022 at 12:19, <marcandre.lureau@redhat.com> wrote:
> > >
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > testfile.c: In function 'main':
> > > testfile.c:5:11: error: incorrect number of arguments to function '__=
atomic_load'
> > >     5 |       y =3D __atomic_load(&x, 0);
> > >       |           ^~~~~~~~~~~~~
> > > testfile.c:6:7: error: argument 2 of '__atomic_store' must be a point=
er type
> > >     6 |       __atomic_store(&x, y, 0);
> > >       |       ^~~~~~~~~~~~~~
> > > testfile.c:7:7: error: argument 3 of '__atomic_compare_exchange' must=
 be a pointer type
> > >     7 |       __atomic_compare_exchange(&x, &y, x, 0, 0, 0);
> > >       |       ^~~~~~~~~~~~~~~~~~~~~~~~~
> > >
> > > And it must be linked with -latomic.
> >
> > As Philippe says, this isn't right. What the configure test
> > is checking for is "do we have 128-bit atomics which are
> > handled inline and specifically not via libatomic". The
> > reason we can't use libatomic is documented in the comment
> > starting "GCC is a house divided" in include/qemu/atomic128.h.
>
> The arguments fix is still valid, no?

Probably. (Does this mean we've never been correctly setting
CONFIG_ATOMIC128?)

I think we should have the 128-bit atomics check in meson.build
look the same as the existing one for 64-bit atomics, though,
unless there's a reason why they should look different.
For the 64-bit version we explicitly pass __ATOMIC_RELAXED,
and we use __atomic_load_n(), not __atomic_load().

thanks
-- PMM

