Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E972D5B68
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:14:55 +0100 (CET)
Received: from localhost ([::1]:41264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLmY-0003G4-7X
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knLQf-0002Pe-FD
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:52:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knLQb-0001cH-U3
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:52:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607604728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LD4AGNpIw1YXczLSKVws4EcAyhWjSWHAbR6F2wj+Y9o=;
 b=AN8jS6xsyEcIg0XNGFPUdr7QB6hymYvvoaCvk34oAIqFQUPVKR2tKlEi4RZj9qF77GeIhD
 7YazI5POLzvxr90JjDpG+XAZ9/CS4FcqKHvr5yD4yKYp/9roJSX2Xymhvj7K3Hc9H8X3hY
 a4wMtlC0Kgh/QFhspU+WmjlXpEx/fX4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-PEutrPp3OiiEiEHU3FaiRA-1; Thu, 10 Dec 2020 07:52:06 -0500
X-MC-Unique: PEutrPp3OiiEiEHU3FaiRA-1
Received: by mail-wr1-f72.google.com with SMTP id u29so1911961wru.6
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 04:52:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LD4AGNpIw1YXczLSKVws4EcAyhWjSWHAbR6F2wj+Y9o=;
 b=ojeJsbkhbpt8SXo7ejh60QUxY/fdjDBQAFj7WtxrdQXWmiJRtMBqzaUodf0xjg5wMJ
 xQD7LIzACyJ4QPad7k49Rge1Wkv73lUJJZnncHnctuLmGwMIvlAP4dim7n6Mnys8t2dD
 Hxo7/fGRD7+oFnTNbhRxsaNJ4pdROTB1qm+HTdHXnTfJ77dfvYkCX6yuCouc91mTX0hr
 z+/LWCuwGY/1KM0k46+fHc8z5vf6pkTxzQ9xri6MdImbLQ6MTFlE/x3AQsmv0ZX0fWDe
 mVrbd8m6FlFzBvZeA6QI0wa9KIxYVXuTx2nIzbSm5X38z6JkXIyZ8iDrHzZ6eUviB4Xv
 nQng==
X-Gm-Message-State: AOAM533euGfjyH6soTgUHxs6KdsyCppupDlExralHk5D6UXVPJ+fvSP/
 yFxVQRnT8R8d8LgLKfc7oPI6xqzLw6KeKyEAVWTUI2qI4SVrOUwJGLAbqDolu6SkjVETjnk2JCX
 7ew7c/NuU2cFeYRD2Hwh8UWBHxrFTqcrjzhlMx3E6fiywxEHzEk6XmCDt8OMr6WTj
X-Received: by 2002:a5d:67c3:: with SMTP id n3mr8068591wrw.297.1607604725523; 
 Thu, 10 Dec 2020 04:52:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykYtZce4rsa9A7EvvAqyd3v6leMoaCpFVnL9ntxaGykoN4FgjOEfOPweR4dfFEWvMWDXZwhQ==
X-Received: by 2002:a5d:67c3:: with SMTP id n3mr8068562wrw.297.1607604725278; 
 Thu, 10 Dec 2020 04:52:05 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z64sm8757573wme.10.2020.12.10.04.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 04:52:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block/nvme: Implement fake truncate() coroutine
Date: Thu, 10 Dec 2020 13:52:02 +0100
Message-Id: <20201210125202.858656-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Xueqiang Wei <xuwei@redhat.com>, qemu-block@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NVMe drive can not be shrunk.

Since commit c80d8b06cfa we can use the @exact parameter (set
to false) to return success if the block device is larger than
the requested offset (even if we can not be shrunk).

Use this parameter to implement the NVMe truncate() coroutine,
similarly how it is done for the iscsi and file-posix drivers
(see commit 82325ae5f2f "Evaluate @exact in protocol drivers").

Reported-by: Xueqiang Wei <xuwei@redhat.com>
Suggested-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/block/nvme.c b/block/nvme.c
index a06a188d530..5a6fbacf4a5 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1389,6 +1389,29 @@ out:
 
 }
 
+static int coroutine_fn nvme_co_truncate(BlockDriverState *bs, int64_t offset,
+                                         bool exact, PreallocMode prealloc,
+                                         BdrvRequestFlags flags, Error **errp)
+{
+    int64_t cur_length;
+
+    if (prealloc != PREALLOC_MODE_OFF) {
+        error_setg(errp, "Unsupported preallocation mode '%s'",
+                   PreallocMode_str(prealloc));
+        return -ENOTSUP;
+    }
+
+    cur_length = nvme_getlength(bs);
+    if (offset != cur_length && exact) {
+        error_setg(errp, "Cannot resize NVMe devices");
+        return -ENOTSUP;
+    } else if (offset > cur_length) {
+        error_setg(errp, "Cannot grow NVMe devices");
+        return -EINVAL;
+    }
+
+    return 0;
+}
 
 static int nvme_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue, Error **errp)
@@ -1523,6 +1546,7 @@ static BlockDriver bdrv_nvme = {
     .bdrv_close               = nvme_close,
     .bdrv_getlength           = nvme_getlength,
     .bdrv_probe_blocksizes    = nvme_probe_blocksizes,
+    .bdrv_co_truncate         = nvme_co_truncate,
 
     .bdrv_co_preadv           = nvme_co_preadv,
     .bdrv_co_pwritev          = nvme_co_pwritev,
-- 
2.26.2


