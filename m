Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01DF196131
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 23:34:20 +0100 (CET)
Received: from localhost ([::1]:47822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHxYR-0000qb-Fc
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 18:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52176)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHxXQ-0000QV-2o
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 18:33:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHxXO-00067R-S6
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 18:33:15 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41180)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHxXO-00066m-NW
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 18:33:14 -0400
Received: by mail-ot1-x344.google.com with SMTP id f52so11484355otf.8
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 15:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4eAKYD0xCGJojNcb3z2roCaPyydWumjGnBIhUYfJpNQ=;
 b=h17IXFxqe6IsfQJeWWqr/4X7uLtg8aN5EI0q/oAkBWNvj2wVRWPA5/1AEGlenf8+f7
 6nH9bRF43yHMC4iHhO5L3e5GoFc6ZXjecKq8QzgI+1H28Hj+H0JaVTLH2TGB4Y37fTOT
 MZW9WRWqXHIn4oCja5h7bxrXDIwE6Qk1l4SuxfXnxlnoTuzOOUTPvJTS1/tTPAJfkoqE
 AYFS37qLkSh2nMd/4DdiIcro4yJeEpoJ451iiWaTl5uec7grdV6e7KX3lV9OwMJnNQc7
 lmxnonyFXQeVaRlW6T6ZUE163fhrBvRvBNElde1y/ISo0Mz/u3Ep2wzCzqY94zjf72pZ
 /50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4eAKYD0xCGJojNcb3z2roCaPyydWumjGnBIhUYfJpNQ=;
 b=r+AWgOdAmSutfQIFaAwKzyq8AROBrhYCrVX2HZS00eR35vJGZuXRZclLRjV+/0khyy
 ls0X3Y1dQNefMHASp8kRghxd10WKnZloHjjFx3W0IQYNeXY5faNZHX3NZKxH5Xoyoqu2
 +7nJJp+0rKJev56gAu+ShbeaEQ0odAq9kX/Xx+8diU7T7xvI/RDk+y8U8CUxSTi2D2Zl
 GpFj9g7oMYVJNeijKSHi5WQ2Ib/LL27ngrmvpKa8Lf51SqtFnmitpOxHo4flwHOjV0B5
 NrXDQ9W48FIEoSPDKGn3EdV6TyfnznOMC2EopQq3ntBjABrg3V2FgfCA+UpIyjjzku/l
 tcnA==
X-Gm-Message-State: ANhLgQ12D3DWeRkNXEDt6ZvKqSDNNDTHZcBeo5IuXxm2r5Yeb1v/shOD
 6ycmrAJ633Ur5OPM3mP/ZQRF2Q9jPA/WvU1jmc2F+w==
X-Google-Smtp-Source: ADFU+vu7biuQm1GtvjrYseiztRkW2ZYtMnPra47qKF7XJRNFIqilYmMIHO0OM+KPvJQV3Bjkfv8w6qbRGQXPy18e9HA=
X-Received: by 2002:a05:6830:18f4:: with SMTP id
 d20mr755676otf.91.1585348393520; 
 Fri, 27 Mar 2020 15:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200327094945.23768-1-alex.bennee@linaro.org>
 <20200327094945.23768-6-alex.bennee@linaro.org>
 <CAFEAcA8RvbdHMWCe101CyTWcA7T28-MtYwMFNZ5Fnh2=SuKcDw@mail.gmail.com>
 <91caa195-fe72-d533-1da2-4bbdeccb4e38@linaro.org>
In-Reply-To: <91caa195-fe72-d533-1da2-4bbdeccb4e38@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Mar 2020 22:33:02 +0000
Message-ID: <CAFEAcA9f4VtrWfmHGL=1WMMwGNHPV8Jc0XBQgPRyFCi5Lu1+KA@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] fpu/softfloat: avoid undefined behaviour when
 normalising empty sigs
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Mar 2020 at 22:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
> I wonder if I have the energy to petition the committee to drop, for C202? all
> of the "undefined" nonsense that only applies to sign-magnitute and
> ones-compliment computers, which haven't been seen since the 70's...

There was certainly a proposal to do that (I think from a Google
engineer) for C++, I forget whether the equivalent C change has
also been proposed.

> > That said, is it valid for this function to be called with a zero
> > aSig value ? I think all these normalizeFloat*Subnormal() functions
> > assume non-zero sig input, and the only callsite where it's not clearly
> > obvious that this is obvious that the sig input is non-zero is the call to
> > normalizeFloatx80Subnormal() from addFloatx80Sigs(). So perhaps we
> > just need to check and fix that callsite ??
>
> You're right -- addFloatx80Sigs is the only use out of 26 that doesn't have a
> preceding check for 0.

Mmm. My vote is for fixing addFloatx80Sigs -- now we just need
to figure out what the desired behaviour is.

thanks
-- PMM

