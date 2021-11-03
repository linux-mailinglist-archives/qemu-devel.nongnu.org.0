Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9CA443DD8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 08:52:45 +0100 (CET)
Received: from localhost ([::1]:60078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miB4d-0007CZ-Pa
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 03:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1miB3p-0006TH-KB
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 03:51:53 -0400
Received: from apollo.dupie.be ([51.159.20.238]:51808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1miB3l-00072E-AM
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 03:51:53 -0400
Received: from [IPV6:2a02:a03f:fa8f:3301:eba1:a8ad:64a3:d6c8] (unknown
 [IPv6:2a02:a03f:fa8f:3301:eba1:a8ad:64a3:d6c8])
 by apollo.dupie.be (Postfix) with ESMTPSA id 6DACF1520527;
 Wed,  3 Nov 2021 08:51:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dupond.be; s=dkim;
 t=1635925903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A+nPYnSm9T819PFKUan2g5g5mBHE9LdKPEvZdg95lVs=;
 b=DJvV/Y4jp4jlIwiTGOjxYjc9vgeLVHXj5TauFJs7cOyJQAfLzumNDKEK/WcTaKBQEjIN8k
 XWjRwV77VDyAAK4ZTiW5N/YTZbydELLQCx1JIFD8+wGRuziJNoUTPfbDG9svqHh15q2jQX
 9AXppzUoy3s60fNzcGKECkSqogw4bgLmusDTayqv26WLOU1i9v/Yv5KeQgriVTzIkhqIqK
 84DqS3EihfvGAgqy/YSpRfChqnOftbCChc3AJ6tOz8aylL0Z5F4tc+roxsGDao+qhW9UFO
 e7RSmIWJ8hTyQbkP9v7I4JRzlEPzSfL1WOMhN/cYD4Eu3coJTj0bdYnjq6LXTQ==
Message-ID: <61e4899c-82ad-fada-9f99-ab30cc03501c@dupond.be>
Date: Wed, 3 Nov 2021 08:51:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] hw/qdev-core: Add compatibility for (non)-transitional
 devs
Content-Language: nl-BE
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20211012082428.16222-1-jean-louis@dupond.be>
 <20211101182532-mutt-send-email-mst@kernel.org>
From: Jean-Louis Dupond <jean-louis@dupond.be>
In-Reply-To: <20211101182532-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=51.159.20.238; envelope-from=jean-louis@dupond.be;
 helo=apollo.dupie.be
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/11/2021 23:26, Michael S. Tsirkin wrote:
> On Tue, Oct 12, 2021 at 10:24:28AM +0200, Jean-Louis Dupond wrote:
>> hw_compat modes only take into account their base name.
>> But if a device is created with (non)-transitional, then the compat
>> values are not used, causing migrating issues.
>>
>> This commit adds their (non)-transitional entries with the same settings
>> as the base entry.
>>
>> Fixes https://bugzilla.redhat.com/show_bug.cgi?id=1999141
>>
>> Signed-off-by: Jean-Louis Dupond <jean-louis@dupond.be>
>
> Jean-Louis, any chance you are going to address the comments
> and post a new patch?
>
Should'nt we just apply the patch from Eduardo?
As this is a more elegant solution with the same result.
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
>>

