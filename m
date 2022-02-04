Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3974A9AE9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 15:28:05 +0100 (CET)
Received: from localhost ([::1]:37220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFzZD-0003QA-Qy
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 09:28:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFzDC-0007LC-S5
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 09:05:19 -0500
Received: from [2a00:1450:4864:20::436] (port=41692
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFzCd-0004sN-Al
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 09:05:17 -0500
Received: by mail-wr1-x436.google.com with SMTP id j16so11471243wrd.8
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 06:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yf0NU0innF4Y8QrLwFBIEAlblHbbWNvvstCMX0rUJPo=;
 b=Ot6WHHPfvKXQrTkan2EJKJ6GmLgW3CbPSabmkaUxg4jylfxK3lGrnKZOJALg2127Mi
 cbNBIloJA4Pp9hP/YRjJwQy2L9UB6hkQcCIxTXOrDfHUFlQh8r/HoWuIMBmS2UrhKGcN
 mW66IBkaHF/Cxzp/wwdEt42uo/ZXicbVlWf3/M/gbJK6Av8KiCstEhE0Vg4y3fzFSnDU
 j6FNJ+F/bcxca7sMz+7Q4UgF9UxOkBu0kFprhL/q12MtFXuoILtJIZOzQzWD10uxc/S/
 cm9sAir31X8y7zXRSqZ2T5tijIcvZJVMo/WTL8J8NlAyShYn2kdilOlXNKektwAL/JP8
 MBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yf0NU0innF4Y8QrLwFBIEAlblHbbWNvvstCMX0rUJPo=;
 b=zOZgFGMoOvuDDJ07mPpyqGnPL23F8qQP9wZSXGHGunQw6sSO99Izrun3j79LHzz2j3
 m/SpGFMuqHQnIsOMW5e7wdoa7PvOWT/vvfXbWIF0MhZ5vFDuVP4giQf46a38brhs0BMm
 5YmO19tDom65w2HCaq3IH9MjHL3uezauZ3AXoo7r5I2Wk2Nht79b1/UFKhtazClWWlj7
 5HRK94a6em3kmeTpXQHbalRWdFId53GZPYL+lOKyYqH47svTh4sR7huK7ozuIly3bptD
 3rX1effd2TPv9xj0s5bHYq/yC64QPdg8BMzzFp1yp3Y9n3YrWiz37R1u2Em1Fv9tJE5I
 tJmA==
X-Gm-Message-State: AOAM531b8IvBrnPQ6Hw6zw74zKSujwRZJGDJ/c7myMkMQcYFNNBKrVwa
 uqhLJbhjGO0vQeChu8wO5oC86deTSDMNK8B7GaKZCQ==
X-Google-Smtp-Source: ABdhPJyYWfME5/uKQnjDk4/HmEy0DFNiggSDZKXlb/2t/AtFUPcv7PrRGfebQMb2zsbesjYa5sRKaaK18lKWCydNdpE=
X-Received: by 2002:a5d:448b:: with SMTP id j11mr2711681wrq.172.1643983414289; 
 Fri, 04 Feb 2022 06:03:34 -0800 (PST)
MIME-Version: 1.0
References: <20220203155304.2648009-1-valentinghita@google.com>
 <87tudfsv80.fsf@linaro.org>
 <CAKddhtYyZrEFveatS-o1YORdrUa-o53fBe3kwo9RVjXB2ovpyw@mail.gmail.com>
 <87czk3rnfl.fsf@linaro.org>
 <CAFEAcA9y1F5X1BQOwzbJgJKPYvroHFM7ivSUOE-07d3S-GE7DA@mail.gmail.com>
 <878ruqst2a.fsf@linaro.org>
In-Reply-To: <878ruqst2a.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Feb 2022 14:03:23 +0000
Message-ID: <CAFEAcA-Ypai8S1JG_HpG-4PugMGxc+ReGj-QRhW7ip7LkfcBgg@mail.gmail.com>
Subject: Re: [PATCH] armv7m_nvic: set DHCSR.DEBUGEN when debugger is attached
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Valentin Ghita <valentinghita@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Feb 2022 at 12:41, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 4 Feb 2022 at 09:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >> Assuming you are happy for the device to act as though a external
> >> debugger is attached regardless of the gdbstub state you could use a C=
PU
> >> property on the command line to enable this behaviour. We have some
> >> examples for SVE for the 64 bit CPUs (see object_property_add for
> >> sve-max-vq). So something like:
> >>
> >>   -cpu cortex-m3,dhscr=3Dtrue
> >>
> >> You would probably want to model the behaviour of DHSCR.C_HALT as well
> >> because that is something the core might do to itself if it detects it
> >> is running under debug.
> >
> > This is sounding pretty hacky to me. I think we should either have
> > a proper implementation of all of halting debug (probably opt-in,
> > with the default being that the gdbstub is transparent to the guest),
>
> So we could flip it and make it a property of gdbstub with transparency
> being the default. Then any architecture that wanted to have this
> behaviour could query the stub if enabled.

I don't particularly mind how we expose it to the user. But I
do think that we should either not implement this architectural
feature at all or we should implement it properly. "Just this
one tiny part that happens to be the bit this one user wanted"
isn't a long-term sensible place to land IMHO.

> > or we should just say that no, this isn't something we support,
> > and if you want gdb to get control when a particular bit of code
> > is executed then you should set a breakpoint there.
>
> It's a fairly niche use case but I don't see why we shouldn't assuming
> someone is willing to write the code. However I suspect there is quite a
> wide range of potential behaviours to model.
>
> > We don't even implement the guest-visible debug parts of the
> > architecture (eg architected single-step) yet, incidentally.
>
> Is this just for Aarch32? Because for Aarch64 as far as I'm aware the
> v8.0 debug works fine modulo bugs which I sent a fix for:

This is M-profile specifically. It has guest-controllable
single-step but the mechanism is (as usual with M-profile)
completely different from the A-profile equivalent.

-- PMM

