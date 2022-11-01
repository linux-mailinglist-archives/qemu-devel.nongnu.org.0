Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677996146A9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 10:29:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opnZ7-0003wO-A1; Tue, 01 Nov 2022 05:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opnZ0-0003vU-Qs
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 05:28:06 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opnYy-0005cM-Cq
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 05:28:05 -0400
Received: by mail-wr1-x436.google.com with SMTP id l14so19323389wrw.2
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hBRktG0netiEsWGozMVwlQ/HVuI2W9FAZgUMPwPfDZg=;
 b=JAJSKcJxu7Ig9jJOQ2s9qS+CWGXhXu4KJ/hfdI+e9OFOsFV2wyzUTY3ohdY11Axe6x
 gxSFQffpIqg2vTMIUKMuQMsHmN0NSsQoQDOVq5uVggDAkARP3Bt9i0vWj75T/U/E4MZ3
 /gMVhjuk4DzQqBqH+zOFDbhGBCApjMwtYLZbJrYNDsyo70IQeN1QIzTf7OsE89ue0AZJ
 uxTS+eX1xu08FjY8IeHu8rAIcE4yBMcEIeQ003LayPfthnfUToj6LQjAnF41vTLQEzWq
 l/hJf5/Y+NJx7t3DiSM5Hnz8GliGPD4DGHpoJfbWyV1XhPCdDiNfYypUYUnwtHB2c5RW
 OVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hBRktG0netiEsWGozMVwlQ/HVuI2W9FAZgUMPwPfDZg=;
 b=6cbk5lqhnbUV2/A+89noLpe0LxbBVS1ZIIxS+TpQPTn/ElE2Kd37qyxyDFtYn5AE9v
 rJSf7xZ6tYDCUPxeaK1FTP/Jqtax+reMteS3rYA5mEWnMfS/tu4dPBB2xit5qAUIos0f
 nWl0DkRo09EfOzDvKi4ulv3nlB2GEo//YrM+bqHlDTpV57mix28Kokz9EXfXDTDg8Psa
 RCkMR0ERF7NmyBYd6slUNvQXvfe7Kkhenl4Jp11WzUMJDZmCJkvJIWa+wFZ6IBqvBvPW
 +IUZ9YNYfpukNN10ayiLbovBwr8RsdJkmAw+Q69byOr8jnrD2XZuZyLEZvaqcUnDa0GK
 DaeA==
X-Gm-Message-State: ACrzQf2X4IT6v4z2Sm//qqbAhqxY1PVncLpSg63298oksoOlBjuLVZw9
 afFSgUw8kgXlaOTFWFF1++VktA==
X-Google-Smtp-Source: AMsMyM5jSe9Z5JLWKwnokKYnm/kgiTl5U6rWcaNtX2g8GEaSq3W3k8qyag2Q4EhdQ6sldRTAKtH7Lw==
X-Received: by 2002:a05:6000:1841:b0:236:70db:20c9 with SMTP id
 c1-20020a056000184100b0023670db20c9mr11391500wri.671.1667294882191; 
 Tue, 01 Nov 2022 02:28:02 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t12-20020adff60c000000b002366ded5864sm9377974wrp.116.2022.11.01.02.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 02:28:01 -0700 (PDT)
Message-ID: <3584ab7a-7a0f-753b-ea5a-c6e9bc546d0c@linaro.org>
Date: Tue, 1 Nov 2022 10:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v3 16/24] disas/nanomips: Remove IMMEDIATE functions
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com, Thomas Huth <thuth@redhat.com>
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
 <20220912122635.74032-17-milica.lazarevic@syrmia.com>
 <78553699-00c1-ad69-1d58-02f75a1f4fe3@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <78553699-00c1-ad69-1d58-02f75a1f4fe3@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 1/11/22 09:28, Stefan Weil via wrote:
> Am 12.09.22 um 14:26 schrieb Milica Lazarevic:
>> Both versions of IMMEDIATE functions have been removed.
>>
>> Before this patch, we'd been calling img_format twice, the first time
>> through the IMMEDIATE to get an appropriate string and the second time
>> to print that string. There's no more need for that. Therefore, calls to
>> IMMEDIATE are removed, and now we're directly printing the integer
>> values instead.
>>
>> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
>> ---
>>   disas/nanomips.cpp | 756 ++++++++++++++++-----------------------------
>>   1 file changed, 265 insertions(+), 491 deletions(-)
>>
>> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
>> index 816155527d..441204bb84 100644
>> --- a/disas/nanomips.cpp
>> +++ b/disas/nanomips.cpp
> [...]
>> @@ -3305,11 +3271,9 @@ static char *CACHE(uint64 instruction, Dis_info 
>> *info)
>>       uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
>>       int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
>> -    char *op = IMMEDIATE(op_value);
>> -    char *s = IMMEDIATE(s_value);
>>       const char *rs = GPR(rs_value);
>> -    return img_format("CACHE %s, %s(%s)", op, s, rs);
>> +    return img_format("CACHE 0x%" PRIx64 ", %s(%s)", op_value, 
>> s_value, rs);
>>   }
>> @@ -3329,11 +3293,9 @@ static char *CACHEE(uint64 instruction, 
>> Dis_info *info)
>>       uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
>>       int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
>> -    char *op = IMMEDIATE(op_value);
>> -    char *s = IMMEDIATE(s_value);
>>       const char *rs = GPR(rs_value);
>> -    return img_format("CACHEE %s, %s(%s)", op, s, rs);
>> +    return img_format("CACHEE 0x%" PRIx64 ", %s(%s)", op_value, 
>> s_value, rs);
>>   }
> 
> Do we really want to format "int64 s_value" as a string? The code now 
> has lots of wrong format strings. Add the patch below to get the 
> compiler report.
> 
> We once had a discussion about using G_GNUC_PRINTF for local functions 
> or not. I think that this example clearly shows that it should be 
> mandatory.

Yes. The problem here is nobody wants to maintain this code, but we
inherited it. IIUC this series doesn't make it worst, it just remove
the C++ dependency on UNIX-based hosts.

> Regards,
> Stefan
> 
> diff --git a/disas/nanomips.c b/disas/nanomips.c
> index 9647f1a8e3..c875818cb9 100644
> --- a/disas/nanomips.c
> +++ b/disas/nanomips.c
> @@ -95,7 +95,7 @@ typedef struct Pool {
>   #define IMGASSERTONCE(test)
> 
> 
> -static char *img_format(const char *format, ...)
> +static char * G_GNUC_PRINTF(1, 2) img_format(const char *format, ...)
>   {
>       char *buffer;
>       va_list args;
> 


