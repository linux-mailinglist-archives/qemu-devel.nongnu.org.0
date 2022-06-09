Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119A654412F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 03:51:40 +0200 (CEST)
Received: from localhost ([::1]:41574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz7Kk-0007Az-IE
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 21:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1nz7Ji-0006QO-86
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 21:50:34 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:38546 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1nz7JS-0001Sq-6p
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 21:50:34 -0400
Received: from smtpclient.apple (unknown [202.38.79.134])
 by APP-05 (Coremail) with SMTP id zQCowAAXOX67UaFiVefQAA--.18257S2;
 Thu, 09 Jun 2022 09:49:48 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Message-Id: <EAD17947-F778-438C-BCDA-9E9E815AFAE0@ict.ac.cn>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_D66AB6BD-2442-4443-8437-FCF74AEBDD71"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/2] hw/nvme: Implement shadow doorbell buffer support
Date: Thu, 9 Jun 2022 09:49:47 +0800
In-Reply-To: <YqEMwsclktptJvQI@apples>
Cc: qemu-devel@nongnu.org,
 Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
References: <20220608013659.472500-1-fanjinhao21s@ict.ac.cn>
 <20220608013659.472500-2-fanjinhao21s@ict.ac.cn> <YqEMwsclktptJvQI@apples>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowAAXOX67UaFiVefQAA--.18257S2
X-Coremail-Antispam: 1UD129KBjvJXoW3KrW8tryrKFWUKw1xKF1xZrb_yoWkXr1DpF
 Z0qr9FywsaqFnrXrWkJrZxX3Z8uwsrZFWUKwsxK342kan3Ary8ZFyDKFyUZr45uF4vgr1Y
 vrsavFsxXF4Iq3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21lYx0E2Ix0
 cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
 ACjcxG0xvY0x0EwIxGrwCjr7xvwVCIw2I0I7xG6c02F41l42xK82IYc2Ij64vIr41l4I8I
 3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxV
 WUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
 wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
 k0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
 Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5fCztUUUUU==
X-Originating-IP: [202.38.79.134]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
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


--Apple-Mail=_D66AB6BD-2442-4443-8437-FCF74AEBDD71
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jun 9, 2022, at 4:55 AM, Klaus Jensen <its@irrelevant.dk> wrote:
>=20
> On Jun  8 09:36, Jinhao Fan wrote:
>> Implement Doorbel Buffer Config command (Section 5.7 in NVMe Spec =
1.3)
>> and Shadow Doorbel buffer & EventIdx buffer handling logic (Section =
7.13
>> in NVMe Spec 1.3). For queues created before the Doorbell Buffer =
Config
>> command, the nvme_dbbuf_config function tries to associate each =
existing
>> SQ and CQ with its Shadow Doorbel buffer and EventIdx buffer address.
>> Queues created after the Doorbell Buffer Config command will have the
>> doorbell buffers associated with them when they are initialized.
>>=20
>> In nvme_process_sq and nvme_post_cqe, proactively check for Shadow
>> Doorbell buffer changes instead of wait for doorbell register =
changes.
>> This reduces the number of MMIOs.
>>=20
>> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
>> ---
>> hw/nvme/ctrl.c       | 95 =
++++++++++++++++++++++++++++++++++++++++++--
>> hw/nvme/nvme.h       |  8 ++++
>> include/block/nvme.h |  2 +
>> 3 files changed, 102 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> index 03760ddeae..d3f6c432df 100644
>> --- a/hw/nvme/ctrl.c
>> +++ b/hw/nvme/ctrl.c
>> @@ -223,6 +223,7 @@ static const uint32_t nvme_cse_acs[256] =3D {
>>     [NVME_ADM_CMD_GET_FEATURES]     =3D NVME_CMD_EFF_CSUPP,
>>     [NVME_ADM_CMD_ASYNC_EV_REQ]     =3D NVME_CMD_EFF_CSUPP,
>>     [NVME_ADM_CMD_NS_ATTACHMENT]    =3D NVME_CMD_EFF_CSUPP | =
NVME_CMD_EFF_NIC,
>> +    [NVME_ADM_CMD_DBBUF_CONFIG]     =3D NVME_CMD_EFF_CSUPP,
>>     [NVME_ADM_CMD_FORMAT_NVM]       =3D NVME_CMD_EFF_CSUPP | =
NVME_CMD_EFF_LBCC,
>> };
>>=20
>> @@ -1304,6 +1305,12 @@ static inline void nvme_blk_write(BlockBackend =
*blk, int64_t offset,
>>     }
>> }
>>=20
>> +static void nvme_update_cq_head(NvmeCQueue *cq)
>> +{
>> +    pci_dma_read(&cq->ctrl->parent_obj, cq->db_addr, &cq->head,
>> +            sizeof(cq->head));
>> +}
>> +
>> static void nvme_post_cqes(void *opaque)
>> {
>>     NvmeCQueue *cq =3D opaque;
>> @@ -1316,6 +1323,10 @@ static void nvme_post_cqes(void *opaque)
>>         NvmeSQueue *sq;
>>         hwaddr addr;
>>=20
>> +        if (cq->cqid && n->dbbuf_enabled) {
>> +            nvme_update_cq_head(cq);
>=20
> Shouldn't we update the cq head eventidx here (prior to reading the
> doorbell buffer)? Like we do for the sq tail?

I=E2=80=99m not sure whether updating cq head eventidx is necessary. My =
understanding is that the purpose of updating eventidx is for the guest =
to notify the host about cq head or sq tail changes with MMIO. For sq =
tail this is necessary because other than MMIO, there is no way to =
trigger the host to check for sq tail updates (shadow doorbell here). =
For cq head this is different. The host will read cq head shadow =
doorbell every time it wants to post a cqe. Therefore, letting the guest =
notify the host on cq head changes seems unnecessary.=20

Please correct me if I miss some point.

>=20
>> +        }
>> +
>>         if (nvme_cq_full(cq)) {
>>             break;
>>         }
>> @@ -4237,6 +4248,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, =
NvmeRequest *req)
>> static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t =
dma_addr,
>>                          uint16_t sqid, uint16_t cqid, uint16_t size)
>> {
>> +    uint32_t stride =3D 4 << NVME_CAP_DSTRD(n->bar.cap);
>>     int i;
>>     NvmeCQueue *cq;
>>=20
>> @@ -4256,6 +4268,11 @@ static void nvme_init_sq(NvmeSQueue *sq, =
NvmeCtrl *n, uint64_t dma_addr,
>>     }
>>     sq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, =
sq);
>>=20
>> +    if (sqid && n->dbbuf_dbs && n->dbbuf_eis) {
>> +        sq->db_addr =3D n->dbbuf_dbs + 2 * sqid * stride;
>> +        sq->ei_addr =3D n->dbbuf_eis + 2 * sqid * stride;
>> +    }
>> +
>>     assert(n->cq[cqid]);
>>     cq =3D n->cq[cqid];
>>     QTAILQ_INSERT_TAIL(&(cq->sq_list), sq, entry);
>> @@ -4599,6 +4616,7 @@ static void nvme_init_cq(NvmeCQueue *cq, =
NvmeCtrl *n, uint64_t dma_addr,
>>                          uint16_t cqid, uint16_t vector, uint16_t =
size,
>>                          uint16_t irq_enabled)
>> {
>> +    uint32_t stride =3D 4 << NVME_CAP_DSTRD(n->bar.cap);
>>     int ret;
>>=20
>>     if (msix_enabled(&n->parent_obj)) {
>> @@ -4615,6 +4633,10 @@ static void nvme_init_cq(NvmeCQueue *cq, =
NvmeCtrl *n, uint64_t dma_addr,
>>     cq->head =3D cq->tail =3D 0;
>>     QTAILQ_INIT(&cq->req_list);
>>     QTAILQ_INIT(&cq->sq_list);
>> +    if (cqid && n->dbbuf_dbs && n->dbbuf_eis) {
>> +        cq->db_addr =3D n->dbbuf_dbs + (2 * cqid + 1) * stride;
>> +        cq->ei_addr =3D n->dbbuf_eis + (2 * cqid + 1) * stride;
>> +    }
>>     n->cq[cqid] =3D cq;
>>     cq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, =
cq);
>> }
>> @@ -5767,6 +5789,43 @@ out:
>>     return status;
>> }
>>=20
>> +static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest =
*req)
>> +{
>> +    uint32_t stride =3D 4 << NVME_CAP_DSTRD(n->bar.cap);
>> +    uint64_t dbs_addr =3D le64_to_cpu(req->cmd.dptr.prp1);
>> +    uint64_t eis_addr =3D le64_to_cpu(req->cmd.dptr.prp2);
>> +    int i;
>> +
>> +    /* Address should be page aligned */
>> +    if (dbs_addr & (n->page_size - 1) || eis_addr & (n->page_size - =
1)) {
>> +        return NVME_INVALID_FIELD | NVME_DNR;
>> +    }
>> +
>> +    /* Save shadow buffer base addr for use during queue creation */
>> +    n->dbbuf_dbs =3D dbs_addr;
>> +    n->dbbuf_eis =3D eis_addr;
>> +    n->dbbuf_enabled =3D true;
>> +
>> +    for (i =3D 1; i < n->params.max_ioqpairs + 1; i++) {
>> +        NvmeSQueue *sq =3D n->sq[i];
>> +        NvmeCQueue *cq =3D n->cq[i];
>> +
>> +        if (sq) {
>> +            /* Submission queue tail pointer location, 2 * QID * =
stride */
>> +            sq->db_addr =3D dbs_addr + 2 * i * stride;
>> +            sq->ei_addr =3D eis_addr + 2 * i * stride;
>> +        }
>> +
>> +        if (cq) {
>> +            /* Completion queue head pointer location, (2 * QID + 1) =
* stride */
>> +            cq->db_addr =3D dbs_addr + (2 * i + 1) * stride;
>> +            cq->ei_addr =3D eis_addr + (2 * i + 1) * stride;
>> +        }
>> +    }
>=20
> Why no love for the admin queue? :)
>=20
> You are special-casing the admin queue below in process_sq() and
> process_db(), as well as above in post_cqes(). As I'm reading the =
spec,
> I do not see why the Admin queue should be treated differently wrt.
> doorbell buffer configuration. Could this be a left-over from the
> behavior in the original Google extension (prior to going into NVMe)?

