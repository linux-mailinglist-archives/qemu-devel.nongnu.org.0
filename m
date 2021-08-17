Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6643EEB34
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 12:48:48 +0200 (CEST)
Received: from localhost ([::1]:41298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFweF-00042u-58
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 06:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFwcn-00030r-Vj
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 06:47:22 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:39511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFwck-0000Yo-Ib
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 06:47:17 -0400
Received: by mail-ej1-x62e.google.com with SMTP id gr13so8633160ejb.6
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 03:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lCmMLF1B5PMUUlvFw+laXWpCMvWq314GNcH272VKiYk=;
 b=JrsTkG6+Vup36vTJfULoFdrxd8HQ6sPWq4cU8L9Pcz71eREwtLwF8+UBiDjUOZkyD3
 anWCBU2+6lmVaGedsa7G5K/LFXlsSmyfFLvpjSv53pwBKmkHERYxF4iRkLLTcZrytoBW
 liYl7mQwMdGoXmITuCEe+9aZ5muTxwdtFTMyjlEob+AgknGfb04HYbShxWkmfPmrzYYr
 CVXAJeEd50VGsbC5tVyMtG2sPU/6YuErT0+fa6HRT16jWGdUr6F0I0NsW1A5/SFaCGtU
 sOZlh10wd87Q610JUytFLii8DM8uAFlggTawlkbBoHJy2WjsLkuV9rkV7W27bldZMdGY
 pjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lCmMLF1B5PMUUlvFw+laXWpCMvWq314GNcH272VKiYk=;
 b=jGephkuwmG2I5iJIz2BHdw7oCAm5v2/vngbW2vR0dI/61a2RVsTT5P9TvnZ8qs0+wY
 0XCMclM7zeaTy8nyDzSYod7XoDbjSBDuOtUBOgc8BO+ZcCOFLc+ShFmEbG4gKrlfJJbB
 hRV3KtvGkGRlsAB/+R1bkj+fc4a/rbenZb7Q/yhyd4lbyON6HFJojR/cTPA2EydxW01S
 wx+E2bDgBLG8SCIqvpRZcNQqSUChDTbykDtWwUtRC3G3ih4jrNnBQMEmGxCxYK3ZRihW
 3dsGtdedXj+jpxChU+Os0qpBxDC8vyqSVygESYMBqU2/CZamllW56fTjG1BlGMaSDv0c
 UR/w==
X-Gm-Message-State: AOAM5303t4/FwaJfJ22CW6KH5tCUxH3lM3suXXeTIkjfAYIae74Lic2z
 NpZtzplXNMquto9kgTwbHrvohImDaN4CtuFi1dNBPA==
X-Google-Smtp-Source: ABdhPJyBBpr8YKomDqO+TSvmV/6pU5tM74qPragtPmDG8KFjYCLKcy2Dl2U9hdTCDdSjXe0zmLahX82rb3RI96v+UxE=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr3205778ejb.382.1629197231874; 
 Tue, 17 Aug 2021 03:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
 <37605028-f1c7-93d7-ce51-dc78f4ed8d8b@greensocs.com>
In-Reply-To: <37605028-f1c7-93d7-ce51-dc78f4ed8d8b@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Aug 2021 11:46:25 +0100
Message-ID: <CAFEAcA9eU8h586eiK9dy_Jy7aDaeQzLC901SYf68FCi_LC+6GA@mail.gmail.com>
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Luc Michel <luc@lmichel.fr>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Aug 2021 at 10:59, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
>
>
> On 8/12/21 11:33 AM, Peter Maydell wrote:

> > +void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
> > +{
> > +    assert(divider != 0);
> > +
> > +    clk->multiplier = multiplier;
> > +    clk->divider = divider;
> > +}
> > +
> >  static void clock_initfn(Object *obj)
> >  {
> >      Clock *clk = CLOCK(obj);
> >
> > +    clk->multiplier = 1;
> > +    clk->divider = 1;
> > +
> >      QLIST_INIT(&clk->children);
> >  }
> >
> >
>
> Regarding migration, you made the vmstate_muldiv subsection optional. I
> suppose it is to keep backward migration working in case of simple
> mul=1,div=1 clocks.

Yes -- we only send the subsection if the mul,div are
something other than 1,1; an inbound migration stream without
the subsection then means "use 1,1".

> Do we need to ensure multiplier and divider fields are set to 1 upon
> receiving a state if the vmstate_muldiv subsection is absent ? I
> remember there are post_load() tricks to achieve that.

I was relying on "we set the default in clock_initfn()" (by analogy
with being able to assume that fields in device state are at their
reset values when an inbound migration happens, so if the migration
doesn't set them then they stay at those reset values). But
thinking about it a bit more I think you're right and we do have to
have a pre_load function to set them to 1. Otherwise we would get
wrong the case where a board/SoC/device sets a clock up on reset
to have a non-1 multiplier, and then later the guest programs it to
be 1, and then we migrate like that. (That is, the mul/div at point
of migration will be the value-on-reset as set by the device etc
code that created the clock, which might be different from what
clock_initfn() set it to.)

So we need to add something like

static int clock_pre_load(void *opaque)
{
    Clock *clk = opaque;
    /*
     * The initial out-of-reset settings of the Clock might have been
     * configured by the device to be different from what we set
     * in clock_initfn(), so we must here set the default values to
     * be used if they are not in the inbound migration state.
     */
    clk->multiplier = 1;
    clk->divider = 1;
}

thanks
-- PMM

