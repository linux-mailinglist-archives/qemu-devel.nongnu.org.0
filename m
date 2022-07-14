Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F5A575107
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 16:43:52 +0200 (CEST)
Received: from localhost ([::1]:48360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC04F-00074W-N5
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 10:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oC02S-0003wB-Ab; Thu, 14 Jul 2022 10:42:00 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:47110 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oC02O-0001vV-Ik; Thu, 14 Jul 2022 10:42:00 -0400
Received: from smtpclient.apple (unknown [111.199.64.159])
 by APP-05 (Coremail) with SMTP id zQCowAAXOX4rK9BiiAK0DQ--.9915S2;
 Thu, 14 Jul 2022 22:41:47 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] hw/nvme: add trace events for ioeventfd
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <20220714053444.883737-1-its@irrelevant.dk>
Date: Thu, 14 Jul 2022 22:41:47 +0800
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2CA55856-E1CE-40C1-98E3-C68E11A8D149@ict.ac.cn>
References: <20220714053444.883737-1-its@irrelevant.dk>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowAAXOX4rK9BiiAK0DQ--.9915S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFyUWw1xWFy3GF13uFWfZrb_yoW5Aw13pa
 97ZFnIk3WfAwsFgw1Yqr43Jrn7Zw4DXryIkw47tr13ArZ7Kry7tFW7G34UZr1fGFsrWrW5
 u34Dtr47X34SqaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I
 3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
 WUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
 wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
 k0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
 6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0OJ5UUUUU=
X-Originating-IP: [111.199.64.159]
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

at 1:34 PM, Klaus Jensen <its@irrelevant.dk> wrote:

> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> While testing Jinhaos ioeventfd patch I found it useful with a couple =
of
> additional trace events since we no longer see the mmio events.
>=20
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
> hw/nvme/ctrl.c       | 8 ++++++++
> hw/nvme/trace-events | 4 ++++
> 2 files changed, 12 insertions(+)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 533ad14e7a61..09725ec49c5d 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -1346,6 +1346,8 @@ static void nvme_post_cqes(void *opaque)
>     bool pending =3D cq->head !=3D cq->tail;
>     int ret;
>=20
> +    trace_pci_nvme_post_cqes(cq->cqid);
> +
>     QTAILQ_FOREACH_SAFE(req, &cq->req_list, entry, next) {
>         NvmeSQueue *sq;
>         hwaddr addr;
> @@ -4238,6 +4240,8 @@ static void nvme_cq_notifier(EventNotifier *e)
>     NvmeCQueue *cq =3D container_of(e, NvmeCQueue, notifier);
>     NvmeCtrl *n =3D cq->ctrl;
>=20
> +    trace_pci_nvme_cq_notify(cq->cqid);
> +
>     event_notifier_test_and_clear(&cq->notifier);
>=20
>     nvme_update_cq_head(cq);
> @@ -4275,6 +4279,8 @@ static void nvme_sq_notifier(EventNotifier *e)
> {
>     NvmeSQueue *sq =3D container_of(e, NvmeSQueue, notifier);
>=20
> +    trace_pci_nvme_sq_notify(sq->sqid);
> +
>     event_notifier_test_and_clear(&sq->notifier);
>=20
>     nvme_process_sq(sq);
> @@ -6240,6 +6246,8 @@ static void nvme_process_sq(void *opaque)
>     NvmeCtrl *n =3D sq->ctrl;
>     NvmeCQueue *cq =3D n->cq[sq->cqid];
>=20
> +    trace_pci_nvme_process_sq(sq->sqid);
> +
>     uint16_t status;
>     hwaddr addr;
>     NvmeCmd cmd;
> diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
> index fccb79f48973..45dd708bd2fa 100644
> --- a/hw/nvme/trace-events
> +++ b/hw/nvme/trace-events
> @@ -104,6 +104,10 @@ pci_nvme_mmio_shutdown_set(void) "shutdown bit =
set"
> pci_nvme_mmio_shutdown_cleared(void) "shutdown bit cleared"
> pci_nvme_shadow_doorbell_cq(uint16_t cqid, uint16_t =
new_shadow_doorbell) "cqid %"PRIu16" new_shadow_doorbell %"PRIu16""
> pci_nvme_shadow_doorbell_sq(uint16_t sqid, uint16_t =
new_shadow_doorbell) "sqid %"PRIu16" new_shadow_doorbell %"PRIu16""
> +pci_nvme_sq_notify(uint16_t sqid) "sqid %"PRIu16""
> +pci_nvme_cq_notify(uint16_t cqid) "cqid %"PRIu16""
> +pci_nvme_process_sq(uint16_t sqid) "sqid %"PRIu16""
> +pci_nvme_post_cqes(uint16_t cqid) "cqid %"PRIu16""
> pci_nvme_open_zone(uint64_t slba, uint32_t zone_idx, int all) "open =
zone, slba=3D%"PRIu64", idx=3D%"PRIu32", all=3D%"PRIi32""
> pci_nvme_close_zone(uint64_t slba, uint32_t zone_idx, int all) "close =
zone, slba=3D%"PRIu64", idx=3D%"PRIu32", all=3D%"PRIi32""
> pci_nvme_finish_zone(uint64_t slba, uint32_t zone_idx, int all) =
"finish zone, slba=3D%"PRIu64", idx=3D%"PRIu32", all=3D%"PRIi32""
> --=20
> 2.36.1

I agree on the addition of SQ and CQ notify trace events. But what is =
the
purpose for adding tracepoints for nvme_process_sq and nvme_post_cqes?=