Yes, this is =E2=80=9Cinherited=E2=80=9D from the Google extension code. =
I also checked 1.3d of the spec and even found in Table 64 the addresses =
for admin queue=E2=80=99s shadow doorbell buffer and eventidx buffer.
Seems we need to take admin queue into account.

>=20
> I peeked in to the kernel and it looks like it doesnt enable doorbell
> buffers for admin queue, only for subsequently created I/O queues.
>=20
> Keith, is this a bug in the kernel? If the code here would expect the
> doorbell buffer to be updated for the admin queue as well, would we
> break?
>=20
>> +
>> +    return NVME_SUCCESS;
>> +}
>> +
>> static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
>> {
>>     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), =
req->cmd.opcode,
>> @@ -5809,6 +5868,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, =
NvmeRequest *req)
>>         return nvme_aer(n, req);
>>     case NVME_ADM_CMD_NS_ATTACHMENT:
>>         return nvme_ns_attachment(n, req);
>> +    case NVME_ADM_CMD_DBBUF_CONFIG:
>> +        return nvme_dbbuf_config(n, req);
>>     case NVME_ADM_CMD_FORMAT_NVM:
>>         return nvme_format(n, req);
>>     default:
>> @@ -5818,6 +5879,18 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, =
NvmeRequest *req)
>>     return NVME_INVALID_OPCODE | NVME_DNR;
>> }
>>=20
>> +static void nvme_update_sq_eventidx(const NvmeSQueue *sq)
>> +{
>> +    pci_dma_write(&sq->ctrl->parent_obj, sq->ei_addr, &sq->tail,
>> +                  sizeof(sq->tail));
>> +}
>> +
>> +static void nvme_update_sq_tail(NvmeSQueue *sq)
>> +{
>> +    pci_dma_read(&sq->ctrl->parent_obj, sq->db_addr, &sq->tail,
>> +                 sizeof(sq->tail));
>> +}
>> +
>> static void nvme_process_sq(void *opaque)
>> {
>>     NvmeSQueue *sq =3D opaque;
>> @@ -5829,6 +5902,10 @@ static void nvme_process_sq(void *opaque)
>>     NvmeCmd cmd;
>>     NvmeRequest *req;
>>=20
>> +    if (sq->sqid && n->dbbuf_enabled) {
>> +        nvme_update_sq_tail(sq);
>> +    }
>> +
>>     while (!(nvme_sq_empty(sq) || QTAILQ_EMPTY(&sq->req_list))) {
>>         addr =3D sq->dma_addr + sq->head * n->sqe_size;
>>         if (nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd))) {
>> @@ -5852,6 +5929,11 @@ static void nvme_process_sq(void *opaque)
>>             req->status =3D status;
>>             nvme_enqueue_req_completion(cq, req);
>>         }
>> +
>> +        if (sq->sqid && n->dbbuf_enabled) {
>> +            nvme_update_sq_eventidx(sq);
>> +            nvme_update_sq_tail(sq);
>> +        }
>>     }
>> }
>>=20
>> @@ -5889,6 +5971,9 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
>>     n->aer_queued =3D 0;
>>     n->outstanding_aers =3D 0;
>>     n->qs_created =3D false;
>> +    n->dbbuf_dbs =3D 0;
>> +    n->dbbuf_eis =3D 0;
>> +    n->dbbuf_enabled =3D false;
>> }
>>=20
>> static void nvme_ctrl_shutdown(NvmeCtrl *n)
>> @@ -6397,7 +6482,9 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr =
addr, int val)
>>         trace_pci_nvme_mmio_doorbell_cq(cq->cqid, new_head);
>>=20
>>         start_sqs =3D nvme_cq_full(cq) ? 1 : 0;
>> -        cq->head =3D new_head;
>> +        if (!cq->cqid || !n->dbbuf_enabled) {
>> +            cq->head =3D new_head;
>> +        }
>>         if (start_sqs) {
>>             NvmeSQueue *sq;
>>             QTAILQ_FOREACH(sq, &cq->sq_list, entry) {
>> @@ -6454,7 +6541,9 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr =
addr, int val)
>>=20
>>         trace_pci_nvme_mmio_doorbell_sq(sq->sqid, new_tail);
>>=20
>> -        sq->tail =3D new_tail;
>> +        if (!sq->sqid || !n->dbbuf_enabled) {
>> +            sq->tail =3D new_tail;
>> +        }
>>         timer_mod(sq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + =
500);
>>     }
>> }
>> @@ -6733,7 +6822,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, =
PCIDevice *pci_dev)
>>=20
>>     id->mdts =3D n->params.mdts;
>>     id->ver =3D cpu_to_le32(NVME_SPEC_VER);
>> -    id->oacs =3D cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT);
>> +    id->oacs =3D cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT | =
NVME_OACS_DBBUF);
>>     id->cntrltype =3D 0x1;
>>=20
>>     /*
>> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>> index 6773819325..4452e4b1bf 100644
>> --- a/hw/nvme/nvme.h
>> +++ b/hw/nvme/nvme.h
>> @@ -334,6 +334,7 @@ static inline const char =
*nvme_adm_opc_str(uint8_t opc)
>>     case NVME_ADM_CMD_GET_FEATURES:     return =
"NVME_ADM_CMD_GET_FEATURES";
>>     case NVME_ADM_CMD_ASYNC_EV_REQ:     return =
"NVME_ADM_CMD_ASYNC_EV_REQ";
>>     case NVME_ADM_CMD_NS_ATTACHMENT:    return =
"NVME_ADM_CMD_NS_ATTACHMENT";
>> +    case NVME_ADM_CMD_DBBUF_CONFIG:     return =
"NVME_ADM_CMD_DBBUF_CONFIG";
>>     case NVME_ADM_CMD_FORMAT_NVM:       return =
"NVME_ADM_CMD_FORMAT_NVM";
>>     default:                            return =
"NVME_ADM_CMD_UNKNOWN";
>>     }
>> @@ -365,6 +366,8 @@ typedef struct NvmeSQueue {
>>     uint32_t    tail;
>>     uint32_t    size;
>>     uint64_t    dma_addr;
>> +    uint64_t    db_addr;
>> +    uint64_t    ei_addr;
>>     QEMUTimer   *timer;
>>     NvmeRequest *io_req;
>>     QTAILQ_HEAD(, NvmeRequest) req_list;
>> @@ -382,6 +385,8 @@ typedef struct NvmeCQueue {
>>     uint32_t    vector;
>>     uint32_t    size;
>>     uint64_t    dma_addr;
>> +    uint64_t    db_addr;
>> +    uint64_t    ei_addr;
>>     QEMUTimer   *timer;
>>     QTAILQ_HEAD(, NvmeSQueue) sq_list;
>>     QTAILQ_HEAD(, NvmeRequest) req_list;
>> @@ -432,6 +437,9 @@ typedef struct NvmeCtrl {
>>     uint64_t    starttime_ms;
>>     uint16_t    temperature;
>>     uint8_t     smart_critical_warning;
>> +    uint64_t    dbbuf_dbs;
>> +    uint64_t    dbbuf_eis;
>> +    bool        dbbuf_enabled;
>>=20
>>     struct {
>>         MemoryRegion mem;
>> diff --git a/include/block/nvme.h b/include/block/nvme.h
>> index 3737351cc8..5b522d7b0e 100644
>> --- a/include/block/nvme.h
>> +++ b/include/block/nvme.h
>> @@ -595,6 +595,7 @@ enum NvmeAdminCommands {
>>     NVME_ADM_CMD_ACTIVATE_FW    =3D 0x10,
>>     NVME_ADM_CMD_DOWNLOAD_FW    =3D 0x11,
>>     NVME_ADM_CMD_NS_ATTACHMENT  =3D 0x15,
>> +    NVME_ADM_CMD_DBBUF_CONFIG   =3D 0x7c,
>>     NVME_ADM_CMD_FORMAT_NVM     =3D 0x80,
>>     NVME_ADM_CMD_SECURITY_SEND  =3D 0x81,
>>     NVME_ADM_CMD_SECURITY_RECV  =3D 0x82,
>> @@ -1134,6 +1135,7 @@ enum NvmeIdCtrlOacs {
>>     NVME_OACS_FORMAT    =3D 1 << 1,
>>     NVME_OACS_FW        =3D 1 << 2,
>>     NVME_OACS_NS_MGMT   =3D 1 << 3,
>> +    NVME_OACS_DBBUF     =3D 1 << 8,
>> };
>>=20
>> enum NvmeIdCtrlOncs {
>> --=20
>> 2.25.1
>>=20
>=20
> --=20
> One of us - No more doubt, silence or taboo about mental illness.


--Apple-Mail=_D66AB6BD-2442-4443-8437-FCF74AEBDD71
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jun 9, 2022, at 4:55 AM, Klaus Jensen &lt;<a =
href=3D"mailto:its@irrelevant.dk" class=3D"">its@irrelevant.dk</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On Jun &nbsp;8 09:36, Jinhao Fan wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D"">Implement Doorbel Buffer Config command (Section 5.7 in NVMe =
Spec 1.3)<br class=3D"">and Shadow Doorbel buffer &amp; EventIdx buffer =
handling logic (Section 7.13<br class=3D"">in NVMe Spec 1.3). For queues =
created before the Doorbell Buffer Config<br class=3D"">command, the =
nvme_dbbuf_config function tries to associate each existing<br =
class=3D"">SQ and CQ with its Shadow Doorbel buffer and EventIdx buffer =
address.<br class=3D"">Queues created after the Doorbell Buffer Config =
command will have the<br class=3D"">doorbell buffers associated with =
them when they are initialized.<br class=3D""><br class=3D"">In =
nvme_process_sq and nvme_post_cqe, proactively check for Shadow<br =
class=3D"">Doorbell buffer changes instead of wait for doorbell register =
changes.<br class=3D"">This reduces the number of MMIOs.<br class=3D""><br=
 class=3D"">Signed-off-by: Jinhao Fan &lt;<a =
href=3D"mailto:fanjinhao21s@ict.ac.cn" =
class=3D"">fanjinhao21s@ict.ac.cn</a>&gt;<br class=3D"">---<br =
class=3D"">hw/nvme/ctrl.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 95 =
++++++++++++++++++++++++++++++++++++++++++--<br class=3D"">hw/nvme/nvme.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;8 ++++<br =
class=3D"">include/block/nvme.h | &nbsp;2 +<br class=3D"">3 files =
changed, 102 insertions(+), 3 deletions(-)<br class=3D""><br =
class=3D"">diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c<br =
class=3D"">index 03760ddeae..d3f6c432df 100644<br class=3D"">--- =
a/hw/nvme/ctrl.c<br class=3D"">+++ b/hw/nvme/ctrl.c<br class=3D"">@@ =
-223,6 +223,7 @@ static const uint32_t nvme_cse_acs[256] =3D {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;[NVME_ADM_CMD_GET_FEATURES] =
&nbsp;&nbsp;&nbsp;&nbsp;=3D NVME_CMD_EFF_CSUPP,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;[NVME_ADM_CMD_ASYNC_EV_REQ] =
&nbsp;&nbsp;&nbsp;&nbsp;=3D NVME_CMD_EFF_CSUPP,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;[NVME_ADM_CMD_NS_ATTACHMENT] =
&nbsp;&nbsp;&nbsp;=3D NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;[NVME_ADM_CMD_DBBUF_CONFIG] =
&nbsp;&nbsp;&nbsp;&nbsp;=3D NVME_CMD_EFF_CSUPP,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;[NVME_ADM_CMD_FORMAT_NVM] =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D NVME_CMD_EFF_CSUPP | =
NVME_CMD_EFF_LBCC,<br class=3D"">};<br class=3D""><br class=3D"">@@ =
-1304,6 +1305,12 @@ static inline void nvme_blk_write(BlockBackend *blk, =
int64_t offset,<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">}<br=
 class=3D""><br class=3D"">+static void nvme_update_cq_head(NvmeCQueue =
*cq)<br class=3D"">+{<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;pci_dma_read(&amp;cq-&gt;ctrl-&gt;parent_obj, =
cq-&gt;db_addr, &amp;cq-&gt;head,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sizeof(c=
q-&gt;head));<br class=3D"">+}<br class=3D"">+<br class=3D"">static void =
nvme_post_cqes(void *opaque)<br class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;NvmeCQueue *cq =3D opaque;<br =
class=3D"">@@ -1316,6 +1323,10 @@ static void nvme_post_cqes(void =
*opaque)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NvmeSQueue =
*sq;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hwaddr =
addr;<br class=3D""><br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (cq-&gt;cqid &amp;&amp; =
n-&gt;dbbuf_enabled) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nvme_upd=
ate_cq_head(cq);<br class=3D""></blockquote><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Shouldn't we update the cq head eventidx here (prior to =
reading the</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">doorbell =
buffer)? Like we do for the sq tail?</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>I=E2=80=99m not sure whether updating cq head =
eventidx is necessary. My understanding is that the purpose of updating =
eventidx is for the guest to notify the host about cq head or sq tail =
changes with MMIO. For sq tail this is necessary because other than =
MMIO, there is no way to trigger the host to check for sq tail updates =
(shadow doorbell here). For cq head this is different. The host will =
read cq head shadow doorbell every time it wants to post a cqe. =
Therefore, letting the guest notify the host on cq head changes seems =
unnecessary.&nbsp;</div><div><br class=3D""></div><div>Please correct me =
if I miss some point.</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">+<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(nvme_cq_full(cq)) {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;break;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">@@ -4237,6 +4248,7 @@ static uint16_t nvme_del_sq(NvmeCtrl =
*n, NvmeRequest *req)<br class=3D"">static void nvme_init_sq(NvmeSQueue =
*sq, NvmeCtrl *n, uint64_t dma_addr,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;uint16_t sqid, uint16_t cqid, uint16_t size)<br =
class=3D"">{<br class=3D"">+ &nbsp;&nbsp;&nbsp;uint32_t stride =3D 4 =
&lt;&lt; NVME_CAP_DSTRD(n-&gt;bar.cap);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;int i;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;NvmeCQueue *cq;<br class=3D""><br =
class=3D"">@@ -4256,6 +4268,11 @@ static void nvme_init_sq(NvmeSQueue =
*sq, NvmeCtrl *n, uint64_t dma_addr,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;sq-&gt;timer =3D =
timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, sq);<br class=3D""><br =
class=3D"">+ &nbsp;&nbsp;&nbsp;if (sqid &amp;&amp; n-&gt;dbbuf_dbs =
&amp;&amp; n-&gt;dbbuf_eis) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sq-&gt;db_addr =3D =
n-&gt;dbbuf_dbs + 2 * sqid * stride;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sq-&gt;ei_addr =3D =
n-&gt;dbbuf_eis + 2 * sqid * stride;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;}<br class=3D"">+<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;assert(n-&gt;cq[cqid]);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;cq =3D n-&gt;cq[cqid];<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;QTAILQ_INSERT_TAIL(&amp;(cq-&gt;sq_list=
), sq, entry);<br class=3D"">@@ -4599,6 +4616,7 @@ static void =
nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;uint16_t cqid, uint16_t vector, uint16_t size,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;uint16_t irq_enabled)<br class=3D"">{<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;uint32_t stride =3D 4 &lt;&lt; =
NVME_CAP_DSTRD(n-&gt;bar.cap);<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;int =
ret;<br class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;if =
(msix_enabled(&amp;n-&gt;parent_obj)) {<br class=3D"">@@ -4615,6 =
+4633,10 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, =
uint64_t dma_addr,<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;cq-&gt;head =3D =
cq-&gt;tail =3D 0;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;QTAILQ_INIT(&amp;cq-&gt;req_list);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;QTAILQ_INIT(&amp;cq-&gt;sq_list);<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;if (cqid &amp;&amp; n-&gt;dbbuf_dbs =
&amp;&amp; n-&gt;dbbuf_eis) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cq-&gt;db_addr =3D =
n-&gt;dbbuf_dbs + (2 * cqid + 1) * stride;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cq-&gt;ei_addr =3D =
n-&gt;dbbuf_eis + (2 * cqid + 1) * stride;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;}<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;n-&gt;cq[cqid] =
=3D cq;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;cq-&gt;timer =3D =
timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);<br class=3D"">}<br =
class=3D"">@@ -5767,6 +5789,43 @@ out:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;return status;<br class=3D"">}<br =
class=3D""><br class=3D"">+static uint16_t nvme_dbbuf_config(NvmeCtrl =
*n, const NvmeRequest *req)<br class=3D"">+{<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;uint32_t stride =3D 4 &lt;&lt; =
NVME_CAP_DSTRD(n-&gt;bar.cap);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;uint64_t dbs_addr =3D =
le64_to_cpu(req-&gt;cmd.dptr.prp1);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;uint64_t eis_addr =3D =
le64_to_cpu(req-&gt;cmd.dptr.prp2);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;int i;<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;/* Address should be page aligned */<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;if (dbs_addr &amp; (n-&gt;page_size - 1) || eis_addr =
&amp; (n-&gt;page_size - 1)) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return NVME_INVALID_FIELD | =
NVME_DNR;<br class=3D"">+ &nbsp;&nbsp;&nbsp;}<br class=3D"">+<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;/* Save shadow buffer base addr for use =
during queue creation */<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;n-&gt;dbbuf_dbs =3D dbs_addr;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;n-&gt;dbbuf_eis =3D eis_addr;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;n-&gt;dbbuf_enabled =3D true;<br class=3D"">+<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;for (i =3D 1; i &lt; =
n-&gt;params.max_ioqpairs + 1; i++) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NvmeSQueue *sq =3D =
n-&gt;sq[i];<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NvmeCQueue *cq =3D =
n-&gt;cq[i];<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (sq) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* =
Submission queue tail pointer location, 2 * QID * stride */<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sq-&gt;d=
b_addr =3D dbs_addr + 2 * i * stride;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sq-&gt;e=
i_addr =3D eis_addr + 2 * i * stride;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">+<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (cq) {<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* =
Completion queue head pointer location, (2 * QID + 1) * stride */<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cq-&gt;d=
b_addr =3D dbs_addr + (2 * i + 1) * stride;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cq-&gt;e=
i_addr =3D eis_addr + (2 * i + 1) * stride;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;}<br class=3D""></blockquote><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Why no love for the admin queue? :)</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">You are special-casing the admin =
queue below in process_sq() and</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">process_db(), as well as above in post_cqes(). As I'm reading =
the spec,</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">I do not see =
why the Admin queue should be treated differently wrt.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">doorbell buffer configuration. =
Could this be a left-over from the</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">behavior in the original Google extension (prior to going =
into NVMe)?</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br class=3D""></div>Yes, this =
is =E2=80=9Cinherited=E2=80=9D from the Google extension code. I also =
checked 1.3d of the spec and even found in Table 64 the addresses for =
admin queue=E2=80=99s shadow doorbell buffer and eventidx =
buffer.</div><div>Seems we need to take admin queue into =
account.</div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">I peeked in to the kernel and it looks like it doesnt enable =
doorbell</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">buffers for =
admin queue, only for subsequently created I/O queues.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Keith, is this a bug in the =
kernel? If the code here would expect the</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">doorbell buffer to be updated for the admin queue as well, =
would we</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">break?</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;return NVME_SUCCESS;<br class=3D"">+}<br class=3D"">+<br=
 class=3D"">static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest =
