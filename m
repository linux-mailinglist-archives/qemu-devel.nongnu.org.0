Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B162564237
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 20:58:13 +0200 (CEST)
Received: from localhost ([::1]:35124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7iJo-0005mX-3f
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 14:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1o7iI0-00054G-9a
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 14:56:20 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:35159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1o7iHu-0000TY-Bt
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 14:56:20 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B904158081A;
 Sat,  2 Jul 2022 14:56:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 02 Jul 2022 14:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1656788172; x=1656791772; bh=1pApJnHCPaJnn6GHyPOLUnh8M
 3Feb2nyTHos/jxSO9g=; b=LwUhAD29AM2whGwRt/8Dn0HxnCWtPyXtYymakw7BI
 Apln5vRQ4IaqAAQHKJl5y1IWAZ8++H8yhCVDnAIIN7fnr7MbWhsuu2hUMxV+qEG2
 DMPrX5cFMEI9dxrzm2hSb5sb9qUm89IwvLIaBH6srnnTkIRhOFpstfAaSbxkwsJ/
 eSrVO0BqKac9VGWTbOkmM0YCGvbOY/Gi3iTALMzeFOdLjnWSHzh/75egtYecXPoQ
 haFpgVyI85eSNiuTk0m3sdT26mDBPs/dB0DT4Ip7A/oOLok+RISW1EqCBUVblqRJ
 uOkYLihQJ272pyYpEqOUpyCPXbmaqUODQYz8TW6fgSQ7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2;
 t=1656788172; x=1656791772; bh=1pApJnHCPaJnn6GHyPOLUnh8M3Feb2ny
 THos/jxSO9g=; b=tldyY6hMzSnFUu6o6BwNkM+2ygt3bj8UZXgQApezNEzCxfQd
 3CER8Sp615O5O/VLGiOfb7WOv3cfw6Xc8NuiSnSg5KMAqoWMpoywSI12zpZyYsl4
 vJi2IRLWqcnw2plkrIfe6hRM6CI3/DYkw/fBiBvlEAq/ZGSgI4958cAvzoAv4bQ4
 dpRRWDcM2+Yl0i5l5F+UI41NCIeRvzQcND/EbI+aLEggsicKqkfhG9MpaEPLz2hG
 e4wHUJT1n4W75hJ0FhOGSWVwgQrt8wakQOisLUnH0b1eZquHC4Vg6xbzMiAaK066
 AqR0qp9jFUL8MtdPrHJrb5TWv9lePGhZUulkiQ==
X-ME-Sender: <xms:zJTAYhBCbL85F8HgLWUudyPp5o_fBcCTXOLFsmpfoJ5WqcYQJfVjFA>
 <xme:zJTAYvicKNPuLwi6d0kVwZnRQQlxChvb7ZfrnBPwuZQ3E5Xw4GiyZzHMccbzKVLkt
 u9eVSzoNC6EvWoxdZU>
X-ME-Received: <xmr:zJTAYsn9USF07U_vanFS6KwylDioecPMyNKHZ77fnj9sEkevS-guKYAxjaDyCyL_r0J6PzgPEtyWA3xs9eBWnTUmKZMmhhtj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehhedgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enmhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenogetfedtuddqtdduucdludeh
 mdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvg
 hrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrght
 thgvrhhnpedvjeeghfekjeejiedtuddtvdeugeehheefleetffeugeejuddttefgvdegve
 eigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 vghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:zJTAYrwQG2KHSQ35GW0dPU-HozOjuI5dlvZLs_smW4xw4XwjIKWdYA>
 <xmx:zJTAYmTMIsj9_mQ-rT73dQQvZDUxyVqv9zF4B9HB0aMv6i1m3GNIbw>
 <xmx:zJTAYuZ6iR9mCoWqlBf4p8kocObIpn3BxYCm-h0JDND_gpOHYXZr4w>
 <xmx:zJTAYsNS31If8mz-JoMRPbF40SweH4dX2oR12AoGWob4Y-KvTjsG0A>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Jul 2022 14:56:12 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH] avocado: Fix BUILD_DIR if it's equal to SOURCE_DIR
Date: Sat,  2 Jul 2022 11:56:04 -0700
Message-Id: <20220702185604.46643-1-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=peter@pjd.dev;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

I like to build QEMU from the root source directory, rather than cd'ing
into the build directory. This code may as well include a search path
for that, so that you can run avocado tests individually without
specifying "-p qemu_bin=build/qemu-system-arm" manually.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 tests/avocado/avocado_qemu/__init__.py | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index b656a70c55..ed4853c805 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -120,14 +120,15 @@ def pick_default_qemu_bin(bin_prefix='qemu-system-', arch=None):
     # qemu binary path does not match arch for powerpc, handle it
     if 'ppc64le' in arch:
         arch = 'ppc64'
-    qemu_bin_relative_path = os.path.join(".", bin_prefix + arch)
-    if is_readable_executable_file(qemu_bin_relative_path):
-        return qemu_bin_relative_path
-
-    qemu_bin_from_bld_dir_path = os.path.join(BUILD_DIR,
-                                              qemu_bin_relative_path)
-    if is_readable_executable_file(qemu_bin_from_bld_dir_path):
-        return qemu_bin_from_bld_dir_path
+    qemu_bin_name = bin_prefix + arch
+    qemu_bin_paths = [
+        os.path.join(".", qemu_bin_name),
+        os.path.join(BUILD_DIR, qemu_bin_name),
+        os.path.join(BUILD_DIR, "build", qemu_bin_name),
+    ]
+    for path in qemu_bin_paths:
+        if is_readable_executable_file(path):
+            return path
     return None
 
 
-- 
2.37.0


