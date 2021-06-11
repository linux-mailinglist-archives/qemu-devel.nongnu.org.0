Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6078D3A415D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:38:43 +0200 (CEST)
Received: from localhost ([::1]:41964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrfUn-0001nJ-Uh
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrfTl-00017s-JH
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:37:37 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrfSh-0001q4-Ix
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:37:37 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 k5-20020a05600c1c85b02901affeec3ef8so8516061wms.0
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 04:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=mnMrurC5fB6V70nSJHRCMgd4Fn9WirQVU9gxMeUUaww=;
 b=Y/ROyd45c9pW+ZX4mIb04J8wuBM0S/aEkY7tYt/Q7ZrOBQ8hK1X8oERJkn2VjP4ArY
 z0NmSM9Gm2BP8EmJdWWye8usN4HdpULTQvRK99qcNs2ekYNWAIobqJzfPJcwEt49ErQc
 PXkUYzTv3xJfcocv7/VPpJB4XH9P5nllULq26E4Vmcpsfcno3z3c2DBn2TO8H9tfE7JP
 P0veO1jpsCPv8qJ0rUuoJijvUHzNtTCZD8pPNaV2VuT9f6TIdyfTdssj7bvuC+ssh/uw
 EEZiAPWJz/vM8jjxFcqiPId15KEW3Wunw4FTbnCgoiFa91/uwRpriwKQl349hggZYW0A
 qZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=mnMrurC5fB6V70nSJHRCMgd4Fn9WirQVU9gxMeUUaww=;
 b=R+FVVk3GGHrek0Feu+Zj53D/qoECWhA2df76Z4dZQYiLZG7P1b9T6R/Q+pc67/kelT
 7+EBsDck3yAU3u2WOeZpdkleHU4U32NmDr2ZQAMes6EGyZyyWPHH1QbwBQ7aSc4GKHYJ
 nSzRKcUfu8baLmt1IHvHNDyr0ScdB4Bml+jsAIBJ5LqFgDXel2nfMNRJhZSeSpzrY6In
 pKOTMHWYVwxoBLIKFm2hJmhfjT7FF2colayINcqjfLahIzVHd51voFG+A8a0I0jz+ks2
 hakSIcyIalT+1/13HC2LqPJFNyVLwR+lN25tAggaRAo4elwsLn+WTGYf4qvO5rxT/ND/
 abcw==
X-Gm-Message-State: AOAM5301qUikGg0zFXsMvvdQJ7fUm1lp6K8RGjR6svgVvcCnbUgk1N+/
 Wi2jo12r7lXgJ7bNGcGEPboCUg==
X-Google-Smtp-Source: ABdhPJypBtt5QXUD7zVf3Kp5kqP+ZJOHXJyGqVnl10yyRBu9l7WyBggrDFseKbhj/QcuSCoSVT08aw==
X-Received: by 2002:a05:600c:282:: with SMTP id
 2mr20052286wmk.98.1623411389568; 
 Fri, 11 Jun 2021 04:36:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h9sm12811631wmm.33.2021.06.11.04.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 04:36:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CE85F1FF7E;
 Fri, 11 Jun 2021 12:36:27 +0100 (BST)
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
 <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
 <1ee4b7cf-d445-6497-705f-510009fc74f8@ilande.co.uk>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: tb_flush() calls causing long Windows XP boot times
Date: Fri, 11 Jun 2021 12:24:49 +0100
In-reply-to: <1ee4b7cf-d445-6497-705f-510009fc74f8@ilande.co.uk>
Message-ID: <874ke4iqf8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 10/06/2021 14:14, Peter Maydell wrote:
>
>> On Thu, 10 Jun 2021 at 14:02, Programmingkid <programmingkidx@gmail.com>=
 wrote:
>>>
>>> Hi Richard,
>>>
>>> There is a function called breakpoint_invalidate() in cpu.c that
>>> calls a function called tb_flush(). I have determined that this
>>> call is being made over 200,000 times when Windows XP boots.
>>> Disabling this function makes Windows XP boot way faster than
>>> before. The time went down from around 3 minutes to 20 seconds when
>>> I applied the patch below.
>>>
>>> After I applied the patch I ran several tests in my VM's to see if anyt=
hing broke. I could not find any problems. Here is the list my VM's I teste=
d:
>>>
>>> Mac OS 10.8 in qemu-system-x86_64
>>> Windows 7 in qemu-system-x86_64
>>> Windows XP in qemu-system-i386
>>> Mac OS 10.4 in qemu-system-ppc
>>>
>>> I would be happy if the patch below was accepted but I would like to kn=
ow your thoughts.
>>=20
>>>   cpu.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/cpu.c b/cpu.c
>>> index bfbe5a66f9..297c2e4281 100644
>>> --- a/cpu.c
>>> +++ b/cpu.c
>>> @@ -253,7 +253,7 @@ static void breakpoint_invalidate(CPUState *cpu, ta=
rget_ulong pc)
>>>        * Flush the whole TB cache to force re-translation of such TBs.
>>>        * This is heavyweight, but we're debugging anyway.
>>>        */
>>> -    tb_flush(cpu);
>>> +    /* tb_flush(cpu); */
>>>   }
>>>   #endif
>> The patch is clearly wrong -- this function is called when a CPU
>> breakpoint
>> is added or removed, and we *must* drop generated code which either
>> (a) includes code to take the breakpoint exception and now should not
>> or (b) doesn't include code to take the breakpoint exception and now sho=
uld.
>> Otherwise we will incorrectly take/not take a breakpoint exception when
>> that stale code is executed.
>> As the comment notes, the assumption is that we won't be adding and
>> removing breakpoints except when we're debugging and therefore
>> performance is not critical. Windows XP is clearly doing something
>> we weren't expecting, so we should ideally have a look at whether
>> we can be a bit more efficient about not throwing the whole TB
>> cache away.
>
> FWIW this was reported a while back on Launchpad as
> https://bugs.launchpad.net/qemu/+bug/1883593 where the performance
> regression was traced back to:
>
> commit b55f54bc965607c45b5010a107a792ba333ba654
> Author: Max Filippov <jcmvbkbc@gmail.com>
> Date:   Wed Nov 27 14:06:01 2019 -0800
>
>     exec: flush CPU TB cache in breakpoint_invalidate
>
>     When a breakpoint is inserted at location for which there's currently=
 no
