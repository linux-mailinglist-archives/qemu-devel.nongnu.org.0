Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE4E4AB7FC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:55:56 +0100 (CET)
Received: from localhost ([::1]:38726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0kV-00025n-Fc
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:55:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzgP-0003bc-Nl
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:47:43 -0500
Received: from [2a00:1450:4864:20::429] (port=37658
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzgN-0001Z6-CZ
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:47:36 -0500
Received: by mail-wr1-x429.google.com with SMTP id w11so23374788wra.4
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 00:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZIdd+hD563SnX57nlRZyeyxqHIzIThv5hcz5CXxWC6Y=;
 b=XYQnMLedoiW/VU4J6Zg1m3AkVbAUx5/SkViIDqfdnIX4zNlqSgKaW7rMAXC0eLUgtl
 AjEfTsCx1g2WhGQJaypPfHgP09PF1GLew/XY2sU1ehW+1QavrnO/CaJzdrB9TdRGRqeN
 6fjKMmWYjatT7/bG4tp31g1JpKlfoaflFrZ3R5fojT/+Fo+cF/FkLeDDwLYXVSbjJ3XC
 CWMvHH+39x6aeX+NGMnzktsJXmpzAnqC0HmSkTexVgOqaeYhXJgjyNJme7GjsMWxMPbY
 PZjc8n93lPb+H9Ol42Fz59YTSQfL8oBFqu5XzaaQsw36nNm9Qtea0nkS+dbYbGyMiCgi
 ZFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZIdd+hD563SnX57nlRZyeyxqHIzIThv5hcz5CXxWC6Y=;
 b=aJQX8Yaa21yfBaRHXZsk2DOVDHXpawvFCfAJ2NEkAZ1dfz9AGLWDNQLUGZZkWg8t5P
 e+KHVdE4twPdulu48mg/kyEQ98YZvt6GZpcImtRCWyopGU8Ny38BJhRdTBZGjYW+hrDa
 /7f1AiXF8THvgbKTXkmWYAhrwHfB1K70wyT33aIEvb663IpVW6BcSbI8I6xB9wib2Zhu
 rc/HnJvAz9fKqrC1Uh5ClE5quiICi3IOueBIgEbsZtE6bO4FjvD1wDWXiIylwmwijJ6j
 WOKyEaVOxuiZhFG8cXptjFMhkpNFp+c+ypZbrrOSBEr2xPcs4KUSB2TEsOVVXsZv2YGt
 K4QQ==
X-Gm-Message-State: AOAM532PhUuBylKjRe1ySNDNDOEfOcIaAUTy4tUEUXcMHjr3aStCEeeD
 WY/OLxwVPweM/arxsraXwu4=
X-Google-Smtp-Source: ABdhPJzfqTWE68aw73WxZwJynZvDb6ycm7Wdn7Bq+JrVGcQaj1Bh782cRbuQLNqIAvud81Y768/nFA==
X-Received: by 2002:adf:da46:: with SMTP id r6mr9105130wrl.71.1644223632988;
 Mon, 07 Feb 2022 00:47:12 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id q13sm9443547wrd.78.2022.02.07.00.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 00:47:12 -0800 (PST)
Message-ID: <5b374877-937f-d127-646f-47289690ad90@amsat.org>
Date: Mon, 7 Feb 2022 09:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v4 4/4] hw/i386/sgx: Attach SGX-EPC objects to machine
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-5-f4bug@amsat.org>
 <20220207093752.7503b6cb@redhat.com>
In-Reply-To: <20220207093752.7503b6cb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/2/22 09:37, Igor Mammedov wrote:
> On Sat,  5 Feb 2022 13:45:26 +0100
> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> 
>> Previously SGX-EPC objects were exposed in the QOM tree at a path
>>
>>    /machine/unattached/device[nn]
>>
>> where the 'nn' varies depending on what devices were already created.
>>
>> With this change the SGX-EPC objects are now at
>>
>>    /machine/sgx-epc[nn]
>>
>> where the 'nn' of the first SGX-EPC object is always zero.
> 
> yet again, why it's necessary?

I'll defer that question to Yang & Daniel.

>>
>> Reported-by: Yang Zhong <yang.zhong@intel.com>
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/i386/sgx.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
>> index a2b318dd938..3ab2217ca43 100644
>> --- a/hw/i386/sgx.c
>> +++ b/hw/i386/sgx.c
>> @@ -304,6 +304,8 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>>       for (list = x86ms->sgx_epc_list; list; list = list->next) {
>>           obj = object_new("sgx-epc");
>>   
>> +        object_property_add_child(OBJECT(pcms), "sgx-epc[*]", OBJECT(obj));
>> +
>>           /* set the memdev link with memory backend */
>>           object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
>>                                 &error_fatal);
> 


