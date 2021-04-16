Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ACD361CC4
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 11:18:02 +0200 (CEST)
Received: from localhost ([::1]:55100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXKbw-0005CE-PM
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 05:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lXKaF-00047z-A1
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 05:16:15 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lXKZt-0004qf-1Y
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 05:16:08 -0400
Received: by mail-wr1-x42c.google.com with SMTP id j5so25013897wrn.4
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 02:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1qwkkUJBNtiBMiLH5+erplx1NQZjQZuqcPou55ttx1M=;
 b=zsGa7TE0asQdiUUSJlKoknO80CuMQJXZJ8oO4Q2Z8OlB3otDHSvWVuDzBe3FSgVcXY
 VnLVtm2Vdo7cXXCLaTfbAryRlSRW1fqZcTpMIIYZ7aJcfQ7bgD41GrZp2Z0uPJRXoqyJ
 gSIxKfaJYEU6yKlw4D0Rb8Tw7H8TJot5bOIYJcPqjjekoTAcX41NS9jDNtsOX0a+n8Y8
 ocJDL/OcQqk0NDjdzafuCyYhO7EBD1fhnHnkFBIeknrWSpuJXulgiqwoPRQypVtCbJTT
 iZpwiMAeEsksahNExCeZ8rt7Jhg9TXKsG6wMQyh4yApqn4BWbnc5oD+a7ORW/QW8aab1
 08Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1qwkkUJBNtiBMiLH5+erplx1NQZjQZuqcPou55ttx1M=;
 b=uN5JGewWHy0HAZ3ySUFhThvisEuptAWlkP0nSbGvwIUFdudUwdajbbatFg+3quNUEo
 9U9nAYrKTpXzyfDws3U14ypBAMOfUS8YRmw37Z9GicYlfEyaAyemWfymQVTi71+sXTfb
 SN9wDJ5Y7x3rqzBo/2W/a0bsrKc4QOyakAbBqjckZb7ScHTGNxXc0egF9D4bvBQDq1RN
 PvkrQ152M3UOql/eyYHSXH6FfpnGDN+dDNhCLqeDYoJVp0hUbEOpMLJW1GC9NNjTUBuD
 xDpcWZgIeK3pAHxZk4+d7gMtZ+C4LUam3/QImIs+tash1ahWVpFzSERn7G5izCBKk8aX
 L8pg==
X-Gm-Message-State: AOAM533IcD9P216sKz7RczuTCPitW9+ZuJrWAr6q/2/xAKA1iAORwtNH
 qj6h4WtYxA58b/vnB1kC4fTxUA==
X-Google-Smtp-Source: ABdhPJwJJwsgQDA4ZKQptsFH6TsCV7mcGrWIkx/UxNEAgqHGm1BVtQd33JGWLf6ln8+iIunG89n+Qw==
X-Received: by 2002:a05:6000:2c4:: with SMTP id
 o4mr3137554wry.232.1618564551209; 
 Fri, 16 Apr 2021 02:15:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q5sm9549056wrv.17.2021.04.16.02.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 02:15:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4CE431FF7E;
 Fri, 16 Apr 2021 10:15:49 +0100 (BST)
References: <20210218094706.23038-1-alex.bennee@linaro.org>
 <20210218094706.23038-19-alex.bennee@linaro.org>
 <CAFEAcA8micdrGgwyS-20mnGkdpJ3mMnq=MEJJFZCh3XGx0uMbg@mail.gmail.com>
 <CAFEAcA9G-WabAM_EdgMzd0Xv6z8xRYjw57DiEqB6Z_Wbj=X1Eg@mail.gmail.com>
 <87blaflit2.fsf@linaro.org>
 <CAFEAcA_Uqvc5zyJs8XHWDGR1B_jUZ9jY5EdgHSmaczuOc02ykg@mail.gmail.com>
 <b989ebfe-1294-5eef-53a2-9599421e0069@amsat.org>
 <6597cb54-44d9-0798-0786-098286001fe0@kaod.org>
 <CAFEAcA-x-eNaH=JROoSgF-ruWJDC2++qLNxz3ZEtziyUO-3aEQ@mail.gmail.com>
 <959e497c-7873-f449-c3d8-546479cccace@kaod.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [EXTERNAL] Re: [PULL 18/23] accel/tcg: re-factor non-RAM
 execution code
Date: Fri, 16 Apr 2021 10:14:44 +0100
In-reply-to: <959e497c-7873-f449-c3d8-546479cccace@kaod.org>
Message-ID: <8735vqlhdm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 4/15/21 7:34 PM, Peter Maydell wrote:
>> On Thu, 15 Apr 2021 at 18:18, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>>
>>> On 4/15/21 5:55 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> On 4/15/21 4:54 PM, Peter Maydell wrote:
>>>>> On Thu, 15 Apr 2021 at 15:32, Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
>>>>>> --8<---------------cut here---------------start------------->8---
>>>>>> accel/tcg: avoid re-translating one-shot instructions
>>>>>>
>>>>>> By definition a single instruction is capable of being an IO
>>>>>> instruction. This avoids a problem of triggering a cpu_io_recompile =
on
>>>>>> a non-cached translation which would only do exactly this anyway.
>>>>>>
>>>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>>>
>>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>> accel/tcg/translate-all.c | 2 +-
>>>>>>
>>>>>> modified   accel/tcg/translate-all.c
>>>>>> @@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>>>>>>
>>>>>>      if (phys_pc =3D=3D -1) {
>>>>>>          /* Generate a one-shot TB with 1 insn in it */
>>>>>> -        cflags =3D (cflags & ~CF_COUNT_MASK) | 1;
>>>>>> +        cflags =3D (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
>>>>>>      }
>>>>>>
>>>>>>      max_insns =3D cflags & CF_COUNT_MASK;
>>>>>> --8<---------------cut here---------------end--------------->8---
>>>>>
>>>>> Yes, this fixes the problem. Do we want to put this in for 6.0? My
>>>>> feeling is that executing from non-RAM is pretty niche, so maybe
>>>>> if we need an rc4 anyway, but this isn't important enough to cause an
>>>>> rc4 itself.
>>>>
>>>> Isn't it the default for Aspeed machines (with U-Boot)? (Cc'ing C=C3=
=A9dric).
>>>
>>> You need to set the 'execute-in-place' machine option to load/execute t=
he
>>> instructions from the AHB window of CE0. It's not on by default because
>>> boot can be really slow with some recent u-boot which heavily trash the=
 TBs.
>>>
>>> But this seems to work fine with -rc3.
>>=20
>> Triggering the bug requires both execute-in-place and -icount -- did
>> you test with -icount enabled?
>
> It crashes.


Without the above patch? I've re-posted as a proper patch here:

  Subject: [RFC PATCH] accel/tcg: avoid re-translating one-shot instructions
  Date: Thu, 15 Apr 2021 17:24:53 +0100
  Message-Id: <20210415162454.22056-1-alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

