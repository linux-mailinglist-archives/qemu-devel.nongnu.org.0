Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A4763F446
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 16:39:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ler-00044Y-0q; Thu, 01 Dec 2022 10:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0lem-00043v-2K
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 10:39:24 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0lek-0003W4-DO
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 10:39:23 -0500
Received: by mail-wr1-x432.google.com with SMTP id bs21so3314146wrb.4
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 07:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s1QvPMf6zklcf0kCZd/0BAxvn5jVsg2jWLQcMeHqJoc=;
 b=STsZCRm2QaSjbLuCknzC7X3emj4TqQxoo63OBdQTeOgX0uIACTPlFAsVckWjdnTGZm
 05rmLEDl6le6DNJD0FO77cG2d4dpD1gcP7AARXdWEpM277rhi9miS9iCn5wqfq2EZB/h
 78t9LjZFcTuodGCOmVU66LAivgCjral1oAlwrkHOR1pnksQiNnYeusEwXzNrn6rPVFs6
 5XqFjTKGJfEumJ5HJrM4Qv/j8Nn0qCzjKodPDb7W3/y7MG3/cs25A1EtjHaaSx6f7w6P
 mz/JFQbizRSOPqh4Pvk49VikyLQkCvbDfBdYoo3G8+Hnr6YAVpOYUrMGgd1WhAqhHFsB
 exLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s1QvPMf6zklcf0kCZd/0BAxvn5jVsg2jWLQcMeHqJoc=;
 b=bPmUE7ZmpCUaXBVGfLDGylR/cOGvoskJ2CNKJzGDPI7uI6OkMNHVmlj7MapnmENr+N
 bKX2KkILnmf04M0CVlp/KzTm9Wc6LXNzIfy7v6Oc6TgLEQsH6PVXYVuxJF4smRtwj8uV
 lmIqbWnp4ayeQ8ik9jY/sPE+akURlCDlfSpSjnyV+knc+1MXGPlDRHoZx/AYJj04itad
 QpTDAUXJZSEWhQdXFYCTRJpALGdvQQ1Qf7tDKZMIK+5aXeqgayz5/HE8mC3JFobYxBqQ
 VQKM34XrwWzFFklpVmgs783juaHAzbQjgCskuhroN5CPVIxm31Nf+EQndk5FAeTxUEng
 oO6g==
X-Gm-Message-State: ANoB5plVobIiYmw0tgK0Em480bJl+oe+6mUBTXGkXWpTnPjwQprDQzrk
 uGTe22LibkjkOkRP7p5jl0bOng==
X-Google-Smtp-Source: AA0mqf6h1c0EgUrByTegp04DKJkquRNlwMh56IKH4JfHKHUBEL/Hlr9POfSSsifeFaBluqUiaavbjQ==
X-Received: by 2002:adf:ff87:0:b0:241:db60:918a with SMTP id
 j7-20020adfff87000000b00241db60918amr7059305wrr.311.1669909160570; 
 Thu, 01 Dec 2022 07:39:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c351400b003b47ff307e1sm6333774wmq.31.2022.12.01.07.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 07:39:20 -0800 (PST)
Message-ID: <74800fdc-4fec-51b1-1076-07d2eccabc6e@linaro.org>
Date: Thu, 1 Dec 2022 16:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH-for-8.0 1/2] target/s390x: Replace TCGv by TCGv_i64 in
 op_mov2e()
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: Alessandro Di Federico <ale@rev.ng>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Anton Johansson <anjo@rev.ng>
References: <20221130163436.87687-1-philmd@linaro.org>
 <20221130163436.87687-2-philmd@linaro.org>
 <0aefeeb53c2b4297b9dc55ed53f45d2aa9b787c0.camel@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <0aefeeb53c2b4297b9dc55ed53f45d2aa9b787c0.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 1/12/22 13:36, Ilya Leoshkevich wrote:
> On Wed, 2022-11-30 at 17:34 +0100, Philippe Mathieu-Daudé wrote:
>> Although TCGv is defined as TCGv_i64 on s390x,
>> make it clear tcg_temp_new_i64() returns a TCGv_i64.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/s390x/tcg/translate.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/s390x/tcg/translate.c
>> b/target/s390x/tcg/translate.c
>> index 1e599ac259..a77039b863 100644
>> --- a/target/s390x/tcg/translate.c
>> +++ b/target/s390x/tcg/translate.c
>> @@ -3335,7 +3335,7 @@ static DisasJumpType op_mov2(DisasContext *s,
>> DisasOps *o)
>>   static DisasJumpType op_mov2e(DisasContext *s, DisasOps *o)
>>   {
>>       int b2 = get_field(s, b2);
>> -    TCGv ar1 = tcg_temp_new_i64();
>> +    TCGv_i64 ar1 = tcg_temp_new_i64();
>>   
>>       o->out = o->in2;
>>       o->g_out = o->g_in2;
> 
> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
> 
> It looks as if besides sparc and s390x there is one occurrence of this
> in alpha?
> 
> $ git grep -w TCGv | grep -w tcg_temp_new_i64
> target/alpha/translate.c:    TCGv tmp = tcg_temp_new_i64();

Oh I missed it, thanks!

