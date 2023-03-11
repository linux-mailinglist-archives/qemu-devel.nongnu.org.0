Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10A66B5BE7
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Mar 2023 13:41:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1payW0-000083-0A; Sat, 11 Mar 2023 07:40:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1payVx-00007q-H2
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 07:39:57 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1payVv-0005Jj-Fu
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 07:39:57 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 0C34B5C00A0;
 Sat, 11 Mar 2023 07:39:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 11 Mar 2023 07:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1678538393; x=1678624793; bh=pFV+Bw60YX6DTyVcXuHL04yeO9DsLz811g6
 VhNIkOyU=; b=HO2psaziXBiDKt+yxC3ZxPuZUsYHjTrX23XO0NmODB82ZjN+lZr
 bFEyXHSBdd+jeCsqNbiPBnHULQDqdohX9onxnT8GpPkaNuWQFBcOOW91Bp0niw0K
 M66RVHzr5L/KzJSi4xGM5jgCO/FQ/6vP81qTNnIlB2nkgpGk5/ch2J6sCzU8Yy0U
 EudYFs+SCpo7oGuId+Jr/3qnviyb6s1IyA26LqWx16zyAP7nQ2SXs4ONk2b/muOn
 uS8O9Gaqg8BopQhWuddfAHGlQGcVQo4WB7n1mpbudjibZCg04WkMLo4lQIRu0FIG
 kL9avJg3MWdUa1zEj9dFpbBzQgTLDbNXIyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1678538393; x=1678624793; bh=pFV+Bw60YX6DTyVcXuHL04yeO9DsLz811g6
 VhNIkOyU=; b=queok/wnxGMAasZ4zFh6STjtF+CU/l2vw9AMUUeU7rjJYNEcI2O
 lUAGZXjUCGaFufKKJVsFnvWjHdJmJiS/kbL96hS+XIQmdqM2aCQAV0i8nQaYCAuA
 MhbsKhmUIorlWLKpp4kzXTYHbnJU7wihwXFsLNdc08YXRiREuGJO969s0f9BuAoJ
 QDWbBf10cqDZbeqNybvOB1Ni47rho0oDfj0HHupVesWloqZVoFJDOjXhRLP4JXZp
 ucc7NgY4AWdBWm2LaDIHA+AgtSd2UoEsSBRffL17D5GPC/tQd3q0CVAyUr910XJY
 iXias8GOGxJaCy0WMTyzMKdnZZ0Eoh+KP0w==
X-ME-Sender: <xms:mHYMZLv6Y4dqDzAbTiLUNfTw26ly8wwAkUREsSmC65SlOiuzD7gi7w>
 <xme:mHYMZMffLw-6N2OmbLaMBqk_D-Crkw_hOG3KJDuczxzIYihn9fuMB-WWVtClW6MRN
 xtV9IQGtKaQrndMt-A>
X-ME-Received: <xmr:mHYMZOxpQ0-EKAPxZlCOs1eClpHQE-6hoCnZVhcse4Ptauf3qsrZGnokWOnIk0Hj-p7G>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvtddgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepuddugfeigeduhfejtdetfefgheehgeeviedutefgjeeuvddu
 keejkeevjedtieffnecuffhomhgrihhnpegtihhpuhhnihhtvggurdgtohhmnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdih
 rghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:mHYMZKONUeOkkZqPvpdsO8bnLrtSpoOthW5tsB7pLR0zrZ-AxoGvkQ>
 <xmx:mHYMZL-EgTf1vxm54wdQn-kcNO4FLSviOgDixL4eUuVlfUHaHqcWXg>
 <xmx:mHYMZKW7Y4I2NhPEfRsDFturZyU-cCCHi9_Mc_Q941Ee3K7QQW7nuQ>
 <xmx:mXYMZFmKYcWUZEM5UjCWEjXrdImvFb1q4C9yK0Q5WujNqH_xqDfpKw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Mar 2023 07:39:52 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH] linux-user/mips: Low down switchable NaN2008 requirement
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <aca2a158-ebb6-4010-3b94-8b60026a30ac@linaro.org>
Date: Sat, 11 Mar 2023 12:39:40 +0000
Cc: QEMU devel <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A26A47BA-643C-46AE-B148-2B06A1D7BDAB@flygoat.com>
References: <20230211173401.13902-1-jiaxun.yang@flygoat.com>
 <aca2a158-ebb6-4010-3b94-8b60026a30ac@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
