Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFE95EF16
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 00:19:14 +0200 (CEST)
Received: from localhost ([::1]:41424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hinas-0007Df-1Z
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 18:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50759)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hinZH-00060b-2d
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 18:17:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hinZF-0005mW-T7
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 18:17:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41581)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hinZF-0005kM-O5
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 18:17:33 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 33113308FF2C;
 Wed,  3 Jul 2019 22:17:30 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D05491F5C;
 Wed,  3 Jul 2019 22:17:25 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jul 2019 19:17:23 -0300
Message-Id: <20190703221723.8161-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 03 Jul 2019 22:17:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] i386: Update Cascadelake-Server-v2 CPU model
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
Cc: jingqi.liu@intel.com, Tao Xu <tao3.xu@intel.com>, "Hu,
 Robert" <robert.hu@intel.com>, Igor Mammedov <imammedo@redhat.com>, "Lai,
 Paul C" <paul.c.lai@intel.com>, Xiaoyao Li <xiaoyao.li@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cascadelake-Server-v2 had stepping=5 set by mistake (I misread an
old patch setting stepping=5 at compat_props), and doesn't have
mds-no set.  Fix these two issues.

Reported-by: Xiaoyao Li <xiaoyao.li@linux.intel.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3a66c86c14..805ce95247 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -2347,11 +2347,11 @@ static X86CPUDefinition builtin_x86_defs[] = {
             { .version = 1 },
             { .version = 2,
               .props = (PropValue[]) {
-                  { "stepping", "5" },
                   { "arch-capabilities", "on" },
                   { "rdctl-no", "on" },
                   { "ibrs-all", "on" },
                   { "skip-l1dfl-vmentry", "on" },
+                  { "mds-no", "on" },
                   { /* end of list */ }
               },
             },
-- 
2.18.0.rc1.1.g3f1ff2140


