Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D84538FCE
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 13:25:46 +0200 (CEST)
Received: from localhost ([::1]:36048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw00P-0000MF-3u
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 07:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nvzT6-0001TU-Cs
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:51:22 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nvzT4-0005rD-Nn
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:51:20 -0400
Received: by mail-pf1-x42f.google.com with SMTP id z17so306427pff.7
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 03:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WXd7IseUjcKOiQu5akVggQkBFpKnXiYCwOPparFgzvM=;
 b=PRnE3rmIlovwuuJnA8eZ/ns1foi9w1YiWOjsC07qudNsS+ztXmL0jQrfML3xOpxGq6
 ibr/g5mgdlSgpDTX6SGXLQ8yhi2COibQwVd6UDPXf/YjlBiq2BPfYJZmH6vyvWSWDIzL
 LQlckzW7dkLrbO9x6hDy5AFShARiU/HdhgGY3sV9Yx/KplmM/ckoR7vVmzD7DG1dl5R1
 JjYWeoRynjCMzIfS7xCTT/hLaOo+oB1M8ibaqNTSzFq9Wma1ssRbdmWAT10OrUbOlsjW
 ZhLdpiM/JvovvAVdxloChTgQkhmcI9qeIkttklFVDZnPgGuGNn2Uy5JTcdeQNnDIAil8
 +V8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WXd7IseUjcKOiQu5akVggQkBFpKnXiYCwOPparFgzvM=;
 b=N/016DOkH5QKqDVnBUbJXj6nfSK9+ypwSknISPmbqlAu3BIAUm3P83Oo3M2kiAjSYF
 VaHnsMr+SVd8M3GuU2RE8kqC4XApL+OJ80LCXbqsoU3DJRidPKYMgdbFSpQBf5pErKSu
 vFoAOXLlK6hEZwSrVaCFx0I4DaiEtiMxOTde+3VBUfSppb9OXfkP1BxfS5WyBkLrGgSJ
 Pqmr8ASn+pZ8Po3bEk54u+xClhHrk+TMtwPeWWWEEEcyZQQGvq+h2lTBppmWWCkIupM5
 +OLhzLhNsM6xY87gDD2FBmqt/2ozojw0SbcDdfwkzyMklZM2FEOdmOwqRa32ZwCfDdvu
 vZfw==
X-Gm-Message-State: AOAM530Pcny98D8ncNXhMqVPs7MzancawG8ML7nW1o/aMo2c/g7AoNYm
 7phIyN6fteGDmseMEGRc93jtStyLmPBm1A==
X-Google-Smtp-Source: ABdhPJx5YSkgJhR82NG0nM20xDprwMvlhGvEamSUejCqu+UmO16RwsWbNueSPo2X5C2j71v5BKhxDw==
X-Received: by 2002:a65:6250:0:b0:3c6:8a09:249 with SMTP id
 q16-20020a656250000000b003c68a090249mr52578015pgv.389.1653994277012; 
 Tue, 31 May 2022 03:51:17 -0700 (PDT)
Received: from fedora.. ([101.206.169.117]) by smtp.gmail.com with ESMTPSA id
 mn1-20020a17090b188100b001e2f383110bsm1634080pjb.11.2022.05.31.03.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:51:16 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v6] Use io_uring_register_ring_fd() to skip fd operations
Date: Tue, 31 May 2022 18:50:11 +0800
Message-Id: <20220531105011.111082-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42f.google.com
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
 block/io_uring.c | 12 +++++++++++-
 meson.build      |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index 0b401512b9..d48e472e74 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -18,6 +18,7 @@
 #include "qapi/error.h"
 #include "trace.h"
 
+
 /* io_uring ring size */
 #define MAX_ENTRIES 128
 
@@ -434,8 +435,17 @@ LuringState *luring_init(Error **errp)
     }
 
     ioq_init(&s->io_q);
-    return s;
+#ifdef CONFIG_LIBURING_REGISTER_RING_FD
+    if (io_uring_register_ring_fd(&s->ring) < 0) {
+        /*
+         * Only warn about this error: we will fallback to the non-optimized
+         * io_uring operations.
+         */
+        warn_report("failed to register linux io_uring ring file descriptor");
+    }
+#endif
 
+    return s;
 }
 
 void luring_cleanup(LuringState *s)
diff --git a/meson.build b/meson.build
index 9ebc00f032..9ffc74d8ed 100644
--- a/meson.build
+++ b/meson.build
@@ -1733,6 +1733,7 @@ config_host_data.set('CONFIG_LIBNFS', libnfs.found())
 config_host_data.set('CONFIG_LIBSSH', libssh.found())
 config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
 config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
+config_host_data.set('CONFIG_LIBURING_REGISTER_RING_FD', cc.has_function('io_uring_register_ring_fd', prefix: '#include <liburing.h>', dependencies:linux_io_uring))
 config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
 config_host_data.set('CONFIG_NUMA', numa.found())
 config_host_data.set('CONFIG_OPENGL', opengl.found())
-- 
2.35.3