*req)<br class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;trace_pci_nvme_admin_cmd(nvme_cid(req),=
 nvme_sqid(req), req-&gt;cmd.opcode,<br class=3D"">@@ -5809,6 +5868,8 @@ =
static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
nvme_aer(n, req);<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;case =
NVME_ADM_CMD_NS_ATTACHMENT:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
nvme_ns_attachment(n, req);<br class=3D"">+ &nbsp;&nbsp;&nbsp;case =
NVME_ADM_CMD_DBBUF_CONFIG:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return nvme_dbbuf_config(n, =
req);<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;case =
NVME_ADM_CMD_FORMAT_NVM:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
nvme_format(n, req);<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;default:<br =
class=3D"">@@ -5818,6 +5879,18 @@ static uint16_t =
nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;return NVME_INVALID_OPCODE | =
NVME_DNR;<br class=3D"">}<br class=3D""><br class=3D"">+static void =
nvme_update_sq_eventidx(const NvmeSQueue *sq)<br class=3D"">+{<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;pci_dma_write(&amp;sq-&gt;ctrl-&gt;parent_obj, =
sq-&gt;ei_addr, &amp;sq-&gt;tail,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;sizeof(sq-&gt;tail));<br class=3D"">+}<br =
class=3D"">+<br class=3D"">+static void nvme_update_sq_tail(NvmeSQueue =
*sq)<br class=3D"">+{<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;pci_dma_read(&amp;sq-&gt;ctrl-&gt;parent_obj, =
sq-&gt;db_addr, &amp;sq-&gt;tail,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;sizeof(sq-&gt;tail));<br class=3D"">+}<br =
class=3D"">+<br class=3D"">static void nvme_process_sq(void *opaque)<br =
class=3D"">{<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;NvmeSQueue *sq =3D =
opaque;<br class=3D"">@@ -5829,6 +5902,10 @@ static void =
nvme_process_sq(void *opaque)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;NvmeCmd cmd;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;NvmeRequest *req;<br class=3D""><br =
class=3D"">+ &nbsp;&nbsp;&nbsp;if (sq-&gt;sqid &amp;&amp; =
n-&gt;dbbuf_enabled) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nvme_update_sq_tail(sq);<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;}<br class=3D"">+<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;while (!(nvme_sq_empty(sq) || =
QTAILQ_EMPTY(&amp;sq-&gt;req_list))) {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;addr =3D =
sq-&gt;dma_addr + sq-&gt;head * n-&gt;sqe_size;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(nvme_addr_read(n, addr, (void *)&amp;cmd, sizeof(cmd))) {<br =
class=3D"">@@ -5852,6 +5929,11 @@ static void nvme_process_sq(void =
*opaque)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;req-&gt;status =3D status;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;nvme_enqueue_req_completion(cq, req);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (sq-&gt;sqid &amp;&amp; =
n-&gt;dbbuf_enabled) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nvme_upd=
ate_sq_eventidx(sq);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nvme_upd=
ate_sq_tail(sq);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">}<br class=3D""><br =
class=3D"">@@ -5889,6 +5971,9 @@ static void nvme_ctrl_reset(NvmeCtrl =
*n)<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;n-&gt;aer_queued =3D 0;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;n-&gt;outstanding_aers =3D 0;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;n-&gt;qs_created =3D false;<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;n-&gt;dbbuf_dbs =3D 0;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;n-&gt;dbbuf_eis =3D 0;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;n-&gt;dbbuf_enabled =3D false;<br class=3D"">}<br =
class=3D""><br class=3D"">static void nvme_ctrl_shutdown(NvmeCtrl *n)<br =
class=3D"">@@ -6397,7 +6482,9 @@ static void nvme_process_db(NvmeCtrl =
*n, hwaddr addr, int val)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;trace_pci_nvme_=
mmio_doorbell_cq(cq-&gt;cqid, new_head);<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;start_sqs =3D =
nvme_cq_full(cq) ? 1 : 0;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cq-&gt;head =3D new_head;<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!cq-&gt;cqid =
|| !n-&gt;dbbuf_enabled) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cq-&gt;h=
ead =3D new_head;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(start_sqs) {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;NvmeSQueue *sq;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;QTAILQ_FOREACH(sq, &amp;cq-&gt;sq_list, entry) {<br class=3D"">@@=
 -6454,7 +6541,9 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr =
addr, int val)<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;trace_pci_nvme_=
mmio_doorbell_sq(sq-&gt;sqid, new_tail);<br class=3D""><br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sq-&gt;tail =3D new_tail;<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!sq-&gt;sqid =
|| !n-&gt;dbbuf_enabled) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sq-&gt;t=
ail =3D new_tail;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;timer_mod(sq-&g=
t;timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">}<br class=3D"">@@ =
-6733,7 +6822,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice =
*pci_dev)<br class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;id-&gt;mdts=
 =3D n-&gt;params.mdts;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;id-&gt;ver =
