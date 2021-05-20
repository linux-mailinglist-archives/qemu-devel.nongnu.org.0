Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3D38A075
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:59:01 +0200 (CEST)
Received: from localhost ([::1]:40762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljeWC-0002wc-Jr
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljeTP-0000VI-00
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:56:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39190
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljeTM-00077D-NN
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:56:06 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljeTI-000CJw-SL; Thu, 20 May 2021 09:56:01 +0100
To: Stefan Hajnoczi <stefanha@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20210518215545.1793947-1-philmd@redhat.com>
 <20210518215545.1793947-3-philmd@redhat.com>
 <f571a63d-d6a2-2085-740-bcc59b3424e5@eik.bme.hu>
 <3ba44704-6418-4aee-23ad-7d4dcc1fe60d@redhat.com>
 <babbf5da-b4c0-9736-b09-426e3a358587@eik.bme.hu>
 <YKYfOMUvCnQTcQtZ@stefanha-x1.localdomain>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <ae7509a1-2934-7780-6fae-ea9f4bf16e8d@ilande.co.uk>
Date: Thu, 20 May 2021 09:56:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YKYfOMUvCnQTcQtZ@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 02/11] hw/ide: Add PCIIDEState::isa_bus link
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/05/2021 09:35, Stefan Hajnoczi wrote:

> I realized I don't really understand how ISA IDE and PCI IDE interact in
> PIIX3:
> 
> - ISA IDE has well-known PIO registers that are always present?
> 
> - PCI IDE has the same registers, but the BAR must be mapped and PCI IO
>    space access must be enabled?
> 
> - ISA IDE has a hardcoded ISA irq number?
> 
> - PCI IDE has a normal PCI irq that is routed like any legacy PCI INTx
>    irq?
> 
> - What combinations of ISA enabled/disabled and PCI enabled/disabled
>    need to be supported?

Yeah a lot of this discussion happened several months back in the Pegasos threads, 
but here is my understanding:

- Older legacy PCI devices such as IDE controllers connected via a host containing a 
PCI-ISA bridge can be switched by the guest OS into PCI legacy (also known as 
compatibility mode) via a PCI config space register so that IO space accesses, IRQs 
(and possible DMA?) are done via the ISA bus

- QEMU handles the IO memory accesses fine, since in these cases isa_bus_new() is 
given the IO space by pci_address_space_io(dev) so IO space access generally "just works"

- Currently it is the responsibility of these older PCI devices to determine how they 
have been configured and either use e.g. pci_set_irq() or qemu_raise_irq() on the ISA 
IRQ for interrupts

- Generally ISA IRQs are fixed as per the old AT-style PCs so IDE would be 14/15

My thoughts above were about how to allow a PCIDevice to locate its ISABus if it is 
connected to a bus with a PCI-ISA bridge to potentially allow access to ISA IRQs and 
DMA if configured in PCI legacy mode.


ATB,

Mark.

