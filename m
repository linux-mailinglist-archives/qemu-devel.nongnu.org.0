Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF7E4F1398
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 13:08:45 +0200 (CEST)
Received: from localhost ([::1]:57476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbKZg-0004oh-Af
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 07:08:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nbKYP-00045J-L0
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 07:07:25 -0400
Received: from [2a00:1450:4864:20::234] (port=46073
 helo=mail-lj1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nbKYN-0000fV-Cr
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 07:07:25 -0400
Received: by mail-lj1-x234.google.com with SMTP id q14so12312890ljc.12
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 04:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=O6YYVbVfyDHKd0zZJROKzVWOogSyWcAlcMfZmho5Kao=;
 b=oHXXOnciv+tQDiyhZzs57x+9F/qUyov22XoWUSp2BLqoHFsET6oAv7EGYVKcF/Uyvw
 V58g6n+/a3TRgwuD8oaTaRFpA/xBQRlmGpXrupn367LOrb0fwbLtNrnP5vMoP9sDeeNC
 geSCQmcNEe1ABfnvhhBDPDK+dSvVpTqTEsg4GeC8zit1Czi/5yG/N6KZWzbrtNhgPYfF
 74eC9bRRiR/U6EnjFCdUV7zO9yuHT5O0zUYvYCnOLQLKn0cSlOlAfwslcrXgJ6BLgOVX
 90FqAJTRoNJvXt3hXLsTh9nzNbMrci4dMaYnCabieSOL66LIQxj9DwP6gss+vCsf431r
 vZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O6YYVbVfyDHKd0zZJROKzVWOogSyWcAlcMfZmho5Kao=;
 b=xj4XwIpCLyeYExkbuHYMZb9DPBnzL4Hs7NcjJuH1L42Efwnu72k21S+8zHYIpucDW3
 tln+vneUYtsRnvA5m4UikZ8D0aQHpXXX5/t8yJKYWuO7yr5q0+j0gc/Bn5ZLQPQ+6Sp+
 d/euGCY0hdErtjfTFM9A95AwFFKkB4ayTbhftR3+WOTaabVCg7SEPbkjL0hd9Soc6Z/H
 CKazuzVrapVy6NGOiFNBupd8tb7lfVpiQZXYQGONlBvKc38mHkO3f4d7qgdgbLcpB7na
 Hpuxbac7Hw3C9frHlfgvzO5+2mLZ2pUXf5qPoQgIeO6MSxva+IpcptPIcMJUw2z1lXTm
 O2GQ==
X-Gm-Message-State: AOAM533EuxvaYVkhXzZSjVFicUgp9b9Hy4EfMikELqyrE0I7ZKLKq8dH
 Jc7Fh3iqZsElYz7Mw/bi+LOFbQ==
X-Google-Smtp-Source: ABdhPJxQWOGu1iQpJncEJ+ZixFKUw2cEOa7x05978yt0FBPQkoN7X6+McULBLY3yk6qgm0ff+EyA7Q==
X-Received: by 2002:a2e:b53a:0:b0:24b:12f7:237b with SMTP id
 z26-20020a2eb53a000000b0024b12f7237bmr4811042ljm.177.1649070441356; 
 Mon, 04 Apr 2022 04:07:21 -0700 (PDT)
Received: from [192.168.50.150] ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a2e7a01000000b0024ac272d727sm1025135ljc.79.2022.04.04.04.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 04:07:20 -0700 (PDT)
Message-ID: <4914611f-6274-e73c-d24d-9f4111617544@openvz.org>
Date: Mon, 4 Apr 2022 14:07:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 2/9] pci: add null-pointer check
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-devel@nongnu.org, imammedo@redhat.com
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-3-maxim.davydov@openvz.org>
 <a1941c15-b4bf-84e9-0dab-ace7027ef972@mail.ru>
From: Maxim Davydov <maxim.davydov@openvz.org>
In-Reply-To: <a1941c15-b4bf-84e9-0dab-ace7027ef972@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::234
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lj1-x234.google.com
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


On 3/30/22 14:07, Vladimir Sementsov-Ogievskiy wrote:
> 29.03.2022 00:15, Maxim Davydov wrote:
>> Call pci_bus_get_w64_range can fail with the segmentation fault. For
>> example, this can happen during attempt to get pci-hole64-end 
>> immediately
>> after initialization.
>
> So, immediately after initialization, h->bus is NULL?
>
> The significant bit is, is the value which we calculate without h->bus 
> is correct or not? That should be covered by commit message.
For example, object_new_with_class() returns only initialized object 
(after calling instance_init). It means that pci_root_bus_new() in 
q35_host_realize() hasn't been called for returned object and pci->bus 
== NULL. So, if then we try to call q35_host_get_pci_hole64_end() it 
will fail with segmentation fault in the pci_for_each_device_under_bus() 
(d = bus->devices[devfn], but bus == NULL). Similarly for i440fx. I'm 
not sure that it's the correct behavior.
To reproduce this situation, run "{'execute' : 'query-init-properties'}" 
or qmp_query_init_properties() from 8th patch of this series without 
applying fixes for pci-host.
After this fix, the behavior is the similar as if range_is_empty(&w64) 
== True, but without SEGFAULT. Although, we can check flag 
DeviceState.realized to detect unrealized device.
>
>>
>> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
>> ---
>>   hw/pci-host/i440fx.c | 17 +++++++++++------
>>   hw/pci-host/q35.c    | 17 +++++++++++------
>>   2 files changed, 22 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
>> index e08716142b..71a114e551 100644
>> --- a/hw/pci-host/i440fx.c
>> +++ b/hw/pci-host/i440fx.c
>> @@ -158,10 +158,12 @@ static uint64_t 
>> i440fx_pcihost_get_pci_hole64_start_value(Object *obj)
>>       PCIHostState *h = PCI_HOST_BRIDGE(obj);
>>       I440FXState *s = I440FX_PCI_HOST_BRIDGE(obj);
>>       Range w64;
>> -    uint64_t value;
>> +    uint64_t value = 0;
>>   -    pci_bus_get_w64_range(h->bus, &w64);
>> -    value = range_is_empty(&w64) ? 0 : range_lob(&w64);
>> +    if (h->bus) {
>> +        pci_bus_get_w64_range(h->bus, &w64);
>> +        value = range_is_empty(&w64) ? 0 : range_lob(&w64);
>> +    }
>>       if (!value && s->pci_hole64_fix) {
>>           value = pc_pci_hole64_start();
>>       }
>> @@ -191,10 +193,13 @@ static void 
>> i440fx_pcihost_get_pci_hole64_end(Object *obj, Visitor *v,
>>       I440FXState *s = I440FX_PCI_HOST_BRIDGE(obj);
>>       uint64_t hole64_start = 
>> i440fx_pcihost_get_pci_hole64_start_value(obj);
>>       Range w64;
>> -    uint64_t value, hole64_end;
>> +    uint64_t value = 0;
>> +    uint64_t hole64_end;
>>   -    pci_bus_get_w64_range(h->bus, &w64);
>> -    value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
>> +    if (h->bus) {
>> +        pci_bus_get_w64_range(h->bus, &w64);
>> +        value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
>> +    }
>>       hole64_end = ROUND_UP(hole64_start + s->pci_hole64_size, 1ULL 
>> << 30);
>>       if (s->pci_hole64_fix && value < hole64_end) {
>>           value = hole64_end;
>> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
>> index ab5a47aff5..d679fd85ef 100644
>> --- a/hw/pci-host/q35.c
>> +++ b/hw/pci-host/q35.c
>> @@ -124,10 +124,12 @@ static uint64_t 
>> q35_host_get_pci_hole64_start_value(Object *obj)
>>       PCIHostState *h = PCI_HOST_BRIDGE(obj);
>>       Q35PCIHost *s = Q35_HOST_DEVICE(obj);
>>       Range w64;
>> -    uint64_t value;
>> +    uint64_t value = 0;
>>   -    pci_bus_get_w64_range(h->bus, &w64);
>> -    value = range_is_empty(&w64) ? 0 : range_lob(&w64);
>> +    if (h->bus) {
>> +        pci_bus_get_w64_range(h->bus, &w64);
>> +        value = range_is_empty(&w64) ? 0 : range_lob(&w64);
>> +    }
>>       if (!value && s->pci_hole64_fix) {
>>           value = pc_pci_hole64_start();
>>       }
>> @@ -157,10 +159,13 @@ static void q35_host_get_pci_hole64_end(Object 
>> *obj, Visitor *v,
>>       Q35PCIHost *s = Q35_HOST_DEVICE(obj);
>>       uint64_t hole64_start = q35_host_get_pci_hole64_start_value(obj);
>>       Range w64;
>> -    uint64_t value, hole64_end;
>> +    uint64_t value = 0;
>> +    uint64_t hole64_end;
>>   -    pci_bus_get_w64_range(h->bus, &w64);
>> -    value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
>> +    if (h->bus) {
>> +        pci_bus_get_w64_range(h->bus, &w64);
>> +        value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
>> +    }
>>       hole64_end = ROUND_UP(hole64_start + s->mch.pci_hole64_size, 
>> 1ULL << 30);
>>       if (s->pci_hole64_fix && value < hole64_end) {
>>           value = hole64_end;
>
>

-- 
Best regards,
Maxim Davydov


