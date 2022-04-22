Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 996F250B312
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 10:38:11 +0200 (CEST)
Received: from localhost ([::1]:49998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhonq-0004tp-CE
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 04:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1nhojy-0001rU-6X; Fri, 22 Apr 2022 04:34:10 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:51098
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1nhojw-0005UE-5U; Fri, 22 Apr 2022 04:34:09 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 49854DA154D;
 Fri, 22 Apr 2022 10:34:06 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 43F64462074; Fri, 22 Apr 2022 10:34:06 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] docs: Replace HomeBrew -> Homebrew
Date: Fri, 22 Apr 2022 10:34:03 +0200
Message-Id: <20220422083403.1082924-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The official spelling does not use camel case.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 docs/about/build-platforms.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index c29a4b8fe6..e9163ba556 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -80,7 +80,7 @@ Ubuntu LTS. Other distros will be assumed to ship similar software versions.
 For FreeBSD and OpenBSD, decisions will be made based on the contents of the
 respective ports repository, while NetBSD will use the pkgsrc repository.
 
-For macOS, `HomeBrew`_ will be used, although `MacPorts`_ is expected to carry
+For macOS, `Homebrew`_ will be used, although `MacPorts`_ is expected to carry
 similar versions.
 
 Windows
@@ -92,6 +92,6 @@ hosted on Linux (Debian/Fedora).
 The version of the Windows API that's currently targeted is Vista / Server
 2008.
 
-.. _HomeBrew: https://brew.sh/
+.. _Homebrew: https://brew.sh/
 .. _MacPorts: https://www.macports.org/
 .. _Repology: https://repology.org/
-- 
2.30.2


