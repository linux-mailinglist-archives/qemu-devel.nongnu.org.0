Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F873A2BB3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:34:22 +0200 (CEST)
Received: from localhost ([::1]:56938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJt7-0006d8-Bu
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrJrf-0005PP-SB
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 08:32:51 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:44907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrJra-0004yK-N5
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 08:32:51 -0400
Received: by mail-ed1-x534.google.com with SMTP id u24so32790063edy.11
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 05:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RvfFP/BczbmzpuVw0oueB8mLaRoeRu4Cc1i/lKczi3A=;
 b=ZKsYbLTnlaQjiNaYSXp+zZPEU32Y1eq9BzcSvWSnLqLOUJjLjMMEwNGJ9s/I9iNaNh
 ADywhmKX8ApPSaJ6CPq0b3ni+MLUHrZMN32xjsMFm/JMGTq8yeLPH1Fg0I8agctbcRDW
 3iQfWDoGVew/sBobHTqWGPzQ+T96m2CYvX1F6o7e+uplq2x7+mPSRYupVbfERDkBUJoC
 cuLRTRcCnqyvsmQx/Uomo8inu2bsg5DyNk7hZnp+NkXSTHHyU0Vsnuh/Yvl2pmpNpJNx
 POuS/1eQqpRal+BE0z+2QWr+f56aw2uo37WGo7Nvte91vp7sPwnewUm29OfPpFm4p/vn
 W7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RvfFP/BczbmzpuVw0oueB8mLaRoeRu4Cc1i/lKczi3A=;
 b=mn6wU5qV03oLP8XZVbATbykSUhCpWDTjI+P4rONCySF5UmK5iw0Dmt0Ubl4f/Wag86
 AqQHq5JAPoNZ9QFy0/QXK7bVIrFmQtJ7T0N+Z7bHgJoCYYd/l5T5HHoQ4KmXCCMFqRuR
 zI2VOrjXAfW9xoKK1XdFJPpdmEn3/dg+1ei66I0PNpWERnodeElEB2fnCLrAPo9pTkSu
 7QuNEDVJC8gyLvp+s0x4c9QMv66hJF1PPNFwneK/Vwg2rCGUJu7XHnhIUstUOXzMChBR
 INaZeQxZvA1d4GYxh76Sjlo6Q2Z/tl7Rd/rT2bmCNjsIllSk7zx0DHkOSyrUc+7ox6DF
 8k1w==
X-Gm-Message-State: AOAM533EqDvQ7tsmNXqRxWnT1p9eQYUGsD2Kdkm2ys3Umxxy6il6bD+s
 w2Nh264VfD/A2hpTPq6O7RRBsrCsUnfLdbLxdXbMcA==
X-Google-Smtp-Source: ABdhPJw8EiuP7AhmmNbjRn9g5+KoIamu/yP3ds8ERfGpbSWBFvJaNp9qpQl5iTQhQcRt9QGKrugG/zi7VUMQ0SX4r2Q=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr4420113edt.100.1623328364783; 
 Thu, 10 Jun 2021 05:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210610102617.17281-1-alex.bennee@linaro.org>
In-Reply-To: <20210610102617.17281-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 13:32:11 +0100
Message-ID: <CAFEAcA9yhRS_=zr+76HdDN=iYU=ghDjLPfSaFUA9fzmJ5p3vCA@mail.gmail.com>
Subject: Re: [PATCH v2] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Thu, 10 Jun 2021 at 11:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The previous numbers were a guess at best. While we could extract the
> information from a loaded ELF file via -kernel we could still get
> tripped up by self decompressing or relocating code. Besides sane
> library code like newlib will fall back to known symbols to determine
> of the location of the heap. We can still report the limits though as
> we are reasonably confident that busting out of RAM would be a bad
> thing for either stack or heap.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Andrew Strauss <astrauss11@gmail.com>
> Reviewed-by: Andrew Strauss <astrauss11@gmail.com>
> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>
> ---
> v2
>   - report some known information (limits)
>   - reword the commit message
> ---
>  semihosting/arm-compat-semi.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.=
c
> index 1c29146dcf..8873486e8c 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -1202,10 +1202,14 @@ target_ulong do_common_semihosting(CPUState *cs)
>              retvals[3] =3D 0; /* Stack limit.  */
>  #else
>              limit =3D current_machine->ram_size;
> -            /* TODO: Make this use the limit of the loaded application. =
 */
> -            retvals[0] =3D rambase + limit / 2;
> -            retvals[1] =3D rambase + limit;
> -            retvals[2] =3D rambase + limit; /* Stack base */
> +            /*
> +             * Reporting 0 indicates we couldn't calculate the real
> +             * values which should force most software to fall back to
> +             * using information it has.
> +             */
> +            retvals[0] =3D 0; /* Heap Base */
> +            retvals[1] =3D rambase + limit; /* Heap Limit */
> +            retvals[2] =3D 0; /* Stack base */
>              retvals[3] =3D rambase; /* Stack limit.  */
>  #endif

I'm told that the Arm C compiler C library always assumes that
the "stack base" value is what it should set SP to, so reporting 0
for that will break binaries that were built with it.

As the TODO comment notes, the "heap base" is a bit of a guess,
but putting stackbase at top-of-RAM seems generally sensible.

What bug are we trying to fix here?

I think one possible implementation that might not be too
hard to make work would be:

 (1) find the guest physical address of the main machine
     RAM (machine->ram). You can do this with flatview_for_each_range()
     similar to what rom_ptr_for_as() does. (It might be mapped
     more than once, we could just pick the first one.)
 (2) find the largest contiguous extent of that RAM which
     is not covered by a ROM blob, by iterating through the
     ROM blob data. (This sounds like one of those slightly
     irritating but entirely tractable algorithms questions :-))
 (3) report the lowest address of that extent as the heap base
     and the stack limit, and the highest address as the heap
     limit and the stack base.

This would work for all guest architectures and remove the need
for that Arm-specific code...

-- PMM

