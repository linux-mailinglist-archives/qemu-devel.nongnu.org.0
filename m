Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5AC19BD5B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 10:12:25 +0200 (CEST)
Received: from localhost ([::1]:34896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJuxa-0000vD-P1
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 04:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35124)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jJuwg-0000UJ-Ae
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 04:11:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jJuwe-00014a-7q
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 04:11:26 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:38233)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jJuwe-00014L-2b
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 04:11:24 -0400
Received: by mail-ot1-x32f.google.com with SMTP id t28so2537531ott.5
 for <qemu-devel@nongnu.org>; Thu, 02 Apr 2020 01:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jl03zAfBRyS/zPhFBaUaBjIcAVffVlpYdy56/V1aR6M=;
 b=r7zn8nQB9vQD2yQV3Lx644IVO839l452l91mvRXbRHifGrrmD1h9GPh7xkUOZL/dV3
 wLDVl5e9EIu1GZgDjO0YrGEqRbaVzaOWTxZcRRTPCSxnJuB+8FNbmj/99Q3Pwzzkvzic
 3h3dw4lh18I+OcoUFkFV24oAu0KJ4ynEGJvcJO+B8AVnYK22CEydN/mDcNNtuJFwJ7uj
 Y6RIOiflGUz/GemY6Y3sU9HiT/kdieAB8NX4Nai+wmbPaodGGbZQ4ZTR2gFPe06TgRaP
 kARdhHTwhvRgcn8iJCocQmtLQ/WTx9DFviqRsohp+Yz1tQn0SpqKmoL/RS2yHR8mi4+W
 GOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jl03zAfBRyS/zPhFBaUaBjIcAVffVlpYdy56/V1aR6M=;
 b=SGazHCT39Q9K8jzNZxbnkp+mH1HNThvGcQM2xwjCvl1SlZLRYtjyESdFNzv3OYAfb6
 bsuwjAhrNOHVFBB2do+RWj3Zh2RX6dYIC8aJncJp03WereUbuinjbTMGPKv5CMubThGS
 5+MzwQXkMFyM9RxV+CawlPkkfrgRTfQ5T+JEHz77J7ilTGOxdcnf48SzEn7u0XXGZrFJ
 VvyJII+A1HOV+ZI/6pj1g1i4IIut6tfSyFrYZ7uxulwpeFc+r1ZuWE/O+DfJVztvqmKm
 SxcIp9cRJAgNyz34YClRvmYTyHaxr39cbT3ljYN4RN96moxmbVVOXr+DEp5z7bTxwNOL
 2rNw==
X-Gm-Message-State: AGi0Pub4m+zOrzv2SDqP1xyBac3JLOnWkxHHiNS26gXTG3aBUlB7PHYx
 YcWFHhqA4evP42YCCvfQgHSmKzS0CCdHEgLyT9p3Tw==
X-Google-Smtp-Source: APiQypLCAv0fjSg5jw2eCj4cXSFHg4J3FqfP1sswQP7lraaxASgiIitouXOVjaitru7sYCFkRPYCgqTNsRzjR44JCVc=
X-Received: by 2002:a9d:1920:: with SMTP id j32mr1346868ota.221.1585815082632; 
 Thu, 02 Apr 2020 01:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <87o8sblgto.fsf@dusky.pond.sub.org>
 <CAFEAcA_b1gZ-B4NaEdQS2zffdvobW=FUx4ysEgXVAz+=cZ+R3Q@mail.gmail.com>
 <87sghmbfgc.fsf@dusky.pond.sub.org>
 <44b5ff2c-6dce-e516-a9cc-9d80354c5a72@virtuozzo.com>
In-Reply-To: <44b5ff2c-6dce-e516-a9cc-9d80354c5a72@virtuozzo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Apr 2020 08:11:11 +0000
Message-ID: <CAFEAcA_cmOkR4YsDmP7mDdKzs0jTu3WDO=d1uvMxHguvZjGW_g@mail.gmail.com>
Subject: Re: Questionable aspects of QEMU Error's design
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32f
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Apr 2020 at 07:11, Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
> Somehow, in general, especially with long function names and long parameter lists I prefer
>
> ret = func(..);
> if (ret < 0) {
>      return ret;
> }

Personally I prefer the other approach -- this one has an extra line
in the source and
needs an extra local variable.

> Are you sure that adding a lot of boolean functions is a good idea? I somehow feel better with more usual int functions with -errno on failure.
>
> Bool is a good return value for functions which are boolean by nature: checks, is something correspond to some criteria. But for reporting an error I'd prefer -errno.

When would we want to return an errno? I thought the whole point of the
Error* was that that was where information about the error was returned.
If all your callsites are just going to do "if (ret < 0) { ... } then having
the functions pick an errno value to return is just extra work.

thanks
-- PMM

