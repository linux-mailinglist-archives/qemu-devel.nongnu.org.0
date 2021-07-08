Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1013BF811
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:09:50 +0200 (CEST)
Received: from localhost ([::1]:48500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Qyb-0006jl-9n
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qwy-0004ou-8S
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:09 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:36503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qwr-0001FX-OB
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:08 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MHXWL-1lxMSs15ft-00Db58; Thu, 08
 Jul 2021 12:07:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/8] linux-user: fill ppid field in /proc/self/stat
Date: Thu,  8 Jul 2021 12:07:50 +0200
Message-Id: <20210708100756.212085-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708100756.212085-1-laurent@vivier.eu>
References: <20210708100756.212085-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5k5y9abfX/1iJz2h5r9hUl1g8TVnMjMWEVgebZ+C4wyjF0B61tI
 F0tBY87sHiBh8umNT01SuOtGvawjUGy8QJS3oBeDH0zIFK10qDp+7KX5Dc+cOghrpvy+T88
 KYhomFyK3xfUef/H0OICBcEQSqSB3muUvZ0fAKcLzmTueFR/QadbQLIkDjEUJhUBCssd0AO
 nFNf3tywERcefp2guZkvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:18bNxVX9Ajk=:84ExQH83XeQGtdIL4ecgso
 srhBNvyKQYPBvyTOyEU+O2KFY3gMdR/dDGn6QbQOyt6ihUg2IyTlzAKPhGjUDqyYeXxCu1/Ta
 gdmx0v2Ir4l1aBYHI9ZsFT+fCgUm8+saL1Ze4RTwjJ4u8dth/l4JHa0ulGH1idNpxnqLmpLlL
 PvTVc7M9a8ilvHEZyq/PGKYaXPAAhn++a7oEds6IGp8o4ZyWH4cxXSf7B14QK/F+9ks6Xc27s
 KojjSYEW7cxnRIPlQht2Ab6m0LQbmE+30m4Q9yS+pPq/fuDT8Mu+B53p/eOj+FPThk563coNB
 ikxKR9LdtssHUtGA43CStuD/pTZ59EeCTiX/D7SYDUmI9X5R8rPAjt6ubOSIY5uyMtLy6wQm6
 TPxxVd/rqKqlPkoWn8FVEEv29WNRpdICZZZ8mxeTy71Fg5cPKZKy4flDCmygUzn7BQrKJuNCw
 k7ZF1JSEc4LwLOd4zSAw5l20OgURXUd+UAK7GqPvR9BYeVD5KhI9lJIDytlAvChmj7xmJhZSM
 lhfXz1dZxLT6M91fAw/clDQHAGRCdvW+J5/t+Y1OoANbAEx1g3idRnjEZN5H1PYH70im7cmUA
 yWtKQw6vYWlSPYzDqgDH9teYU8sF4dAhbv0/EeksrDJat9fPIiT6zEkKy243Nx1YRvNiW5aNY
 1fvw5iYWV8E0pNg9CadZUVKlQBKuh3BVpavyTjF+oBdsypKNtcXN4egib422dpIH/ehEad/Le
 Z13Vgp0ImKf6c5OflpwJrPmR3G4cjWNiSZzWZ6nILrO3eyOgXwGcZWJQ2Oc21Q2xMLC6rN8tm
 F8bbZpLzTZ6K1FaTwaIwRH753n/cB9Y07IrJga/KZ2o3boKAB/U/JUbTaC4qdbRE6fe1hRp
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Andreas Schwab <schwab@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andreas Schwab <schwab@suse.de>

Signed-off-by: Andreas Schwab <schwab@suse.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <mvmwnqnef5g.fsf@suse.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 64bbf331b282..3bc06d178e83 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7956,6 +7956,9 @@ static int open_self_stat(void *cpu_env, int fd)
             gchar *bin = g_strrstr(ts->bprm->argv[0], "/");
             bin = bin ? bin + 1 : ts->bprm->argv[0];
             g_string_printf(buf, "(%.15s) ", bin);
+        } else if (i == 3) {
+            /* ppid */
+            g_string_printf(buf, FMT_pid " ", getppid());
         } else if (i == 27) {
             /* stack bottom */
             g_string_printf(buf, TARGET_ABI_FMT_ld " ", ts->info->start_stack);
-- 
2.31.1


