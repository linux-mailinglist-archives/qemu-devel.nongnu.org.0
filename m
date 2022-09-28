Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC4E5EE3B6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:59:29 +0200 (CEST)
Received: from localhost ([::1]:47866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odbLD-00080F-O2
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1odaAQ-00008w-VN
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:44:14 -0400
Received: from mout.gmx.net ([212.227.17.22]:56693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1odaAM-0000a7-AB
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664383443;
 bh=oi0se7eXvBgRxcjGCrTQiEymB6QrIY8bjg/iU1OFx4g=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=bxx8TbWgI2FmwiEMo0K2O15wHdhv8inhOGEL8ASdunQ/OjQMPZ9Z3gRD/N4lu2nX3
 KYs7ZYEW1aMkVgHnz7YDJ5bVKqcs+CKxiCBASZ45WRy4BSQ+MMh9ktiwV+ocUQ6XgL
 NWspyDvXyuYavPXlPwYW8LSytHa8FeOd5LxIHbmQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.180.135]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOA3F-1otA0Q2l6v-00ObJZ; Wed, 28
 Sep 2022 18:44:03 +0200
Message-ID: <a24e29bd-b3d5-59c2-21b4-c008f6247936@gmx.de>
Date: Wed, 28 Sep 2022 18:44:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] target/hppa: Generate illegal instruction exception for
 64-bit instructions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <Yy+BHMfYE3fYVq6k@p100>
 <3ec61ad6-d439-f501-4433-26c194863c54@linaro.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <3ec61ad6-d439-f501-4433-26c194863c54@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PGXzA4gQO3sf+iXb/WVvlmSXnjCTCLrfJbyxk32FhrLMk9v5UQM
 Pm/kLkZLTMonSjYaF4239IOkhhl3Lqnbookm7KpGOeiYCZGTwNSAY4OJxXNF6NrxOCGSoF/
 /RM9ZD0CAjANOGCfIVQyeVlGA5o83q7R96UfSI0W+aivSTPaBMhM8JRCCQpuo9E0X3uQTBa
 l6mH0vh3Tl6LD96/R4grA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GXNTmeDT9UM=:orwQTKWdsyhz9kb/S/jrZs
 gpfqun6kGPjQedCKg/1/ikoTEadvRtb1Q2VXYszppMP+0M2uCzjXKb1rYan4JYbnjm3YRSmHi
 Z/pAlBMLuJVxq0nR9J4GgTsqx5IpZA2kVJXzg0Qc8zZHlPjodf7HFU0zWYYyb+F1NqK+fU3VQ
 qHkbyuos1/KfpKodmGJOxYDB9Uk5bYDVK9Ycb0rezF3FIW7jI7yuc+txlShlWcvAOaeUxd4ZR
 YL1W2QS9+2RGPJ8s0mQOohuX1txE57ndVLevEMxv4v+kMi5dL78Yk7qbdIhR5UGucStH3Yjxd
 dc+K8Y7iP28vSXlfOMHO6mLxiuk9POVWgw1W6kr3tJg+mM55OzLkbhB/Qk4yL/5cu06Sktiwc
 E9IXT795BajQUSw410GYgRcAq7zjOSJPnqQMuOTg0ZYlntrddvfl8jBz/Qkj7OqGfQlMGkopM
 s6YVo9yEx2Cg41fRYjINKVVIvtoCyyQrL9P2zF0RvyTEw8dyZ09PQ8ljheU908Y566ZjKBRP8
 17YTNjnFyrocpHtgIFZIoezXk4XvqOqL+iG3mfHg1lgUPmPupimDg2wWhQp7XH2nDL3YJeA0/
 DfaPcANPAZog6ObdUVyL7WSwIkkVOqxqiNsWkkHlRfGMkfC+obtRYJiUv58pPKS7SHBpvQ/a6
 zKk7+tVpRayXawTvIvOP9pC/cWIB+ZetW4ZoXdx98aLx7Wd48kEQXVTUCMfKy9TQtuau2bodA
 013hHs8sJhM+5lqU0fAbe2HxZIbm9gIEAqAgYVEiM0DRC7erAitn9TRofBMXkTyyvEbeDbkQ9
 51QvlsL7NC2GKrAs6W9mSbNoKrvMMd8mnbACwzbqltgx5Pyh4jHt1AXPeB2sHumLr5OmYFDMf
 De1hSOAnb89OEs/UHrsUqjsvemnLm2KtJsi8zZzVV91Ib3wg0o6CcYjjAZdl9xRp/TlPoKP32
 7dVuwK1pI1vwxwUVc6+K+2lzJ9lxQTmjla/z7tJrWCfU5la12xqP9448IZMeKRGu1ddbNpMNa
 E7SQKJml6WIozQyDAvDMY9inc6lVEs59SrFjcs7/DBTgny1eXhqqkTdCqIfbVBFKaXB/Hxl08
 S7TD0dE+UYydU+qL9Q0JCSHe1s5YVxMGeOp3S51MS26LDB+tejmZRQ8rekFyhRRQjfAiCoXKg
 B4LVT4zZ/1aAiuU5gRO/R3r/Sf
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 9/28/22 17:55, Richard Henderson wrote:
> On 9/24/22 15:13, Helge Deller wrote:
>> Qemu currently emulates a 32-bit CPU only, and crashes with this error
>> when it faces a 64-bit load (e.g.=C2=A0 "ldd 0(r26),r0") or 64-bit stor=
e
>> (e.g. "std r26,0(r26)") instruction in the guest:
>>
>> ERROR:../qemu/tcg/tcg-op.c:2822:tcg_canonicalize_memop: code should not=
 be reached
>>
>> Fix this by adding checks for 64-bit sizes and generate an illegal
>> instruction exception if necessary.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/target/hppa/translate.c b/target/hppa/translate.c
>> index b8dbfee5e9..287cc410cd 100644
>> --- a/target/hppa/translate.c
>> +++ b/target/hppa/translate.c
>> @@ -1568,7 +1568,12 @@ static bool do_load(DisasContext *ctx, unsigned =
rt, unsigned rb,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Make sure if =
RT =3D=3D RB, we see the result of the load.=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dest =3D get_tem=
p(ctx);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 do_load_reg(ctx, dest, rb, rx, scale, disp, sp, mod=
ify, mop);
>> +=C2=A0=C2=A0=C2=A0 if (unlikely(TARGET_REGISTER_BITS =3D=3D 32 && (mop=
 & MO_SIZE) > MO_32)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen_illegal(ctx);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dest =3D tcg_constant_reg(0=
);
>> +=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do_load_reg(ctx, dest, rb, =
rx, scale, disp, sp, modify, mop);
>> +=C2=A0=C2=A0=C2=A0 }
>
> This should be done in trans_ld,
>
>> @@ -1631,7 +1636,11 @@ static bool do_store(DisasContext *ctx, unsigned=
 rt, unsigned rb,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int modify=
, MemOp mop)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nullify_over(ctx);
>> -=C2=A0=C2=A0=C2=A0 do_store_reg(ctx, load_gpr(ctx, rt), rb, 0, 0, disp=
, sp, modify, mop);
>> +=C2=A0=C2=A0=C2=A0 if (unlikely(TARGET_REGISTER_BITS =3D=3D 32 && (mop=
 & MO_SIZE) > MO_32)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen_illegal(ctx);
>> +=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do_store_reg(ctx, load_gpr(=
ctx, rt), rb, 0, 0, disp, sp, modify, mop);
>> +=C2=A0=C2=A0=C2=A0 }
>
> and this in trans_st.

Yes, you're right.
Will resend fixed patch.

Helge


