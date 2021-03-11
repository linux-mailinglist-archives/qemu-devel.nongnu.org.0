Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C103372CB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:37:31 +0100 (CET)
Received: from localhost ([::1]:43638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKZG-0006bU-TF
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKWB-0003f7-Ly
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKW5-0006Uc-Kn
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615466051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FPCr3e1ARcmuTN0U2o/fY9E5DXoAaP5pJ5sp8U5Mm40=;
 b=NRHYaIlErv/Qu5Q6VHTmbMCMKpfBMRf/PYmJM/yUV07N53ZRtEUak7BnPsHjbJJVnVfezw
 n9HxheDzQ7Hgv9kiGFLguPbZTyFdRg9xM3dVpuzK69Jant2eNkVrp1zPOGlUnWOpT8C5cL
 PNNggjSeipebXgSAyoxo/HXoqPFHSpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-h8d3TcsDPue9nUY34pgThA-1; Thu, 11 Mar 2021 07:34:09 -0500
X-MC-Unique: h8d3TcsDPue9nUY34pgThA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEED83E745;
 Thu, 11 Mar 2021 12:34:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 430071002393;
 Thu, 11 Mar 2021 12:34:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DA0DF1800910; Thu, 11 Mar 2021 13:34:01 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/8] ui/cocoa: Show QEMU icon in the about window
Date: Thu, 11 Mar 2021 13:33:57 +0100
Message-Id: <20210311123401.340122-5-kraxel@redhat.com>
In-Reply-To: <20210311123401.340122-1-kraxel@redhat.com>
References: <20210311123401.340122-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210309122226.23117-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 3e1a7b7d5195..e589534fa460 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -39,6 +39,7 @@
 #include "qapi/qapi-commands-misc.h"
 #include "sysemu/blockdev.h"
 #include "qemu-version.h"
+#include "qemu/cutils.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include <Carbon/Carbon.h>
@@ -1385,18 +1386,13 @@ QemuCocoaView *cocoaView;
     y = about_height - picture_height - 10;
     NSRect picture_rect = NSMakeRect(x, y, picture_width, picture_height);
 
-    /* Get the path to the QEMU binary */
-    NSString *binary_name = [NSString stringWithCString: gArgv[0]
-                                      encoding: NSASCIIStringEncoding];
-    binary_name = [binary_name lastPathComponent];
-    NSString *program_path = [[NSString alloc] initWithFormat: @"%@/%@",
-    [[NSBundle mainBundle] bundlePath], binary_name];
-
     /* Make the picture of QEMU */
     NSImageView *picture_view = [[NSImageView alloc] initWithFrame:
                                                      picture_rect];
-    NSImage *qemu_image = [[NSWorkspace sharedWorkspace] iconForFile:
-                                                         program_path];
+    char *qemu_image_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
+    NSString *qemu_image_path = [NSString stringWithUTF8String:qemu_image_path_c];
+    g_free(qemu_image_path_c);
+    NSImage *qemu_image = [[NSImage alloc] initWithContentsOfFile:qemu_image_path];
     [picture_view setImage: qemu_image];
     [picture_view setImageScaling: NSImageScaleProportionallyUpOrDown];
     [superView addSubview: picture_view];
-- 
2.29.2


