Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52234B9B4B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:40:18 +0100 (CET)
Received: from localhost ([::1]:57194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKcKo-0003GQ-1u
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:40:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKbZz-0006fY-9w
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:51:55 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:48513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKbZw-0004x8-UJ
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:51:54 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.98])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DA41FE0A6F80;
 Thu, 17 Feb 2022 08:51:48 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 17 Feb
 2022 08:51:48 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0035e24409f-8706-4a96-aa0b-a768c9d24571,
 6074F5EAC11FD030A47E229993F36105E76D55A4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <523b6988-57ac-7b1e-9791-a26bafc799ad@kaod.org>
Date: Thu, 17 Feb 2022 08:51:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ppc/spapr: Advertise StoreEOI for POWER10 compat guests
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220214141157.3800212-1-clg@kaod.org>
 <37359e01-8707-f21d-6578-3931fc3c0f63@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <37359e01-8707-f21d-6578-3931fc3c0f63@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 92eb8d0e-7a7d-4a34-b684-8e1ea3b95438
X-Ovh-Tracer-Id: 18344287184146828140
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeejgdduudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kardashevskiy <aik@ozlabs.ru>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[ adding a few people for the comments ]

On 2/16/22 23:17, Daniel Henrique Barboza wrote:
> 
> 
> On 2/14/22 11:11, Cédric Le Goater wrote:
>> When an interrupt has been handled, the OS notifies the interrupt
>> controller with a EOI sequence. On a POWER9 and POWER10 systems using
> 
> nit:  s/a EOI sequence/an EOI sequence
> 
> 
>> the XIVE interrupt controller, this can be done with a load or a store
>> operation on the ESB interrupt management page of the interrupt. The
>> StoreEOI operation has less latency and improves interrupt handling
>> performance but it was deactivated during the POWER9 DD2.0 timeframe
>> because of ordering issues. POWER9 systems use the LoadEOI instead.
>> POWER10 compat guests should have fixed the issue with
>> Load-after-Store ordering and StoreEOI can be activated for them
>> again.
>>
>> To maintain performance, this ordering is only enforced for the
>> XIVE_ESB_SET_PQ_10 load operation. This operation can be used to
>> disable temporarily an interrupt source. If StoreEOI is active, a
>> source could be left enabled if the load and store operations come
>> out of order.
>>
>> Add a check in our XIVE emulation model for Load-after-Store when
>> StoreEOI is active. It should catch unreliable sequences. Other load
>> operations should be fine without it.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   include/hw/ppc/spapr_xive.h |  1 +
>>   include/hw/ppc/xive.h       |  8 ++++++++
>>   hw/intc/spapr_xive.c        | 15 +++++++++++++++
>>   hw/intc/spapr_xive_kvm.c    | 15 +++++++++++++++
>>   hw/intc/xive.c              |  6 ++++++
>>   hw/ppc/spapr_hcall.c        |  7 +++++++
>>   6 files changed, 52 insertions(+)
>>
>> diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
>> index b282960ad90d..9c247d8bf57d 100644
>> --- a/include/hw/ppc/spapr_xive.h
>> +++ b/include/hw/ppc/spapr_xive.h
>> @@ -73,6 +73,7 @@ void spapr_xive_map_mmio(SpaprXive *xive);
>>   int spapr_xive_end_to_target(uint8_t end_blk, uint32_t end_idx,
>>                                uint32_t *out_server, uint8_t *out_prio);
>> +void spapr_xive_enable_store_eoi(SpaprXive *xive, bool enable);
>>   /*
>>    * KVM XIVE device helpers
>> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
>> index 126e4e2c3a17..133f308c2792 100644
>> --- a/include/hw/ppc/xive.h
>> +++ b/include/hw/ppc/xive.h
>> @@ -285,6 +285,14 @@ uint8_t xive_esb_set(uint8_t *pq, uint8_t value);
>>   #define XIVE_ESB_SET_PQ_10      0xe00 /* Load */
>>   #define XIVE_ESB_SET_PQ_11      0xf00 /* Load */
>> +/*
>> + * Load-after-store ordering
>> + *
>> + * Adding this offset to the load address will enforce
>> + * load-after-store ordering. This is required to use with StoreEOI.
>> + */
>> +#define XIVE_ESB_LD_ST_MO       0x40 /* Load-after-store ordering */
>> +
>>   uint8_t xive_source_esb_get(XiveSource *xsrc, uint32_t srcno);
>>   uint8_t xive_source_esb_set(XiveSource *xsrc, uint32_t srcno, uint8_t pq);
>> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
>> index dc641cc604bf..0b8a246ad594 100644
>> --- a/hw/intc/spapr_xive.c
>> +++ b/hw/intc/spapr_xive.c
>> @@ -25,6 +25,7 @@
>>   #include "hw/ppc/xive_regs.h"
>>   #include "hw/qdev-properties.h"
>>   #include "trace.h"
>> +#include "cpu-models.h"
>>   /*
>>    * XIVE Virtualization Controller BAR and Thread Managment BAR that we
>> @@ -1854,3 +1855,17 @@ void spapr_xive_hcall_init(SpaprMachineState *spapr)
>>       spapr_register_hypercall(H_INT_SYNC, h_int_sync);
>>       spapr_register_hypercall(H_INT_RESET, h_int_reset);
>>   }
>> +
>> +/*
>> + * Advertise StoreEOI for a P10 compat guest. OS is required to
>> + * enforce load-after-store ordering.
>> + */
>> +void spapr_xive_enable_store_eoi(SpaprXive *xive, bool enable)
>> +{
>> +    if (enable) {
>> +        xive->source.esb_flags |= XIVE_SRC_STORE_EOI;
>> +    } else {
>> +        xive->source.esb_flags &= ~XIVE_SRC_STORE_EOI;
>> +    }
>> +
>> +}
>> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
>> index 61fe7bd2d322..bd023407bd7f 100644
>> --- a/hw/intc/spapr_xive_kvm.c
>> +++ b/hw/intc/spapr_xive_kvm.c
>> @@ -296,6 +296,21 @@ static uint64_t xive_esb_rw(XiveSource *xsrc, int srcno, uint32_t offset,
>>   static uint8_t xive_esb_read(XiveSource *xsrc, int srcno, uint32_t offset)
>>   {
>> +    /*
>> +     * The XIVE_ESB_SET_PQ_10 load operation is used to disable
>> +     * temporarily an interrupt source. If StoreEOI is active, a
>> +     * source could be left enabled if the load and store operations
>> +     * come out of order.
>> +     *
>> +     * As we don't know the characteristics of the host source
>> +     * interrupts (StoreEOI or not), enforce the load-after-store
>> +     * ordering always. The performance penalty will be very small for
>> +     * QEMU.
>> +     */
>> +    if (offset == XIVE_ESB_SET_PQ_10) {
>> +        offset |= XIVE_ESB_LD_ST_MO;
>> +    }
>> +
>>       return xive_esb_rw(xsrc, srcno, offset, 0, 0) & 0x3;
>>   }
>> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
>> index b8e4c7294d59..d62881873b1b 100644
>> --- a/hw/intc/xive.c
>> +++ b/hw/intc/xive.c
>> @@ -1024,6 +1024,12 @@ static uint64_t xive_source_esb_read(void *opaque, hwaddr addr, unsigned size)
>>       case XIVE_ESB_SET_PQ_01 ... XIVE_ESB_SET_PQ_01 + 0x0FF:
>>       case XIVE_ESB_SET_PQ_10 ... XIVE_ESB_SET_PQ_10 + 0x0FF:
>>       case XIVE_ESB_SET_PQ_11 ... XIVE_ESB_SET_PQ_11 + 0x0FF:
>> +        if (offset == XIVE_ESB_SET_PQ_10 &&
>> +            xsrc->esb_flags & XIVE_SRC_STORE_EOI) {
>> +            qemu_log_mask(LOG_GUEST_ERROR, "XIVE: load-after-store ordering "
>> +                          "not enforced with Store EOI active for IRQ %d\n",
>> +                          srcno);
>> +        }
> 
> I'm afraid I have a lack of understanding of what is happening here but I'll try. Up
> there, in xive_esb_read(), you forced the load-after-store ordering for the Load
> operation that can left the source enabled if we have an out of order store-after-load
> situation. Given that it's a function in spapr_xive_kvm.c 

Yes, everything done in spapr_xive_kvm.c is related to the KVM support.

This means that the memory load/store operations are done directly on
the HW MMIO page of the XIVE controller and this from the QEMU user
space program. And so ...


> I understand that this is
> a wrapper for the kvmppc() calls into the host kernel XIVE irqchip, 

the host kernel XIVE irqchip is not involded. QEMU manipulates HW
directly bypassing the host kernel. This is important to understand.
QEMU "pokes and peeks" HW from user space.

> so that piece
> of code is forcing the load-after-store at all times for that Load operation since
> the performance penalty is not relevant.

yes. In that part, we don't know if StoreEOI has been enabled, so we
use the magic offset in any case.

This would be a no-op on P9 and would enforce load-after-store always
on P10. on P10, all sources should have StoreEOI, so it is a correct
thing to do.

xive_esb_read() is used in many places:

  1. in the machine change state handler, for migration and to catch
     inflight interrupts.
  2. to query state, for migration and for the monitor
  3. for LSI handling

We care about 1.

> Assuming that what I said is mostly correct, I don't understand why we can't do a
> similar thing in the hw/intc/xive.c case, where I suppose it's the XIVE emulation
> controller implementation that we're going to use if we don't have an  irqchip to
> use with KVM.

yes. This part of the code is always used for emulated sources. When
the KVM device is in use, it is not involved.

> Can't we force the load-after-store ordering in the emulated
> XIVE_ESB_SET_PQ_10 instead of throwing an error?

There are no load-after-store issues when under emulation. This is a
HW-only problem on high end systems. I think you need more than 4sockets
to show up. I have never seen it on 2 sockets.

But the HW does not tell if something is wrong in the code. At some point,
the OS freezes and possibly complains because an IRQ is (wrongly) pending.
The check done in xive_source_esb_read() is here to catch a misbehaving
OS which would use in some code path the racy XIVE_ESB_SET_PQ_10 without
adding the load-after-store ordering offset XIVE_ESB_LD_ST_MO. That's
how I tracked all the possible paths using XIVE_ESB_SET_PQ_10 under Linux.

Hope this is mostly clear.

Thanks,

C.

