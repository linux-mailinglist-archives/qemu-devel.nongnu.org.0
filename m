Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9755A6F35
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 23:35:54 +0200 (CEST)
Received: from localhost ([::1]:39636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT8tl-0001vc-70
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 17:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT8sE-0000Ui-JO
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 17:34:18 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:39854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT8sC-0007aZ-S7
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 17:34:18 -0400
Received: by mail-pf1-x42b.google.com with SMTP id t129so12605058pfb.6
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 14:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=Nr52KkOq6Jdxf2a/oeW/WN3yzyR7u18vVa2Fk1rL1ZI=;
 b=hW4FEKKJKcFKHDr8ZGzp9ZnnjSg7z4zsLsZRRnAk4gH/XnBNiLB3eZHi6PhLw/Obv7
 wbI0d6b1fgsirUYSwWThmv+VrbPBIYDDMeVAlj2cXvLyls8cfbtZbyhU5ANNvG+oQzHI
 L6fAK8R4Ys8w7CIBsS02r+z3GoEcmkynShlTT2Vvr4ZNJEfKSWQLgfEQ3zDYHc0I+iJh
 Cyw3m7tuE5z2UoB1SD/6nQU05Za2LH0BIra+UMe2xyeh1QKkZiVvNVwQdA/O+JlazT8i
 FrW5+01Vxf86WvPf58a/F00emriZklK3o7bY/NAb153kniceU610GAUtpn8UU0lRmdte
 UNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=Nr52KkOq6Jdxf2a/oeW/WN3yzyR7u18vVa2Fk1rL1ZI=;
 b=CyX+xersIqmukJevTNgSkktZnPllLwL8suUbS7EThIiC9X/OMRELpfEKh9BaB/6cyD
 YS1h0zznBEAnC5KP/4kMnJXG9ONfOC3NDSyIjte89SulH/1lIaO9QD3HO0dpw1BOUewx
 KT454jbA/d49hpYmwU5GvLV6inkinjzvKjcLS+6M303G1mEjwYXp6Hvu2EQYsOS3p347
 vAG2/6sIM2GgUECCOcTMNhBHLnIHhbRRQnZHrKVM1d1DRYR7Z5ACH6OhkzWys9icUqHS
 dPV1zFzLT2jxKzfzvtTGtLI4A0PYHcYBilEUbVP3xRGrjZjWdKFGTs++sM0DfX01iogd
 OETA==
X-Gm-Message-State: ACgBeo3VPfCm33xXzT4+fOPrvMKGYfuTs+K83j7FOjKOTGb5FggbyLeX
 vNdDps9Lz1zYoPSDWgikHHo=
X-Google-Smtp-Source: AA6agR5a97cQYX8yCX6rYgspH1p0p0tpUAvVZ6jsq2WvHEzq9+WVnY5LTk0pjz3cDzgdPobZq/gW4Q==
X-Received: by 2002:a05:6a00:2291:b0:539:d5b8:4ecc with SMTP id
 f17-20020a056a00229100b00539d5b84eccmr4845878pfe.79.1661895255130; 
 Tue, 30 Aug 2022 14:34:15 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a170902da8500b0016d7b2352desm10336529plx.244.2022.08.30.14.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 14:34:14 -0700 (PDT)
Message-ID: <88e392d2-d9d1-8d32-d3ab-c2f8875c68e3@amsat.org>
Date: Tue, 30 Aug 2022 23:34:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] softmmu/physmem: Fix address of FlatView access in
 address_space_(read|write)_cached_slow()
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220826160927.322797-1-afaria@redhat.com>
 <YwppmYUOLTqQ7K25@xz-m1.local>
 <f79cbf92-bb68-67c2-7e7d-a4ac2e09151a@amsat.org>
 <Yw44PpN0CfVt+OJm@xz-m1.local>
In-Reply-To: <Yw44PpN0CfVt+OJm@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 30/8/22 18:18, Peter Xu wrote:
> On Tue, Aug 30, 2022 at 02:06:32PM +0200, Philippe Mathieu-Daudé wrote:
>> On 27/8/22 20:59, Peter Xu wrote:
>>> Hi, Alberto,
>>>
>>> On Fri, Aug 26, 2022 at 05:09:27PM +0100, Alberto Faria wrote:
>>>> Apply cache->xlat to addr before passing it to
>>>> flatview_(read|write)_continue(), to convert it from the
>>>> MemoryRegionCache's address space to the FlatView's.
>>>
>>> Any bug encountered?  It'll be great to add more information into the
>>> commit message if there is.  We could also mention the issue was observed
>>> by code review or so.
>>
>> Agreed.
>>
>>>>
>>>> Fixes: 48564041a7 ("exec: reintroduce MemoryRegion caching")
>>>> Co-Developed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>> Signed-off-by: Alberto Faria <afaria@redhat.com>
>>>> ---
>>>>    softmmu/physmem.c | 12 ++++++------
>>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>>>> index dc3c3e5f2e..95d4c77cc3 100644
>>>> --- a/softmmu/physmem.c
>>>> +++ b/softmmu/physmem.c
>>>> @@ -3450,9 +3450,9 @@ address_space_read_cached_slow(MemoryRegionCache *cache, hwaddr addr,
>>>>        l = len;
>>>>        mr = address_space_translate_cached(cache, addr, &addr1, &l, false,
>>>>                                            MEMTXATTRS_UNSPECIFIED);
>>>> -    return flatview_read_continue(cache->fv,
>>>> -                                  addr, MEMTXATTRS_UNSPECIFIED, buf, len,
>>>> -                                  addr1, l, mr);
>>>> +    return flatview_read_continue(cache->fv, cache->xlat + addr,
>>
>> So this is just addr1...
> 
> It may not; note that in address_space_translate_cached() the xlat pointer
> will also be passed over to address_space_translate_iommu(), so it can be
> further modified to point to the real MR address behind the IOMMU.

Oh, I missed that call.

>>
>>>> +                                  MEMTXATTRS_UNSPECIFIED, buf, len, addr1, l,
>>>> +                                  mr);
>>>>    }
>>>>    /* Called from RCU critical section. address_space_write_cached uses this
>>>> @@ -3468,9 +3468,9 @@ address_space_write_cached_slow(MemoryRegionCache *cache, hwaddr addr,
>>>>        l = len;
>>>>        mr = address_space_translate_cached(cache, addr, &addr1, &l, true,
>>>>                                            MEMTXATTRS_UNSPECIFIED);
>>>> -    return flatview_write_continue(cache->fv,
>>>> -                                   addr, MEMTXATTRS_UNSPECIFIED, buf, len,
>>>> -                                   addr1, l, mr);
>>>> +    return flatview_write_continue(cache->fv, cache->xlat + addr,
>>>> +                                   MEMTXATTRS_UNSPECIFIED, buf, len, addr1, l,
>>>> +                                   mr);
>>>>    }
>>>
>>> The issue looks correct, but I hesitate on the fix.. since afaict
>>> cache->xlat is per memory region not flat view, so the new calculation is
>>> offset within memory region but not flat view too.
>>>
>>> So I'm wondering whether it should become:
>>>
>>>     cache->xlat + addr - cache.mrs.offset_within_region +
>>>       cache.mrs.offset_within_address_space
>>
>> If so, shouldn't this be calculated [*] within
>> address_space_translate_cached() instead of the caller?
>>
>> [*] Maybe passed as another pointer to hwaddr
> 
> No strong opinion, but that looks like a duplication of information we
> have.  Maybe we can also have a helper to convert the cache address space
> to global address space.

Ah yes, a helper is clever.


