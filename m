Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A944345A0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 09:01:16 +0200 (CEST)
Received: from localhost ([::1]:36792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md5b8-0001yo-KL
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 03:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1md5Yo-0000nm-QM
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 02:58:50 -0400
Received: from apollo.dupie.be ([51.159.20.238]:58738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1md5Yl-0006MC-NM
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 02:58:49 -0400
Received: from [IPV6:2a02:a03f:fa8f:3301:eba1:a8ad:64a3:d6c8] (unknown
 [IPv6:2a02:a03f:fa8f:3301:eba1:a8ad:64a3:d6c8])
 by apollo.dupie.be (Postfix) with ESMTPSA id 2A2581520E03;
 Wed, 20 Oct 2021 08:58:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dupond.be; s=dkim;
 t=1634713121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmtMmWP9EsaALzd32z6+r80g7N6w7bS5vG6saW5PGXE=;
 b=TMnzpUHy159BRbshUgInqKE/5dFjd/SMKdiECrsI5rja5trDHAJo1nnNhjnXj2nIK/1Skd
 YJfUGS7J3BCoMKPNnvMmpaphHPcQAA7kJ+HmK+vbnfJCMhdkBTrlIA6RyUAjrhy22i7wE4
 spbEVp/EIOLnfMxDOuzrcBovbzRy4Ryi8g1ugXYBMEg6glUKnscoe+7xo9WoZf0rGOwGQY
 ZnqGft3OUz6u53CXj79BSZB1f9g07KqGPWdFobVSCRPSntCrGyu3P/uwTPBugw/zX7FuEI
 yKW2YDZJdZ352IOqmgEes35pxZ1l0hnTptCO6E2kaNISiIZ2/hm4uOkNS4A3Kg==
Message-ID: <5031fd16-72ed-75d4-4b4d-7e434e6c9cc0@dupond.be>
Date: Wed, 20 Oct 2021 08:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] hw/qdev-core: Add compatibility for (non)-transitional
 devs
Content-Language: nl-BE
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20211012082428.16222-1-jean-louis@dupond.be>
 <20211019152733.mjiucqhu2vyuofpb@habkost.net>
From: Jean-Louis Dupond <jean-louis@dupond.be>
In-Reply-To: <20211019152733.mjiucqhu2vyuofpb@habkost.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=51.159.20.238; envelope-from=jean-louis@dupond.be;
 helo=apollo.dupie.be
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/10/2021 17:27, Eduardo Habkost wrote:
> On Tue, Oct 12, 2021 at 10:24:28AM +0200, Jean-Louis Dupond wrote:
>> hw_compat modes only take into account their base name.
> What do you mean by "base name"?
virtio-net-pci (without the (non-)transitional extension.
>> But if a device is created with (non)-transitional, then the compat
>> values are not used, causing migrating issues.
>>
>> This commit adds their (non)-transitional entries with the same settings
>> as the base entry.
>
> Wouldn't it be easier to fix the incorrect compat_props arrays to
> use "virtio-*-pci-base" instead?
>
> If a piece of code is supposed to affect/support both
> non-transitional and transitional subclasses, that's why
> VirtioPCIDeviceTypeInfo.base_name exists.
>
Thats easier indeed :)
>> Fixes https://bugzilla.redhat.com/show_bug.cgi?id=1999141
>>
>> Signed-off-by: Jean-Louis Dupond <jean-louis@dupond.be>
>> ---
>>   include/hw/qdev-core.h | 34 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>> index 4ff19c714b..5726825c2d 100644
>> --- a/include/hw/qdev-core.h
>> +++ b/include/hw/qdev-core.h
>> @@ -293,6 +293,30 @@ typedef struct GlobalProperty {
>>       bool optional;
>>   } GlobalProperty;
>>   
>> +
>> +/**
>> + * Helper to add (non)transitional compat properties
>> + */
>> +static inline void
>> +compat_props_add_transitional(GPtrArray *arr, GlobalProperty *prop)
>> +{
>> +    GlobalProperty *transitional = g_new0(typeof(*transitional), 1);
>> +    transitional->driver = g_strdup_printf("%s-transitional", prop->driver);
>> +    transitional->property = g_strdup(prop->property);
>> +    transitional->value = g_strdup(prop->value);
>> +    transitional->used = prop->used;
>> +    transitional->optional = prop->optional;
>> +    g_ptr_array_add(arr, (void *)transitional);
>> +
>> +    GlobalProperty *non_transitional = g_new0(typeof(*non_transitional), 1);
>> +    non_transitional->driver = g_strdup_printf("%s-non-transitional", prop->driver);
>> +    non_transitional->property = g_strdup(prop->property);
>> +    non_transitional->value = g_strdup(prop->value);
>> +    non_transitional->used = prop->used;
>> +    non_transitional->optional = prop->optional;
>> +    g_ptr_array_add(arr, (void *)non_transitional);
>> +}
>> +
>>   static inline void
>>   compat_props_add(GPtrArray *arr,
>>                    GlobalProperty props[], size_t nelem)
>> @@ -300,6 +324,16 @@ compat_props_add(GPtrArray *arr,
>>       int i;
>>       for (i = 0; i < nelem; i++) {
>>           g_ptr_array_add(arr, (void *)&props[i]);
>> +        if (g_str_equal(props[i].driver, "vhost-user-blk-pci") ||
>> +            g_str_equal(props[i].driver, "virtio-scsi-pci") ||
>> +            g_str_equal(props[i].driver, "virtio-blk-pci") ||
>> +            g_str_equal(props[i].driver, "virtio-balloon-pci") ||
>> +            g_str_equal(props[i].driver, "virtio-serial-pci") ||
>> +            g_str_equal(props[i].driver, "virtio-9p-pci") ||
>> +            g_str_equal(props[i].driver, "virtio-net-pci") ||
>> +            g_str_equal(props[i].driver, "virtio-rng-pci")) {
>> +            compat_props_add_transitional(arr, &props[i]);
>> +        }
>>       }
>>   }
>>   
>> -- 
>> 2.33.0
>>
>>

