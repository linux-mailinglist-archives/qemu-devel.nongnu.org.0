Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B1857D12D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:14:54 +0200 (CEST)
Received: from localhost ([::1]:55834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEYpA-0003CI-Cr
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oEYgO-0000oZ-El
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:05:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oEYgM-0000yF-Cc
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c9Ze94qgYhrS39AJQcH26e4GYtDF5PTe53Th4yhlbK0=; b=xT1FKbHV1U4bLyFU94dr++87jt
 lXx2P/c+1YgDdB51ENSzZJqUy7DBhMqWmye0vBCcAWCkdiOlLxmKnfOAZbjmMn+05+mjkGp1rA0GK
 8o1RW/9PesfW+PJdCFy/t8PMAmaw/Is+2qOUvdXOQShX1vnX7o7c3YVayz6t4rALPxZQycAZwhW/v
 v77Q2o0wQKT/hiB6uAjyd6/oHd42CzOcc8fYUSj9jn8otS1gbylLcL0/vnCRSOBV54/EHo8zi8EnG
 XjviDRpwBiapxe2paCnBtVprXM+etA2dy9LZjoLgFegwefmh0yeFCZ09ZadrhhtjN2TL45PT4bIrz
 VPb9dPoIMNkXpjSQ6fpzldn8DfogZ/yeANewU5sr7uHFTDIWPaoXROEh27izm09pMRtl4butD3n+W
 C1+RSNa+s76pavcoALRORjnjQd/YkhSgHOoSOxjo6epM4kxMJLUe9pjY/D/gPKgGMojenX4lUeg9d
 4WjG5qMBKAK+xeyVsS0XilQmPrIVTn/+cdix5ZBFPgMhNadGlcUa5KubKAtf3uml3WdKUqvonzbO8
 Sa/PV12oC+p4GifnJBgtEp2fpju3gzB1qv1KFdjb/4mNPslASBNWvpJ5FfENb/QFIFzHyUmli63vP
 OMgDHku1jocrhKUpaKnma/9Tw5Q88pcKuODkHnge0=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oEYey-0004AJ-3m; Thu, 21 Jul 2022 17:04:23 +0100
Message-ID: <9a3f311e-398e-c36f-a1d2-33c23aa163dc@ilande.co.uk>
Date: Thu, 21 Jul 2022 17:05:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220720102555.874394-1-rvkagan@yandex-team.ru>
 <Ytfcivbtj8+JnLfz@redhat.com> <YtfgQN+BQ8Egn0ha@rvkaganb>
 <5bc2fcee-2c5d-c400-5992-e2b4ce828477@ilande.co.uk>
 <Ytlii7t0rERVJBXo@rvkaganb>
 <f85ae904-4a31-141d-17dd-43c5a27d9b07@ilande.co.uk>
 <Ytl3SKpbnp8Twtkq@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <Ytl3SKpbnp8Twtkq@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3] hw/pci/pci_bridge: ensure PCIe slots have only one slot
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

On 21/07/2022 16:56, Daniel P. Berrangé wrote:

> On Thu, Jul 21, 2022 at 04:51:51PM +0100, Mark Cave-Ayland wrote:
>> On 21/07/2022 15:28, Roman Kagan wrote:
>>
>> (lots cut)
>>
>>> In the guest (Fedora 34):
>>>
>>> [root@test ~]# lspci -tv
>>> -[0000:00]-+-00.0  Intel Corporation 82G33/G31/P35/P31 Express DRAM Controller
>>>              +-01.0  Device 1234:1111
>>>              +-02.0  Red Hat, Inc. QEMU XHCI Host Controller
>>>              +-05.0-[01]----00.0  Red Hat, Inc. Virtio block device
>>>              +-05.1-[02]----00.0  Red Hat, Inc. Virtio network device
>>>              +-05.2-[03]--
>>>              +-05.3-[04]--
>>>              +-1f.0  Intel Corporation 82801IB (ICH9) LPC Interface Controller
>>>              \-1f.3  Intel Corporation 82801I (ICH9 Family) SMBus Controller
>>>
>>> Changing addr of the second disk from 4 to 0 makes it appear in the
>>> guest.
>>>
>>> What exactly do you find odd?
>>
>> Thanks for this, the part I wasn't sure about was whether the device ids in
>> the command line matched the primary PCI bus or the secondary PCI bus.
>>
>> In that case I suspect that the enumeration of non-zero PCIe devices fails
>> in Linux because of the logic here:
>> https://github.com/torvalds/linux/blob/master/drivers/pci/probe.c#L2622.
> 
> Just above that though is logic that handles 'pci=pcie_scan_all'
> kernel parameter, to make it look for non-zero devices.
> 
>> I don't have a copy of the PCIe specification, but assuming the comment is
>> true then your patch looks correct to me. I think it would be worth adding a
>> similar comment and reference to your patch to explain why the logic is
>> required, which should also help the PCI maintainers during review.
> 
> The docs above with the pci=pcie_scan_all suggest it is unusual but not
> forbidden.

That's interesting as I read it completely the other way around, i.e. PCIe downstream 
ports should only have device 0 and the PCI_SCAN_ALL_PCIE_DEVS flag is there for 
broken/exotic hardware :)

Perhaps if someone has a copy of the PCIe specification they can check the wording in 
section 7.3.1 to see exactly what the correct behaviour should be?


ATB,

Mark.

