Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B2D3F9C8C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 18:32:37 +0200 (CEST)
Received: from localhost ([::1]:45478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJemN-0004Lr-Ka
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 12:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJekQ-0003Bx-NC
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 12:30:30 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:37441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJekO-0001DB-IY
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 12:30:30 -0400
Received: by mail-io1-xd32.google.com with SMTP id b7so9268450iob.4
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 09:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=pLzDrrQoW+tfOJi0VrfKsG9G39lhXdAvj8PkzDH7QIY=;
 b=Wv+oJBGB9X0NK+RiGt3FYqkP1k+ivI49gFVv5Vf+faJLIrsTd25kwHZK0qK6x5FUsO
 bgRQDGDDxjyPmM/1wCjQkeClTh9vmZlwTp3h/99Rw5ktwo2/M0dB/EI38N1N6s42TEUI
 2wdK48j07TWk8vXEP685MYE8Un4Zzif0PUwstDsJfIomRLg5tQaIvXoVwS9UhFvTsVG7
 xbiMFiItNqvhbrdaVE692ph8atkEvN5N9kzmMEC3mLXhlDg7bdjBFIZtoq8/pE+ljJeQ
 e+5DvRgEmbZBmu5Z9rOc7jJWPmlmbdKWpenvBWbiNJgFYHbWtL+nwFFrh5A719Z2S5C7
 cwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=pLzDrrQoW+tfOJi0VrfKsG9G39lhXdAvj8PkzDH7QIY=;
 b=gfI2Uz+kbDVg2SH2EkFydtPykbCChCNhJJWZDxZUy2M5BZsWDGSrS1qhFs9rfc0jfx
 e5LDDtkqEVIpx7xWZJosAVAYt4CegADr4LLcZ3vJuJbRnCdj+aw1KlRiwaArPvvvicXu
 DHman66cx5Tp2spffIgpWk0hd4yxGw3tp5c4X4YeinU1b8N9aR0lHkR9M2WFko3+KgpH
 v0WL3cAgSDAPyr5ZSWTgrGOYkWJUsdD/8xHgXHnu79bJHePfd3wIBnMSlb7y2RqTOVyr
 4T5wUvEpdIL4MCvO9nrKSdXDp6pNJF/+mZHaO2851SVLekH3JPDlZQY8NqjE+xnm62Th
 bAcw==
X-Gm-Message-State: AOAM533cX812tY6bceYRI3jT7Z+K9JXo85Fn1d63EmXaqhu65aAH+0dI
 SN2yEwi9PAy5yeQ4uuWpz/KPhw==
X-Google-Smtp-Source: ABdhPJyOc/1j4b/rGD1f2mJE3auqz89didnIlxrAPq5VlfTWH0hdcN1Dt2T1qcvv40fopsPbh/BqAA==
X-Received: by 2002:a5d:914b:: with SMTP id y11mr8013194ioq.6.1630081827364;
 Fri, 27 Aug 2021 09:30:27 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:c17e:7522:3652:c9d4?
 ([2603:300b:6:5100:c17e:7522:3652:c9d4])
 by smtp.gmail.com with ESMTPSA id e14sm3723946ilr.62.2021.08.27.09.30.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Aug 2021 09:30:26 -0700 (PDT)
From: Warner Losh <wlosh@bsdimp.com>
Message-Id: <AEC4EA7B-4F88-4C68-A118-8400D285F9C9@bsdimp.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_96358E3E-052B-47C0-9765-94E8C8893B40";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2 41/43] bsd-user: Implement cpu_copy() helper routine
Date: Fri, 27 Aug 2021 10:30:25 -0600
In-Reply-To: <75787713-74e2-db26-26d1-83f5118c5546@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-42-imp@bsdimp.com>
 <f76e5319-6f95-4765-cac7-ad945b52f662@amsat.org>
 <E0A580FD-61B8-4889-A7F6-778E1848773F@bsdimp.com>
 <75787713-74e2-db26-26d1-83f5118c5546@amsat.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=wlosh@bsdimp.com; helo=mail-io1-xd32.google.com
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


--Apple-Mail=_96358E3E-052B-47C0-9765-94E8C8893B40
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Aug 27, 2021, at 10:00 AM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> On 8/27/21 4:56 PM, Warner Losh wrote:
>>> On Aug 26, 2021, at 10:47 PM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>>>=20
>>> On 8/26/21 11:11 PM, imp@bsdimp.com wrote:
>>>> From: Warner Losh <imp@FreeBSD.org>
>>>>=20
>>>> cpu_copy shouldbe called when processes are creating new threads. =
It
>>>=20
>>> Typo "should be"
>>>=20
>>>> copies the current state of the CPU to a new cpu state needed for =
the
>>>> new thread.
>>>>=20
>>>> Signed-off-by: Stacey Son <sson@FreeBSD.org>
>>>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>>>> Signed-off-by: Justin Hibbits <chmeeedalf@gmail.com>
>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>> bsd-user/main.c | 30 ++++++++++++++++++++++++++++++
>>>> 1 file changed, 30 insertions(+)
>>>>=20
>>>> diff --git a/bsd-user/main.c b/bsd-user/main.c
>>>> index e2ed9e32ba..b35bcf4d1e 100644
>>>> --- a/bsd-user/main.c
>>>> +++ b/bsd-user/main.c
>>>> @@ -180,6 +180,36 @@ void init_task_state(TaskState *ts)
>>>>    ts->sigqueue_table[i].next =3D NULL;
>>>> }
>>>>=20
>>>> +CPUArchState *cpu_copy(CPUArchState *env)
>>>> +{
>>>> +    CPUState *cpu =3D env_cpu(env);
>>>> +    CPUState *new_cpu =3D cpu_create(cpu_type);
>>>> +    CPUArchState *new_env =3D new_cpu->env_ptr;
>>>> +    CPUBreakpoint *bp;
>>>> +    CPUWatchpoint *wp;
>>>> +
>>>> +    /* Reset non arch specific state */
>>>> +    cpu_reset(new_cpu);
>>>> +
>>>> +    memcpy(new_env, env, sizeof(CPUArchState));
>>>> +
>>>> +    /*
>>>> +     * Clone all break/watchpoints.
>>>> +     * Note: Once we support ptrace with hw-debug register access, =
make sure
>>>> +     * BP_CPU break/watchpoints are handled correctly on clone.
>>>> +     */
>>>> +    QTAILQ_INIT(&cpu->breakpoints);
>>>> +    QTAILQ_INIT(&cpu->watchpoints);
>>>> +    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
>>>> +        cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
>>>> +    }
>>>> +    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
>>>> +        cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, =
wp->flags, NULL);
>>>> +    }
>>>> +
>>>> +    return new_env;
>>>> +}
>>>=20
>>> But where is it called?
>>=20
>> It=E2=80=99s in the bsd-user fork=E2=80=99d proc code:
>>=20
>> =
https://github.com/qemu-bsd-user/qemu-bsd-user/blob/079d45942db8d1038806cb=
459992b4f016b52b51/bsd-user/freebsd/os-thread.c#L1566
>>=20
>> Is where it=E2=80=99s called from. I wanted to get it out of the way =
in this review since I was trying to get all the changes to main.c done, =
but if you=E2=80=99d like, I can drop it and submit in the next round.
>=20
> Better keep it for next round :)

