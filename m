Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6453C5E92F9
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:12:00 +0200 (CEST)
Received: from localhost ([::1]:51410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQUJ-00071L-GO
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPs2-0003KB-W7
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:28 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPs0-0006Rg-5v
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:25 -0400
Received: by mail-pg1-x535.google.com with SMTP id s206so4233888pgs.3
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5kKZaIAKRf3+/+NyY6g6OcFI9UiTTHHGJ90OxnS38Zw=;
 b=m26TbFMjIlzTSYajRBhcg/LSYervDzHNUo2oBh7F+VV0SSy3Dvb+ibvpc7jgqgOw3s
 IM7zSTwvy4tNJDXWJyqLi8XO46Q9p0AGu0FRz7lW8F/D2iUm9Y0qvRX0j0szVm0HK9Bo
 x22EQyS8vfjx8o11rSSxCbAsLkRqVBIST1BmvJ/bLVhSqANTc4NY2aON8Nej/hQuTSv9
 ZFgeoF8Wd/w1rxYTPO2mjTGKrT9cvL+mEYVRVSDz53oTdNUeBZSKqLAuNeWFof40Aj5P
 uf/0II55nBtU6zy1RLBIsqgWKilReqc8385RT3UZxNLOQeZVHtzKgFna+mQOORiSrN+Q
 0ZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5kKZaIAKRf3+/+NyY6g6OcFI9UiTTHHGJ90OxnS38Zw=;
 b=EeklUez5D56yWYApBf0WhCKAzLWKZkgNe8hUQGaGEJAuYKDNGAP0Rx2aGUglmFJji0
 UmlT4c4eGTX79tYN6VIGvKnXXptV54qBYmx/SR7rC/0RBPD4ia++E1D7QIbDtzgJI9l8
 qev/Mz2zEVkuyRXwli0w3NrafMjVz4PKUpHk48aVJQ6nC+qgLRUiOBNAPvx4ZxpI8Mx9
 VWWBp5AyCAvxEHE/vmTd1AQ2okz6/Tff3xzgx7DjhLHxy8L2I+DOu6kXYnBN4hW39OJG
 CvbiDv1uFxfGDu30Ropj6ImGtAoqd1uy6ZxOknZvkdLRaGsYpGhnwEzEAfM0/74z9syZ
 CVqQ==
X-Gm-Message-State: ACrzQf2VB3nV35Txkjc+CyqbWvkCDOIjPNHVpTJCEp2w/mdXVTWYGcpk
 voioy1WsOloj838ltICNVqslw7j5pwc=
X-Google-Smtp-Source: AMsMyM4Lm4+tJNAcUytsW6fPp/qL7u3n4dOsB6iOTWW3G36DRk8kOn+J6If4ry9Qx1EG2RIJYmBB/A==
X-Received: by 2002:a62:4c2:0:b0:52e:bd4d:50e1 with SMTP id
 185-20020a6204c2000000b0052ebd4d50e1mr18689505pfe.8.1664105541844; 
 Sun, 25 Sep 2022 04:32:21 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 39/54] tests/qtest: migration-test: Disable IO redirection
 for win32
Date: Sun, 25 Sep 2022 19:30:17 +0800
Message-Id: <20220925113032.1949844-40-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

On Windows the QEMU executable is created via CreateProcess() and
IO redirection does not work, so don't bother adding IO redirection
to the command line.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v2)

Changes in v2:
- Change the place that sets IO redirection in the command line

 tests/qtest/migration-test.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 029c4f3a6a..a1dd342739 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -647,7 +647,16 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     }
 
     if (!getenv("QTEST_LOG") && args->hide_stderr) {
+#ifndef _WIN32
         ignore_stderr = "2>/dev/null";
+#else
+        /*
+         * On Windows the QEMU executable is created via CreateProcess() and
+         * IO redirection does not work, so don't bother adding IO redirection
+         * to the command line.
+         */
+        ignore_stderr = "";
+#endif
     } else {
         ignore_stderr = "";
     }
-- 
2.34.1


