Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5587C51CCC9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 01:33:20 +0200 (CEST)
Received: from localhost ([::1]:42738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmkyE-0006Zb-V0
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 19:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1nmkxO-0005i6-Cn
 for qemu-devel@nongnu.org; Thu, 05 May 2022 19:32:26 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:5520
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1nmkxM-0008N4-NV
 for qemu-devel@nongnu.org; Thu, 05 May 2022 19:32:26 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4KvVN85zlsz8PbN;
 Thu,  5 May 2022 19:32:08 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:cc:subject:message-id:mime-version:content-type; s=default;
 bh=URavXp7uU2F08ITZub3hfU27ySs=; b=pqakgmAuID14e7PA1NB7VEwUUgbh
 8oIsouyikVAB8TqKuahB1oJ0pp9/0PvJWXC2cxDyQvzclHoctpJY5v4EzOCLDEEP
 h1do5Gh+8ixxjB2dOzgwnwjDC6bNWi4J6D0p0rzz9JX57aCXgcBDG9uooCSOceUv
 5WMUkLoFbKPZyT0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; q=dns; s=
 default; b=UgjrsL7Mc86ac9u82jMoelmOyFs69VPk4vGLq7EfxJFvG9b7/tL5n
 75h6QWLC7goL+kuXYMzU7gE8j8nGH76veE3iPsUJ3E1vq+pmqFvbEJYs0GD2T/t5
 MzTi028ln/80axgPwmDh49Kl9tdfhsfpttrSKFz2yprfE+25upC/Gw=
Received: from humpty.home.comstyle.com (unknown
 [IPv6:2001:470:b050:3:6ead:ef9b:ecf3:cced])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4KvVN83ZKxz8PbK;
 Thu,  5 May 2022 19:32:08 -0400 (EDT)
Date: Thu, 5 May 2022 19:32:07 -0400
From: Brad Smith <brad@comstyle.com>
To: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH] tests/vm: update openbsd to release 7.1
Message-ID: <YnRed7sw45lTbRjb@humpty.home.comstyle.com>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

tests/vm/openbsd: Update to release 7.1

Signed-off-by: Brad Smith <brad@comstyle.com>
---
 tests/vm/openbsd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 337fe7c303..dc34b2718b 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
     name = "openbsd"
     arch = "x86_64"
 
-    link = "https://cdn.openbsd.org/pub/OpenBSD/7.0/amd64/install70.iso"
-    csum = "1882f9a23c9800e5dba3dbd2cf0126f552605c915433ef4c5bb672610a4ca3a4"
+    link = "https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/install71.iso"
+    csum = "d3a7c5b9bf890bc404304a1c96f9ee72e1d9bbcf9cc849c1133bdb0d67843396"
     size = "20G"
     pkgs = [
         # tools
-- 
2.36.0


