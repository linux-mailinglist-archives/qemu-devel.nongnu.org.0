Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2895B7CB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 11:17:51 +0200 (CEST)
Received: from localhost ([::1]:56264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhsRa-000284-Pf
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 05:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45542)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcel.apfelbaum@gmail.com>) id 1hhsMe-0006y7-Ik
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:12:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcel.apfelbaum@gmail.com>) id 1hhsMd-0000YV-G4
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:12:44 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:40036)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1hhsMc-0000Wv-D5
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:12:43 -0400
Received: by mail-wr1-x443.google.com with SMTP id p11so12915184wre.7
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 02:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=A0OWQ5tdp86YAfKlDBap/slYP1liDk2P+3FlqURftK8=;
 b=r3SbBzUBQTxk4Hx6E5U+8w8WqYuuE8X9dpvd43azdBlQRoBfgJHii3JyHDjCoDgrcb
 uF/h+TBxeI9U4AYa1p7l7OAZgJalrOPvC1Mh8r/KuNblw9uyrFdZ7AYD9MX4RMTB+K2a
 M7eGvLl17oWbX2Po1APNgM0wp84/MWx5ZNhXzivit1IcqKvR/vbzo5v9faSeX2jq0IZB
 o77w3LlVm87MGv9fnwR7x5BgnzWGT0+fAvwOmnlnzJW2hEVG3jRKo60GQHiXqTZuKiRW
 PXF64I8ySuWXAn879ZeITZSKnrGsosq8xKS+p7nptUBAE8mhfxbzpktdIoWVVh6a2FJB
 CnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=A0OWQ5tdp86YAfKlDBap/slYP1liDk2P+3FlqURftK8=;
 b=Y5GRmltC/MAR0xtFK/9GE6eZ5w0Ns7IcJuna3qeqnyj65DJNXOUf1ZFuVv7qzNS45v
 2DvPP2wU0yaRLtld4DkTvdeZnV28ID0Xj15j5pIs53chHIdFt1IxkcBIV9Mblib0lSTl
 eF9iUCPCfW1qrvnnoxaAo7w3oTiP3ufl7nwyBohWi1LrDRUYYjI2EviESAQWbEVOC+nV
 /t62E6FADst/TO+74b1gqx9+G9Y52FGpEo08shwp3bi7zJgbu/K5KsX2FMcHx7BgMTMQ
 lBDFrsxj2uh4LGVrHsVvA2nk8N3i0TxPRxY8Lc4P6MSBI/hyLvFRRQP1OgzpfMpvXfQA
 QkOQ==
X-Gm-Message-State: APjAAAXNLWBMpowpGk0LwnN8WEJQP9HnWMkv0ulcReOG/XZwgxkriU3f
 ZHfMGh8KPGGaIG9pv15XCxc=
X-Google-Smtp-Source: APXvYqyngL5ywMiQ8AWpkBvymmGn2QXlM/sdADmEjlqEQpPP16PvuX7hp6W0Pn9LqsjVf3Gr6WMQsQ==
X-Received: by 2002:adf:bc4a:: with SMTP id a10mr12214457wrh.230.1561972360801; 
 Mon, 01 Jul 2019 02:12:40 -0700 (PDT)
Received: from localhost.localdomain ([37.142.144.12])
 by smtp.gmail.com with ESMTPSA id m16sm2955624wrv.89.2019.07.01.02.12.39
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 02:12:40 -0700 (PDT)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190621064615.20099-1-mst@redhat.com>
 <20190621064615.20099-4-mst@redhat.com>
 <4e4314f7-91cc-1413-9853-bfd2bbb26311@gmail.com>
 <20190701105708.5d28f497@redhat.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <b9cbc3ba-572d-1cb9-4668-56734333f4ce@gmail.com>
Date: Mon, 1 Jul 2019 12:12:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190701105708.5d28f497@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-devel] [PATCH 3/3] pcie: work around for racy guest init
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CCing qemu-devel

