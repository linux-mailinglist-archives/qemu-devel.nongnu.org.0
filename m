Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F0F5A132E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:16:51 +0200 (CEST)
Received: from localhost ([::1]:60746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRDf8-0002h7-6A
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRDah-0006Yv-JR; Thu, 25 Aug 2022 10:12:15 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:46838 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRDae-0001QZ-TU; Thu, 25 Aug 2022 10:12:15 -0400
Received: from [127.0.0.1] (unknown [223.104.41.143])
 by APP-01 (Coremail) with SMTP id qwCowAD3_2EtgwdjJbISAA--.2259S2;
 Thu, 25 Aug 2022 22:11:57 +0800 (CST)
Message-ID: <939c7608-77e6-4a71-96a9-9f22a4de37c4@ict.ac.cn>
Date: Thu, 25 Aug 2022 22:11:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 1/3] hw/nvme: support irq(de)assertion with eventfd
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
References: <YwdtOPccnpoMQLDq@apples>
 <29A5902D-D6FD-413A-B540-9C0E18B6329A@ict.ac.cn> <YweAJsEfLPBomz2W@apples>
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <YweAJsEfLPBomz2W@apples>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAD3_2EtgwdjJbISAA--.2259S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Aw1UZr4kurykXw1Utr4kXrb_yoW7ZF45pr
 WjgasYyrZ7GrnFqwsFqanFqFyIq348Jr1UXw1DtryI9ryqvF9YyFy8JryxWFyFyr4rXrWU
 ZrW8tr9rZr12yaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF
 04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAw
 C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
 wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
 v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvE
 x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
 DU0xZFpf9x07beJ5wUUUUU=
