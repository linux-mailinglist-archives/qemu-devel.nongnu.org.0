Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8C0580F8B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 11:05:48 +0200 (CEST)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGGVe-0000mS-Ct
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 05:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oGGMN-00036w-QW
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 04:56:12 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:56286 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oGGMK-0001gO-8Q
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 04:56:11 -0400
Received: from smtpclient.apple (unknown [159.226.43.13])
 by APP-01 (Coremail) with SMTP id qwCowADX358crN9i5UWAAg--.62481S2;
 Tue, 26 Jul 2022 16:55:57 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] hw/nvme: Add iothread support
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <20220720090053.309229-1-fanjinhao21s@ict.ac.cn>
Date: Tue, 26 Jul 2022 16:55:54 +0800
Cc: its@irrelevant.dk,
 kbusch@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E29F6EF6-F2BF-41F4-B04E-E6D901D64078@ict.ac.cn>
References: <20220720090053.309229-1-fanjinhao21s@ict.ac.cn>
To: qemu-devel <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowADX358crN9i5UWAAg--.62481S2
X-Coremail-Antispam: 1UD129KBjvJXoW3KFWrWw47tF1ftFyfGF4rKrg_yoWDWw48pF
 W8XF9xua97AF17Zws0qanrtwn5u3y8W3WUC34ftwn3J3Z7C34akFy8CFyakrWrArZ3XrWr
 Zay3trsrua9rt3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8ZwCF04k2
 0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
 8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41l
 IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
 AIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
 z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5tcTJUUUUU==
X-Originating-IP: [159.226.43.13]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

at 5:00 PM, Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:

