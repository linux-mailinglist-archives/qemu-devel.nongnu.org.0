Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A560247B9EE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 07:18:18 +0100 (CET)
Received: from localhost ([::1]:47262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzYTZ-0000zE-OD
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 01:18:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mzXvP-0002EF-IS
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 00:42:59 -0500
Received: from mail.xen0n.name ([115.28.160.31]:56674
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mzXvN-000279-G6
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 00:42:59 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 4D099607C1;
 Tue, 21 Dec 2021 13:42:31 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1640065351; bh=79QBXIBi5bYqgLBij5f9aHTKf9Ms7dFeAXnR5Z/d/K0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QeeR19vvBTrhkECivVwA9meKiukvS+Rh0HsZOlya6Xda8McylDuzvCxP4CR9AogFF
 sn7SH3p28IunLqUCV2zg+Kiw/TbJjweC2y9MuIZUT1ayTL8EzewVVBIZylywIgN4s7
 7IdxX0ZcyDZ0WmpzJCjd/ERXLb88PZ7lsSH+WSCI=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 30/31] configure,
 meson.build: Mark support for loongarch64 hosts
Date: Tue, 21 Dec 2021 13:41:04 +0800
Message-Id: <20211221054105.178795-31-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211221054105.178795-1-git@xen0n.name>
References: <20211221054105.178795-1-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Example output of `uname -a` on an initial Gentoo LA64 port, running
the upstream submission version of Linux (with some very minor patches
not influencing output here):

> Linux <hostname> 5.14.0-10342-g37a00851b145 #5 SMP PREEMPT Tue Aug 10 12:56:24 PM CST 2021 loongarch64 GNU/Linux

And the same on the vendor-supplied Loongnix 20 system, with an early
in-house port of Linux, and using the old-world ABI:

> Linux <hostname> 4.19.167-rc5.lnd.1-loongson-3 #1 SMP Sat Apr 17 07:32:32 UTC 2021 loongarch64 loongarch64 loongarch64 GNU/Linux

So a name of "loongarch64" matches both, fortunately.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configure   | 5 +++++
 meson.build | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 8ccfe51673..9724631609 100755
--- a/configure
+++ b/configure
@@ -631,6 +631,8 @@ elif check_define __arm__ ; then
   cpu="arm"
 elif check_define __aarch64__ ; then
   cpu="aarch64"
+elif check_define __loongarch64 ; then
+  cpu="loongarch64"
 else
   cpu=$(uname -m)
 fi
@@ -3719,6 +3721,9 @@ if test "$linux" = "yes" ; then
   aarch64)
     linux_arch=arm64
     ;;
+  loongarch*)
+    linux_arch=loongarch
+    ;;
   mips64)
     linux_arch=mips
     ;;
diff --git a/meson.build b/meson.build
index f45ecf31bd..6d7c02bad7 100644
--- a/meson.build
+++ b/meson.build
@@ -56,7 +56,7 @@ python = import('python').find_installation()
 
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
 supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64',
-  'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
+  'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc', 'sparc64']
 
 cpu = host_machine.cpu_family()
 
-- 
2.34.0


