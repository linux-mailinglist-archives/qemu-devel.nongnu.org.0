Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E850C3A2DE0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:17:23 +0200 (CEST)
Received: from localhost ([::1]:48630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLUp-0003lc-1Z
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrLTZ-00024d-2k
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:16:05 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrLTW-0006DY-AH
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:16:04 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso6546673wmj.2
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=f1PF3smb405Je7l4QcaSefbCJHzb4zaUPfYyXtdRXjg=;
 b=OW3B1tkNA0EluH7R2JtWNXqqye/eqd0SMrNYXS9OeYnhKiD9O1NuWrGsYKW23CtA6t
 hm9/2tTyoxmSraIXZrMDWoR0VnRlfgOfxO48E4GblfPXR2IxjdUlClMzh1SoCRl0p0/B
 HBJP/Ef+FT9AWjqC+Qq9o+f3VGPvjLb12bp1tOqPvUVFql3lgvA4+wUytDkldUaka2w8
 CmyHC4Qi0e81jG2dNnfZi2XJkwSkwr9Kpsgtg2orOYuq0U1IbcyoUf2U908EdnMFMOWd
 aaH6dRhjbSsoJgB1jvS4FR1pWwVLzUZULFvlfr3daWTw8gLN7MvjyI56Y/7JN8pc0yq7
 a8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=f1PF3smb405Je7l4QcaSefbCJHzb4zaUPfYyXtdRXjg=;
 b=BlP4S+RI5lm+iX5M0McxJBHAp6LFpUuFeIdNBN11P1rXC1NviXu2wNlyClhO58Jl/n
 0NXJWsbCZWlJGY8MTyPaTvTff1I0w4T3kway4DTEK8phklJUq0iSTGR5ZhZkZ3G123ol
 t8cIH1D7kiY9G9San3ijAQDxr036qnR+uPaQ56k9e1WlVep4/2vSIFGXgTmLyMYts7X9
 QFXTIR0QM1bUShpFomDrU6PNIYLVfUkhkwSbM0ILkdM0L8d6MTPHi1oZmou++biDwU+N
 kp3XC+x4zpPsftMtNhpQmEBUaex5N2FSZCHSRqlutzXZojFHoAi8660TUbLWGFuwNFQ8
 A+Rw==
X-Gm-Message-State: AOAM531TWUPbRvrQAsuegyv5d18O/0vp4cZr5ssoTQ99pXZdj9/FfAeB
 fk8N1a6CgFFdm55VaoZsI9C7rw==
X-Google-Smtp-Source: ABdhPJzu/IKA8DtfaIZ7OUWTpMf1WARWjlprrrgbRJTeOHWHgsrCzhS7fMmKLG4amLzp3UCFU4HySA==
X-Received: by 2002:a1c:f60f:: with SMTP id w15mr15349817wmc.5.1623334560389; 
 Thu, 10 Jun 2021 07:16:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g205sm9977602wme.6.2021.06.10.07.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 07:15:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC3EF1FF7E;
 Thu, 10 Jun 2021 15:15:58 +0100 (BST)
References: <20210610102617.17281-1-alex.bennee@linaro.org>
 <CAFEAcA9yhRS_=zr+76HdDN=iYU=ghDjLPfSaFUA9fzmJ5p3vCA@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
Date: Thu, 10 Jun 2021 15:12:21 +0100
In-reply-to: <CAFEAcA9yhRS_=zr+76HdDN=iYU=ghDjLPfSaFUA9fzmJ5p3vCA@mail.gmail.com>
Message-ID: <87im2liz4x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrew Strauss <astrauss11@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 10 Jun 2021 at 11:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The previous numbers were a guess at best. While we could extract the
>> information from a loaded ELF file via -kernel we could still get
>> tripped up by self decompressing or relocating code. Besides sane
>> library code like newlib will fall back to known symbols to determine
>> of the location of the heap. We can still report the limits though as
>> we are reasonably confident that busting out of RAM would be a bad
>> thing for either stack or heap.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Tested-by: Andrew Strauss <astrauss11@gmail.com>
>> Reviewed-by: Andrew Strauss <astrauss11@gmail.com>
>> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>>
>> ---
>> v2
>>   - report some known information (limits)
>>   - reword the commit message
>> ---
>>  semihosting/arm-compat-semi.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi=
.c
>> index 1c29146dcf..8873486e8c 100644
>> --- a/semihosting/arm-compat-semi.c
>> +++ b/semihosting/arm-compat-semi.c
>> @@ -1202,10 +1202,14 @@ target_ulong do_common_semihosting(CPUState *cs)
>>              retvals[3] =3D 0; /* Stack limit.  */
>>  #else
>>              limit =3D current_machine->ram_size;
>> -            /* TODO: Make this use the limit of the loaded application.=
  */
>> -            retvals[0] =3D rambase + limit / 2;
>> -            retvals[1] =3D rambase + limit;
>> -            retvals[2] =3D rambase + limit; /* Stack base */
>> +            /*
>> +             * Reporting 0 indicates we couldn't calculate the real
>> +             * values which should force most software to fall back to
>> +             * using information it has.
>> +             */
>> +            retvals[0] =3D 0; /* Heap Base */
>> +            retvals[1] =3D rambase + limit; /* Heap Limit */
>> +            retvals[2] =3D 0; /* Stack base */
>>              retvals[3] =3D rambase; /* Stack limit.  */
>>  #endif
>
> I'm told that the Arm C compiler C library always assumes that
> the "stack base" value is what it should set SP to, so reporting 0
> for that will break binaries that were built with it.
>
> As the TODO comment notes, the "heap base" is a bit of a guess,
> but putting stackbase at top-of-RAM seems generally sensible.
>
> What bug are we trying to fix here?

Having newlib use a value that's wrong and therefor plant it's heap in
the middle of the loaded code.

> I think one possible implementation that might not be too
> hard to make work would be:
>
>  (1) find the guest physical address of the main machine
>      RAM (machine->ram). You can do this with flatview_for_each_range()
>      similar to what rom_ptr_for_as() does. (It might be mapped
>      more than once, we could just pick the first one.)

Currently this is done by common_semi_find_region_base which pokes
around get_system_memory()->subregions to find a region containing an
initialised register pointer.

>  (2) find the largest contiguous extent of that RAM which
>      is not covered by a ROM blob, by iterating through the
>      ROM blob data. (This sounds like one of those slightly
>      irritating but entirely tractable algorithms questions :-))

Does that assume that any rom blob (so anything from -kernel, -pflash or
-generic-loader?) will have also included space for guest data and bss?

>  (3) report the lowest address of that extent as the heap base
>      and the stack limit, and the highest address as the heap
>      limit and the stack base.
>
> This would work for all guest architectures and remove the need
> for that Arm-specific code...
>
> -- PMM


--=20
Alex Benn=C3=A9e

