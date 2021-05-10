Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38830378CD7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:34:24 +0200 (CEST)
Received: from localhost ([::1]:53748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg63D-0007WF-7W
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5ry-0006Ko-7b
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:22:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5ru-0003Jv-3h
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:22:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620652961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+agGH9DkicbJ1amV2HqTac4s5Q+77K5YmVVjUqFTA7s=;
 b=hq6TJMOh5gvaWLYMr/YBy27HS3/4uO7nArhoeqg8RX9PGhhdbvf31agpSPPxP2up9oHH3E
 Out9nDLotZFXnCkI2hRG5mn07bSLxOXjFe1p/umUEYCurMhmeiatt4fJSg12SrqalAGTZu
 fgnMI7xfXws8vTldiNw6CmnZmjoFTZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-KH1-lxajOIaKxTQ9JXB8YQ-1; Mon, 10 May 2021 09:22:38 -0400
X-MC-Unique: KH1-lxajOIaKxTQ9JXB8YQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3175803622
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:22:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E6662B166;
 Mon, 10 May 2021 13:22:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 236D5180087E; Mon, 10 May 2021 15:20:52 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/25] virtio-gpu: drop VIRGL() macro
Date: Mon, 10 May 2021 15:20:45 +0200
Message-Id: <20210510132051.2208563-20-kraxel@redhat.com>
In-Reply-To: <20210510132051.2208563-1-kraxel@redhat.com>
References: <20210510132051.2208563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drops last virgl/opengl dependency from virtio-gpu-device.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210430113547.1816178-1-kraxel@redhat.com
Message-Id: <20210430113547.1816178-11-kraxel@redhat.com>
---
 hw/display/virtio-gpu.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 921a8212a7aa..db56f0454a8a 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -39,23 +39,6 @@ virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
 static void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
                                        struct virtio_gpu_simple_resource *res);
 
-#ifdef CONFIG_VIRGL
-#include <virglrenderer.h>
-#define VIRGL(_g, _virgl, _simple, ...)                     \
-    do {                                                    \
-        if (_g->parent_obj.use_virgl_renderer) {            \
-            _virgl(__VA_ARGS__);                            \
-        } else {                                            \
-            _simple(__VA_ARGS__);                           \
-        }                                                   \
-    } while (0)
-#else
-#define VIRGL(_g, _virgl, _simple, ...)                 \
-    do {                                                \
-        _simple(__VA_ARGS__);                           \
-    } while (0)
-#endif
-
 void virtio_gpu_update_cursor_data(VirtIOGPU *g,
                                    struct virtio_gpu_scanout *s,
                                    uint32_t resource_id)
-- 
2.31.1


