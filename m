Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDEE5F6891
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 15:51:33 +0200 (CEST)
Received: from localhost ([::1]:51516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogRHg-0007Fo-59
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 09:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ogR6e-0000bh-7U
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:40:09 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:46939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ogR6a-0006If-77
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:40:08 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id BCA1D5C0162;
 Thu,  6 Oct 2022 09:40:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 06 Oct 2022 09:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665063602; x=
 1665150002; bh=1C1wEX15uByUqjN2r42i46Q9I5ny9oN7Y+r71cilWbo=; b=1
 uAg3MRlR3AeHMVK3t/okGiocAbWhM/qqRwSNqVLYmEBQpl0zwbEjBOoBOdxV4nNV
 0/fLOkucS2Krt5WyIvAQIbE5cytUjP8a17IuG6+jxXuJc12nScBl7kMAab6Q3T3N
 GHWcAdboyOti/6FQzKL7GV9nzSvdbloIFbWDRh/67W5287s/x9Pi30+TiI8/GjLj
 tmhgD2QQcIQAxUWYM31zjRDNjj1ZS4iKD+Bqzu0EMsF81JCZztMcbeS6wiiWKmjm
 FTwKjhEPOcm8ayb6TWWMKz19lcGeXx7HDmOlDEjmku5nKrrz1ddFOjihlftldMDg
 QUmG27wNXwHf9aYuD/T6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1665063602; x=
 1665150002; bh=1C1wEX15uByUqjN2r42i46Q9I5ny9oN7Y+r71cilWbo=; b=W
 2lk6XgOu7W1w/J8Uh/H6QlDThjnGR8Pj6kIXRYZHl2UJ1c3CcZgzzQrWhFA2sjoS
 QCNnxxPgQTM7cAgP2vMtSo787ZQkFkAtJjexYTV7infWa9ex7SKoe2urxeMmOl77
 TuzbECVdO8O4p4fMdJTiMzGk2Db1dSiS83Wi4QNkg9ZDhxwlN0yxCXAHriE4XcRn
 EYciI2M9jmaRUZ4P5fH0yro+q2vVzYEsSwN7ZWvUpFFTjKRZjp5ukUEofqSVuSl3
 gd4tfBay1NQvaqTALsQJRy2XOhX8F7VerWsl17+G9nwBTSJCucB1h5dnQfP0z1NT
 yfu4r878gSQ207f07FxxA==
X-ME-Sender: <xms:sto-Y8PVlKMZav7KfoSeX4r1Sc3HEQE2kj1ypjkNTmax82SUPQ9uZQ>
 <xme:sto-Yy9SJtDHRriYY7q2KVgQirYl5doOSizJmEGakoISwKzzhIVb52qsZgBi8UsmD
 XjK76Lyh_JmhmZszSU>
X-ME-Received: <xmr:sto-YzSQ24ovP0ziS9mloBpwVPuQ26ljL-MHaWO2VKeNDQCQsETMBUIKTYJnS93ZSE22>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeihedgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpegtggfuhfgjffevgffkfhfvofesth
 hqmhdthhdtjeenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpedtleefhfeuudelke
 ehieetuddtieegkeeuhfetvdeivdefjeduhefhkeefkeejvdenucffohhmrghinhepghhi
 thhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:sto-Y0uK3q8oy2Z8BhYRCQjGdLh-JqE9pH6ZH1eSOxV4Pn4LJroLOw>
 <xmx:sto-Y0cIaJW6wSILUFYskrcENK7Y2pRZJW483GnV1PlCxLe24y86hw>
 <xmx:sto-Y43sFckYfOIoSddi2clUhnArlE9LZNgNhNchwQYhxm7TgCkEkA>
 <xmx:sto-Y852yDJXzN9UYEHWwtxKtfD_2OdPiC2J8RG05V6qH5kTQfUjJA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Oct 2022 09:40:01 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.2\))
Subject: Re: [PATCH] linux-user: Fix more MIPS n32 syscall ABI issues
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20221006085500.290341-1-xen0n@gentoo.org>
Date: Thu, 6 Oct 2022 14:39:50 +0100
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?utf-8?B?IkFuZHJlYXMgSyAuIEjDvHR0ZWwi?= <dilfridge@gentoo.org>,
 Joshua Kinard <kumba@gentoo.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A0B62AE8-13F3-4BD0-BE76-1F72E2B242C6@flygoat.com>
