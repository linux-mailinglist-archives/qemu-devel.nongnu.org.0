Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B90C5380DA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 16:27:17 +0200 (CEST)
Received: from localhost ([::1]:33172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvgMW-00013C-Ey
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 10:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgDA-0006C7-4v
 for qemu-devel@nongnu.org; Mon, 30 May 2022 10:17:36 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfzS-0003gY-5H
 for qemu-devel@nongnu.org; Mon, 30 May 2022 10:03:27 -0400
Received: by mail-pg1-x530.google.com with SMTP id e66so10226253pgc.8
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 07:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7hvxTJ99l4INuE29lawaNujKBhlVAzGeSSqOh8Do6F8=;
 b=UM4dH5NPI/vWqhPCRmVFoVYWbYsOYImFKqQd2ravkOPAU7KanVddvCU7162YeMMZWU
 zfCzVPYJEX/W76d2bHC/YZcSaDvED0A39tsq8gStqfVLWtgdl1uqaUPout1hFbrMUpMw
 PP7ruHvGz2RS+9mpqKuiQ/e4YYbShonEUNzPdPARdbaAtRnm82kM0X7gksm2vu6koH6C
 S/PNe6DQn53Tpms8Et1UkIdb+9oIXHghXY+fj/LWdA3Br0rnNAgRPj+sYJtURzhTyQSI
 imVwX6AcZ5eauszUlIJFXzQ40klr9jTba0FKEdILqnF2uZyz2DTpbSOnczKNoa1mV2gs
 TjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7hvxTJ99l4INuE29lawaNujKBhlVAzGeSSqOh8Do6F8=;
 b=COhdInZHH10m/gE6I/YPxtxKu2sx5SsuxpGmAZ8VKB1R2xhOM3DGI1oz1Qm76vGOCO
 BEqQxGcAKPcoRpobP9pKYj0zZbafSHbfQo1szoSNR7VujysZE4nRCvdYWd8GAYF33dMT
 fW/Jkl2A19VntBNk4+PJMdQoCqw46fmXG6oJIdN5Yd+oqguvCiO30m/vXfQPytaJ3wJh
 /K7t8AiOXPfo6PrOsM9R99ruNGjMnSoFur9hWKK5fgIL0q/QXVGdl+2zMqwVylihkadA
 ajLiT0DhMY9yc7mpQB7ANtxtASGiXDv4ci8LCqyOH/TQvlkxe16LUVHJR55RR2laYLxx
 KpEw==
X-Gm-Message-State: AOAM531pakb2MXhEmC7DClGTQeK6bhERfmB6cBAQ1W76fQaRIcxplSoq
 XOKxWIMTBJzkg/O4cnlm27I=
X-Google-Smtp-Source: ABdhPJxuOcqGCcCqn8LCl7FUevbOa/tzSRbYLjVR2TlfGJrB1cjNJVUEfUUJ9pvclN7T+4wpOGlqtQ==
X-Received: by 2002:a63:68c4:0:b0:3fb:984f:6779 with SMTP id
 d187-20020a6368c4000000b003fb984f6779mr16009190pgc.444.1653919403776; 
 Mon, 30 May 2022 07:03:23 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l64-20020a638843000000b003fc439410f1sm302238pgd.94.2022.05.30.07.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 07:03:22 -0700 (PDT)
Message-ID: <6f9b4cc9-2d3d-7a6f-8d76-bfc9b940cb9a@amsat.org>
Date: Mon, 30 May 2022 16:03:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 3/4] target/mips: Fix msa checking condition in
 trans_msa_elm_fn()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 nihui <shuizhuyuanluo@126.com>, qemu-devel@nongnu.org
References: <20220503130708.272850-1-shuizhuyuanluo@126.com>
 <20220503130708.272850-3-shuizhuyuanluo@126.com>
 <9724000f-6a78-36ad-5a39-1d2b2298a919@linaro.org>
In-Reply-To: <9724000f-6a78-36ad-5a39-1d2b2298a919@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 3/5/22 17:12, Richard Henderson wrote:
> On 5/3/22 06:07, nihui wrote:
>> From: Ni Hui <shuizhuyuanluo@126.com>
>>
>> Fix issue that condition of check_msa_enabled(ctx) is reversed
>> that causes segfault when msa elm_fn op encountered.
>>
>> Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
>> ---
>>   target/mips/tcg/msa_translate.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/mips/tcg/msa_translate.c 
>> b/target/mips/tcg/msa_translate.c
>> index aa45bae0aa..92ccc6f921 100644
>> --- a/target/mips/tcg/msa_translate.c
>> +++ b/target/mips/tcg/msa_translate.c
>> @@ -599,7 +599,7 @@ static bool trans_msa_elm_fn(DisasContext *ctx, 
>> arg_msa_elm_df *a,
>>           return false;
>>       }
>> -    if (check_msa_enabled(ctx)) {
>> +    if (!check_msa_enabled(ctx)) {
>>           return true;
>>       }
> 
> Cc: phil
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Clearly this path is not exercised in TCG tests.

Ni, could you contribute tests for the ELM MSA opcodes?

Fixes: 2f2745c81a ("target/mips: Convert MSA COPY_U opcode to decodetree")
Fixes: 97fe675519 ("target/mips: Convert MSA COPY_S and INSERT opcodes 
to decodetree")

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Queued.

