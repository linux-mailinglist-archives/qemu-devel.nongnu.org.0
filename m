Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1802313FC6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:01:34 +0100 (CET)
Received: from localhost ([::1]:50948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ciz-0005ww-C9
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:01:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96ja-00033T-Qi
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:37:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96jI-0004zm-SC
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:37:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/983sKCXCSNy2SywL9DvVo0od8KR97/FwleNIFTEaM=;
 b=JCpPRnKqA3n1gMnH3q43dU3kEvbqqVkj+yhkzIvh1DcDBY2ovbK7O+hFg0My/n3ZKI1bp8
 peR6U7epiqGWZqVFdXWlLxjgVOCNhcvxCk4qdsJwVTW8xTbfwTTk4oArSX8IUOd8D54SBg
 91PZ//BUVve1UyZqG/1l4cEElqxU0hY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-seIDDmioOVus8JOe9dU26w-1; Mon, 08 Feb 2021 08:37:25 -0500
X-MC-Unique: seIDDmioOVus8JOe9dU26w-1
Received: by mail-wm1-f72.google.com with SMTP id n17so6512331wmk.3
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W/983sKCXCSNy2SywL9DvVo0od8KR97/FwleNIFTEaM=;
 b=TD9Ow6tPQGLA1zXIVkKfrbz2qXEstuxiuL8ancvr4yusLOqFl91AiRNgoX+tUDb0bN
 xX5ffqmAmt0xRlIX6zkigcEOt0Fx7ybLDBxxKaBY3nCR7uGDCg54xw8X0jfwQ6hQaC+i
 dfRzCAJavwFiEXsTQaz/t5QDezW8pLTAFLWXFITf0E8yKzd7abee+QePn33WtQip4ZZo
 tHJt2YnINvLM9Q36pSPtapiCwwLa02TJAy2pmCkTCnaHdz55lHRnUn6YGw9yX2wE3caP
 fCxpkP7fc2djJGBgTKtzB2Lc50KYZ5j8DF9ryGezlTxhLmw62ij/8/j8RNwKNr0PFnGI
 LsPA==
X-Gm-Message-State: AOAM532Xfs8BeI0lKcMcpFILP1XTiJS40dC2uUCmT2jkOarCjc35/tdX
 jVM8Y+r5H3Rzu9a/9oG5waT9hnDiXjVd4n36kimGxS1r5TVHSVZMbbbsD014t2CAznRXi97Poip
 LLoaoyDvD13GRuGz+X9Wtj4UeVCZQZQH8Wxk6rLDFo2D/nKZ1T8kg+TejmBpxFOau
X-Received: by 2002:a05:600c:4857:: with SMTP id
 j23mr3415414wmo.66.1612791441426; 
 Mon, 08 Feb 2021 05:37:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYZ9l0l9dfqa49K8Xmck4MY+gwz7LZQDFFjHnu+9T4zSsfulzysDKTayX86AAgaF/DZMwZog==
X-Received: by 2002:a05:600c:4857:: with SMTP id
 j23mr3415263wmo.66.1612791438521; 
 Mon, 08 Feb 2021 05:37:18 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g1sm28113599wrq.30.2021.02.08.05.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:37:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/18] tests/acceptance: Extract tesseract_available() helper
 in new namespace
Date: Mon,  8 Feb 2021 14:36:54 +0100
Message-Id: <20210208133711.2596075-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208133711.2596075-1-philmd@redhat.com>
References: <20210208133711.2596075-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We are going to reuse tesseract_available(). Extract it to
a new 'tesseract_utils' namespace.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201021105035.2477784-4-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/machine_m68k_nextcube.py | 25 +++-----------------
 tests/acceptance/tesseract_utils.py       | 28 +++++++++++++++++++++++
 2 files changed, 31 insertions(+), 22 deletions(-)
 create mode 100644 tests/acceptance/tesseract_utils.py

diff --git a/tests/acceptance/machine_m68k_nextcube.py b/tests/acceptance/machine_m68k_nextcube.py
index 2baba5fdc26..3c7400c43e4 100644
--- a/tests/acceptance/machine_m68k_nextcube.py
+++ b/tests/acceptance/machine_m68k_nextcube.py
@@ -1,19 +1,19 @@
 # Functional test that boots a VM and run OCR on the framebuffer
 #
-# Copyright (c) Philippe Mathieu-Daudé <f4bug@amsat.org>
+# Copyright (c) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
 #
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
 import os
-import re
 import time
 import logging
 
 from avocado_qemu import Test
 from avocado import skipUnless
 from avocado.utils import process
-from avocado.utils.path import find_command, CmdNotFoundError
+
+from tesseract_utils import tesseract_available
 
 PIL_AVAILABLE = True
 try:
@@ -22,25 +22,6 @@
     PIL_AVAILABLE = False
 
 
-def tesseract_available(expected_version):
-    try:
-        find_command('tesseract')
-    except CmdNotFoundError:
-        return False
-    res = process.run('tesseract --version')
-    try:
-        version = res.stdout_text.split()[1]
-    except IndexError:
-        version = res.stderr_text.split()[1]
-    return int(version.split('.')[0]) == expected_version
-
-    match = re.match(r'tesseract\s(\d)', res)
-    if match is None:
-        return False
-    # now this is guaranteed to be a digit
-    return int(match.groups()[0]) == expected_version
-
-
 class NextCubeMachine(Test):
     """
     :avocado: tags=arch:m68k
diff --git a/tests/acceptance/tesseract_utils.py b/tests/acceptance/tesseract_utils.py
new file mode 100644
index 00000000000..acd6e8c2faa
--- /dev/null
+++ b/tests/acceptance/tesseract_utils.py
@@ -0,0 +1,28 @@
+# ...
+#
+# Copyright (c) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later. See the COPYING file in the top-level directory.
+
+import re
+
+from avocado.utils.path import find_command, CmdNotFoundError
+
+def tesseract_available(expected_version):
+    try:
+        find_command('tesseract')
+    except CmdNotFoundError:
+        return False
+    res = process.run('tesseract --version')
+    try:
+        version = res.stdout_text.split()[1]
+    except IndexError:
+        version = res.stderr_text.split()[1]
+    return int(version.split('.')[0]) == expected_version
+
+    match = re.match(r'tesseract\s(\d)', res)
+    if match is None:
+        return False
+    # now this is guaranteed to be a digit
+    return int(match.groups()[0]) == expected_version
-- 
2.26.2


