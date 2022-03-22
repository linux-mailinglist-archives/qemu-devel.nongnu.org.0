Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D534E3A84
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:24:35 +0100 (CET)
Received: from localhost ([::1]:58968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWZog-0001EK-Kz
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:24:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nWZni-0008KG-Iz; Tue, 22 Mar 2022 04:23:34 -0400
Received: from [2001:41c9:1:41f::167] (port=51464
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nWZnh-00021R-0K; Tue, 22 Mar 2022 04:23:34 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nWZmf-0003Fd-VL; Tue, 22 Mar 2022 08:22:34 +0000
Message-ID: <4bd52c83-a4c8-ead6-1210-a5e464c32196@ilande.co.uk>
Date: Tue, 22 Mar 2022 08:23:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>
References: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
 <89a014e0-8850-e628-dea5-76999513a18e@gmail.com>
 <067ebb15-593b-4b9e-26d6-a4d98db4fd5c@kaod.org>
 <CAFEAcA-hQt7fGU7Lm=N+jkXunsekJy15s=xVWBBnoEuDDM30yg@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA-hQt7fGU7Lm=N+jkXunsekJy15s=xVWBBnoEuDDM30yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Memory leak in via_isa_realize()
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
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/03/2022 20:35, Peter Maydell wrote:

> On Mon, 21 Mar 2022 at 18:55, Cédric Le Goater <clg@kaod.org> wrote:
>> I introduced quite a few of these calls,
>>
>>     hw/ppc/pnv_lpc.c:    irqs = qemu_allocate_irqs(handler, lpc, ISA_NUM_IRQS);
>>     hw/ppc/pnv_psi.c:    psi->qirqs = qemu_allocate_irqs(ics_set_irq, ics, ics->nr_irqs);
>>     hw/ppc/pnv_psi.c:    psi->qirqs = qemu_allocate_irqs(xive_source_set_irq, xsrc, xsrc->nr_irqs);
>>     hw/ppc/ppc.c:    env->irq_inputs = (void **)qemu_allocate_irqs(&ppc6xx_set_irq, cpu,
>>     hw/ppc/ppc.c:    env->irq_inputs = (void **)qemu_allocate_irqs(&ppc970_set_irq, cpu,
>>     hw/ppc/ppc.c:    env->irq_inputs = (void **)qemu_allocate_irqs(&power7_set_irq, cpu,
>>     hw/ppc/ppc.c:    env->irq_inputs = (void **)qemu_allocate_irqs(&power9_set_irq, cpu,
>>     hw/ppc/ppc.c:    env->irq_inputs = (void **)qemu_allocate_irqs(&ppc40x_set_irq,
>>     hw/ppc/ppc.c:    env->irq_inputs = (void **)qemu_allocate_irqs(&ppce500_set_irq,
>>     hw/ppc/spapr_irq.c:    spapr->qirqs = qemu_allocate_irqs(spapr_set_irq, spapr,
>>
>> and may be I can remove some. What's the best practice ?
> 
> The 'best practice' is that if you have an irq line it should be
> because it is the input (gpio or sysbus irq) or output (gpio) of
> some device, ie something that is a subtype of TYPE_DEVICE.
> 
> For the ones in hw/ppc/ppc.c: we used to need to write code like that
> because CPU objects weren't TYPE_DEVICE; now they are, and so you
> can give them inbound gpio lines using qdev_init_gpio_in(), typically
> in the cpu initfn. (See target/riscv for an example, or grep for
> that function name in target/ for others.) Then the board code
> needs to wire up to those IRQs in the usual way for GPIO lines,
> ie using qdev_get_gpio_in(cpudev, ...), instead of directly
> reaching into the CPU struct env->irq_inputs. (There's probably
> a way to structure this change to avoid having to change the CPU
> and all the board code at once, but I haven't thought it through.)
> 
> For the spapr one: this is in machine model code, and currently machines
> aren't subtypes of TYPE_DEVICE. I'd leave this one alone for now;
> we can come back and think about it later.
> 
> For pnv_psi.c: these appear to be because the PnvPsi device is
> allocating irq lines which really should belong to the ICSState
> object (and as a result the ICSState code is having to expose
> ics->nr_irqs and the ics_set_irq function when they could be
> internal to the ICSState code). The ICSState's init function
> should be creating these as qdev gpio lines.
> 
> pnv_lpc.c seems to be ISA related. hw/isa/lpc_ich9.c is an
> example of setting up IRQs for isa_bus_irqs() without using
> qemu_allocate_irqs(), but there may be some more generalised
> ISA cleanup possible here.

The issue with PPC IRQs also affects the OpenPIC implementation: when I last looked a 
while back I didn't see any obvious issues against using gpio IRQs, but the main 
blocker for me was not being able to test all the different PPC machine configurations.

Out of curiosity does anyone know how to test the KVM in-kernel OpenPIC 
implementation in hw/intc/openpic_kvm.c? It seems to be used for e500 only.

I think there is some good work to be done converting ISA devices over to using GPIOs 
and improving the interaction with PCI, but it's something that still remains on my 
TODO list. Again the changes would be mostly mechanical with the main concern being 
over testing to ensure that there are no regressions.


ATB,

Mark.

