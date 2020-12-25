Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF392E2973
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 02:49:09 +0100 (CET)
Received: from localhost ([::1]:43616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kscE8-0001v6-8P
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 20:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kscBm-0001AQ-2I
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 20:46:42 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:58977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kscBj-0007Wo-VA
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 20:46:41 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2AEC1580176;
 Thu, 24 Dec 2020 20:46:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 24 Dec 2020 20:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=n
 f2grxqbgbjfs6g0bz1FTxEKcvSQ4Wfsm0LUOcfBxk8=; b=oscK7/wfVyMQBCRaB
 eEOmzIkssk5Ph0XoDtXNIAcmI3laJbVkht//lgFdHS6FlLHWCMSjxVdJYCGGmKog
 HQPwhbBm0TXoeCmFD1QJ3Dic4ywBdSSOSBiENw/vCVAk4LksJj6r0bN5kh7+GETg
 3uOOXoVpgxAz9sf5RYDUvw7cbwRSg4+qUpdQStESdBo7XFtR/kMvtzqWbZoinQyj
 ojpFFSWliLRhzZEdPyMQG/7V5qG9/wxPZ1Vmg2VRaULENOtSYxy/ox/gNPjkQxfF
 32bvwELpYIcMKnvStCOxxWBfDX06rgwrxDdra+jUxX1nUCVvYN2MKtUhRT0v8asv
 G9K+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=nf2grxqbgbjfs6g0bz1FTxEKcvSQ4Wfsm0LUOcfBx
 k8=; b=EFHR9qRPalbCIUImoXuWeRT3qp4QdSAps3MnpsOQH79NPlVBsqqJOtJca
 2hEKcCXY2Cld7zM8KGTwFCD0HiNWcg4HzMXcbImvOWGM7Rbm44dUB5b4Da+cwIkr
 CGtmIe7YtwmR+qqm5Jo4P7ToKeXVVueEOd5/Id+Wtbx0dzK0Uth2Sj7KGwkPHLuH
 jzU9W2pU53E3I5b8b8/fO6gEJKHldb/d+8w4kh2XP9boJ0N/mm6GnKnX15CkJzQE
 MxKIT/+k11S8mXlNlFLC5Da9Zhyj5CU9Esg27ezECmW+LJ37AMotisANV/jljM3/
 qTYhb4jKUC9k/xjBHw/OyWOcHEWog==
X-ME-Sender: <xms:fETlX_cJdUoJu_ZNfZVk0sgNhYq8VsV2Pijc9O65hlAsXZZwSYwRzg>
 <xme:fETlX1NEc4QY8fsvmZ3kx5ew0KF2lab3_p42hl1ngLPpJHZ6Ky0YWWNDrqSgAyAYA
 qJmU2uUZSQ5XyY8czM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddutddgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
 ffeugeevfefgfeenucfkphepudekfedrudehjedrfedvrddutddunecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:fETlX4gBW-IBFUO-ZL7YdspmrnJQxEjlmyBru0ATUoOFo4bw7EzgZQ>
 <xmx:fETlXw9DY8Jpi2zzrIY_oKHry6Ez2PD42LJej0isTrU_vovzogl6SQ>
 <xmx:fETlX7vLmgLGZLaC6Byoe0WkV466ho_chPZv2h3BXn9IgHBeF91cFg>
 <xmx:fUTlX1I6bDJ7gnwPROA--o_DmErfS4jlSQGw1Cg0mU2Lu-FzsJ8qNAZrsiw>
Received: from [192.168.1.203] (unknown [183.157.32.101])
 by mail.messagingengine.com (Postfix) with ESMTPA id DFE17240057;
 Thu, 24 Dec 2020 20:46:31 -0500 (EST)
Subject: Re: [PATCH v3 3/8] hw/pci-host/bonito: Fixup IRQ mapping
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
 <20201224031750.52146-4-jiaxun.yang@flygoat.com>
 <4cd6779b-427d-4acc-cc8d-eb54106c1cfc@eik.bme.hu>
 <9df942e7-c5f-74b1-6384-1d7f80602a1@eik.bme.hu>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <763443bf-e901-10d3-ef4f-2f257d337a41@flygoat.com>
Date: Fri, 25 Dec 2020 09:46:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9df942e7-c5f-74b1-6384-1d7f80602a1@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.825,
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
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2020/12/24 16:40, BALATON Zoltan 写道:
> On Thu, 24 Dec 2020, BALATON Zoltan via wrote:
>> On Thu, 24 Dec 2020, Jiaxun Yang wrote:
>>> Accroading to arch/mips/pci/fixup-fuloong2e.c in kernel,
>>
>> Typo: According
>>
>> How come, you say you can boot to Debian installer but don't need any 
>> IDE changes when the kernel you submitted as test was shown not 
>> working with current IDE emulation? Which installer do you use and 
>> what kernel does that have? (The references to the installer and PMON 
>> are now missing in your cover letter.)
>
> Got the reference from v2 cover letter and it's a netboot kernel with 
> an initrd so maybe you did boot into that but did not yet test with CD 
> image or HDD so did not get to the IDE problem yet.

Yes, I found this IRQ issue when I was trying to connect to ethernet.

Sorry for other stupid mistakes in ther series :-(
Needs coffee at the moment.

Thanks.

- Jiaxun

>
> Regards,
> BALATON Zoltan
>
>>> despites south bridge IRQs needs special care, all other
>>> IRQ pins are mapped by 'LOONGSON_IRQ_BASE + 25 + pin'.
>>>
>>> As south bridge IRQs are all handled by ISA bus, we can
>>> make a simple direct mapping.
>>>
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> ---
>>> v3: Define BONITO_PCI_IRQ_BASE for readability (f4bug)
>>> ---
>>> hw/pci-host/bonito.c | 30 +++++++-----------------------
>>> 1 file changed, 7 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
>>> index a99eced065..3fad470fc6 100644
>>> --- a/hw/pci-host/bonito.c
>>> +++ b/hw/pci-host/bonito.c
>>> @@ -62,6 +62,9 @@
>>> #define DPRINTF(fmt, ...)
>>> #endif
>>>
>>> +/* PCI slots IRQ pins start position */
>>> +#define BONITO_PCI_IRQ_BASE         25
>>> +
>>> /* from linux soure code. include/asm-mips/mips-boards/bonito64.h*/
>>> #define BONITO_BOOT_BASE        0x1fc00000
>>> #define BONITO_BOOT_SIZE        0x00100000
>>> @@ -546,19 +549,16 @@ static const MemoryRegionOps 
>>> bonito_spciconf_ops = {
>>>     .endianness = DEVICE_NATIVE_ENDIAN,
>>> };
>>>
>>> -#define BONITO_IRQ_BASE 32
>>> -
>>> static void pci_bonito_set_irq(void *opaque, int irq_num, int level)
>>> {
>>>     BonitoState *s = opaque;
>>>     qemu_irq *pic = s->pic;
>>>     PCIBonitoState *bonito_state = s->pci_dev;
>>> -    int internal_irq = irq_num - BONITO_IRQ_BASE;
>>>
>>> -    if (bonito_state->regs[BONITO_INTEDGE] & (1 << internal_irq)) {
>>> +    if (bonito_state->regs[BONITO_INTEDGE] & (1 << irq_num)) {
>>>         qemu_irq_pulse(*pic);
>>>     } else {   /* level triggered */
>>> -        if (bonito_state->regs[BONITO_INTPOL] & (1 << internal_irq)) {
>>> +        if (bonito_state->regs[BONITO_INTPOL] & (1 << irq_num)) {
>>>             qemu_irq_raise(*pic);
>>>         } else {
>>>             qemu_irq_lower(*pic);
>>> @@ -566,25 +566,9 @@ static void pci_bonito_set_irq(void *opaque, 
>>> int irq_num, int level)
>>>     }
>>> }
>>>
>>> -/* map the original irq (0~3) to bonito irq (16~47, but 16~31 are 
>>> unused) */
>>> -static int pci_bonito_map_irq(PCIDevice *pci_dev, int irq_num)
>>> +static int pci_bonito_map_irq(PCIDevice *pci_dev, int pin)
>>> {
>>> -    int slot;
>>> -
>>> -    slot = (pci_dev->devfn >> 3);
>>> -
>>> -    switch (slot) {
>>> -    case 5:   /* FULOONG2E_VIA_SLOT, SouthBridge, IDE, USB, ACPI, 
>>> AC97, MC97 */
>>> -        return irq_num % 4 + BONITO_IRQ_BASE;
>>> -    case 6:   /* FULOONG2E_ATI_SLOT, VGA */
>>> -        return 4 + BONITO_IRQ_BASE;
>>> -    case 7:   /* FULOONG2E_RTL_SLOT, RTL8139 */
>>> -        return 5 + BONITO_IRQ_BASE;
>>> -    case 8 ... 12: /* PCI slot 1 to 4 */
>>> -        return (slot - 8 + irq_num) + 6 + BONITO_IRQ_BASE;
>>> -    default:  /* Unknown device, don't do any translation */
>>> -        return irq_num;
>>> -    }
>>> +    return BONITO_PCI_IRQ_BASE + pin;
>>> }
>>>
>>> static void bonito_reset(void *opaque)
>>>
>>
>>


