Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB652B2B39
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 05:03:51 +0100 (CET)
Received: from localhost ([::1]:38638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdmn0-0001r1-Px
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 23:03:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1kdmlI-0001Gn-QW
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 23:02:04 -0500
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:28311
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1kdmlG-0005s0-Ub
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 23:02:04 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4CY1sS5M4bz8PbN;
 Fri, 13 Nov 2020 23:03:24 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:cc:subject:message-id:mime-version:content-type; s=default;
 bh=HjOCJAbofVPLVfDVfDfUYdu4YW4=; b=Er4odOlKPCOPnZcibrIXUt1/ug8D
 QTFBC8Zik8BFl8K1DBuRCv+652qL2FiZHZf4YFmD6sDeI29kDM4xFdX9fm2tqW5L
 NqkGlhCTH0X2u+fhjFBtKABL1OVsUeSMlTbm33aBaqkTEu5UFbE+5+ON+vt0T+Ov
 OAkRoZYWT2u9Cic=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; q=dns; s=
 default; b=NsqoHC81H6KwE/XUIsImmF608pYxcYxKpaC1jlvd8nAVE6T/TgcAi
 Rz+kOGglHNMCnithJ9N8iqKTMP7uBBeBBNOfOnKnZ4qJVepI5kKU9ei1eHf4udtK
 nS/4tnGlMzysXXsbWAPYCmiWfQvmjY+/ZXWEroz5/0+W1CWL2G40Z8=
Received: from humpty.home.comstyle.com
 (bras-base-toroon2719w-grc-36-142-114-120-158.dsl.bell.ca [142.114.120.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4CY1sS4dB4z8PbK;
 Fri, 13 Nov 2020 23:03:24 -0500 (EST)
Date: Fri, 13 Nov 2020 23:01:50 -0500
From: Brad Smith <brad@comstyle.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] tests/vm: update NetBSD to 9.1
Message-ID: <20201114040150.GD13329@humpty.home.comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

tests/vm: update NetBSD to 9.1

Signed-off-by: Brad Smith <brad@comstyle.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/vm/netbsd | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index 447de9747d..596717cc76 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -22,8 +22,8 @@ class NetBSDVM(basevm.BaseVM):
     name = "netbsd"
     arch = "x86_64"
 
-    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0/images/NetBSD-9.0-amd64.iso"
-    csum = "34da4882ee61bdbf69f241195a8933dc800949d30b43fc6988da853d57fc2b8cac50cf97a0d2adaf93250b4e329d189c1a8b83c33bd515226f37745d50c33369"
+    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.1/images/NetBSD-9.1-amd64.iso"
+    csum = "65bddc95945991c3b2021f9c8ded7f34c25f0a7611b7aa15a15fe23399e902307e926ae97fcd01dc1662ac67b5f6e4be643c6a2b581692ddcb616d30125066f9"
     size = "20G"
     pkgs = [
         # tools
@@ -38,7 +38,7 @@ class NetBSDVM(basevm.BaseVM):
         "bash",
         "gmake",
         "gsed",
-        "gettext",
+        "gettext-tools",
 
         # libs: crypto
         "gnutls",
-- 
2.28.0


