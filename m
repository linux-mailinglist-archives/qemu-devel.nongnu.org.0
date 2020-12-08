Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5612D3308
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:15:32 +0100 (CET)
Received: from localhost ([::1]:46998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjOV-0005yL-Iv
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:15:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminA-0007MO-Ii
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:36:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmin8-0005lW-HA
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:36:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B+6W9Mb9rZ+usz8UfiPZvbML2zO+iX6F0+pPim0euZE=;
 b=UGLlwKokhYvI7RNglwD9zz+KGmWhu0UCyX6BgA7QOO57X6p65xmCSoF6Wy5sfIPB+r6FwA
 ozDgOuXvrt6W1rFLcqT0U0odCusRpWHdyuIQso44qKDynX+W4aVHwKuG1lgYmJAbGXPSUS
 0HwDDpMJ3FFWU0vwhFSKKcOa1bSDJSM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-odSgHrXaMIej9oPj8EGMsQ-1; Tue, 08 Dec 2020 14:36:50 -0500
X-MC-Unique: odSgHrXaMIej9oPj8EGMsQ-1
Received: by mail-wr1-f69.google.com with SMTP id q18so1162212wrc.20
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=B+6W9Mb9rZ+usz8UfiPZvbML2zO+iX6F0+pPim0euZE=;
 b=Hkr+Axk4d5jE3opfMvtF3on9b/hwH3YMcfenGynwNdf2VFj4iiMqnuAR185DLJpX+b
 i1dVIolA4JnLIi0iFW0DEwme07DtgTza28bHzbnFAHFmlDX533oVPO3RXAG05JhyySR+
 +0birKdoWoneRTGuSHx5ULKHvg6qg3J5xvIOe+cHK8NIlfOpBGy5MjDlQhFjGxVVvXlK
 I6PA2rE/7nfBeat+Sk70ogA6S+BI/VI+Kj4hsWEgZqRdr1jIeHufJ0IqhIBsC7kFC3rl
 VOe5jOLVnsD6QfiZp3ni6JxVC8B0jhkUaayMMBLZqxThgOMBuZr4FS1OEwPPxI+JBLm3
 HJLA==
X-Gm-Message-State: AOAM5332zzzaitSTARuHVSfAaewiMy8sdel/Sd8ESDKruNAou/hCtOhi
 xylsxbHEt2pxC7j/mnfUehyEm47x+Cn3yIil3ABVwVNBzUHEsjZTcMA3c/ssoNFGeNTkVHIB8+t
 jsEi8HSlBxH1xzzeplMO3CYPhmXZkfxZz00kab/OhXZENQocf49uOfU2AvF72
X-Received: by 2002:adf:bb89:: with SMTP id q9mr9381362wrg.250.1607456209498; 
 Tue, 08 Dec 2020 11:36:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuc8YAvmWnIcZ0d7IVUuFZr4XeCnEVcFVqIBXDhU9J/82SYxqrV2Ia00qpHQO+q0MAOM3MvQ==
X-Received: by 2002:adf:bb89:: with SMTP id q9mr9381345wrg.250.1607456209324; 
 Tue, 08 Dec 2020 11:36:49 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id q25sm6232392wmq.37.2020.12.08.11.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:36:48 -0800 (PST)
Date: Tue, 8 Dec 2020 14:36:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 50/66] libvhost-user: add a simple link test without glib
Message-ID: <20201208193307.646726-51-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
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
index ac228b5ba6..76e83c0cec 100644
--- a/subprojects/libvhost-user/meson.build
+++ b/subprojects/libvhost-user/meson.build
@@ -22,6 +22,10 @@ vhost_user = static_library('vhost-user',
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


