Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E3E3397FB
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 21:07:40 +0100 (CET)
Received: from localhost ([::1]:45574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKo4R-0006S4-FD
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 15:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKo2a-0003IM-Vo
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 15:05:46 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKo2Y-00042T-To
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 15:05:44 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso16520442wma.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 12:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lHiXxKrOXqES31KBN3VXr0DiXuX91UTe70KzcpDBc4U=;
 b=oyb6Iys5qXII8+53l4F1L03Y0xwLr2Ii3I7VBCawflRI/w3rtfKa1xYdIGH0l5wIeB
 gGVdFk41puhgEF/fNaNf5CYxL24vm0DEAaG9V33HJxyGuTLDYdDt56rzzgeySH6FqCsq
 7pR2l2JUx3cVhrk1SYsXs88F4FjRb23N7nhsuLa01Mj4xZizDgHh/zwyBRxLoJI/XdYK
 a37eLr9T9VANJfHDd6/UdsRmzm1+tKGd2E6A2CH4jglrxp72OL68fl/fz2sRFoKXpu4B
 uJqXcf6Qnw5UD8urGu6P7JqFWwXmf65p0IlFcbPEE7+C3n5e+TTly3XihZ4pyhO2336P
 NOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lHiXxKrOXqES31KBN3VXr0DiXuX91UTe70KzcpDBc4U=;
 b=V6DlL+JyVIg5JyrumKPH5AQTQOX/3aYtb0JveVpW8wYIHKabtTuHfJspT3HN6od6pY
 rgXb8MuoKnSYSScu0CkIN6shIYqqVCQtV6FdfFbTLT1kHHWEj7uV/vlLfvQejZMxsp65
 refA2nvIyqEwFl/tOPWQZB7qSN/ExG86zFRiDbSgqf0FBakE4AmTV+VbU+jkVDEX+0Ak
 6UB7dm9wbtYoUn/Ffs7toJLFpuUOGuedH+5020GCowgONBsuoAWrkzd8YY4dzr7K2m/I
 WSA9b1tDcWMlJeqZSDgJCLZ//uVAYFNkIOuE2+2DDLQPEO2538/abjp31P4f6Ibo27xW
 MowQ==
X-Gm-Message-State: AOAM532+F6Es42vW69elQiRWlisbXruncwiZCBlQrZcuivP+aQXKyVE2
 QOAnuZPPkxEFvnObVNdJykc=
X-Google-Smtp-Source: ABdhPJxSx1nZlrOCBjngcouranD7zyZFxGnxmERnuvFwd0gCGuDkKwHGU4D9nfndeCMuRIplL/6UCA==
X-Received: by 2002:a1c:f702:: with SMTP id v2mr14235115wmh.131.1615579538028; 
 Fri, 12 Mar 2021 12:05:38 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u20sm10020957wru.6.2021.03.12.12.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 12:05:37 -0800 (PST)
Subject: Re: [RFC PATCH 32/42] docker: Add gentoo-mipsr5900el-cross image
To: Fredrik Noring <noring@nocrew.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-33-f4bug@amsat.org>
 <20210215115957.GG1542881@redhat.com> <YCp7Ce6ELbLFvRXZ@sx9>
 <ebbdecd9-e599-1a4b-60e8-3464afa4a20e@amsat.org>
 <21217ef4-91d8-6877-5d78-bb78e00773d8@amsat.org>
 <alpine.DEB.2.21.2103121741460.33195@angie.orcam.me.uk>
 <YEuxyF9l1LfBLptS@sx9>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <492ea51c-5061-a7e1-adb1-255ceaab19ff@amsat.org>
Date: Fri, 12 Mar 2021 21:05:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEuxyF9l1LfBLptS@sx9>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 7:24 PM, Fredrik Noring wrote:
> On Friday, 12 March 2021, Maciej W. Rozycki wrote:
>> On Fri, 12 Mar 2021, Philippe Mathieu-Daudé wrote:
>>
>>>>>> Is there any way we can do this with a distro that isn't Gentoo
>>>>>> so that we can get a container build that is fast enough to be
>>>>>> useful for CI ?
>>>
>>> Using the Debian cross image I get:
>>>
>>> /home/phil/source/qemu/tests/docker/docker.py --engine auto cc --cc
>>> mips64el-linux-gnuabi64-gcc -i qemu/debian-mips64el-cross -s
>>> /home/phil/source/qemu --   -Wall -Werror -O0 -g -fno-strict-aliasing
>>> -mabi=n32 -march=r5900
>>> /home/phil/source/qemu/tests/tcg/mips/test-r5900-dmult.c -o
>>> test-r5900-dmult  -static
>>> cc1: error: unsupported combination: -march=r5900 -mhard-float
>>> -mdouble-float
>>>
>>> No clue what is setting '-mhard-float -mdouble-float' yet.
>>
>>  The R5900 has an FPU that only supports the single floating-point format.  
>> It's also not an IEEE 754 format.  The Linux kernel ABI does support the 
>> double and also the single floating-point format, both compliant with IEEE 
>> 754.
>>
>>  In the absence of a suitable FPU emulation code included with the kernel 
>> will handle the missing instructions (you can use the `nofpu' kernel 
>> parameter to force that in the presence of an FPU too).  Beware however 
>> that a recent change to the Linux kernel made FPU emulation code optional 
>> to suit some deeply embedded applications known never to use FPU machine 
>> instructions.
>>
>>  NB the presence of emulation is always required for MIPS ISA compliance 
>> if FPU machine instructions are ever to be used in a given application, 
>> because operations are allowed to trap regardless and rely on emulation.
>>
>>  I don't know what you are trying to achieve,
> 
> I believe Philippe is trying to compile
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg04565.html
> 
> testing this:
> 
> 	The R5900 reports itself as MIPS III but does not implement DMULT.
> 	Verify that DMULT is emulated properly in user mode by multiplying
> 	two 64-bit numbers to produce a 128-bit number.
> 
> with this piece of code (notice the mips3 ISA directive for DMULT):
> 
> /*
>  * Test DMULT.
>  */
> 
> #include <stdio.h>
> #include <inttypes.h>
> #include <assert.h>
> 
> struct hi_lo { int64_t hi; uint64_t lo; };
> 
> static struct hi_lo dmult(int64_t rs, int64_t rt)
> {
>     int64_t hi;
>     uint64_t lo;
> 
>     /*
>      * The R5900 reports itself as MIPS III but does not implement DMULT.
>      * Verify that DMULT is emulated properly in user mode.
>      */
>     __asm__ __volatile__ (
>             "    .set  mips3\n"
>             "    dmult %2, %3\n"
>             "    mfhi  %0\n"
>             "    mflo  %1\n"
>             : "=r" (hi), "=r" (lo)
>             : "r" (rs), "r" (rt));
> 
>     return (struct hi_lo) { .hi = hi, .lo = lo };
> }
> 
> int main()
> {
>     /* Verify that multiplying two 64-bit numbers yields a 128-bit number. */
>     struct hi_lo r = dmult(2760727302517, 5665449960167);
> 
>     assert(r.hi == 847887);
>     assert(r.lo == 7893651516417804947);
> 
>     return 0;
> }
> 
>> but your two options to choose from are:
>>
>> 1. Build for the soft-float ABI (`-msoft-float') where any FP calculations 
>>    are compiled such as to be made by the CPU using integer arithmetic.
>>
>> 2. Build for a generic MIPS ISA, for the R5900/n32 that would be MIPS III
>>    (`-march=mips3'), and rely on the kernel FPU emulation.  Note that some 
>>    integer MIPS III operations are missing too from the R5900 and have to 
>>    be emulated by the kernel for MIPS/Linux n32 psABI compliance (an 
>>    implementation can be pinched from an old libgcc version that was still 
>>    under GNU GPLv2 or another algorithm reused, e.g. my `__div64_32' piece
>>    easily adapted).
> 
> So qemu/tests/tcg/mips/Makefile.target is patched with
> 
> # r5900 is only 64 bit little-endian
> ifneq ($(findstring 64el,$(TARGET_NAME)),)
> MIPS_TESTS += test-r5900-dmult
> test-r5900-dmult: CFLAGS += -mabi=n32 -march=r5900
> endif
> 
> I didn't have issues with the -mhard-float -mdouble-float flags at the time,
> and I didn't use mips64el-linux-gnuabi64-gcc for Debian.

Yes, this works with Gentoo. But building the Gentoo's r5900 toolchain
container is too expensive for our CI, so I was trying with Debian, but
with no luck so far.

I'll test the other image your suggested elsewhere and see if Daniel is
OK with it (I doubt because this is not an "official" image).

Thanks,

Phil.

