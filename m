Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306C63A592C
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 17:01:02 +0200 (CEST)
Received: from localhost ([::1]:55606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsRbg-0000Xz-PK
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 11:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsRaK-00086w-3H
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 10:59:36 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:37548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsRaH-00063v-1W
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 10:59:35 -0400
Received: by mail-ed1-x52a.google.com with SMTP id b11so43096295edy.4
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XjLbT5u3oKhPCm2UyhPCyfvMV4Fd/Q8rCkoQ2pdglOw=;
 b=wXf8STEbpcI3MTmRsJ6f6FmiLfQf6v7dPpwC8A0OAiaRLNR6pkh5dnv0Xpoqp+Q2xx
 3CIliCq0lQ/AH7Q1Jyitq0ixYxApn1qQ1EwmC9y048UEdMiulUEyFyb+ZYgLnyeSJtgI
 vFG37Qh0c0vjZfAlECd490ngBND0PiwochrVXa5Vlg6mOv0ySKJZLNDHZXFvYoOOli6C
 025zoFE5tAC8UkPAzX7VfGZkhQhX7MufSB3GU3mtVGDcmr2wYl0+PkE2eqIEiMWxa2zV
 QZko7yPIeTLLxdqQMgF9nUBeNp5RqCjOxnj+/ScDOkNoz2s8VGCWnVP4C6RTaFduY7/1
 OiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XjLbT5u3oKhPCm2UyhPCyfvMV4Fd/Q8rCkoQ2pdglOw=;
 b=lBQR95EE+6JkoGQlzbgBXEMMNQc9VgSX6KsHYIeqHAAXOamM++Cvzgpg+0n+yPGoR0
 71DCzD+7/c5c0apfJS6w37kZPhE+FtXd3ycyToSNhckd9S8ciuejJb9vBmgtgEuNmHhL
 HjTxsGrYdmxEwEN/IfaUYrRy2U7vzX8UVm+C/Y8ZrqUQJ/NYQertz2ft+0fvIsxBe/Tl
 2quUMBtW3CHE7h4Ns/UtmO2HnHP8CFM1lCUojJQolXp51Apfgyg4Qavcn3OZSR4QWUoL
 YLt76DfiSF9OtvQ4jwaVM2TnmJ6MwySJqwPsOwWmvYJkd4LCfUiV4TopB/HD/66UHqI4
 QLWg==
X-Gm-Message-State: AOAM5332PKrUgNUDWqxE2Vkx1zAr4iDyyuVAOqZCDlCOXdWf8iWlpedO
 wXWVG6b8xXmBGJhtMuiUAnQPOajcQ2CckI4FfrCvng==
X-Google-Smtp-Source: ABdhPJzsqoCe5DznGFaE+trE3byJyruSJjdz67n7UprU2z3D0d/+Bhmr3Wr1CNav1m+mifXzd0R6bmUU88qiket3XME=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr12867098edt.100.1623596370327; 
 Sun, 13 Jun 2021 07:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210610102617.17281-1-alex.bennee@linaro.org>
 <CAFEAcA9yhRS_=zr+76HdDN=iYU=ghDjLPfSaFUA9fzmJ5p3vCA@mail.gmail.com>
 <87im2liz4x.fsf@linaro.org>
 <CAFEAcA9NYv1GdA+2P_7hbqgBwRTv6JFgfp1mS_PzURY-aafkeA@mail.gmail.com>
 <87y2bggwqd.fsf@linaro.org>
In-Reply-To: <87y2bggwqd.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 13 Jun 2021 15:58:56 +0100
Message-ID: <CAFEAcA_NPtRT1YdcyuRYpa8bDuWTt53a0-QyJz8CEb4FnAXsgg@mail.gmail.com>
Subject: Re: [PATCH v2] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrew Strauss <astrauss11@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Jun 2021 at 18:03, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 10 Jun 2021 at 15:16, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >>
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >> >  (2) find the largest contiguous extent of that RAM which
> >> >      is not covered by a ROM blob, by iterating through the
> >> >      ROM blob data. (This sounds like one of those slightly
> >> >      irritating but entirely tractable algorithms questions :-))
> >>
> >> Does that assume that any rom blob (so anything from -kernel, -pflash =
or
> >> -generic-loader?) will have also included space for guest data and bss=
?
> >
> > Yes; the elf loader code creates rom blobs whose rom->romsize
> > covers both initialized data from the ELF file and space to
> > be zeroed.
>
> Hmm I'm not seeing the RAM get bifurcated by the loader. The flatview
> only has one RAM block in my test case and it covers the whole of RAM.

I dunno what you're tracing here, but rom blobs do not affect
the MemoryRegion setup (which can be rom, ram,the romd "writes
go to callbacks, reads are host memory" hybrid, or whatever).
ROM blobs are just a list of "write this data into memory at
this address", which gets iterated through on reset to write
the data into the RAM/ROM/whatever.

-- PMM

