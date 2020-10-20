Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189AF28BF4B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 19:59:14 +0200 (CEST)
Received: from localhost ([::1]:60792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS26L-0005ik-6U
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 13:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slyfox@gentoo.org>)
 id 1kS250-00054w-Me; Mon, 12 Oct 2020 13:57:54 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:42556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <slyfox@gentoo.org>)
 id 1kS24x-0000S2-6x; Mon, 12 Oct 2020 13:57:50 -0400
Received: by sf.home (Postfix, from userid 1000)
 id 79F055A22072; Mon, 12 Oct 2020 18:57:40 +0100 (BST)
From: Sergei Trofimovich <slyfox@gentoo.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson.build: drop duplicate 'sparc64' entry
Date: Mon, 12 Oct 2020 18:57:19 +0100
Message-Id: <20201012175719.2573367-1-slyfox@gentoo.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <823880d6-ec51-e014-bc69-155102e1b43d@vivier.eu>
References: <823880d6-ec51-e014-bc69-155102e1b43d@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=140.211.166.183; envelope-from=slyfox@gentoo.org;
 helo=smtp.gentoo.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 13:49:37
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Sergei Trofimovich <slyfox@gentoo.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC: Laurent Vivier <laurent@vivier.eu>
CC: qemu-trivial@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index a02c743794..48e7c56cc1 100644
--- a/meson.build
+++ b/meson.build
@@ -41,7 +41,7 @@ have_block = have_system or have_tools
 python = import('python').find_installation()
 
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
-supported_cpus = ['ppc', 'ppc64', 's390x', 'sparc64', 'riscv32', 'riscv64', 'x86', 'x86_64',
+supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64',
   'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
 
 cpu = host_machine.cpu_family()
-- 
2.28.0


