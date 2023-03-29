Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 534C56CECEA
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 17:31:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phXlJ-0001xk-9M; Wed, 29 Mar 2023 11:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1phXlH-0001xR-AD
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 11:30:55 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1phXlF-00006b-6r
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 11:30:54 -0400
Received: by mail-pf1-x435.google.com with SMTP id z11so10542124pfh.4
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 08:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680103851;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=h2YQt6aUp21nRS6SH81L2sEV3cEwrfnZowLIjU5Z7ms=;
 b=OACFL1Y4khU3UjknG6XNi5pJJYg1D0VBtrhuIGRSqB2/YIY1NLUX32C+/DfgMPjg1d
 x7n9xTJQN6VtEUGVa6pDlz7Y6S4xOngOeMSRaFdmpl+exxgTOlQuEEsItHkQOH4HtbML
 QlvaJ2TK6eT02MnGYxZRNJyzKr2YRfsqKG7QVuM4fwNmdJjfFlJyZR6p0YZRZ6IDnjE/
 ij08PKiGc1zo65f5mefn11EHLnA7Kg1Uv03CCfnmjtHhQb5gBYBDUI9docC2HfGsQ//W
 MPJT/JvbUaH5r23RepuBMD6/yztGtmCE0Vx3090ZnTHZB4f0Gpx3Uc05tTA5mUZH+rlL
 nqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680103851;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h2YQt6aUp21nRS6SH81L2sEV3cEwrfnZowLIjU5Z7ms=;
 b=QDjPphU8oG3JDPHy5ThFIqxtBkjoOAKlT2SW20Rh+FKIV9wzYE5vgwAQZoqptx1thO
 /cR1EO/mI4ObqY22dTjxYR17wZqOuAY7ze08LD+fhBPVRS4mYH6zt/dzOea1AMJYpiHt
 oD/ytjREbLnnlIASbj4XFx+dDuENK9qmJF7lQdqwDUa3rXnQ+5Yw0BVBqLDNRZAPz+bY
 YjEmjDvecH3F6dYZbSoTa6VopZLSG6NXKaspSxQUz8lvjHW2P7BnGNe9rehLnfT63BUL
 se6X37JZedpm1ie6Kco8AnJjtx+ztW8ySRPBUapBNyG6FArWgROMBSF6pRWKowAl3QHG
 yIJg==
X-Gm-Message-State: AAQBX9eRWPAReelO4PgNzj0ntqZAEt8hk18Zw2yOzluj9dwcdAyUL8zT
 yGA71m/o1dwtJ/08tNHMUs0=
X-Google-Smtp-Source: AKy350Yy9bDcKWx/wnvRvF8uquqc1CQhFv6Y+QlMxd3uWQenNpSGvoic/r3YNj6K5lFlr0JRmhy2/A==
X-Received: by 2002:a62:be0d:0:b0:626:f690:e745 with SMTP id
 l13-20020a62be0d000000b00626f690e745mr2424671pff.6.1680103851320; 
 Wed, 29 Mar 2023 08:30:51 -0700 (PDT)
Received: from [192.168.0.115] ([113.173.97.170])
 by smtp.gmail.com with ESMTPSA id
 s22-20020aa78d56000000b006243e706195sm23114764pfe.196.2023.03.29.08.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 08:30:49 -0700 (PDT)
Message-ID: <60228a86-633e-3cf6-b0d9-890b032d44f3@gmail.com>
Date: Wed, 29 Mar 2023 22:30:44 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/5] apic: add support for x2APIC mode
From: Bui Quang Minh <minhquangbui99@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S . Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230326052039.33717-1-minhquangbui99@gmail.com>
 <20230326052039.33717-3-minhquangbui99@gmail.com>
 <a8ea36d901a1b713ab8bc0f5bcd1b7d26ad6f9cb.camel@infradead.org>
 <05d55576-f703-18a1-7f9f-4c15b8c54490@gmail.com>
 <0944a6f4c7c1569c182a27d40bdeb0a164a41bbb.camel@infradead.org>
 <61446cfb-f937-3a0d-2a98-34febcc7e4f3@gmail.com>
 <3834475953c0f865e88251886f1e861d51c25a2b.camel@infradead.org>
 <445928d9-4cd3-978d-ce76-9cd01457b6f0@gmail.com>
 <e47b58ef574bcf61259d7d3f0707a1f5ca808ff6.camel@infradead.org>
 <49167ae7-4cb4-3863-64b1-1396e1911bbf@gmail.com>
 <37cbb3b9-8a9a-2b88-2e09-a81f46b8bf74@gmail.com>
