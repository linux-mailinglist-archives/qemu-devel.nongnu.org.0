Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49D65B0EFE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 23:13:34 +0200 (CEST)
Received: from localhost ([::1]:36438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oW2MX-00067U-Eu
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 17:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oW2L1-0004kL-HQ
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 17:11:59 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oW2Kz-00040C-Un
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 17:11:59 -0400
Received: by mail-wr1-x436.google.com with SMTP id e16so3262095wrx.7
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 14:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=dozdF4efgjNNqGN8j+SEuB2HLyk2Mw3dgEUCe5TN01U=;
 b=vZl6w68OvnBvz6hY5TqxqlnYDvAippqWyt2NDwWsDB+bcStyz2tlNgPYNUC1WegPYV
 oHNF8ZKrZNSGfODUeogWE1pac1SuvctWegOux0xQnMK15++rK6OTIzPtPsdcEkygu7sl
 JEJCoDQY7G0LhmguZWeyy6yHmQLw5UJ+ux5HHve92FhU60/J7TUpB5DPdRBdsn0NZ5ZC
 fS4Tqe62ud7hFUHO42ANIN049evh0TB9JjAeVlRROyCszL04sy0Xs2M3SBO1Mxdc3hac
 vAJVa+KfTlnU56BRAIOzzTNBqAQPWwrncLh0Ko7pmG8yXD/sKSXcVgBFcarwav3Vo9V5
 wAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=dozdF4efgjNNqGN8j+SEuB2HLyk2Mw3dgEUCe5TN01U=;
 b=W5eNmJt4YFLPjiWOKFIvlECu1pcp46h/vTUN55PPt9BJFQ60SkQW7oaWHqKaQkYLgH
 iWAItPm10Y4AkclI3oxZw4LS9eIB/dREulX6MxqMujL3jn3/dPYy/G/ojVlJIk0LderM
 A94w5PGgOmwXI9/b9V6IcJlDzjo0shdOeA4JCgPok9xaSkOiw3H9jhsboxJPlu0rjXIC
 rqVf82NY7o0pbAL72SqtfMA5dssgaedbYriKpBf+IgTsDqjT2mwFftXZrO/XX7ADHLM4
 Iu64cmCIKPIHP4brMoxnVXI/Cb5eFfonjqCOUYY51wVNVymUVBxTIaMG8aNGUcQSxXTF
 LaLQ==
X-Gm-Message-State: ACgBeo2h7Bt0pqn5FpXCC4K3XOL9x+vpcRYBZ/+KeF4xRrKnZVGSYqqG
 QO4PqrNttcwLiScjsOIgQzf/ag==
X-Google-Smtp-Source: AA6agR6oIt02vxuf1Il3BJzjBK1X31DyjdeIcDt12QltQGU16SYb7P+RGqEpexl6MlxzZppBYQYy/Q==
X-Received: by 2002:adf:ea4a:0:b0:228:635a:d491 with SMTP id
 j10-20020adfea4a000000b00228635ad491mr3309222wrn.137.1662585115728; 
 Wed, 07 Sep 2022 14:11:55 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.20.57])
 by smtp.gmail.com with ESMTPSA id
 w14-20020adfd4ce000000b00228de351fc0sm6652360wrk.38.2022.09.07.14.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Sep 2022 14:11:54 -0700 (PDT)
Message-ID: <abbe795a-997f-3f2f-2372-7679950777dd@linaro.org>
Date: Wed, 7 Sep 2022 22:11:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Hexagon (target/hexagon) implement mutability mask for
 GPRs
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, Brian Cain <bcain@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20220901212931.27310-1-bcain@quicinc.com>
 <SN4PR0201MB88086141CEDBE5911BD2324BDE7E9@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <SN4PR0201MB88086141CEDBE5911BD2324BDE7E9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/6/22 23:26, Taylor Simpson wrote:
>> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c index
>> 8a334ba07b..21385f556e 100644
>> --- a/target/hexagon/genptr.c
>> +++ b/target/hexagon/genptr.c
>>   static inline void gen_log_reg_write(int rnum, TCGv val)  {
>> -    tcg_gen_mov_tl(hex_new_value[rnum], val);
>> +    const hexagon_mut_entry entry = gpr_mut_masks[rnum];
>> +    if (entry.present) {
>> +        gen_masked_reg_write(hex_gpr[rnum], val, hex_new_value[rnum],
> 
> You can't write to hex_gpr here.  You have to wait to make sure the packet will commit.  Put this result back into val and do the mov to hex_new_value unconditionally.

The feedback, then, is that the operands are confusingly ordered -- the output is to 
hex_new_value.  Brian, tcg functions generally list outputs first.


r~

