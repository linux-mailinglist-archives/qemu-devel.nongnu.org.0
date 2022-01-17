Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BF249085F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 13:13:04 +0100 (CET)
Received: from localhost ([::1]:35076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Qsh-0007MY-V1
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 07:13:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9Qo4-0004gn-NV
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 07:08:17 -0500
Received: from [2a00:1450:4864:20::334] (port=41711
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9Qo0-0004Lz-S5
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 07:08:16 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so22213458wme.0
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 04:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/2WdEKJX4cuNWWFPKfuzZ+4MRScyZrGq4iJDtRDmcLI=;
 b=Q4j507vy8dXwH1C/F1FWF/atrRIlhJ6JY/UHY7N8ZQfzI6/17PcjI1paW7NqHIdRV2
 SJUN2CHfYy8ldK3OQ9pGOs4qDA5O2fEpP6Y37+aJYlC5BrwkmH2eee26oH5bVmYwJm49
 hKvVmhJbZ3JzTLwfBUt1Q4TY+M420Kv1JRJ7KNupXO7rWoFS8A+XESgW5IAK00givGxV
 KR/oPp+5GuhCvNCtaTdRIskYFkQqSuIaKEN5DjxPMg/epDYA8pDp1fGawZXkLHM3ASv+
 uXPtdYGAy6Q9ZK1S32Gi3MH4EsU+AGmR2isC9xXCryrlzUF+evXiN55Ln5KNMkK1kfkE
 JbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/2WdEKJX4cuNWWFPKfuzZ+4MRScyZrGq4iJDtRDmcLI=;
 b=b4W1K9IFCFuvdHAfZeSGzBpD5XAjs9CMvOh0xyLBFQbF5bjtnuBMHcXingstW1GGxa
 QG2rbJhXoYE4bvlxfvOdwwhUKgpWRn8GgAu4RROWvOvFSkjtOq1pbZv7GOq7tZfpRE9l
 7cDswnD+lnAg2KoFkIyQqc0bP2Q1Iv1RN2frSKiIRCEpO7DQTGd+Cn0JOFwnyfAR68is
 hrcuFIS7n27evDZ223lDJUhaUKYjH+V9pnR95dyFbTo3Olfu0/rlIzA+dB0YDR6OXtai
 wot+ghRfr1Kuh2Pge6BmJi0qhWpzjj7W4U0g/4gAMIPXxL8p54esTsckeflmoQN2qpH9
 w6dw==
X-Gm-Message-State: AOAM532Rqd38jmmk15StI+gsW9qAx0+gQLoyQKVIEUU2hhsYGXVtvGO5
 Y2AQXbRxE0T10GxiTOSauoE=
X-Google-Smtp-Source: ABdhPJwTfLShAtXvHIXLDe3pqxQ0x6dnQG8Kl3LVSEqZocATs83NRC4VrHbBxQJ/R7RLDsbka37oCw==
X-Received: by 2002:adf:e312:: with SMTP id b18mr13737524wrj.321.1642421288139; 
 Mon, 17 Jan 2022 04:08:08 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id b14sm6424181wri.62.2022.01.17.04.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 04:08:07 -0800 (PST)
Message-ID: <f9423310-4385-89cf-d8f1-eae7b9f9dcbb@amsat.org>
Date: Mon, 17 Jan 2022 13:08:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 2/2] hw/i386/sgx: Attach SGX-EPC to its memory backend
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220116235331.103977-1-f4bug@amsat.org>
 <20220116235331.103977-3-f4bug@amsat.org>
 <c1a8eba5-b1a1-bbcf-c237-23e16ce88475@redhat.com>
In-Reply-To: <c1a8eba5-b1a1-bbcf-c237-23e16ce88475@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/17/22 12:48, Paolo Bonzini wrote:
> On 1/17/22 00:53, Philippe Mathieu-Daudé via wrote:
>> We have one SGX-EPC address/size/node per memory backend,
>> make it child of the backend in the QOM composition tree.
>>
>> Cc: Yang Zhong <yang.zhong@intel.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/i386/sgx.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
>> index 5de5dd08936..6362e5e9d02 100644
>> --- a/hw/i386/sgx.c
>> +++ b/hw/i386/sgx.c
>> @@ -300,6 +300,9 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>>           /* set the memdev link with memory backend */
>>           object_property_parse(obj, SGX_EPC_MEMDEV_PROP,
>> list->value->memdev,
>>                                 &error_fatal);
>> +        object_property_add_child(OBJECT(list->value->memdev),
>> "sgx-epc",
>> +                                  OBJECT(obj));
>> +
>>           /* set the numa node property for sgx epc object */
>>           object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP,
>> list->value->node,
>>                                &error_fatal);
> 
> I don't think this is a good idea; only list->value->memdev should add
> something below itself in the tree.

OK, I see.

> However, I think obj can be added under the machine itself as
> /machine/sgx-epc-device[*].

OK. It is hard to understand the difference between /unattached and
/machine.

Thanks for the review,

Phil.

