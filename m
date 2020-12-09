Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3ED2D49C8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:07:55 +0100 (CET)
Received: from localhost ([::1]:55666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4oc-00030E-Hw
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vA-0004UL-CV
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3v4-0000Gb-A1
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzVoIxs6E5ptAqHbJl78aZsMpj56N2mlPns6mKQv8Vo=;
 b=b9kgOifEvpNTpLyEDARek91LxllfqT4U4Ae7NR9JyIN+rpeJLF7FxM4yvZZp84TDMjt4xU
 /uMbLtt77iS8VPGuo554YSWorca3mrDq23XSkbBRQwxbSbcCVJv5IFDu7l6ikq5x1ehCud
 cP67mjtVEBtKBRaBVKwJP77GsFN655o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-wlevd-3XOFmDcCGh2RmJgw-1; Wed, 09 Dec 2020 13:10:26 -0500
X-MC-Unique: wlevd-3XOFmDcCGh2RmJgw-1
Received: by mail-wr1-f70.google.com with SMTP id d2so962024wrr.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CzVoIxs6E5ptAqHbJl78aZsMpj56N2mlPns6mKQv8Vo=;
 b=A759yHTNrAV6vMNaspttvlvN5CrrImUp+A4k3yTMj0rAwQYjgb0UQ9Sk/GyvyYT6Ds
 E1XzLwqB2VT9kCWVbeEdD6PaOBQ3DUQITgZKF7qnA0RiR8VWhr/EJp9pxDFiB8GmjyKs
 ZzLQJMEkUYUpiy2HlQVeWH7hBkExLCOWzPs6+gissULdC1ti7niDz91LSMgvMm9vH4m+
 CCYobGUXA7264WxVLQn++OieYdVFlIZN2ittDzY2fKEbD6HhokCd0rrFPNeRunc10MNU
 Apj+5uHHytOiNRPUJZ4Jpu2GRdMHlawCTPGQFpAzkvRJkOb4TdN12Lrs0VHzRSxU72BJ
 tjNg==
X-Gm-Message-State: AOAM533vX2H4vrREvQq5VsvXB4Of4yxczJ8aHXx4C5xFOUvK9L/xN/ie
 xczTmWCYC9+tRbeEXbWfMYgB93rl0+ubfYGzARKgyYRr/G2tk9uk3L23lPc9+kVIcFNbXje1DOe
 y+0HaDbe36ou9otvwSxiLIst1bDzr6Z0cvHF/vCY372IMMBmZFNX46e51ScMj
X-Received: by 2002:adf:ba91:: with SMTP id p17mr4050567wrg.328.1607537425147; 
 Wed, 09 Dec 2020 10:10:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjAV5+F4dn91fGd3gM/kKUvMIwO+1OgjMfh5gnyiJgoCaehjYvJLcJ5LLyO33xUJ8YZ+bK0g==
X-Received: by 2002:adf:ba91:: with SMTP id p17mr4050550wrg.328.1607537424983; 
 Wed, 09 Dec 2020 10:10:24 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id z8sm4853188wmg.17.2020.12.09.10.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:10:24 -0800 (PST)
Date: Wed, 9 Dec 2020 13:10:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 49/65] libvhost-user: add a simple link test without glib
Message-ID: <20201209180546.721296-50-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201125100640.366523-8-marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 subprojects/libvhost-user/link-test.c | 45 +++++++++++++++++++++++++++
 subprojects/libvhost-user/meson.build |  4 +++
 2 files changed, 49 insertions(+)
 create mode 100644 subprojects/libvhost-user/link-test.c

diff --git a/subprojects/libvhost-user/link-test.c b/subprojects/libvhost-user/link-test.c
new file mode 100644
index 0000000000..e01d6eb1fa
--- /dev/null
+++ b/subprojects/libvhost-user/link-test.c
@@ -0,0 +1,45 @@
+/*
+ * A trivial unit test to check linking without glib. A real test suite should
+ * probably based off libvhost-user-glib instead.
+ */
+#include <assert.h>
+#include <stdlib.h>
+#include "libvhost-user.h"
+
+static void
+panic(VuDev *dev, const char *err)
+{
+    abort();
+}
+
+static void
+set_watch(VuDev *dev, int fd, int condition,
+          vu_watch_cb cb, void *data)
+{
+    abort();
+}
+
+static void
+remove_watch(VuDev *dev, int fd)
+{
+    abort();
+}
+
+static const VuDevIface iface = {
+    0,
+};
+
+int
+main(int argc, const char *argv[])
+{
+    bool rc;
+    uint16_t max_queues = 2;
+    int socket = 0;
+    VuDev dev = { 0, };
+
+    rc = vu_init(&dev, max_queues, socket, panic, NULL, set_watch, remove_watch, &iface);
+    assert(rc == true);
+    vu_deinit(&dev);
+
+    return 0;
+}
diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-user/meson.build
index f9ecc534cf..c5d85c11d7 100644
--- a/subprojects/libvhost-user/meson.build
+++ b/subprojects/libvhost-user/meson.build
@@ -10,6 +10,10 @@ vhost_user = static_library('vhost-user',
                             include_directories: inc,
                             c_args: '-D_GNU_SOURCE')
 
+executable('link-test', files('link-test.c'),
+           link_whole: vhost_user,
+           include_directories: inc)
+
 vhost_user_glib = static_library('vhost-user-glib',
                                  files('libvhost-user-glib.c'),
                                  include_directories: inc,
-- 
MST


