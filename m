Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00299B0D97
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 13:10:23 +0200 (CEST)
Received: from localhost ([::1]:32802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8MzX-0005cF-1q
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 07:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i8MyT-00057E-Ep
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 07:09:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i8MyS-00055b-6n
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 07:09:17 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:39683)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i8MyR-00055F-WB
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 07:09:16 -0400
Received: by mail-wm1-x344.google.com with SMTP id q12so7166240wmj.4
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 04:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=8hok+nMqYv/t9kV0Yp9WizuoSJiDuhWYJyrPqN1ME88=;
 b=J73+YqAf6v6qF+adcvZZY7+Qxs7FgfmXuUGOZ598SHByfXBXnHrE/oDwF9+YwKdW++
 QJoxExH/aYI7CulkWBhykz+YwzchmT0vuARcTxI05fpmWGYGsRsrKB+KwhXQ8xkv1dhg
 hwGaFm2uX4AwT1zBNX+fBAvuRTNyZgXql78R7hZlNtFz1MbwjOi4osDFYnK18hfPa6p9
 WxmHHLXnO2xrafuXUDm880kgv8dmuVT1UdIicfFxgsXWn2WkBtGXSM1ufk6b8g0ratYy
 RT9EGyLe2H+5eytAujTZL6TOmfsRzYSh+PWhaXCCxmUXAenbs1EIrBIx6jo/Jq4XKQNB
 8RMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=8hok+nMqYv/t9kV0Yp9WizuoSJiDuhWYJyrPqN1ME88=;
 b=c8pK3roXTACUi2QBLFuqUmcTy+97wD8ZruiAwWLbh3ljXz9GNbV7/RjQdjZSpd6Bmu
 D2qWUmNdsBdzuN0DJcvTvEUil9ZICGTUEfvKiVonPd6fEHRHeAfl6jVKx+m7BpzUgnnx
 M9k1PojCulSH7hnRAkZ7gn2beiNtT2Qd9EsGUwxQHkn5j4BzFZ1Ubs+RTO2pKMIPFvZW
 2CnRXLFJvOCPx8M/Vd5adzUTjTyC+JOMzN68S1Xe/wYHAdz/J3Ss9DE+eZe+3q6opxSN
 dZSdfSFd3FfsxYOC32KXN6xqwHS0+C0voVv2GloqElZJkRpsH0RV7hEIvPU3zZ6cdfHv
 uEFA==
X-Gm-Message-State: APjAAAXf9WP7EUvmTsX1W1Icng/H6NqMBKMuRlb/d2XRT4982AVMqne9
 DyKJXueeKla1dY42zEX4PxZnuw==
X-Google-Smtp-Source: APXvYqyFWyhHvuJWKaAUW7voBmrQT3mRVExHs0M2c+qcoI+E0ANLcXRmCrML1qOqiwQx4Q8eGfJzVA==
X-Received: by 2002:a1c:ef18:: with SMTP id n24mr7871346wmh.29.1568286554729; 
 Thu, 12 Sep 2019 04:09:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r15sm6254765wmh.42.2019.09.12.04.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 04:09:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 66FFA1FF87;
 Thu, 12 Sep 2019 12:09:13 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-3-peter.maydell@linaro.org>
 <87r24lztgq.fsf@linaro.org>
 <CAFEAcA_s1aYO6ZK2pkrrc+YrdCoUww0H_RTOjvaH8z1FOemP0w@mail.gmail.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
In-reply-to: <CAFEAcA_s1aYO6ZK2pkrrc+YrdCoUww0H_RTOjvaH8z1FOemP0w@mail.gmail.com>
Date: Thu, 12 Sep 2019 12:09:13 +0100
Message-ID: <87o8zpzs86.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 02/13] target/arm/arm-semi:
 Always set some kind of errno for failed calls
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 12 Sep 2019 at 11:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > If we fail a semihosting call we should always set the
>> > semihosting errno to something; we were failing to do
>> > this for some of the "check inputs for sanity" cases.
>> >
>> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> although:
>>
>> > ---
>> >  target/arm/arm-semi.c | 45 ++++++++++++++++++++++++++-----------------
>> >  1 file changed, 27 insertions(+), 18 deletions(-)
>> >
>> > diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
>> > index 03e60105c05..51b55816faf 100644
>> > --- a/target/arm/arm-semi.c
>> > +++ b/target/arm/arm-semi.c
>> > @@ -232,11 +232,13 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu,=
 gdb_syscall_complete_cb cb,
>> >  #define GET_ARG(n) do {                                 \
>> >      if (is_a64(env)) {                                  \
>> >          if (get_user_u64(arg ## n, args + (n) * 8)) {   \
>> > -            return -1;                                  \
>> > +            errno =3D EFAULT;                             \
>> > +            return set_swi_errno(ts, -1);               \
>>
>> This looks a little queasy given ts is NULL for the softmmu version. I
>> wonder (depending on your approach to -smp for 1/13) if we should just
>> pass the ARMCPU down to the helper?
>
> NULL is fine because the softmmu version of set_swi_errno() doesn't
> do anything with it anyway, right?

Yes it's fine - it just looks a little odd when you are reading it.
Given TaskState is derived from CPUState which you always have you could
just pass cs to set_swi_errno and hide the final implementation detail
there depending on if you are softmmu or linux-user.

But it's purely a subjective style thing, not a bug hence the r-b ;-)

--
Alex Benn=C3=A9e

