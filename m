Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C94748F740
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 15:08:13 +0100 (CET)
Received: from localhost ([::1]:52772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8jj1-00081q-W2
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 09:08:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jgl-0006VL-MU
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 09:05:53 -0500
Received: from [2001:41c9:1:41f::167] (port=48810
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jgj-0007LG-Nu
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 09:05:50 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jgI-00064L-IX; Sat, 15 Jan 2022 14:05:22 +0000
Message-ID: <1e2f87e6-0026-3d9a-a349-fe73c8bf6b40@ilande.co.uk>
Date: Sat, 15 Jan 2022 14:05:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: maobibo <maobibo@loongson.cn>, yangxiaojuan <yangxiaojuan@loongson.cn>,
 qemu-devel@nongnu.org
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
 <1638619645-11283-23-git-send-email-yangxiaojuan@loongson.cn>
 <1984f2fa-1ccd-af3a-7fb8-6770e0b27596@ilande.co.uk>
 <51bc3c8e-370b-7c42-1003-5b7535491adb@loongson.cn>
 <6226db5a-3082-63d3-56a7-5a9b154bb056@ilande.co.uk>
 <e321dc38-6224-7e0b-e931-85e320b8c0ed@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <e321dc38-6224-7e0b-e931-85e320b8c0ed@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v3 22/27] hw/loongarch: Add some devices support for
 3A5000.
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 i.qemu@xen0n.name, richard.henderson@linaro.org, laurent@vivier.eu,
 peterx@redhat.com, f4bug@amsat.org, alistair.francis@wdc.com,
 pbonzini@redhat.com, chenhuacai@loongson.cn, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/01/2022 09:37, maobibo wrote:

>>>> Isn't this part already handled by the code in hw/pci/pci.c when the IRQ is asserted, for example pci_change_irq_level()?
>>>
>>> We design a different rule for the pcie devices connect to the root bridge, assign more irqs to these devices.
>>> For the pci device connect to a pcie-to-pci bridge use the common pci_swizzle_map_irq_fn to map irq.
>>
>> I'm less familiar with PCIe but shouldn't the interrupt mapping for devices connected via a pcie-to-pci bridge be handled by the bridge in this case? Have a look at pci_bridge_map_irq() to see how this is used. I'd expect the pcie-to-pci bridge to map the PCI irq to your host controller irq first before calling pci_ls7a_map_irq(), which I think then becomes just a simple call to pci_swizzle_map_irq_fn()?
> 
> Oh, we will remove these lines. Our original thoughts is that irq-lines of
> root bridge is connected with irq controller, so root bridge can have more than
> 4 irq-lines, non root-bridge has 4 irq-lines at most.
> 
>>From the code it is only treated as pcie root bridge, and its parent_dev is NULL
> always. and we can simply add these sentences such as:
>      /* pci device start from irq 80 */
>      offset = PCH_PIC_IRQ_OFFSET + LS7A_DEVICE_IRQS;
>      irq = offset + ((PCI_SLOT(d->devfn) * 4 + irq_num)) % LS7A_PCI_IRQS;
> 
>      return irq;

Right, that makes more sense to me. Generally root bridges are different enough from 
downstream bridges to be modelled as a separate device (often with a slightly 
different product id), so if you can remove the parent_dev check and use the above 
that works for me.


ATB,

Mark.

