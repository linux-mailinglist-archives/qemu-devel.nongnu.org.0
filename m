Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B383337A82
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:12:03 +0100 (CET)
Received: from localhost ([::1]:48782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOqw-0006lo-CB
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:12:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKOhv-0005dX-34
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:02:43 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:44948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKOhm-0002Ij-Kg
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:02:42 -0500
Received: by mail-ej1-x635.google.com with SMTP id ox4so32062926ejb.11
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 09:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=boV5bAFWRlNeOWTRrUVrjfQz/GzZqixgUhKAHedJyL0=;
 b=kF8ab1mlBrK+ylVpMCqH7wAfwZzH6txqSv7kbZb+P6MpNk6LG4Qm5hCxBwxJLsjDUG
 7kSgbUepYDilYSokj8S9F3dEGfDHP9wvzFcTjUHNKFJ8E8R433gDTZF5w2ZuKXYYF8Ho
 tFMd20gnL8ZEKAniZp6kBer27HiVBxtkwUeGeT0I3B3uyU5Usdgwb3ysDRtiTm/loUT2
 v9Xo23DjOier7818RFh2FZMtLmTkFPTyBD9ieSPjTi/t6DrenrIkDzMsF0i5/2xLbLar
 hRrS3GzTwGvy3pCe/VYW6HedGmpBI1SyeVmuRyXmJnU00omvBGxWtX00HD+l0qozZyZ2
 61fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=boV5bAFWRlNeOWTRrUVrjfQz/GzZqixgUhKAHedJyL0=;
 b=S7gcFkTxTFUoRDfxWThjtdlgiuYwdTD7GxJDnagyiAldOwbS1QTGM8fPFWe2Y9u40n
 OW1hqAvK/DWWdTyCE1OesWEPrJ5/VLZ9yjmEbFKbTo5/PAEpHRgTUdqLF/JOLSWzBubl
 I1k2U1dEtQz53mi2+v8cJSTajWoycflnKNOPBg1+sePNyWF3Ur4ASqXihlsrQdA7kaFA
 w9CkNk4u55y6tTJvYvhL1TO8lsXSlmK59UxkvxN8bJOwq9UTeILpxJKN/a0akIRMf8cr
 RsOz1CjmpHtF2FwI3Y9+HjGk1bFXOD1Os8vm3p9aie/c6IreuBa8Lg2GzZiWJp6o+qhL
 hfBg==
X-Gm-Message-State: AOAM530/vbYHV3kiv8pDR/GbpWoLuUYGuTRvCugBk1K1FCsspXDS5QXF
 jQuNPJb7zba1D7jcQUFu64IHhgkQwdShjf0s/E7uRQ==
X-Google-Smtp-Source: ABdhPJwExtmDbIclQ3jwYkD3qjl/wVYl4WJJFaSKgPerxZVuu+WRykWXE+6GMcPOItSoz7O/nov2WgtVpEhXh2xFswM=
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr3974573ejb.407.1615482148073; 
 Thu, 11 Mar 2021 09:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
 <20210303174849.GF1664@vanye>
 <CAFEAcA-KFF_An50h8JKy68_Y3J4j=kQCOFyGoySKyh53E7KGYg@mail.gmail.com>
 <20210304135304.GI1664@vanye>
 <CAFEAcA8OsnjfyZUEVB=mmwftVnF2-bBv4da-_gqjaetoBiK3dQ@mail.gmail.com>
 <20210304152512.GJ1664@vanye>
In-Reply-To: <20210304152512.GJ1664@vanye>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 17:02:09 +0000
Message-ID: <CAFEAcA_Wu3nQ1vLa6YhCfLmPfaGHYkyuw90RU5sa8mBs6me=sw@mail.gmail.com>
Subject: Re: [PATCH] arm: bump amount of PMU counters to pass SBSA ACS
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Mar 2021 at 15:25, Leif Lindholm <leif@nuviainc.com> wrote:
>
> On Thu, Mar 04, 2021 at 15:14:36 +0000, Peter Maydell wrote:
> > On Thu, 4 Mar 2021 at 13:53, Leif Lindholm <leif@nuviainc.com> wrote:
> > >
> > > On Wed, Mar 03, 2021 at 18:06:46 +0000, Peter Maydell wrote:
> > > > On Wed, 3 Mar 2021 at 17:48, Leif Lindholm <leif@nuviainc.com> wrote:
> > > > > It would be good if we could get 6.0 closer to SBSA compliance.
> > > >
> > > > How far away are we at the moment ?
> > > >
> > > > > Would it be worth the effort to make this controllable per cpu model?
> > > >
> > > > I don't have a strong opinion on whether we should, but if we do then the
> > > > right way to implement that would be to have the PMCR reset value
> > > > as a reset_pmcr_el0 field in struct ARMCPU (like the existing reset_fpsid,
> > > > reset_sctlr, etc) that gets set per-CPU to whatever the CPU's value for
> > > > it is; and then instead of using a PMCR_NUM_COUNTERS value,
> > > > extract the PMCR.N field when needed. The hardest part would be
> > > > going through all the CPU TRMs to find out the correct reset value.
> > >
> > > That makes sense.

> I'll throw this on my never-shrinking pile of things I hope to get
> around to at some point.

I just sent a patch that does it that way, though it is desperately
in need of more testing. I'm currently on the fence about whether to
put this patch or that one in for 6.0.

thanks
-- PMM

