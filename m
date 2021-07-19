Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54463CD243
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 12:53:51 +0200 (CEST)
Received: from localhost ([::1]:42482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5QuE-0004xl-Nu
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 06:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5QtU-0004Iy-43
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:53:04 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5QtS-0008If-9p
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:53:03 -0400
Received: by mail-wr1-x430.google.com with SMTP id a13so21438911wrf.10
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 03:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ic8FZnnNq11BMQYSvn5xBYmbj04s809lIK6W7uaYqa8=;
 b=nKyVKLZddbimi8hUgUDOml/gzwiRrctEOcI7RgAVxThWkGPqGV+/oa9woGptvZSpvA
 hoTwceKtLnKjzSsCHf7kBV9uszyzdsyAT49B8HdMvwZtgG/RhIquAct/i+4Vwbwd7uuM
 mAwvONQ2ssjMUeusMnI7p4GpCy16CAzppmIRL6f+6xnW8ivmdReNmH4DbAEpCodx2uT2
 90Hd0PyoIfyo/sTcU4eQuEceNMK8MOP0QsvvanhLj8d0dRmHJ4jvL4KErVGuxfJcdyAJ
 6AlHOawx8BkhmkkuNt5sZLgn3j5DvDVnbmmeUWVQQ2VvImM3VyU6lbn8R7efBXjdeiYa
 vNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ic8FZnnNq11BMQYSvn5xBYmbj04s809lIK6W7uaYqa8=;
 b=IeaBpxvWeVTQ270RzT6aQm/1rLDxBUd+/VZi3i3BjIptxv2ZIplZJVI9zg5THo59Wb
 dJqpr51CqGzmYole7Bp4JXwgfqutMeKnNnGFqifSF4V1HWOAdGvKlwxHLNfyjphF81/G
 jxGxHjBXII/XmZUYBjvMdFWsQrqy2Wt4CbIt4Joc4gp7tk3Fdc59QkjtcwxoSfhHrcEE
 bKOa32OqfW5LDTHqviEXWkZ+nZm26EUNglnLaceNpWmv+8XrTritwIhdrO3Q7soBKUAE
 HzowcCRbmdhE6FAIWM0XmMCRcBH8/nT/cwuFLbqIgwdshtAEVBqGrDdYabfEDBWqOQEc
 ATRw==
X-Gm-Message-State: AOAM532AMv4mc2XYTk1rFKNgtD1oQBNzxF2gPMMjASIn3/CB4FwUVhQB
 2PphvTX1T7KSmxQxKrqxRx/tEWtLoWmliA==
X-Google-Smtp-Source: ABdhPJzTavwr2EL8goqHm5kXQGYu0OuXwCMPfjUBGJ92ONJdM533vLFiDNKKiSUFn8295o+xFoIWWw==
X-Received: by 2002:adf:db85:: with SMTP id u5mr25634562wri.167.1626691980607; 
 Mon, 19 Jul 2021 03:53:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b9sm24601943wrh.81.2021.07.19.03.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 03:53:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] qemu-options.hx: Fix formatting of -machine memory-backend
 option
Date: Mon, 19 Jul 2021 11:52:57 +0100
Message-Id: <20210719105257.3599-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The documentation of the -machine memory-backend has some minor
formatting errors:
 * Misindentation of the initial line meant that the whole option
   section is incorrectly indented in the HTML output compared to
   the other -machine options
 * The examples weren't indented, which meant that they were formatted
   as plain run-on text including outputting the "::" as text.
 * The a) b) list has no rst-format markup so it is rendered as
   a single run-on paragraph

Fix the formatting.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 qemu-options.hx | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 0c9ddc02746..d783626d5b6 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -98,28 +98,32 @@ SRST
         Enables or disables ACPI Heterogeneous Memory Attribute Table
         (HMAT) support. The default is off.
 
-     ``memory-backend='id'``
+    ``memory-backend='id'``
         An alternative to legacy ``-mem-path`` and ``mem-prealloc`` options.
         Allows to use a memory backend as main RAM.
 
         For example:
         ::
-        -object memory-backend-file,id=pc.ram,size=512M,mem-path=/hugetlbfs,prealloc=on,share=on
-        -machine memory-backend=pc.ram
-        -m 512M
+
+            -object memory-backend-file,id=pc.ram,size=512M,mem-path=/hugetlbfs,prealloc=on,share=on
+            -machine memory-backend=pc.ram
+            -m 512M
 
         Migration compatibility note:
-        a) as backend id one shall use value of 'default-ram-id', advertised by
-        machine type (available via ``query-machines`` QMP command), if migration
-        to/from old QEMU (<5.0) is expected.
-        b) for machine types 4.0 and older, user shall
-        use ``x-use-canonical-path-for-ramblock-id=off`` backend option
-        if migration to/from old QEMU (<5.0) is expected.
+
+        * as backend id one shall use value of 'default-ram-id', advertised by
+          machine type (available via ``query-machines`` QMP command), if migration
+          to/from old QEMU (<5.0) is expected.
+        * for machine types 4.0 and older, user shall
+          use ``x-use-canonical-path-for-ramblock-id=off`` backend option
+          if migration to/from old QEMU (<5.0) is expected.
+
         For example:
         ::
-        -object memory-backend-ram,id=pc.ram,size=512M,x-use-canonical-path-for-ramblock-id=off
-        -machine memory-backend=pc.ram
-        -m 512M
+
+            -object memory-backend-ram,id=pc.ram,size=512M,x-use-canonical-path-for-ramblock-id=off
+            -machine memory-backend=pc.ram
+            -m 512M
 ERST
 
 HXCOMM Deprecated by -machine
-- 
2.20.1


