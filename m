Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E26334A38
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 22:58:46 +0100 (CET)
Received: from localhost ([::1]:54052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6qq-0003QT-Tp
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 16:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6e7-0003CG-OT; Wed, 10 Mar 2021 16:45:37 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:59493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dy-0004Rz-V9; Wed, 10 Mar 2021 16:45:35 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MNtny-1l4kY424Do-00OGfo; Wed, 10 Mar 2021 22:45:20 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 12/22] ui: Replace the word 'whitelist'
Date: Wed, 10 Mar 2021 22:44:54 +0100
Message-Id: <20210310214504.1183162-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:L/vv0OoqUw5KlydYVcs6xppIXMa53CcIZ9qKVc6zKeZ1pL5tUKH
 kSqRDJ95csz1HqlcIhNOoCo+53FmkdQfzIf/yjB0YyrI8q8Oelglfn0KisTb5xFzDk46YvF
 zukcImXjfbMtXJwpAyjcUKHEgVGq7Zq3tmtA7PoDpp1kefmOYnScfi0Hegl33vqZZq+PaGQ
 TA7lm9crJ0bYUmqwA6VaQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9MikpEA61eY=:+pngVyoQht5OvdesxKOAJW
 K6s6un7LxbQgP0RnFmYZZm+H0X3wHPaHS/reELcZILfkeNPhJ6sMzkbc8vkr+tdGhuIDvqiJZ
 FP5xCJbJkYZFn+rrwThv859tYkMbn0FVaF4PP/tF2b4chRbprtJdGT0eSdiyfs41FJN3cy8iN
 dQEHkiml2bgMFxz3J2CH5uLOsGHRdO0ZKZG//5XvzJK4gv10+W4rlunwPiKy7Kmqt1CBcvQYo
 BvY1KncT38v9tVB4UVJ9rAOeft5gYjSZKQDK6XYOKwaZ6UaXPZq7WBF88FInTJ7o+8uW+h3wr
 QnHhuL4KLbulEo0zPkdGlD3FXvk2j5/6CbLObtpFZ5AUiEkipS4YBAUYiLaC2Tt8SAQ0G4eMx
 4cAkWqN8qJHa08dOszmkXiy5uYpDp5E9JZMcmDTYaTd7K2noS+SsifMjOpj66hOhOBndi6LuS
 a0O7kdI9qg==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the words "whitelist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210303184644.1639691-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 ui/console.c       | 2 +-
 ui/vnc-auth-sasl.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 171a7bf14b94..c2fdf975b6b3 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1724,7 +1724,7 @@ bool dpy_gfx_check_format(QemuConsole *con,
                 return false;
             }
         } else {
-            /* default is to whitelist native 32 bpp only */
+            /* default is to allow native 32 bpp only */
             if (format != qemu_default_pixman_format(32, true)) {
                 return false;
             }
diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
index f67111a3662a..df7dc08e9fc5 100644
--- a/ui/vnc-auth-sasl.c
+++ b/ui/vnc-auth-sasl.c
@@ -288,7 +288,7 @@ static int protocol_client_auth_sasl_step(VncState *vs, uint8_t *data, size_t le
             goto authreject;
         }
 
-        /* Check username whitelist ACL */
+        /* Check the username access control list */
         if (vnc_auth_sasl_check_access(vs) < 0) {
             goto authreject;
         }
@@ -409,7 +409,7 @@ static int protocol_client_auth_sasl_start(VncState *vs, uint8_t *data, size_t l
             goto authreject;
         }
 
-        /* Check username whitelist ACL */
+        /* Check the username access control list */
         if (vnc_auth_sasl_check_access(vs) < 0) {
             goto authreject;
         }
-- 
2.29.2


