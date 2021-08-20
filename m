Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3353F244F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 03:11:30 +0200 (CEST)
Received: from localhost ([::1]:46290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGt4D-0006ku-CW
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 21:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mGt35-0005zy-6E
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 21:10:19 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:33290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mGt32-0002vd-Uv
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 21:10:18 -0400
Received: by mail-il1-x12c.google.com with SMTP id z2so7910451iln.0
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 18:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=rUqoYXyI0tI2HlOL7pMFvRtGgXSwmcFrJWpJgvyJ6fg=;
 b=OMOPzcb0FIuCKG0UACQ//PaMRzb1pgekL7/xK6FLFNl2UAh4SNaesD4JE4wCjzTS+B
 CAZooRTL3iWSUAFqxVMQoRN9BngUVxu+Csqb9ChVf0s8TEcT5bYXPXWNc3cLK5iGc0O/
 0eM4rcLIUPkzB6uPa381LL5Qls78EPXowFTCQ1xDYOJaaKZyvMbZGvxFvTL40L7Y4D7S
 RGpYLnqYSeap4SbC4BwRhl55T+V/Oa+w8WaKrrDJfGw3owE9RK//vUcTJx6ZhB0HSr2H
 fRnKYhg2MpTa13sM2KcUV1wH8pZIowcV+vDTTySi9NsGlltg/uoBzFHltwhBg1GjPebd
 88mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=rUqoYXyI0tI2HlOL7pMFvRtGgXSwmcFrJWpJgvyJ6fg=;
 b=MHbnN5aNieHmTQ5/jLUFQFPTtp3iUpQF7QDivTLR1rprtnvDr/Gaer9Fj939xLkh2j
 nIIUoQQeO7Xjsn5Kfbkwb1jISNWiWt8d0o+VkAu+5ZWfEHyyAhPPrpUOo5u2cGHsAq0/
 suovAf+89vDtNZv/fy6hC8WagKBxnRuGNqSHLtETLb7MewBEBDoC4eJMpRQ6StLLJXsU
 jdPYAqYomomtN3OOer+ErG3ck4vL1VOGRvUeoskfaDCPwNN/8zPE+VH+KwvXEt+ICZn0
 09WSI0Uwh53EAMfY3Nd9KmqGqFAjs7rvK8H/hTSfPIh4L5Q9lZRhzwfZjBBHcVhctJLv
 9/ig==
X-Gm-Message-State: AOAM530PdaTAEK6sAodLWl3OR7lfrO102HdWiVWymYFgfmuRDYojD3ee
 o4JqOff7nXpE9XwSG4rSth7GBQ==
X-Google-Smtp-Source: ABdhPJyDJVGMYwyosLNjl/eOkRHGHXpcFlILuVr2ziMabhYZQYVtt5hGu6aNLML1lMP2tcbYOteyAw==
X-Received: by 2002:a05:6e02:dcc:: with SMTP id
 l12mr11786590ilj.20.1629421814912; 
 Thu, 19 Aug 2021 18:10:14 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:78fd:7f8d:c5f4:1730?
 ([2603:300b:6:5100:78fd:7f8d:c5f4:1730])
 by smtp.gmail.com with ESMTPSA id k21sm2529605ioh.38.2021.08.19.18.10.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Aug 2021 18:10:14 -0700 (PDT)
From: Warner Losh <wlosh@bsdimp.com>
Message-Id: <D2415F8E-07EB-427A-A6C0-C158222FBED5@bsdimp.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_66659245-F1A2-45EF-8E00-5AC4FAAB8BA7";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH for 6.2 33/49] bsd-user: Rewrite target system call
 definintion glue
Date: Thu, 19 Aug 2021 19:10:12 -0600
In-Reply-To: <b5af5252-c0d8-8bc6-0fa0-4fc1c4aebaf8@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-34-imp@bsdimp.com>
 <b5af5252-c0d8-8bc6-0fa0-4fc1c4aebaf8@linaro.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=wlosh@bsdimp.com; helo=mail-il1-x12c.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@FreeBSD.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_66659245-F1A2-45EF-8E00-5AC4FAAB8BA7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Aug 10, 2021, at 9:18 AM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> On 8/7/21 11:42 AM, Warner Losh wrote:
>> From: Warner Losh <imp@FreeBSD.org>
>> Rewrite target definnitions to interface with the FreeBSD system =
calls.
>> This covers basic types (time_t, iovec, umtx_time, timespec, timeval,
>> rusage, rwusage) and basic defines (mmap, rusage). Also included are
>> FreeBSD version-specific variations.
>> Signed-off-by: Stacey Son <sson@FreeBSD.org>
>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>> ---
>>  bsd-user/bsd-mman.h     | 121 --------------------
>>  bsd-user/mmap.c         |   2 -
>>  bsd-user/syscall_defs.h | 247 =
++++++++++++++++++++++++++--------------
>>  3 files changed, 162 insertions(+), 208 deletions(-)
>>  delete mode 100644 bsd-user/bsd-mman.h
>=20
> Oof.  Well, I guess it's progress, but it's hard to read.

I too find it=E2=80=A6 tricky=E2=80=A6  Once we have it all integrated =
and upstream matches our
fork, I=E2=80=99d be happy to do some cleanup in this area if you have =
good suggestions.

>> +struct target_freebsd_timeval {
>> +    target_freebsd_time_t       tv_sec; /* seconds */
>> +    target_freebsd_suseconds_t  tv_usec;/* and microseconds */
>> +#if !defined(TARGET_I386) && TARGET_ABI_BITS =3D=3D 32
>> +    abi_long _pad;
>> +#endif
>> +} __packed;
>=20
> I question the use of packed here.  You do realize that removes all =
alignment requirements?  This is probably not what you want.  It's =
certainly not present in the real freebsd _timeval.h.
>=20
> Similarly with _timespec.h.

Yea, these are wrong. they used to be a thing, but as you point out, =
__packed doesn=E2=80=99t do what people think it does=E2=80=A6  I=E2=80=99=
ll remove.

Warner

--Apple-Mail=_66659245-F1A2-45EF-8E00-5AC4FAAB8BA7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmEfAPQACgkQbBzRKH2w
EQBbEBAAmZMZTaZ6zsFRDGJQ5hwQ1KDgmaK6F9WWII5+Z1frI42ZcR5rCAxhCAPI
inRTrTZu3/EkXk9kllgKVN6tGTfEHOnON2Sk821JrJ53GxJifLxIp0qGZv2SwzuS
TALDCu0tz96XaER+gMgw3G8nkpfHApHQPlrTEA6EvkP1O/YoI8hw/bZNSQiwOHtL
h7DTcqQRV0njmBrHrE5Puj6n/ZN6YwwxqYNkhWbxxb9kCdbY3CEIvc5H5EwNGY0D
GImIKJ130HmE6wTAq0tJUrouZacn5YX0FqukkO+4ZNfe6YURd7G0SKqf2lp3OxdB
HQqEd63OTYjlMwcliEJ/wnqs6Aw9zISFtV37PjgSrbymjgyMGlZo4f9HIo1vwBxs
EiwUGdIddMVnHf+qY3aHlgyOTpoqve/vPsBSWKkk0WZZGGORcf1qc4Zvs3mcqUMU
+gTTFsI7nLdGuX/M3Bd+dk8BUMkYFOKwt3NzriOqjiJLIjdqbyv4BfEwuzcvflVm
DSHcqxIua7WiV4cdvlyLNNQotGbI2RoQfJwr3qdq/JuIP7w8KeRbxTjdNhWS1mnf
K2yChg1dshYpDn+daegyEtkjjVDNeZl4PCsl2coXOP4TJsvxnwNLeZUVoM18x0fY
HHhBJ/d4gawa5zGFL32zCVNaVIoctKIuIrwdT/G8NUDiIGqSMd8=
=4kK7
-----END PGP SIGNATURE-----

--Apple-Mail=_66659245-F1A2-45EF-8E00-5AC4FAAB8BA7--

