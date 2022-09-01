Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4582D5A9F16
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:36:18 +0200 (CEST)
Received: from localhost ([::1]:37704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTp33-0002cm-Dk
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oToru-0007an-17
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:24:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTorl-0008Fy-PA
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kHXCoHNGKhywHvOjn7EEHKF6yzi1OJVfqIk+OaJqH0E=;
 b=F3kDZfrwupViDfzVoZczOlk6mtdd4YCjGsLJKzQFV8uUZHtjbN1ffmA1hgrM1c8BXO7Oe+
 9l83bhACNOdlLdORw8pumbzN0SmrvUaE17YsTzqjXcBIQCE4SFY/7fLHCr+O3CtkLFNTc+
 EELzfuxxbVSSajexBBakzO74wjvfKJA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-lMWY2yTbM9SPj6eWTDPPwQ-1; Thu, 01 Sep 2022 14:24:36 -0400
X-MC-Unique: lMWY2yTbM9SPj6eWTDPPwQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 ee47-20020a056402292f00b004486550972aso8874382edb.1
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kHXCoHNGKhywHvOjn7EEHKF6yzi1OJVfqIk+OaJqH0E=;
 b=cUxTSaBflvEfVVROpFekLZjFaeOWc76zlCOznQmwDEdtT+AuyFZg0XzkZIko6FEwh3
 37ZgtwMTueQT0WzHS8EM2qwCGec3yXHbi+jKLGc1r627Di34l8msWmbBXA+TSvMR9Fz4
 iCIyqTHKNOqgQsSkUnJgJowNvnMIRtCzHxcP8S5I+EeEiFqwuK3m8ysk1LKqDiqxHKrs
 p37PPguDOA04jbGsi5uceNsRJzog/Fxu9yMzrTKzqkLdjF+w4CAr6Zic95tAulqCXQZM
 Skla1Hy7Xp5jZPdFT4dHChRT8gPbfoWr5mDBCPMVqJwxn6AQkvQ/03xYZ4jN07Fm1ccV
 Wcbg==
X-Gm-Message-State: ACgBeo3wNyAYnK7hczyR2tn11zMfyIgnLx/2dryDWXKu9Epm0pMtMCgJ
 hYY0DLaR+X0no86IIh+/Y0ZqXVsek8YVsBmhjOXS0MlwYOGkhq5VA3KhUd0wQQGl7MCZjFkaMIR
 UM91sXX35gPvUTRfFA9ziu3XPwVUjb3Ixxryq4k2KwxYH1aF1qrbWU7OA64XvbeXVRkA=
X-Received: by 2002:aa7:c946:0:b0:43d:3038:1381 with SMTP id
 h6-20020aa7c946000000b0043d30381381mr29885707edt.354.1662056674705; 
 Thu, 01 Sep 2022 11:24:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7bxcoBPZoYxegHcF0i/VZLimjg8aeY/lwVa9ruvza4YJOfr5Rxao7YAmNytwOdNPFPfkMjqg==
X-Received: by 2002:aa7:c946:0:b0:43d:3038:1381 with SMTP id
 h6-20020aa7c946000000b0043d30381381mr29885696edt.354.1662056674356; 
 Thu, 01 Sep 2022 11:24:34 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a1709062b0700b0073d5489fff2sm8818967ejg.120.2022.09.01.11.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:24:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Millikin <john@john-millikin.com>
Subject: [PULL 02/39] scsi: Add buf_len parameter to scsi_req_new()
Date: Thu,  1 Sep 2022 20:23:52 +0200
Message-Id: <20220901182429.93533-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: John Millikin <john@john-millikin.com>

When a SCSI command is received from the guest, the CDB length implied
by the first byte might exceed the number of bytes the guest sent. In
this case scsi_req_new() will read uninitialized data, causing
unpredictable behavior.

Adds the buf_len parameter to scsi_req_new() and plumbs it through the
call stack.

Signed-off-by: John Millikin <john@john-millikin.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1127
Message-Id: <20220817053458.698416-1-john@john-millikin.com>
[Fill in correct length for adapters other than ESP. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c          |  2 +-
 hw/scsi/lsi53c895a.c   |  2 +-
 hw/scsi/megasas.c      | 10 +++++-----
 hw/scsi/mptsas.c       |  3 ++-
 hw/scsi/scsi-bus.c     | 21 +++++++++++++--------
 hw/scsi/scsi-disk.c    |  7 ++++---
 hw/scsi/scsi-generic.c |  5 +++--
 hw/scsi/spapr_vscsi.c  |  3 ++-
 hw/scsi/virtio-scsi.c  |  5 +++--
 hw/scsi/vmw_pvscsi.c   |  2 +-
 hw/usb/dev-storage.c   |  2 +-
 hw/usb/dev-uas.c       |  5 +++--
 include/hw/scsi/scsi.h | 11 ++++++-----
 13 files changed, 45 insertions(+), 33 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index c799c19bd4..2ff18ce500 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -292,7 +292,7 @@ static void do_command_phase(ESPState *s)
     esp_fifo_pop_buf(&s->cmdfifo, buf, cmdlen);
 
     current_lun = scsi_device_find(&s->bus, 0, s->current_dev->id, s->lun);
-    s->current_req = scsi_req_new(current_lun, 0, s->lun, buf, s);
+    s->current_req = scsi_req_new(current_lun, 0, s->lun, buf, cmdlen, s);
     datalen = scsi_req_enqueue(s->current_req);
     s->ti_size = datalen;
     fifo8_reset(&s->cmdfifo);
diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index ad5f5e5f39..05a43ec807 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -864,7 +864,7 @@ static void lsi_do_command(LSIState *s)
     s->current = g_new0(lsi_request, 1);
     s->current->tag = s->select_tag;
     s->current->req = scsi_req_new(dev, s->current->tag, s->current_lun, buf,
-                                   s->current);
+                                   s->dbc, s->current);
 
     n = scsi_req_enqueue(s->current->req);
     if (n) {
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index d5dfb412ba..7082456d65 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1062,7 +1062,7 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
         info->inquiry_data[0] = 0x7f; /* Force PQual 0x3, PType 0x1f */
         info->vpd_page83[0] = 0x7f;
         megasas_setup_inquiry(cmdbuf, 0, sizeof(info->inquiry_data));
-        cmd->req = scsi_req_new(sdev, cmd->index, lun, cmdbuf, cmd);
+        cmd->req = scsi_req_new(sdev, cmd->index, lun, cmdbuf, sizeof(cmdbuf), cmd);
         if (!cmd->req) {
             trace_megasas_dcmd_req_alloc_failed(cmd->index,
                                                 "PD get info std inquiry");
@@ -1080,7 +1080,7 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
         return MFI_STAT_INVALID_STATUS;
     } else if (info->inquiry_data[0] != 0x7f && info->vpd_page83[0] == 0x7f) {
         megasas_setup_inquiry(cmdbuf, 0x83, sizeof(info->vpd_page83));
-        cmd->req = scsi_req_new(sdev, cmd->index, lun, cmdbuf, cmd);
+        cmd->req = scsi_req_new(sdev, cmd->index, lun, cmdbuf, sizeof(cmdbuf), cmd);
         if (!cmd->req) {
             trace_megasas_dcmd_req_alloc_failed(cmd->index,
                                                 "PD get info vpd inquiry");
@@ -1268,7 +1268,7 @@ static int megasas_ld_get_info_submit(SCSIDevice *sdev, int lun,
         cmd->iov_buf = g_malloc0(dcmd_size);
         info = cmd->iov_buf;
         megasas_setup_inquiry(cdb, 0x83, sizeof(info->vpd_page83));
-        cmd->req = scsi_req_new(sdev, cmd->index, lun, cdb, cmd);
+        cmd->req = scsi_req_new(sdev, cmd->index, lun, cdb, sizeof(cdb), cmd);
         if (!cmd->req) {
             trace_megasas_dcmd_req_alloc_failed(cmd->index,
                                                 "LD get info vpd inquiry");
@@ -1748,7 +1748,7 @@ static int megasas_handle_scsi(MegasasState *s, MegasasCmd *cmd,
         return MFI_STAT_SCSI_DONE_WITH_ERROR;
     }
 
-    cmd->req = scsi_req_new(sdev, cmd->index, lun_id, cdb, cmd);
+    cmd->req = scsi_req_new(sdev, cmd->index, lun_id, cdb, cdb_len, cmd);
     if (!cmd->req) {
         trace_megasas_scsi_req_alloc_failed(
                 mfi_frame_desc(frame_cmd), target_id, lun_id);
@@ -1823,7 +1823,7 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
 
     megasas_encode_lba(cdb, lba_start, lba_count, is_write);
     cmd->req = scsi_req_new(sdev, cmd->index,
-                            lun_id, cdb, cmd);
+                            lun_id, cdb, cdb_len, cmd);
     if (!cmd->req) {
         trace_megasas_scsi_req_alloc_failed(
             mfi_frame_desc(frame_cmd), target_id, lun_id);
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index 706cf0df3a..a90c2546f1 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -324,7 +324,8 @@ static int mptsas_process_scsi_io_request(MPTSASState *s,
     }
 
     req->sreq = scsi_req_new(sdev, scsi_io->MsgContext,
-                            scsi_io->LUN[1], scsi_io->CDB, req);
+                             scsi_io->LUN[1], scsi_io->CDB,
+                             scsi_io->CDBLength, req);
 
     if (req->sreq->cmd.xfer > scsi_io->DataLength) {
         goto overrun;
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index b2e2bc3c96..cc71524024 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -102,15 +102,15 @@ static void scsi_device_unrealize(SCSIDevice *s)
 }
 
 int scsi_bus_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
-                       void *hba_private)
+                       size_t buf_len, void *hba_private)
 {
     SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, dev->qdev.parent_bus);
     int rc;
 
     assert(cmd->len == 0);
-    rc = scsi_req_parse_cdb(dev, cmd, buf);
+    rc = scsi_req_parse_cdb(dev, cmd, buf, buf_len);
     if (bus->info->parse_cdb) {
-        rc = bus->info->parse_cdb(dev, cmd, buf, hba_private);
+        rc = bus->info->parse_cdb(dev, cmd, buf, buf_len, hba_private);
     }
     return rc;
 }
@@ -703,7 +703,7 @@ SCSIRequest *scsi_req_alloc(const SCSIReqOps *reqops, SCSIDevice *d,
 }
 
 SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
-                          uint8_t *buf, void *hba_private)
+                          uint8_t *buf, size_t buf_len, void *hba_private)
 {
     SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, d->qdev.parent_bus);
     const SCSIReqOps *ops;
@@ -734,9 +734,9 @@ SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
     }
 
     if (ops != NULL || !sc->parse_cdb) {
-        ret = scsi_req_parse_cdb(d, &cmd, buf);
+        ret = scsi_req_parse_cdb(d, &cmd, buf, buf_len);
     } else {
-        ret = sc->parse_cdb(d, &cmd, buf, hba_private);
+        ret = sc->parse_cdb(d, &cmd, buf, buf_len, hba_private);
     }
 
     if (ret != 0) {
@@ -1308,7 +1308,8 @@ static void scsi_cmd_xfer_mode(SCSICommand *cmd)
     }
 }
 
