Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFBB57B409
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 11:41:29 +0200 (CEST)
Received: from localhost ([::1]:53400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE6Cu-0000f9-L1
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 05:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oE5rb-0001Kb-9A
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:19:27 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:37318 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oE5rY-0003dN-C8
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:19:27 -0400
Received: from smtpclient.apple (unknown [159.226.43.13])
 by APP-05 (Coremail) with SMTP id zQCowABXUO6RyNdiOOTsDw--.54861S2;
 Wed, 20 Jul 2022 17:19:14 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [RFC] hw/nvme: Use irqfd to send interrupts
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
Date: Wed, 20 Jul 2022 17:19:13 +0800
Cc: Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <89A32E7F-1384-47FA-B476-81D719023241@ict.ac.cn>
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org,
 stefanha@redhat.com
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowABXUO6RyNdiOOTsDw--.54861S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF1xGF15KrW7Zr1ftw15XFb_yoWrAw4kpa
 yUGa93CrZ7J34xWr4aqwnrCwn8u3y0qr1UA3WfXry3Xr1kCr9xArWkKF4UJFyrGrZ8XFW5
 uw4Fqr1Uuw4Ut3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Cr0_Gr
 1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_GFWl42xK
 82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
 C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
 MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
 IF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
 6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2l1vUUUUU
X-Originating-IP: [159.226.43.13]
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

at 12:35 PM, Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:

> Use irqfd to directly notify KVM to inject interrupts. This is done by
> registering a virtual IRQ(virq) in KVM and associate the virq with an
> irqfd, so that KVM can directly inject the interrupt when it receives
> notification from the irqfd. This approach is supposed to improve=20
> performance because it bypasses QEMU's MSI interrupt emulation logic.
>=20
> However, I did not see an obvious improvement of the emulation KIOPS:
>=20
> QD      1   4  16  64=20
> QEMU   38 123 210 329
> irqfd  40 129 219 328
>=20
> I found this problem quite hard to diagnose since irqfd's workflow
> involves both QEMU and the in-kernel KVM.=20
>=20
> Could you help me figure out the following questions:
>=20
> 1. How much performance improvement can I expect from using irqfd?
> 2. How can I debug this kind of cross QEMU-KVM problems?
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
> hw/nvme/ctrl.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++++-
> hw/nvme/nvme.h |  3 +++
> 2 files changed, 68 insertions(+), 1 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 4b75c5f549..59768c4586 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -159,6 +159,7 @@
> #include "sysemu/sysemu.h"
> #include "sysemu/block-backend.h"
> #include "sysemu/hostmem.h"
> +#include "sysemu/kvm.h"
> #include "hw/pci/msix.h"
> #include "migration/vmstate.h"
>=20
> @@ -484,12 +485,70 @@ static void nvme_irq_check(NvmeCtrl *n)
>     }
> }
>=20
> +static int nvme_kvm_msix_vector_use(NvmeCtrl *n,
> +                                    NvmeCQueue *cq,
> +                                    int vector)
> +{
> +    int ret;
> +
> +    KVMRouteChange c =3D kvm_irqchip_begin_route_changes(kvm_state);
> +    ret =3D kvm_irqchip_add_msi_route(&c, vector, &n->parent_obj);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +    kvm_irqchip_commit_route_changes(&c);
> +    cq->virq =3D ret;
> +    return 0;
> +}
> +
> +static int nvme_init_cq_irqfd(NvmeCQueue *cq)
> +{
> +    int ret;
> +   =20
> +    ret =3D nvme_kvm_msix_vector_use(cq->ctrl, cq, (int)cq->vector);
> +    if (ret < 0) {
> +        goto fail;
> +    }
> +
> +    ret =3D event_notifier_init(&cq->irq_notifier, 0);
> +    if (ret < 0) {
> +        goto fail_notifier;
> +    }
> +
> +    ret =3D kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, =
&cq->irq_notifier,
> +                                              NULL, cq->virq);
> +    if (ret < 0) {
> +        goto fail_kvm;
> +    }
> +
> +    return 0;
> +                       =20
> +fail_kvm:
> +    event_notifier_cleanup(&cq->irq_notifier);
> +fail_notifier:
> +    kvm_irqchip_release_virq(kvm_state, cq->virq);
> +fail:
> +    return ret;
> +}
> +
> static void nvme_irq_assert(NvmeCtrl *n, NvmeCQueue *cq)
> {
>     if (cq->irq_enabled) {
>         if (msix_enabled(&(n->parent_obj))) {
> +            /* Initialize CQ irqfd */
> +            if (!cq->irqfd_enabled && n->params.ioeventfd && cq->cqid =
!=3D 0) {
> +                int ret =3D nvme_init_cq_irqfd(cq);
> +                if (ret =3D=3D 0) {
> +                    cq->irqfd_enabled =3D true;
> +                }
> +            }
> +
>             trace_pci_nvme_irq_msix(cq->vector);
> -            msix_notify(&(n->parent_obj), cq->vector);
> +            if (cq->irqfd_enabled) {
> +                event_notifier_set(&cq->irq_notifier);
> +            } else {
> +                msix_notify(&(n->parent_obj), cq->vector);
> +            }
>         } else {
>             trace_pci_nvme_irq_pin();
>             assert(cq->vector < 32);
> @@ -4670,6 +4729,12 @@ static void nvme_free_cq(NvmeCQueue *cq, =
NvmeCtrl *n)
>         event_notifier_cleanup(&cq->notifier);
>     }
>     if (msix_enabled(&n->parent_obj)) {
> +        if (cq->irqfd_enabled) {
> +            kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, =
&cq->irq_notifier,
> +                                                  cq->virq);
> +            kvm_irqchip_release_virq(kvm_state, cq->virq);
> +            event_notifier_cleanup(&cq->irq_notifier);
> +        }
>         msix_vector_unuse(&n->parent_obj, cq->vector);
>     }
>     if (cq->cqid) {
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 2a9beea0c8..84e5b00fe3 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -391,7 +391,10 @@ typedef struct NvmeCQueue {
>     uint64_t    ei_addr;
>     QEMUTimer   *timer;
>     EventNotifier notifier;
> +    EventNotifier irq_notifier;
> +    int         virq;
>     bool        ioeventfd_enabled;
> +    bool        irqfd_enabled;
>     QTAILQ_HEAD(, NvmeSQueue) sq_list;
>     QTAILQ_HEAD(, NvmeRequest) req_list;
> } NvmeCQueue;
> --=20
> 2.25.1

Hi Stefan,

It seems you originally introduced irqfd to virtio-blk to solve thread
safety problems [1]. Could you help explain the benefits of irqfd?

Thanks!
Jinhao Fan=


