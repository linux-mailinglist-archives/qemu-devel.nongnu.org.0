Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC13A70AFF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 23:05:39 +0200 (CEST)
Received: from localhost ([::1]:37710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpfV4-0001WQ-Ll
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 17:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51707)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hpfUr-000188-KR
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 17:05:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hpfUq-0001yh-Cb
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 17:05:25 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36411)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hpfUq-0001y0-4M
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 17:05:24 -0400
Received: by mail-wr1-x430.google.com with SMTP id n4so40912597wrs.3
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2019 14:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94m98zJwRs1ARbASN6bBc7n1f1hsdvBpDpKlGgoy9QI=;
 b=gCk1Zlu3cWZfpjhsTB2RbItqptsAao4sPHiWOmQwDlonVAv9/MVLpj0nVLlvoH2R6e
 22KWG5CNUWfEOfhbdVrSAihbOtyh1FXfpyrYwy8wOe32j2fLX4bNb2exnR49Tw09istk
 6TPKDZnGBTqqhyDbLLJNjQCR/TF19qHoq/3HyAwlofJQNB2AAk7rHXBcUsG4slpzsOCF
 +pqGRNxmeIwI0IjM/LEIPvtRS7p4/PGem4qmlwLRAyr4PVpRc78MaWFfraLvalJ/EuB9
 whYIj/7PlFlPaQ+LWemazrtxIJ44gh1ofKyW+wRzpBLfZ8vTh8yi5u5ZHM4pE3P+/VPa
 CEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=94m98zJwRs1ARbASN6bBc7n1f1hsdvBpDpKlGgoy9QI=;
 b=Mx8zHQYZSTEj4Ha07Vz+DbT1p75jjoMcglgTSyBsBsDjtfeTGVIzbCTP5gnU8TaZS/
 KLi7MnE575/6PjFc5trVt+p0KwOiVBvrzvqSjKVVAzVFnoCbEElyzUYrDnmL3WY36NCu
 MDYUzToWpiQy2vKMvdVtfVZQl94ro5Cnsgv2oDJDLT9hCcilqYZ0/cuA7LSsJf3r7kuT
 0bDGNj1I+cdGziZf/7f2BcpsDa34uiXnLB2a3hoaMnOcz53HCifTwtP96ZjGQboqNRPC
 oUFsnBALkP4kQYGqN3PwAXfhORjzjCYiIDaJPZ2+uksyZ/0ez9FXlz+g5g2JHTIWpwjQ
 /32A==
X-Gm-Message-State: APjAAAV0zOv6Wwt6VlxzCCylGm82Ikh1CESuSzoWz/oFPB0YqFtlTI/Y
 6isAJSV+UqknZqTIFmSneDRcNprdXtQ=
X-Google-Smtp-Source: APXvYqwMpDtyIsFrz5QpxjeI2CCZBoBNg39yqeqNu6mm/wtm4DIaq/1abdlmMNrC6IxyCF0qUL3BOg==
X-Received: by 2002:a5d:5452:: with SMTP id w18mr37085372wrv.327.1563829522533; 
 Mon, 22 Jul 2019 14:05:22 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n2sm27842565wmi.38.2019.07.22.14.05.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 14:05:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jul 2019 23:05:20 +0200
Message-Id: <1563829520-17525-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::430
Subject: [Qemu-devel] [PATCH v2] virtio-scsi: fixed virtio_scsi_ctx_check
 failed when detaching scsi disk
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
Cc: Zhengui li <lizhengui@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhengui li <lizhengui@huawei.com>

commit a6f230c move blockbackend back to main AioContext on unplug. It set the AioContext of
SCSIDevice to the main AioContex, but s->ctx is still the iothread AioContexï¼ˆif the scsi controller
is configure with iothreadï¼‰. So if there are having in-flight requests during unplug, a failing assertion
happend. The bt is below:
(gdb) bt
#0  0x0000ffff86aacbd0 in raise () from /lib64/libc.so.6
#1  0x0000ffff86aadf7c in abort () from /lib64/libc.so.6
#2  0x0000ffff86aa6124 in __assert_fail_base () from /lib64/libc.so.6
#3  0x0000ffff86aa61a4 in __assert_fail () from /lib64/libc.so.6
#4  0x0000000000529118 in virtio_scsi_ctx_check (d=<optimized out>, s=<optimized out>, s=<optimized out>) at /home/qemu-4.0.0/hw/scsi/virtio-scsi.c:246
#5  0x0000000000529ec4 in virtio_scsi_handle_cmd_req_prepare (s=0x2779ec00, req=0xffff740397d0) at /home/qemu-4.0.0/hw/scsi/virtio-scsi.c:559
#6  0x000000000052a228 in virtio_scsi_handle_cmd_vq (s=0x2779ec00, vq=0xffff7c6d7110) at /home/qemu-4.0.0/hw/scsi/virtio-scsi.c:603
#7  0x000000000052afa8 in virtio_scsi_data_plane_handle_cmd (vdev=<optimized out>, vq=0xffff7c6d7110) at /home/qemu-4.0.0/hw/scsi/virtio-scsi-dataplane.c:59
#8  0x000000000054d94c in virtio_queue_host_notifier_aio_poll (opaque=<optimized out>) at /home/qemu-4.0.0/hw/virtio/virtio.c:2452

