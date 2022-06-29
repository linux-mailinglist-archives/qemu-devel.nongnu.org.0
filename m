Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D82955FBD2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:25:12 +0200 (CEST)
Received: from localhost ([::1]:46532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Twd-0004pZ-5K
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6ThC-0000k0-5J; Wed, 29 Jun 2022 05:09:20 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:35561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Th9-0003ZV-8N; Wed, 29 Jun 2022 05:09:13 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MCs9W-1nxiFS2LWS-008pgN; Wed, 29
 Jun 2022 11:08:54 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 02/11] qom/object: Remove circular include dependency
Date: Wed, 29 Jun 2022 11:08:40 +0200
Message-Id: <20220629090849.1350227-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629090849.1350227-1-laurent@vivier.eu>
References: <20220629090849.1350227-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XVOeTItIsmtsh/ZS23VfCIf2jpA/NmPvJcxexAWW6fNkcGI99QA
 fIKmPMArv53+FnlaSNKBcfCWnfcbR0904n1LgTa6m7X5YTBKrIgYka7y7LLS6nAGoF924qk
 5t3qdyMq1mAJKfiUX+v4xxEeCr3+MU1Ue0azMNUhPQdrX7hlEtyxs1QCvE1rlCA/ruZ/zw6
 NxjHut+5ceUQje8x3kg9Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7fXEQMb6Qis=:z4dsr4NxUIWwlFjIBFsBF/
 MB6H0Bus42PkEx/VZsqvDKZzE9iMKSHPImVWA7dM+Syhq88YLGhu/0JgrbRrwShotntl0dq0Y
 yrVLA3KOCd8Ty0uh3KVDGL2NhgOCcqwtM++j+4zwvbwo5YQvqKkN77u0C5g/N+wDZtxYlPFWe
 oZ2YN0I45yyknW5jbxkul+DDJl2UBh6HiEANA2zwuIxUd9dVgaf9azpI/L//xUgL3t5xz3D+x
 YHkUk4zJH9JPIDrHD8KQtEx09CrlYPzgj6sTB94PxVKhI+w/Mlhxy2a9WbxX1zQW1YJkC5Nwy
 xBx5frzp597K6YehpUgrXhVIhlZLYe7MXrKcsnB4b+QB2W6rUopLHxfQWN4QCAnarX6yOkDKA
 Vf6LQCgzpK5oj0MeH6ujuG7yqb3BZuVidZOwBoHzupRgL0J9gIaUygJRRY8tG0Arr821Kprvw
 qo7iZzED95G45eOmoBK2+Y/uMk6LLAERWb9C6cwc7vcle1Chntc97MZRLlA8Fqa8KTlecRoyb
 S0G1TjNoUOjokZjzh5P8EbMdHKoiy6eajujSb0PQRfQgcu7KTbG/gfwJUTdtmV4aMKsBV+b6P
 ol1SM4LgDVHQUBasI9XzHiOzWpK3B4gxXFMlXugjmo3+3XO1MBCcuUdWB7sToSHO0V7wlauvL
 HezdLSMprPfBFRoEmjx96EE8OHpCLn0m68tGHRndBzQxetVpRQ8MyJZK+i4U60CyjEWqk69DH
 jzLs94jO79j8i8nI0/PzNhsvOGzWTLL9TYHW/g==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

"qom/object.h" doesn't need to include itself.

Fixes: db1015e92e04 ("Move QOM typedefs and add missing includes")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220509084659.52076-1-philippe.mathieu.daude@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/qom/object.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 5f3d5b5bf532..ef7258a5e149 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -16,7 +16,6 @@
 
 #include "qapi/qapi-builtin-types.h"
 #include "qemu/module.h"
-#include "qom/object.h"
 
 struct TypeImpl;
 typedef struct TypeImpl *Type;
-- 
2.36.1


