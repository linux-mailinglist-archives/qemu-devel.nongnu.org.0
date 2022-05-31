Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82D3538D60
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 11:01:59 +0200 (CEST)
Received: from localhost ([::1]:52092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvxlG-0000Sp-Nk
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 05:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nvxZ1-0005Km-FZ
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:49:19 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nvxYz-0001a0-Kr
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:49:19 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso1916329pjl.3
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 01:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kYutFlF/Z68SMPaZmWoK/7yR00+c6OZUb1aCcLf5aCs=;
 b=nTFp0Lrs0l1hxZMr18gRk1zzksRof/wZWxJxeKvoZbyRlZf29I3+co8SWPHiqWjcOW
 VK7S3v1Hli8qZg8Xk5IXGRyDLMqlD9j5SDAYP1aYIGAbJ6pJ6KyCG42bQ8swe74YvWT4
 DEtBFPb/1lMPJXQZUZyWUd5HVi/m68aSS35knVH/UpG46m6o62S/x9yC5uPLH3ydwAnp
 7Xp5wXvSari+ZqjyFvMJov2dW8jKXikH/UPMkND+Da+sBNUYmXaWe+UPJjlju2neQAsV
 3mv3WMMVQrauZJKS+vqNgqX8EQuEkIC52Vkb9EvPt6pWPskJDv9qOogKdniXRi5I/CSJ
 KYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kYutFlF/Z68SMPaZmWoK/7yR00+c6OZUb1aCcLf5aCs=;
 b=wmM6qOP5DkwdreDaJoEMgSwp09MuQfNbzxdMuZY64hNVD71yLrdTm/5segy92ZIk2I
 n8eEZIc4r0eCxLA+xB4PwarHsxEFJ1VEGjwam+JPAfCyuNkwjo1m04LIVf3ly28wyFQF
 VJ7CtZAcONF+0wo9eqsziSgccTaPpTGLeuPz2zGFJhmUlLtYI9SGeCUrFKpLnhWR2rXm
 jVk68Ximx25ICGZyntVAEnRdCEbSWykSSqXVonI3frlKukID/zrRwMCJGN5f9EUGJzJ9
 oqCePvLyEF5a6iCwixOyayQ3n4LJ4ruG0YvoI9iVRWbLTPpd4y5CiXWLjUeF5b8ayQnA
 uVdw==
X-Gm-Message-State: AOAM532XMBhGuz4njIERJtRhuN69ApxYsIVwGMLp3OJKN4iSA0FtRCu2
 /tJ24x3bNKXW6+UMTjPgyItA4tNda9RbPw==
X-Google-Smtp-Source: ABdhPJxUTvddpHb2A/dycCP5IUFT1LgteP0DCMxiLz51+7EM4UwhLHQPJA7icH2QkxlQ4U5OlXgRyA==
X-Received: by 2002:a17:902:f545:b0:163:d698:7f19 with SMTP id
 h5-20020a170902f54500b00163d6987f19mr10255772plf.119.1653986955933; 
 Tue, 31 May 2022 01:49:15 -0700 (PDT)
Received: from fedora.. ([101.206.169.117]) by smtp.gmail.com with ESMTPSA id
 i4-20020a655b84000000b003faf4acac63sm9850800pgr.13.2022.05.31.01.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 01:49:15 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v5] Use io_uring_register_ring_fd() to skip fd operations
Date: Tue, 31 May 2022 16:48:47 +0800
Message-Id: <20220531084847.85889-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Linux recently added a new io_uring(7) optimization API that QEMU
doesn't take advantage of yet. The liburing library that QEMU uses
has added a corresponding new API calling io_uring_register_ring_fd().
When this API is called after creating the ring, the io_uring_submit()
library function passes a flag to the io_uring_enter(2) syscall
allowing it to skip the ring file descriptor fdget()/fdput()
operations. This saves some CPU cycles.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/io_uring.c | 13 ++++++++++++-
 meson.build      |  1 +
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index 0b401512b9..4d691d8373 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -17,6 +17,9 @@
 #include "qemu/coroutine.h"
 #include "qapi/error.h"
 #include "trace.h"
+#ifdef CONFIG_LIBURING_REGISTER_RING_FD
+    io_uring_register_ring_fd(&s->ring);
+#endif
 
 /* io_uring ring size */
 #define MAX_ENTRIES 128
@@ -434,8 +437,16 @@ LuringState *luring_init(Error **errp)
     }
 
     ioq_init(&s->io_q);
-    return s;
+    if (io_uring_register_ring_fd(&s->ring) < 0) {
+        /*
+         * Only warn about this error: we will fallback to the non-optimized
+         * io_uring operations.
+         */
+        error_reportf_err(*errp,
+                          "failed to register linux io_uring ring file descriptor");
+    }
 
+    return s;
 }
 
 void luring_cleanup(LuringState *s)
diff --git a/meson.build b/meson.build
index 9ebc00f032..927e6ec1a4 100644
--- a/meson.build
+++ b/meson.build
@@ -1733,6 +1733,7 @@ config_host_data.set('CONFIG_LIBNFS', libnfs.found())
 config_host_data.set('CONFIG_LIBSSH', libssh.found())
 config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
 config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
+config_host_data.set('CONFIG_LIBURING_REGISTER_RING_FD', cc.has_function('io_uring_register_ring_fd', prefix: '#include <liburing.h>'))
 config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
 config_host_data.set('CONFIG_NUMA', numa.found())
 config_host_data.set('CONFIG_OPENGL', opengl.found())
-- 
2.35.3


