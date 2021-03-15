Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFCE33C9B6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:10:18 +0100 (CET)
Received: from localhost ([::1]:43514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwLo-0002OH-02
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLwKQ-00014A-SQ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:08:50 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLwKN-0001vE-II
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:08:48 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso420171wmi.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 16:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A7YF3nY7RWwiblpeqYeH6Gr8kBH483IkbOyS8dt/OFw=;
 b=Y5Xslj8FigNfxfK2NtY+/L1/8mIgEzdkd7LzBgQDoxK8U5zRFgwUG2hhXbrTSlE++n
 tqIU+FD+VC/GMzNFTNj0lT/nfl61WDHJv1Q9mU5hC4j+K0q/3RGhYXRhbluLU8fxY6Fb
 fZ46/b91jG0tA2OAeQ3vPGtj2o6ZgZjDhXGacxlajeDTKz2S0R/uUbDsndYe7ygj9ZC6
 P2/gkR5TeGQ3p87w1mt/TDlX22pU9kwpw2iihRp1pkBmCv+Dj/CfjeOJeiQD9eKyiQNl
 5JjmVi1ZMmZ8Rq//pb4hff9IY/LAexDTxEmq4HnyfcYBZvTHruSWTbJ0mDcvSJY8JJuI
 j4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A7YF3nY7RWwiblpeqYeH6Gr8kBH483IkbOyS8dt/OFw=;
 b=j0fNCPaZ7HNdc2vbR+FJaU1/hcJTQcv63ZWhY4gTBt3b6rPqtiRTFHPwXZvF2u+eEp
 ZlvPSEzgDti9zCwDKeMxaZtlXpirkn67Ge490m6cVy1CgDCb5Wi3QHjV4ar6SM67uWp4
 MVpbrx0iIME0OwWMlI2V72ikydc4JpcVZEoinVYIi2wT2WvQ5w9Aar9HmGFApfT/22a+
 27jZdM487HzYTpaobqRZg2v1AYGYPPsVeCYlUN3I0llF2tVB4fxsSaMUZ3i2ONwxhtHE
 viFZNtgUDdq+A2x2FmBEE92c0V2Ni5SSAB7XY+lSP3Zvq/51CZeMf/VLXQNXHQbebULN
 tYrw==
X-Gm-Message-State: AOAM530cu/zJ9k8U3XK9LO6S869p9fVmnWK0SroF2hBsAfzjQEyewHLA
 wX0Woh19riZnHiqP2Fav2s9g8HwTt21pvQ==
X-Google-Smtp-Source: ABdhPJwoHiSGUBNp4mSuUIeBm6B9sh/p+TPGK0n8FVQz33We6hzauGMN3vJ1k1qCDG4FlcFooaQKjg==
X-Received: by 2002:a05:600c:198c:: with SMTP id
 t12mr1706530wmq.183.1615849725878; 
 Mon, 15 Mar 2021 16:08:45 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p12sm19637868wrx.28.2021.03.15.16.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 16:08:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] tests/acceptance: Extract QemuBaseTest from Test
Date: Tue, 16 Mar 2021 00:08:34 +0100
Message-Id: <20210315230838.2973103-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210315230838.2973103-1-f4bug@amsat.org>
References: <20210315230838.2973103-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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

The Avocado Test::fetch_asset() is handy to download artifacts
before running tests. The current class is named Test but only
tests system emulation. As we want to test user emulation,
refactor the common code as QemuBaseTest.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/avocado_qemu/__init__.py | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index df167b142cc..4f814047176 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -155,7 +155,7 @@ def exec_command_and_wait_for_pattern(test, command,
     """
     _console_interaction(test, success_message, failure_message, command + '\r')
 
-class Test(avocado.Test):
+class QemuBaseTest(avocado.Test):
     def _get_unique_tag_val(self, tag_name):
         """
         Gets a tag value, if unique for a key
@@ -188,8 +188,6 @@ def require_accelerator(self, accelerator):
                         "available" % accelerator)
 
     def setUp(self):
-        self._vms = {}
-
         self.arch = self.params.get('arch',
                                     default=self._get_unique_tag_val('arch'))
 
@@ -202,6 +200,25 @@ def setUp(self):
         if self.qemu_bin is None:
             self.cancel("No QEMU binary defined or found in the build tree")
 
+
+    def fetch_asset(self, name,
+                    asset_hash=None, algorithm=None,
+                    locations=None, expire=None,
+                    find_only=False, cancel_on_missing=True):
+        return super(QemuBaseTest, self).fetch_asset(name,
+                        asset_hash=asset_hash,
+                        algorithm=algorithm,
+                        locations=locations,
+                        expire=expire,
+                        find_only=find_only,
+                        cancel_on_missing=cancel_on_missing)
+
+# a.k.a. QemuSystemTest for system emulation...
+class Test(QemuBaseTest):
+    def setUp(self):
+        self._vms = {}
+        super(Test, self).setUp()
+
     def _new_vm(self, *args):
         self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
         vm = QEMUMachine(self.qemu_bin, sock_dir=self._sd.name)
-- 
2.26.2


