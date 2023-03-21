Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7266A6C2DC7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 10:25:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peYDv-0002OC-NY; Tue, 21 Mar 2023 05:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1peYDs-0002Nx-Fi
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:24:04 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1peYDo-0000WQ-5y
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:24:03 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BA77C320092B;
 Tue, 21 Mar 2023 05:23:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 21 Mar 2023 05:23:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1679390636; x=1679477036; bh=ew9BcfHmPGofM5txeJJf4sOZetiZUYlrTEL
 8ObP0Uys=; b=IV0mnHrE7WPBcuqSyYZ1UdlmekclVRcOg/InPrHlltPUatvh0u8
 GtUkblcfqvtefnY45Iyx7edEHmfUWD8/wzQaZ3Ci9tT9NFUt+oFaGomFQ4JKbbgk
 4akljpmToKbYgJKovjowK13UbYcs0B6fpNZL5KM8Og8iRjAxLhHnWn/gy5VjkO1+
 AbHSv9jeuH92yg0CIxNfoEsAxa+D2tg58f0c03YsCTJlsIwcbm2w5A0UW54iqhrl
 glTTTBHo9EyHOK8VzLADSr+dCXCx+yEtyQagfNlXC6LrC2W90/lCyr4ruinh7u+w
 Y6Q5S+5pg27ynFbaYVv4yLp3B2x2Ztuz/MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1679390636; x=1679477036; bh=ew9BcfHmPGofM5txeJJf4sOZetiZUYlrTEL
 8ObP0Uys=; b=YMSi58nLe6b1PgD52a6VbBdETkDuYceblg/ihP1168xED0wQQ5w
 1ykkvxbLdedmLNzhobDMasbzRjME+eujOpKJfgKkmDXcJf5jqcuiCnlJxeL3Jz/v
 K7ceztV7D1OVc8No3XIzNmTUPH9aw7bcv1XLPl0q+YcAKNkvM5Ke5Zd0WiZhRzr1
 g/YUvgcNGOHB77pxBXRVOqB62K14MjpGI58FEyY45ApKib+fcOx6PPaj9k1yFmtp
 BZYGAHc9D0JtiqlZH7qHaJERTdEEQu2a0iNiVV6kQ/4wuPmuj3kjIcBGiYaaH33A
 czqno7fWFqzni+VLFOOwdjGCXBfLErceMNg==
X-ME-Sender: <xms:rHcZZBk40crQJ7aggabdWYoSOYQ3ZFg_nXg_V2b2jElJyvPbAdA1qg>
 <xme:rHcZZM10fQAJ_uiGTn1p1Sn-O5qIR5Xd2ci4QA7poSr1ZkWvoxRDeXFueDxJLB96F
 d0lpMNzPu8HgXxgqcs>
X-ME-Received: <xmr:rHcZZHpBt1ZnZY2ulZUWXJ7elR5UWAc7H5ud5WQYXMUX8KXIY1g-gnx0ZkwramhscH6z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepuddugfeigeduhfejtdetfefgheehgeeviedutefgjeeuvddu
 keejkeevjedtieffnecuffhomhgrihhnpegtihhpuhhnihhtvggurdgtohhmnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdih
 rghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:rHcZZBnpNf5hX7ResURVYZxszuvrgi3lnUxb1_2W5cqur8JwZvEN-g>
 <xmx:rHcZZP15sHmP_GyN03FuhpsYC4BG1f9bqORs2GGIpRoQyZR8tW4Dlw>
 <xmx:rHcZZAvb37m9jdPhQ0YIWJfPFCT55Z6GgaZckQHi_f44a4iJok0YXg>
 <xmx:rHcZZI-erZOa0gz-eTxhvZ64wAm4CocunlyUXcYAIHsKtqBhq1KSKw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 05:23:55 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH] linux-user/mips: Low down switchable NaN2008 requirement
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <616442ce-157f-2ca2-5cf8-b0f67cdf47be@linaro.org>
Date: Tue, 21 Mar 2023 09:23:44 +0000
Cc: QEMU devel <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Content-Transfer-Encoding: quoted-printable
Message-Id: <94E0E41A-5B77-4DE0-B45C-9561239F30B9@flygoat.com>
References: <20230211173401.13902-1-jiaxun.yang@flygoat.com>
 <aca2a158-ebb6-4010-3b94-8b60026a30ac@linaro.org>
 <A26A47BA-643C-46AE-B148-2B06A1D7BDAB@flygoat.com>
 <616442ce-157f-2ca2-5cf8-b0f67cdf47be@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
