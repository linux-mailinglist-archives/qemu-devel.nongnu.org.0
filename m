Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35A63BAC7C
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 11:32:11 +0200 (CEST)
Received: from localhost ([::1]:56338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzyTy-00077r-Qv
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 05:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzySn-0006TO-G7
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 05:30:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzySl-0000Kw-VY
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 05:30:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id f14so17877718wrs.6
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 02:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VW9Kz9vdVtXU+ta66zfbpXI2OI+hxqV4fBzfRKNeuSA=;
 b=qWk74YTfAz9p7IvkUe9qebrvC3unT5zEkEc7rUq9AAwq+PH8+TUyicEerom7sS8Hlc
 lZVrrOGZlK4J21q1RfwKFzAR7jJt3C3wb2dPydr66/quWLHoCjmgqN/owPw684CiQ3WS
 geFuAzFp6eUcT3XjsT7j8vSb8tD0J4vYhL7ibOFt/NDGBotCGTAC2Cr4+OA+Yl3IF+bD
 VCkcRRkfCyfABYuw3N7IgL76FM4YhOqBeOyKv7oDDHU1tys3dfFpaS/gPRpKQkBTW8TO
 ZYhrQnXqCOITYUk4gEArIW0bj5kBlg9QHfB9IzuKwyCoSIFWCSzXHFnGYRB+Mf/gopHJ
 iphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VW9Kz9vdVtXU+ta66zfbpXI2OI+hxqV4fBzfRKNeuSA=;
 b=dFMuPo8+1mR6PE8lkBfe4BObiMEGd3LcT3xXMBhStzfBszwFE6H1Wu2SPSmusfjxSN
 S9CFwQ0iOLsVbjEJea5uaEPzwIWTjkAgwvsbdsyuKsMujJeWQQoXFjhYyHxAJMSWNYTL
 6zlCgm/sNfzMPTmY7TGyKGWpw8mxsnPvCdQXiF8KLRVekndVWIt2qvhX1kZQsrxGJyh1
 0jxvoC09sQKnVWm2lxxpp4l3thxHoZhfb2qIxN8jRlMD5MjqXmjj903qOTZqW1LHd3IS
 0VwWHySu/2r0ZCmEcA171H7KggnCq64JPi4tx59P76E2//3+lTWJUzKnCzRfRFX81/tc
 9t7Q==
X-Gm-Message-State: AOAM533I5IBuwPv/qRiC+RdVq49ccNTnlbB/WAX3F8GZBeTGK/EQi015
 nKpYw7LUU9SB0YgkkEbEEeU=
X-Google-Smtp-Source: ABdhPJxyinC3yG5sJZI9NZXbqUWLsvlpmBbvfN54DDN8+7ulqH/8WAHjt1UdytA7+39XB4p5i50RgQ==
X-Received: by 2002:a5d:554e:: with SMTP id g14mr9411831wrw.48.1625391054418; 
 Sun, 04 Jul 2021 02:30:54 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m17sm9526077wrr.6.2021.07.04.02.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 02:30:53 -0700 (PDT)
Subject: Re: [PATCH 1/2] Fix for Haiku
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Richard Zak <richard.j.zak@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAOakUfOhn43BUUGoJPahxmxxTk8vcPeyrgsX0GDmzt46ZriNeA@mail.gmail.com>
 <CAFEAcA-rhL_BEJMi7a2tCoVE61OV2o5QeDdDfz1JXL9fLvM_cQ@mail.gmail.com>
 <CAOakUfNpv_7TE+86R0+Ng=10mXtx2=pyZUZG8jPDgOdLbqrqKQ@mail.gmail.com>
 <5c47cf07-f02e-f7d8-2725-5ae0a240e37b@amsat.org>
 <975f0d41-be4e-7e8c-2fc6-64eafc7c11a8@amsat.org>
Message-ID: <951cdc26-1f4f-68d0-0187-e31513fa00c9@amsat.org>
Date: Sun, 4 Jul 2021 11:30:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <975f0d41-be4e-7e8c-2fc6-64eafc7c11a8@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/21 11:27 AM, Philippe Mathieu-Daudé wrote:
> On 7/4/21 11:03 AM, Philippe Mathieu-Daudé wrote:
>> On 7/4/21 12:06 AM, Richard Zak wrote:
>>> For MIPS (all sub-targets, 64-bit and EL) & xtensa(eb), the compiler
>>> complains about running out of memory. Best I can see, that's not what
>>> actually happens, but that's the error message. I was going to
>>> investigate this later, but this was the error which was causing the
>>> test with the Haiku VM with that corresponding make target. My desktop &
>>> laptop have 64 GB, and I'm pretty sure it didn't get to that point.
>>>
>>>
> /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
>>> final link failed: memory exhausted
> 
>> See how Haiku handles POSIX errno:
>>
>> https://github.com/haiku/haiku/blob/master/headers/os/support/Errors.h
>>
>> #define B_GENERAL_ERROR_BASE   INT_MIN
>>
>> #define B_POSIX_ERROR_BASE     (B_GENERAL_ERROR_BASE + 0x7000)
>>
>> #define B_POSIX_ENOMEM  B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 0)
>> #define E2BIG           B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 1)
>> #define ECHILD          B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 2)
>> ...
>>
> 
> Same problem with Xtensa:
> 
> static uint32_t errno_h2g(int host_errno)
> {
>     static const uint32_t guest_errno[] = {
>         [EPERM]         = TARGET_EPERM,
>         [ENOENT]        = TARGET_ENOENT,
>         [ESRCH]         = TARGET_ESRCH,
>         [EINTR]         = TARGET_EINTR,
>         [EIO]           = TARGET_EIO,
>         [ENXIO]         = TARGET_ENXIO,
>         [E2BIG]         = TARGET_E2BIG,
>         [ENOEXEC]       = TARGET_ENOEXEC,
> ...

Annoyingly enough this is also how linux-user/syscall.c does
(thinking about code re-use):

/*
 * This list is the union of errno values overridden in asm-<arch>/errno.h
 * minus the errnos that are not actually generic to all archs.
 */
static uint16_t host_to_target_errno_table[ERRNO_TABLE_SIZE] = {
    [EAGAIN]		= TARGET_EAGAIN,
    [EIDRM]		= TARGET_EIDRM,
    [ECHRNG]		= TARGET_ECHRNG,
    [EL2NSYNC]		= TARGET_EL2NSYNC,
    [EL3HLT]		= TARGET_EL3HLT,
    [EL3RST]		= TARGET_EL3RST,
...

