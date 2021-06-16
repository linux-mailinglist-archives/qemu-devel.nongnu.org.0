Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7278A3A9B38
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:55:26 +0200 (CEST)
Received: from localhost ([::1]:34784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltV4n-0004ct-HF
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltV2d-0002ZH-Pw
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:53:15 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltV2b-0004Mr-PU
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:53:11 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v9so2572809wrx.6
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=W77zzLALpuzV0AFvF7H70elaSPr0uezE3MJjn299tOc=;
 b=Y62oT8iMilys2jUbfTtXYUAAmED7LJyTwHusiQYIPR7nPh1Gxv3ILjzSivNBbp9RIo
 wK9pOkkq1UvfkKA6rxMK10SwvrxMUDjkUsXPQVsmScf+wUc3jmzuH1rDczBaOMTAlNjp
 ToT0gRWZQgMWJLLi8XGPdvi0lZ6C1nkepbs9hNPC3TwXYPp3m42aoy+Dt1prLUOrw70D
 GV6yzVwlFs1GgcDPQCbyebfxquSc1cfMZUNp8rka0qbkL1UCEKeHDn9d9W66BetVkTRK
 wtDEqWYQxgXSIFpVDkh+I1P9mi8K+gY/H20wuaumKMIO+7YgyyCZddziexPKNUf5tHHu
 40nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=W77zzLALpuzV0AFvF7H70elaSPr0uezE3MJjn299tOc=;
 b=o+XLBKG3tCf1Fik/QFIJrnkdrBNQP38L1YF8KK0DPyW6bhSzmAZTolARDZG7ujnPbz
 43tafKYwFn+y/sP0/+LKy+vIkotST8habU7Ub4YUHzch7kg2/D+JUqV8RnCPGX3Y+MWO
 hUg710ToO1aDQ8Ru986n4XNV21HYJYCDeLQhSKAqYNiJ86VcS864kCId0EG3zRtmeCdW
 QDiVI7sdrwsCgLyNurDoMxk0/aCExdeuf+PEv7yWmEfwuAtR2168kYFcErbqlOkxbSl/
 B2+aZeG8RUeYSZp/2aRfdp5clbW/t0CK4TGuGhw8KmES4WE/c28aRh/JlO5BQg+1nyhY
 n3ew==
X-Gm-Message-State: AOAM531TtTrUAPsvC9HajwnL5St98FJ6oll8MzlZuAXFv8/2nls9bzqY
 DL8LefoN7QJNvZJVGiz1i+7m1g==
X-Google-Smtp-Source: ABdhPJxdBo9/vwA05sBXeK0VFgbCWRSsOeogkRbmIe1HnjMvsvVmBQuOtCh8MkkOgw1QrLDpXvwh3A==
X-Received: by 2002:a5d:47a6:: with SMTP id 6mr5198075wrb.203.1623847984575;
 Wed, 16 Jun 2021 05:53:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n9sm1812919wmc.20.2021.06.16.05.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 05:53:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 00E4D1FF7E;
 Wed, 16 Jun 2021 13:53:00 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: tb_flush() calls causing long Windows XP boot times
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
 <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
 <1ee4b7cf-d445-6497-705f-510009fc74f8@ilande.co.uk>
 <874ke4iqf8.fsf@linaro.org>
 <3D29C466-BB81-4BCA-96E9-A46721B1ED59@gmail.com>
 <d9109542-dd68-3e8b-4f53-a09576e16b1f@redhat.com>
 <87sg1ogsvj.fsf@linaro.org>
 <f81315ce-6cf5-c0c4-5b48-9188e3dcd71a@ilande.co.uk>
 <878s3cjyvl.fsf@linaro.org>
 <4006E151-B420-4925-A6C9-CD036EE559F2@gmail.com>
 <9d0b277d-415f-0f4e-3f09-03445f89848f@linaro.org>
 <e809eeed-c635-c48c-c6b6-9c2d5718b60d@ilande.co.uk>
Date: Wed, 16 Jun 2021 13:53:00 +0100
In-Reply-To: <e809eeed-c635-c48c-c6b6-9c2d5718b60d@ilande.co.uk> (Mark
 Cave-Ayland's message of "Wed, 16 Jun 2021 09:59:14 +0100")
Message-ID: <874kdygedv.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 incoming+qemu-project-qemu-11167699-3xhw7c0pviow7og92yv73e0tr-issue-404@incoming.gitlab.com,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU devel list <qemu-devel@nongnu.org>,
 Programmingkid <programmingkidx@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 16/06/2021 02:58, Richard Henderson wrote:
>
>> On 6/15/21 6:58 AM, Programmingkid wrote:
>>>> Ahh I misread - so those are the addresses of the routines and not whe=
re
>>>> it's sticking the breakpoint?
>>>>
>>>> I notice from a bit of googling that there is a boot debugger. I wonder
>>>> if /nodebug in boot.ini stops this behaviour?
>>>>
>>>>   https://docs.microsoft.com/en-us/troubleshoot/windows-server/perform=
ance/switch-options-for-boot-files
>>>> -- Alex Benn=C3=A9e
>>>
>>> Hi Alex,
>>>
>>> I tried your suggestion of using /nodebug. It did not stop the
>>> tb_flush() function from being called.
>> We are not expecting zero calls to tb_flush (it is used for other
>> things, including buffer full), but we are hoping that it reduces
>> the frequency of the calls.
>> I'm guessing you didn't immediately see the slowdown vanish, and so
>> there was no change to the frequency of the calls.
>> FWIW, if you switch to the qemu console, you can see how many
>> flushes have occurred with "info jit".
>
> Looking at the diff of b55f54bc96 which first introduced the
> regression, presumably the difference is now that everything is being
> flushed rather than a specific address space when WinXP twiddles with
> the DB7 register:
>
>
> diff --git a/exec.c b/exec.c
> index 67e520d18e..7f4074f95e 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -1019,14 +1019,13 @@ void tb_invalidate_phys_addr(AddressSpace *as,
> hwaddr addr, MemTxAttrs attrs)
>
>  static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
>  {
> -    MemTxAttrs attrs;
> -    hwaddr phys =3D cpu_get_phys_page_attrs_debug(cpu, pc, &attrs);
> -    int asidx =3D cpu_asidx_from_attrs(cpu, attrs);
> -    if (phys !=3D -1) {
> -        /* Locks grabbed by tb_invalidate_phys_addr */
> -        tb_invalidate_phys_addr(cpu->cpu_ases[asidx].as,
> -                                phys | (pc & ~TARGET_PAGE_MASK), attrs);
> -    }
> +    /*
> +     * There may not be a virtual to physical translation for the pc
> +     * right now, but there may exist cached TB for this pc.
> +     * Flush the whole TB cache to force re-translation of such TBs.
> +     * This is heavyweight, but we're debugging anyway.
> +     */
> +    tb_flush(cpu);
>  }
>  #endif
>
>
> Unfortunately my x86-fu isn't really enough to understand what the
> solution should be in this case.

It's not really an x86 issue here but that we don't have any easy way of
finding the subset of TranslationBlock's that might be affected. We can
only query the QHT for a head address + flags. Meanwhile when there is
an active mapping we go through the page tables=20


>
>
> ATB,
>
> Mark.
>
>

--=20
Alex Benn=C3=A9e