-int scsi_req_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf)
+int scsi_req_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
+                       size_t buf_len)
 {
     int rc;
     int len;
@@ -1713,7 +1714,11 @@ static int get_scsi_requests(QEMUFile *f, void *pv, size_t size,
         qemu_get_buffer(f, buf, sizeof(buf));
         qemu_get_be32s(f, &tag);
         qemu_get_be32s(f, &lun);
-        req = scsi_req_new(s, tag, lun, buf, NULL);
+        /*
+         * A too-short CDB would have been rejected by scsi_req_new, so just use
+         * SCSI_CMD_BUF_SIZE as the CDB length.
+         */
+        req = scsi_req_new(s, tag, lun, buf, sizeof(buf), NULL);
         req->retry = (sbyte == 1);
         if (bus->info->load_request) {
             req->hba_private = bus->info->load_request(f, req);
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index efee6739f9..399e1787ea 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -3030,14 +3030,15 @@ static SCSIRequest *scsi_block_new_request(SCSIDevice *d, uint32_t tag,
 }
 
 static int scsi_block_parse_cdb(SCSIDevice *d, SCSICommand *cmd,
-                                  uint8_t *buf, void *hba_private)
+                                  uint8_t *buf, size_t buf_len,
+                                  void *hba_private)
 {
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, d);
 
     if (scsi_block_is_passthrough(s, buf)) {
-        return scsi_bus_parse_cdb(&s->qdev, cmd, buf, hba_private);
+        return scsi_bus_parse_cdb(&s->qdev, cmd, buf, buf_len, hba_private);
     } else {
-        return scsi_req_parse_cdb(&s->qdev, cmd, buf);
+        return scsi_req_parse_cdb(&s->qdev, cmd, buf, buf_len);
     }
 }
 
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 3d35d307e1..92cce20a4d 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -791,9 +791,10 @@ static Property scsi_generic_properties[] = {
 };
 
 static int scsi_generic_parse_cdb(SCSIDevice *dev, SCSICommand *cmd,
-                                  uint8_t *buf, void *hba_private)
+                                  uint8_t *buf, size_t buf_len,
+                                  void *hba_private)
 {
-    return scsi_bus_parse_cdb(dev, cmd, buf, hba_private);
+    return scsi_bus_parse_cdb(dev, cmd, buf, buf_len, hba_private);
 }
 
 static void scsi_generic_class_initfn(ObjectClass *klass, void *data)
diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index e320ccaa23..0a8cbf5a4b 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -783,6 +783,7 @@ static int vscsi_queue_cmd(VSCSIState *s, vscsi_req *req)
     union srp_iu *srp = &req_iu(req)->srp;
     SCSIDevice *sdev;
     int n, lun;
+    size_t cdb_len = sizeof (srp->cmd.cdb) + (srp->cmd.add_cdb_len & ~3);
 
     if ((srp->cmd.lun == 0 || be64_to_cpu(srp->cmd.lun) == SRP_REPORT_LUNS_WLUN)
       && srp->cmd.cdb[0] == REPORT_LUNS) {
@@ -801,7 +802,7 @@ static int vscsi_queue_cmd(VSCSIState *s, vscsi_req *req)
         } return 1;
     }
 
-    req->sreq = scsi_req_new(sdev, req->qtag, lun, srp->cmd.cdb, req);
+    req->sreq = scsi_req_new(sdev, req->qtag, lun, srp->cmd.cdb, cdb_len, req);
     n = scsi_req_enqueue(req->sreq);
 
     trace_spapr_vscsi_queue_cmd(req->qtag, srp->cmd.cdb[0],
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 4141dddd51..41f2a56301 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -622,7 +622,8 @@ static void virtio_scsi_command_complete(SCSIRequest *r, size_t resid)
 }
 
 static int virtio_scsi_parse_cdb(SCSIDevice *dev, SCSICommand *cmd,
-                                 uint8_t *buf, void *hba_private)
+                                 uint8_t *buf, size_t buf_len,
+                                 void *hba_private)
 {
     VirtIOSCSIReq *req = hba_private;
 
@@ -696,7 +697,7 @@ static int virtio_scsi_handle_cmd_req_prepare(VirtIOSCSI *s, VirtIOSCSIReq *req)
     virtio_scsi_ctx_check(s, d);
     req->sreq = scsi_req_new(d, req->req.cmd.tag,
                              virtio_scsi_get_lun(req->req.cmd.lun),
-                             req->req.cmd.cdb, req);
+                             req->req.cmd.cdb, vs->cdb_size, req);
 
     if (req->sreq->cmd.mode != SCSI_XFER_NONE
         && (req->sreq->cmd.mode != req->mode ||
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 4d9969f3b1..91e2f858ab 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -730,7 +730,7 @@ pvscsi_process_request_descriptor(PVSCSIState *s,
         r->sg.elemAddr = descr->dataAddr;
     }
 
-    r->sreq = scsi_req_new(d, descr->context, r->lun, descr->cdb, r);
+    r->sreq = scsi_req_new(d, descr->context, r->lun, descr->cdb, descr->cdbLen, r);
     if (r->sreq->cmd.mode == SCSI_XFER_FROM_DEV &&
         (descr->flags & PVSCSI_FLAG_CMD_DIR_TODEVICE)) {
         r->cmp.hostStatus = BTSTAT_BADMSG;
diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index dca62d544f..98639696e6 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -415,7 +415,7 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
                                      cbw.cmd_len, s->data_len);
             assert(le32_to_cpu(s->csw.residue) == 0);
             s->scsi_len = 0;
-            s->req = scsi_req_new(scsi_dev, tag, cbw.lun, cbw.cmd, NULL);
+            s->req = scsi_req_new(scsi_dev, tag, cbw.lun, cbw.cmd, cbw.cmd_len, NULL);
             if (s->commandlog) {
                 scsi_req_print(s->req);
             }
diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index c9f295e7e4..5192b062d6 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -71,7 +71,7 @@ typedef struct {
     uint8_t    reserved_2;
     uint64_t   lun;
     uint8_t    cdb[16];
-    uint8_t    add_cdb[1];      /* not supported by QEMU */
+    uint8_t    add_cdb[1];
 } QEMU_PACKED  uas_iu_command;
 
 typedef struct {
@@ -699,6 +699,7 @@ static void usb_uas_command(UASDevice *uas, uas_iu *iu)
     UASRequest *req;
     uint32_t len;
     uint16_t tag = be16_to_cpu(iu->hdr.tag);
+    size_t cdb_len = sizeof(iu->command.cdb) + iu->command.add_cdb_length;
 
     if (iu->command.add_cdb_length > 0) {
         qemu_log_mask(LOG_UNIMP, "additional adb length not yet supported\n");
@@ -729,7 +730,7 @@ static void usb_uas_command(UASDevice *uas, uas_iu *iu)
 
     req->req = scsi_req_new(req->dev, req->tag,
                             usb_uas_get_lun(req->lun),
-                            iu->command.cdb, req);
+                            iu->command.cdb, cdb_len, req);
     if (uas->requestlog) {
         scsi_req_print(req->req);
     }
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index e284e3a4ec..001103488c 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -59,7 +59,7 @@ struct SCSIDeviceClass {
     void (*realize)(SCSIDevice *dev, Error **errp);
     void (*unrealize)(SCSIDevice *dev);
     int (*parse_cdb)(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
-                     void *hba_private);
+                     size_t buf_len, void *hba_private);
     SCSIRequest *(*alloc_req)(SCSIDevice *s, uint32_t tag, uint32_t lun,
                               uint8_t *buf, void *hba_private);
     void (*unit_attention_reported)(SCSIDevice *s);
@@ -122,7 +122,7 @@ struct SCSIBusInfo {
     int tcq;
     int max_channel, max_target, max_lun;
     int (*parse_cdb)(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
-                     void *hba_private);
+                     size_t buf_len, void *hba_private);
     void (*transfer_data)(SCSIRequest *req, uint32_t arg);
     void (*fail)(SCSIRequest *req);
     void (*complete)(SCSIRequest *req, size_t residual);
@@ -192,14 +192,15 @@ void scsi_legacy_handle_cmdline(void);
 SCSIRequest *scsi_req_alloc(const SCSIReqOps *reqops, SCSIDevice *d,
                             uint32_t tag, uint32_t lun, void *hba_private);
 SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
-                          uint8_t *buf, void *hba_private);
+                          uint8_t *buf, size_t buf_len, void *hba_private);
 int32_t scsi_req_enqueue(SCSIRequest *req);
 SCSIRequest *scsi_req_ref(SCSIRequest *req);
 void scsi_req_unref(SCSIRequest *req);
 
 int scsi_bus_panse(SCSIRequest *req, SCSISense sense);
 void scsi_req_print(SCSIRequest *req);
 void scsi_req_continue(SCSIRequest *req);
-- 
2.37.2



