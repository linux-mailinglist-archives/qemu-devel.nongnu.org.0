Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 063712465E9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 14:03:55 +0200 (CEST)
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7drm-00006u-3s
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 08:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1k7dpT-0005UR-1Y
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 08:01:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48815
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1k7dpR-0003gH-4K
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 08:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597665688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BgMRfNw/dcdFf79MofA88RErXDiLIbDVlTg7mtSmZKA=;
 b=aYu9DAHZuKaZpBah0PmPqRHBdbBsIAQEDP8xts4nB5S581dryh368+i/DUffbXEPODkGr5
 hG8yyRM6JjoPltHZl1BVuYY5vgUuqH+CW4e+Z/f57Ij/ZINqIMjwbPbrcVbDaGYK2k+ZEi
 Z0PMdgjXh9usnwwtbnqDiCHCCWsQOVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-302T-YQYOPepqfsVcWfaOA-1; Mon, 17 Aug 2020 08:01:24 -0400
X-MC-Unique: 302T-YQYOPepqfsVcWfaOA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 891991005E61
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 12:01:23 +0000 (UTC)
Received: from localhost (unknown [10.36.110.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9671110023A5;
 Mon, 17 Aug 2020 12:01:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] virtio-gpu: set physical dimensions for EDID
Date: Mon, 17 Aug 2020 16:00:56 +0400
Message-Id: <20200817120056.56751-5-marcandre.lureau@redhat.com>
In-Reply-To: <20200817120056.56751-1-marcandre.lureau@redhat.com>
References: <20200817120056.56751-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 05:03:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/display/virtio-gpu-base.c   | 2 ++
 hw/display/virtio-gpu.c        | 2 ++
 include/hw/virtio/virtio-gpu.h | 1 +
 3 files changed, 5 insertions(+)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 7961308606..2fb8beb7da 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -82,6 +82,8 @@ static int virtio_gpu_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
     g->req_state[idx].y = info->yoff;
     g->req_state[idx].width = info->width;
     g->req_state[idx].height = info->height;
+    g->req_state[idx].width_mm = info->width_mm;
+    g->req_state[idx].height_mm = info->height_mm;
 
     if (info->width && info->height) {
         g->enabled_output_bitmask |= (1 << idx);
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 5f0dd7c150..28c390078a 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -212,6 +212,8 @@ virtio_gpu_generate_edid(VirtIOGPU *g, int scanout,
 {
     VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
     qemu_edid_info info = {
+        .width_mm = b->req_state[scanout].width_mm,
+        .height_mm = b->req_state[scanout].height_mm,
         .prefx = b->req_state[scanout].width,
         .prefy = b->req_state[scanout].height,
     };
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 6dd57f2025..3d1adc563c 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -65,6 +65,7 @@ struct virtio_gpu_scanout {
 };
 
 struct virtio_gpu_requested_state {
+    uint16_t width_mm, height_mm;
     uint32_t width, height;
     int x, y;
 };
-- 
2.26.2


