Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC73382B7E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:51:55 +0200 (CEST)
Received: from localhost ([::1]:37976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libms-0005zn-H5
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libIJ-00061F-Cw
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libIA-0006LL-GD
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621250405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9lXiA4WNg4giItpuoNWZ3EGC8EdNd3bChB2Y0A8AhU=;
 b=hPu23ZPFfzxT7gyudGA6q1pNfSwXxSgqu8olR6DS9lfCB5wporzzT9gYvbp+qpksxi6Nn2
 EOKfp7KnfhjyWyPe9jbPAFRX658D1eE1z3nsmx3ESuOU7Xab1dTYJwnjsA63Icv0JdE74Q
 zll8DT7ZgisHXvx+upf3IBtTjuw5/L4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-o9mZo8z7NjKdIzT6UNL_FA-1; Mon, 17 May 2021 07:20:03 -0400
X-MC-Unique: o9mZo8z7NjKdIzT6UNL_FA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDAAA1854E24
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:20:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97FB790BD
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:20:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/20] configure: simplify assignment to GIT_SUBMODULES
Date: Mon, 17 May 2021 07:19:44 -0400
Message-Id: <20210517112001.2564006-4-pbonzini@redhat.com>
In-Reply-To: <20210517112001.2564006-1-pbonzini@redhat.com>
References: <20210517112001.2564006-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not guard each assignment with a check for --with-git-submodules=ignore.
To avoid a confusing "GIT" line from the Makefile, guard the git-submodule-update
recipe so that it is empty when --with-git-submodules=ignore.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile  |  2 ++
 configure | 20 ++++++--------------
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 4cab10a2a4..30f19d33bb 100644
--- a/Makefile
+++ b/Makefile
@@ -48,9 +48,11 @@ Makefile: .git-submodule-status
 
 .PHONY: git-submodule-update
 git-submodule-update:
+ifneq ($(GIT_SUBMODULES_ACTION),ignore)
 	$(call quiet-command, \
 		(GIT="$(GIT)" "$(SRC_PATH)/scripts/git-submodule.sh" $(GIT_SUBMODULES_ACTION) $(GIT_SUBMODULES)), \
 		"GIT","$(GIT_SUBMODULES)")
+endif
 
 # 0. ensure the build tree is okay
 
diff --git a/configure b/configure
index 4681cbe2d7..55049fe930 100755
--- a/configure
+++ b/configure
@@ -256,11 +256,11 @@ gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
 if test -e "$source_path/.git"
 then
     git_submodules_action="update"
-    git_submodules="ui/keycodemapdb"
 else
     git_submodules_action="ignore"
-    git_submodules=""
 fi
+
+git_submodules="ui/keycodemapdb"
 git="git"
 
 # Don't accept a target_list environment variable.
@@ -3617,9 +3617,7 @@ fi
 case "$fdt" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
-    if test "$git_submodules_action" != "ignore"; then
-      git_submodules="${git_submodules} dtc"
-    fi
+    git_submodules="${git_submodules} dtc"
     ;;
 esac
 
@@ -4328,9 +4326,7 @@ fi
 case "$capstone" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
-    if test "$git_submodules_action" != "ignore"; then
-      git_submodules="${git_submodules} capstone"
-    fi
+    git_submodules="${git_submodules} capstone"
     ;;
 esac
 
@@ -5260,9 +5256,7 @@ fi
 case "$slirp" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
-    if test "$git_submodules_action" != "ignore"; then
-      git_submodules="${git_submodules} slirp"
-    fi
+    git_submodules="${git_submodules} slirp"
     ;;
 esac
 
@@ -5454,9 +5448,7 @@ if test "$cpu" = "s390x" ; then
     roms="$roms s390-ccw"
     # SLOF is required for building the s390-ccw firmware on s390x,
     # since it is using the libnet code from SLOF for network booting.
-    if test "$git_submodules_action" != "ignore"; then
-      git_submodules="${git_submodules} roms/SLOF"
-    fi
+    git_submodules="${git_submodules} roms/SLOF"
   fi
 fi
 
-- 
2.27.0



