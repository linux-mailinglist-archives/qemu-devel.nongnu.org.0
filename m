Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D40F5A11A2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 15:13:48 +0200 (CEST)
Received: from localhost ([::1]:58474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRCg7-00089x-4x
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 09:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRCcU-0004AW-KS; Thu, 25 Aug 2022 09:10:16 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:39846 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRCcQ-0006sT-LU; Thu, 25 Aug 2022 09:10:02 -0400
Received: from smtpclient.apple (unknown [223.104.41.52])
 by APP-05 (Coremail) with SMTP id zQCowACH89CRdAdjHpQPAA--.1766S2;
 Thu, 25 Aug 2022 21:09:38 +0800 (CST)
Content-Type: multipart/mixed;
 boundary=Apple-Mail-846C1BFF-6F75-4BB9-892C-021C2FBB37CA
Content-Transfer-Encoding: 7bit
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 1/3] hw/nvme: support irq(de)assertion with eventfd
Date: Thu, 25 Aug 2022 21:09:37 +0800
Message-Id: <29A5902D-D6FD-413A-B540-9C0E18B6329A@ict.ac.cn>
References: <YwdtOPccnpoMQLDq@apples>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
In-Reply-To: <YwdtOPccnpoMQLDq@apples>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: iPhone Mail (19E241)
X-CM-TRANSID: zQCowACH89CRdAdjHpQPAA--.1766S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFy7CrW8uFyxJrWDAFW8Zwb_yoWrZw4kp3
 yFgFyYy397Kr9FgwsrtanrXFyIvw1rJ345Aw1DtryI9r9YvF9akFy8JryxWFWSyF4FqFy0
 vrW8tF9rAw12vaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21le4C267I2x7xF
 54xIwI1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I
 8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK
 82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
 C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
 MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
 IF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
 x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bOoGdUUUUU=
X-Originating-IP: [223.104.41.52]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--Apple-Mail-846C1BFF-6F75-4BB9-892C-021C2FBB37CA
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable




> =E5=9C=A8 2022=E5=B9=B48=E6=9C=8825=E6=97=A5=EF=BC=8C20:39=EF=BC=8CKlaus J=
ensen <its@irrelevant.dk> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> =EF=BB=BFOn Aug 25 13:56, Klaus Jensen wrote:
>>> On Aug 25 19:16, Jinhao Fan wrote:
>>> On 8/25/2022 5:33 PM, Klaus Jensen wrote:
>>>> I'm still a bit perplexed by this issue, so I just tried moving
>>>> nvme_init_irq_notifier() to the end of nvme_init_cq() and removing this=

>>>> first_io_cqe thing. I did not observe any particular issues?
>>>>=20
>>>> What bad behavior did you encounter, it seems to work fine to me
>>>=20
>>> The kernel boots up and got stuck, waiting for interrupts. Then the requ=
est
>>> times out and got retried three times. Finally the driver seems to decid=
e
>>> that the drive is down and continues to boot.
>>>=20
>>> I added some prints during debugging and found that the MSI-X message wh=
ich
>>> got registered in KVM via kvm_irqchip_add_msi_route() is not the same as=
 the
>>> one actually used in msix_notify().
>>>=20
>>> Are you sure you are using KVM's irqfd?
>>>=20
>>=20
>> Pretty sure? Using "ioeventfd=3Don,irq-eventfd=3Don" on the controller.
>>=20
>> And the following patch.
>>=20
>>=20
>> diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
>> index 30bbda7bb5ae..b2e41d3bd745 100644
>> --- i/hw/nvme/ctrl.c
>> +++ w/hw/nvme/ctrl.c
>> @@ -1490,21 +1490,6 @@ static void nvme_post_cqes(void *opaque)
>>             if (!pending) {
>>                 n->cq_pending++;
>>             }
>> -
>> -            if (unlikely(cq->first_io_cqe)) {
>> -                /*
>> -                 * Initilize event notifier when first cqe is posted. Fo=
r irqfd=20
>> -                 * support we need to register the MSI message in KVM. W=
e
>> -                 * can not do this registration at CQ creation time beca=
use
>> -                 * Linux's NVMe driver changes the MSI message after CQ c=
reation.
>> -                 */
>> -                cq->first_io_cqe =3D false;
>> -
>> -                if (n->params.irq_eventfd) {
>> -                    nvme_init_irq_notifier(n, cq);
>> -                }
>> -            }
>> -
>>         }
>>=20
>>         nvme_irq_assert(n, cq);
>> @@ -4914,11 +4899,14 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl=
 *n, uint64_t dma_addr,