>     virtual to physical translation no action is taken on CPU TB cache. I=
f a
>     TB for that virtual address already exists but is not visible ATM the
>     breakpoint won't be hit next time an instruction at that address will=
 be
>     executed.
>
>     Flush entire CPU TB cache in breakpoint_invalidate to force
>     re-translation of all TBs for the breakpoint address.
>
>     This change fixes the following scenario:
>     - linux user application is running
>     - a breakpoint is inserted from QEMU gdbstub for a user address that =
is
>       not currently present in the target CPU TLB
>     - an instruction at that address is executed, but the external debugg=
er
>       doesn't get control.
>
>     Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>     Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>     Message-Id: <20191127220602.10827-2-jcmvbkbc@gmail.com>
>     Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

This was a reversion of a reversion (see 406bc339b0 and a9353fe89). So
we've bounced between solutions several times. Fundamentally if it gets
tricky to ensure your translated state matches the actual machine state
the easiest option is to throw everything away and start again.

> Perhaps Windows XP is constantly executing some kind of breakpoint
> instruction or updating some CPU debug registers during boot?

It would be useful to identify what exactly is triggering the changes
here. If it's old fashioned breakpoint instructions being inserted into
memory we will need to ensure our invalidating of old translations is
rock solid. If we are updating our internal breakpoint/watchpoint
tracking as a result of the guest messing with debug registers maybe we
can do something a bit more finessed?

>
>
> ATB,
>
> Mark.


--=20
Alex Benn=C3=A9e

