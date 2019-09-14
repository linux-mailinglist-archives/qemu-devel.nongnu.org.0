Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F20B2CF1
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Sep 2019 22:57:40 +0200 (CEST)
Received: from localhost ([::1]:52322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9F6x-00075N-Ea
	for lists+qemu-devel@lfdr.de; Sat, 14 Sep 2019 16:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47999)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chewi@gentoo.org>) id 1i99PO-0008RL-00
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 10:52:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chewi@gentoo.org>) id 1i99PM-0000J7-LB
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 10:52:17 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:54928)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chewi@gentoo.org>)
 id 1i99PM-0000HW-GE; Sat, 14 Sep 2019 10:52:16 -0400
Received: from symphony.aura-online.co.uk (154.189.187.81.in-addr.arpa
 [81.187.189.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: chewi)
 by smtp.gentoo.org (Postfix) with ESMTPSA id EFCC234B179;
 Sat, 14 Sep 2019 14:52:12 +0000 (UTC)
From: James Le Cuirot <chewi@gentoo.org>
To: qemu-devel@nongnu.org
Date: Sat, 14 Sep 2019 15:51:55 +0100
Message-Id: <20190914145155.19360-1-chewi@gentoo.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 140.211.166.183
X-Mailman-Approved-At: Sat, 14 Sep 2019 16:55:48 -0400
Subject: [Qemu-devel] [PATCH] configure: Add xkbcommon configure options
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
Cc: qemu-trivial@nongnu.org, James Le Cuirot <chewi@gentoo.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This dependency is currently "automagic", which is bad for distributions.

Signed-off-by: James Le Cuirot <chewi@gentoo.org>
---
 configure | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/configure b/configure
index 30aad233d1..30544f52e6 100755
--- a/configure
+++ b/configure
@@ -1521,6 +1521,10 @@ for opt do
   ;;
   --disable-libpmem) libpmem=3Dno
   ;;
+  --enable-xkbcommon) xkbcommon=3Dyes
+  ;;
+  --disable-xkbcommon) xkbcommon=3Dno
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1804,6 +1808,7 @@ disabled with --disable-FEATURE, default is enabled=
 if available:
   capstone        capstone disassembler support
   debug-mutex     mutex debugging support
   libpmem         libpmem support
+  xkbcommon       xkbcommon support
=20
 NOTE: The object files are built at the place where configure is launche=
d
 EOF
--=20
2.23.0