On 7/1/19 11:57 AM, Igor Mammedov wrote:
> On Mon, 1 Jul 2019 10:04:01 +0300
> Marcel Apfelbaum <marcel.apfelbaum@gmail.com> wrote:
>
>> On 6/21/19 9:46 AM, Michael S. Tsirkin wrote:
>>> During boot, linux guests tend to clear all bits in pcie slot status
>>> register which is used for hotplug.
>>> If they clear bits that weren't set this is racy and will lose events:
>>> not a big problem for manual hotplug on bare-metal, but a problem for us.
>>>
>>> For example, the following is broken ATM:
>>>
>>> /x86_64-softmmu/qemu-system-x86_64 -enable-kvm -S -machine q35  \
>>>       -device pcie-root-port,id=pcie_root_port_0,slot=2,chassis=2,addr=0x2,bus=pcie.0 \
>>>       -device virtio-balloon-pci,id=balloon,bus=pcie_root_port_0 \
>>>       -monitor stdio disk.qcow2
>>> (qemu)device_del balloon
>>> (qemu)cont
>>>
>>> Balloon isn't deleted as it should.
>>>
>>> As a work-around, detect this attempt to clear slot status and revert
>>> status to what it was before the write.
>>>
>>> Note: in theory this can be detected as a duplicate button press
>>> which cancels the previous press. Does not seem to happen in
>>> practice as guests seem to only have this bug during init.
>>>
>>> Note2: the right thing to do is probably to fix Linux to
>>> read status before clearing it, and act on the bits that are set.
>>>
>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>>    hw/pci/pcie.c | 19 +++++++++++++++++++
>>>    1 file changed, 19 insertions(+)
>>>
>>> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
>>> index f8490a00de..c605d32dd4 100644
>>> --- a/hw/pci/pcie.c
>>> +++ b/hw/pci/pcie.c
>>> @@ -610,6 +610,25 @@ void pcie_cap_slot_write_config(PCIDevice *dev, uint16_t slt_ctl, uint16_t slt_s
>>>        uint16_t sltsta = pci_get_word(exp_cap + PCI_EXP_SLTSTA);
>>>    
>>>        if (ranges_overlap(addr, len, pos + PCI_EXP_SLTSTA, 2)) {
>>> +        /*
>>> +         * Guests tend to clears all bits during init.
>>> +         * If they clear bits that weren't set this is racy and will lose events:
>>> +         * not a big problem for manual button presses, but a problem for us.
>>> +         * As a work-around, detect this and revert status to what it was
>>> +         * before the write.
>>> +         *
>>> +         * Note: in theory this can be detected as a duplicate button press
>>> +         * which cancels the previous press. Does not seem to happen in
>>> +         * practice as guests seem to only have this bug during init.
>>> +         */
>>> +#define PCIE_SLOT_EVENTS (PCI_EXP_SLTSTA_ABP | PCI_EXP_SLTSTA_PFD | \
>>> +                          PCI_EXP_SLTSTA_MRLSC | PCI_EXP_SLTSTA_PDC | \
>>> +                          PCI_EXP_SLTSTA_CC)
>>> +
>>> +        if (val & ~slt_sta & PCIE_SLOT_EVENTS) {
>>> +            sltsta = (sltsta & ~PCIE_SLOT_EVENTS) | (slt_sta & PCIE_SLOT_EVENTS);
>>> +            pci_set_word(exp_cap + PCI_EXP_SLTSTA, sltsta);
>>> +        }
>>>            hotplug_event_clear(dev);
>>>        }
>>>      
>> Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Hi Marcel,
>
> What about my question about
>     sltsta = (sltsta & ~PCIE_SLOT_EVENTS) | (slt_sta & PCIE_SLOT_EVENTS);
> being nop like
>     sltsta = LOWER_PART(sltsta) | UPPER_PART(sltsta)
>
> Can you point out what I'm missing here?

Oops, I missed that, maybe it should looks like:

     if (...) {
       sltsta = (val & ~PCIE_SLOT_EVENTS) | (sltsta & PCIE_SLOT_EVENTS);
       ....
   }

to keep the PCIE_SLOT_EVENTS that were set before the write.


Thanks,
Marcel

>> Thanks,
>> Marcel
>>


