Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5816DC05E
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 16:33:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plW53-0001hO-4o; Sun, 09 Apr 2023 10:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1plW50-0001gs-M2
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 10:31:42 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1plW4y-0007UB-Sd
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 10:31:42 -0400
Received: by mail-pl1-x634.google.com with SMTP id m18so2574171plx.5
 for <qemu-devel@nongnu.org>; Sun, 09 Apr 2023 07:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681050699;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dRNQFQ2rv2qF8cXV2/VKNIfRIrQ06SZAzGFoWJH2+qI=;
 b=TdX5ZkUpGoJMUT2Tb/4cQr3qXlPTcfkKdW2H78u4/j85HsEoxfgZmsX/yBJ3MSEuJ3
 AIrsvDx6IQFcyng7OT5IflEXTlYFtY/9q+KBSMhsgeFMozy0jSRwAVvZrWu0HhdkRd46
 1gStF8LCUMj3hR9v5MjcQF9cdQKG4GnQkf3aeCag0MkhugyMujskPMr364626vqGiZnY
 Wh+E1mimezGB+NLtuprPhGbXWkKRT5PTUGvOcJq/FX0zTA+7GfkPyOKYHw3Hs9w6hCF3
 PFBaGo0gcBbPGGC7SL3d9Zf5mvGMD1pRUu+IYLPcZzKoe5W5TFoVt5tRc2qAbrxS2+lk
 QH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681050699;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dRNQFQ2rv2qF8cXV2/VKNIfRIrQ06SZAzGFoWJH2+qI=;
 b=5CZ75D3vF2kkdS97XpXLDY3a97gZ7FjJQbn0BCPJkn770e992YXb44FRgkLxJsLGmf
 CNDkrzRuODiUHxEEhH1KcF0K7zM7r+exEaAYKEVAdeuVg1RAeiOS9c4WCC60MUPkARSI
 3JzUQmY27Yka70uMGq7G5q8fDYDhdg9ZK37VukA2NMYocr2UHn5btzSwc2NlPvvh/uEO
 qw/pwINOQbKIlEb0IJ2tJjS4vznsEBnRdcqKShr+IYQQNwviVad3Ra4PTeUITL70s8R7
 nIejBN6wS9aZ38O5ehU1PlwkGCahsiuuyogZZzfgxyj7NcR+ZYAjpQwfUhUelw+K0JTu
 1OYg==
X-Gm-Message-State: AAQBX9f1or/s6Ib2ciU+T0HfaYF/qpW9DaPaWrpQFgcP2iXbTnwCCm9Y
 wA4bxMsJm5BHU5hDysZydjA=
X-Google-Smtp-Source: AKy350bUwebo/4HiXHV0HB8nYtp4AJxrbbr8UE/yUmIaS/WmVENVhjmqOmEQDyNZ+AeozRNOVWCcOA==
X-Received: by 2002:a17:902:d509:b0:1a5:1f13:67fc with SMTP id
 b9-20020a170902d50900b001a51f1367fcmr9453968plg.31.1681050698527; 
 Sun, 09 Apr 2023 07:31:38 -0700 (PDT)
Received: from [192.168.0.115] ([113.173.97.170])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a170902834400b001a2445d9a41sm5942778pln.141.2023.04.09.07.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 07:31:38 -0700 (PDT)
Message-ID: <1021b37e-1a72-92fd-57e7-3c7dc8cf2f8c@gmail.com>
Date: Sun, 9 Apr 2023 21:31:32 +0700
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
 <60228a86-633e-3cf6-b0d9-890b032d44f3@gmail.com>
 <6c74f2c83fdd7fcf61e468cb731c9af669fd0da2.camel@infradead.org>
 <a22bb5bc-b47f-0166-f922-a186e01221ee@gmail.com>
Content-Language: en-US
In-Reply-To: <a22bb5bc-b47f-0166-f922-a186e01221ee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.888,
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

On 4/3/23 23:38, Bui Quang Minh wrote:
> On 4/3/23 17:27, David Woodhouse wrote:
>> On Wed, 2023-03-29 at 22:30 +0700, Bui Quang Minh wrote:
>>>
>>>>
>>>> I do some more testing on my hardware, your point is correct when dest
>>>> == 0xffffffff, the interrupt is delivered to all APICs regardless of
>>>> their mode.
>>>
>>> To be precisely, it only broadcasts to CPUs in xAPIC mode if the IPI
>>> destination mode is physical. In case the destination mode is logical,
>>> flat model/cluster model rule applies to determine if the xAPIC CPUs
>>> accept the IPI. Wow, this is so complicated :)
>>
>> So even if you send to *all* of the first 8 CPUs in a cluster (e.g.
>> cluster 0x0001 giving a destination 0x000100FF, a CPU in xAPIC mode
>> doesn't see that as a broadcast because it's logical mode?
> 
> I mean if the destination is 0xffffffff, the xAPIC CPU will see 
> destination as 0xff. 0xff is broadcast in physical destination mode 
> only, in logical destination, it may not be a broadcast. It may depend 
> on the whether it is flat model or cluster model in logical destination 
> mode.
> 
> In flat model, 8 bits are used as mask, so in theory, this model can 
> only support 8 CPUs, each CPU reserves its own bit by setting the upper 
> 8 bits of APIC LDR register. In Intel SDM, it is said that 0xff can be 
> interpreted as a broadcast, this is true in normal case, but I think if 
> the CPU its APIC LDR to 0, the IPI should not deliver to this CPU. This 
> also matches with the current flat model of logical destination mode 
> implementation of userspace APIC in Qemu before my series. However, I 
> see this seems like a corner case, I didn't test it on real hardware.
> 
> With cluster model, when writing the above paragraphs, I think that 0xff 
> will be delivered to all APICs (mask = 0xf) of cluster 15 (0xf). 
> However, reading the SDM more carefully, I see that the there are only 
> 15 clusters with address from 0 to 14 so there is no cluster with 
> address 15. 0xff is interpreted as broadcast to all APICs in all 
> clusters too.
> 
> In conclusion, IPI with destination 0xffffffff can be a broadcast to all 
> xAPIC CPUs too if we just ignore the corner case in flat model of 
> logical destination mode (we may need to test more)

I do some tests on my machine with custom Linux kernel module (I can't 
use kvm-unit-tests because the display on my laptop is on embedded 
display port not serial port so I don't know how to get the output). I 
find out that
- In flat model, if the CPU intentionally set its 8 bit address to 0 in 
APIC_LDR, the 0xff logical IPI does not deliver to this CPU.
- In cluster model, the 4 higher bits used as cluster address, if these 
4 bits is equal to 0xf, the IPI is broadcasted to all cluster. The 4 
lower bits are used to address APICs in the cluster. If the CPU 
intentionally set these 4 lower bits to 0 in APIC_LDR, same as the flat 
model, this CPU does not receive the logical IPI. For example, the CPUs 
set its address to 0x20 (cluster 2, address 0 in cluster), the logical 
IPI with destination == 0xff does deliver to cluster 2 but does not 
deliver to this CPU.

So I choose to stick with the current implementation, 0xffffffff in IPI 
is seen as 0xff IPI in xAPIC CPUs. This IPI if in physical mode is a 
broadcast but not in logical mode.

