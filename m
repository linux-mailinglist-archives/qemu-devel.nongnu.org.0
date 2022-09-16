Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806395BAFAB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 16:56:18 +0200 (CEST)
Received: from localhost ([::1]:47908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZClN-0002Ku-Hh
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 10:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZCfF-0006yG-2l; Fri, 16 Sep 2022 10:49:57 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:39921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZCfD-0006y5-79; Fri, 16 Sep 2022 10:49:56 -0400
Received: by mail-pl1-x634.google.com with SMTP id f23so5418482plr.6;
 Fri, 16 Sep 2022 07:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=Cc9sHu2/LbuOvpJmPx8KZ4L4SU0wr9IfsnBM4ucc7K4=;
 b=jyZas1iP+5Dq98iefCET3BXXZE63KjNYAutCW0m6yl0hGgZkXwk2vxbyc1ZTlOIK/9
 WGzYQSj/yAvyL/5MkVdn02WWFKoyX5SMu5JerTeDqDccfNwCVlucfRqGBafIqUYbWRLZ
 MLCNOqMgFeLOgLaAlOSCgXdD1o9PhoxD2JEyY+baau2OFcGz3Iy3MYgusoGeN+Mt50jy
 SrXKHIq7COBYV1D6IdUwJP8fU+/4F5jjba2rRd55bMkCIqPkN5x7gQPBgSTvX43yZjR7
 LOtle4+2A7v5PJFLdhUGsYdRFOkLmla0FosEs1sUIQ4USfUpOpRerHC9V549rPIFfI4i
 T07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=Cc9sHu2/LbuOvpJmPx8KZ4L4SU0wr9IfsnBM4ucc7K4=;
 b=zbZXtMiZ52GGdAfnpOql55jmUl7SV+Dd17I6dxi+Xt2Ke+2S6mGzaFMI8jW+XxqU//
 e3I5k465uMoJ7xHHG9pGueUyNI4YVccDgbzzbxbOmaij/aWTVjcfVHgckTR+2A5jXW/g
 OpRBDJmmUz39RU2ox4JLFFSOqmZFMNVrdevYkhUS5t1gSVaRY7Fzq8aq5HLB13n7oeBc
 Evsbw0eYnP856Y0i/piWNb1W8pqMvr6OHrNMM89ehuYD29CqHWXsSDreCzBffEwygOfx
 9gIvVVrprQz5GTxq5vXIYa7OmdHLARrlb95aAyk6yHDfV5GuIKk1/pIFsfSW3Mqa9q3G
 XECw==
X-Gm-Message-State: ACrzQf1LDYTC/Gg5k7wu2IYJloJOFL5OmnD3zScVsCBfJP6I3FSagKx6
 xhgGvLhW8mhWrZIh1pXikrw=
X-Google-Smtp-Source: AMsMyM53VeSWQo0lpOV+bMYlnLgXQZIAE+qn7Z7++KdcTevJUoxumml/tHtDZw6yHu1f2gMDBFLqKg==
X-Received: by 2002:a17:902:be03:b0:178:6f5d:e979 with SMTP id
 r3-20020a170902be0300b001786f5de979mr174636pls.163.1663339792855; 
 Fri, 16 Sep 2022 07:49:52 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b00176b66954a6sm14947923pli.121.2022.09.16.07.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 07:49:52 -0700 (PDT)
Message-ID: <6aebb38e-551e-e241-bda7-4b748e672c29@amsat.org>
Date: Fri, 16 Sep 2022 16:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 3/4] hw/intc/gic: use MxTxAttrs to divine accessing CPU
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-4-alex.bennee@linaro.org>
 <ab834948-3bd9-8e42-f13d-de0a3c573cf1@linaro.org>
In-Reply-To: <ab834948-3bd9-8e42-f13d-de0a3c573cf1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.816,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 15/9/22 10:16, Richard Henderson wrote:
> On 9/14/22 17:09, Alex Bennée wrote:
>> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
>> This solves edge cases like accessing via gdbstub or qtest.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
>> ---
>>   hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
>>   1 file changed, 22 insertions(+), 17 deletions(-)
>>
>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> index 492b2421ab..7feedac735 100644
>> --- a/hw/intc/arm_gic.c
>> +++ b/hw/intc/arm_gic.c
>> @@ -56,17 +56,22 @@ static const uint8_t gic_id_gicv2[] = {
>>       0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 
>> 0x05, 0xb1
>>   };
>> -static inline int gic_get_current_cpu(GICState *s)
>> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
>>   {
>> -    if (!qtest_enabled() && s->num_cpu > 1) {
>> -        return current_cpu->cpu_index;
>> -    }
>> -    return 0;
>> +    /*
>> +     * Something other than a CPU accessing the GIC would be a bug as
>> +     * would a CPU index higher than the GICState expects to be
>> +     * handling
>> +     */
>> +    g_assert(attrs.requester_cpu == 1);
> 
> Better without "== 1" -- this field ought to be boolean.

Boolean so far, but this could get more types (such DMA...).
Maybe we could already add an enum definitions, i.e.:

typedef enum MemTxRequesterType {
   MEMTXATTRS_CPU,
   MEMTXATTRS_MSI,
} MemTxRequesterType;

and name the field MemTxAttrs::requester_type.

