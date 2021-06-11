Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11BD3A449D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 17:02:55 +0200 (CEST)
Received: from localhost ([::1]:46206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrigQ-0003fh-NN
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 11:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lrifG-0002XY-88
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 11:01:42 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:42998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lrifD-0000vs-Sa
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 11:01:41 -0400
Received: by mail-qv1-xf35.google.com with SMTP id c10so13920363qvo.9
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=jxOxikdgq4yXQTJ//+jAjIxmO0fkGR1yfaChykW0xv8=;
 b=lZKGFUcX5o2fIeAiMPVlilXkE82ZsqUu8Ix4EaFwherV3Zzas4eRYpPivB1JKr7SIN
 Jtot4Vvt6mhI4Nl+Z0B2Kd3hVOf+hHaimmw4XgYP0GtvmBVYTVyA9jVrKtPz1Y2EmEhL
 DHg2C8sPxIHhtNf4AVhGeCN/DzYbsIc4MDe5BrfTpbLLhbxeUW8z7iNWst1F1oR78diO
 V+m1oLQJg4S04SzhgetYAwmT4c6QIcT4GzSiLcMmWmGOgKpKGepCLXTvgccVV7j3kqIc
 NLOwYRpfmWCvjWy01vRHNJN6QqsB+J8L/NDX8QYVgiwkqCgdznSbdBIb6rs2vTxllliS
 pneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=jxOxikdgq4yXQTJ//+jAjIxmO0fkGR1yfaChykW0xv8=;
 b=LjjCotKDs+mtWGlT8PAB1ZSvBaDNfuOBHN2tDXVPAzvIiAtWRlXaBIozhBysuvkoQr
 GQQ575X+SZ+8XhbuhEE1TqAyalH3xterqgcUpqnYBo2ixMu1rjUoJr2tmdJbIc+Vg3j3
 OSuLyg5mvNY/lWHTl7Z94yruKUDfaeoaYlkei0E6lLhpDS7Vpoqoa5fAklA9boReTgWY
 creMVD6JFTBYiQ4IGAA0kr/uY+rXaTPQYWd44LRF0KsfWK2L72wxbYFGpci7M9dViFpt
 jHA4cePf3W5gg2qgZDvx9bmEWlpIfQjAHXTQgdqHGhCe7Y5hJZd1x8u5w3emmwuCMY07
 TDrg==
X-Gm-Message-State: AOAM5310/0sPkghRkFhwZ5Dd9A1AUvOPzvG4WuP8GgiGvNXGcmeHdBJV
 ++7atB3gkEvJ22SGK+Ty02I=
X-Google-Smtp-Source: ABdhPJwH0A/BinHBiJR9BGp+VO14APPDN7mYwOMPh4CrOwwX3qslFABMirGozjgOqmNHCQd+xIhQCw==
X-Received: by 2002:a05:6214:1628:: with SMTP id
 e8mr3390859qvw.30.1623423697806; 
 Fri, 11 Jun 2021 08:01:37 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id k19sm4586484qkj.89.2021.06.11.08.01.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Jun 2021 08:01:37 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: tb_flush() calls causing long Windows XP boot times
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <874ke4iqf8.fsf@linaro.org>
Date: Fri, 11 Jun 2021 11:01:35 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <3D29C466-BB81-4BCA-96E9-A46721B1ED59@gmail.com>
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
 <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
 <1ee4b7cf-d445-6497-705f-510009fc74f8@ilande.co.uk>
 <874ke4iqf8.fsf@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jun 11, 2021, at 7:24 AM, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>=20
>=20
> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
>=20
>> On 10/06/2021 14:14, Peter Maydell wrote:
>>=20
>>> On Thu, 10 Jun 2021 at 14:02, Programmingkid =
<programmingkidx@gmail.com> wrote:
>>>>=20
>>>> Hi Richard,
>>>>=20
>>>> There is a function called breakpoint_invalidate() in cpu.c that
>>>> calls a function called tb_flush(). I have determined that this
>>>> call is being made over 200,000 times when Windows XP boots.
>>>> Disabling this function makes Windows XP boot way faster than
>>>> before. The time went down from around 3 minutes to 20 seconds when
>>>> I applied the patch below.
>>>>=20
>>>> After I applied the patch I ran several tests in my VM's to see if =
anything broke. I could not find any problems. Here is the list my VM's =
I tested:
>>>>=20
>>>> Mac OS 10.8 in qemu-system-x86_64
>>>> Windows 7 in qemu-system-x86_64
>>>> Windows XP in qemu-system-i386
>>>> Mac OS 10.4 in qemu-system-ppc
>>>>=20
>>>> I would be happy if the patch below was accepted but I would like =
to know your thoughts.
>>>=20
>>>>  cpu.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>=20
>>>> diff --git a/cpu.c b/cpu.c
>>>> index bfbe5a66f9..297c2e4281 100644
>>>> --- a/cpu.c
>>>> +++ b/cpu.c
>>>> @@ -253,7 +253,7 @@ static void breakpoint_invalidate(CPUState =
*cpu, target_ulong pc)
>>>>       * Flush the whole TB cache to force re-translation of such =
TBs.
>>>>       * This is heavyweight, but we're debugging anyway.
>>>>       */
>>>> -    tb_flush(cpu);
>>>> +    /* tb_flush(cpu); */
>>>>  }
>>>>  #endif
>>> The patch is clearly wrong -- this function is called when a CPU
>>> breakpoint
>>> is added or removed, and we *must* drop generated code which either
>>> (a) includes code to take the breakpoint exception and now should =
not
>>> or (b) doesn't include code to take the breakpoint exception and now =
should.
>>> Otherwise we will incorrectly take/not take a breakpoint exception =
when
>>> that stale code is executed.
>>> As the comment notes, the assumption is that we won't be adding and
>>> removing breakpoints except when we're debugging and therefore
>>> performance is not critical. Windows XP is clearly doing something
>>> we weren't expecting, so we should ideally have a look at whether
>>> we can be a bit more efficient about not throwing the whole TB
>>> cache away.
>>=20
>> FWIW this was reported a while back on Launchpad as
>> https://bugs.launchpad.net/qemu/+bug/1883593 where the performance
>> regression was traced back to:
>>=20
>> commit b55f54bc965607c45b5010a107a792ba333ba654
>> Author: Max Filippov <jcmvbkbc@gmail.com>
>> Date:   Wed Nov 27 14:06:01 2019 -0800
>>=20
>>    exec: flush CPU TB cache in breakpoint_invalidate
>>=20
>>    When a breakpoint is inserted at location for which there's =
currently no
>>    virtual to physical translation no action is taken on CPU TB =
cache. If a
>>    TB for that virtual address already exists but is not visible ATM =
the
>>    breakpoint won't be hit next time an instruction at that address =
will be
>>    executed.
>>=20
>>    Flush entire CPU TB cache in breakpoint_invalidate to force
>>    re-translation of all TBs for the breakpoint address.
>>=20
>>    This change fixes the following scenario:
>>    - linux user application is running
>>    - a breakpoint is inserted from QEMU gdbstub for a user address =
that is
>>      not currently present in the target CPU TLB
>>    - an instruction at that address is executed, but the external =
debugger
>>      doesn't get control.
>>=20
>>    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>    Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>>    Message-Id: <20191127220602.10827-2-jcmvbkbc@gmail.com>
>>    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>=20
> This was a reversion of a reversion (see 406bc339b0 and a9353fe89). So
> we've bounced between solutions several times. Fundamentally if it =
gets
> tricky to ensure your translated state matches the actual machine =
state
> the easiest option is to throw everything away and start again.
>=20
>> Perhaps Windows XP is constantly executing some kind of breakpoint
>> instruction or updating some CPU debug registers during boot?
>=20
> It would be useful to identify what exactly is triggering the changes
> here. If it's old fashioned breakpoint instructions being inserted =
into
> memory we will need to ensure our invalidating of old translations is
> rock solid. If we are updating our internal breakpoint/watchpoint
> tracking as a result of the guest messing with debug registers maybe =
we
> can do something a bit more finessed?
>=20
>>=20
>>=20
>> ATB,
>>=20
>> Mark.
>=20
>=20
> --=20
> Alex Benn=C3=A9e

Hello Alex,

The good news is the source code to Windows XP is available online: =
https://github.com/cryptoAlgorithm/nt5src=

