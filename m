Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0C53ECF59
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 09:29:19 +0200 (CEST)
Received: from localhost ([::1]:40802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFX3d-0002nn-OE
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 03:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mFX2t-00028u-AP
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 03:28:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mFX2p-00026C-68
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 03:28:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629098905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E2epP4jqpmwYgLhje2Phyu4Cx4MYQKoIMjDVP+QPqak=;
 b=OJArhP6BhjZVbJ5ZRTjxFHTY9aLpurA7NKiiF2g6gl3r97CD7XanO/5Dk+awXLE8TwuxR6
 nhC6QjEpnghkIq7wVpJN4tYjCw7HuLHTk4MtlNfGpr9R+aVTCWcJzgwImkVQMovgHezzLY
 c/dYjpWO90R+Gl1f/uZZVpZCT0t2Mjw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-I0D1FZc-Of2XOiWMY-z7cQ-1; Mon, 16 Aug 2021 03:28:23 -0400
X-MC-Unique: I0D1FZc-Of2XOiWMY-z7cQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m13-20020a7bcf2d000000b002e6cd9941a9so3351764wmg.1
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 00:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=E2epP4jqpmwYgLhje2Phyu4Cx4MYQKoIMjDVP+QPqak=;
 b=WZVvQpOgQg8TO59ox1eB7SlDfcTjNF2+OU5dJ07V1glHi7YcDH0hVC/z8FoQUqCtIn
 JvwwXf7EFiFbi75hWteBy1O3gKgv2PjT4s2fgHAGidi4AcJzfPTg6BcnF6NilcGQ53KL
 8jc7HRO5Uybuwe0ZA5uzSYElR/iYz2iiuSOyRA4AHYEy8EtNZAKC6E8Fgne+OhS0NEQU
 Plyw4Rlf8StXgxEyYGlfj9JnJBQP0KnHBnBKVpj2jbqQay/yuAm0xKesw7DfoCxQxf/F
 uCie3BnTm2fVnJI1yXL59le+cdqBA1vf0ZGexPOdiyhJWYk9FfxvC/4q6S1LT0CEgKdW
 SbVA==
X-Gm-Message-State: AOAM531iCTPwmEdh38PbO2Eib++oBhx+fYdCT8jKKquRh6uyx0bYFPEn
 K/LL6lu4O++zEnSHt5YSW+x9T2Bz0cyO9CMg19vVs+Vw7GqOnqfzxry4L+y6CwHx7BybvD1okgN
 9Ng1PQgdOw0vvtxw=
X-Received: by 2002:a05:6000:128e:: with SMTP id
 f14mr16721710wrx.167.1629098902795; 
 Mon, 16 Aug 2021 00:28:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj+G0n0wHex4re4wLeUgovFEEXhFouvvgSEH2XLK+mEiytT6xOh8bgECzuxci373Rs/S0cdQ==
X-Received: by 2002:a05:6000:128e:: with SMTP id
 f14mr16721676wrx.167.1629098902452; 
 Mon, 16 Aug 2021 00:28:22 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c67f1.dip0.t-ipconnect.de. [91.12.103.241])
 by smtp.gmail.com with ESMTPSA id o125sm9919128wme.15.2021.08.16.00.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 00:28:22 -0700 (PDT)
Subject: Re: [PATCH for-6.2 01/25] arm: Move M-profile RAS register block into
 its own device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-2-peter.maydell@linaro.org>
 <3fc10091-832a-e87c-9866-323534f6dc9e@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <c73e9fb2-5ab2-f011-8f50-4be2f42c39c6@redhat.com>
Date: Mon, 16 Aug 2021 09:28:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3fc10091-832a-e87c-9866-323534f6dc9e@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.147, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.08.21 19:30, Philippe Mathieu-Daudé wrote:
> +Peter/David
> 
> On 8/12/21 11:33 AM, Peter Maydell wrote:
>> Currently we implement the RAS register block within the NVIC device.
>> It isn't really very tightly coupled with the NVIC proper, so instead
>> move it out into a sysbus device of its own and have the top level
>> ARMv7M container create it and map it into memory at the right
>> address.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   include/hw/arm/armv7m.h       |  2 +
>>   include/hw/intc/armv7m_nvic.h |  1 -
>>   include/hw/misc/armv7m_ras.h  | 37 ++++++++++++++
>>   hw/arm/armv7m.c               | 12 +++++
>>   hw/intc/armv7m_nvic.c         | 56 ---------------------
>>   hw/misc/armv7m_ras.c          | 93 +++++++++++++++++++++++++++++++++++
>>   MAINTAINERS                   |  2 +
>>   hw/misc/meson.build           |  2 +
>>   8 files changed, 148 insertions(+), 57 deletions(-)
>>   create mode 100644 include/hw/misc/armv7m_ras.h
>>   create mode 100644 hw/misc/armv7m_ras.c
> 
>> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
>> index 9ce5c30cd5c..8964730d153 100644
>> --- a/hw/arm/armv7m.c
>> +++ b/hw/arm/armv7m.c
>> @@ -231,6 +231,18 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>>       memory_region_add_subregion(&s->container, 0xe0000000,
>>                                   sysbus_mmio_get_region(sbd, 0));
>>   
>> +    /* If the CPU has RAS support, create the RAS register block */
>> +    if (cpu_isar_feature(aa32_ras, s->cpu)) {
>> +        object_initialize_child(OBJECT(dev), "armv7m-ras",
>> +                                &s->ras, TYPE_ARMV7M_RAS);
>> +        sbd = SYS_BUS_DEVICE(&s->ras);
>> +        if (!sysbus_realize(sbd, errp)) {
>> +            return;
>> +        }
>> +        memory_region_add_subregion_overlap(&s->container, 0xe0005000,
>> +                                            sysbus_mmio_get_region(sbd, 0), 1);
> 
> Just curious, is the overlap really needed? I see the NVIC default
> region is 1 MiB wide. Aren't smaller regions returned first when
> multiple regions have same priority? This might be one of my
> misunderstandings with QEMU MR/AS APIs. Without looking at the
> code, assuming 2 MRs overlapping with the same priority, is there
> some assumption which one will be hit first?
> 

memory_region_add_subregion() documents "The subregion may not overlap 
with other subregions", however it really just translates to adding with 
priority 0.

memory_region_add_subregion_overlap documents "The subregion may overlap 
with other subregions.  Conflicts are resolved by having a higher 
@priority hide a lower @priority. Subregions without priority are taken 
as @priority 0 ... highest priority wins"

AFAIU, overlaps with same priority (e.g., 0) have undefined behavior and 
we should really be using memory_region_add_subregion_overlap() with 
proper priorities.

>> +    }
>> +
>>       for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
>>           if (s->enable_bitband) {
>>               Object *obj = OBJECT(&s->bitband[i]);
> 


-- 
Thanks,

David / dhildenb