X-Originating-IP: [223.104.41.143]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 8/25/2022 9:59 PM, Klaus Jensen wrote:
> On Aug 25 21:09, Jinhao Fan wrote:
>>
>>
>>
>>> 在 2022年8月25日，20:39，Klaus Jensen <its@irrelevant.dk> 写道：
>>>
>>> ﻿On Aug 25 13:56, Klaus Jensen wrote:
>>>>> On Aug 25 19:16, Jinhao Fan wrote:
>>>>> On 8/25/2022 5:33 PM, Klaus Jensen wrote:
>>>>>> I'm still a bit perplexed by this issue, so I just tried moving
>>>>>> nvme_init_irq_notifier() to the end of nvme_init_cq() and removing this
>>>>>> first_io_cqe thing. I did not observe any particular issues?
>>>>>>
>>>>>> What bad behavior did you encounter, it seems to work fine to me
>>>>>
>>>>> The kernel boots up and got stuck, waiting for interrupts. Then the request
>>>>> times out and got retried three times. Finally the driver seems to decide
>>>>> that the drive is down and continues to boot.
>>>>>
>>>>> I added some prints during debugging and found that the MSI-X message which
>>>>> got registered in KVM via kvm_irqchip_add_msi_route() is not the same as the
>>>>> one actually used in msix_notify().
>>>>>
>>>>> Are you sure you are using KVM's irqfd?
>>>>>
>>>>
>>>> Pretty sure? Using "ioeventfd=on,irq-eventfd=on" on the controller.
>>>>
>>>> And the following patch.
>>>>
>>>>
>>>> diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
>>>> index 30bbda7bb5ae..b2e41d3bd745 100644
>>>> --- i/hw/nvme/ctrl.c
>>>> +++ w/hw/nvme/ctrl.c
>>>> @@ -1490,21 +1490,6 @@ static void nvme_post_cqes(void *opaque)
>>>>              if (!pending) {
>>>>                  n->cq_pending++;
>>>>              }
>>>> -
>>>> -            if (unlikely(cq->first_io_cqe)) {
>>>> -                /*
>>>> -                 * Initilize event notifier when first cqe is posted. For irqfd
>>>> -                 * support we need to register the MSI message in KVM. We
>>>> -                 * can not do this registration at CQ creation time because
>>>> -                 * Linux's NVMe driver changes the MSI message after CQ creation.
>>>> -                 */
>>>> -                cq->first_io_cqe = false;
>>>> -
>>>> -                if (n->params.irq_eventfd) {
>>>> -                    nvme_init_irq_notifier(n, cq);
>>>> -                }
>>>> -            }
>>>> -
>>>>          }
>>>>
>>>>          nvme_irq_assert(n, cq);
>>>> @@ -4914,11 +4899,14 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
>>>>      }
>>>>      n->cq[cqid] = cq;
>>>>      cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
>>>> +
>>>>      /*
>>>>       * Only enable irqfd for IO queues since we always emulate admin queue
>>>>       * in main loop thread
>>>>       */
>>>> -    cq->first_io_cqe = cqid != 0;
>>>> +    if (cqid && n->params.irq_eventfd) {
>>>> +        nvme_init_irq_notifier(n, cq);
>>>> +    }
>>>> }
>>>>
>>>>
>>>
>>>  From a trace, this is what I observe:
>>>
>>> First, the queue is created and a virq (0) is assigned.
>>>
>>>   msix_table_mmio_write dev nvme hwaddr 0xc val 0x0 size 4
>>>   pci_nvme_mmio_write addr 0x1000 data 0x7 size 4
>>>   pci_nvme_mmio_doorbell_sq sqid 0 new_tail 7
>>>   pci_nvme_admin_cmd cid 4117 sqid 0 opc 0x5 opname 'NVME_ADM_CMD_CREATE_CQ'
>>>   pci_nvme_create_cq create completion queue, addr=0x104318000, cqid=1, vector=1, qsize=1023, qflags=3, ien=1
>>>   kvm_irqchip_add_msi_route dev nvme vector 1 virq 0
>>>   kvm_irqchip_commit_routes
>>>   pci_nvme_enqueue_req_completion cid 4117 cqid 0 dw0 0x0 dw1 0x0 status 0x0
>>>   pci_nvme_irq_msix raising MSI-X IRQ vector 0
>>>   pci_nvme_mmio_write addr 0x1004 data 0x7 size 4
>>>   pci_nvme_mmio_doorbell_cq cqid 0 new_head 7
>>>
>>> We go on and the SQ is created as well.
>>>
>>>   pci_nvme_mmio_write addr 0x1000 data 0x8 size 4
>>>   pci_nvme_mmio_doorbell_sq sqid 0 new_tail 8
>>>   pci_nvme_admin_cmd cid 4118 sqid 0 opc 0x1 opname 'NVME_ADM_CMD_CREATE_SQ'
>>>   pci_nvme_create_sq create submission queue, addr=0x1049a0000, sqid=1, cqid=1, qsize=1023, qflags=1
>>>   pci_nvme_enqueue_req_completion cid 4118 cqid 0 dw0 0x0 dw1 0x0 status 0x0
>>>   pci_nvme_irq_msix raising MSI-X IRQ vector 0
>>>   pci_nvme_mmio_write addr 0x1004 data 0x8 size 4
>>>   pci_nvme_mmio_doorbell_cq cqid 0 new_head 8
>>>
>>>
>>> Then i get a bunch of update_msi_routes, but the virq's are not related
>>> to the nvme device.
>>>
>>> However, I then assume we hit queue_request_irq() in the kernel and we
>>> see the MSI-X table updated:
>>>
>>>   msix_table_mmio_write dev nvme hwaddr 0x1c val 0x1 size 4
>>>   msix_table_mmio_write dev nvme hwaddr 0x10 val 0xfee003f8 size 4
>>>   msix_table_mmio_write dev nvme hwaddr 0x14 val 0x0 size 4
>>>   msix_table_mmio_write dev nvme hwaddr 0x18 val 0x0 size 4
>>>   msix_table_mmio_write dev nvme hwaddr 0x1c val 0x0 size 4
>>>   kvm_irqchip_update_msi_route Updating MSI route virq=0
>>>   ... other virq updates
>>>   kvm_irqchip_commit_routes
>>>
>>> Notice the last trace line. The route for virq 0 is updated.
>>>
>>> Looks to me that the virq route is implicitly updated with the new
>>> message, no?
>>
>> Could you try without the msix masking patch? I suspect our unmask function actually did the “implicit” update here.
>>
>>>
> 
> RIGHT.
> 
> target/i386/kvm/kvm.c:
> 
> 5353     if (!notify_list_inited) {
> 5354         /* For the first time we do add route, add ourselves into
> 5355          * IOMMU's IEC notify list if needed. */
> 5356         X86IOMMUState *iommu = x86_iommu_get_default();
> 5357         if (iommu) {
> 5358             x86_iommu_iec_register_notifier(iommu,
> 5359                                             kvm_update_msi_routes_all,
> 5360                                             NULL);
> 5361         }
> 5362         notify_list_inited = true;
> 5363     }
> 
> If we have an IOMMU, then it all just works. I always run with a viommu
> configured, so that is why I was not seeing the issue. The masking has
> nothing to do with it.
> 
> I wonder if this can be made to work without the iommu as well...

Yes, I didn't use IOMMU in my tests. Is it possible that there is some 
unstated requirement that irqfd only works with IOMMU enabled? :)


