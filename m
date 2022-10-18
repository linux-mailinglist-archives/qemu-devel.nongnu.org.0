Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB31602D89
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:57:35 +0200 (CEST)
Received: from localhost ([::1]:47824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn63-0002GT-Tf
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgW-00022P-2S
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgS-0004yN-3W
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBayf/BcWZuAnvkVyWE9fiu3SPDAv6PKOeXm+A0vxwE=;
 b=K3/f+DFStpDFbLo/hlxuRdVufI85/q/EYIxcx8K9UVNuKpEWxk7Dz63YIsWj/IBW4wu3H6
 S9sHLZsY178u66CEht/0xcZ/8Qych8y6Vp3eS6N1ynxEYdgVke9KwgKUqgKEGWi086qtUz
 oix6YeW4aSAoXtaFG90XOWYE94s5Lh4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-_b0nu94KO5OfzxYE3GS5Ow-1; Tue, 18 Oct 2022 09:30:59 -0400
X-MC-Unique: _b0nu94KO5OfzxYE3GS5Ow-1
Received: by mail-ed1-f69.google.com with SMTP id
 z11-20020a056402274b00b0045ca9510fc8so11917826edd.23
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WBayf/BcWZuAnvkVyWE9fiu3SPDAv6PKOeXm+A0vxwE=;
 b=xxJluayS5Jj6BuJjGMJtiBhMpPyVRY2Nk8/Emd7XqxHooaJrQ/SnfoDgkKWDbx4BEc
 Zp7nD0mDGmWeWTH5CVxFtdx4gjhfIe6oGZDO+lePnlar1gpB3dh9Fn8NIjDkKX/AFnoD
 RJwMsWNeAuNlZb/s75TA3cvJO38+0wELB3oylE9u0lBQUlkVf7aVuLPqoHDreF+zjRNY
 uip5RUV2Zn2/U8Z78tuS0JpE5EpJtNBUMgMPvLJBxhVP0VE7SK6k8i9w99gpDVsmy/gZ
 rLJntQPhKM8DOMmXLQlAo4eSCgMchrhF0GDH0nrqVqOmHOhSzpeLMDsnK9nqlCN85kCq
 RgKw==
X-Gm-Message-State: ACrzQf1BdGgD4O9B3Zqx9VaEsCNYWQ8ZhZI+UmoCjUVMVHqQ572R/LXl
 DozOmtnnx/DkSUSfrMaYefvLIe/E42EllIyT2K+PzNXDAxT87uy+Zl53l1dweyjmIOVuKHS7B/J
 F8v2+iNiG6STsGNpIBq9k4iXQSoNug95IFqZIetfF1czxye1iSwghDVVd7lpA5WwAeTk=
X-Received: by 2002:a05:6402:11ce:b0:45c:a364:2c3d with SMTP id
 j14-20020a05640211ce00b0045ca3642c3dmr2699702edw.204.1666099858342; 
 Tue, 18 Oct 2022 06:30:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6oPVM92CEMb8QsrI6nXU8Nwlh50OnjKxKpZxa8q1UQnMj2CpjeNsVkMLMjyh12ir01kBiuwQ==
X-Received: by 2002:a05:6402:11ce:b0:45c:a364:2c3d with SMTP id
 j14-20020a05640211ce00b0045ca3642c3dmr2699672edw.204.1666099858029; 
 Tue, 18 Oct 2022 06:30:58 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 kz1-20020a17090777c100b0073d753759fasm7701837ejc.172.2022.10.18.06.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:30:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/53] scsi: Use device_cold_reset() and bus_cold_reset()
Date: Tue, 18 Oct 2022 15:29:52 +0200
Message-Id: <20221018133042.856368-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Peter Maydell <peter.maydell@linaro.org>

In the SCSI subsystem we currently use the legacy functions
qdev_reset_all() and qbus_reset_all().  These perform a recursive
reset, starting from either a qbus or a qdev.  However they do not
permit any of the devices in the tree to use three-phase reset,
because device reset goes through the device_legacy_reset() function
that only calls the single DeviceClass::reset method.

Switch to using the device_cold_reset() and bus_cold_reset()
functions.  These also perform a recursive reset, where first the
children are reset and then finally the parent, but they use the new
(...in 2020...) Resettable mechanism, which supports both the old
style single-reset method and also the new 3-phase reset handling.

Since no devices attached to SCSI buses currently try to use 3-phase
reset, this should be a no-behaviour-change commit which just reduces
the use of a deprecated API.