OK. I=E2=80=99ll drop and queue up next time.

Warner


--Apple-Mail=_96358E3E-052B-47C0-9765-94E8C8893B40
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmEpEyEACgkQbBzRKH2w
EQAjURAAl9NmL8cqIDtDxdUjd+OgMNc1NPuTEdMq938DPngyDcBEzborwC1KVPZp
tf+k85vrA81/4yOL7hMgojTkgos1M0sCjzU7Buj+qI4HI8dAjLbZ7A9gEMxrmAzb
z/ENlbKILMBQpZ1enDuwwKA5mpSNLD4QGlsxAqmJiDax6fXcQViGfe0fk+vx2J+b
KvSvDqX+BXhzcVclSivvWNlBQeLFF5fTz06i1uZh8SzUJuqWuz81RnKUbbM4x2sJ
ceP9JI0bE91DDCt9wl161EEe5qN8z2DyvyILrN27yfz/OIxY8i8D14xYsOFOnUWH
7eY+j0g5xl5I8Pe83Sgt/nMi33uOY8apvK2/YFceARUVnxriqhiSq9X0ujrJYopk
kZQBPI8XyffvkdOoZZUeGbizATa0QMW8Rh/Xtrv3yM2fAETgUSko4VbQLuHVusg6
G6m1tWhEXzqK9LN1/wjM1VxVePx7aHdXf/egEBpyj0HoKvi9cGSUW2Lgb3BDICM2
iDfCau7SbG4pYXWMFD4/Me4Q77FSlZbrL9DWIzjjGac9ilb59dSxk2Dmu3ki9/Zo
KH3wEj7hZ67McpgvH0la5npcS9g3adhdA/D7TT37bx9F6lEmqwIl/LORJEa7PwsK
GHhgaPesjcZfwyZw2HdJ7PGcndF0J9DnM+IBpUJO+aTjUyTJG6E=
=xReq
-----END PGP SIGNATURE-----

--Apple-Mail=_96358E3E-052B-47C0-9765-94E8C8893B40--

