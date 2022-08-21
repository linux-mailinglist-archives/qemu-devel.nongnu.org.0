Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D5759B32E
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Aug 2022 12:55:10 +0200 (CEST)
Received: from localhost ([::1]:60282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPibk-0002os-B6
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 06:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oPiTz-0000rB-Hi
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 06:47:08 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:40566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oPiTw-0006pF-2j
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 06:47:07 -0400
Received: by mail-pf1-x431.google.com with SMTP id y141so7902530pfb.7
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 03:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=john-millikin.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=d/1kLQUMewSLBJh9H3YYxq6OAKkpC/5bxHqSelUU5Nc=;
 b=jaMvGWFREwDpvZfnvnu0yj+wJBbhUfTFfEem5oWtwUaKM7dCHMSZS3oxi7Hw9d1T9M
 B2JidKNmEYaCVhEqg6UehJOQSk9N1kmCD+bzi01vhX8RdTbQ+3TMxt9cuQvFUBwqGXjU
 16j1J69LFfelvWQ3CK+sJF0GNSHyvC3BRORIOOUVFr5ggRIyt4MfKV+sSBoXBLL8U5sq
 7J/N9Q6uxAb6m06Krkh3EiCGhs7ZaeNXJLcj9X2dnrRiuQ2hUCV9kOGUrj685BG04bEg
 P1C1+2q93LdVMapcDSZertFgwsDRfTrynpBehLExyWoDoB2+6BQQTKiR5PBhATw7Exzu
 S6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=d/1kLQUMewSLBJh9H3YYxq6OAKkpC/5bxHqSelUU5Nc=;
 b=cyzitqAofBOZtRtnItjK2YSzEtc8cbm6fZ4MaF4i/Gqa57fWPxZZGV/Md7LC9qdBxM
 TTKxc19PtWRVspW2smWUGsxxbhawvW4GdnXy981UcPxZaDnWKcFSjXrPWZULuaRv00cf
 TYZlbDf2SyORzYPS4izZod6GvFwxXpISxgs4ENii04POvJHXH/CTL0+gOtEhJF3W/DPC
 i4hHiUJUBN/UGaFGXwMv0TMGQ3pY9eG6sbzQ+30LfnK4rX5hU13Cl4LXUygJ6o0FKiF5
 ZgMPyrOITTD1cCChbAbkb9/egDX9VdYh0Sa7Wzkn3TkKss1WnURuUI//zURSRv9gsJDC
 XgtA==
X-Gm-Message-State: ACgBeo3B56PGbFD1Pkdrjcq7VOeSPNBiMJjuDMHXppQn7BlnE15r77W8
 N60MZXHpfPHD2J1HECr2DMu7AQ==
X-Google-Smtp-Source: AA6agR4EESVKQMRO2yhPxT1A+8RwInyX0/Yexxc3/eTeUC0u2LfzxUwxGPCEnpwW+WO/83JmNLL2MQ==
X-Received: by 2002:a63:82c2:0:b0:422:5284:f189 with SMTP id
 w185-20020a6382c2000000b004225284f189mr13170331pgd.498.1661078821147; 
 Sun, 21 Aug 2022 03:47:01 -0700 (PDT)
Received: from john-millikin.com ([2405:6580:98c0:1200:3ac8:2f1:dddf:76fe])
 by smtp.gmail.com with ESMTPSA id
 u38-20020a632366000000b0041c30f78fa6sm5387267pgm.69.2022.08.21.03.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 03:47:00 -0700 (PDT)
Date: Sun, 21 Aug 2022 19:46:56 +0900
From: John Millikin <john@john-millikin.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fam Zheng <fam@euphon.net>, Bill Paul <noisetube@gmail.com>
Subject: Re: [PATCH 1/2] scsi: Add buf_len parameter to scsi_req_new()
Message-ID: <YwINIEZuPFlVZREF@john-millikin.com>
References: <20220817053458.698416-1-john@john-millikin.com>
 <04d08571-a92d-c21a-6927-e4b3014e12b9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04d08571-a92d-c21a-6927-e4b3014e12b9@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=john@john-millikin.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you for the suggestions for CDB sizes! Especially the tricky ones
in spapr_vscsi.c and dev-uas.c.

v2: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02997.html

On Fri, Aug 19, 2022 at 06:06:13PM +0200, Paolo Bonzini wrote:
> On 8/17/22 07:34, John Millikin wrote:
> > The sigil SCSI_CMD_BUF_LEN_TODO() is used to indicate that the buffer
> > length calculation is TODO it should be replaced by a better value,
> > such as the length of a successful DMA read.
> 
> Let's just do it right:
> 
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index e8a4a705e7..05a43ec807 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -864,7 +864,7 @@ static void lsi_do_command(LSIState *s)
>      s->current = g_new0(lsi_request, 1);
>      s->current->tag = s->select_tag;
>      s->current->req = scsi_req_new(dev, s->current->tag, s->current_lun, buf,
> -                                   SCSI_CMD_BUF_LEN_TODO(s->dbc), s->current);
> +                                   s->dbc, s->current);
>      n = scsi_req_enqueue(s->current->req);
>      if (n) {
> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> index e887ae8adb..842edc3f9d 100644
> --- a/hw/scsi/megasas.c
> +++ b/hw/scsi/megasas.c
> @@ -1053,7 +1053,6 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
>      uint64_t pd_size;
>      uint16_t pd_id = ((sdev->id & 0xFF) << 8) | (lun & 0xFF);
>      uint8_t cmdbuf[6];
> -    size_t cmdbuf_len = SCSI_CMD_BUF_LEN_TODO(sizeof(cmdbuf));
>      size_t len;
>      dma_addr_t residual;
> @@ -1063,7 +1062,7 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
>          info->inquiry_data[0] = 0x7f; /* Force PQual 0x3, PType 0x1f */
>          info->vpd_page83[0] = 0x7f;
>          megasas_setup_inquiry(cmdbuf, 0, sizeof(info->inquiry_data));
> -        cmd->req = scsi_req_new(sdev, cmd->index, lun, cmdbuf, cmdbuf_len, cmd);
> +        cmd->req = scsi_req_new(sdev, cmd->index, lun, cmdbuf, sizeof(cmdbuf), cmd);
>          if (!cmd->req) {
>              trace_megasas_dcmd_req_alloc_failed(cmd->index,
>                                                  "PD get info std inquiry");
> @@ -1081,7 +1080,7 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
>          return MFI_STAT_INVALID_STATUS;
>      } else if (info->inquiry_data[0] != 0x7f && info->vpd_page83[0] == 0x7f) {
>          megasas_setup_inquiry(cmdbuf, 0x83, sizeof(info->vpd_page83));
> -        cmd->req = scsi_req_new(sdev, cmd->index, lun, cmdbuf, cmdbuf_len, cmd);
> +        cmd->req = scsi_req_new(sdev, cmd->index, lun, cmdbuf, sizeof(cmdbuf), cmd);
>          if (!cmd->req) {
>              trace_megasas_dcmd_req_alloc_failed(cmd->index,
>                                                  "PD get info vpd inquiry");
> diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
> index 711613b5b1..a90c2546f1 100644
> --- a/hw/scsi/mptsas.c
> +++ b/hw/scsi/mptsas.c
> @@ -324,8 +324,8 @@ static int mptsas_process_scsi_io_request(MPTSASState *s,
>      }
>      req->sreq = scsi_req_new(sdev, scsi_io->MsgContext,
> -                            scsi_io->LUN[1], scsi_io->CDB,
> -                            SCSI_CMD_BUF_LEN_TODO(SIZE_MAX), req);
> +                             scsi_io->LUN[1], scsi_io->CDB,
> +                             scsi_io->CDBLength, req);
>      if (req->sreq->cmd.xfer > scsi_io->DataLength) {
>          goto overrun;
> diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> index 288ea12969..cc71524024 100644
> --- a/hw/scsi/scsi-bus.c
> +++ b/hw/scsi/scsi-bus.c
> @@ -1707,7 +1707,6 @@ static int get_scsi_requests(QEMUFile *f, void *pv, size_t size,
>      while ((sbyte = qemu_get_sbyte(f)) > 0) {
>          uint8_t buf[SCSI_CMD_BUF_SIZE];
> -        size_t buf_len;
>          uint32_t tag;
>          uint32_t lun;
>          SCSIRequest *req;
> @@ -1715,8 +1714,11 @@ static int get_scsi_requests(QEMUFile *f, void *pv, size_t size,
>          qemu_get_buffer(f, buf, sizeof(buf));
>          qemu_get_be32s(f, &tag);
>          qemu_get_be32s(f, &lun);
> -        buf_len = SCSI_CMD_BUF_LEN_TODO(sizeof(buf));
> -        req = scsi_req_new(s, tag, lun, buf, buf_len, NULL);
> +        /*
> +         * A too-short CDB would have been rejected by scsi_req_new, so just use
> +         * SCSI_CMD_BUF_SIZE as the CDB length.
> +         */
> +        req = scsi_req_new(s, tag, lun, buf, sizeof(buf), NULL);
>          req->retry = (sbyte == 1);
>          if (bus->info->load_request) {
>              req->hba_private = bus->info->load_request(f, req);
> diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
> index c17bb47f7b..0a8cbf5a4b 100644
> --- a/hw/scsi/spapr_vscsi.c
> +++ b/hw/scsi/spapr_vscsi.c
> @@ -783,7 +783,7 @@ static int vscsi_queue_cmd(VSCSIState *s, vscsi_req *req)
>      union srp_iu *srp = &req_iu(req)->srp;
>      SCSIDevice *sdev;
>      int n, lun;
> -    size_t cdb_len = SCSI_CMD_BUF_LEN_TODO(SIZE_MAX);
> +    size_t cdb_len = sizeof (srp->cmd.cdb) + (srp->cmd.add_cdb_len & ~3);
>      if ((srp->cmd.lun == 0 || be64_to_cpu(srp->cmd.lun) == SRP_REPORT_LUNS_WLUN)
>        && srp->cmd.cdb[0] == REPORT_LUNS) {
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index 632e3aa58f..41f2a56301 100644
> --- a/hw/scsi/virtio-scsi.c
> +++ b/hw/scsi/virtio-scsi.c
> @@ -673,7 +673,6 @@ static int virtio_scsi_handle_cmd_req_prepare(VirtIOSCSI *s, VirtIOSCSIReq *req)
>      VirtIOSCSICommon *vs = &s->parent_obj;
>      SCSIDevice *d;
>      int rc;
> -    size_t cdb_len = SCSI_CMD_BUF_LEN_TODO(SIZE_MAX);
>      rc = virtio_scsi_parse_req(req, sizeof(VirtIOSCSICmdReq) + vs->cdb_size,
>                                 sizeof(VirtIOSCSICmdResp) + vs->sense_size);
> @@ -698,7 +697,7 @@ static int virtio_scsi_handle_cmd_req_prepare(VirtIOSCSI *s, VirtIOSCSIReq *req)
>      virtio_scsi_ctx_check(s, d);
>      req->sreq = scsi_req_new(d, req->req.cmd.tag,
>                               virtio_scsi_get_lun(req->req.cmd.lun),
> -                             req->req.cmd.cdb, cdb_len, req);
> +                             req->req.cmd.cdb, vs->cdb_size, req);
>      if (req->sreq->cmd.mode != SCSI_XFER_NONE
>          && (req->sreq->cmd.mode != req->mode ||
> diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
> index f845c88378..91e2f858ab 100644
> --- a/hw/scsi/vmw_pvscsi.c
> +++ b/hw/scsi/vmw_pvscsi.c
> @@ -716,7 +716,6 @@ pvscsi_process_request_descriptor(PVSCSIState *s,
>      SCSIDevice *d;
>      PVSCSIRequest *r = pvscsi_queue_pending_descriptor(s, &d, descr);
>      int64_t n;
> -    size_t cdb_len = SCSI_CMD_BUF_LEN_TODO(SIZE_MAX);
>      trace_pvscsi_process_req_descr(descr->cdb[0], descr->context);
> @@ -731,7 +730,7 @@ pvscsi_process_request_descriptor(PVSCSIState *s,
>          r->sg.elemAddr = descr->dataAddr;
>      }
> -    r->sreq = scsi_req_new(d, descr->context, r->lun, descr->cdb, cdb_len, r);
> +    r->sreq = scsi_req_new(d, descr->context, r->lun, descr->cdb, descr->cdbLen, r);
>      if (r->sreq->cmd.mode == SCSI_XFER_FROM_DEV &&
>          (descr->flags & PVSCSI_FLAG_CMD_DIR_TODEVICE)) {
>          r->cmp.hostStatus = BTSTAT_BADMSG;
> diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
> index 353e129fac..98639696e6 100644
> --- a/hw/usb/dev-storage.c
> +++ b/hw/usb/dev-storage.c
> @@ -379,7 +379,6 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
>      uint8_t devep = p->ep->nr;
>      SCSIDevice *scsi_dev;
>      uint32_t len;
> -    size_t cdb_len = SCSI_CMD_BUF_LEN_TODO(SIZE_MAX);
>      switch (p->pid) {
>      case USB_TOKEN_OUT:
> @@ -416,7 +415,7 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
>                                       cbw.cmd_len, s->data_len);
>              assert(le32_to_cpu(s->csw.residue) == 0);
>              s->scsi_len = 0;
> -            s->req = scsi_req_new(scsi_dev, tag, cbw.lun, cbw.cmd, cdb_len, NULL);
> +            s->req = scsi_req_new(scsi_dev, tag, cbw.lun, cbw.cmd, cbw.cmd_len, NULL);
>              if (s->commandlog) {
>                  scsi_req_print(s->req);
>              }
> diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
> index 768df8958c..5192b062d6 100644
> --- a/hw/usb/dev-uas.c
> +++ b/hw/usb/dev-uas.c
> @@ -71,7 +71,7 @@ typedef struct {
>      uint8_t    reserved_2;
>      uint64_t   lun;
>      uint8_t    cdb[16];
> -    uint8_t    add_cdb[1];      /* not supported by QEMU */
> +    uint8_t    add_cdb[1];
>  } QEMU_PACKED  uas_iu_command;
>  typedef struct {
> @@ -699,7 +699,7 @@ static void usb_uas_command(UASDevice *uas, uas_iu *iu)
>      UASRequest *req;
>      uint32_t len;
>      uint16_t tag = be16_to_cpu(iu->hdr.tag);
> -    size_t cdb_len = SCSI_CMD_BUF_LEN_TODO(SIZE_MAX);
> +    size_t cdb_len = sizeof(iu->command.cdb) + iu->command.add_cdb_length;
>      if (iu->command.add_cdb_length > 0) {
>          qemu_log_mask(LOG_UNIMP, "additional adb length not yet supported\n");
> diff --git a/include/scsi/utils.h b/include/scsi/utils.h
> index 1a36d25ee4..d5c8efa16e 100644
> --- a/include/scsi/utils.h
> +++ b/include/scsi/utils.h
> @@ -144,10 +144,4 @@ int scsi_cdb_length(uint8_t *buf);
>  int scsi_sense_from_errno(int errno_value, SCSISense *sense);
>  int scsi_sense_from_host_status(uint8_t host_status, SCSISense *sense);
> -/**
> - * Annotates places where a SCSI command buffer is passed to scsi_req_new()
> - * but haven't yet been updated to pass the buffer's true (populated) length.
> - */
> -#define SCSI_CMD_BUF_LEN_TODO(guess) guess
> -
>  #endif
> 
> (or something like that).
> 
> paolo
> 

