Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A653334A2D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 22:54:58 +0100 (CET)
Received: from localhost ([::1]:43508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6nB-00071T-2M
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 16:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6e7-0003CF-NB; Wed, 10 Mar 2021 16:45:37 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:44459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6e1-0004TD-EL; Wed, 10 Mar 2021 16:45:35 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M8hEd-1lODEx2LJp-004gQL; Wed, 10 Mar 2021 22:45:22 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 14/22] seccomp: Replace the word 'blacklist'
Date: Wed, 10 Mar 2021 22:44:56 +0100
Message-Id: <20210310214504.1183162-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IXJGS9EI8WgLXbmOsxlnRBvT2P56A591zZZzaFDtFfZ4Js2MLGv
 WzWPCFw2AGFDcLcbiaDLjE3IfQdpfJmyqKhB6hes0AE6IG6USb47cDTLXpIw0Sf3u18k2tT
 hExGl54Qubc/EWNpc8N5W1KHznXZMFNiXkEo1XJbuS56M8+CBY9JA3cedgeWgcBYE5ervya
 2V1a1NC8meCn119zxswZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZcseplGej8o=:GpP4imbXUj1CRRqpZ8ormm
 9oGGYEleqbVK8vkBmmrYJ7O8DgTaVhdkO4m3pX8LcYY/glCCMK6hSPOXW+17J+uEMa+fL1+kT
 MxP0g03U4dc2hyUOWmH8OX1TnwsdbhNPBMgH8b5LCjqcdNEdwFuAn+HuXLZZviczG623uB4l/
 Pc2mq3RjLxkWB7xSFAactEbFoff1VMuMNmgr+6arUmwmjBkeEUH0l/Z+aOqLTW12lPPoJBFce
 xiNVUvwOHGfwwOHRZJyuxwt10L2bZNov7v3wd1GbJBLdF+41uZ5P7aRvxEywTcG2gpAr6YjkO
 fWmOoL5+ZRy+/JOUtrJDwk+mjHmO19dbXNvEly/ZP+hKwuioGh3lpYh0jnGsRKdcYSINUTGuD
 71yJc/pY/O5OdZLdyEEsOcjDyIjX5pGFYoZjcHcFJPYuAL1hwuMRR6eddnSHuHMZiKktm7ihz
 Gi3Fgs/+3g==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Eduardo Otubo <otubo@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210303184644.1639691-4-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 softmmu/qemu-seccomp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
index 377ef6937ca5..9c29d9cf007e 100644
--- a/softmmu/qemu-seccomp.c
+++ b/softmmu/qemu-seccomp.c
@@ -45,8 +45,8 @@ const struct scmp_arg_cmp sched_setscheduler_arg[] = {
     { .arg = 1, .op = SCMP_CMP_NE, .datum_a = SCHED_IDLE }
 };
 
-static const struct QemuSeccompSyscall blacklist[] = {
-    /* default set of syscalls to blacklist */
+static const struct QemuSeccompSyscall denylist[] = {
+    /* default set of syscalls that should get blocked */
     { SCMP_SYS(reboot),                 QEMU_SECCOMP_SET_DEFAULT },
     { SCMP_SYS(swapon),                 QEMU_SECCOMP_SET_DEFAULT },
     { SCMP_SYS(swapoff),                QEMU_SECCOMP_SET_DEFAULT },
@@ -175,18 +175,18 @@ static int seccomp_start(uint32_t seccomp_opts, Error **errp)
         goto seccomp_return;
     }
 
-    for (i = 0; i < ARRAY_SIZE(blacklist); i++) {
+    for (i = 0; i < ARRAY_SIZE(denylist); i++) {
         uint32_t action;
-        if (!(seccomp_opts & blacklist[i].set)) {
+        if (!(seccomp_opts & denylist[i].set)) {
             continue;
         }
 
-        action = qemu_seccomp_get_action(blacklist[i].set);
-        rc = seccomp_rule_add_array(ctx, action, blacklist[i].num,
-                                    blacklist[i].narg, blacklist[i].arg_cmp);
+        action = qemu_seccomp_get_action(denylist[i].set);
+        rc = seccomp_rule_add_array(ctx, action, denylist[i].num,
+                                    denylist[i].narg, denylist[i].arg_cmp);
         if (rc < 0) {
             error_setg_errno(errp, -rc,
-                             "failed to add seccomp blacklist rules");
+                             "failed to add seccomp denylist rules");
             goto seccomp_return;
         }
     }
-- 
2.29.2


