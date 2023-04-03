Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217266D4E20
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:39:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjNCk-0001Pp-TQ; Mon, 03 Apr 2023 12:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pjNCi-0001PS-VB
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:38:48 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pjNCh-000234-CW
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:38:48 -0400
Received: by mail-pg1-x52d.google.com with SMTP id y19so17874286pgk.5
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 09:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680539926;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FFMWS8jiqEa2gM08UsXQcEYamZkLn0tRxFIjbeX/6As=;
 b=DDbqUXWGDfn4NmIORYL0x4te99t4qC7vm03DCX9AyB9ip46ZzmoSUwb0jYBu/hQAj1
 JKMJ9hqLlAgOqJ893h/+hvjL7D3V+Z2ULOxe1O6jgCos79rpnCIxrfxtCJuti3cBFd8A
 XB7HjWP2eA59We0oKOgrAr/KlBHUaJ1lyWIC4jVW+XmcBtt5twNhYZARvhPyhklSkQQr
 LepJztu+UNZUaB7LO+/QdvVb1fukCZnsMiLaSC7IEDvzd7HKhlu83FoSDSHTlBQOrnBr
 lR9BZlW1uTmQe++pU6dEMnkrpsphRgoQojCctmMXqVFgRHvu1/wz46J54x0bdxPcMwe3
 SeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680539926;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FFMWS8jiqEa2gM08UsXQcEYamZkLn0tRxFIjbeX/6As=;
 b=KnNFwwoDCiL60xIO+pKGh5eCD6Hq2Br+MRMmonjbSBXB7rh1gOmLTNJ4wVNFkhV2Sh
 luEG5jqy74fHGgeQRPdZAtr+ck4FennclFb6c5kAnT4heIMoLyZg67YwwX86wuYuLGSZ
 YvphRTCaBSe8g90tikhVflJUm2Zvk97JzHxuAoKanAYcHAtcFAPhP6fTZYF4BKpwKH9w
 4sIpJ5kCshq7NF/8TwRlX1enMfdPzTPQ9JU98wQthhsVG3jJbY0MG1F2/faIaozBaisQ
 AoyI0VlO4pPzleXn8MmWXgSRpj981t/tKzeHhAsFVvVAo5f8wb2ovAQCRytLYz6BFRDM
 Ztrg==
X-Gm-Message-State: AAQBX9f7fVVSNyEZSwba6DWI63hxFm6vb6xNULFubH4IbshTII+vfPJe
 AQuevF+ysXkA4uHhgP9ahMg=
X-Google-Smtp-Source: AKy350bjFaTExPukzW1LnG7Z84qhfmKxRaNvXLWiZeq+ElAX1TixgjJRPTdDa+qm/3gpScRyPWxkqQ==
X-Received: by 2002:a62:1812:0:b0:627:a283:5a04 with SMTP id
 18-20020a621812000000b00627a2835a04mr29401531pfy.27.1680539925465; 
 Mon, 03 Apr 2023 09:38:45 -0700 (PDT)
Received: from [192.168.0.115] ([113.173.97.170])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a056a0014d600b005810c4286d6sm4754929pfu.0.2023.04.03.09.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 09:38:45 -0700 (PDT)
Message-ID: <a22bb5bc-b47f-0166-f922-a186e01221ee@gmail.com>
Date: Mon, 3 Apr 2023 23:38:15 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/5] apic: add support for x2APIC mode
Content-Language: en-US
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
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <6c74f2c83fdd7fcf61e468cb731c9af669fd0da2.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.349,
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

On 4/3/23 17:27, David Woodhouse wrote:
> On Wed, 2023-03-29 at 22:30 +0700, Bui Quang Minh wrote:
>>
>>>
>>> I do some more testing on my hardware, your point is correct when dest
>>> == 0xffffffff, the interrupt is delivered to all APICs regardless of
>>> their mode.
>>
>> To be precisely, it only broadcasts to CPUs in xAPIC mode if the IPI
>> destination mode is physical. In case the destination mode is logical,
>> flat model/cluster model rule applies to determine if the xAPIC CPUs
>> accept the IPI. Wow, this is so complicated :)
> 
> So even if you send to *all* of the first 8 CPUs in a cluster (e.g.
> cluster 0x0001 giving a destination 0x000100FF, a CPU in xAPIC mode
> doesn't see that as a broadcast because it's logical mode?

I mean if the destination is 0xffffffff, the xAPIC CPU will see 
destination as 0xff. 0xff is broadcast in physical destination mode 
only, in logical destination, it may not be a broadcast. It may depend 
on the whether it is flat model or cluster model in logical destination 
mode.

In flat model, 8 bits are used as mask, so in theory, this model can 
only support 8 CPUs, each CPU reserves its own bit by setting the upper 
8 bits of APIC LDR register. In Intel SDM, it is said that 0xff can be 
interpreted as a broadcast, this is true in normal case, but I think if 
the CPU its APIC LDR to 0, the IPI should not deliver to this CPU. This 
also matches with the current flat model of logical destination mode 
implementation of userspace APIC in Qemu before my series. However, I 
see this seems like a corner case, I didn't test it on real hardware.

With cluster model, when writing the above paragraphs, I think that 0xff 
will be delivered to all APICs (mask = 0xf) of cluster 15 (0xf). 
However, reading the SDM more carefully, I see that the there are only 
15 clusters with address from 0 to 14 so there is no cluster with 
address 15. 0xff is interpreted as broadcast to all APICs in all 
clusters too.

In conclusion, IPI with destination 0xffffffff can be a broadcast to all 
xAPIC CPUs too if we just ignore the corner case in flat model of 
logical destination mode (we may need to test more)

> I would have assumed that a CPU in xAPIC mode would have looked at the
> low byte and interpreted it as xAPIC logical mode, with the cluster in
> the high nybble and the 4-bit mask in the low nybble?

Yes, this is the behavior in cluster model of logical destination mode 
(I try to stick with Intel SDM Section 10.6.2.2 Volume 3A when using 
those terminologies)

