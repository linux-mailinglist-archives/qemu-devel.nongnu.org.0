Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D439AF671
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 09:11:24 +0200 (CEST)
Received: from localhost ([::1]:47222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7wmg-0004Fw-NW
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 03:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40957)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i7wRs-0006J2-4G
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 02:49:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i7wRr-0004UH-2a
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 02:49:52 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:33855)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1i7wRq-0004Tm-Qf
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 02:49:51 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MZTa2-1hesxP0TOo-00WUHl; Wed, 11 Sep 2019 08:49:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed, 11 Sep 2019 08:49:19 +0200
Message-Id: <20190911064920.1718-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190911064920.1718-1-laurent@vivier.eu>
References: <20190911064920.1718-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mP/1VcsnpW5gwV8ZafAHCczu1tlzJhHJq+oJV2ymr+TY0WR9AoI
 xeGL5NqoB07iiHqYsUlhVakkqQxy9tbXNPl1aq4oWWolCkrWL8D8cxOmme/EfX6b97gzXrM
 aU+5aqHkpLJLt3b/A/IqiMwKAYcADvUTvTD2GE2+bPmo7Bm4xA6AjXNU8E6Zvtn8VfsSoLZ
 5WlWzovrlhSoQkKjuqWfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UXTpGyXhbIk=:EfDKONfc16cTnmGZACmXBU
 QWbbtFCaUuZgV4oE1N7tsrHC62L/6APPlMDIIDAcaHW8f5zHNcjOCPMnejsFSO/iZbpxNg9su
 UOex/l0UTK3Mzqcd/EMWruy5Up65wtnIh6dJYBidZkJAoGUutHNDW1Uo6n6uiIJOgIWpMyQ+6
 Z5uk0/KfEB0vDGYPb5jCLsSKWnVnMN4p49KqwiXvrUlLiFH30z8w4cF1xZkfpB4zYNdEe/lLe
 Uh+1IkOMOszJxoI1INiFgcIwavS7XCbGNMF/ndbyerU5RFfgYPQZ9CsWQ2k12Hn7ocVKpVIZH
 2AS4hqQq1ok4nxb/OXP0sfz3/kR7i18Ae/zOI4oQ7tWs+4+loDOVM9fhJkqLgGV6x5aLJhM9C
 KOFuCyvp/okRu3Tgr+o1fpGG4KyXgHzoI0lIX+NThuBXUa1lzWKUsHSl5vE3537N9mrvPRPlu
 oT8G1X/wRzR7UbRdv9+jeubW9aaCkdTlKtbsi7PWJgFXmzo2GG7jwESXgeB4HwlyYNT+36mrz
 XXNUiJLQh6AUYyqY3006M3fA1uJUb7eiclqAHLXatBppZIfRd3hv0y5boHeuHk4+HGZ8b2EZ/
 Nc9RqEgKTZ1HTtq5trv5up91uQUT9gNDb7c1uxSmV6OiHOi+MYZWRhD8goFWwkO4+SdHj1766
 I0VjvqqcQ02rrR9zZKXYq0berN9rZpp7cqfy8hRery+flrbN3pA/0pA40UpdXxcnf6Yc4zTFL
 FkObg+N/BHVjT1xlHVfUE1EZ+7uAVw8SdyUxaf+GKXtFvUCdi0UT4zhxEsHOjWXcsuANcxZxu
 Gdwbl9jp15B6BdlTeGeeVxUnYn+gQPikChqP84LlQ+60vS0svQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-devel] [PULL v2 14/15] linux-user: Add support for FDMSGON
 and FDMSGOFF ioctls
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

FDMSGON and FDMSGOFF switch informational messages of floppy drives
on and off.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <1567601968-26946-6-git-send-email-aleksandar.markovic@rt-rk.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/ioctls.h       | 2 ++
 linux-user/syscall_defs.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index bc1944804220..b253469999ee 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -112,6 +112,8 @@
      IOCTL(BLKZEROOUT, IOC_W, MK_PTR(MK_ARRAY(TYPE_ULONGLONG, 2)))
 #endif
 
+     IOCTL(FDMSGON, 0, TYPE_NULL)
+     IOCTL(FDMSGOFF, 0, TYPE_NULL)
      IOCTL(FDFLUSH, 0, TYPE_NULL)
 
 #ifdef FIBMAP
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 917202a2035d..4e33ef396be4 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -890,6 +890,8 @@ struct target_pollfd {
 
 /* From <linux/fd.h> */
 
+#define TARGET_FDMSGON        TARGET_IO(2, 0x45)
+#define TARGET_FDMSGOFF       TARGET_IO(2, 0x46)
 #define TARGET_FDFLUSH        TARGET_IO(2, 0x4b)
 
 #define TARGET_FIBMAP     TARGET_IO(0x00,1)  /* bmap access */
-- 
2.21.0


