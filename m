Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F2D15A4F7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 10:37:10 +0100 (CET)
Received: from localhost ([::1]:34380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1oSD-0007jN-2K
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 04:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48465)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1j1oQX-0005q7-69
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 04:35:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1j1oQV-0007E8-7M
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 04:35:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21018
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1j1oQV-0007DA-3Y
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 04:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581500122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L4b79Q3J0Mm2hMQrTE+V/Pxue1SbvL2f7WwjU6BQtnA=;
 b=iivlhoJhBnoGz4FA1ApDuPOsGB0sgUaq+SF5vc3HQEZ9RNcFoLnY2of/XXMqm/722YUtJn
 ExccmMcA0L/FuH+NDuWyLGykgfqzcgtmev/YtfSCvKfvMX4L95KrwJyzGO151ItZPUlje8
 xIGM0x9u7lx3Wo9130qy6MwLXYI/X0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-eI0d1eo9MGaVbK6jQKZehQ-1; Wed, 12 Feb 2020 04:35:19 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A617190B2A0;
 Wed, 12 Feb 2020 09:35:17 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6572C10001AE;
 Wed, 12 Feb 2020 09:35:15 +0000 (UTC)
Message-ID: <58d27132d98667f1e177505c3f87795c953051a7.camel@redhat.com>
Subject: Re: [PATCH v5 10/26] nvme: add support for the get log page command
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Klaus Jensen <k.jensen@samsung.com>, qemu-block@nongnu.org
Date: Wed, 12 Feb 2020 11:35:04 +0200
In-Reply-To: <20200204095208.269131-11-k.jensen@samsung.com>
References: <20200204095208.269131-1-k.jensen@samsung.com>
 <CGME20200204095221eucas1p216ca2452c4184eb06bff85cff3c6a82b@eucas1p2.samsung.com>
 <20200204095208.269131-11-k.jensen@samsung.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: eI0d1eo9MGaVbK6jQKZehQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-02-04 at 10:51 +0100, Klaus Jensen wrote:
