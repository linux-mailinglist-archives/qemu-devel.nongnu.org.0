Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BF336FA51
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:35:23 +0200 (CEST)
Received: from localhost ([::1]:57590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSMc-0002Pu-1H
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRRt-0000kT-1x
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRRo-0001Y8-St
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619782599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FqAYOsMnPWZx85KmwaW1n5DtDkhnNWnH1Jn/W4qaUiE=;
 b=DW82cLAC1fPax+2dPdmVS+GHFy321jJQ4Ey2jvFFbCKXcyUVlslFfqthfeJXHpHKLMWvif
 hyB8nd/abXCABpVqJHFaLg/t47K9mC4aBEAK9SRGlKXomhTPZGO0OIwak/4FT2PuADvPKJ
 4XBNEKEZbZBLOya2Uu8LhXYdoU9VKcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-BQ6fCX10OtaSWeZrqe2f7A-1; Fri, 30 Apr 2021 07:36:38 -0400
X-MC-Unique: BQ6fCX10OtaSWeZrqe2f7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1761F1922962;
 Fri, 30 Apr 2021 11:36:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A37CC1007607;
 Fri, 30 Apr 2021 11:36:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A25A71800796; Fri, 30 Apr 2021 13:35:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/16] virtio-gpu: drop VIRGL() macro
Date: Fri, 30 Apr 2021 13:35:41 +0200
Message-Id: <20210430113547.1816178-11-kraxel@redhat.com>
In-Reply-To: <20210430113547.1816178-1-kraxel@redhat.com>
References: <20210430113547.1816178-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, tina.zhang@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>, vivek.kasireddy@intel.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drops last virgl/opengl dependency from virtio-gpu-device.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/virtio-gpu.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 2c0065277ffd..34cf35127a3d 100644
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
2.30.2


