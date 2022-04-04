Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701154F1432
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 14:00:21 +0200 (CEST)
Received: from localhost ([::1]:53346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbLNb-0007pV-V9
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 08:00:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nbLLC-0006UU-Oc
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 07:57:53 -0400
Received: from [2a00:1450:4864:20::12c] (port=47072
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nbLL8-0001Dx-AF
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 07:57:48 -0400
Received: by mail-lf1-x12c.google.com with SMTP id e16so16730074lfc.13
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 04:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/NFCTH5hx3/L6Fx7CBc63ZRqEHSrze49qnhbCWVLxq4=;
 b=N44RQzAYW50nVfgRKugMJFS80JBLb7fTF+nfVWORH/7cWQdqgFRwY5yNbLvQcbw1+O
 CxydtJULu6PJPF7udX/zEY54ZfVO4oUeJg0mzP4pJf1ueOXFYo2VAeuAlSkraGbgE3/B
 /5CVsQAdKl1OTduaOnFg+jiVYL6oCHs2rDvabPrln7JJnNQcuDG/SYHgq3MxBh6FY+Ft
 3c5XUB9qYiPvMP7/vyQ+xQByztziKi8FzYItFS7h8ToUNdyyazPjRnzcVWrEob1aLjzb
 uDIlCCVWdnA4Cqc9INhp5ag3RTTNWtqrQZC47y1AmMcPCLioCxFzNT2AkV/x4M25YeJl
 CFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/NFCTH5hx3/L6Fx7CBc63ZRqEHSrze49qnhbCWVLxq4=;
 b=VsADWhsV1hDo/x7lXI03h/hPY8Z70O++aCVTQIiC4GXONNDTjZ+Sm1Fw/0HfVlwgDF
 zypXUIJlBlTOKtVPKuDmNnDl76F7gbNhEQjWnHfcVcCZPQY2v2FTcpSvBeOlWyrZWBM1
 ep1QyOqX87s30KUTKFS+rN7dH8IFYv4K0BOvsj6RoOHD3q2cqBviNee7hTNtppQ03yCf
 L52hRzXkdQ46K7iYkH0VUfV6aPKDj58HE7BtCA5ArPYAue7YxSDan487VPqtvQ9oauV3
 wXsleHb2O+5zKecS83BG53KrymitPuAzlMrUZ5sH7wURaIM4WOkU6Sx4JvupefsU3Hcl
 AOfw==
X-Gm-Message-State: AOAM5326g/Tw5T/G/Fij+fV4SK1pBoJERREjD0Omuxt2xAl+TzI3kAYm
 ybuOXx75LzaDPVyBXNwmfMXmAw==
X-Google-Smtp-Source: ABdhPJxSaN1wm6D/14vqLfNDxULkIUDl8dKCxaBTZ/N1hN+u2bNgo6RW8lGD/n8esivLE0f5m6cvyw==
X-Received: by 2002:a05:6512:22cd:b0:44a:6d2c:8b9f with SMTP id
 g13-20020a05651222cd00b0044a6d2c8b9fmr22006165lfu.142.1649073463906; 
 Mon, 04 Apr 2022 04:57:43 -0700 (PDT)
Received: from [192.168.50.150] ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a19381a000000b0044ad7a29b4csm1112539lfa.37.2022.04.04.04.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 04:57:43 -0700 (PDT)
Message-ID: <60926e96-6a85-63bc-d6ae-9113c397a77b@openvz.org>
Date: Mon, 4 Apr 2022 14:57:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 3/9] mem: appropriate handling getting mem region
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-devel@nongnu.org, imammedo@redhat.com
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-4-maxim.davydov@openvz.org>
 <4cb6d834-48cf-3b9f-77b0-38cec020a3dc@mail.ru>
From: Maxim Davydov <maxim.davydov@openvz.org>
In-Reply-To: <4cb6d834-48cf-3b9f-77b0-38cec020a3dc@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, berrange@redhat.com, xiaoguangrong.eric@gmail.com,
 mst@redhat.com, jsnow@redhat.com, crosa@redhat.com, f4bug@amsat.org,
 lizhijian@fujitsu.com, armbru@redhat.com, wangyanan55@huawei.com,
 marcandre.lureau@redhat.com, chen.zhang@intel.com, pbonzini@redhat.com,
 ani@anisinha.ca, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/30/22 14:27, Vladimir Sementsov-Ogievskiy wrote:
> 29.03.2022 00:15, Maxim Davydov wrote:
>> Attempt to get memory region if the device doesn't have hostmem may 
>> not be
>> an error. This can be happen immediately after initialization (getting
>> value without default one).
>>
>> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
>> ---
>>   hw/i386/sgx-epc.c | 5 ++++-
>>   hw/mem/nvdimm.c   | 6 ++++++
>>   hw/mem/pc-dimm.c  | 5 +++++
>>   3 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
>> index d664829d35..1a4c8acdcc 100644
>> --- a/hw/i386/sgx-epc.c
>> +++ b/hw/i386/sgx-epc.c
>> @@ -121,9 +121,12 @@ static MemoryRegion 
>> *sgx_epc_md_get_memory_region(MemoryDeviceState *md,
>>   {
>>       SGXEPCDevice *epc = SGX_EPC(md);
>>       HostMemoryBackend *hostmem;
>> +    DeviceState *dev = DEVICE(epc);
>>         if (!epc->hostmem) {
>> -        error_setg(errp, "'" SGX_EPC_MEMDEV_PROP "' property must be 
>> set");
>> +        if (dev->realized) {
>> +            error_setg(errp, "'" SGX_EPC_MEMDEV_PROP "' property 
>> must be set");
>> +        }
>>           return NULL;
>>       }
>
> I can't judge, is it really and error or not.
>
> But the way you change the logic is not correct, as you change the 
> semantics:
>
> Old semantics: on error return NULL and set errp, on success return 
> non-NULL and not set errp
>
> New semantics: on error return NULL and set errp, on success return 
> anything (may be NULL) and not set errp.
>
> Callers are not prepared to this. For example, look at 
> memory_device_unplug:
> it does
>
>   mr = mdc->get_memory_region(md, &error_abort);
>
> assume it returns NULL, which is not an error (so we don't crash on 
> error_abort)
>
> and then pass mr  to memory_region_del_subregion(), which in turn 
> access mr->container, which will crash if mr is NULL.
>
> Most probably the situation I describe is not possible, but I just 
> want to illustrate the idea.
>
> Moreover, in QEMU functions which has "Error **errp" argument and 
> return pointer are recommended to return NULL on failure and nonNULL 
> on success. In other words, return value of function with "Error 
> **errp" argument should report success/failure information. And having 
> NULL as possible success return value is not recommended, as it's 
> ambiguous and leads to bugs (see big comment at start of 
> include/qapi/error.h).
>
> So, if it's really needed to change the semantics in such 
> not-recommended way, you should check that all callers are OK with it 
> and also describe new semantics in a comment near get_memory_region 
> declaration. But better is deal with returned error as it is.. What is 
> an exact problem you trying to solve with this commit?
I tried to solve the problem with errors from request MemoryRegion (via 
*md_get_memory_region()) that was called immediately after 
object_new_with_class(). But it does seem to change the semantics. 
Perhaps better solution would be to ignore these errors or to add an 
exception to handle the object properties correctly.
>
>>   diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
>> index 7c7d777781..61e77e5476 100644
>> --- a/hw/mem/nvdimm.c
>> +++ b/hw/mem/nvdimm.c
>> @@ -166,9 +166,15 @@ static MemoryRegion 
>> *nvdimm_md_get_memory_region(MemoryDeviceState *md,
>>                                                    Error **errp)
>>   {
>>       NVDIMMDevice *nvdimm = NVDIMM(md);
>> +    PCDIMMDevice *dimm = PC_DIMM(nvdimm);
>>       Error *local_err = NULL;
>>         if (!nvdimm->nvdimm_mr) {
>> +        /* Not error if we try get memory region after init */
>> +        if (!dimm->hostmem) {
>> +            return NULL;
>> +        }
>> +
>>           nvdimm_prepare_memory_region(nvdimm, &local_err);
>>           if (local_err) {
>>               error_propagate(errp, local_err);
>> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
>> index f27e1a11ba..6fd74de97f 100644
>> --- a/hw/mem/pc-dimm.c
>> +++ b/hw/mem/pc-dimm.c
>> @@ -240,6 +240,11 @@ static void 
>> pc_dimm_md_set_addr(MemoryDeviceState *md, uint64_t addr,
>>   static MemoryRegion *pc_dimm_md_get_memory_region(MemoryDeviceState 
>> *md,
>>                                                     Error **errp)
>>   {
>> +    PCDIMMDevice *dimm = PC_DIMM(md);
>> +    /* Not error if we try get memory region after init */
>> +    if (!dimm->hostmem) {
>> +        return NULL;
>> +    }
>>       return pc_dimm_get_memory_region(PC_DIMM(md), errp);
>>   }
>
>
-- 
Best regards,
Maxim Davydov