Received-SPF: pass client-ip=66.111.4.26; envelope-from=jiaxun.yang@flygoat.com;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> 2023=E5=B9=B43=E6=9C=889=E6=97=A5 12:32=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Jiaxun,
>=20
> On 11/2/23 18:34, Jiaxun Yang wrote:
>> Previously switchable NaN2008 requires fcsr31.nan2008 to be writable
>> for guest. However as per MIPS arch spec this bit can never be =
writable.
>> This cause NaN2008 ELF to be rejected by QEMU.
>> NaN2008 can be enabled on R2~R5 processors, just make it available
>> unconditionally.
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  linux-user/mips/cpu_loop.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
>> index d5c1c7941d..b5c2ca4a3e 100644
>> --- a/linux-user/mips/cpu_loop.c
>> +++ b/linux-user/mips/cpu_loop.c
>> @@ -301,8 +301,7 @@ void target_cpu_copy_regs(CPUArchState *env, =
struct target_pt_regs *regs)
>>      }
>>      if (((info->elf_flags & EF_MIPS_NAN2008) !=3D 0) !=3D
>>          ((env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) !=3D 0)) {
>> -        if ((env->active_fpu.fcr31_rw_bitmask &
>> -              (1 << FCR31_NAN2008)) =3D=3D 0) {
>> +        if (!(env->insn_flags & ISA_MIPS_R2)) {
>>              fprintf(stderr, "ELF binary's NaN mode not supported by =
CPU\n");
>>              exit(1);
>>          }
>=20
> Looking at R6.06 revision history:
>=20
>  5.03 August 21, 2013
>=20
>  =E2=80=A2 ABS2008 and NAN2008 fields of Table 5.7 =E2=80=9CFCSR =
RegisterField
>    Descriptions=E2=80=9D were optional in release 3 and could be R/W,
>    but as of release 5 are required, read-only, and preset by
>    hardware.
> So I tried with this change:
>=20
> -- >8 --
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 05caf54999..5f1364ffaf 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -243,6 +243,13 @@ static void mips_cpu_reset_hold(Object *obj)
>     env->CP0_EBaseWG_rw_bitmask =3D =
env->cpu_model->CP0_EBaseWG_rw_bitmask;
>     env->active_fpu.fcr0 =3D env->cpu_model->CP1_fcr0;
>     env->active_fpu.fcr31_rw_bitmask =3D =
env->cpu_model->CP1_fcr31_rw_bitmask;
> +    if (env->insn_flags & ISA_MIPS_R5) {
> +        assert(!(env->cpu_model->CP1_fcr31_rw_bitmask & (1 << =
FCR31_ABS2008)));
> +        assert(!(env->cpu_model->CP1_fcr31_rw_bitmask & (1 << =
FCR31_NAN2008)));
> +    } else if (env->insn_flags & ISA_MIPS_R3) {
> +        assert(env->cpu_model->CP1_fcr31_rw_bitmask & (1 << =
FCR31_ABS2008));
> +        assert(env->cpu_model->CP1_fcr31_rw_bitmask & (1 << =
FCR31_NAN2008));
> +    }
>     env->active_fpu.fcr31 =3D env->cpu_model->CP1_fcr31;
>     env->msair =3D env->cpu_model->MSAIR;
>     env->insn_flags =3D env->cpu_model->insn_flags;
> ---
>=20
> and got:
>=20
> $ for cpu in $(./qemu-system-mips64el -cpu help | cut -d\' -f2); do \
>  echo -n ${cpu}...;echo q \
>  | ./qemu-system-mips64el -accel tcg -cpu ${cpu} \
>                           -S -monitor stdio 1> /dev/null || break; \
>  echo OK; done
> 4Kc...OK
> 4Km...OK
> 4KEcR1...OK
> 4KEmR1...OK
> 4KEc...OK
> 4KEm...OK
> 24Kc...OK
> 24KEc...OK
> 24Kf...OK
> 34Kf...OK
> 74Kf...OK
> M14K...OK
> M14Kc...OK
> P5600...OK
> mips32r6-generic...OK
> I7200...OK
> R4000...OK
> VR5432...OK
> 5Kc...OK
> 5Kf...OK
> 20Kc...OK
> MIPS64R2-generic...OK
> 5KEc...OK
> 5KEf...OK
> I6400...OK
> I6500...OK
> Loongson-2E...OK
> Loongson-2F...OK
> Loongson-3A1000...OK
> Loongson-3A4000...OK
> mips64dspr2...OK
> Octeon68XX...OK
> $

Well that=E2=80=99s because there is no CPU being marked as MIPS Release =
3 in QEMU, and only
P5600 is marked as MIPS Release 5.

In reality R3 implementations are all advertising themself as R2, and =
later RCs of microAptiv
and interaptiv can all be configured as NaN2008 only. So for those CPUs =
we have binary compiled
with -march=3Dmips32r2 -mnan=3D2008.

Given that default CPU of mips32r2 in QEMU is 24Kf, I think the best =
approach to deal with such
situation is to allow NaN2008 to be enabled for early processors for =
linux-user.

There is a NAN2008 Debian port for test:=20

=
http://repo.oss.cipunited.com/mipsel-nan2008/tarball/sid-mipsel-nan2008-20=
230309-1.tar.xz

Thanks

>=20
> Which CPU are you testing? Where can I get such ELF binary for =
testing?
>=20
> Thanks,
>=20
> Phil.



