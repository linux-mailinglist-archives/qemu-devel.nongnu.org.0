Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B152E83CB
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 14:05:08 +0100 (CET)
Received: from localhost ([::1]:39282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvK79-0005kE-Ch
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 08:05:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kvK5o-0005Jv-Qe
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 08:03:44 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:33871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kvK5m-000603-SR
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 08:03:44 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id DC3DF5802BF;
 Fri,  1 Jan 2021 08:03:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 01 Jan 2021 08:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=1
 9xAaxS2FdKPtaG7X7ahAhO0pgxjakYlvquf6eI/L64=; b=Sh45EQnl01FtRMOqn
 8UQRue/MbeT/sbk8wcdPg4lw2jkuJx1N7t7kghwzang1RAWciUBcOXohj7Zl9ZAg
 u9nyd+BjoRo/sI93con7xJ+uowryCvLrYFrsMILQFTUIK97r5cfCU446neABv7tp
 6V0pUoyTlXiGnVg8AdhFazhLHhiajKNFnqqOtF9nEmVZrUk8LIsLD2zimXAeo70f
 mZl/zJLdR1QWengoXq4P5sDPd8vZuT7CpP1O8SLTiMKb940FU0UkUVm34adQU90t
 OFtdpoZrv7JFT2i+vDcyGEaaRmpS/xQ/I4AaIDUTg+po1oe3hTLBEq/Zch05RQCL
 NcHBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=19xAaxS2FdKPtaG7X7ahAhO0pgxjakYlvquf6eI/L
 64=; b=hIv696CnsKX2TMX/7RMk+CnI4iojnwYC3rbNr8XaFOWahj3KqNNaXSA7S
 aMyHLJaXDXbQi9rqlqUEFhR/t/NFER9HAnOHQoWZUDSiny6JHW6+spltfoVyynQE
 ZfxvMW+tZ88sC88GXkOyFtsWqRBxgyORW8lT8R975xcWnzt5Qo8AAhWm1pD75sW5
 miU4sUXGdmQxsEotHN7fYYKiOesDEU2ZTSsXGfW6SXW5IMmHOCNNnBikPB0maxUH
 Veeo0lHEF7+8eJpCkdulnk3piDTpZh8K7ocDlZNkwFlAQa4MYpORESJG7uItgKNY
 x4AZAS5d5mq/HxRSroAzA4nxmeiuA==
X-ME-Sender: <xms:qx3vX1g8MVb0kApRBYkoGAH7DUFBlJm1FgcnICLvlv4BlXhjnm2Y1w>
 <xme:qx3vX6DdQyiaSSXKgq9vQdz9CbRa7n54piR4Hxxr9UPeL96ek_Wz6BcYAH9I3f9D7
 kHv2pCZaytMRj2KHdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvjedggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeeffeegffelffetgeevueehteeggeejgfdtffdugeefkedvgeel
 veetkeeghfelgeenucffohhmrghinhepmhgrihhlqdgrrhgthhhivhgvrdgtohhmnecukf
 hppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:qx3vX1F14ySWbujEUirXFOa58r9epIGIl0QIHkqgUU_tUkCL6CYuUw>
 <xmx:qx3vX6Qlz7mQDz5neZ7gmxYDKZBtSlBaZXVpg8iNUXa9wfJQKYnaeQ>
 <xmx:qx3vXywjeGAl50XZ7GgeZd10VMdBIl0hVHuUwC1JfiPOwDyeRMm2fQ>
 <xmx:rB3vX2_3c0puMSwUO-TNojwO03uBgEKtCV1q3qrFw5YACiweOgittQ>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5438C240057;
 Fri,  1 Jan 2021 08:03:32 -0500 (EST)
Subject: Re: [PATCH v3 4/8] hw/pci-host/bonito: Fixup pci.lomem mapping
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
 <20201224031750.52146-5-jiaxun.yang@flygoat.com>
 <835ce7dc-9efb-3b67-d324-b9891a87eed2@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <2eddc110-83b4-29f6-a988-2c274edbdddb@flygoat.com>
Date: Fri, 1 Jan 2021 21:03:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <835ce7dc-9efb-3b67-d324-b9891a87eed2@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: permerror client-ip=66.111.4.229;
 envelope-from=jiaxun.yang@flygoat.com; helo=new3-smtp.messagingengine.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.749,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/1/1 下午7:07, Philippe Mathieu-Daudé 写道:
> On 12/24/20 4:17 AM, Jiaxun Yang wrote:
>> The original mapping had wrong base address.
> TBO this rational is a bit scarce ;)

Yes. I was just trying to get Linux work as I was programing facing the 
kernel,
not the hardware ;-(

I asked Loongson guys for a copy of Bonito 2E manual and they promised me
they'll give it to me after the holiday.

Thanks.

- Jiaxun

>
> I sent a patch implementing the REMAP register:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg769751.html
>
> If this isn't enough with a Linux kernel because it expects
> the the Bonito being configured by the bootloader, then we
> need to do the mapping in write_bootloader().
>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>   hw/pci-host/bonito.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
>> index 3fad470fc6..737ee131e1 100644
>> --- a/hw/pci-host/bonito.c
>> +++ b/hw/pci-host/bonito.c
>> @@ -85,9 +85,8 @@
>>   #define BONITO_PCILO_BASE_VA    0xb0000000
>>   #define BONITO_PCILO_SIZE       0x0c000000
>>   #define BONITO_PCILO_TOP        (BONITO_PCILO_BASE + BONITO_PCILO_SIZE - 1)
>> -#define BONITO_PCILO0_BASE      0x10000000
>> -#define BONITO_PCILO1_BASE      0x14000000
>> -#define BONITO_PCILO2_BASE      0x18000000
>> +#define BONITO_PCILOx_BASE(x)   (BONITO_PCILO_BASE + BONITO_PCILOx_SIZE * x)
>> +#define BONITO_PCILOx_SIZE      0x04000000
>>   #define BONITO_PCIHI_BASE       0x20000000
>>   #define BONITO_PCIHI_SIZE       0x60000000
>>   #define BONITO_PCIHI_TOP        (BONITO_PCIHI_BASE + BONITO_PCIHI_SIZE - 1)
>> @@ -610,7 +609,7 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
>>   {
>>       PCIHostState *phb = PCI_HOST_BRIDGE(dev);
>>       BonitoState *bs = BONITO_PCI_HOST_BRIDGE(dev);
>> -    MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 3);
>> +    MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 1);
>>   
>>       memory_region_init(&bs->pci_mem, OBJECT(dev), "pci.mem", BONITO_PCIHI_SIZE);
>>       phb->bus = pci_register_root_bus(dev, "pci",
>> @@ -622,9 +621,10 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
>>           char *name = g_strdup_printf("pci.lomem%zu", i);
>>   
>>           memory_region_init_alias(&pcimem_lo_alias[i], NULL, name,
>> -                                 &bs->pci_mem, i * 64 * MiB, 64 * MiB);
>> +                                 &bs->pci_mem, BONITO_PCILOx_BASE(i),
>> +                                 BONITO_PCILOx_SIZE);
>>           memory_region_add_subregion(get_system_memory(),
>> -                                    BONITO_PCILO_BASE + i * 64 * MiB,
>> +                                    BONITO_PCILOx_BASE(i),
>>                                       &pcimem_lo_alias[i]);
>>           g_free(name);
>>       }
>>


