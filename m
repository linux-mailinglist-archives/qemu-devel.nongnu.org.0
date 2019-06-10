Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0463B6A5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 16:01:24 +0200 (CEST)
Received: from localhost ([::1]:46792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haKrT-0002WO-7v
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 10:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51331)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mehta.aaru20@gmail.com>) id 1haKgu-0000KR-2W
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:50:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mehta.aaru20@gmail.com>) id 1haKgn-00025M-3F
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:50:24 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:35564)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
 id 1haKgm-00024h-TB; Mon, 10 Jun 2019 09:50:21 -0400
Received: by mail-pl1-x641.google.com with SMTP id p1so3700710plo.2;
 Mon, 10 Jun 2019 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=92hTvf/vcv0m1TMyr6r0QhwXroAf5xu/zM543QmX6EI=;
 b=UOK69WlqP/6YjDPO7cp+NSaHQJqzXSNKmx+0wZxMGBgPiJ+VtV+j5GUNx907tvn03f
 IgvHbGx1bBmEBqq87ziWYKIPn3OuZXdKia3uz+eDDxRa6JwuOf588IVBSEZSQ5ImSDnl
 +fDfSMHmLTHw5mXUmejA5TfHr9SE87YcTGFSA7mx0nsZjVcQAY0tddgDZE/E2wW7qNyU
 fmS3tEL+rlD98fnBZP3KAs6JwfWJXHww2v1kap2c1zFhkIZ+2bVmir4LtxjCAf1IDtQH
 CUcW/TNJm8pSQepkg28D+aYUM8gYvF3IHzK5ihXq/pG+t0qvgUIpXqbL1nwqQRn9iACZ
 yC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=92hTvf/vcv0m1TMyr6r0QhwXroAf5xu/zM543QmX6EI=;
 b=gBFakiTCfrUzTzSwMEWRWdgkfR2rYM3g5Cto3y8WcWu+RB4VRK2eVLKb7AAGbtZfyZ
 U9NCRmq5UM/xzpYcgdxk+ePvJvnTeAD7kF8uJSeE81TX+O8eztrqXcTNkUpmxWpsf7OH
 xKJ2hNCtqnIWE5LD+tfQ/PluCCPBUPvq4txE4IldrUt12aalLydUSf28omhIQ3cobzyo
 lLlwoxkAdsMiMxWOjP8nqIFxKcPO7Zu1uSiHY3OIxuJCXkG49WJuNLlbNl3tWVt91qFu
 imeSAl/Yc/zGBG0l/pHE1tW8OLmLqK0RNxaNwV4xhGY1l1rDdK4OxKEb1Nfc9yLLU7iu
 F5Pw==
X-Gm-Message-State: APjAAAWlxtmsiCwmTk2KSZX/lnqmsP7RHgHIPYphZai3z7KojXmJg4ZL
 vYKS+mbLxt1AJn1Cy9XQZQaRy5KeeKiGyQ==
X-Google-Smtp-Source: APXvYqx2ci4VwkOfQ5iyAukA//5QDPtgyf8PLYyIRBxiRIGDG7GRn1r/xY/Jy9l8hqb7l9hQPg880A==
X-Received: by 2002:a17:902:848c:: with SMTP id
 c12mr69560703plo.17.1560174618934; 
 Mon, 10 Jun 2019 06:50:18 -0700 (PDT)
Received: from localhost.localdomain ([136.233.9.100])
 by smtp.gmail.com with ESMTPSA id d4sm13969837pfc.149.2019.06.10.06.50.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 06:50:18 -0700 (PDT)
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 10 Jun 2019 19:19:00 +0530
Message-Id: <20190610134905.22294-8-mehta.aaru20@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610134905.22294-1-mehta.aaru20@gmail.com>
References: <20190610134905.22294-1-mehta.aaru20@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH v5 07/12] blockdev: accept io_uring as option
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 blockdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index 3f44b891eb..a2a5b32604 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -386,6 +386,8 @@ static void extract_common_blockdev_options(QemuOpts *opts, int *bdrv_flags,
         if ((aio = qemu_opt_get(opts, "aio")) != NULL) {
             if (!strcmp(aio, "native")) {
                 *bdrv_flags |= BDRV_O_NATIVE_AIO;
+            } else if (!strcmp(aio, "io_uring")) {
+                *bdrv_flags |= BDRV_O_IO_URING;
             } else if (!strcmp(aio, "threads")) {
                 /* this is the default */
             } else {
@@ -4579,7 +4581,7 @@ QemuOptsList qemu_common_drive_opts = {
         },{
             .name = "aio",
             .type = QEMU_OPT_STRING,
-            .help = "host AIO implementation (threads, native)",
+            .help = "host AIO implementation (threads, native, io_uring)",
         },{
             .name = BDRV_OPT_CACHE_WB,
             .type = QEMU_OPT_BOOL,
-- 
2.17.1


