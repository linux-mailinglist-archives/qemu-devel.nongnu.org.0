Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0F948E532
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 09:05:58 +0100 (CET)
Received: from localhost ([::1]:58778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Hav-0000lq-4k
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 03:05:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GV6-0007mc-3B
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUr-0007Wc-TR
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tMOuOZ+W0IRJxzU38kZeygoJ83D8IOaSpaQpWx+J+4=;
 b=azkI5FLC5mZvw9weMqolJ0FnTT1lb2GfZ4JhpAbsT7QDkvyDm9EgsRG1+wzYDWTzl9C4DE
 0VbDT6HlNUiYroQ2lFbiJUdKaekmlNTurSHELn9PjfuuiQgeS7U9Dh4xrM7LjCNXNMOVhV
 6mqlJ91ZBoF5ecndnMHhVzZw+ecokmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-cjZRgu1sMje7pVAGV12wCg-1; Fri, 14 Jan 2022 01:55:25 -0500
X-MC-Unique: cjZRgu1sMje7pVAGV12wCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C615E64141;
 Fri, 14 Jan 2022 06:55:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AC204699B;
 Fri, 14 Jan 2022 06:55:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3C865180084A; Fri, 14 Jan 2022 07:53:27 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/20] edid: set default resolution to 1280x800 (WXGA)
Date: Fri, 14 Jan 2022 07:53:20 +0100
Message-Id: <20220114065326.782420-15-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Currently QEMU defaults to a resolution of 1024x768 when exposing EDID
info to the guest OS. The EDID default info is important as this will
influence what resolution many guest OS will configure the screen with
on boot. It can also potentially influence what resolution the firmware
will configure the screen with, though until very recently EDK2 would
not handle EDID info.

One important thing to bear in mind is that the default graphics card
driver provided by Windows will leave the display set to whatever
resolution was enabled by the firmware on boot. Even if sufficient
VRAM is available, the resolution can't be changed without installing
new drivers. IOW, the default resolution choice is quite important
for usability of Windows.

Modern real world monitor hardware for desktop/laptop has supported
resolutions higher than 1024x768 for a long time now, perhaps as long
as 15+ years. There are quite a wide variety of native resolutions in
use today, however, and in wide screen form factors the height may not
be all that tall.

None the less, it is considered that there is scope for making the
QEMU default resolution slightly larger.

In considering what possible new default could be suitable, choices
considered were 1280x720 (720p), 1280x800 (WXGA) and 1280x1024 (SXGA).

In many ways, vertical space is the most important, and so 720p was
discarded due to loosing vertical space, despite being 25% wider.

The SXGA resolution would be good, but when taking into account
window titlebars/toolbars and window manager desktop UI, this might
be a little too tall for some users to fit the guest on their physical
montior.

This patch thus suggests a modest change to 1280x800 (WXGA). This
only consumes 1 MB per colour channel, allowing double buffered
framebuffer in 8 MB of VRAM. Width wise this is 25% larger than
QEMU's current default, but height wise this only adds 5%, so the
difference isn't massive on the QEMU side.

Overall there doesn't appear to be a compelling reason to stick
with 1024x768 resolution.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20211129140508.1745130-1-berrange@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h | 4 ++--
 hw/display/edid-generate.c     | 4 ++--
 qemu-edid.c                    | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index acfba7c76c10..2179b757037a 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -147,8 +147,8 @@ struct VirtIOGPUBaseClass {
     DEFINE_PROP_UINT32("max_outputs", _state, _conf.max_outputs, 1),    \
     DEFINE_PROP_BIT("edid", _state, _conf.flags, \
                     VIRTIO_GPU_FLAG_EDID_ENABLED, true), \
-    DEFINE_PROP_UINT32("xres", _state, _conf.xres, 1024), \
-    DEFINE_PROP_UINT32("yres", _state, _conf.yres, 768)
+    DEFINE_PROP_UINT32("xres", _state, _conf.xres, 1280), \
+    DEFINE_PROP_UINT32("yres", _state, _conf.yres, 800)
 
 typedef struct VGPUDMABuf {
     QemuDmaBuf buf;
diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index f2b874d5e358..6f5ac6a38ad8 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -401,10 +401,10 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
         info->name = "QEMU Monitor";
     }
     if (!info->prefx) {
-        info->prefx = 1024;
+        info->prefx = 1280;
     }
     if (!info->prefy) {
-        info->prefy = 768;
+        info->prefy = 800;
     }
     if (info->prefx >= 4096 || info->prefy >= 4096) {
         large_screen = 1;
diff --git a/qemu-edid.c b/qemu-edid.c
index c3a9fba10dc4..20c958d9c7eb 100644
--- a/qemu-edid.c
+++ b/qemu-edid.c
@@ -10,8 +10,8 @@
 #include "hw/display/edid.h"
 
 static qemu_edid_info info = {
-    .prefx = 1024,
-    .prefy = 768,
+    .prefx = 1280,
+    .prefy = 800,
 };
 
 static void usage(FILE *out)
-- 
2.34.1