> Add support for the Get Log Page command and basic implementations of
> the mandatory Error Information, SMART / Health Information and Firmware
> Slot Information log pages.
> 
> In violation of the specification, the SMART / Health Information log
> page does not persist information over the lifetime of the controller
> because the device has no place to store such persistent state.
Yea, not the end of the world.
> 
> Note that the LPA field in the Identify Controller data structure
> intentionally has bit 0 cleared because there is no namespace specific
> information in the SMART / Health information log page.
Makes sense.
> 
> Required for compliance with NVMe revision 1.2.1. See NVM Express 1.2.1,
> Section 5.10 ("Get Log Page command").
> 
> Signed-off-by: Klaus Jensen <klaus.jensen@cnexlabs.com>
> ---
>  hw/block/nvme.c       | 122 +++++++++++++++++++++++++++++++++++++++++-
>  hw/block/nvme.h       |  10 ++++
>  hw/block/trace-events |   2 +
>  include/block/nvme.h  |   2 +-
>  4 files changed, 134 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index f72348344832..468c36918042 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -569,6 +569,123 @@ static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeCmd *cmd)
>      return NVME_SUCCESS;
>  }
>  
> +static uint16_t nvme_smart_info(NvmeCtrl *n, NvmeCmd *cmd, uint32_t buf_len,
> +    uint64_t off, NvmeRequest *req)
> +{
> +    uint64_t prp1 = le64_to_cpu(cmd->prp1);
> +    uint64_t prp2 = le64_to_cpu(cmd->prp2);
> +    uint32_t nsid = le32_to_cpu(cmd->nsid);
> +
> +    uint32_t trans_len;
> +    time_t current_ms;
> +    uint64_t units_read = 0, units_written = 0, read_commands = 0,
> +        write_commands = 0;
> +    NvmeSmartLog smart;
> +    BlockAcctStats *s;
> +
> +    if (nsid && nsid != 0xffffffff) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    s = blk_get_stats(n->conf.blk);
> +
> +    units_read = s->nr_bytes[BLOCK_ACCT_READ] >> BDRV_SECTOR_BITS;
> +    units_written = s->nr_bytes[BLOCK_ACCT_WRITE] >> BDRV_SECTOR_BITS;
> +    read_commands = s->nr_ops[BLOCK_ACCT_READ];
> +    write_commands = s->nr_ops[BLOCK_ACCT_WRITE];
> +
> +    if (off > sizeof(smart)) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    trans_len = MIN(sizeof(smart) - off, buf_len);
> +
> +    memset(&smart, 0x0, sizeof(smart));
> +
> +    smart.data_units_read[0] = cpu_to_le64(units_read / 1000);
> +    smart.data_units_written[0] = cpu_to_le64(units_written / 1000);
> +    smart.host_read_commands[0] = cpu_to_le64(read_commands);
> +    smart.host_write_commands[0] = cpu_to_le64(write_commands);
> +
> +    smart.temperature[0] = n->temperature & 0xff;
> +    smart.temperature[1] = (n->temperature >> 8) & 0xff;
> +
> +    if ((n->temperature > n->features.temp_thresh_hi) ||
> +        (n->temperature < n->features.temp_thresh_low)) {
> +        smart.critical_warning |= NVME_SMART_TEMPERATURE;
> +    }
> +
> +    current_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
> +    smart.power_on_hours[0] = cpu_to_le64(
> +        (((current_ms - n->starttime_ms) / 1000) / 60) / 60);
> +
> +    return nvme_dma_read_prp(n, (uint8_t *) &smart + off, trans_len, prp1,
> +        prp2);
> +}
Looks OK.
> +
> +static uint16_t nvme_fw_log_info(NvmeCtrl *n, NvmeCmd *cmd, uint32_t buf_len,
> +    uint64_t off, NvmeRequest *req)
> +{
> +    uint32_t trans_len;
> +    uint64_t prp1 = le64_to_cpu(cmd->prp1);
> +    uint64_t prp2 = le64_to_cpu(cmd->prp2);
> +    NvmeFwSlotInfoLog fw_log;
> +
> +    if (off > sizeof(fw_log)) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    memset(&fw_log, 0, sizeof(NvmeFwSlotInfoLog));
> +
> +    trans_len = MIN(sizeof(fw_log) - off, buf_len);
> +
> +    return nvme_dma_read_prp(n, (uint8_t *) &fw_log + off, trans_len, prp1,
> +        prp2);
> +}
Looks OK
> +
> +static uint16_t nvme_get_log(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
> +{
> +    uint32_t dw10 = le32_to_cpu(cmd->cdw10);
> +    uint32_t dw11 = le32_to_cpu(cmd->cdw11);
> +    uint32_t dw12 = le32_to_cpu(cmd->cdw12);
> +    uint32_t dw13 = le32_to_cpu(cmd->cdw13);
> +    uint8_t  lid = dw10 & 0xff;
> +    uint8_t  rae = (dw10 >> 15) & 0x1;
> +    uint32_t numdl, numdu;
> +    uint64_t off, lpol, lpou;
> +    size_t   len;
> +
> +    numdl = (dw10 >> 16);
> +    numdu = (dw11 & 0xffff);
> +    lpol = dw12;
> +    lpou = dw13;
> +
> +    len = (((numdu << 16) | numdl) + 1) << 2;
> +    off = (lpou << 32ULL) | lpol;
> +
> +    if (off & 0x3) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }

Good. 
Note that there are plenty of other places in the driver that don't honor
such tiny formal bits of the spec, like for instance checking for the reserved
bits in commands.
> +
> +    trace_nvme_dev_get_log(nvme_cid(req), lid, rae, len, off);
> +
> +    switch (lid) {
> +    case NVME_LOG_ERROR_INFO:
> +        if (off) {
> +            return NVME_INVALID_FIELD | NVME_DNR;
> +        }

I think you might want to memset the user given buffer to zero:

"This is a 64-bit incrementing error count, indicating a unique identifier for this error.
The error count starts at 1h, is incremented for each unique error log entry, and is retained across
power off conditions. A value of 0h indicates an invalid entry; this value is used when there are
lost entries or when there are fewer errors than the maximum number of entries the controller
supports."
> +
> +        return NVME_SUCCESS;
> +    case NVME_LOG_SMART_INFO:
> +        return nvme_smart_info(n, cmd, len, off, req);
> +    case NVME_LOG_FW_SLOT_INFO:
> +        return nvme_fw_log_info(n, cmd, len, off, req);
> +    default:
> +        trace_nvme_dev_err_invalid_log_page(nvme_cid(req), lid);
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +}


> +
>  static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
>  {
>      n->cq[cq->cqid] = NULL;
> @@ -914,6 +1031,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
>          return nvme_del_sq(n, cmd);
>      case NVME_ADM_CMD_CREATE_SQ:
>          return nvme_create_sq(n, cmd);
> +    case NVME_ADM_CMD_GET_LOG_PAGE:
> +        return nvme_get_log(n, cmd, req);
>      case NVME_ADM_CMD_DELETE_CQ:
>          return nvme_del_cq(n, cmd);
>      case NVME_ADM_CMD_CREATE_CQ:
> @@ -1411,6 +1530,7 @@ static void nvme_init_state(NvmeCtrl *n)
>  
>      n->temperature = NVME_TEMPERATURE;
>      n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
> +    n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
>  }
>  
>  static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
> @@ -1491,7 +1611,7 @@ static void nvme_init_ctrl(NvmeCtrl *n)
>       */
>      id->acl = 3;
>      id->frmw = 7 << 1;
> -    id->lpa = 1 << 0;
> +    id->lpa = 1 << 2;
>  
>      /* recommended default value (~70 C) */
>      id->wctemp = cpu_to_le16(NVME_TEMPERATURE_WARNING);
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index 1518f32557a3..89b0aafa02a2 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -109,6 +109,7 @@ typedef struct NvmeCtrl {
>      uint64_t    host_timestamp;                 /* Timestamp sent by the host */
>      uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
>      uint16_t    temperature;
> +    uint64_t    starttime_ms;
>  
>      NvmeNamespace   *namespaces;
>      NvmeSQueue      **sq;
> @@ -124,4 +125,13 @@ static inline uint64_t nvme_ns_nlbas(NvmeCtrl *n, NvmeNamespace *ns)
>      return n->ns_size >> nvme_ns_lbads(ns);
>  }
>  
> +static inline uint16_t nvme_cid(NvmeRequest *req)
> +{
> +    if (req) {
> +        return le16_to_cpu(req->cqe.cid);
> +    }
> +
> +    return 0xffff;
> +}

I see that you added command ID reporting to trace events you added,
which makes sense.
I think it would be nice later to add it to existing trace events where it makes sense.


> +
>  #endif /* HW_NVME_H */
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index ade506ea2bb2..7da088479f39 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -46,6 +46,7 @@ nvme_dev_getfeat_numq(int result) "get feature number of queues, result=%d"
>  nvme_dev_setfeat_numq(int reqcq, int reqsq, int gotcq, int gotsq) "requested cq_count=%d sq_count=%d, responding with cq_count=%d sq_count=%d"
>  nvme_dev_setfeat_timestamp(uint64_t ts) "set feature timestamp = 0x%"PRIx64""
>  nvme_dev_getfeat_timestamp(uint64_t ts) "get feature timestamp = 0x%"PRIx64""
> +nvme_dev_get_log(uint16_t cid, uint8_t lid, uint8_t rae, uint32_t len, uint64_t off) "cid %"PRIu16" lid 0x%"PRIx8" rae 0x%"PRIx8" len %"PRIu32" off %"PRIu64""
>  nvme_dev_mmio_intm_set(uint64_t data, uint64_t new_mask) "wrote MMIO, interrupt mask set, data=0x%"PRIx64", new_mask=0x%"PRIx64""
>  nvme_dev_mmio_intm_clr(uint64_t data, uint64_t new_mask) "wrote MMIO, interrupt mask clr, data=0x%"PRIx64", new_mask=0x%"PRIx64""
>  nvme_dev_mmio_cfg(uint64_t data) "wrote MMIO, config controller config=0x%"PRIx64""
> @@ -85,6 +86,7 @@ nvme_dev_err_invalid_create_cq_qflags(uint16_t qflags) "failed creating completi
>  nvme_dev_err_invalid_identify_cns(uint16_t cns) "identify, invalid cns=0x%"PRIx16""
>  nvme_dev_err_invalid_getfeat(int dw10) "invalid get features, dw10=0x%"PRIx32""
>  nvme_dev_err_invalid_setfeat(uint32_t dw10) "invalid set features, dw10=0x%"PRIx32""
> +nvme_dev_err_invalid_log_page(uint16_t cid, uint16_t lid) "cid %"PRIu16" lid 0x%"PRIx16""
>  nvme_dev_err_startfail_cq(void) "nvme_start_ctrl failed because there are non-admin completion queues"
>  nvme_dev_err_startfail_sq(void) "nvme_start_ctrl failed because there are non-admin submission queues"
>  nvme_dev_err_startfail_nbarasq(void) "nvme_start_ctrl failed because the admin submission queue address is null"
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index ff31cb32117c..9a6055adeb61 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -515,7 +515,7 @@ enum NvmeSmartWarn {
>      NVME_SMART_FAILED_VOLATILE_MEDIA  = 1 << 4,
>  };
>  
> -enum LogIdentifier {
> +enum NvmeLogIdentifier {
>      NVME_LOG_ERROR_INFO     = 0x01,
>      NVME_LOG_SMART_INFO     = 0x02,
>      NVME_LOG_FW_SLOT_INFO   = 0x03,

Best regards,
	Maxim Levitsky


