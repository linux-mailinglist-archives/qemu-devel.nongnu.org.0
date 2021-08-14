Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AE13EC0D7
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 08:12:45 +0200 (CEST)
Received: from localhost ([::1]:59618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEmuS-000181-DD
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 02:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEms4-0006ma-DH
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEms0-0004Gg-En
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628921411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ldNbEgSJd0SEWlZ0i0V8XqOSJX37Gz7p9mh3aw84DlM=;
 b=Is4Yx5ZNezbuDCmmNMgKTgYi2QTwQ6OLnTHJOocAtZk2Dqu2rcXth5cViql6Ax4Pcs9fRf
 oR6W9i8lk/IQHlRyVabqklW3Xhyi2j7zEF+d1Y9ZrnX7zfT/jDjBsl/tD9fQnrzWqMpEPH
 TraMOhT+LKK0k+8qroAVOzB8OL8uZvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-gsp9AC3bNUev2Xhtk8xsBg-1; Sat, 14 Aug 2021 02:10:08 -0400
X-MC-Unique: gsp9AC3bNUev2Xhtk8xsBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9D1F8015C7;
 Sat, 14 Aug 2021 06:10:07 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFC155D9D5;
 Sat, 14 Aug 2021 06:10:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 01/11] gitlab: exclude sparc-softmmu and riscv32-softmmu from
 cross builds
Date: Sat, 14 Aug 2021 08:09:46 +0200
Message-Id: <20210814060956.12852-2-thuth@redhat.com>
In-Reply-To: <20210814060956.12852-1-thuth@redhat.com>
References: <20210814060956.12852-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

We need to cut down compile time by excluding more targets. Both these
targets still have their 64-bit variant enabled, so the loss of coverage
is mitigated to some degree.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210810140653.3969823-2-berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuild-template.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 7d3ad00a1e..cfb576b54c 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -9,7 +9,8 @@
       ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
         --disable-user --target-list-exclude="arm-softmmu cris-softmmu
           i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
-          mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
+          mips64-softmmu ppc-softmmu riscv32-softmmu sh4-softmmu
+          sparc-softmmu xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
     - if grep -q "EXESUF=.exe" config-host.mak;
       then make installer;
-- 
2.27.0


