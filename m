Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0196F4A5372
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 00:42:50 +0100 (CET)
Received: from localhost ([::1]:59636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEgJt-0001k0-58
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 18:42:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgIL-000145-Og
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:41:13 -0500
Received: from [2607:f8b0:4864:20::102f] (port=33433
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgIJ-0001Kl-Ta
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:41:13 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 g11-20020a17090a7d0b00b001b2c12c7273so846443pjl.0
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 15:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hoHA0jnpbenk0L1wCxXnTJA6EPgG69AgIZOxa5K/Ypw=;
 b=TY5QZ3wlGz5jF976m8VM9kmG0+n6NMa4xpOoSeYXirw7hKHCdbMQoGdwM8T05vLKlQ
 KDEzVj2Pds0FobIWdeAle/DcmmJZTaFrOkV+2gYa4KlVlrzf8hGeKkvWEe15u54cJWwU
 QsAB2TMVcmhsUbTErnblMoHhMXUxhonrBn9yY1o2efFm/NnaS6tC/vLldYuid89fiQ0A
 n4rkQ2dfeUH6GQZDlvuz0NS3FyMtYrWOEWc3Q3FOokxKT74QqW29P7KBL/HsinGx5qeh
 4Cjqj2wZCqbjPtuwJJfQi36v/BJHoUZy69wHHFUo48x7OEVgpSny2yJptY5zhATf9it5
 oAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hoHA0jnpbenk0L1wCxXnTJA6EPgG69AgIZOxa5K/Ypw=;
 b=j9jxHo7ZBT8frnl60vQcDCdzXJwJ+9I30BD9T9ikjzHtjk4zLPaFFcs89AjfLH1UDY
 Ec7rD8+lM9Z3vvquzP9LMzlxw+96rIea5fjUQyCbT0tS+K2O0IeCP+rEisFOv63PuN7j
 PPFGkKMxE13P/YkX+ujPgy9vUGic1jBBftW31VefACAb9hs+iovvnPKKhj7emLeImWVV
 RsRAshScUyaJIE2Ays/BZS75g2LBYEshANZYhjdEwKPRzs0v0Z5lfjc8CXuagpR9ovtM
 eM6KGdqTvAh7o4qz0pBKpBNF9L693lApRjrVo3gkiw7BdNPB2IVzqrPTdcQnzwQWzl3m
 888A==
X-Gm-Message-State: AOAM530hGWFS00r10zNasvb9SD0zeS8R06u2faXHL2HCHeyNwyP5ux+/
 zOCzzYxB3YIV9cXwxmZkfYs=
X-Google-Smtp-Source: ABdhPJzLEE9sFmGJotLLq4pvt10V8UlxFEoO/eOWX9XN9cEp8cDiDi1/EIiv7OhaOgrEMTPzSjKb8Q==
X-Received: by 2002:a17:90b:1c0f:: with SMTP id
 oc15mr29791513pjb.17.1643672470447; 
 Mon, 31 Jan 2022 15:41:10 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id kb18sm410793pjb.30.2022.01.31.15.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 15:41:10 -0800 (PST)
Message-ID: <043a2316-1570-39a9-19ce-4764635574cb@amsat.org>
Date: Tue, 1 Feb 2022 00:41:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 2/2] hw/i386/sgx: Attach SGX-EPC to its memory backend
Content-Language: en-US
To: Yang Zhong <yang.zhong@intel.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220116235331.103977-1-f4bug@amsat.org>
 <20220116235331.103977-3-f4bug@amsat.org>
 <c1a8eba5-b1a1-bbcf-c237-23e16ce88475@redhat.com>
 <20220123125230.GA981@yangzhon-Virtual>
In-Reply-To: <20220123125230.GA981@yangzhon-Virtual>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 23/1/22 13:52, Yang Zhong wrote:
> On Mon, Jan 17, 2022 at 12:48:10PM +0100, Paolo Bonzini wrote:
>> On 1/17/22 00:53, Philippe Mathieu-Daudé via wrote:
>>> We have one SGX-EPC address/size/node per memory backend,
>>> make it child of the backend in the QOM composition tree.
>>>
>>> Cc: Yang Zhong <yang.zhong@intel.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>   hw/i386/sgx.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
>>> index 5de5dd08936..6362e5e9d02 100644
>>> --- a/hw/i386/sgx.c
>>> +++ b/hw/i386/sgx.c
>>> @@ -300,6 +300,9 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>>>           /* set the memdev link with memory backend */
>>>           object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
>>>                                 &error_fatal);
>>> +        object_property_add_child(OBJECT(list->value->memdev), "sgx-epc",
>>> +                                  OBJECT(obj));
>>> +
>>>           /* set the numa node property for sgx epc object */
>>>           object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->value->node,
>>>                                &error_fatal);
>>
>> I don't think this is a good idea; only list->value->memdev should
>> add something below itself in the tree.
>>
>> However, I think obj can be added under the machine itself as
>> /machine/sgx-epc-device[*].
>>
> 
>    Philippe, Sorry I can't receive all Qemu mails from my mutt tool.
> 
>    https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg03535.html
>    I verified this patch, and the issue was reported as below:
> 
>    Unexpected error in object_property_try_add() at ../qom/object.c:1224:
>    qemu-system-x86_64: attempt to add duplicate property 'sgx-epc' to object (type 'pc-q35-7.0-machine')
>    Aborted (core dumped)
> 
>    Even I changed it to another name, which still reported same kind of issue.
> 
>    I tried below patch as my previous patch, and it can work
>    diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
>    index d60485fc422..66444745b47 100644
>    --- a/hw/i386/sgx.c
>    +++ b/hw/i386/sgx.c
>    @@ -281,6 +281,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>         SGXEPCState *sgx_epc = &pcms->sgx_epc;
>         X86MachineState *x86ms = X86_MACHINE(pcms);
>         SgxEPCList *list = NULL;
>    +    int sgx_count = 0;
>         Object *obj;
> 
>         memset(sgx_epc, 0, sizeof(SGXEPCState));
>    @@ -297,7 +298,9 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>         for (list = x86ms->sgx_epc_list; list; list = list->next) {
>             obj = object_new("sgx-epc");
> 
>    -        object_property_add_child(OBJECT(pcms), "sgx-epc", OBJECT(obj));
>    +        gchar *name = g_strdup_printf("device[%d]", sgx_count++);

Oops yes you are right... Fixed in v3!

>    +        object_property_add_child(container_get(qdev_get_machine(), "/sgx-epc-device"),
>    +                                      name, obj);
>    
>             /* set the memdev link with memory backend */
>             object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
> 
> 
>    From the monitor,
>    (qemu) qom-list /machine/sgx-epc-device
>    type (string)
>    device[0] (child<sgx-epc>)
>    device[1] (child<sgx-epc>)
>    
>    This can normally show two sgx epc section devices.
>    
>    If you have new patch, I can help verify, thanks!

Here you go for v3:
https://lore.kernel.org/qemu-devel/20220131233507.334174-1-f4bug@amsat.org/

Regards,

Phil.

