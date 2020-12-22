Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6DA2E0375
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 01:38:01 +0100 (CET)
Received: from localhost ([::1]:41544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krVgd-000887-Rn
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 19:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1krVex-0007g7-3d
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:36:15 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:49345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1krVev-0002mD-4U
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:36:14 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3941C5803F7;
 Mon, 21 Dec 2020 19:36:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 21 Dec 2020 19:36:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=3
 //LIdcIHl4cNJobiVPF6MYORvYHfTS3PNkL0cC0HaE=; b=YZ8+g7VYaCAsEFr45
 ERrFkv5ABE/brNsdBfgzvDSd5J70A25hzRwAndcrswDyUhbjS9KBitYhkTWv4e3S
 emvw9/GPxWrpibfbGVXyQR3wrAXU41DyrVTYQdAiXuyJDvaNpkpxYaoKxmuKhvw/
 rEEpxandym+Nuba5bJ8y2OkKCxjrCBluZ/I5jbrdEgP5cjLFKCi1AZiEAkNLhUb0
 3V2AsM5Y0seO7GkeoIGc/K9QbWigHUy7s+VLlcJG03Tqt425t3rkFbqLRKzPg1VV
 1AOuD/q7lPTSWQVJc7rqBzGleaa+7D5eBBQlgyaPdYUth3OpGkPIoM8dwrVBo/Kq
 +nrMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=3//LIdcIHl4cNJobiVPF6MYORvYHfTS3PNkL0cC0H
 aE=; b=i1dgbYKQUZDH8Cek3WSpQmHARbp3smj5YHQ5nU6WCgG/Mes1h1msbfbX/
 hD7upBIKXwoBnOoBkTyD/56+sPkTD6ETfxZzw99aJIIfp2Jcnq/DbNdalrZVEN+J
 M29DyyT4MI2J/IFaOPLvcJT9PDbIOB3d58XD+yYVKfWF4lc4vZ94b4xDAX6JllUh
 +0X6viOudA0/svqeHkFQkeMzdxUQNunobu7UQwWYvN8ipUqM7qC0jGYMQRNz20IO
 +EIH2Rrwg/6/AGFmd3ju0KO9qSoYpYblsTeLZVpflXblXC+gBtTBqYKFB0vBxbLr
 CNVTy+uwqhk1y9z65Qt+w4IWq39Dw==
X-ME-Sender: <xms:ez_hX76H7KiQkpqRO9FqQDuBAG5bQ8Y-YPqmaG6P3SKt05bJVQ0rBQ>
 <xme:ez_hXw6cyJ0oTNW6Yh8GYrePxUFfwj9HgesUKW8kt5KHwu6j0HflFqPTvz8uZDt3h
 MeRkfJpJzoVnLJXwkM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtfedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtke
 ertddtfeejnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
 ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepgffflefghfdvtdduve
 eggeeuvdfhgeeufeefveelveejtdfgveejteffgfekvdeinecuffhomhgrihhnpegsohho
 thhlihhnrdgtohhmnecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
 lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:ez_hXyde52IjEoajiNi2T4SpMS4pemnInbHWS7td9P3O3YtxEz8ufg>
 <xmx:ez_hX8KM8d0ER4m3RW8p7KFeB_1jVJwkG6h5bddau2PDXYL49XuK-g>
 <xmx:ez_hX_L-ar_Pc8T0IcKnazjyefGnSUgpBMGBIEhrXr4dczSmMzkBxw>
 <xmx:ez_hX1iu8JO5bZQkJuRn0pbUBy9LX95EDkNGLpvVIMMSV0H9YgjBF4VgM4s>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id A2591108005B;
 Mon, 21 Dec 2020 19:36:08 -0500 (EST)
Subject: Re: [PATCH v2 4/8] hw/pci-host/bonito: Fixup pci.lomem mapping
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219071816.37963-2-jiaxun.yang@flygoat.com>
 <05d6819c-67dd-9275-e9df-1a26baf807ee@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <1089c6a2-e446-9312-4edb-090a6ae8bf72@flygoat.com>
Date: Tue, 22 Dec 2020 08:36:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <05d6819c-67dd-9275-e9df-1a26baf807ee@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: permerror client-ip=66.111.4.230;
 envelope-from=jiaxun.yang@flygoat.com; helo=new4-smtp.messagingengine.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.233,
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
Cc: chenhuacai@kernel.org, wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2020/12/22 上午4:45, Philippe Mathieu-Daudé 写道:
> On 12/19/20 8:18 AM, Jiaxun Yang wrote:
>> The original mapping had wrong base address.
>> Fix by correct the base adress and merge three alias into
>> a single.
> Why merge? Beside, typo "address".


Hi Philippe,

Thanks for your reviewing!

Because I can't understand why it was in three pieces.
I was just trying to do what kernel as I don't have much knowledge with
Fuloong2E.

The kernel treated PCI region as a whole part[1] at 0x10000000 with size
0x0c000000.

It fixed long lasting radeonfb starting failure.

>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>   hw/pci-host/bonito.c | 17 ++++++-----------
>>   1 file changed, 6 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
>> index 43b79448a9..3a31ba42f2 100644
>> --- a/hw/pci-host/bonito.c
>> +++ b/hw/pci-host/bonito.c
>> @@ -608,7 +608,7 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
>>   {
>>       PCIHostState *phb = PCI_HOST_BRIDGE(dev);
>>       BonitoState *bs = BONITO_PCI_HOST_BRIDGE(dev);
>> -    MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 3);
>> +    MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 1);
>>   
>>       memory_region_init(&bs->pci_mem, OBJECT(dev), "pci.mem", BONITO_PCIHI_SIZE);
>>       phb->bus = pci_register_root_bus(dev, "pci",
>> @@ -616,16 +616,11 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
>>                                        dev, &bs->pci_mem, get_system_io(),
>>                                        0x28, 32, TYPE_PCI_BUS);
>>   
>> -    for (size_t i = 0; i < 3; i++) {
>> -        char *name = g_strdup_printf("pci.lomem%zu", i);
>> -
>> -        memory_region_init_alias(&pcimem_lo_alias[i], NULL, name,
>> -                                 &bs->pci_mem, i * 64 * MiB, 64 * MiB);
>> -        memory_region_add_subregion(get_system_memory(),
>> -                                    BONITO_PCILO_BASE + i * 64 * MiB,
>> -                                    &pcimem_lo_alias[i]);
>> -        g_free(name);
>> -    }
>> +    memory_region_init_alias(pcimem_lo_alias, OBJECT(dev), "pci.lomem",
>> +                             &bs->pci_mem, BONITO_PCILO_BASE,
>> +                             BONITO_PCILO_SIZE);
> Why is your pci_mem mapped at 0?

It is actually started at 0x10000000.

As: #define BONITO_PCILO_BASE       0x10000000


Thanks.

[1]: 
https://elixir.bootlin.com/linux/latest/source/arch/mips/loongson2ef/common/pci.c

- Jiaxun
>
>> +    memory_region_add_subregion(get_system_memory(), BONITO_PCILO_BASE,
>> +                                pcimem_lo_alias);
>>   
>>       create_unimplemented_device("pci.io", BONITO_PCIIO_BASE, 1 * MiB);
>>   }
>>


