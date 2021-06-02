Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACAA39918E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 19:23:05 +0200 (CEST)
Received: from localhost ([::1]:58660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loUa8-0005dh-17
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 13:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1loUZ8-0004sO-VT
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 13:22:02 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:3129
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1loUZ7-00083V-CV
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 13:22:02 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4FwG6Q64Djz8PbN;
 Wed,  2 Jun 2021 13:21:50 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:cc:subject:message-id:mime-version:content-type; s=default;
 bh=T3GQoSJwxnWDUNK7YkUq4w5ObYY=; b=OGmeXN9OayIMx9wA74YMb/+c7qa9
 HQt5c6VmgExDLxoOJQmDrSp4m1AiXKb+RhM1RX1d2heabi9f6ph9msH0WoVLVVGb
 szLrn3XnBX+TYakefA5eT3e7ZZ8mMVCpL2Gt9kHqUvfYmeGg/EUSMd7G31Cooxed
 e+szVM4QvLnoxvk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; q=dns; s=
 default; b=jDG1Emt0FP7o+nUBCuZcV9NxC1B4ITNc9GCeOc5LIbbcpxepmz/B1
 bWE/fwRre0yZ8AYi3aR4VFPXN2onjj/QNmYn3RtJ/BchgU1iLFZ3qG55tfVjT6F0
 fKRW5ZPcUe/m2Shak70mro/GMrriFaY0TsZYpRqTkBV8mQWm8e4510=
Received: from humpty.home.comstyle.com
 (bras-base-toroon2719w-grc-50-142-114-10-211.dsl.bell.ca [142.114.10.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4FwG6Q4w86z8PbK;
 Wed,  2 Jun 2021 13:21:50 -0400 (EDT)
Date: Wed, 2 Jun 2021 13:21:49 -0400
From: Brad Smith <brad@comstyle.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?us-ascii?B?PT91bmtub3duLThiaXQ/UT9NYXRoaWV1LURhdWQ9QzM9QTk/?=
 =?us-ascii?Q?=3D?= <philmd@redhat.com>
Subject: [PATCH] tests/vm: update NetBSD to 9.2
Message-ID: <YLe+LZ/j0pxVGeBi@humpty.home.comstyle.com>
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

tests/vm: update NetBSD to 9.2

Signed-off-by: Brad Smith <brad@comstyle.com>
---
 tests/vm/netbsd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index b9efc269d2..4cc58df130 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -22,8 +22,8 @@ class NetBSDVM(basevm.BaseVM):
     name = "netbsd"
     arch = "x86_64"
 
-    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.1/images/NetBSD-9.1-amd64.iso"
-    csum = "65bddc95945991c3b2021f9c8ded7f34c25f0a7611b7aa15a15fe23399e902307e926ae97fcd01dc1662ac67b5f6e4be643c6a2b581692ddcb616d30125066f9"
+    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.2/images/NetBSD-9.2-amd64.iso"
+    csum = "5ee0ea101f73386b9b424f5d1041e371db3c42fdd6f4e4518dc79c4a08f31d43091ebe93425c9f0dcaaed2b51131836fe6774f33f89030b58d64709b35fda72f"
     size = "20G"
     pkgs = [
         # tools
-- 
2.31.1


