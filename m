Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5933953D6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 04:03:03 +0200 (CEST)
Received: from localhost ([::1]:47378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnXGg-0000Qx-44
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 22:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lnXFJ-0008CN-81
 for qemu-devel@nongnu.org; Sun, 30 May 2021 22:01:37 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:32072
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lnXFF-0004d4-2g
 for qemu-devel@nongnu.org; Sun, 30 May 2021 22:01:36 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4FtdnQ01jCz8PbN;
 Sun, 30 May 2021 22:01:30 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:cc:subject:message-id:mime-version:content-type; s=default;
 bh=w2MYX5uWjEroC1OeaCWz/9rQ+7E=; b=EFTFZGj1cQ5Fsj+Xw6sZMQpsLjpO
 H+nc82OKc0YO86AIP+vZo9Y+jd8i1bWC5lo0J5JL3Ut6Z4xQAzu7aM8FN89jEw94
 LB4cyjvxVqJLe/JmlubIyIBL5KamNslJ3gMRUClLS/W7yd5A9dbOBmjbRWWFl310
 nxJOHBpC48sqCi8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; q=dns; s=
 default; b=h5G9WJ06l8fS8PruIKGV7C3iQkxKb0M8ch7IXWV6a68Ff/I/583N5
 rweunBtOfpX+01LHnASnGSOClR8DxuyNBaNb8T2F3DGqV3UOthsvkOAkhNluWFYv
 Uck8Y5KN+QYPsig8cN0RzpABU9w/6U2ddS0eJg7YsdMDvY2Eb5yjnU=
Received: from humpty.home.comstyle.com
 (bras-base-toroon2719w-grc-50-142-114-10-211.dsl.bell.ca [142.114.10.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4FtdnP6XcRz8PbK;
 Sun, 30 May 2021 22:01:29 -0400 (EDT)
Date: Sun, 30 May 2021 22:01:28 -0400
From: Brad Smith <brad@comstyle.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?unknown-8bit?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] tests/vm: update openbsd to release 6.9
Message-ID: <YLRDeJV8qBrt9++c@humpty.home.comstyle.com>
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

tests/vm: update openbsd to release 6.9

Signed-off-by: Brad Smith <brad@comstyle.com>
---
 tests/vm/openbsd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 4d1399378e..c4c78a80f1 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
     name = "openbsd"
     arch = "x86_64"
 
-    link = "https://cdn.openbsd.org/pub/OpenBSD/6.8/amd64/install68.iso"
-    csum = "47e291fcc2d0c1a8ae0b66329f040b33af755b6adbd21739e20bb5ad56f62b6c"
+    link = "https://cdn.openbsd.org/pub/OpenBSD/6.9/amd64/install69.iso"
+    csum = "140d26548aec680e34bb5f82295414228e7f61e4f5e7951af066014fda2d6e43"
     size = "20G"
     pkgs = [
         # tools
-- 
2.31.1


