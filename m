Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825836CC747
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:00:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phBij-00045R-MI; Tue, 28 Mar 2023 11:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1phBii-00045D-CE
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 11:58:48 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1phBig-00039g-0U
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 11:58:47 -0400
Received: by mail-pl1-x62c.google.com with SMTP id k2so12116673pll.8
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680019124;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zQ8JkDuPYXhJ20lO0C4CEhmFpK3es2ye2W45SeqrNSE=;
 b=qE4xNIzd7emXAedprQlGEcpah8NJVuJmUjDRevSSOdmECc5mHXKHv9Tg4OqZJ6FHhT
 TZkP5hpDp7mmwG0zmQ3DS6aoVBm21UjJCIYssYPsdjnEuJaoph30KYAKEfIHC6ktqeto
 48QIiTpC83JS0wZWKVyzh+cX20xNd1FiD5sXdaThpcdwHMWm9UvHOjFyRLhc7IXq3hlj
 C01hSLRfgXwS+HSq2gWiuTJnRl5kJwdz6hmukwEwn78m6UHgSP09YZe1LOXyjEArzbkg
 h46fA2zUFHQXF6fRbMdpplbp9wmyOWBRtMnEN5ZNscFhWmGANLmFCpNzn2g10yvtFwDZ
 z8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680019124;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zQ8JkDuPYXhJ20lO0C4CEhmFpK3es2ye2W45SeqrNSE=;
 b=lcigOxsnt25XtfGXQDfi8jfA+Yy9QjxhDDpkP8H+uxW+GKeWAbnCGyQ6QDMF09Ql9I
 HRAUkCpRro8vl4Bg8MhPxk2x2OV2XGa9pKRgnThjodTWBGG8ziNaitS+TQiRkWs44SUE
 rzix2oYvhqy8QfaSukgVq2rqnirIUySjT2+PJh06x7ePBwNHediW5fT3NNPDsVkHTcDO
 cP/k5z/ZUrT/MgFWf5y7Uoqj0UEPXjU4SkwgyA+xCm8Bn31OM2Vx3zopVbQXNAMH5XbY
 D1Nqe2W8U8knkP10JaN4yA5W46eiI9ZTWebEwoZqQYqit8by9iUQYrYEHxOUNEbZBHt0
 fe7g==
X-Gm-Message-State: AAQBX9fh0zw5/YUkmpJHH5ATJJzaNyID2jj2UJ98AN14QiM+ZPa/sA2L
 vwOmJH8HFnlCKOlj1nfc3vA=
X-Google-Smtp-Source: AKy350ZS0SlqGezeOmGGiY5eeRQssmuxeIiEQhpgwIZmrr461Cd6/uipZrfuW7hfkj/Tx3tcbt3VUQ==
X-Received: by 2002:a17:90b:4d8b:b0:234:bf0:86b9 with SMTP id
 oj11-20020a17090b4d8b00b002340bf086b9mr16415686pjb.25.1680019123742; 
 Tue, 28 Mar 2023 08:58:43 -0700 (PDT)
Received: from [192.168.0.115] ([113.173.97.170])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a170902ab9100b001966d94cb2esm21221182plr.288.2023.03.28.08.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 08:58:43 -0700 (PDT)
Message-ID: <49167ae7-4cb4-3863-64b1-1396e1911bbf@gmail.com>
Date: Tue, 28 Mar 2023 22:58:37 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/5] apic: add support for x2APIC mode
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
Content-Language: en-US
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <e47b58ef574bcf61259d7d3f0707a1f5ca808ff6.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pl1-x62c.google.com
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

On 3/27/23 23:49, David Woodhouse wrote:
> On Mon, 2023-03-27 at 23:35 +0700, Bui Quang Minh wrote:
>> On 3/27/23 23:22, David Woodhouse wrote:
>>> On Mon, 2023-03-27 at 22:45 +0700, Bui Quang Minh wrote:
>>>>
>>>>> Maybe I'm misreading the patch, but to me it looks that
>>>>> if (dest == 0xff) apic_get_broadcast_bitmask() bit applies even in
>>>>> x2apic mode? So delivering to the APIC with physical ID 255 will be
>>>>> misinterpreted as a broadcast?
>>>>
>>>> In case dest == 0xff the second argument to apic_get_broadcast_bitmask
>>>> is set to false which means this is xAPIC broadcast
>>>
>>> Yeah, but it *isn't* xAPIC broadcast. It's X2APIC unicast to APIC#255.
>>>
>>> I think you want (although you don't have 'dev') something like this:
>>>
>>>
>>> static void apic_get_delivery_bitmask(uint32_t *deliver_bitmask,
>>>                                         uint32_t dest, uint8_t dest_mode)
>>> {
>>>       APICCommonState *apic_iter;
>>>       int i;
>>>
>>>       memset(deliver_bitmask, 0x00, max_apic_words * sizeof(uint32_t));
>>>
>>>       /* x2APIC broadcast id for both physical and logical (cluster) mode */
>>>       if (dest == 0xffffffff) {
>>>           apic_get_broadcast_bitmask(deliver_bitmask, true);
>>>           return;
>>>       }
>>>
>>>       if (dest_mode == 0) {
>>>           apic_find_dest(deliver_bitmask, dest);
>>>           /* Broadcast to xAPIC mode apics */
>>> -        if (dest == 0xff) {
>>> +        if (dest == 0xff && is_x2apic_mode(dev)) {
>>>               apic_get_broadcast_bitmask(deliver_bitmask, false);
>>>           }
>>>       } else {
>>>
>>
>> Hmm, the unicast case is handled in apic_find_dest function, the logic
>> inside the if (dest == 0xff) is for handling the broadcast case only.
>> This is because when dest == 0xff, it can be both a x2APIC unicast and
>> xAPIC broadcast in case we have some CPUs that are in xAPIC and others
>> are in x2APIC.
> 
> Ah! Yes, I see it now.
> 
> Shouldn't apic_get_broadcast_bitmask(… true) add *all* APICs to the
> mask, regardless of their mode? An APIC which is still in xAPIC mode
> will only look at the low 8 bits and see 0xFF which it also interprets
> as broadcast? Or is that not how real hardware behaves?

This is interesting. Your point looks reasonable to me but I don't know 
how to verify it, I'm trying to write kernel module to test it but there 
are just too many things running on Linux that uses interrupt so the 
system hangs.

This raises another question: when dest == 0x102 in IPI, does the xAPIC 
mode CPU with APIC ID 0x2 accept the IPI? I can't see this stated 
clearly in the Intel SDM.

> 
>>   Do you think the code here is tricky and hard to read?
> 
> Well, I completely failed to read it... :)
> 
> I think changing the existing comment something like this might help...
> 
> -         /* Broadcast to xAPIC mode apics */
> +         /* Any APIC in xAPIC mode will interpret 0xFF as broadcast */
> 
> Coupled with a comment on apic_get_delivery_bitmask() clarifying that
> it depends on the mode of each APIC it considers — which is obvious
> enough in retrospect now I read the code and you point it out to me,
> but empirically, we have to concede that it wasn't obvious *enough* :)