Content-Language: en-US
In-Reply-To: <37cbb3b9-8a9a-2b88-2e09-a81f46b8bf74@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/29/23 21:53, Bui Quang Minh wrote:
> On 3/28/23 22:58, Bui Quang Minh wrote:
>> On 3/27/23 23:49, David Woodhouse wrote:
>>> On Mon, 2023-03-27 at 23:35 +0700, Bui Quang Minh wrote:
>>>> On 3/27/23 23:22, David Woodhouse wrote:
>>>>> On Mon, 2023-03-27 at 22:45 +0700, Bui Quang Minh wrote:
>>>>>>
>>>>>>> Maybe I'm misreading the patch, but to me it looks that
>>>>>>> if (dest == 0xff) apic_get_broadcast_bitmask() bit applies even in
>>>>>>> x2apic mode? So delivering to the APIC with physical ID 255 will be
>>>>>>> misinterpreted as a broadcast?
>>>>>>
>>>>>> In case dest == 0xff the second argument to 
>>>>>> apic_get_broadcast_bitmask
>>>>>> is set to false which means this is xAPIC broadcast
>>>>>
>>>>> Yeah, but it *isn't* xAPIC broadcast. It's X2APIC unicast to APIC#255.
>>>>>
>>>>> I think you want (although you don't have 'dev') something like this:
>>>>>
>>>>>
>>>>> static void apic_get_delivery_bitmask(uint32_t *deliver_bitmask,
>>>>>                                         uint32_t dest, uint8_t 
>>>>> dest_mode)
>>>>> {
>>>>>       APICCommonState *apic_iter;
>>>>>       int i;
>>>>>
>>>>>       memset(deliver_bitmask, 0x00, max_apic_words * 
>>>>> sizeof(uint32_t));
>>>>>
>>>>>       /* x2APIC broadcast id for both physical and logical 
>>>>> (cluster) mode */
>>>>>       if (dest == 0xffffffff) {
>>>>>           apic_get_broadcast_bitmask(deliver_bitmask, true);
>>>>>           return;
>>>>>       }
>>>>>
>>>>>       if (dest_mode == 0) {
>>>>>           apic_find_dest(deliver_bitmask, dest);
>>>>>           /* Broadcast to xAPIC mode apics */
>>>>> -        if (dest == 0xff) {
>>>>> +        if (dest == 0xff && is_x2apic_mode(dev)) {
>>>>>               apic_get_broadcast_bitmask(deliver_bitmask, false);
>>>>>           }
>>>>>       } else {
>>>>>
>>>>
>>>> Hmm, the unicast case is handled in apic_find_dest function, the logic
>>>> inside the if (dest == 0xff) is for handling the broadcast case only.
>>>> This is because when dest == 0xff, it can be both a x2APIC unicast and
>>>> xAPIC broadcast in case we have some CPUs that are in xAPIC and others
>>>> are in x2APIC.
>>>
>>> Ah! Yes, I see it now.
>>>
>>> Shouldn't apic_get_broadcast_bitmask(… true) add *all* APICs to the
>>> mask, regardless of their mode? An APIC which is still in xAPIC mode
>>> will only look at the low 8 bits and see 0xFF which it also interprets
>>> as broadcast? Or is that not how real hardware behaves?
>>
>> This is interesting. Your point looks reasonable to me but I don't 
>> know how to verify it, I'm trying to write kernel module to test it 
>> but there are just too many things running on Linux that uses 
>> interrupt so the system hangs.
>>
>> This raises another question: when dest == 0x102 in IPI, does the 
>> xAPIC mode CPU with APIC ID 0x2 accept the IPI? I can't see this 
>> stated clearly in the Intel SDM.
> 
> I do some more testing on my hardware, your point is correct when dest 
> == 0xffffffff, the interrupt is delivered to all APICs regardless of 
> their mode.

To be precisely, it only broadcasts to CPUs in xAPIC mode if the IPI 
destination mode is physical. In case the destination mode is logical, 
flat model/cluster model rule applies to determine if the xAPIC CPUs 
accept the IPI. Wow, this is so complicated :)


> And when dest == 0x102 in IPI, xAPIC mode CPU with APIC ID 
> 0x2 also accepts that IPI.

