Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077C14CFD98
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:00:47 +0100 (CET)
Received: from localhost ([::1]:43920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRC2g-0004NT-2f
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:00:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6450084a66b6cf72b9126a8c8ecead7ddca896e9@lizzy.crudebyte.com>)
 id 1nRBpi-00008F-TX
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:47:23 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:35455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6450084a66b6cf72b9126a8c8ecead7ddca896e9@lizzy.crudebyte.com>)
 id 1nRBph-0002ln-8S
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:47:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:References:In-Reply-To:Message-Id:Content-ID:
 Content-Description; bh=5oLuXWTJKZvpRWIxoiPJFUVce5lljtpqW3n1BbXrpOw=; b=PBwzf
 8gcOAjiPv2NQPgnzHKOgfbgnzLgN0gQR8RQxQIA4OaT613ZsocBi3IZlONHTXwi3HsJf5VPHuMso8
 F0q8sXL8WihHkFy9S3T2K6pP4N7neM6rouplDjHuU0KpqsA6Ssgit76GSDiwRFradhEMKxH0HUyfR
 V1IF2bR1sxMmTUCfnroQ49ON+/dDVoqQ3hHBF3170N7uRu2QuRUPDYGw8ImguWVh7w1lBQqdrGdLv
 6vXq8/0s7RsmkkClIh0wpLnvx0DI7eeUjmeeUguGsrA0jfvp2fmdej3aT/FLrO36oDExJE/pbmAr5
 trwjcz4muOigw8hs0GSsQ6lfpaBgg==;
Message-Id: <6450084a66b6cf72b9126a8c8ecead7ddca896e9.1646651700.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646651700.git.qemu_oss@crudebyte.com>
References: <cover.1646651700.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 07 Mar 2022 12:15:00 +0100
Subject: [PULL v2 02/19] 9p: Rename 9p-util -> 9p-util-linux
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Will Cohen <wwcohen@gmail.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=6450084a66b6cf72b9126a8c8ecead7ddca896e9@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

The current file only has the Linux versions of these functions.
Rename the file accordingly and update the Makefile to only build
it on Linux. A Darwin version of these will follow later in the
series.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220227223522.91937-3-wwcohen@gmail.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/{9p-util.c => 9p-util-linux.c} | 2 +-
 hw/9pfs/meson.build                    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (97%)

diff --git a/hw/9pfs/9p-util.c b/hw/9pfs/9p-util-linux.c
similarity index 97%
rename from hw/9pfs/9p-util.c
rename to hw/9pfs/9p-util-linux.c
index 3221d9b498..398614a5d0 100644
--- a/hw/9pfs/9p-util.c
+++ b/hw/9pfs/9p-util-linux.c
@@ -1,5 +1,5 @@
 /*
- * 9p utilities
+ * 9p utilities (Linux Implementation)
  *
  * Copyright IBM, Corp. 2017
  *
diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index 99be5d9119..1b28e70040 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -4,7 +4,6 @@ fs_ss.add(files(
   '9p-posix-acl.c',
   '9p-proxy.c',
   '9p-synth.c',
-  '9p-util.c',
   '9p-xattr-user.c',
   '9p-xattr.c',
   '9p.c',
@@ -14,6 +13,7 @@ fs_ss.add(files(
   'coth.c',
   'coxattr.c',
 ))
+fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-util-linux.c'))
 fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
 softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
-- 
2.20.1


