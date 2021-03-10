Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF29334A35
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 22:57:54 +0100 (CET)
Received: from localhost ([::1]:51974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6q0-0002SX-Ko
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 16:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6eB-0003EZ-3J; Wed, 10 Mar 2021 16:45:39 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:57163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6e1-0004T1-C7; Wed, 10 Mar 2021 16:45:38 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MOAmt-1l4TQw1lJB-00OXej; Wed, 10 Mar 2021 22:45:23 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 15/22] qemu-options: Replace the word 'blacklist'
Date: Wed, 10 Mar 2021 22:44:57 +0100
Message-Id: <20210310214504.1183162-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kWnAYQYaet/ZldL1DFi/nwFUd7xildn1gGPJDlOWG25wYY8/Os4
 XzZzU9QMMBFsq07r5i+u2udD2doSVul9lrMA5jvySxOys6a5P323XWMYifIF32g9AczRuSw
 /E3cUGYz5vR2I0YHZFIiJdN56ASn/JqpR5iZaKArf8bRbwL6ErEGum3rZtfxNgwJdxvsbab
 iI7NJLRbzcyCI4hcAeNUA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mFCBEVc5Cj8=:lFy+5+ZAdVe3NaSDWS22r4
 z7993fdUujOqeY3hHQwlKRFHQlOAv7/wARaDod8JJ4SF0IcBxe4rgQ47OGMv/hsR91UL57uJf
 IukCb2Muldg/rQvn1fhUvArVfXuD6V/ch/LDle4pxLfGFvoENUJySf9mV09a1JALV2FyVQNDr
 kGANvbvCSMMdtBjDuOLp39jMsIiUZ7r61T2s9T0Nx2Mlv9Frnpj7VcJ8FZycVnEBrTKU9yWla
 ca4z0ER5MzxC8alt/qou9y23OjrHZT6FLV19IspZY3qaS2fH23+39PXS4t0uFHLGuvAT4SWV7
 wmJVTUEF1xEcIjW3OFW86bXb0Pp4K8bl83N+P2q+kurPS1CSaskRDNquhm3mt7Rh5mPVgM6lk
 DT/CGcAaOlOczwTSPKZPc7Oq9sNfPlNXcohLLVJdvsA0MIjIiq+EWUN27sENqpBKrpZ9g53kN
 YECtylXM+Q==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210303184644.1639691-5-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qemu-options.hx | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index c324633fcaad..622d3bfa5a7d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4299,12 +4299,12 @@ DEF("sandbox", HAS_ARG, QEMU_OPTION_sandbox, \
     "                use 'obsolete' to allow obsolete system calls that are provided\n" \
     "                    by the kernel, but typically no longer used by modern\n" \
     "                    C library implementations.\n" \
-    "                use 'elevateprivileges' to allow or deny QEMU process to elevate\n" \
-    "                    its privileges by blacklisting all set*uid|gid system calls.\n" \
+    "                use 'elevateprivileges' to allow or deny the QEMU process ability\n" \
+    "                    to elevate privileges using set*uid|gid system calls.\n" \
     "                    The value 'children' will deny set*uid|gid system calls for\n" \
     "                    main QEMU process but will allow forks and execves to run unprivileged\n" \
     "                use 'spawn' to avoid QEMU to spawn new threads or processes by\n" \
-    "                     blacklisting *fork and execve\n" \
+    "                     blocking *fork and execve\n" \
     "                use 'resourcecontrol' to disable process affinity and schedular priority\n",
     QEMU_ARCH_ALL)
 SRST
-- 
2.29.2


