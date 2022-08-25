Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672425A12FF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:09:23 +0200 (CEST)
Received: from localhost ([::1]:51232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRDXt-0002mh-N1
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRDU9-00080O-D7; Thu, 25 Aug 2022 10:05:30 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:45782 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRDU1-0008GW-Oo; Thu, 25 Aug 2022 10:05:28 -0400
Received: from [127.0.0.1] (unknown [223.104.41.143])
 by APP-01 (Coremail) with SMTP id qwCowADnyTqWgQdjylUSAA--.2115S2;
 Thu, 25 Aug 2022 22:05:11 +0800 (CST)
Message-ID: <9752bcab-a72a-dc29-d6e8-bc74c748c508@ict.ac.cn>
Date: Thu, 25 Aug 2022 22:05:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 1/3] hw/nvme: support irq(de)assertion with eventfd
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
References: <20220825074746.2047420-1-fanjinhao21s@ict.ac.cn>
 <20220825074746.2047420-2-fanjinhao21s@ict.ac.cn> <YwdB//iV62uWeqJK@apples>
 <7e5708c6-ffad-d867-a232-85ce55ee60b4@ict.ac.cn> <YwdjdZye1L/D+29G@apples>
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <YwdjdZye1L/D+29G@apples>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowADnyTqWgQdjylUSAA--.2115S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF1ktr13tw48Cryrtr13urg_yoW5XF1Upa
 yFgFWFkFs7tr47WanF9a1jqF93uwn5XF1UC3Wkt342vrnxZr9a9ay8GFy7AFZ5urWxGFyk
 Ar4DKa42ya42q3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF
 04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
 18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
 r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
 1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
 0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bOoGdUUUUU=
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

On 8/25/2022 7:56 PM, Klaus Jensen wrote:
> On Aug 25 19:16, Jinhao Fan wrote:
>> On 8/25/2022 5:33 PM, Klaus Jensen wrote:
>>> I'm still a bit perplexed by this issue, so I just tried moving
>>> nvme_init_irq_notifier() to the end of nvme_init_cq() and removing this
>>> first_io_cqe thing. I did not observe any particular issues?
>>>
>>> What bad behavior did you encounter, it seems to work fine to me
>>
>> The kernel boots up and got stuck, waiting for interrupts. Then the request
>> times out and got retried three times. Finally the driver seems to decide
>> that the drive is down and continues to boot.
>>
>> I added some prints during debugging and found that the MSI-X message which
>> got registered in KVM via kvm_irqchip_add_msi_route() is not the same as the
>> one actually used in msix_notify().
>>
>> Are you sure you are using KVM's irqfd?
>>
> 
> Pretty sure? Using "ioeventfd=on,irq-eventfd=on" on the controller.
> 
> And the following patch.
> 
> 
> diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
> index 30bbda7bb5ae..b2e41d3bd745 100644
> --- i/hw/nvme/ctrl.c
> +++ w/hw/nvme/ctrl.c
> @@ -1490,21 +1490,6 @@ static void nvme_post_cqes(void *opaque)
>               if (!pending) {
>                   n->cq_pending++;
>               }
> -
> -            if (unlikely(cq->first_io_cqe)) {
> -                /*
> -                 * Initilize event notifier when first cqe is posted. For irqfd
> -                 * support we need to register the MSI message in KVM. We
> -                 * can not do this registration at CQ creation time because
> -                 * Linux's NVMe driver changes the MSI message after CQ creation.
> -                 */
> -                cq->first_io_cqe = false;
> -
> -                if (n->params.irq_eventfd) {
> -                    nvme_init_irq_notifier(n, cq);
> -                }
> -            }
> -
>           }
>   
>           nvme_irq_assert(n, cq);
> @@ -4914,11 +4899,14 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
>       }
>       n->cq[cqid] = cq;
>       cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
> +
>       /*
>        * Only enable irqfd for IO queues since we always emulate admin queue
>        * in main loop thread
>        */
> -    cq->first_io_cqe = cqid != 0;
> +    if (cqid && n->params.irq_eventfd) {
> +        nvme_init_irq_notifier(n, cq);
> +    }
>   }
> 
> 

Interesting. This patch does not work well for me. Here is the kernel 
boot log related to NVMe:

[    0.625096] nvme nvme0: 4/0/0 default/read/poll queues
[    0.627386] IPI shorthand broadcast: enabled
[    0.627534] nvme nvme0: Ignoring bogus Namespace Identifiers
[    0.628167] sched_clock: Marking stable (528813377, 
99314943)->(636909773, -8781453)
[    0.629204] Spurious interrupt (vector 0xef) on CPU#0. Acked
....
[   30.901423] nvme nvme0: I/O 320 (Read) QID 2 timeout, aborting
[   30.902696] nvme nvme0: Abort status: 0x0

Notice the "spurious interrupt" line. I believe this means the MSI 
message is incorrect.


