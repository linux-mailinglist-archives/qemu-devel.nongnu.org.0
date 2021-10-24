Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2667A4388E7
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 14:49:38 +0200 (CEST)
Received: from localhost ([::1]:43534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mecwS-00087w-Pk
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 08:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mecva-0007Ti-GC
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 08:48:43 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mecvY-0003SA-QK
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 08:48:42 -0400
Received: by mail-wm1-x32a.google.com with SMTP id j205so7217646wmj.3
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 05:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t4wgQT8A6B1GQ8QXwoMfjVxlDwgA/Cx/FKVYo4Rtzxk=;
 b=hY/6i9a9tqRqejolOZ9Sqi7UuAbamdl6Svzw9Iq1gBgLbdGN0Vhz0u1GSRY30dt9ly
 ZYB/TgKQvbP9WPd7szzL5DM8l7UenUcXEDI6u4mqlqD/4HRgO70IAE31P0rVLr1Azm80
 DpkzrpO7GtwZFdcDJ9cmuKvFtE9PYx7fWwOdeOCFDql2c6ZlRvIYyMdZtN6UbEh+Z7Ng
 FU25o8PiM+cUt/uXttVRvGywQBaBwzua0Bde2TTAGNRbYeyPZ6ES2tBZ+0Scpx82afR/
 oFhfbatzPKU41ZAxm+ivIHbs1Xd8TRQAzca9JshbchuLeajdeukDHoKhsGlewydtjEpo
 SoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t4wgQT8A6B1GQ8QXwoMfjVxlDwgA/Cx/FKVYo4Rtzxk=;
 b=c1z4lz9a2+Pu5zR8n1e1g/Y2OJ9qujszrfOXJo17nasd2VLNRT3I1gp2W0XbNt2Euw
 XdzhRptjQfJD3PxJCcJfVf+JVHQYHAuQyCnZHDPT7yAIugLOVUA9jCPOpeozPF4WfBrG
 eb7y4hlfa7/w4aBROnL8rwm2GlDAVeXweP7SypMJcBEzsr4P+XFonUQ1A0LC8vOPze04
 8bkRy6Eu7G9eCkzqHJJUbxk9fRg9RvwPeX6rybTzM5rPwlHyj8BuK8avu2cJj3QC40Mv
 0KIIU/+wLl1XFRgNo2cCDFrZ6tpwBIFWhxIkbvXZSyYylGwv0ZmWQUn1K8fNnRcA8aRn
 Wvig==
X-Gm-Message-State: AOAM530HdVIUHF7uTwnnMQ2urPH3MLXqGOB3qdDWsCTZ77lwdhObPDEX
 njaENZXk9lTwXl5HSyhX6iQ=
X-Google-Smtp-Source: ABdhPJycC2kuWk6OZ9pkQigBMeh7dcP/diL5GORf8C77cd6RwaSw5ysghoqMkNWDqDCGGRlyWRsEJg==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr13372912wmb.150.1635079718804; 
 Sun, 24 Oct 2021 05:48:38 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id w10sm8798103wrq.88.2021.10.24.05.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 05:48:38 -0700 (PDT)
Message-ID: <e567c95c-721f-f5fe-2b9b-513afbc6d4d3@amsat.org>
Date: Sun, 24 Oct 2021 14:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 05/33] target/mips: Have check_msa_access() return a
 boolean
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-6-f4bug@amsat.org>
 <74244c26-78e6-da58-6a84-b0538567d8e8@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <74244c26-78e6-da58-6a84-b0538567d8e8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.33,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/24/21 03:02, Richard Henderson wrote:
> On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
>> Have check_msa_access() return a boolean value so we can
>> return early if MSA is not enabled.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   target/mips/tcg/msa_translate.c | 20 +++++++++++++-------
>>   1 file changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/target/mips/tcg/msa_translate.c
>> b/target/mips/tcg/msa_translate.c
>> index 3ef912da6b8..9e0a08fe335 100644
>> --- a/target/mips/tcg/msa_translate.c
>> +++ b/target/mips/tcg/msa_translate.c
>> @@ -293,19 +293,19 @@ void msa_translate_init(void)
>>       }
>>   }
>>   -static inline int check_msa_access(DisasContext *ctx)
>> +static inline bool check_msa_access(DisasContext *ctx)
>>   {
>>       if (unlikely((ctx->hflags & MIPS_HFLAG_FPU) &&
>>                    !(ctx->hflags & MIPS_HFLAG_F64))) {
>>           gen_reserved_instruction(ctx);
>> -        return 0;
>> +        return false;
>>       }
>>         if (unlikely(!(ctx->hflags & MIPS_HFLAG_MSA))) {
>>           generate_exception_end(ctx, EXCP_MSADIS);
>> -        return 0;
>> +        return false;
>>       }
> 
> When we return false, we have raised an exception.
> 
>> @@ -354,7 +354,9 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int
>> wt, int s16, TCGCond cond)
>>   {
>>       TCGv_i64 t0;
>>   -    check_msa_access(ctx);
>> +    if (!check_msa_access(ctx)) {
>> +        return false;
>> +    }
> 
> ... which means that here we should return true, meaning that we have
> recognized the instruction and emitted some code for it.  In this case:
> we have recognized that the instruction is valid but not enabled.
> 
> Otherwise, we will return to decode_opc and (eventually) emit another
> gen_reserved_instruction.

Yes, this is what I intended to do. I incorrectly copied/pasted 'false'
then it spread all over the file. Thanks for catching this.

