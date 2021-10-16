Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE43430583
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 00:57:32 +0200 (CEST)
Received: from localhost ([::1]:58782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbscM-0002lg-B5
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 18:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mbsbE-00024x-Fj
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 18:56:20 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:18293
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mbsbA-00049g-Sr
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 18:56:19 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4HWz5T3H96z8PbN;
 Sat, 16 Oct 2021 18:56:13 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:cc:subject:message-id:mime-version:content-type; s=default;
 bh=LJ3JZYn9pS1bKcTrhQY78HvugVg=; b=OSZOCqMGsylk/2N9JhLf0e5iXaZ4
 bXcaHA1NZPiWY4ZLy9sQiWQ2VY9rZQHLh9dDmBuuRC4voczMj+T4eyCxQM5XKeJK
 yNYYx/5EYGSQT+yphVJ00HltfwLfE1zGyy75EoEnf8MPzSR8A5xppt5j8t1z4GJk
 KAZXekH+FGustDY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; q=dns; s=
 default; b=MqeW3pi4gHzLLkPvmOqi55/rAtm33JiejHeEocZ+3pldAWU6RUz0U
 cuhqS/TCE98FEJVDEgXLVjjXBcYgr93o+DRiIl1ZWQAWTf1RZ450e/kkUX+mmCrP
 FoCQAJGnG0B5mhX+qy/vVpBdbyty9gjVg7+L5QVrazEkshgjzQGIx4=
Received: from humpty.home.comstyle.com (unknown
 [IPv6:2001:470:b050:6:cb91:6777:caf2:78c6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4HWz5T14Xxz8PbK;
 Sat, 16 Oct 2021 18:56:13 -0400 (EDT)
Date: Sat, 16 Oct 2021 18:56:11 -0400
From: Brad Smith <brad@comstyle.com>
To: qemu-devel@nongnu.org
Cc: Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>
Subject: [PATCH] tests/vm: update openbsd to release 7.0
Message-ID: <YWtYi8A2KaJ8PG9K@humpty.home.comstyle.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tests/vm: update openbsd to release 7.0

Signed-off-by: Brad Smith <brad@comstyle.com>
---
 tests/vm/openbsd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index c4c78a80f1..abf510e117 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
     name = "openbsd"
     arch = "x86_64"
 
-    link = "https://cdn.openbsd.org/pub/OpenBSD/6.9/amd64/install69.iso"
-    csum = "140d26548aec680e34bb5f82295414228e7f61e4f5e7951af066014fda2d6e43"
+    link = "https://cdn.openbsd.org/pub/OpenBSD/7.0/amd64/install70.iso"
+    csum = "1882f9a23c9800e5dba3dbd2cf0126f552605c915433ef4c5bb672610a4ca3a4"
     size = "20G"
     pkgs = [
         # tools
-- 
2.33.1


