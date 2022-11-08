Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90F1620F37
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 12:37:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osMv3-0000LG-Cy; Tue, 08 Nov 2022 06:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1osMv1-0000Kc-Dg
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:37:27 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1osMuz-0004oj-Aj
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:37:26 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 74D3D32002E2;
 Tue,  8 Nov 2022 06:37:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 08 Nov 2022 06:37:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667907442; x=
 1667993842; bh=ZQepUu6dGgLNYptds7hbxCQDKTvjqwk1uBRhraJoqGU=; b=m
 /peKEmdHr8ZSCVm7FlLabXVJ8TgU3PqJx32e3mSM/iwxB3xIx74TbyPo6FPUm5zY
 BZavn+az5rlG2HMYnQM7qwv55jgM5hZvapALAJMSj84f+3HhXZnSnkrdfBItIrSl
 RFOEG//xUGqxHZuSm6SdfF7w4b4jZWYRVjQW4Yg955AgnXiX0ogb/vAlkh9dHleh
 caUDlRc8AVCHXKBvqV6X6b+rI/tHmg9B+L7RHhyvw5N+Bqsw18ZCfbS3WmzlH3ds
 YDkJLr+cnsQy8LRyKEvqB7s6xN5bhtT+dnN5bjWMzHJs2VahvIB7yFIcJgivpA+Z
 78XlqdQfMrHxLLYKgwJPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667907442; x=
 1667993842; bh=ZQepUu6dGgLNYptds7hbxCQDKTvjqwk1uBRhraJoqGU=; b=K
 i6zB4Fxn8Mmp1GrcKK8h8toOwoo3V4jiVHYmspZxXoiW2I4B71WvpHZvieMEdHHZ
 SHv7G3Wpl1Tm5EJpFa8GS7oWYo2eK0yowLyCD54w33STF3O6Of3BZ06N92jp+PvO
 tywO2J0olBDOWt1OjYGD/nh4Srd5T8koQUeE1DJ6fLpNVqhc89U4MdgNy4Us8fGh
 aiiGHpf1eenPvrwS3fMS8sd3q+dy3Ptiw+VJwHO7gMZ0AaDCsM/rL1dCK+vZT2bW
 PALo9jeNtProLN9xaopwUeMmCHHh10TQxF2b3PI3MgfcIi61qpkxjXGvYVnijoZx
 7U/h5rCz9gk+zQOacjzwQ==
X-ME-Sender: <xms:cT9qY9X42UqlcBdVFPVs3tUV9hUWSH20FZoz1rX_CMd6D-uGRVi6XQ>
 <xme:cT9qY9lssBb6VlytBM5M8BSuMxKsTd8ili6e5y36FVln8ZGXe91p-vKjqbOuGyaK-
 pAKn9KhMxDF3Ar7L8E>
X-ME-Received: <xmr:cT9qY5amVagSGOXDBCOTPt1dADrxg9TAplq3TEZUjDfwFu904r8F4jxCf7LGDmzv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedtgdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkffggfgfuvfevfhfhjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeduhfekvedvtdeukeeffefgteelgfeugeeuledttdeijeegieeh
 vefghefgvdefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:cT9qYwUeTosUlzReKD3j2TiOLKKWDY3fI-HR9wsQcHc9B33w1KTGJg>
 <xmx:cT9qY3kKG75MMCZ3nAq7xTbbdQ2lZQ2K9oO-mgWlm_s-PZXbxuMB4Q>
 <xmx:cT9qY9fHXlPSWwiGW1UcMv1oD6PdfhKyyS8CpSiRbZxZ6yAYgcC2Pw>
 <xmx:cj9qY_sExwbM1FbLACbJpTMFKbVSjtEjpGKYQDT0td2DWRVFsDUy8Q>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Nov 2022 06:37:21 -0500 (EST)
Message-ID: <2fa989d5-905c-f000-bfc3-f396c287ab10@flygoat.com>
Date: Tue, 8 Nov 2022 11:37:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] target/mips: Correct check for CABS instructions
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
References: <20221102165719.190378-1-jiaxun.yang@flygoat.com>
 <20221102165719.190378-2-jiaxun.yang@flygoat.com>
 <51a88376-98df-c328-f1ec-4dda482e9bb6@linaro.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <51a88376-98df-c328-f1ec-4dda482e9bb6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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



在 2022/11/7 22:35, Philippe Mathieu-Daudé 写道:
> On 2/11/22 17:57, Jiaxun Yang wrote:
>> Accroading to "MIPS Architecture for Programmers Volume IV-c:
>> The MIPS-3D Application-Specific Extension to the MIPS64 Architecture"
>> (MD00099). CABS.cond.fmt belongs to MIPS-3D ASE, and it has nothing 
>> to do
>> with COP1X opcode.
>>
>> Remove all unnecessary COP1X checks and check for MIPS3D availability
>> in decoding code path.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>   target/mips/tcg/translate.c | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
>> index e49d2a25a8..23e575ad95 100644
>> --- a/target/mips/tcg/translate.c
>> +++ b/target/mips/tcg/translate.c
>> @@ -1788,16 +1788,8 @@ static inline void gen_cmp ## type ## _ ## 
>> fmt(DisasContext *ctx, int n,      \
>> check_ps(ctx); \
>> break; \
>>       case FMT_D: \
>> -        if (abs) 
>> {                                                            \
>> - check_cop1x(ctx); \
>> - } \
>>           check_cp1_registers(ctx, fs | 
>> ft);                                    \
>> break; \
>> -    case FMT_S: \
>> -        if (abs) 
>> {                                                            \
>> - check_cop1x(ctx); \
>> - } \
>> - break; \
>
> I'm not sure we want to remove this check on all opcodes handled by
> the FOP_CONDS() macro, and for all architecture variants. Maybe we
> need to special-case CABS.cond.fmt?

Hmm if I read the code correctly COP1X check is only ran when abs is
set, and the only case abs is set is for CABS.cond.fmt.

>
>> } \
>>       gen_ldcmp_fpr##bits(ctx, fp0, 
>> fs);                                        \
>>       gen_ldcmp_fpr##bits(ctx, fp1, 
>> ft);                                        \
>> @@ -10424,6 +10416,7 @@ static void gen_farith(DisasContext *ctx, 
>> enum fopcode op1,
>>       case OPC_CMP_NGT_S:
>>           check_insn_opc_removed(ctx, ISA_MIPS_R6);
>>           if (ctx->opcode & (1 << 6)) {
>> +            check_insn(ctx, ASE_MIPS3D);
>
> You somehow revert commit b8aa4598e2 ("MIPS COP1X (and related)
> instructions") which is in use since 15 years.

Still no idea about why it is here in first place....
CABS.cond.fmt is even not mentioned in MIPS IV manual. So it's unlikely 
to have
anything to do with COP1X.

Thanks
- Jiaxun

>
>>               gen_cmpabs_s(ctx, func - 48, ft, fs, cc);
>>           } else {
>>               gen_cmp_s(ctx, func - 48, ft, fs, cc);
>


