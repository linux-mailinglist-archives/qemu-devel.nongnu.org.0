Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095286493A3
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 11:34:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4Jeb-0008Iv-0g; Sun, 11 Dec 2022 05:33:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1p4JeF-0008HO-Kw
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 05:33:31 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1p4JeD-0004cR-Bi
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 05:33:31 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id E16995C00CF;
 Sun, 11 Dec 2022 05:33:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 11 Dec 2022 05:33:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1670754806; x=
 1670841206; bh=ND++geIoYSdx9+eRLh908CHm71uorzv6SLECcHT5Fj0=; b=S
 ftHYpI97/+ExPJiX55nprU44i0MjfrL5MA7+QuYQ1oWB5kj4CPt9SFBebv8+WSvk
 aPdiWzfyWMb5NdxM23TXNTpfcZUXc+UCVofGDUMMJ+ANeO2cMeLpj2VQ3PPwlgEy
 L3Tzs/RPnvWMbYVf1F+/bjk1G2TAqiewXlz8IMkfKU9KTzatpRw2stUtIZLUtugq
 NNpL4WlTyg1bANfFpgcKlOSPwzwTfGb0p5GJX9goT2vC8H0hDLl97bfoLp1eIs+s
 J1MQe6nhDHiF4ku0wlDjNvHZ54ellGwteLFGWbEIxL6apX+VvEjFf4+bKI6ZbgH3
 IfUIkUCCYUNF87NECCY/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670754806; x=
 1670841206; bh=ND++geIoYSdx9+eRLh908CHm71uorzv6SLECcHT5Fj0=; b=F
 00deWxZZolJfDBm27PUIAMx8N17xxjDGRNvgqDgv2c365dOTyqBVIQxPIIFsTr+0
 jaGMKe8uAMuShiXnDn8MAB3oI9XVORw565SMLAGcqhhffD2vJ1i0L3k778TSh9w0
 JldpR8UbbewGGj86UCL5xzZThREKbfWbowUv3oTnn6n19O1XU4MFHxL1Cqr7nity
 9720G9+Svh3ApyCTxFaXiW/OezlPeA9UfiaatrvnUcTcKNGzruSf2VLBgm6ITtCm
 sAr53xrcKUN6cX/ookqM3ygcCA6p3KMwuBISx9LiEhmSBYv6cdER4WkKf1DE3bES
 8F9SZqGrx234Kx0JiSvAw==
X-ME-Sender: <xms:9rGVY7HnjvW2Nf6dyg2jN0EF_V4m05GNrEq-O4huSUZpvKFTTVasSA>
 <xme:9rGVY4XII08MU40BBHNV50ieVQxlZ0BV7ZnaIHfVm61tWdAYCAREhquFBut1PPR8I
 LeCoguYl5nT58x8Ii0>
X-ME-Received: <xmr:9rGVY9I2YACuFPziv8Wq6lGk3US4CvSCAxPjlshh9Rt30XCDoT6wsKnzxTrd7odb_Sof>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeigddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefhffel
 vdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:9rGVY5Fvs4TVKYtvcQlpNnPlRfYl7NgmsomDU4dmmFxETdb9UDvZiw>
 <xmx:9rGVYxWLkorompT-k2CXxvoZbiRsK3r0NoHWPx7nMECZWfICyG3YOA>
 <xmx:9rGVY0OynJdPjJEazacXx7E-ElhjSgE7y5C6i4H9-q8jbEc88Elj_g>
 <xmx:9rGVY_ebTUpECvtyNG9grooGJLJqzziUGPj5SlA8kEncdRSIGzG-2g>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Dec 2022 05:33:25 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH-for-8.0 4/7] hw/mips/bootloader: Implement nanoMIPS LUI
 opcode
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <3c81cd7b-4055-a9fb-96f6-811917df9ba2@linaro.org>
Date: Sun, 11 Dec 2022 10:33:13 +0000
Cc: BALATON Zoltan via <qemu-devel@nongnu.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F618F1F8-88B8-4B8E-AA6A-7E047CDE0D7F@flygoat.com>
References: <20221210155502.74609-1-philmd@linaro.org>
 <20221210155502.74609-5-philmd@linaro.org>
 <3c81cd7b-4055-a9fb-96f6-811917df9ba2@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
Received-SPF: pass client-ip=66.111.4.25; envelope-from=jiaxun.yang@flygoat.com;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



> 2022=E5=B9=B412=E6=9C=8810=E6=97=A5 16:01=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 10/12/22 16:54, Philippe Mathieu-Daud=C3=A9 wrote:
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> ---
>>  hw/mips/bootloader.c | 29 ++++++++++++++++++++++++++---
>>  1 file changed, 26 insertions(+), 3 deletions(-)
>> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
>> index 7f7d938f2e..997e74ee52 100644
>> --- a/hw/mips/bootloader.c
>> +++ b/hw/mips/bootloader.c
>> @@ -120,11 +120,34 @@ static void bl_gen_jalr(void **p, bl_reg rs)
>>      bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x09);
>>  }
>>  +static void bl_gen_lui_nm(void **ptr, bl_reg rt, uint32_t imm20)
>> +{
>> +    uint16_t *p =3D (uint16_t *)*ptr;
>> +    uint32_t insn =3D 0;
>=20
> Hmm we should check if imm20 fits in 20-bit.

Perhaps it will be easier to use 48bit addiu instruction to generate LI?

Thanks
- Jiaxun

>=20
>> +    insn =3D deposit32(insn, 26, 6, 0b111000);
>> +    insn =3D deposit32(insn, 21, 5, rt);
>> +    insn =3D deposit32(insn, 12, 9, extract32(imm20, 12, 9));
>> +    insn =3D deposit32(insn, 2, 10, extract32(imm20, 21, 10));
>> +    insn =3D deposit32(insn, 0, 1, sextract32(imm20, 31, 1));
>> +
>> +    stw_p(p, insn >> 16);
>> +    p++;
>> +    stw_p(p, insn >> 0);
>> +    p++;
>> +
>> +    *ptr =3D p;
>> +}



