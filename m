Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DA93F9B33
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 16:58:08 +0200 (CEST)
Received: from localhost ([::1]:46080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJdJ1-0000c8-Js
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 10:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJdHl-0008Ht-Da
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 10:56:49 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:46008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJdHj-0004VN-Os
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 10:56:49 -0400
Received: by mail-il1-x12e.google.com with SMTP id v2so7225804ilg.12
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 07:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=BFCDHOCQNQdA7MQQ1POGjSkN9V1iqa1TEHn7b9i0O94=;
 b=nQR8JpvoTHeBMG61a1i1FS/5CicwKww+a+N3lopnk2PozAcsA2qZEYnvxzi0oJ+6r9
 znqRN44qoVdgZlti4xOu+K6YoZIx693PbDe1aRrQVryk+nyTtONHdPL58SRJA+2PLT9h
 VuCrpUJ91o1B8vVrRHpnvO/crIDCcyck0M+wTGAeHqnF8ixp1e8WX7qXeQ3dNKZeifdA
 /8fFpxRB2cXIT7DNAHi6gV9h1DmhVWACoelJOFS0H7F3c4L/K1a+F33fwVwnyAxj0KFG
 +0XrZyu8+pAl0PzQMUWcbBcdL+MIN9FUbd4IXMAyZS5yJqi4MKZEqcTSFthkZZ/gZg0Q
 Z6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=BFCDHOCQNQdA7MQQ1POGjSkN9V1iqa1TEHn7b9i0O94=;
 b=bxsh5ykP6dismR5gn06vtl/+FpCpGqt7GNnI0F74MvqmFTMbZXZHavcNlzGWrJh4+t
 Nhv0fuvjqVMf2SeoRtE9k6msfhpvAd9+NoB0XqKx4Tv1FFlevWUPsJhHw4j3dyjyr9Wi
 X6rawXa6u9ScDveDQKT0js5C+44LD1IOwYU8DUN3mobQ6WVNwCwYUKQ6DSofOWNF/fMS
 Plp0MrbTx/fkcrFM7XBI0at+Zns9NBQe54he3zmFDgDpRVW+en9lJ/eQK3q73nYeMvt4
 j7G5A/7BoWd6de/r6ZKUjZuwUH/pE84piSxQelkr2J0GAqo5NgEnHL6+F/1EoAykges8
 k98g==
X-Gm-Message-State: AOAM533vsvZpQS0DB0XdShexvJWKsn7X0ASnGXb/f+a/pejVXFCkoarK
 PXKv0ASx8z06Mc4Q/HVaBkzflg==
X-Google-Smtp-Source: ABdhPJyQSNOGe2t0VU4nwUY0USqbzef2ACH4T0zaikFtGwcPhlgJXaG8quQfjKccroDwJBGuJ7PgCA==
X-Received: by 2002:a05:6e02:10c2:: with SMTP id
 s2mr6933585ilj.148.1630076206629; 
 Fri, 27 Aug 2021 07:56:46 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:c17e:7522:3652:c9d4?
 ([2603:300b:6:5100:c17e:7522:3652:c9d4])
 by smtp.gmail.com with ESMTPSA id i14sm3387012iog.47.2021.08.27.07.56.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Aug 2021 07:56:46 -0700 (PDT)
From: Warner Losh <wlosh@bsdimp.com>
Message-Id: <E0A580FD-61B8-4889-A7F6-778E1848773F@bsdimp.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_39558CB2-DC58-4CFC-A428-5CFF7C48D98D";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2 41/43] bsd-user: Implement cpu_copy() helper routine
Date: Fri, 27 Aug 2021 08:56:44 -0600
In-Reply-To: <f76e5319-6f95-4765-cac7-ad945b52f662@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-42-imp@bsdimp.com>
 <f76e5319-6f95-4765-cac7-ad945b52f662@amsat.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=wlosh@bsdimp.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, Justin Hibbits <chmeeedalf@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_39558CB2-DC58-4CFC-A428-5CFF7C48D98D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Aug 26, 2021, at 10:47 PM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> On 8/26/21 11:11 PM, imp@bsdimp.com wrote:
>> From: Warner Losh <imp@FreeBSD.org>
>>=20
>> cpu_copy shouldbe called when processes are creating new threads. It
>=20
> Typo "should be"
>=20
>> copies the current state of the CPU to a new cpu state needed for the
>> new thread.
>>=20
>> Signed-off-by: Stacey Son <sson@FreeBSD.org>
>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>> Signed-off-by: Justin Hibbits <chmeeedalf@gmail.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> bsd-user/main.c | 30 ++++++++++++++++++++++++++++++
>> 1 file changed, 30 insertions(+)
>>=20
>> diff --git a/bsd-user/main.c b/bsd-user/main.c
>> index e2ed9e32ba..b35bcf4d1e 100644
>> --- a/bsd-user/main.c
>> +++ b/bsd-user/main.c
>> @@ -180,6 +180,36 @@ void init_task_state(TaskState *ts)
>>     ts->sigqueue_table[i].next =3D NULL;
>> }
>>=20
>> +CPUArchState *cpu_copy(CPUArchState *env)
>> +{
>> +    CPUState *cpu =3D env_cpu(env);
>> +    CPUState *new_cpu =3D cpu_create(cpu_type);
>> +    CPUArchState *new_env =3D new_cpu->env_ptr;
>> +    CPUBreakpoint *bp;
>> +    CPUWatchpoint *wp;
>> +
>> +    /* Reset non arch specific state */
>> +    cpu_reset(new_cpu);
>> +
>> +    memcpy(new_env, env, sizeof(CPUArchState));
>> +
>> +    /*
>> +     * Clone all break/watchpoints.
>> +     * Note: Once we support ptrace with hw-debug register access, =
make sure
>> +     * BP_CPU break/watchpoints are handled correctly on clone.
>> +     */
>> +    QTAILQ_INIT(&cpu->breakpoints);
>> +    QTAILQ_INIT(&cpu->watchpoints);
>> +    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
>> +        cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
>> +    }
>> +    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
>> +        cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, =
wp->flags, NULL);
>> +    }
>> +
>> +    return new_env;
>> +}
>=20
> But where is it called?