Received-SPF: pass client-ip=64.147.123.19;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout3-smtp.messagingengine.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> 2023=E5=B9=B43=E6=9C=8815=E6=97=A5 08:18=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 11/3/23 13:39, Jiaxun Yang wrote:
>>> 2023=E5=B9=B43=E6=9C=889=E6=97=A5 12:32=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> Hi Jiaxun,
>>>=20
>>> On 11/2/23 18:34, Jiaxun Yang wrote:
>>>> Previously switchable NaN2008 requires fcsr31.nan2008 to be =
writable
>>>> for guest. However as per MIPS arch spec this bit can never be =
writable.
>>>> This cause NaN2008 ELF to be rejected by QEMU.
>>>> NaN2008 can be enabled on R2~R5 processors, just make it available
>>>> unconditionally.
>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>> ---
>>>>  linux-user/mips/cpu_loop.c | 3 +--
>>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>> diff --git a/linux-user/mips/cpu_loop.c =
b/linux-user/mips/cpu_loop.c
>>>> index d5c1c7941d..b5c2ca4a3e 100644
>>>> --- a/linux-user/mips/cpu_loop.c
>>>> +++ b/linux-user/mips/cpu_loop.c
>>>> @@ -301,8 +301,7 @@ void target_cpu_copy_regs(CPUArchState *env, =
struct target_pt_regs *regs)
>>>>      }
>>>>      if (((info->elf_flags & EF_MIPS_NAN2008) !=3D 0) !=3D
>>>>          ((env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) !=3D 0)) {
>>>> -        if ((env->active_fpu.fcr31_rw_bitmask &
>>>> -              (1 << FCR31_NAN2008)) =3D=3D 0) {
>>>> +        if (!(env->insn_flags & ISA_MIPS_R2)) {
>>>>              fprintf(stderr, "ELF binary's NaN mode not supported =
by CPU\n");
>>>>              exit(1);
>>>>          }
>>>=20
>>> Looking at R6.06 revision history:
>>>=20
>>>  5.03 August 21, 2013
>>>=20
>>>  =E2=80=A2 ABS2008 and NAN2008 fields of Table 5.7 =E2=80=9CFCSR =
RegisterField
>>>    Descriptions=E2=80=9D were optional in release 3 and could be =
R/W,
>>>    but as of release 5 are required, read-only, and preset by
>>>    hardware.
>>> So I tried with this change:
>>>=20
>>> -- >8 --
>>> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
>>> index 05caf54999..5f1364ffaf 100644
>>> --- a/target/mips/cpu.c
>>> +++ b/target/mips/cpu.c
>>> @@ -243,6 +243,13 @@ static void mips_cpu_reset_hold(Object *obj)
>>>     env->CP0_EBaseWG_rw_bitmask =3D =
env->cpu_model->CP0_EBaseWG_rw_bitmask;
>>>     env->active_fpu.fcr0 =3D env->cpu_model->CP1_fcr0;
>>>     env->active_fpu.fcr31_rw_bitmask =3D =
env->cpu_model->CP1_fcr31_rw_bitmask;
>>> +    if (env->insn_flags & ISA_MIPS_R5) {
>>> +        assert(!(env->cpu_model->CP1_fcr31_rw_bitmask & (1 << =
FCR31_ABS2008)));
>>> +        assert(!(env->cpu_model->CP1_fcr31_rw_bitmask & (1 << =
FCR31_NAN2008)));
>>> +    } else if (env->insn_flags & ISA_MIPS_R3) {
>>> +        assert(env->cpu_model->CP1_fcr31_rw_bitmask & (1 << =
FCR31_ABS2008));
>>> +        assert(env->cpu_model->CP1_fcr31_rw_bitmask & (1 << =
FCR31_NAN2008));
>>> +    }
>>>     env->active_fpu.fcr31 =3D env->cpu_model->CP1_fcr31;
>>>     env->msair =3D env->cpu_model->MSAIR;
>>>     env->insn_flags =3D env->cpu_model->insn_flags;
>>> ---
>>>=20
>>> and got:
>>>=20
>>> $ for cpu in $(./qemu-system-mips64el -cpu help | cut -d\' -f2); do =
\
>>>  echo -n ${cpu}...;echo q \
>>>  | ./qemu-system-mips64el -accel tcg -cpu ${cpu} \
>>>                           -S -monitor stdio 1> /dev/null || break; \
>>>  echo OK; done
>>> 4Kc...OK
>>> 4Km...OK
>>> 4KEcR1...OK
>>> 4KEmR1...OK
>>> 4KEc...OK
>>> 4KEm...OK
>>> 24Kc...OK
>>> 24KEc...OK
>>> 24Kf...OK
>>> 34Kf...OK
>>> 74Kf...OK
>>> M14K...OK
>>> M14Kc...OK
>>> P5600...OK
>>> mips32r6-generic...OK
>>> I7200...OK
>>> R4000...OK
>>> VR5432...OK
>>> 5Kc...OK
>>> 5Kf...OK
>>> 20Kc...OK
>>> MIPS64R2-generic...OK
>>> 5KEc...OK
>>> 5KEf...OK
>>> I6400...OK
>>> I6500...OK
>>> Loongson-2E...OK
>>> Loongson-2F...OK
>>> Loongson-3A1000...OK
>>> Loongson-3A4000...OK
>>> mips64dspr2...OK
>>> Octeon68XX...OK
>>> $
>> Well that=E2=80=99s because there is no CPU being marked as MIPS =
Release 3 in QEMU, and only
>> P5600 is marked as MIPS Release 5.
>> In reality R3 implementations are all advertising themself as R2, and =
later RCs of microAptiv
>> and interaptiv can all be configured as NaN2008 only. So for those =
CPUs we have binary compiled
>> with -march=3Dmips32r2 -mnan=3D2008.
>> Given that default CPU of mips32r2 in QEMU is 24Kf, I think the best =
approach to deal with such
>> situation is to allow NaN2008 to be enabled for early processors for =
linux-user.
>> There is a NAN2008 Debian port for test:
>> =
http://repo.oss.cipunited.com/mipsel-nan2008/tarball/sid-mipsel-nan2008-20=
230309-1.tar.xz
>=20
> $ qemu-mipsel -L sid-mipsel-nan2008-20230313-1/usr -cpu P5600 =
usr/bin/uname  -ms
> Linux mips
>=20
> What about something like:

That would lost capability of testing NaN2008 binaries again other CPU =
models.

Thanks
- Jiaxun

>=20
> -- >8 --
> --- a/linux-user/mips/target_elf.h
> +++ b/linux-user/mips/target_elf.h
> @@ -15,6 +15,9 @@ static inline const char *cpu_get_model(uint32_t =
eflags)
>     if ((eflags & EF_MIPS_MACH) =3D=3D EF_MIPS_MACH_5900) {
>         return "R5900";
>     }
> +    if (eflags & EF_MIPS_NAN2008) {
> +        return "P5600";
> +    }
>     return "24Kf";
> }
> #endif
> ---



