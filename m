Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D114429CC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:47:43 +0100 (CET)
Received: from localhost ([::1]:50550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpSI-0006cl-C1
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpNc-0006cf-Hc
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:42:52 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpNa-0007YC-Mp
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:42:52 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso1190726wmc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uvn3v2nfcIU2IgJuyBks/Pc2wix5ff6QgJODlQYTPKo=;
 b=KK2WQ/WsM2D1X3nNs/srpk1H/OWHNnvAVoq8u5KnJuM9DF6fTSaP5lnV9ByksDRn/C
 nO/q2zuJWKa1a5po1hBgA+p9VwrBtaVno7c1m6tAunhLeuS/7ova9ftQ0cY2J6tnalS8
 2fMh/thQ3zQXzDYVl+l+2pUymibC2CZmBfc7i/MtwOYTXkypUk2TDiApkhyhFf6pjTpU
 nH99Ta6wtzoqSQmbF9BXLGwgvzNUPnD+bFgGeQ6feGCoDJbsb9RK8c2ep1/oBRNBezz9
 I2J7Gwhyw4uPOTSYmuKYUehIooObDSoWH+dMcpXKXRgcRCsZpgAqm4JVwK3EL6FBYi2S
 aw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Uvn3v2nfcIU2IgJuyBks/Pc2wix5ff6QgJODlQYTPKo=;
 b=iJim/+UBW+Cc4ay9IMs2nCVOT+LhcanGgZK6+p6SZkPiKhSYM3KmJStKY1BIcVEGWY
 KwX0CH21Ni37Vi0H/hjRpbCMIvNyRpj/WlruLLXFaazmHFO0IMQ4kHnDxTbR6MUluhmo
 Q/s2sCJzRoMG746zYSkt6BnxCrlHkgHtml3/zYv8bDtjc8upT8mB1/sW8qOEfit0bPQo
 +MXkR22ZxcMXRciG7REXqo9CW/JgQUH6Pczx7CqFiu0Nwb+Jw6TQkFrYxTK0lHhgatej
 WI2wd+i4U7cOt0csGyCtATogmFYTWdbgyBsbbwBDwD35IPTGSBp2isEIoHNbFgPxnMHg
 TwFA==
X-Gm-Message-State: AOAM531vM7LuPQ68jAkaA0BUMsPV/1vl5AVnjnZRvxs6lBnNYWbByWHQ
 CK6pqW5ks/biBKi+Jwnrw+hBXrrFqsw=
X-Google-Smtp-Source: ABdhPJyDl7tPDpqZZ25sRVjNzAU5465nweEN/DRYY3ihABc2forb9D0mnPHZ2834uACzeg7cCkmidQ==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr5284354wmi.145.1635842568958; 
 Tue, 02 Nov 2021 01:42:48 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 f3sm1735550wmb.12.2021.11.02.01.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 01:42:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/6] tests/acceptance: Introduce QemuUserTest base class
Date: Tue,  2 Nov 2021 09:42:29 +0100
Message-Id: <20211102084232.2965062-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102084232.2965062-1-f4bug@amsat.org>
References: <20211102084232.2965062-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to the 'System' Test base class with methods for testing
system emulation, the QemuUserTest class contains methods useful to
test user-mode emulation.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v5: Use PEP3135, use self._ldpath.append() method (Willian)
---
 tests/acceptance/avocado_qemu/__init__.py | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 9b2ea3b248a..85bb3519969 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -17,7 +17,7 @@
 import uuid
 
 import avocado
-from avocado.utils import cloudinit, datadrainer, network, ssh, vmimage
+from avocado.utils import cloudinit, datadrainer, network, process, ssh, vmimage
 from avocado.utils.path import find_command
 
 #: The QEMU build root directory.  It may also be the source directory
@@ -295,6 +295,23 @@ def tearDown(self):
         super().tearDown()
 
 
+class QemuUserTest(QemuBaseTest):
+    """Facilitates user-mode emulation tests."""
+
+    def setUp(self):
+        self._ldpath = []
+        super().setUp('qemu-')
+
+    def add_ldpath(self, ldpath):
+        self._ldpath.append(os.path.abspath(ldpath))
+
+    def run(self, bin_path, args=[]):
+        qemu_args = " ".join(["-L %s" % ldpath for ldpath in self._ldpath])
+        bin_args = " ".join(args)
+        return process.run("%s %s %s %s" % (self.qemu_bin, qemu_args,
+                                            bin_path, bin_args))
+
+
 class LinuxSSHMixIn:
     """Contains utility methods for interacting with a guest via SSH."""
 
-- 
2.31.1


