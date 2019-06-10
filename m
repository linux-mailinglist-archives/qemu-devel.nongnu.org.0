Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9573B6AE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 16:04:24 +0200 (CEST)
Received: from localhost ([::1]:46860 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haKuN-0005Ya-G3
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 10:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51435)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mehta.aaru20@gmail.com>) id 1haKh9-0000Zz-BI
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:50:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mehta.aaru20@gmail.com>) id 1haKh8-0002GR-AD
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:50:43 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38660)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
 id 1haKh8-0002F9-3H; Mon, 10 Jun 2019 09:50:42 -0400
Received: by mail-pf1-x441.google.com with SMTP id a186so5356895pfa.5;
 Mon, 10 Jun 2019 06:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=o+uM06rvMbdh1mlRNjE9NFq4RfqKiUInPHeg9BdV1ww=;
 b=sWcwANlxkiIS1HHnjfpvVh2SHIXdKz7v4WYAQGefrMVv8z3dLxF2vlD9+QgEMjE4Gc
 UraFeqoYTx5jQk2HyQSzlpcTdshGvga8+MQJHTDo3JMqypz6g7K/Q0mE3IKugl91n84n
 0VrUiaMo1Q15xzCsWggg8ik4iXTclyKKbt+iWJTbZRv2EJrCQT4/yCcvyUsgDij0kgJY
 SrQ1bgyin/ipYcb82LYSbEeocweORFwz273rbetWGDK1NxMVuEDDOMKtjbI3wpo3XHSC
 VQ7yHv8OI0WbfKu2vNtN7DRXJuRbLyFgmz1quTsU2N9QtLXWGj0ZW0Ps7Y9Rcp6zHD5V
 18Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=o+uM06rvMbdh1mlRNjE9NFq4RfqKiUInPHeg9BdV1ww=;
 b=DuzLMux9bP+Dg18tFW+qH0xJamAfYuDlj4YHVCCqkWWzQlSYc0s8qJKGCwWa8QXIBD
 3H6uTjz0y/u23zovbplcBjGi50DzUvbPzUgqicxfA+3VcbUQFN/5G+IWw1bajF0lR3kw
 6Jx/TJ/L3KzWPtQ1crVUYeT4NYAKsU6wd/HryxpqgKW4TQ1GfLIQfZFrCAYo1i3raIRk
 ZA0S5WFYCJEV2CMxuRjpowapvOhY4783kbzK9jBS/137cnJtHCyl5g0sZa/SwF/FsgEn
 4dZwRxfctymDJ9Cw4o3iu8Wki1HZbwM82lS+fJzb/KvZzDgjn0irteBAG3HfVZEi26f0
 xmkg==
X-Gm-Message-State: APjAAAWOuknNrLyHkBslmd/NDUImIJSDotIOlC16HXdLH7eZr/DYMRsa
 nd/7RJ1HBIFyRB1VYUVgJOFc8x4lC1aClQ==
X-Google-Smtp-Source: APXvYqyBn4n3iUQK2iPhRdP8CzIFuKWI7SiEF5BjLTTM7QSqtaC3cSdmbv0Aeg+XoH+Fg6OWVBSCaw==
X-Received: by 2002:a63:1854:: with SMTP id 20mr15473119pgy.366.1560174639539; 
 Mon, 10 Jun 2019 06:50:39 -0700 (PDT)
Received: from localhost.localdomain ([136.233.9.100])
 by smtp.gmail.com with ESMTPSA id d4sm13969837pfc.149.2019.06.10.06.50.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 06:50:38 -0700 (PDT)
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 10 Jun 2019 19:19:03 +0530
Message-Id: <20190610134905.22294-11-mehta.aaru20@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610134905.22294-1-mehta.aaru20@gmail.com>
References: <20190610134905.22294-1-mehta.aaru20@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-devel] [PATCH v5 10/12] block/io_uring: adds userspace
 completion polling
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 saket.sinha89@gmail.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Julia Suvorova <jusual@mail.ru>, Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
---
 block/io_uring.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index 47e027364a..acfaa48151 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -142,6 +142,21 @@ static void qemu_luring_completion_cb(void *opaque)
     qemu_luring_process_completions_and_submit(s);
 }
 
+static bool qemu_luring_poll_cb(void *opaque)
+{
+    LuringState *s = opaque;
+    struct io_uring_cqe *cqes;
+
+    if (io_uring_peek_cqe(&s->ring, &cqes) == 0) {
+        if (!cqes) {
+            qemu_luring_process_completions_and_submit(s);
+            return true;
+        }
+    }
+
+    return false;
+}
+
 static void ioq_init(LuringQueue *io_q)
 {
     QSIMPLEQ_INIT(&io_q->sq_overflow);
@@ -294,7 +309,7 @@ void luring_attach_aio_context(LuringState *s, AioContext *new_context)
     s->aio_context = new_context;
     s->completion_bh = aio_bh_new(new_context, qemu_luring_completion_bh, s);
     aio_set_fd_handler(s->aio_context, s->ring.ring_fd, false,
-                       qemu_luring_completion_cb, NULL, NULL, s);
+                       qemu_luring_completion_cb, NULL, qemu_luring_poll_cb, s);
 }
 
 LuringState *luring_init(Error **errp)
-- 
2.17.1


