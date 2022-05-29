Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5D4537078
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 11:54:26 +0200 (CEST)
Received: from localhost ([::1]:40318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvFcv-0007bL-4P
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 05:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvFbF-0006k7-E8; Sun, 29 May 2022 05:52:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvFbD-0002bg-P6; Sun, 29 May 2022 05:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SzoUuN3Iny06CaCFlZyLCtdzUHyTQIC0TVcJzcLMCmg=; b=n43jUC1nWB0eRHzwcm4FPb4c74
 ytnCYMKPJKn5roTqQeDUKBFcHpOQDJ57tsJleDWgkBrAbDB/czxrxDmhzMEGhkG17biRZuVIiJaeW
 UBuyuXGZ9MRB69kFXpVborlZN5oXqdtEpcCRPXDKfvnrD0jWy/OcaJCb5HQYOqdOn3O1EQROy4K/b
 U6lhwBqVue99yUxPCK2/G3pPBJcaeYiZPq4HXOZwANeNP8kSiXlvbGUexjsiHf4uaVqV2iUVtmdYK
 4tHSuWYZWQsIoSmxMIvG8eJBH3hX2wSy//ZbYrV8VJtpERgKP6cUZxKsJ59jhLqa+bEl8o54rMaOx
 XGOTQVk6sT2ZDYfas3wYJWfVP4friIb5AYaTzA2dcuarNccbM8cqdK3eQG2AlM9AofpWgKfGDcsap
 HFfICsuPT4XFIUw28NbBBk06gYSg4UNm2AvilowEu1PPzpPgUeySGQ6PiCtYu9dIBp6rmz4rk2I42
 3pHUBX6jSYVfXSH1EqQBmebtQGGzLD6n0eWLklbSuPA+E+/H8R+vmXyIGi6ksLqElYaY2cVFqW9D4
 Uk2qEIQjVLgoU5oon6MtJmTLITbJcMAVgqzEpU3lRJHlDA4hD1qAOsFVJ/l7FU5AZ+uJcD3XWpJci
 9yHMFOLm/YdqYe9uv+9V9Ad6fXvBDZ7k6tQFkKMT0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nvFa6-000AWe-8y; Sun, 29 May 2022 10:51:34 +0100
Message-ID: <a29153c4-24df-aedd-c839-8e796ca5231f@ilande.co.uk>
Date: Sun, 29 May 2022 10:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20220522212431.14598-1-shentey@gmail.com>
 <20220522212431.14598-2-shentey@gmail.com>
 <e1654d8d-53c4-d01c-1288-f74fa4fdfcfd@eik.bme.hu>
 <CAG4p6K4Kfek2PgH7-=CDqfKLGFddU=5YYmnqpaM-0rhTrFqe7g@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAG4p6K4Kfek2PgH7-=CDqfKLGFddU=5YYmnqpaM-0rhTrFqe7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 1/6] include/hw/southbridge/piix: Aggregate all PIIX
 soughbridge type names
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 29/05/2022 10:23, Bernhard Beschow wrote:

> Am 22. Mai 2022 22:32:06 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> On Sun, 22 May 2022, Bernhard Beschow wrote:
>>> TYPE_PIIX3_PCI_DEVICE resides there as already, so add the remaining
>>> ones, too.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>> hw/isa/piix3.c                | 3 ---
>>> include/hw/isa/isa.h          | 2 --
>>> include/hw/southbridge/piix.h | 4 ++++
>>> 3 files changed, 4 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
>>> index dab901c9ad..d96ce2b788 100644
>>> --- a/hw/isa/piix3.c
>>> +++ b/hw/isa/piix3.c
>>> @@ -35,9 +35,6 @@
>>>
>>> #define XEN_PIIX_NUM_PIRQS      128ULL
>>>
>>> -#define TYPE_PIIX3_DEVICE "PIIX3"
>>> -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>>> -
>>> static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
>>> {
>>>      qemu_set_irq(piix3->pic[pic_irq],
>>> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
>>> index 034d706ba1..e9fa2f5cea 100644
>>> --- a/include/hw/isa/isa.h
>>> +++ b/include/hw/isa/isa.h
>>> @@ -144,6 +144,4 @@ static inline ISABus *isa_bus_from_device(ISADevice *d)
>>>      return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
>>> }
>>>
>>> -#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>>> -
>>> #endif
>>> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
>>> index f63f83e5c6..4d17400dfd 100644
>>> --- a/include/hw/southbridge/piix.h
>>> +++ b/include/hw/southbridge/piix.h
>>> @@ -70,6 +70,10 @@ typedef struct PIIXState PIIX3State;
>>> DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
>>>                           TYPE_PIIX3_PCI_DEVICE)
>>>
>>> +#define TYPE_PIIX3_DEVICE "PIIX3"
>>> +#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>>> +#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>>
>> This naming seems to go back to 9b74b190d6c so it's not directly related to this series but there seems to be a bit of a confusion here that I wonder could be cleaned up now. We have:
>>
>> #define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
>> and
>> #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>>
>> and both of these have mismatched #define and device name. These are not user creatable so so the device names don't appear anywhere (except maybe in info qtree output) but this could still be confusing as normally type defines should match device names. If these are the ISA bridges then maybe piix?-isa is a good name so maybe we should have
>>
>> #define TYPE_PIIX3_ISA "piix3-isa"
>> #defint TYPE_PIIX4_ISA "piix4-isa"
>>
>> (then also matching e.g. "via-isa") but I'm not sure changing "pci-piix3" to "piix3-isa" could break anything (I don't expect changing the defines themselces could cause any problem).
>>
>> It's just something I've noticed and brought up for consideration but I have no strong opinion on it so up to you what you do with it.
> 
> Hi Zoltan,
> 
> yeah, I noticed the naming when moving the defines. I couldn't come up
> with better names which were worth the effort because I can imagine
> where the names are coming from. I also didn't want to go down the
> rabbithole of backwards compatibility (which is a topic I haven't
> covered yet). I think that *-isa is too narrow a name for the
> container device since it bridges a couple of buses to PCI, but other
> than that I don't have strong opinions about the names.

Agreed. They certainly aren't the best of names, but my worry would be that someone 
has done some magic with -global to override the defaults and so renaming them would 
cause something to break.

Certainly this could be discussed as a separate topic with the PC machine maintainers 
if someone feels strongly about it, but I wouldn't want this to hold up the patch 
series unnecessarily.


ATB,

Mark.

