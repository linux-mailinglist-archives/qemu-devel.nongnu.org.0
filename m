Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D64B96098F4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:43:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omkbF-0005L6-Fl
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 19:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1omT63-0007je-4W
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 01:00:27 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1omT61-0000v1-5u
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 01:00:26 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4Mw5c92pT4z8PbN;
 Sun, 23 Oct 2022 01:00:09 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:cc:subject:message-id:mime-version:content-type; s=default;
 bh=K3aEyj+IwbYf6hPI1l+n1wHrNzo=; b=aoGEQ79/p04vm1yTccReq3Ixvo26
 25dDgBumfab1sWj3sK8ReGYji4hq18ZdEMj/jR8OlNLPaaqs4ZTbUMLXjlC4A8zk
 +UjsYUF40N28pAQtisf0FgzGNvxvhJICDjSNUDj/0LYpsXP9Hp1KO7BVBvGWUHcU
 9ZCSdiI/TnrvfAA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; q=dns; s=
 default; b=kzRlmmGXUL3lSRz2Uc88OCNuNa7E8I4/41PiSDbWTy9+e2A3lTCzZ
 nFxwjQ9Ixg17icZaMwqvsmxk26yvv1udj0k5A+pvLI/AYAdu1xY3kHf/aeEJUjcD
 9XEwo+F4Z4XpndRkZd0P3n83Zq0dCUn0B3k3QhAkDE6GALDrntQpb8=
Received: from humpty.home.comstyle.com (unknown
 [IPv6:2001:470:b050:3:d8bc:752f:63eb:884d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4Mw5c922kVz8PbK;
 Sun, 23 Oct 2022 01:00:09 -0400 (EDT)
Date: Sun, 23 Oct 2022 01:00:07 -0400
From: Brad Smith <brad@comstyle.com>
To: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH] tests/vm: update openbsd to release 7.2
Message-ID: <Y1TKVwNKvk+euT/s@humpty.home.comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

tests/vm: update openbsd to release 7.2

Signed-off-by: Brad Smith <brad@comstyle.com>
---
 tests/vm/openbsd | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 6f1b6f5b98..eaeb201e91 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
     name = "openbsd"
     arch = "x86_64"
 
-    link = "https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/install71.iso"
-    csum = "d3a7c5b9bf890bc404304a1c96f9ee72e1d9bbcf9cc849c1133bdb0d67843396"
+    link = "https://cdn.openbsd.org/pub/OpenBSD/7.2/amd64/install72.iso"
+    csum = "0369ef40a3329efcb978c578c7fdc7bda71e502aecec930a74b44160928c91d3"
     size = "20G"
     pkgs = [
         # tools
@@ -56,6 +56,9 @@ class OpenBSDVM(basevm.BaseVM):
 
         # libs: migration
         "zstd",
+
+        # libs: networking
+        "libslirp",
     ]
 
     BUILD_SCRIPT = """
-- 
2.38.0


