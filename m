Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80842341B66
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:25:35 +0100 (CET)
Received: from localhost ([::1]:56180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDG2-0004lJ-I0
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lNDCb-0008Hq-E2
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:22:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lNDCZ-0007fQ-Rt
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616152919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=duCwyNlglNcqemTVpMO0z8NLXL7nnvuZpAoGomh3gjc=;
 b=VPTd/ha867KxYYw3Mh5hIpMJfeTpicbtkMtxUh0lVYa4gXIrFy8CjUtQQO78AzSrbqi+su
 6UKZbInkLYlLDOKcTunXWWtYM8jRRH1tdRqOEffcH76BlUvUtZPXZMshpTauZo2/8j6zv5
 TUGYXQx4t8VKZnN8d4XYaSXLQnaPjho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-bd6aBQNpPWSunRq0qXC0CA-1; Fri, 19 Mar 2021 07:21:56 -0400
X-MC-Unique: bd6aBQNpPWSunRq0qXC0CA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C15F410866A5;
 Fri, 19 Mar 2021 11:21:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31E3B19C79;
 Fri, 19 Mar 2021 11:21:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BE6AF180039F; Fri, 19 Mar 2021 12:21:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/15] virtio-gpu: rename virgl source file.
Date: Fri, 19 Mar 2021 12:21:33 +0100
Message-Id: <20210319112147.4138943-2-kraxel@redhat.com>
In-Reply-To: <20210319112147.4138943-1-kraxel@redhat.com>
References: <20210319112147.4138943-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 vivek.kasireddy@intel.com, tina.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"3d" -> "virgl" as 3d is a rather broad term.
Hopefully a bit less confusing.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/{virtio-gpu-3d.c => virtio-gpu-virgl.c} | 0
 hw/display/meson.build                             | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/display/{virtio-gpu-3d.c => virtio-gpu-virgl.c} (100%)

diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-virgl.c
similarity index 100%
rename from hw/display/virtio-gpu-3d.c
rename to hw/display/virtio-gpu-virgl.c
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 9d79e3951d9e..8e465731b85b 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -58,7 +58,7 @@ if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_ss.add(when: 'CONFIG_VIRTIO_GPU',
                     if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c'), pixman, virgl])
   virtio_gpu_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRGL'],
-                    if_true: [files('virtio-gpu-3d.c'), pixman, virgl])
+                    if_true: [files('virtio-gpu-virgl.c'), pixman, virgl])
   virtio_gpu_ss.add(when: 'CONFIG_VHOST_USER_GPU', if_true: files('vhost-user-gpu.c'))
   hw_display_modules += {'virtio-gpu': virtio_gpu_ss}
 endif
-- 
2.30.2


