Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CF26EF5CC
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 15:50:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prfWY-0000Lm-Od; Wed, 26 Apr 2023 09:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfWQ-0000Kq-U4; Wed, 26 Apr 2023 09:49:27 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfWN-0000L7-G8; Wed, 26 Apr 2023 09:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DgMepOIcT91YljVfBbCCvzCZ/L9ogC2xCoKePAsZKNo=; b=sH2Nw5wHcNztQWgKDPQ8D2fYVY
 qFVjUiJBn1ko84gAXqjPS/2PTBwYZUxBEG5XGAlrKybGbYI1rUvI7ho5cnAsAqMikWQRNpz/2unN6
 /QHv8+UZJsmT6iIkZ9pDVpLbN6tyELilDwe2q75hQJA8gBxeb6oB2GpK3jX+Hl8TK5iZPUggjW29Y
 Q/XqTbjD/B2+db7nSE6qb+mJqFa7l4Yco26Xb5A2w8Q6KGznVzmtKW4kJ+LEuLF6RoqiZ9j+7YUYs
 oxYyi8WiGm0r4Xu8eD1MYgWSp3qciNhuLSSz2+sG3m20+gsuAcS36Vp3pudRDhh/4SLTMjhxOvyRx
 Gsx929E7WBPZnCKYH6IjF0fQyo+7SkURBJ8YxTH0BLjd6B26Wzb46LOuf5uYO2rvtZ7NKkWM3HPnN
 l2ppJfNkAQCNuKqkIwINV4qIIlBffUzW4zxnNe51rnKNjvWCpNGtk5EDGxOT7UHi96HlLsqp9/ac6
 C8Rdff086jOPU+BYJB/Pn8D3RPJLynkG9FHjI8LW3En4jl6OBCAhsrYwb87k2RdQW4su4dfV2PH+4
 e11lIpom09hQ90xqL3SmeWXkOpvRxoZyokNu43MR7bgiH8mXTV0C7SRCkB/OLywgGahcfjLLHv6fp
 Bi16kDxvgorjai7ZioMmD0prx/GgK1bncoFvH//8g=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfVM-0002xk-Ms; Wed, 26 Apr 2023 14:48:21 +0100
Message-ID: <6bc0dc92-3787-5379-b139-a8b5973d87fc@ilande.co.uk>
Date: Wed, 26 Apr 2023 14:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230421042344-mutt-send-email-mst@kernel.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230421042344-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 00/18] hw/ide: Untangle ISA/PCI abuses of
 ide_init_ioport()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/04/2023 09:25, Michael S. Tsirkin wrote:

> On Thu, Mar 02, 2023 at 11:40:40PM +0100, Philippe Mathieu-Daudé wrote:
>> Since v2: rebased
>>
>> I'm posting this series as it to not block Bernhard's PIIX
>> cleanup work. I don't have code change planned, but eventually
>> reword / improve commit descriptions.
> 
>> Tested commit after commit to be sure it is bisectable. Sadly
>> this was before Zoltan & Thomas report a problem with commit
>> bb98e0f59c ("hw/isa/vt82c686: Remove intermediate IRQ forwarder").
> 
> I'm not sure what this implies, or how do you want to
> resolve the conflicts with Bernhard's work.
> 
> did my best to review, series:
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Phil: I revisited this series after our discussion earlier in the week re: device 
IRQs, and I realised that there is some overlap with this series, Bernhard's latest 
series, and some of my local patches for switching between legacy/native PCI IDE IRQ 
routing.

I've now gone through both series and replied where I think we should now be going 
with this, but I can see that the final series will likely pull from all 3 sources.

How do you think we should best move forward from here? Once you've replied to the 
various comments I can potentially pull everything together into an updated series if 
that helps?

>> Background thread:
>> https://lore.kernel.org/qemu-devel/5095dffc-309b-6c72-d255-8cdaa6fd3d52@ilande.co.uk/
>>
>> Philippe Mathieu-Daudé (18):
>>    hw/ide/piix: Expose output IRQ as properties for late object
>>      population
>>    hw/ide/piix: Allow using PIIX3-IDE as standalone PCI function
>>    hw/i386/pc_piix: Wire PIIX3 IDE ouput IRQs to ISA bus IRQs 14/15
>>    hw/isa/piix4: Wire PIIX4 IDE ouput IRQs to ISA bus IRQs 14/15
>>    hw/ide: Rename ISA specific ide_init_ioport -> ide_bus_init_ioport_isa
>>    hw/ide/piix: Ensure IDE output IRQs are wired at realization
>>    hw/isa: Deprecate isa_get_irq() in favor of isa_bus_get_irq()
>>    hw/ide: Introduce generic ide_init_ioport()
>>    hw/ide/piix: Use generic ide_bus_init_ioport()
>>    hw/isa: Ensure isa_register_portio_list() do not get NULL ISA device
>>    hw/isa: Simplify isa_address_space[_io]()
>>    hw/isa: Reduce 'isabus' singleton scope to isa_bus_new()
>>    exec/ioport: Factor portio_list_register_flush_coalesced() out
>>    exec/ioport: Factor portio_list_register() out
>>    hw/southbridge/piix: Use OBJECT_DECLARE_SIMPLE_TYPE() macro
>>    hw/isa/piix: Batch register QOM types using DEFINE_TYPES() macro
>>    hw/isa/piix: Unify QOM type name of PIIX ISA function
>>    hw/isa/piix: Unify PIIX-ISA QOM type names using qdev aliases
>>
>>   hw/audio/adlib.c              |  4 +--
>>   hw/display/qxl.c              |  7 ++--
>>   hw/display/vga.c              |  9 +++--
>>   hw/dma/i82374.c               |  7 ++--
>>   hw/i386/pc_piix.c             | 13 +++++---
>>   hw/ide/ioport.c               | 15 +++++++--
>>   hw/ide/isa.c                  |  2 +-
>>   hw/ide/piix.c                 | 54 +++++++++++++++++++++++-------
>>   hw/isa/isa-bus.c              | 36 ++++++++------------
>>   hw/isa/piix3.c                | 63 +++++++++++++++--------------------
>>   hw/isa/piix4.c                | 12 ++++---
>>   hw/mips/malta.c               |  2 +-
>>   hw/watchdog/wdt_ib700.c       |  4 +--
>>   include/exec/ioport.h         | 15 +++++----
>>   include/hw/ide/internal.h     |  3 +-
>>   include/hw/ide/isa.h          |  3 ++
>>   include/hw/ide/piix.h         |  4 +++
>>   include/hw/isa/isa.h          |  3 +-
>>   include/hw/southbridge/piix.h | 14 ++++----
>>   softmmu/ioport.c              | 48 +++++++++++++++++++-------
>>   softmmu/qdev-monitor.c        |  3 ++
>>   21 files changed, 190 insertions(+), 131 deletions(-)
>>
>> -- 
>> 2.38.1


ATB,

Mark.

