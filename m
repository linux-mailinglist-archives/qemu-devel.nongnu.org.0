Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFAC33C9B9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:10:36 +0100 (CET)
Received: from localhost ([::1]:44458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwM7-0002oa-8P
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLwKZ-0001Nt-Sp
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:08:59 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:54184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLwKY-00020q-5x
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:08:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id g20so9080217wmk.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 16:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LYhx91+2cSrSGuiAZO0E+KTXwLNRLCou9fW7dMGBBFM=;
 b=uWa+zjPcEY+4WkLnLT/M9RfTMSvgDnBaM8KKyJVnU2+MsTEHjHQc3oipFtk9Rh2FES
 JDRxBLmAVkruXfBDvFyYnszDQXfBRlfvkwYp4p4a+n0T4KkuTzGdx/aHAo1k2qnHscE4
 G5SsOYDJLz7MTg717LPAUkMG6/mYK+8qWSbAtP5rv+oYpfrb6lT4AVNbKaL2602Ts70B
 WHf3kyi3d7Y/gYtic6IwiOdGT3Z9VvG5XD8CR0gesnQXHNd6XloKOwbOcp+r1a1PZC7k
 flW5Z4AIMfVa5n2ZaSQvgoZP+NFoMSiUt7IeK2JvBoKKOcsfwKfFE0r+Dr/ONzI5E9lz
 27bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LYhx91+2cSrSGuiAZO0E+KTXwLNRLCou9fW7dMGBBFM=;
 b=QstHYi3JJw1Y7g7Ljm32HzVgxvOofdZCISdhdtRA6HMnxij9v6GttKWTLR6rh18qLJ
 IaU87D7ONaOpTXMhQqiGWjFX7L1PuAxNqvdGeFPreoM2cKqQnZ9X7ECnnCFD0ZLDWV9R
 Ejd9mGqIqKjXDDpOGOtOzD+GlQzcBMlH2jPVWv7MnOe7dY1nRKQHgyntL1KUb26aLZ52
 pmO+ACGsQHwqUJELoH44yOYLBkBt/vNv8uE4ijOJg6P2HWa/a96l6sLuuKix+0t1l5oE
 O2jTVkXA3k5atPVybi5IBW4e1T5/Sx0Tj6RXO81fcUTvp5uh6Q65RgkuMRBnrt1Argi3
 K88w==
X-Gm-Message-State: AOAM5326URLWdz+UcljahBgd0XiNvK/0ON3/o1y/QGwg0sKBzN4CLZtd
 P4RlkcjjPFcPJFOVp4GQxLZIKXcFvMfIdA==
X-Google-Smtp-Source: ABdhPJyrH0oTTtqp/LXbCRoChXO34MT6RxjKJDnalIetwHnTkzPXP0Y8OVljKfjzZF6xAG7FC4QEjg==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr1755606wmj.124.1615849736276; 
 Mon, 15 Mar 2021 16:08:56 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c9sm20175456wrr.78.2021.03.15.16.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 16:08:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] tests/acceptance: Introduce QemuUserTest base class
Date: Tue, 16 Mar 2021 00:08:36 +0100
Message-Id: <20210315230838.2973103-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210315230838.2973103-1-f4bug@amsat.org>
References: <20210315230838.2973103-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to the 'System' Test base class with methods for testing
system emulation, the QemuUserTest class contains methods useful to
test user-mode emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/avocado_qemu/__init__.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 08b3fa1124f..b471bee66e0 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -20,6 +20,7 @@
 from avocado.utils import cloudinit
 from avocado.utils import datadrainer
 from avocado.utils import network
+from avocado.utils import process
 from avocado.utils import vmimage
 from avocado.utils.path import find_command
 
@@ -256,6 +257,19 @@ def fetch_asset(self, name,
                         find_only=find_only,
                         cancel_on_missing=cancel_on_missing)
 
+class QemuUserTest(QemuBaseTest):
+    def setUp(self):
+        self._ldpath = []
+        super(QemuUserTest, self).setUp("qemu-%s")
+
+    def add_ldpath(self, ldpath):
+        self._ldpath += [os.path.abspath(ldpath)]
+
+    def run(self, bin_path, args=[]):
+        qemu_args = " ".join(["-L %s" % ldpath for ldpath in self._ldpath])
+        bin_args = " ".join(args)
+        return process.run("%s %s %s %s" % (self.qemu_bin, qemu_args,
+                                            bin_path, bin_args))
 
 class LinuxTest(Test):
     """Facilitates having a cloud-image Linux based available.
-- 
2.26.2


