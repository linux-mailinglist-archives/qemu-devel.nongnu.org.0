Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEBB415056
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:07:32 +0200 (CEST)
Received: from localhost ([::1]:51530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7ac-0001Dt-GH
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mT6hO-0007DW-LP
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:10:29 -0400
Received: from [115.28.160.31] (port=40390 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mT6hK-0007RT-UV
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:10:25 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 11D7C63411;
 Thu, 23 Sep 2021 02:09:46 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632334186; bh=TNNQFvX5KdoW4SMbwwlehpe4Z+vXbC8CH6v++qzY5+g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DJXJSNBdg5HjFMa+DzO+GS0MKSnL5sCmeiOu7/cUcx6ltOlL7K8Xz3Pd+3MrKubRR
 vYlbkw1ckkEfDelMOvuBx4AQYdcDav38JAPVCwTQQ2IU8wQ0qC+RYyccNOaC3ouZxl
 TAqx1yKbkt6LwdMtpz9ODqrDl1Q/StKx66HglIe0=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/30] configure,
 meson.build: Mark support for loongarch64 hosts
Date: Thu, 23 Sep 2021 02:09:27 +0800
Message-Id: <20210922180927.666273-31-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922180927.666273-1-git@xen0n.name>
References: <20210922180927.666273-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure   | 7 ++++++-
 meson.build | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 1043ccce4f..3a9035385d 100755
--- a/configure
+++ b/configure
@@ -659,6 +659,8 @@ elif check_define __arm__ ; then
   cpu="arm"
 elif check_define __aarch64__ ; then
   cpu="aarch64"
+elif check_define __loongarch64 ; then
+  cpu="loongarch64"
 else
   cpu=$(uname -m)
 fi
@@ -667,7 +669,7 @@ ARCH=
 # Normalise host CPU name and set ARCH.
 # Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
-  ppc|ppc64|s390x|sparc64|x32|riscv32|riscv64)
+  ppc|ppc64|s390x|sparc64|x32|riscv32|riscv64|loongarch64)
   ;;
   ppc64le)
     ARCH="ppc64"
@@ -4969,6 +4971,9 @@ if test "$linux" = "yes" ; then
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
index 15ef4d3c41..fc55712ac3 100644
--- a/meson.build
+++ b/meson.build
@@ -57,7 +57,7 @@ python = import('python').find_installation()
 
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
 supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64',
-  'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
+  'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc', 'sparc64']
 
 cpu = host_machine.cpu_family()
 targetos = host_machine.system()
-- 
2.33.0


