Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7968942D776
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 12:49:21 +0200 (CEST)
Received: from localhost ([::1]:51024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mayIa-0006oe-6U
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 06:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mayH4-0005n5-R9; Thu, 14 Oct 2021 06:47:46 -0400
Received: from pegase2.c-s.fr ([93.17.235.10]:49619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mayH2-0006Dn-Tk; Thu, 14 Oct 2021 06:47:46 -0400
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HVR1n6q88z9sSM;
 Thu, 14 Oct 2021 12:47:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WmUjWDkBhu1t; Thu, 14 Oct 2021 12:47:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HVR1n5mlMz9sSJ;
 Thu, 14 Oct 2021 12:47:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AB7C08B788;
 Thu, 14 Oct 2021 12:47:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MYxyvzh7T9A0; Thu, 14 Oct 2021 12:47:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.231])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E99C98B763;
 Thu, 14 Oct 2021 12:47:40 +0200 (CEST)
Subject: Re: Is the ppc440 "bamboo" board in QEMU still of any use?
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Thomas Huth <thuth@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>
References: <fc2e00d1-2373-3223-03c8-195585face66@redhat.com>
 <80f727b8-9eb0-6a49-e4a7-b2616583c43f@csgroup.eu>
Message-ID: <2642fe45-16af-0281-92e1-e1fc68b1069b@csgroup.eu>
Date: Thu, 14 Oct 2021 12:47:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <80f727b8-9eb0-6a49-e4a7-b2616583c43f@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=93.17.235.10;
 envelope-from=christophe.leroy@csgroup.eu; helo=pegase2.c-s.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, hpoussin@reactos.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 14/10/2021 à 12:34, Christophe Leroy a écrit :
> 
> 
> Le 14/10/2021 à 11:31, Thomas Huth a écrit :
>>
>>   Hi,
>>
>> I tried to build a current Linux kernel for the "bamboo" board and use 
>> it in QEMU, but QEMU then quickly aborts with:
>>
>>   pci.c:262: pci_bus_change_irq_level: Assertion `irq_num >= 0' failed.
>>
>> (or with a "DCR write error" if I try to use the cuImage instead).
>>
>> I googled a little bit and found this discussion:
>>
>> https://qemu-devel.nongnu.narkive.com/vYHona3u/emulating-powerpc-440ep-with-qemu-system-ppcemb#post2 
>>
>>
>> Seems like this board was used for KVM on the PPC440 only, and has 
>> never been enabled with the TCG emulation?
>>
>> Well, KVM support on the 440 has been removed years ago already:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b2677b8dd8de0dc1496ede4da09b9dfd59f15cea 
>>
>>
>> So is this "bamboo" board dead code in QEMU now? Or does anybody still 
>> have a kernel binary which could be used for testing it? Note: This 
>> board does not support "-bios", so u-boot or other firmwares are 
>> certainly also not an option here...
>> Should we mark "bamboo" as deprecated nowadays?
>>
> 
> I have the following change in QEMU to be able to run the bamboo, found 
> it some time ago via google (can't remember where):
> 
> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
> index 8147ba6f94..600e89e791 100644
> --- a/hw/ppc/ppc4xx_pci.c
> +++ b/hw/ppc/ppc4xx_pci.c
> @@ -246,7 +246,7 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, 
> int irq_num)
> 
>       trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
> 
> -    return slot - 1;
> +    return slot ? slot - 1 : slot;
>   }
> 
>   static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
> ---
> 
> It's probably no the final change, but at least it allows booting bamboo 
> on qemu again.
> 

Found the source : 
https://www.mail-archive.com/qemu-devel@nongnu.org/msg769121.html

Christophe

