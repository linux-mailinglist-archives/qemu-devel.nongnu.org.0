Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768B1129E9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 10:30:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36531 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMTZy-00023s-NS
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 04:30:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55082)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <ao2@ao2.it>)
	id 1hMTXu-0000ye-Qn
	for qemu-devel@nongnu.org; Fri, 03 May 2019 04:27:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ao2@ao2.it>) id 1hMTXt-0006vm-OC
	for qemu-devel@nongnu.org; Fri, 03 May 2019 04:27:54 -0400
Received: from mail.ao2.it ([2001:4b98:dc0:41:216:3eff:fe7c:639b]:39643
	helo=ao2.it)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ao2@ao2.it>) id 1hMTXt-0006tw-BL
	for qemu-devel@nongnu.org; Fri, 03 May 2019 04:27:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ao2.it;
	s=20180927; 
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=+Ua6EzAy78sUfLQXiETF12f6tHOHpnJVclVZ/xwH61c=; 
	b=wKccKUPxouVpuSVWjux9mcCBIlqr1/GYYiAUpy5DnpalkRyBj2tBXyer87LDEy+8yjqKdEoHzL8aNSMPZ7MvAdK3rQP/zM+OGwvFHzJ0xDKBBp5ooCKxL/ibB7Bn1dY7aBmp0BsPT3FN15gvUR9q2SNp4+Fw91iecXL2fhwNk8OcZFdphsV2c3TTqm69VI88Z4iV5P+DTLl4g9qZMcNAihE7iE/fBKzaxeuHD4GnBLY/TEE8dmLMvyCsbuX2OvavjVld8QkBuFf2hAuN6WiepgHNeFegS98BTWi+QkJgRjJ+fpRzZ8fuidk4WD/NazgTDZ3e3yX6YMiDQlI1iEl4uw==;
Received: from localhost ([::1] helo=jcn)
	by ao2.it with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.84_2) (envelope-from <ao2@ao2.it>)
	id 1hMTXl-0001Lm-NG; Fri, 03 May 2019 10:27:45 +0200
Received: from ao2 by jcn with local (Exim 4.92) (envelope-from <ao2@ao2.it>)
	id 1hMTXm-0004Ii-HD; Fri, 03 May 2019 10:27:46 +0200
From: Antonio Ospite <ao2@ao2.it>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 10:27:28 +0200
Message-Id: <20190503082728.16485-3-ao2@ao2.it>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503082728.16485-1-ao2@ao2.it>
References: <20190503082728.16485-1-ao2@ao2.it>
MIME-Version: 1.0
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:4b98:dc0:41:216:3eff:fe7c:639b
Subject: [Qemu-devel] [PATCH v2 2/2] configure: disallow spaces and colons
 in source path and build path
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Antonio Ospite <ao2@ao2.it>,
	Antonio Ospite <antonio.ospite@collabora.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Antonio Ospite <antonio.ospite@collabora.com>

The configure script breaks when the qemu source directory is in a path
containing white spaces, in particular the list of targets is not
correctly generated when calling "./configure --help" because of how the
default_target_list variable is built.

In addition to that, *building* qemu from a directory with spaces breaks
some assumptions in the Makefiles, even if the original source path does
not contain spaces like in the case of an out-of-tree build, or when
symlinks are involved.

To avoid these issues, refuse to run the configure script and the
Makefile if there are spaces or colons in the source path or the build
path, taking as inspiration what the kbuild system in linux does.

Buglink: https://bugs.launchpad.net/qemu/+bug/1817345

Signed-off-by: Antonio Ospite <antonio.ospite@collabora.com>
---
 Makefile  | 4 ++++
 configure | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/Makefile b/Makefile
index 1211e78c91..7f3f7a7fef 100644
--- a/Makefile
+++ b/Makefile
@@ -1,5 +1,9 @@
 # Makefile for QEMU.
 
+ifneq ($(words $(subst :, ,$(CURDIR))), 1)
+  $(error main directory cannot contain spaces nor colons)
+endif
+
 # Always point to the root of the build tree (needs GNU make).
 BUILD_DIR=$(CURDIR)
 
diff --git a/configure b/configure
index 9832cbca5c..f7ad4381bd 100755
--- a/configure
+++ b/configure
@@ -279,6 +279,12 @@ ld_has() {
 # make source path absolute
 source_path=$(cd "$(dirname -- "$0")"; pwd)
 
+if printf "%s\n" "$source_path" | grep -q "[[:space:]:]" ||
+  printf "%s\n" "$PWD" | grep -q "[[:space:]:]";
+then
+  error_exit "main directory cannot contain spaces nor colons"
+fi
+
 # default parameters
 cpu=""
 iasl="iasl"
-- 
2.20.1