> Add an option "iothread=3Dx" to do emulation in a seperate iothread.
> This improves the performance because QEMU's main loop is responsible
> for a lot of other work while iothread is dedicated to NVMe emulation.
> Moreover, emulating in iothread brings the potential of polling on
> SQ/CQ doorbells, which I will bring up in a following patch.
>=20
> Iothread can be enabled by:
> -object iothread,id=3Dnvme0 \
> -device nvme,iothread=3Dnvme0 \
>=20
> Performance comparisons (KIOPS):
>=20
> QD         1   4  16  64
> QEMU      41 136 242 338
> iothread  53 155 245 309
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
> hw/nvme/ctrl.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++----
> hw/nvme/ns.c   | 19 +++++++++---
> hw/nvme/nvme.h |  6 +++-
> 3 files changed, 95 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 533ad14e7a..a4efc97b33 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -4257,6 +4257,7 @@ static int nvme_init_cq_ioeventfd(NvmeCQueue =
*cq)
> {
>     NvmeCtrl *n =3D cq->ctrl;
>     uint16_t offset =3D (cq->cqid << 3) + (1 << 2);
> +    bool in_iothread =3D !qemu_in_main_thread();
>     int ret;
>=20
>     ret =3D event_notifier_init(&cq->notifier, 0);
> @@ -4264,10 +4265,19 @@ static int nvme_init_cq_ioeventfd(NvmeCQueue =
*cq)
>         return ret;
>     }
>=20
> -    event_notifier_set_handler(&cq->notifier, nvme_cq_notifier);
> +    if (in_iothread) {
> +        qemu_mutex_lock_iothread();
> +    }
> +
> +    aio_set_event_notifier(n->ctx, &cq->notifier, true, =
nvme_cq_notifier,
> +                           NULL, NULL);
>     memory_region_add_eventfd(&n->iomem,
>                               0x1000 + offset, 4, false, 0, =
&cq->notifier);
>=20
> +    if (in_iothread) {
> +        qemu_mutex_unlock_iothread();
> +    }
> +   =20
>     return 0;
> }
>=20
> @@ -4284,6 +4294,7 @@ static int nvme_init_sq_ioeventfd(NvmeSQueue =
*sq)
> {
>     NvmeCtrl *n =3D sq->ctrl;
>     uint16_t offset =3D sq->sqid << 3;
> +    bool in_iothread =3D !qemu_in_main_thread();
>     int ret;
>=20
>     ret =3D event_notifier_init(&sq->notifier, 0);
> @@ -4291,9 +4302,16 @@ static int nvme_init_sq_ioeventfd(NvmeSQueue =
*sq)
>         return ret;
>     }
>=20
> -    event_notifier_set_handler(&sq->notifier, nvme_sq_notifier);
> +    if (in_iothread) {
> +        qemu_mutex_lock_iothread();
> +    }
> +    aio_set_event_notifier(n->ctx, &sq->notifier, true, =
nvme_sq_notifier,
> +                           NULL, NULL);
>     memory_region_add_eventfd(&n->iomem,
>                               0x1000 + offset, 4, false, 0, =
&sq->notifier);
> +    if (in_iothread) {
> +        qemu_mutex_unlock_iothread();
> +    }
>=20
>     return 0;
> }
> @@ -4301,13 +4319,22 @@ static int nvme_init_sq_ioeventfd(NvmeSQueue =
*sq)
> static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
> {
>     uint16_t offset =3D sq->sqid << 3;
> +    bool in_iothread =3D !qemu_in_main_thread();
>=20
>     n->sq[sq->sqid] =3D NULL;
>     timer_free(sq->timer);
>     if (sq->ioeventfd_enabled) {
> +        if (in_iothread) {
> +            qemu_mutex_lock_iothread();
> +        }
> +
>         memory_region_del_eventfd(&n->iomem,
>                                   0x1000 + offset, 4, false, 0, =
&sq->notifier);
>         event_notifier_cleanup(&sq->notifier);
> +
> +        if (in_iothread) {
> +            qemu_mutex_unlock_iothread();
> +        }
>     }
>     g_free(sq->io_req);
>     if (sq->sqid) {
> @@ -4376,8 +4403,9 @@ static void nvme_init_sq(NvmeSQueue *sq, =
NvmeCtrl *n, uint64_t dma_addr,
>         sq->io_req[i].sq =3D sq;
>         QTAILQ_INSERT_TAIL(&(sq->req_list), &sq->io_req[i], entry);
>     }
> -    sq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, =
sq);
>=20
> +    sq->timer =3D aio_timer_new(n->ctx, QEMU_CLOCK_VIRTUAL, SCALE_NS,
> +                              nvme_process_sq, sq);
>     if (n->dbbuf_enabled) {
>         sq->db_addr =3D n->dbbuf_dbs + (sqid << 3);
>         sq->ei_addr =3D n->dbbuf_eis + (sqid << 3);
> @@ -4691,13 +4719,22 @@ static uint16_t nvme_get_log(NvmeCtrl *n, =
NvmeRequest *req)
> static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
> {
>     uint16_t offset =3D (cq->cqid << 3) + (1 << 2);
> +    bool in_iothread =3D !qemu_in_main_thread();
>=20
>     n->cq[cq->cqid] =3D NULL;
>     timer_free(cq->timer);
>     if (cq->ioeventfd_enabled) {
> +        if (in_iothread) {
> +            qemu_mutex_lock_iothread();
> +        }
> +       =20
>         memory_region_del_eventfd(&n->iomem,
>                                   0x1000 + offset, 4, false, 0, =
&cq->notifier);
>         event_notifier_cleanup(&cq->notifier);
> +       =20
> +        if (in_iothread) {
> +            qemu_mutex_unlock_iothread();
> +        }
>     }
>     if (msix_enabled(&n->parent_obj)) {
>         msix_vector_unuse(&n->parent_obj, cq->vector);
> @@ -4765,7 +4802,8 @@ static void nvme_init_cq(NvmeCQueue *cq, =
NvmeCtrl *n, uint64_t dma_addr,
>         }
>     }
>     n->cq[cqid] =3D cq;
> -    cq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, =
cq);
> +    cq->timer =3D aio_timer_new(n->ctx, QEMU_CLOCK_VIRTUAL, SCALE_NS,
> +                              nvme_post_cqes, cq);
> }
>=20
> static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
> @@ -6557,6 +6595,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr =
offset, uint64_t data,
>     uint32_t intms =3D ldl_le_p(&n->bar.intms);
>     uint32_t csts =3D ldl_le_p(&n->bar.csts);
>     uint32_t pmrsts =3D ldl_le_p(&n->bar.pmrsts);
> +    bool in_iothread =3D !qemu_in_main_thread();
>=20
>     if (unlikely(offset & (sizeof(uint32_t) - 1))) {
>         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_misaligned32,
> @@ -6726,10 +6765,22 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr =
offset, uint64_t data,
>=20
>         stl_le_p(&n->bar.pmrctl, data);
>         if (NVME_PMRCTL_EN(data)) {
> +            if (in_iothread) {
> +                qemu_mutex_lock_iothread();
> +            }
>             memory_region_set_enabled(&n->pmr.dev->mr, true);
> +            if (in_iothread) {
> +                qemu_mutex_unlock_iothread();
> +            }
>             pmrsts =3D 0;
>         } else {
> +            if (in_iothread) {
> +                qemu_mutex_lock_iothread();
> +            }
>             memory_region_set_enabled(&n->pmr.dev->mr, false);
> +            if (in_iothread) {
> +                qemu_mutex_unlock_iothread();
> +            }
>             NVME_PMRSTS_SET_NRDY(pmrsts, 1);
>             n->pmr.cmse =3D false;
>         }
> @@ -7528,6 +7579,14 @@ static void nvme_init_ctrl(NvmeCtrl *n, =
PCIDevice *pci_dev)
>     if (pci_is_vf(&n->parent_obj) && !sctrl->scs) {
>         stl_le_p(&n->bar.csts, NVME_CSTS_FAILED);
>     }
> +
> +    if (n->params.iothread) {
> +        n->iothread =3D n->params.iothread;
> +        object_ref(OBJECT(n->iothread));
> +        n->ctx =3D iothread_get_aio_context(n->iothread);
> +    } else {
> +        n->ctx =3D qemu_get_aio_context();
> +    }
> }
>=20
> static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
> @@ -7600,7 +7659,7 @@ static void nvme_realize(PCIDevice *pci_dev, =
Error **errp)
>         ns =3D &n->namespace;
>         ns->params.nsid =3D 1;
>=20
> -        if (nvme_ns_setup(ns, errp)) {
> +        if (nvme_ns_setup(n, ns, errp)) {
>             return;
>         }
>=20
> @@ -7631,6 +7690,15 @@ static void nvme_exit(PCIDevice *pci_dev)
>     g_free(n->sq);
>     g_free(n->aer_reqs);
>=20
> +    aio_context_acquire(n->ctx);
> +    blk_set_aio_context(n->namespace.blkconf.blk, =
qemu_get_aio_context(), NULL);
> +    aio_context_release(n->ctx);
> +
> +    if (n->iothread) {
> +        object_unref(OBJECT(n->iothread));
> +        n->iothread =3D NULL;
> +    }
> +
>     if (n->params.cmb_size_mb) {
>         g_free(n->cmb.buf);
>     }
> @@ -7665,6 +7733,8 @@ static Property nvme_props[] =3D {
>     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, =
false),
>     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, =
false),
>     DEFINE_PROP_BOOL("ioeventfd", NvmeCtrl, params.ioeventfd, true),
> +    DEFINE_PROP_LINK("iothread", NvmeCtrl, params.iothread, =
TYPE_IOTHREAD,
> +                     IOThread *),
>     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
>     DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
>                      params.auto_transition_zones, true),
> diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
> index 62a1f97be0..683d0d7a3b 100644
> --- a/hw/nvme/ns.c
> +++ b/hw/nvme/ns.c
> @@ -146,8 +146,10 @@ lbaf_found:
>     return 0;
> }
>=20
> -static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
> +static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error =
**errp)
> {
> +    AioContext *old_context;
> +    int ret;
>     bool read_only;
>=20
>     if (!blkconf_blocksizes(&ns->blkconf, errp)) {
> @@ -170,6 +172,15 @@ static int nvme_ns_init_blk(NvmeNamespace *ns, =
Error **errp)
>         return -1;
>     }
>=20
> +    old_context =3D blk_get_aio_context(ns->blkconf.blk);
> +    aio_context_acquire(old_context);
> +    ret =3D blk_set_aio_context(ns->blkconf.blk, n->ctx, errp);
> +    aio_context_release(old_context);
> +
> +    if (ret) {
> +        error_setg(errp, "Set AioContext on BlockBackend failed");
> +    }
> +
>     return 0;
> }
>=20
> @@ -482,13 +493,13 @@ static int =
nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
>     return 0;
> }
>=20
> -int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
> +int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
> {
>     if (nvme_ns_check_constraints(ns, errp)) {
>         return -1;
>     }
>=20
> -    if (nvme_ns_init_blk(ns, errp)) {
> +    if (nvme_ns_init_blk(n, ns, errp)) {
>         return -1;
>     }
>=20
> @@ -563,7 +574,7 @@ static void nvme_ns_realize(DeviceState *dev, =
Error **errp)
>         }
>     }
>=20
> -    if (nvme_ns_setup(ns, errp)) {
> +    if (nvme_ns_setup(n, ns, errp)) {
>         return;
>     }
>=20
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 79f5c281c2..85e2aa7b29 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -21,6 +21,7 @@
> #include "qemu/uuid.h"
> #include "hw/pci/pci.h"
> #include "hw/block/block.h"
> +#include "sysemu/iothread.h"
>=20
> #include "block/nvme.h"
>=20
> @@ -275,7 +276,7 @@ static inline void =
nvme_aor_dec_active(NvmeNamespace *ns)
> }
>=20
> void nvme_ns_init_format(NvmeNamespace *ns);
> -int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
> +int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
> void nvme_ns_drain(NvmeNamespace *ns);
> void nvme_ns_shutdown(NvmeNamespace *ns);
> void nvme_ns_cleanup(NvmeNamespace *ns);
> @@ -427,6 +428,7 @@ typedef struct NvmeParams {
>     uint16_t sriov_vi_flexible;
>     uint8_t  sriov_max_vq_per_vf;
>     uint8_t  sriov_max_vi_per_vf;
> +    IOThread *iothread;
> } NvmeParams;
>=20
> typedef struct NvmeCtrl {
> @@ -458,6 +460,8 @@ typedef struct NvmeCtrl {
>     uint64_t    dbbuf_dbs;
>     uint64_t    dbbuf_eis;
>     bool        dbbuf_enabled;
> +    IOThread    *iothread;
> +    AioContext  *ctx;
>=20
>     struct {
>         MemoryRegion mem;
> --=20
> 2.25.1

Hi Klaus and Keith,

I just added support for interrupt masking. How can I test interrupt
masking?

Thanks,
Jinhao Fan=


