Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9479B42A146
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 11:39:52 +0200 (CEST)
Received: from localhost ([::1]:58650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maEGF-0006xI-5S
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 05:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1maE5q-0005qR-9N
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 05:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1maE5o-0003lN-H0
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 05:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634030942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W2bXYbn/8upsJKEgNdw2V1mzIuDFv3N3MNfj4J2cmRI=;
 b=CnmvVIMEVehyYNrAzChTJ4SfhvnNxBhO8O+CQRsI7Aq+vNUyfrL2cK5uYaFPteXluwVDc8
 JGWPff5zxnVqPhFC1TPeX/vGhTkQSjIWJ3uRxM65ZUxuBSuyOMW5oTUQhU8vuMvtiM5wnf
 2844SfHgOrbImGM6CZYjyoEDFgGmdzY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-xJ3pLugTN4ysK9erOV28_g-1; Tue, 12 Oct 2021 05:28:58 -0400
X-MC-Unique: xJ3pLugTN4ysK9erOV28_g-1
Received: by mail-wr1-f72.google.com with SMTP id
 41-20020adf812c000000b00160dfbfe1a2so11623029wrm.3
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 02:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=W2bXYbn/8upsJKEgNdw2V1mzIuDFv3N3MNfj4J2cmRI=;
 b=hL+q5IMwgRXg2gHZHJc/IUGIpRq6vnbrW1hRrHYPDRE2yfp2unRkVZLIdOmia8dCC9
 auafiZyH1yaWBM2OZ8IuVJRoPKA9vn+2ZYeFW2Pc8syLVLOLFv0RwI5gXoqonaVKBsFv
 WzcEUzDEdKLsRP7XGe+ZVEayq6EaxRCvNfsvmHPmQ02SWWWL9FvVu6EhWjhD5s7/lna7
 +iauU/6k1EWqGS9VUqLl8UYjWyaVA6nXfHdr4SWQLvBWTmRN45m0D433oY7V5PKgIneb
 TQbaDuabavI3AXaVQFrvxNGbRWpu062PqrBDzBKlCTEGFDJSR367sb6iNNTFBjX9GCxR
 AV7g==
X-Gm-Message-State: AOAM532i2Sxds4ORlnwLJQBUjdQp3J1QY8j9hdAQQyrfUeo8IitLv1+4
 5EFi2Z3lHsOpTW+tG90CmLVhpbV298RHTxdt0t3wUkJi8LOpLMcZbGwCCDL05JACINyibNPmJWw
 uHPp7OF63S/iqrDA=
X-Received: by 2002:a7b:c406:: with SMTP id k6mr4271039wmi.170.1634030937693; 
 Tue, 12 Oct 2021 02:28:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzxu6mh3s4NpsBJWqIPvBYbBv+pm7PnhWa1AFJgVqj2Ld1fJa+D4dhtQ2PUEVO/+tL1ba29Q==
X-Received: by 2002:a7b:c406:: with SMTP id k6mr4271024wmi.170.1634030937395; 
 Tue, 12 Oct 2021 02:28:57 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6a12.dip0.t-ipconnect.de. [91.12.106.18])
 by smtp.gmail.com with ESMTPSA id
 a5sm8257656wrn.71.2021.10.12.02.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 02:28:56 -0700 (PDT)
To: Igor Mammedov <imammedo@redhat.com>
References: <20211011174522.14351-1-david@redhat.com>
 <20211011174522.14351-3-david@redhat.com>
 <93dead18-5ea5-0afe-18c1-de9a06773687@linaro.org>
 <8108c69d-a596-d6c9-a116-783f47904deb@amsat.org>
 <845d3d5f-f9e9-d59d-c868-5a9825eb7fba@redhat.com>
 <20211012105300.1ef25440@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 2/2] memory: Update description of
 memory_region_is_mapped()
Message-ID: <a2078241-1dc9-782e-38a3-eab06c1b162c@redhat.com>
Date: Tue, 12 Oct 2021 11:28:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211012105300.1ef25440@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> Before sending this patch, I had
>>
>> commit 71d15e90d513327c90d346ef73865d2db749fbba
>> Author: David Hildenbrand <david@redhat.com>
>> Date:   Thu Oct 7 11:25:18 2021 +0200
>>
>>       memory: make memory_region_is_mapped() succeed when mapped via an alias
>>       
>>       memory_region_is_mapped() currently does not return "true" when a memory
>>       region is mapped via an alias. Let's fix that by adding a
>>       "mapped_via_alias" counter to memory regions and updating it accordingly
>>       when an alias gets (un)mapped.
> 
> this needs a clarification,
> is memory_region_is_mapped() used on aliased memory region or on alias?

I think right now it's barely used with aliases 
(memory_region_is_mapped(alias)), at least I am not aware of users.

What's more likely is that the final memory region will be the target of 
memory_region_is_mapped().

The question is: which semantics do we want to have so we can properly 
document and eventually fix.

> 
> 
>>       I am not aware of actual issues, this is rather a cleanup.
>>       
>>       Signed-off-by: David Hildenbrand <david@redhat.com>
>>
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index 75b4f600e3..93d0190202 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -728,6 +728,7 @@ struct MemoryRegion {
>>        const MemoryRegionOps *ops;
>>        void *opaque;
>>        MemoryRegion *container;
>> +    int mapped_via_alias; /* Mapped via an alias, container might be NULL */
>>        Int128 size;
>>        hwaddr addr;
>>        void (*destructor)(MemoryRegion *mr);
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 3bcfc3899b..1168a00819 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -2535,8 +2535,13 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
>>                                                   hwaddr offset,
>>                                                   MemoryRegion *subregion)
>>    {
>> +    MemoryRegion *alias;
>> +
>>        assert(!subregion->container);
>>        subregion->container = mr;
>> +    for (alias = subregion->alias; alias; alias = alias->alias) {
>> +       alias->mapped_via_alias++;
> 
> it it necessary to update mapped_via_alias for intermediate aliases?
> Why not just update on counter only on leaf (aliased region)?

Assume we have alias0 -> alias1 -> region and map alias0.

Once alias0 is mapped it will have ->container set and 
memory_region_is_mapped(alias0) will return "true".

With my patch, both, "alias1" and the region will be marked 
"mapped_via_alias" and memory_region_is_mapped() will succeed on both of 
them. With what you propose, memory_region_is_mapped() would only 
succeed on the region (well, and on alias 0) but not on alias1.

-- 
Thanks,

David / dhildenb