>>     }
>>     n->cq[cqid] =3D cq;
>>     cq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
>> +
>>     /*=20
>>      * Only enable irqfd for IO queues since we always emulate admin queu=
e=20
>>      * in main loop thread=20
>>      */
>> -    cq->first_io_cqe =3D cqid !=3D 0;
>> +    if (cqid && n->params.irq_eventfd) {
>> +        nvme_init_irq_notifier(n, cq);
>> +    }
>> }
>>=20
>>=20
>=20
> =46rom a trace, this is what I observe:
>=20
> First, the queue is created and a virq (0) is assigned.
>=20
>  msix_table_mmio_write dev nvme hwaddr 0xc val 0x0 size 4
>  pci_nvme_mmio_write addr 0x1000 data 0x7 size 4
>  pci_nvme_mmio_doorbell_sq sqid 0 new_tail 7
>  pci_nvme_admin_cmd cid 4117 sqid 0 opc 0x5 opname 'NVME_ADM_CMD_CREATE_CQ=
'
>  pci_nvme_create_cq create completion queue, addr=3D0x104318000, cqid=3D1,=
 vector=3D1, qsize=3D1023, qflags=3D3, ien=3D1
>  kvm_irqchip_add_msi_route dev nvme vector 1 virq 0
>  kvm_irqchip_commit_routes
>  pci_nvme_enqueue_req_completion cid 4117 cqid 0 dw0 0x0 dw1 0x0 status 0x=
0
>  pci_nvme_irq_msix raising MSI-X IRQ vector 0
>  pci_nvme_mmio_write addr 0x1004 data 0x7 size 4
>  pci_nvme_mmio_doorbell_cq cqid 0 new_head 7
>=20
> We go on and the SQ is created as well.
>=20
>  pci_nvme_mmio_write addr 0x1000 data 0x8 size 4
>  pci_nvme_mmio_doorbell_sq sqid 0 new_tail 8
>  pci_nvme_admin_cmd cid 4118 sqid 0 opc 0x1 opname 'NVME_ADM_CMD_CREATE_SQ=
'
>  pci_nvme_create_sq create submission queue, addr=3D0x1049a0000, sqid=3D1,=
 cqid=3D1, qsize=3D1023, qflags=3D1
>  pci_nvme_enqueue_req_completion cid 4118 cqid 0 dw0 0x0 dw1 0x0 status 0x=
0
>  pci_nvme_irq_msix raising MSI-X IRQ vector 0
>  pci_nvme_mmio_write addr 0x1004 data 0x8 size 4
>  pci_nvme_mmio_doorbell_cq cqid 0 new_head 8
>=20
>=20
> Then i get a bunch of update_msi_routes, but the virq's are not related
> to the nvme device.
>=20
> However, I then assume we hit queue_request_irq() in the kernel and we
> see the MSI-X table updated:
>=20
>  msix_table_mmio_write dev nvme hwaddr 0x1c val 0x1 size 4
>  msix_table_mmio_write dev nvme hwaddr 0x10 val 0xfee003f8 size 4
>  msix_table_mmio_write dev nvme hwaddr 0x14 val 0x0 size 4
>  msix_table_mmio_write dev nvme hwaddr 0x18 val 0x0 size 4
>  msix_table_mmio_write dev nvme hwaddr 0x1c val 0x0 size 4
>  kvm_irqchip_update_msi_route Updating MSI route virq=3D0
>  ... other virq updates
>  kvm_irqchip_commit_routes
>=20
> Notice the last trace line. The route for virq 0 is updated.
>=20
> Looks to me that the virq route is implicitly updated with the new
> message, no?

Could you try without the msix masking patch? I suspect our unmask function a=
ctually did the =E2=80=9Cimplicit=E2=80=9D update here.

>=20

--Apple-Mail-846C1BFF-6F75-4BB9-892C-021C2FBB37CA
Content-Type: application/octet-stream;
	name=signature.asc;
	x-apple-part-url=69A37D70-9FB1-461A-8EBF-25EB9CB726C8
Content-Disposition: attachment;
	filename=signature.asc
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMHbTcACgkQTeGvMW1P
DempXwgAhefrwajftbdm0SLeL3isCwQYRl3qCekbUGw2cFlcblNyvn7NSj5sjtX3
1x7XcHv4LVGaRlE7b/r5RadVT938KFjs57Jxc0xzzPeo+tHT5B62Hw6lFZf4KT/d
kykxcggCuVS7Fvmg/iQgXuY5O3FgH+3NiUX8mc6Qgu8rQHBC1eD3u067sVS9K2Gr
Ky2StxAly6chRY8veARY9Go6jUZpD+N0nDRa8x9CP+wn19bqp8oq7DcanB3hvBv4
m30Y2QmzdIQge68gWpsP1x4ehVmn399/87TJz25tboPexWVEmkuHvSDZRU7HyoJ5
QOqqKYZ1Ioexxhd8cuMFvE9N3edPAg==
=Yhtw
-----END PGP SIGNATURE-----


--Apple-Mail-846C1BFF-6F75-4BB9-892C-021C2FBB37CA--