Commit created with:
  sed -i -e 's/qdev_reset_all/device_cold_reset/g;s/qbus_reset_all/bus_cold_reset/g' hw/scsi/*.c

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20221013160623.1296109-2-peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c         | 2 +-
 hw/scsi/lsi53c895a.c  | 4 ++--
 hw/scsi/megasas.c     | 2 +-
 hw/scsi/mptsas.c      | 8 ++++----
 hw/scsi/spapr_vscsi.c | 2 +-
 hw/scsi/virtio-scsi.c | 6 +++---
 hw/scsi/vmw_pvscsi.c  | 4 ++--
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 2ff18ce500..e5b281e836 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -941,7 +941,7 @@ static void esp_soft_reset(ESPState *s)
 
 static void esp_bus_reset(ESPState *s)
 {
-    qbus_reset_all(BUS(&s->bus));
+    bus_cold_reset(BUS(&s->bus));
 }
 
 static void parent_esp_reset(ESPState *s, int irq, int level)
diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 05a43ec807..50979640c3 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -1868,7 +1868,7 @@ static void lsi_reg_writeb(LSIState *s, int offset, uint8_t val)
         }
         if (val & LSI_SCNTL1_RST) {
             if (!(s->sstat0 & LSI_SSTAT0_RST)) {
-                qbus_reset_all(BUS(&s->bus));
+                bus_cold_reset(BUS(&s->bus));
                 s->sstat0 |= LSI_SSTAT0_RST;
                 lsi_script_scsi_interrupt(s, LSI_SIST0_RST, 0);
             }
@@ -1926,7 +1926,7 @@ static void lsi_reg_writeb(LSIState *s, int offset, uint8_t val)
             lsi_execute_script(s);
         }
         if (val & LSI_ISTAT0_SRST) {
-            qdev_reset_all(DEVICE(s));
+            device_cold_reset(DEVICE(s));
         }
         break;
     case 0x16: /* MBOX0 */
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 7082456d65..9cbbb16121 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1484,7 +1484,7 @@ static int megasas_cluster_reset_ld(MegasasState *s, MegasasCmd *cmd)
         MegasasCmd *tmp_cmd = &s->frames[i];
         if (tmp_cmd->req && tmp_cmd->req->dev->id == target_id) {
             SCSIDevice *d = tmp_cmd->req->dev;
-            qdev_reset_all(&d->qdev);
+            device_cold_reset(&d->qdev);
         }
     }
     return MFI_STAT_OK;
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index a90c2546f1..c485da792c 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -522,7 +522,7 @@ reply_maybe_async:
             reply.ResponseCode = MPI_SCSITASKMGMT_RSP_TM_INVALID_LUN;
             goto out;
         }
-        qdev_reset_all(&sdev->qdev);
+        device_cold_reset(&sdev->qdev);
         break;
 
     case MPI_SCSITASKMGMT_TASKTYPE_TARGET_RESET:
@@ -538,13 +538,13 @@ reply_maybe_async:
         QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
             sdev = SCSI_DEVICE(kid->child);
             if (sdev->channel == 0 && sdev->id == req->TargetID) {
-                qdev_reset_all(kid->child);
+                device_cold_reset(kid->child);
             }
         }
         break;
 
     case MPI_SCSITASKMGMT_TASKTYPE_RESET_BUS:
-        qbus_reset_all(BUS(&s->bus));
+        bus_cold_reset(BUS(&s->bus));
         break;
 
     default:
@@ -807,7 +807,7 @@ static void mptsas_soft_reset(MPTSASState *s)
     s->intr_mask = MPI_HIM_DIM | MPI_HIM_RIM;
     mptsas_update_interrupt(s);
 
-    qbus_reset_all(BUS(&s->bus));
+    bus_cold_reset(BUS(&s->bus));
     s->intr_status = 0;
     s->intr_mask = save_mask;
 
diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index 0a8cbf5a4b..5bbbef64ef 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -865,7 +865,7 @@ static int vscsi_process_tsk_mgmt(VSCSIState *s, vscsi_req *req)
                 break;
             }
 
-            qdev_reset_all(&d->qdev);
+            device_cold_reset(&d->qdev);
             break;
 
         case SRP_TSK_ABORT_TASK_SET:
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index cf2721aa46..6f6e2e32ba 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -365,7 +365,7 @@ static int virtio_scsi_do_tmf(VirtIOSCSI *s, VirtIOSCSIReq *req)
             goto incorrect_lun;
         }
         s->resetting++;
-        qdev_reset_all(&d->qdev);
+        device_cold_reset(&d->qdev);
         s->resetting--;
         break;
 
@@ -417,7 +417,7 @@ static int virtio_scsi_do_tmf(VirtIOSCSI *s, VirtIOSCSIReq *req)
         QTAILQ_FOREACH_RCU(kid, &s->bus.qbus.children, sibling) {
             SCSIDevice *d1 = SCSI_DEVICE(kid->child);
             if (d1->channel == 0 && d1->id == target) {
-                qdev_reset_all(&d1->qdev);
+                device_cold_reset(&d1->qdev);
             }
         }
         rcu_read_unlock();
@@ -831,7 +831,7 @@ static void virtio_scsi_reset(VirtIODevice *vdev)
 
     assert(!s->dataplane_started);
     s->resetting++;
-    qbus_reset_all(BUS(&s->bus));
+    bus_cold_reset(BUS(&s->bus));
     s->resetting--;
 
     vs->sense_size = VIRTIO_SCSI_SENSE_DEFAULT_SIZE;
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 91e2f858ab..3ea2c8c9f2 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -445,7 +445,7 @@ static void
 pvscsi_reset_adapter(PVSCSIState *s)
 {
     s->resetting++;
-    qbus_reset_all(BUS(&s->bus));
+    bus_cold_reset(BUS(&s->bus));
     s->resetting--;
     pvscsi_process_completion_queue(s);
     assert(QTAILQ_EMPTY(&s->pending_queue));
@@ -894,7 +894,7 @@ pvscsi_on_cmd_reset_bus(PVSCSIState *s)
     trace_pvscsi_on_cmd_arrived("PVSCSI_CMD_RESET_BUS");
 
     s->resetting++;
-    qbus_reset_all(BUS(&s->bus));
+    bus_cold_reset(BUS(&s->bus));
     s->resetting--;
     return PVSCSI_COMMAND_PROCESSING_SUCCEEDED;
 }
-- 
2.37.3


