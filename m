Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FA8472ABA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:58:30 +0100 (CET)
Received: from localhost ([::1]:40708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwj2L-00043u-H9
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:58:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mwj0I-00028m-6b
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:56:22 -0500
Received: from [2a00:1450:4864:20::336] (port=56156
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mwj0F-0002no-FM
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:56:21 -0500
Received: by mail-wm1-x336.google.com with SMTP id p18so11561430wmq.5
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 02:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LFMvMQVlJhagT0WrHjhcMdfLZgqRS0X4f1TAvCuYn/I=;
 b=ivg4OZCiU1D0bWM5TjoXu7eSsjML22otTBu0voD2ZA60sgvgUSAgVLOxpI4HQwze4Q
 4WBTj+yjQZqvWJaAM8eXqB+vS/sL2qFKWQSRW5+C+ggOemgxSwix3b5IcCkcoDYimE+N
 8364MA/sfVQpeC2bzAk6HZBonvxJ8PrIGkqs4nSaFQ12bmdUtGAGyTAu86VVpKdTg32p
 bf9M+ucC0J+GM+9NHd0l80Bw0RA4mQyYNUwxAWB9ppgURzFtpAE3wFdFYrUkLKDjhfGr
 JtfZq35blQ5Ij9sNnSWvbnxQ5cpXq486wGZUbLuE/50CZ/FMtvV52/QSdAc3c+ztiY3x
 1lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LFMvMQVlJhagT0WrHjhcMdfLZgqRS0X4f1TAvCuYn/I=;
 b=HxzhRZLmY3MRX+Kivt0XGhdBaTzviOnc2dIZENC275qxFYJOkLdtfKd+Zc6S4q0PwJ
 uqHgh5UOSZDdGl8yr77fJBLMYnZnv+ogErRvP8n6l0W0i0DfTzNhfOPkqNakd/ZewbUN
 JUyGlQTd4r1Ah0WCC8zH13vCUEjVCrbFmj/oCIH2Eb5ACX8oDDwpQ3uVQBkYX4q9b0gY
 Q6Wdjj0n9eK6QrNA8j7MHCBMvvW6/khMiO1RvG9e2eYtR5avD7COVDkWMCEdZSi5MKTG
 IgSMHy8PRVX/PjX/ZpjMgiOsowINZ+Hy3orroZHWu8PbwM8UKxEYWHf90WkQdsRXaUr+
 3Jig==
X-Gm-Message-State: AOAM530EcHnVxzvO3ccPOMI3zseCkhG9V67Z5X/FBc6FrMDD5BGxsNbK
 EvDZgYkdZ0Pkt6704KwVd6BBC2rMxSt47qbpUArAYg==
X-Google-Smtp-Source: ABdhPJyJfEqkYNVBsWrgqTcV7Zh53nyQLzXhWo/j6bLlxc7om+s4/DKgZBakiwapZA0DkF7wxdm0tRPIJzGu54TJQSc=
X-Received: by 2002:a05:600c:3486:: with SMTP id
 a6mr36297863wmq.32.1639392977775; 
 Mon, 13 Dec 2021 02:56:17 -0800 (PST)
MIME-Version: 1.0
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-12-peter.maydell@linaro.org>
 <6458979b-3162-570f-e5af-1f3baff70d04@linaro.org>
 <CAFEAcA-ZWwnyzoq6-D343dMN+8AZjke8ej+fp79g0bEZ+m6n0Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-ZWwnyzoq6-D343dMN+8AZjke8ej+fp79g0bEZ+m6n0Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Dec 2021 10:56:06 +0000
Message-ID: <CAFEAcA9LdfwphgD+dJL+rE7oLrRxCZu0x1roQZxf_F-g1n5hFw@mail.gmail.com>
Subject: Re: [PATCH 11/26] hw/intc/arm_gicv3_its: Use 1ULL when shifting by
 (DTE.SIZE + 1)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Dec 2021 at 09:48, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 12 Dec 2021 at 20:43, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 12/11/21 11:11 AM, Peter Maydell wrote:
> > >
> > >       if (dte_valid) {
> > > -        max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
> > > +        max_eventid = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
> >
> > Without changing the type of max_eventid, I think it'd be easiest to fix the off-by-one
> > bug by not changing the comparisions, but changing this computation.  E.g.
> >
> >    max_eventid = (2 << FIELD_EX64(dte, DTE, SIZE)) - 1;
> >
> > so that the value becomes UINT32_MAX for SIZE=31.
>
> I think I'd prefer to use a uint64_t. I think that part of the reason
> for all these off-by-one errors is a lack of consistency in how we
> chose to name variables and whether we put in them the max-allowed
> value or the 2^n value, so the series tries to standardize on
> "always call it num_thingy and always use the 2^n value". I prefer
> to keep the consistency rather than rearrange things in this
> one case so it can use a uint32_t.

Looking at the series, I'm going to squash this patch into the
later "Fix event ID bounds checks" patch, and do all the fixing
of the event ID check there in a single patch.

-- PMM

