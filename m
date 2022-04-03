Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ACC4F0899
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Apr 2022 11:55:58 +0200 (CEST)
Received: from localhost ([::1]:39928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nawxg-00088R-St
	for lists+qemu-devel@lfdr.de; Sun, 03 Apr 2022 05:55:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1nawwV-0007S3-TW
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 05:54:44 -0400
Received: from [2a00:1450:4864:20::536] (port=45907
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1nawwU-0000vs-C9
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 05:54:43 -0400
Received: by mail-ed1-x536.google.com with SMTP id u28so1416086eda.12
 for <qemu-devel@nongnu.org>; Sun, 03 Apr 2022 02:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0uqxdLPrjHgY49PDES4xM7M8hh2w1B9x+ITezH2sqU=;
 b=QHwWorLGhAf+efhtxu3f1g4wS6Jc/r8i1YSYbTxTXJZ1lzSQT2TMrDDPdFX2sH+aV4
 ZnlYbXaHaqOr9B4561Xrmz2pRWvgPB0e2Nec5xGVt+gUELoQJCc4jUCHV8m7MEC6AXKv
 wq9yjGGHf+WKFREpZk0gAuGo+1UvH3n03ZjUiasbzvIU0XKfefqpzBZv79KZM6cbwkw7
 DD+ziw/zSvOgssxVzYmB4VbYnMsNZpXweeVip0ddTLlUO9lPEl3idJ4ihov2gytXeZGE
 OLorcyRYfN6tGYq56oYgFgPAr1MJ1BnWW6Ekc9ivaEcbTMBDILPuAiPfd4Ur+mnHRyO/
 JOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0uqxdLPrjHgY49PDES4xM7M8hh2w1B9x+ITezH2sqU=;
 b=jAdLwyTqw9HRsjLdFrx6k9HAMjPHu95bLSdiCmG6qHi3FexvW5/ulI1NOEqv/9d4+h
 AsbKM0EytKe8QsUgvwAjDarCM6wNn+ssW/Ldki3+sF3OgGzjXD6YbaNknmUuoRZ7tS3x
 BXbnFSPQUgMwudKwbe4TztRlgfylPmTCRUALaT5QLuaSiTS7j4kzRCg996SDoOZiMF+I
 mbu5DLbNPcQHBO1RsrFs9Ef8qA3wFPlYlWMACCy9SLrddCVR6jgcNghLH2fV5wpe+3MR
 cQhyV3xDqNWZjP7FE/qxPvomhTPEYGrXiEWVNJv8zH70SUQqx44azKMxtCDWcBdzlxnR
 wf9Q==
X-Gm-Message-State: AOAM532LDqPe09uQUNMKq2ox2yKegB/UqVdjpTYhiJK86zv6KoRLYMeK
 Om9JtVJiUY2vI9QKRMqhjHefxk2XQbI=
X-Google-Smtp-Source: ABdhPJy5CRXZwA8LwMzXEhtQWwGA1//5f0ECizR8kdepyLIeulV0WQa9ikUDV2oXFBfYbeoYx3udCg==
X-Received: by 2002:a05:6402:909:b0:415:cdbf:4748 with SMTP id
 g9-20020a056402090900b00415cdbf4748mr28033184edz.395.1648979679083; 
 Sun, 03 Apr 2022 02:54:39 -0700 (PDT)
Received: from localhost.localdomain ([5.29.20.198])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a17090654cd00b006e0db351d01sm3068631ejp.124.2022.04.03.02.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 02:54:38 -0700 (PDT)
From: Yuval Shaia <yuval.shaia.ml@gmail.com>
To: qemu-devel@nongnu.org, yuval.shaia.ml@gmail.com,
 marcel.apfelbaum@gmail.com, mcascell@redhat.com, wxhusst@gmail.com
Subject: [PATCH v3] hw/pvrdma: Protect against buggy or malicious guest driver
Date: Sun,  3 Apr 2022 12:52:34 +0300
Message-Id: <20220403095234.2210-1-yuval.shaia.ml@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=yuval.shaia.ml@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Guest driver might execute HW commands when shared buffers are not yet
allocated.
This could happen on purpose (malicious guest) or because of some other
guest/host address mapping error.
We need to protect againts such case.

Fixes: CVE-2022-1050

Reported-by: Raven <wxhusst@gmail.com>
Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
---
v1 -> v2:
	* Commit message changes
v2 -> v3:
	* Exclude cosmetic changes
---
 hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
index da7ddfa548..89db963c46 100644
--- a/hw/rdma/vmw/pvrdma_cmd.c
+++ b/hw/rdma/vmw/pvrdma_cmd.c
@@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
 
     dsr_info = &dev->dsr_info;
 
+    if (!dsr_info->dsr) {
+            /* Buggy or malicious guest driver */
+            rdma_error_report("Exec command without dsr, req or rsp buffers");
+            goto out;
+    }
+
     if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
                       sizeof(struct cmd_handler)) {
         rdma_error_report("Unsupported command");
-- 
2.20.1