assert(blk_get_aio_context(d->conf.blk) == s->ctx) failed.

To avoid assertion failed,  moving the "if" after qdev_simple_device_unplug_cb.

In addition, to avoid another qemu crash below, add aio_disable_external before
qdev_simple_device_unplug_cb, which disable the further processing of external clients
when doing qdev_simple_device_unplug_cb.
(gdb) bt
#0  scsi_req_unref (req=0xffff6802c6f0) at hw/scsi/scsi-bus.c:1283
#1  0x00000000005294a4 in virtio_scsi_handle_cmd_req_submit (req=<optimized out>,
    s=<optimized out>) at /home/qemu-4.0.0/hw/scsi/virtio-scsi.c:589
#2  0x000000000052a2a8 in virtio_scsi_handle_cmd_vq (s=s@entry=0x9c90e90,
    vq=vq@entry=0xffff7c05f110) at /home/qemu-4.0.0/hw/scsi/virtio-scsi.c:625
#3  0x000000000052afd8 in virtio_scsi_data_plane_handle_cmd (vdev=<optimized out>,
    vq=0xffff7c05f110) at /home/qemu-4.0.0/hw/scsi/virtio-scsi-dataplane.c:60
#4  0x000000000054d97c in virtio_queue_host_notifier_aio_poll (opaque=<optimized out>)
    at /home/qemu-4.0.0/hw/virtio/virtio.c:2447
#5  0x00000000009b204c in run_poll_handlers_once (ctx=ctx@entry=0x6efea40,
    timeout=timeout@entry=0xffff7d7f7308) at util/aio-posix.c:521
#6  0x00000000009b2b64 in run_poll_handlers (ctx=ctx@entry=0x6efea40,
    max_ns=max_ns@entry=4000, timeout=timeout@entry=0xffff7d7f7308) at util/aio-posix.c:559
#7  0x00000000009b2ca0 in try_poll_mode (ctx=ctx@entry=0x6efea40, timeout=0xffff7d7f7308,
    timeout@entry=0xffff7d7f7348) at util/aio-posix.c:594
#8  0x00000000009b31b8 in aio_poll (ctx=0x6efea40, blocking=blocking@entry=true)
    at util/aio-posix.c:636
#9  0x00000000006973cc in iothread_run (opaque=0x6ebd800) at iothread.c:75
#10 0x00000000009b592c in qemu_thread_start (args=0x6efef60) at util/qemu-thread-posix.c:502
#11 0x0000ffff8057f8bc in start_thread () from /lib64/libpthread.so.0
#12 0x0000ffff804e5f8c in thread_start () from /lib64/libc.so.6
(gdb) p bus
$1 = (SCSIBus *) 0x0

Signed-off-by: Zhengui li <lizhengui@huawei.com>
Message-Id: <1563696502-7972-1-git-send-email-lizhengui@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/virtio-scsi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index d0bdbff..8b9e5e2 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -832,6 +832,7 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     VirtIODevice *vdev = VIRTIO_DEVICE(hotplug_dev);
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
     SCSIDevice *sd = SCSI_DEVICE(dev);
+    AioContext *ctx = s->ctx ?: qemu_get_aio_context();
 
     if (virtio_vdev_has_feature(vdev, VIRTIO_SCSI_F_HOTPLUG)) {
         virtio_scsi_acquire(s);
@@ -841,14 +842,16 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
         virtio_scsi_release(s);
     }
 
+    aio_disable_external(ctx);
+    qdev_simple_device_unplug_cb(hotplug_dev, dev, errp);
+    aio_enable_external(ctx);
+
     if (s->ctx) {
         virtio_scsi_acquire(s);
         /* If other users keep the BlockBackend in the iothread, that's ok */
         blk_set_aio_context(sd->conf.blk, qemu_get_aio_context(), NULL);
         virtio_scsi_release(s);
     }
-
-    qdev_simple_device_unplug_cb(hotplug_dev, dev, errp);
 }
 
 static struct SCSIBusInfo virtio_scsi_scsi_info = {
-- 
1.8.3.1


