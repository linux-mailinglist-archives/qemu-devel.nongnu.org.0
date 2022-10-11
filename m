Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389EF5FB89E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 18:53:40 +0200 (CEST)
Received: from localhost ([::1]:36568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiIVe-0000jI-KB
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 12:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oiIO1-0005uN-TF
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 12:45:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oiINx-0006Fc-Oz
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 12:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665506738;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c8PsTf3WUZOpkSD0nQM22s+p53eQm1J9rsvpnT1ys3M=;
 b=S5MqWmhoTkuVpFk9BoEYvqx3fu4uEa4E2cmr6GRHSR26esxTVV/7KWmDjFW5SP1TE7z18B
 O1BabjpMw6lWZyNeIG17SLtcjCWKutuqhv5f5iYGMeY58fy43sa6h9x/0DAa0aCGLNnsxM
 5SBNt9er6jJpxSZ1LLSN5HfPzZlEKFQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-q1jVLmPENgaxYnrPCDpGXA-1; Tue, 11 Oct 2022 12:45:37 -0400
X-MC-Unique: q1jVLmPENgaxYnrPCDpGXA-1
Received: by mail-qk1-f199.google.com with SMTP id
 x22-20020a05620a259600b006b552a69231so12052065qko.18
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 09:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c8PsTf3WUZOpkSD0nQM22s+p53eQm1J9rsvpnT1ys3M=;
 b=Ffhsx0+UbZGp71NEgRVCLQqgHNgb5IPknDHZORdXO9qXWA9MWTaqH/4kEEy8lEiZIf
 QZ4HVZ5DmInGFG7Hll2LIyl5YR7DstiOa5qOGddhssebe1BBAFSQODhJ7yUU4a3m9vZT
 K7kDRBjQ4W2S+Hp4bDpdpWKNDPJwdowsjP5vZBmFBhXR5YKW4ZuO+z2HFkTl+HBnQCSj
 UXQeQVk19M5DwN7AdnuVr0xv8+TLffKpmYKmhkGX8x4mWJeg9yWt/mqyxOgk+12JxTo8
 seEuasF3Xw2m0tgqg8zKf04uqY0ks9sg82MjI54VAKCVMaVtwDtMI53xhnlRWSktlexZ
 DgPg==
X-Gm-Message-State: ACrzQf2FEkOvMCw9jFAA6A341pF24TD+EcFsdmgIB1OSOsBN2FU1NO5J
 jwk/xe/7gJYMDYxumat/cXQ20STpHAxEYI635gE7xktMy9hImsa7gDxd9YB3U/82XXJRhYUvR5/
 6zCxkahrPBqsXnJc=
X-Received: by 2002:a05:622a:196:b0:35d:442b:ab45 with SMTP id
 s22-20020a05622a019600b0035d442bab45mr20096231qtw.565.1665506736719; 
 Tue, 11 Oct 2022 09:45:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7HSOqqgFBkKys3bx4FoD16vk4TCAPLfM+VfZ/8NLOGFk6yybkM2PBDt/DXwgQRehczisJBZw==
X-Received: by 2002:a05:622a:196:b0:35d:442b:ab45 with SMTP id
 s22-20020a05622a019600b0035d442bab45mr20096214qtw.565.1665506736482; 
 Tue, 11 Oct 2022 09:45:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 x4-20020ac86b44000000b003986fc4d9fdsm7301566qts.49.2022.10.11.09.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 09:45:35 -0700 (PDT)
Message-ID: <5d804a6b-c55d-8a7b-415b-dadf807152fa@redhat.com>
Date: Tue, 11 Oct 2022 18:45:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 4/6] hw/arm/virt: Introduce
 virt_get_high_memmap_enabled() helper
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, zhenyzha@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org, shan.gavin@gmail.com
References: <20221004002627.59172-1-gshan@redhat.com>
 <20221004002627.59172-5-gshan@redhat.com> <87edvnooqb.fsf@redhat.com>
 <a4bb90c8-3793-23ec-79a6-edf44565c8ff@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <a4bb90c8-3793-23ec-79a6-edf44565c8ff@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/5/22 00:47, Gavin Shan wrote:
> Hi Connie,
>
> On 10/4/22 6:41 PM, Cornelia Huck wrote:
>> On Tue, Oct 04 2022, Gavin Shan <gshan@redhat.com> wrote:
>>
>>> This introduces virt_get_high_memmap_enabled() helper, which returns
>>> the pointer to vms->highmem_{redists, ecam, mmio}. The pointer will
>>> be used in the subsequent patches.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   hw/arm/virt.c | 30 +++++++++++++++++-------------
>>>   1 file changed, 17 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index b0b679d1f4..59de7b78b5 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -1689,14 +1689,29 @@ static uint64_t
>>> virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>>       return arm_cpu_mp_affinity(idx, clustersz);
>>>   }
>>>   +static inline bool *virt_get_high_memmap_enabled(VirtMachineState
>>> *vms,
>>> +                                                 int index)
>>> +{
>>> +    bool *enabled_array[] = {
>>> +        &vms->highmem_redists,
>>> +        &vms->highmem_ecam,
>>> +        &vms->highmem_mmio,
>>> +    };
>>> +
>>> +    assert(index - VIRT_LOWMEMMAP_LAST < ARRAY_SIZE(enabled_array));
>>
>> I wonder whether we want an assert(ARRAY_SIZE(extended_memmap) ==
>> ARRAY_SIZE(enabled_array))? IIUC, we never want those two to get out of
>> sync?
>>
>
> Yeah, It makes sense to ensure both arrays synchronized. I will add
> the extra check in next respin.

With Connie's suggestion this looks good to me.

Thanks

Eric
>
>>> +
>>> +    return enabled_array[index - VIRT_LOWMEMMAP_LAST];
>>> +}
>>> +
>
> Thanks,
> Gavin
>