It=E2=80=99s in the bsd-user fork=E2=80=99d proc code:

=
https://github.com/qemu-bsd-user/qemu-bsd-user/blob/079d45942db8d1038806cb=
459992b4f016b52b51/bsd-user/freebsd/os-thread.c#L1566

Is where it=E2=80=99s called from. I wanted to get it out of the way in =
this review since I was trying to get all the changes to main.c done, =
but if you=E2=80=99d like, I can drop it and submit in the next round.

Warner

--Apple-Mail=_39558CB2-DC58-4CFC-A428-5CFF7C48D98D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmEo/S0ACgkQbBzRKH2w
EQAq7hAAlzNzOWD3kNtYJLxkWy96HG0IH5v1oi8+iUq7p82SLGMhcZpTXyMuEq5H
pPcDRw/FnXf8nJOc7mf5Q/QoV9B4QavgHQxPZacYhbeQyIMvdpoZNn+zYLq6iPRm
p5TBlRRy3nCLBEiLnGEDuKvYT2u8lMERypqXBqLmQClDfyMx1di6aIo3AkAcXR73
2LGW1q7ETgcROvFkKM8HoIssEy7IYq8+IzoaQ4LR04fQ6EroqeGZ5Use2M3lqHcO
avo4j9GnOKzP19YH2Is4OeRzusPdXTE5nrvj4FNr2Z7z2dlefDpILshJGw0W9pH8
GEOl/whfweumAMoadSnufHiOTu+1K+eu+IJgFKg93wuSKopKtSbuHxO9RzlnbOH/
GWrDHqaH/THgP+7NTESaCuiAhDM1Up2QNGAjl7KydEDcPetxm7yBvbQurt3Y5uSB
8jZgL7OgZ+ZSrHJ52TVt2jmkCAAkW+q9+E3zTqrlLf2QYJtQbgEE/adOn4Eu6GMg
iJ/K+IZFDIqxEH9Wi46NFAokXKvJ6l6HH8knPp3un9+mpBQc/I36ymFF1aj20PTu
bpWFzJ8qoItkjonOdp/Fj+dVtpAp4+bIJFnsPuCCldpk+C1seTPynnZJ8huUEJ4l
qxkk7TJGc8e/YH6HVTx/LyU1opHFh9qtCUMAkYl+FiF92uDcII8=
=quOc
-----END PGP SIGNATURE-----

--Apple-Mail=_39558CB2-DC58-4CFC-A428-5CFF7C48D98D--

