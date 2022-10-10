Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B595FA2E1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:46:33 +0200 (CEST)
Received: from localhost ([::1]:33068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohwrI-0006I3-0B
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwaW-0008KB-DN
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwaT-0006T5-59
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/FuzALXECHqoocD8Ass+d81bVkCF0EOizPDi9GCy9zk=;
 b=O6F4GQ2z3ofTdKl+KqdIIhznfqYvr4I96SgMOP85wax8/uceb7K38WXHwncqsRt+zTOuJo
 YdyUuvEAzJW4dju/cMkQ6krGRufiTjypjzBCHF7n5cg+h0yBDKbPps2tRxiVqLi/vUbru4
 j9Bu3WoSulbbiXTQpSorv8z2GmbQ20Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-389-y-5j2JHJO-21mHZSYQimMw-1; Mon, 10 Oct 2022 13:29:07 -0400
X-MC-Unique: y-5j2JHJO-21mHZSYQimMw-1
Received: by mail-wm1-f72.google.com with SMTP id
 c130-20020a1c3588000000b003b56be513e1so7308223wma.0
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/FuzALXECHqoocD8Ass+d81bVkCF0EOizPDi9GCy9zk=;
 b=AxRfgi5KlokJaV4FBe/Ydhu+V6KnZK2hJ3Wv6rgMKqyaPfba0RDEQux0G/qfFZE732
 5KKuD6nj7RqvMV3x2sAvlO2DDBqwXYpNSUOLnmOnebq8rxEmshQlazvWD+YedwRh8Anr
 8tVXUlyo/mje35TOSLRh9zDKiCDYOtSkJ1UP9oqgFRYzoeXz8me545Vp6itBghf3jBCQ
 tY6V6unUXNmwKb/wUUVohBnt67WLZUAx9uncYLWkDikzxkFFP61aUC+D/mkvvGw4Rfrs
 /K+rJTd+Gmq/goBJ4GpVClHdadpsPMU7ENIeQAOxiyHV+w5b4FtmakD/zEO90rd9AHZL
 I6Xg==
X-Gm-Message-State: ACrzQf2yJAhOMZI1VwDrtlSy5ZYDqoVduYRc1yRV+PwXEbIRwT7yOXK9
 oPTDr/FiUFD+V/ERXf7lGNTYwcK5LEbkavCZoilD2lTBLI1pTxo5M7qLSF5oiTL5IcEM/w+VrXY
 8Ph+/eGAnFXmw2a2YWkPJADrpuNbBphERYSEs5CJMFglEYWljZLgkf+QIZfCD
X-Received: by 2002:a05:600c:4849:b0:3c6:7e82:a9d7 with SMTP id
 j9-20020a05600c484900b003c67e82a9d7mr4905679wmo.75.1665422946018; 
 Mon, 10 Oct 2022 10:29:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4CnDnU48/qokkoIkfnfU/t+9WfmXCGQ5WjyTs1Zb5iqXyXgbn13ko3/LE+eoUH1gromqYCcQ==
X-Received: by 2002:a05:600c:4849:b0:3c6:7e82:a9d7 with SMTP id
 j9-20020a05600c484900b003c67e82a9d7mr4905662wmo.75.1665422945641; 
 Mon, 10 Oct 2022 10:29:05 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 bv10-20020a0560001f0a00b00228fa832b7asm9286506wrb.52.2022.10.10.10.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:29:05 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:29:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 06/55] hw/virtio: add some vhost-user trace events
Message-ID: <20221010172813.204597-7-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Alex Bennée <alex.bennee@linaro.org>

These are useful for tracing the lifetime of vhost-user connections.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220802095010.3330793-10-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/virtio/vhost.c      | 6 ++++++
 hw/virtio/trace-events | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index f758f177bb..5185c15295 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1477,6 +1477,8 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
 {
     int i;
 
+    trace_vhost_dev_cleanup(hdev);
+
     for (i = 0; i < hdev->nvqs; ++i) {
         vhost_virtqueue_cleanup(hdev->vqs + i);
     }
@@ -1783,6 +1785,8 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
 
+    trace_vhost_dev_start(hdev, vdev->name);
+
     vdev->vhost_started = true;
     hdev->started = true;
     hdev->vdev = vdev;
@@ -1869,6 +1873,8 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
 
+    trace_vhost_dev_stop(hdev, vdev->name);
+
     if (hdev->vhost_ops->vhost_dev_start) {
         hdev->vhost_ops->vhost_dev_start(hdev, false);
     }
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 20af2e7ebd..887ca7afa8 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -8,6 +8,10 @@ vhost_region_add_section_aligned(const char *name, uint64_t gpa, uint64_t size,
 vhost_section(const char *name) "%s"
 vhost_reject_section(const char *name, int d) "%s:%d"
 vhost_iotlb_miss(void *dev, int step) "%p step %d"
+vhost_dev_cleanup(void *dev) "%p"
+vhost_dev_start(void *dev, const char *name) "%p:%s"
+vhost_dev_stop(void *dev, const char *name) "%p:%s"
+
 
 # vhost-user.c
 vhost_user_postcopy_end_entry(void) ""
-- 
MST


