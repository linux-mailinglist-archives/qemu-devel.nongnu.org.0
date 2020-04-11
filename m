Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8592D1A4D1F
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Apr 2020 03:09:07 +0200 (CEST)
Received: from localhost ([::1]:47508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jN4du-0001qP-6h
	for lists+qemu-devel@lfdr.de; Fri, 10 Apr 2020 21:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34712)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <brogers@suse.com>) id 1jN4cs-0001JM-Qg
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 21:08:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <brogers@suse.com>) id 1jN4cq-0006BW-9G
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 21:08:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:44030)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <brogers@suse.com>) id 1jN4cq-0006Aa-4J
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 21:08:00 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 235CCAD41;
 Sat, 11 Apr 2020 01:07:55 +0000 (UTC)
From: Bruce Rogers <brogers@suse.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] module: increase dirs array size by one
Date: Fri, 10 Apr 2020 19:07:46 -0600
Message-Id: <20200411010746.472295-1-brogers@suse.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 195.135.220.15
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
Cc: pbonzini@redhat.com, berrange@redhat.com, christian.ehrhardt@canonical.com,
 Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the module upgrades code change, the statically sized dirs array
can now overflow. Increase it's size by one, according to the new
maximum possible usage.

Fixes: bd83c861c0 ("modules: load modules from versioned /var/run dir")
Signed-off-by: Bruce Rogers <brogers@suse.com>
---
 util/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/module.c b/util/module.c
index 5f7896870a..e48d9aacc0 100644
--- a/util/module.c
+++ b/util/module.c
@@ -177,7 +177,7 @@ bool module_load_one(const char *prefix, const char *=
lib_name)
     char *version_dir;
 #endif
     const char *search_dir;
-    char *dirs[4];
+    char *dirs[5];
     char *module_name;
     int i =3D 0, n_dirs =3D 0;
     int ret;
--=20
2.26.0


