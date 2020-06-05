Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB8E1EF6D6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 13:53:40 +0200 (CEST)
Received: from localhost ([::1]:55376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhAup-0002cu-VM
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 07:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jhAom-0008KF-Oi
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 07:47:24 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:37489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jhAok-0006m9-PW
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 07:47:23 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MfZ9C-1j1VLZ0R8y-00fx6N; Fri, 05 Jun 2020 13:47:17 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 19/19] stubs: Restrict ui/win32-kbd-hook to system-mode
Date: Fri,  5 Jun 2020 13:47:00 +0200
Message-Id: <20200605114700.1052050-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605114700.1052050-1-laurent@vivier.eu>
References: <20200605114700.1052050-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RDG/fE4AoCovIdc/3QlTJBWThUPJnw6Nd9aJkQsgHQsFGNUGLuo
 3u02hH14ToPlsB2/0y0URZxD6ngsiG7qoq+WN/KKhYYWJnvUgyi+2nzMswc+6XS4UiTnFBG
 cWNBWl9pBkaX7u62IgdtAVXJGEtn17aDwfkdF9vE1QUZJPiTVx97S5sTm3eAXEj8QrX3lTo
 ArfWAZMbMlfF4LNbrmFRA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OBvJW1pq640=:ZpDjUr/qHEPshW578NxROF
 TtRTQN5hXfKu/sVJpKxj4quBaM4Goco02NIg10knSMkDcEiETOxii6PpUOcDRfRE1c09R+X6C
 qc6j4lyN59W5Jdfg1RE9/Nh8ihdVCwD/JqeR4lgquPyN8cgFGl8YFjEIpE6DgkOZHMetN3rpu
 hw1sQ4UCIAiz8IM4LwFedS6/PqzsOy1UTMIWN7wqeB9W4qLdsUdEoabsF3CiU2sHWfkn41eVk
 nORWNcqZXjZ8syT62ny+it1IUC8RH8Pp5beM/nWocO4L07fzx6YqUwxWQctZTYMj0JgpKYMy3
 nKbbQAFAr3d84jqPmbaNDwmghyWziBaq0LjrgSY5bCsiM456B2f8RMlVYVYIJvVxlX5t3K3gG
 tCA+5cqHYYzicXNvvGBtyGC3fimhqMTtNbm+TFGMS/nb+TFVwv0Gry4DsWWCKk2lIJrCXbkv5
 j4QVqTOJ4RMJRSvf26KdlHdPaSd9ZwYm6gPVe+JCEdccx0sON1pQc/q2T0Lwm5o1kuemjSqiH
 ZhMUhX5i57za+PCmXFtXyR8dJq0/ZFAiVl73N9Ew5W2HMkfmOAxGdHJyJ8Hg2rbTLlVki6Nhd
 xUF0FjOh9u593neT6GmnxvBUuJAOp82XXtq9U33saeHwQZx1BUFZd2tUaEvNXO73yQ6iCFeIw
 DDE69MWubxYw7k68aoMhDXxg6K2MlX59XrVd69XGs9dpdjH1cQLDD+L2WnorDqTxiMR+iDc9I
 zk11X4AUW24lmTon87U7obkLit3kCI51lls8gL48RNgZHqs5JZpORAlpkJCRsJ8VbwoYtm3rg
 0xx4Eu877bTrDAkvr9r0AQMbkVacrnYyk6mH1s3WlVKQxj5OVICH/h2IOrsSGy0O+darXDf
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 07:27:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

In Makefile.objs, the ui/ directory is restricted to system-mode:

 43 ifeq ($(CONFIG_SOFTMMU),y)
 ...
 65 common-obj-y += ui/
 66 common-obj-m += ui/
 ...
 82 endif # CONFIG_SOFTMMU

Restrict the ui/ stub added in commit 2df9f5718df to only build
it for system-mode emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200522172510.25784-14-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 stubs/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index f54125de317d..c1e43ac68f87 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -23,7 +23,7 @@ stub-obj-y += sysbus.o
 stub-obj-y += tpm.o
 stub-obj-y += trace-control.o
 stub-obj-y += vmstate.o
-stub-obj-y += win32-kbd-hook.o
+stub-obj-$(CONFIG_SOFTMMU) += win32-kbd-hook.o
 
 #######################################################################
 # code used by both qemu system emulation and qemu-img
-- 
2.26.2