=3D cpu_to_le32(NVME_SPEC_VER);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;id-&gt;oacs =3D cpu_to_le16(NVME_OACS_NS_MGMT | =
NVME_OACS_FORMAT);<br class=3D"">+ &nbsp;&nbsp;&nbsp;id-&gt;oacs =3D =
cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT | NVME_OACS_DBBUF);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;id-&gt;cntrltype =3D 0x1;<br =
class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;/*<br class=3D"">diff =
--git a/hw/nvme/nvme.h b/hw/nvme/nvme.h<br class=3D"">index =
6773819325..4452e4b1bf 100644<br class=3D"">--- a/hw/nvme/nvme.h<br =
class=3D"">+++ b/hw/nvme/nvme.h<br class=3D"">@@ -334,6 +334,7 @@ static =
inline const char *nvme_adm_opc_str(uint8_t opc)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;case NVME_ADM_CMD_GET_FEATURES: =
&nbsp;&nbsp;&nbsp;&nbsp;return "NVME_ADM_CMD_GET_FEATURES";<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;case NVME_ADM_CMD_ASYNC_EV_REQ: =
&nbsp;&nbsp;&nbsp;&nbsp;return "NVME_ADM_CMD_ASYNC_EV_REQ";<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;case NVME_ADM_CMD_NS_ATTACHMENT: =
&nbsp;&nbsp;&nbsp;return "NVME_ADM_CMD_NS_ATTACHMENT";<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;case NVME_ADM_CMD_DBBUF_CONFIG: =
&nbsp;&nbsp;&nbsp;&nbsp;return "NVME_ADM_CMD_DBBUF_CONFIG";<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;case NVME_ADM_CMD_FORMAT_NVM: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return "NVME_ADM_CMD_FORMAT_NVM";<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;default: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;return "NVME_ADM_CMD_UNKNOWN";<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">@@ -365,6 +366,8 @@ =
typedef struct NvmeSQueue {<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;uint32_t=
 &nbsp;&nbsp;&nbsp;tail;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;uint32_t =
&nbsp;&nbsp;&nbsp;size;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;uint64_t =
&nbsp;&nbsp;&nbsp;dma_addr;<br class=3D"">+ &nbsp;&nbsp;&nbsp;uint64_t =
&nbsp;&nbsp;&nbsp;db_addr;<br class=3D"">+ &nbsp;&nbsp;&nbsp;uint64_t =
&nbsp;&nbsp;&nbsp;ei_addr;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;QEMUTimer=
 &nbsp;&nbsp;*timer;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;NvmeRequest =
*io_req;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;QTAILQ_HEAD(, =
NvmeRequest) req_list;<br class=3D"">@@ -382,6 +385,8 @@ typedef struct =
NvmeCQueue {<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;uint32_t =
&nbsp;&nbsp;&nbsp;vector;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;uint32_t =
&nbsp;&nbsp;&nbsp;size;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;uint64_t =
&nbsp;&nbsp;&nbsp;dma_addr;<br class=3D"">+ &nbsp;&nbsp;&nbsp;uint64_t =
&nbsp;&nbsp;&nbsp;db_addr;<br class=3D"">+ &nbsp;&nbsp;&nbsp;uint64_t =
&nbsp;&nbsp;&nbsp;ei_addr;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;QEMUTimer=
 &nbsp;&nbsp;*timer;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;QTAILQ_HEAD(, =
NvmeSQueue) sq_list;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;QTAILQ_HEAD(, =
NvmeRequest) req_list;<br class=3D"">@@ -432,6 +437,9 @@ typedef struct =
NvmeCtrl {<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;uint64_t =
&nbsp;&nbsp;&nbsp;starttime_ms;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;uint16_t =
&nbsp;&nbsp;&nbsp;temperature;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;uint8_t =
&nbsp;&nbsp;&nbsp;&nbsp;smart_critical_warning;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;uint64_t &nbsp;&nbsp;&nbsp;dbbuf_dbs;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;uint64_t &nbsp;&nbsp;&nbsp;dbbuf_eis;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;bool =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dbbuf_enabled;<br class=3D""><br=
 class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;struct {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MemoryRegion =
mem;<br class=3D"">diff --git a/include/block/nvme.h =
b/include/block/nvme.h<br class=3D"">index 3737351cc8..5b522d7b0e =
100644<br class=3D"">--- a/include/block/nvme.h<br class=3D"">+++ =
b/include/block/nvme.h<br class=3D"">@@ -595,6 +595,7 @@ enum =
NvmeAdminCommands {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;NVME_ADM_CMD_ACTIVATE_FW =
&nbsp;&nbsp;&nbsp;=3D 0x10,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;NVME_ADM_CMD_DOWNLOAD_FW =
&nbsp;&nbsp;&nbsp;=3D 0x11,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;NVME_ADM_CMD_NS_ATTACHMENT &nbsp;=3D =
0x15,<br class=3D"">+ &nbsp;&nbsp;&nbsp;NVME_ADM_CMD_DBBUF_CONFIG =
&nbsp;&nbsp;=3D 0x7c,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;NVME_ADM_CMD_FORMAT_NVM =
&nbsp;&nbsp;&nbsp;&nbsp;=3D 0x80,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;NVME_ADM_CMD_SECURITY_SEND &nbsp;=3D =
0x81,<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;NVME_ADM_CMD_SECURITY_RECV =
&nbsp;=3D 0x82,<br class=3D"">@@ -1134,6 +1135,7 @@ enum NvmeIdCtrlOacs =
{<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;NVME_OACS_FORMAT =
&nbsp;&nbsp;&nbsp;=3D 1 &lt;&lt; 1,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;NVME_OACS_FW =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D 1 &lt;&lt; 2,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;NVME_OACS_NS_MGMT &nbsp;&nbsp;=3D 1 =
&lt;&lt; 3,<br class=3D"">+ &nbsp;&nbsp;&nbsp;NVME_OACS_DBBUF =
&nbsp;&nbsp;&nbsp;&nbsp;=3D 1 &lt;&lt; 8,<br class=3D"">};<br =
class=3D""><br class=3D"">enum NvmeIdCtrlOncs {<br class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">2.25.1<br =
class=3D""><br class=3D""></blockquote><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">--<span class=3D"Apple-converted-space">&nbsp;</span></span><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">One of us - No more doubt, =
silence or taboo about mental =
illness.</span></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_D66AB6BD-2442-4443-8437-FCF74AEBDD71--