References: <20221006085500.290341-1-xen0n@gentoo.org>
To: WANG Xuerui <xen0n@gentoo.org>
X-Mailer: Apple Mail (2.3731.200.110.1.2)
Received-SPF: pass client-ip=66.111.4.29; envelope-from=jiaxun.yang@flygoat.com;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> 2022=E5=B9=B410=E6=9C=886=E6=97=A5 09:55=EF=BC=8CWANG Xuerui =
<xen0n@gentoo.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> In commit 80f0fe3a85 ("linux-user: Fix syscall parameter handling for
> MIPS n32") the ABI problem regarding offset64 on MIPS n32 was fixed,
> but still some cases remain where the n32 is incorrectly treated as =
any
> other 32-bit ABI that passes 64-bit arguments in pairs of GPRs. Fix by
> excluding TARGET_ABI_MIPSN32 from various TARGET_ABI_BITS =3D=3D 32 =
checks.
>=20
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/1238
> Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Andreas K. H=C3=BCttel <dilfridge@gentoo.org>
> Cc: Joshua Kinard <kumba@gentoo.org>

Good catch.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Managed to chroot into a n32 =E2=80=9C=E5=85=B1=E5=88=9B Linux=E2=80=9D =
rootfs and ran some test.
Looks good.

Thanks
- Jiaxun


> ---
>=20
> Note: I can't reproduce the crash with neither MIPS n32 sysroot at my =
hand
> (a self-built one for Loongson-2F, and =
stage3-mips64_n32-openrc-20221001T170527Z),
> so I can only verify by looking at the (host and qemu) strace outputs, =
and
> would have to ask you to review/test this harder. Thanks.
>=20
> linux-user/syscall.c | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 2e954d8dbd..8b2d39fe73 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -11793,7 +11793,7 @@ static abi_long do_syscall1(CPUArchState =
*cpu_env, int num, abi_long arg1,
>         return -host_to_target_errno(ret);
> #endif
>=20
> -#if TARGET_ABI_BITS =3D=3D 32
> +#if TARGET_ABI_BITS =3D=3D 32 && !defined(TARGET_ABI_MIPSN32)
>=20
> #ifdef TARGET_NR_fadvise64_64
>     case TARGET_NR_fadvise64_64:
> @@ -11920,7 +11920,7 @@ static abi_long do_syscall1(CPUArchState =
*cpu_env, int num, abi_long arg1,
>         return get_errno(sys_gettid());
> #ifdef TARGET_NR_readahead
>     case TARGET_NR_readahead:
> -#if TARGET_ABI_BITS =3D=3D 32
> +#if TARGET_ABI_BITS =3D=3D 32 && !defined(TARGET_ABI_MIPSN32)
>         if (regpairs_aligned(cpu_env, num)) {
>             arg2 =3D arg3;
>             arg3 =3D arg4;
> @@ -12612,7 +12612,7 @@ static abi_long do_syscall1(CPUArchState =
*cpu_env, int num, abi_long arg1,
> #endif /* CONFIG_EVENTFD  */
> #if defined(CONFIG_FALLOCATE) && defined(TARGET_NR_fallocate)
>     case TARGET_NR_fallocate:
> -#if TARGET_ABI_BITS =3D=3D 32
> +#if TARGET_ABI_BITS =3D=3D 32 && !defined(TARGET_ABI_MIPSN32)
>         ret =3D get_errno(fallocate(arg1, arg2, target_offset64(arg3, =
arg4),
>                                   target_offset64(arg5, arg6)));
> #else
> @@ -12623,7 +12623,7 @@ static abi_long do_syscall1(CPUArchState =
*cpu_env, int num, abi_long arg1,
> #if defined(CONFIG_SYNC_FILE_RANGE)
> #if defined(TARGET_NR_sync_file_range)
>     case TARGET_NR_sync_file_range:
> -#if TARGET_ABI_BITS =3D=3D 32
> +#if TARGET_ABI_BITS =3D=3D 32 && !defined(TARGET_ABI_MIPSN32)
> #if defined(TARGET_MIPS)
>         ret =3D get_errno(sync_file_range(arg1, target_offset64(arg3, =
arg4),
>                                         target_offset64(arg5, arg6), =
arg7));
> @@ -12645,7 +12645,7 @@ static abi_long do_syscall1(CPUArchState =
*cpu_env, int num, abi_long arg1,
>     case TARGET_NR_arm_sync_file_range:
> #endif
>         /* This is like sync_file_range but the arguments are =
reordered */
> -#if TARGET_ABI_BITS =3D=3D 32
> +#if TARGET_ABI_BITS =3D=3D 32 && !defined(TARGET_ABI_MIPSN32)
>         ret =3D get_errno(sync_file_range(arg1, target_offset64(arg3, =
arg4),
>                                         target_offset64(arg5, arg6), =
arg2));
> #else
> --=20
> 2.38.0
>=20

---
Jiaxun Yang


