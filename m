Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75532E70C6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 14:03:39 +0100 (CET)
Received: from localhost ([::1]:48870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuEf4-0003l6-BY
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 08:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kuEdy-0003Ku-OZ
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 08:02:30 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:49767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kuEdw-0003gN-PS
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 08:02:30 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 9850CDBD;
 Tue, 29 Dec 2020 08:02:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 29 Dec 2020 08:02:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=a
 y/LBql12qR3CucwEslYYxPZ9mF5sjN8ctwTeleOzaM=; b=dm0S0uhZrNV3L38p0
 +kTaAMrLYGfn8Cm+BC8zvycQod+or75Af+BiLsjPqUDWob/IhMor1F2x97jo2A2r
 6xmAUcBKzGLjGyizKuiVQzOGPKR5z6O4WuLmresQWPswi5x1QlYNbzh9YuocuxOt
 Q6vv2lHL7YUF5Tl0htjFiIVD8eaNZxdhBKmPRLIKzH/cR2A6Ir4n2GkWQ59cqz3E
 fU7hYIvmFvqTTpoU15/a5K3J+gTtqHYPNNKw+YwpGu6c+vjW9t0821rWABsPvjrk
 NgDSjHpyFrAoHb8DICeIxZtys5PVST4nl9UdBorVNAV6GRpIu1Zv7g6swnCiG7eJ
 RRKaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=ay/LBql12qR3CucwEslYYxPZ9mF5sjN8ctwTeleOz
 aM=; b=gmBVqRzVhCs8kyo0kiZXai85rHMX05aY1+nzuROYfkNrkStcihbkdni9V
 MNSBSpS6AVFBKpABzPXokrUhRMkG6XS8fwdVWXHhg5iOEAYRx2GUxBm1IiiAvS4D
 HLaiXi4nyvYlrdd71SRBT8Xgk12A+6sZ4gWhBhgj4GCoYvkxyrEiWHm1ryRkCUcp
 n9GUrFI7qbN2uCqmOVwIJhc97muxuMkI8nndwQ/1l2OV+hXDB+H/s55lBg0pIIca
 gqiMzFdK/X5qF0DCOsWdDz01Us3fct1xhZSYVueqrz8L9Dkqyg6E6avc02XPLvkb
 lILQqLmzIk9gZC2zIJV4zT82wUEsw==
X-ME-Sender: <xms:3yjrXyWzqv-jHB9oKf9cLFq-7GLiSRws727Jd5Qc8EdhmiBdnxSxgQ>
 <xme:3yjrX-mgs7zq1cdHhxxqDKt_4Cmu257hd0Dzkt1Q-_7WCjICaNCdRFF7dfZ4zs7Yk
 8Bc8sFockn6BmVMD1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvuddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpefgffelgffhvddtudevgeeguedvhfegueeffeevleevjedtgfev
 jeetfffgkedvieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepudduhe
 drudeliedrudegrddujedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:3yjrX2YxORdJycC1J5Z_T6Kaz_SYgpRiqwo_XIhUZmwU0iMLcf5J9A>
 <xmx:3yjrX5UYp4j-FV8hJpv48XFz_dF-QN_p6ufE7trFNAZIUhJLSy9dZg>
 <xmx:3yjrX8kZ22rOGGht78AAdPqN_zLzXDTCBBImo8VaRJ_hwZEdwXfR0g>
 <xmx:4CjrXzvVGCrKWSpRqoIWShrG3gLtmSOISJ6buUlS0HdiqO7hQfY457ouZxY>
Received: from [192.168.1.203] (unknown [115.196.14.171])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3545B24005D;
 Tue, 29 Dec 2020 08:02:19 -0500 (EST)
Subject: Re: Bug in Bonito? (mips/fuloong2e)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <771a6cd4-90a7-662e-5a5b-e8a9395a875@eik.bme.hu>
 <c655a692-991e-b633-456a-6fb149520a37@flygoat.com>
 <511225e2-f074-4318-4fb0-f695ca6befe0@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <e6060d69-4e39-3a95-0f0a-504e1eacec78@flygoat.com>
Date: Tue, 29 Dec 2020 21:02:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <511225e2-f074-4318-4fb0-f695ca6befe0@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=64.147.123.26;
 envelope-from=jiaxun.yang@flygoat.com; helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.07,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2020/12/29 18:47, Philippe Mathieu-Daudé 写道:
> On 12/29/20 6:26 AM, Jiaxun Yang wrote:
>> 在 2020/12/29 上午11:26, BALATON Zoltan 写道:
>>> Hello,
>>>
>>> While continuing with part two of my vt82c686b clean ups I've tried to
>>> implement SMBus IO base configuration in the vt82c686b-pm part that
>>> I've already done for vt8231 for pegasos2 and it should be the same
>>> for 686B. (In short, writing address to pm config 0x90 sets base
>>> address of smbus regs and bit 0 of 0xd2 enables/disables it.) This is
>>> what the firmware does first and it would allow removing hard coded
>>> 0xeee1 value and the property to set it and then I could reuse the
>>> same PM part in VT8231.
>>>
>> [...]
>>> Any idea what this is trying to do and how to fix it?
>> It's trying to translate Bonito style PCI config space r/w to standard PCI
>> config space R/W.
>>
>> A quick galance told me change BONITO_PCICONF_REG_MASK to 0xff
>> may help.
> Per the datasheet section "5.7.5. Accessing PCI configuration space"
> 0xfc is the correct value, but the register number starts at the 2nd
> bit. So this is not a write access to register 0xd2 but 0x34?

It seems like Loongson changed defination of the register?
There is no shifting in kernel[1] as well.

```
/* Type 1 configuration for offboard PCI bus */
addr = (busnum << 16) | (device << 11) | (function << 8) | reg;
```

Thanks.

[1]: 
https://elixir.bootlin.com/linux/latest/source/arch/mips/pci/ops-loongson2.c

- Jiaxun
>
> If you can test, this is the snippet I plan to send later:
>
> -- >8 --
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index a99eced0657..65953766dd0 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -189,3 +189,3 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
>   #define BONITO_PCICONF_REG_MASK        0xFC
> -#define BONITO_PCICONF_REG_OFFSET      0
> +#define BONITO_PCICONF_REG_OFFSET      2
> ---
>
>> Thanks.
>>
>> - Jiaxun
>>
>>> Regards,
>>> BALATON Zoltan
>>


