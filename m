Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DEA3AEB12
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:20:50 +0200 (CEST)
Received: from localhost ([::1]:57906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKnB-0004P3-1g
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKiM-0007Q4-TC
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:15:53 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:41732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKiK-0004M7-RT
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:15:50 -0400
Received: by mail-ed1-x529.google.com with SMTP id n20so19175995edv.8
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 07:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AN40/MW6qzKAKIXTUYqjSTZvf3mW7m6B2xNBLT3K+2A=;
 b=e2jmDQbH3uDhTrYfhxPR5M8/4CMmj8XfSYlxPLjMSlNn5snXuloi31+u8Z8RJplMSi
 1izvSCPbWrkeEMmBqr9j1vqAX/Ke6MX0c2lJerQfyin/t66H5tK/40GouDnbAfSM8Fli
 GV/m+yIIkKlm+tPD5N95GkJZ/DXY6jlzbOcij9UuJvXi1JMuYFrmdK+XamgWGoeOKGJQ
 QtUjmFiRrp23x4r4p6VFWGn7QL9qH2ptN4ay06UkZO4lvfPaBL/7MxcLlETciebIEOOU
 A1IYk0/Oa7KqW9m/SP+YcVPjmHyr4A9Bt6YcI2FaGJdiPV5Bz88VMN7lzDQjLpAyS2fi
 4+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AN40/MW6qzKAKIXTUYqjSTZvf3mW7m6B2xNBLT3K+2A=;
 b=Kb5tNmWoSSyuKiHvWbpI9miVGB2l5cmJ/K2G+PW2CWcJ3TEA035XxPoEKG8K7tkwB3
 23O7O3vPDf6PWRSsBWkjQJm1ZToTMgg/sYxh3knLkZWMJ8kisI/b4GQw5qWa6VoJhplY
 pRGnid9KHEBgWf8ybhsJUCpDgMxHwzR/rwmB7hLbdwYRitjqPcc7whx95mB4GGntieTm
 W83DGryq34aP+rr8ToOFi9PvBIIYc4ExDp3tpUVTu68De14PyJ+Qyz7jwPw6cvx9A12r
 ZPQxc+Z4wsAHtGKoes5H5lAsLqSoCWCXXCK48a6McFa6dQANU6N9yzZQzXHmbs/YP3aG
 nBVg==
X-Gm-Message-State: AOAM531xZBVuqaoGoiJ8JplYpMXp2vY2fCOsSvhP8HpZyUS8AgzgO0h+
 UEpDMGhgN3GXov/V/zSu3+WEH8UIV+CVyYOAGGCPug==
X-Google-Smtp-Source: ABdhPJzsACuKSJc7YrSEEP/4Ys8oSL9OI/MPDazEB9FoC+86+H1aXbOB9IV/oc9sn6gewhHx419IXsNsnGM+VxKX7V4=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr21456945edt.100.1624284947011; 
 Mon, 21 Jun 2021 07:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-2-richard.henderson@linaro.org>
 <CAFEAcA9ktX0famPUabJ3J_nhBp7CHOzd7S_auHEML7kPi9Yysw@mail.gmail.com>
 <CAFEAcA9Rg9O7n24Jpee3BxyE35e5z+a7m8CiQqJqeJ9hNffYjQ@mail.gmail.com>
 <d7906e8d-2db4-88fd-0755-af433fae808a@linaro.org>
In-Reply-To: <d7906e8d-2db4-88fd-0755-af433fae808a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 15:15:11 +0100
Message-ID: <CAFEAcA_8T8U8NG0mTRvzic_cnG5O+Yd6t9Nmc0TkNv2G_QKPTg@mail.gmail.com>
Subject: Re: [PATCH 01/28] tcg: Add flags argument to bswap opcodes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Jun 2021 at 15:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/21/21 6:51 AM, Peter Maydell wrote:
> > On Mon, 21 Jun 2021 at 14:41, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>
> >> On Mon, 14 Jun 2021 at 09:43, Richard Henderson
> >> <richard.henderson@linaro.org> wrote:
> >>>
> >>> This will eventually simplify front-end usage, and will allow
> >>> backends to unset TCG_TARGET_HAS_MEMORY_BSWAP without loss of
> >>> optimization.
> >>>
> >>> The argument is added during expansion, not currently exposed
> >>> to the front end translators.  Non-zero values are not yet
> >>> supported by any backends.
> >>
> >> Here we say non-zero values are not yet supported by the backend...
> >
> > Looking at the tcg/README docs, I think what you mean is that
> > at the moment all the backends assume/require that the caller passes
> > one of TCG_BSWAP_IZ or (TCG_BSWAP_IZ | TCG_BSWAP_OZ), since the
> > pre-flags implementation requires the top bytes to be zero and leaves
> > them that way.
>
> Correct.
>
> > But then the parts of your patch that pass in a zero
> > flags word would be wrong...
>
> The parts that pass in a zero flags word are covered by, from the README:
>
> > The flags are ignored -- the argument is present
> > for consistency with the smaller bswaps.

Ah, I see. If you fix up the commit message, maybe something like

# The argument is added during expansion, not currently exposed
# to the front end translators. The backends currently only support
# a flags value of either TCG_BSWAP_IZ, or (TCG_BSWAP_IZ | TCG_BSWAP_OZ),
# since they all require zero top bytes and leave them that way.
# At the existing callsites we pass in (TCG_BSWAP_IZ | TCG_BSWAP_OZ),
# except for the flags-ignored cases of a 32-bit swap of a 32-bit
# value and or a 64-bit swap of a 64-bit value, where we pass 0.

then

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

It would be nice to document the actual flag values/names in
the user-facing documentation, too.

thanks
-- PMM

