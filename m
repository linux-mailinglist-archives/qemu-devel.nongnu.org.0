Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B40118DFA8
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Mar 2020 11:59:58 +0100 (CET)
Received: from localhost ([::1]:35064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFbrB-0003og-75
	for lists+qemu-devel@lfdr.de; Sat, 21 Mar 2020 06:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56538)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jiaxun.yang@flygoat.com>) id 1jFbqP-0003QK-Jb
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 06:59:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jiaxun.yang@flygoat.com>) id 1jFbqN-0008Cn-SI
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 06:59:08 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17928)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1jFbqL-0007zu-VB
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 06:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1584788284; 
 s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
 h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
 bh=HVE3rDrbW7bnlxv/mAtYrY2291ekxjVM1YUgW9Xo1LU=;
 b=Tmp9XJ2tBzIfHL4HI2Ae0mOAVwA1dqvTT7Z40SjuPv164HlOSXCF6EiJBkAPZJMV
 yuF8yGcp5A2t9ayNiWDSdhgBDbSsSkafwhHxqdee2nqpvd9jF36UChuUBxwRF5VLqU+
 dyOdGIP7UXnZyyJUayDEcR9nDuhVNer2QvnuKnDQ=
Received: from [10.233.233.252] (183.157.46.148 [183.157.46.148]) by
 mx.zoho.com.cn with SMTPS id 1584788281616355.39496232866725;
 Sat, 21 Mar 2020 18:58:01 +0800 (CST)
Date: Sat, 21 Mar 2020 18:57:54 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <3a52de21-180b-9f85-e33d-563752151017@redhat.com>
References: <20200321045621.2139953-1-jiaxun.yang@flygoat.com>
 <3a52de21-180b-9f85-e33d-563752151017@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] target/mips: Fix loongson multimedia condition
 instructions
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <A9E2018B-82A0-4889-B311-DD5D5D59D90F@flygoat.com>
X-ZohoCNMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 124.251.121.243
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
Cc: aleksandar.qemu.devel@gmail.com, aleksandar.rikalo@rt-rk.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8821=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=886=
:39:21, "Philippe Mathieu-Daud=C3=A9" <philmd@redhat=2Ecom> =E5=86=99=E5=88=
=B0:
>On 3/21/20 5:56 AM, Jiaxun Yang wrote:
>> Loongson multimedia condition instructions were previously
>implemented as
>> write 0 to rd due to lack of documentation=2E So I just confirmed with
>Loongson
>> about their encoding and implemented them correctly=2E
>
>Can you refer to the datasheet in the commit message, or have someone=20
>from Loongson Technology, Lemote Tech or with access to the specs ack=20
>your patch?

I just confirmed with Loongson guys on IM=2E

+ Huacai

Hi Huacai,

Could you please acknowledge this change,
Thanks=2E

--
Jiaxun Yang

>
>>=20
>> Signed-off-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>> ---
>>   target/mips/translate=2Ec | 40
>++++++++++++++++++++++++++++++++++------
>>   1 file changed, 34 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/target/mips/translate=2Ec b/target/mips/translate=2Ec
>> index d745bd2803=2E=2E43be8d27b5 100644
>> --- a/target/mips/translate=2Ec
>> +++ b/target/mips/translate=2Ec
>> @@ -5529,6 +5529,8 @@ static void
>gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
>>   {
>>       uint32_t opc, shift_max;
>>       TCGv_i64 t0, t1;
>> +    TCGCond cond;
>> +    TCGLabel *lab;
>>  =20
>>       opc =3D MASK_LMI(ctx->opcode);
>>       switch (opc) {
>> @@ -5816,7 +5818,7 @@ static void
>gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
>>       case OPC_DADD_CP2:
>>           {
>>               TCGv_i64 t2 =3D tcg_temp_new_i64();
>> -            TCGLabel *lab =3D gen_new_label();
>> +            lab =3D gen_new_label();
>>  =20
>>               tcg_gen_mov_i64(t2, t0);
>>               tcg_gen_add_i64(t0, t1, t2);
>> @@ -5837,7 +5839,7 @@ static void
>gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
>>       case OPC_DSUB_CP2:
>>           {
>>               TCGv_i64 t2 =3D tcg_temp_new_i64();
>> -            TCGLabel *lab =3D gen_new_label();
>> +            lab =3D gen_new_label();
>>  =20
>>               tcg_gen_mov_i64(t2, t0);
>>               tcg_gen_sub_i64(t0, t1, t2);
>> @@ -5862,14 +5864,39 @@ static void
>gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
>>  =20
>>       case OPC_SEQU_CP2:
>>       case OPC_SEQ_CP2:
>> +        cond =3D TCG_COND_EQ;
>> +        goto do_cc_cond;
>> +        break;
>> +
>>       case OPC_SLTU_CP2:
>> +        cond =3D TCG_COND_LTU;
>> +        goto do_cc_cond;
>> +        break;
>> +
>>       case OPC_SLT_CP2:
>> +        cond =3D TCG_COND_LT;
>> +        goto do_cc_cond;
>> +        break;
>> +
>>       case OPC_SLEU_CP2:
>> +        cond =3D TCG_COND_LEU;
>> +        goto do_cc_cond;
>> +        break;
>> +
>>       case OPC_SLE_CP2:
>> -        /*
>> -         * ??? Document is unclear: Set FCC[CC]=2E  Does that mean the
>> -         * FD field is the CC field?
>> -         */
>> +        cond =3D TCG_COND_LE;
>> +    do_cc_cond:
>> +        {
>> +            int cc =3D (ctx->opcode >> 8) & 0x7;
>> +            lab =3D gen_new_label();
>> +            tcg_gen_ori_i32(fpu_fcr31, fpu_fcr31, 1 <<
>get_fp_bit(cc));
>> +            tcg_gen_brcond_i64(cond, t0, t1, lab);
>> +            tcg_gen_xori_i32(fpu_fcr31, fpu_fcr31, 1 <<
>get_fp_bit(cc));
>> +            gen_set_label(lab);
>> +        }
>> +        goto no_rd;
>> +        break;
>> +
>>       default:
>>           MIPS_INVAL("loongson_cp2");
>>           generate_exception_end(ctx, EXCP_RI);
>> @@ -5878,6 +5905,7 @@ static void
>gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
>>  =20
>>       gen_store_fpr64(ctx, t0, rd);
>>  =20
>> +no_rd:
>>       tcg_temp_free_i64(t0);
>>       tcg_temp_free_i64(t1);
>>   }
>>=20

--=20
Jiaxun Yang

