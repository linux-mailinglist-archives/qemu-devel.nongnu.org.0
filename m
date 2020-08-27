Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE0A254C31
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 19:32:16 +0200 (CEST)
Received: from localhost ([::1]:52290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBLl0-0004WD-VI
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 13:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1kBLjq-0003h5-PY
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 13:31:02 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:60570
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1kBLjn-0001TP-L8
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 13:31:01 -0400
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 31B93DB46ED;
 Thu, 27 Aug 2020 19:30:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id D5wfJZcSn8du; Thu, 27 Aug 2020 19:30:55 +0200 (CEST)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 4CDA4DB46EC;
 Thu, 27 Aug 2020 19:30:55 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id F19944601F0; Thu, 27 Aug 2020 19:30:54 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] docs/system: Fix grammar in documentation
Date: Thu, 27 Aug 2020 19:30:51 +0200
Message-Id: <20200827173051.31050-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 13:30:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 docs/system/build-platforms.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/build-platforms.rst b/docs/system/build-platforms.rst
index c2b92a9698..9734eba2f1 100644
--- a/docs/system/build-platforms.rst
+++ b/docs/system/build-platforms.rst
@@ -57,12 +57,12 @@ macOS
 -----
 
 The project supports building with the two most recent versions of
-macOS, with the current homebrew package set available.
+macOS, with the current Homebrew package set available.
 
 FreeBSD
 -------
 
-The project aims to support the all the versions which are not end of
+The project aims to support all versions which are not end of
 life.
 
 NetBSD
@@ -75,5 +75,5 @@ new major version is released.
 OpenBSD
 -------
 
-The project aims to support the all the versions which are not end of
+The project aims to support all versions which are not end of
 life.
-- 
2.28.0


