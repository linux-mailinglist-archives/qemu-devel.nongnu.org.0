Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1243E5C9F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 16:12:24 +0200 (CEST)
Received: from localhost ([::1]:47560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSUQ-0003FG-RB
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 10:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDSPY-0002T0-5U
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDSPW-0001jO-LW
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:07:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628604438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6g8J1vetIzSuRtmyqSpfWs2Y05ZqV9heLQhUZe08Ccc=;
 b=N38vM/a6s9JrXNW8wKqQUmC6oavVx5vKsHRn4d3zo69cFzgGMCxI3bTUTqGNJaIu0f30CT
 hGWyf9/ROWyDNVx0YBr/H2beio7bMzbjTqD9+X0fsCRguqvEGA32UZwXfYlLo2iA6cipXj
 Rny1jmJns/4TiHDbK6AiAfl6YSqf+gk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-TwxLhq1WPSqQExIu7Zr6_Q-1; Tue, 10 Aug 2021 10:07:14 -0400
X-MC-Unique: TwxLhq1WPSqQExIu7Zr6_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE52C6409C;
 Tue, 10 Aug 2021 14:07:13 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10B4626DD8;
 Tue, 10 Aug 2021 14:07:11 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] gitlab: skip many more targets in windows cross builds
Date: Tue, 10 Aug 2021 15:06:53 +0100
Message-Id: <20210810140653.3969823-3-berrange@redhat.com>
In-Reply-To: <20210810140653.3969823-1-berrange@redhat.com>
References: <20210810140653.3969823-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The windows cross builds still take way too long in gitlab CI, so need
more targets to be skipped. We don't want to hurt coverage of other
cross builds more though, so we let jobs fine tune with a new env
variale $CROSS_SKIP_TARGETS.

We take the set of targets that are considered relatively niche or
very old architectures, and skip approx half of them in win32 builds
and the other half of them in win64.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/crossbuild-template.yml | 2 +-
 .gitlab-ci.d/crossbuilds.yml         | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index cfb576b54c..10d22dcf6c 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -10,7 +10,7 @@
         --disable-user --target-list-exclude="arm-softmmu cris-softmmu
           i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
           mips64-softmmu ppc-softmmu riscv32-softmmu sh4-softmmu
-          sparc-softmmu xtensa-softmmu"
+          sparc-softmmu xtensa-softmmu $CROSS_SKIP_TARGETS"
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
     - if grep -q "EXESUF=.exe" config-host.mak;
       then make installer;
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 4ff3aa3cfc..a5f9dbcbeb 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -160,6 +160,7 @@ cross-win32-system:
     job: win32-fedora-cross-container
   variables:
     IMAGE: fedora-win32-cross
+    CROSS_SKIP_TARGETS: or1k-softmmu rx-softmmu sh4eb-softmmu sparc64-softmmu tricore-softmmu xtensaeb-softmmu
   artifacts:
     paths:
       - build/qemu-setup*.exe
@@ -170,6 +171,7 @@ cross-win64-system:
     job: win64-fedora-cross-container
   variables:
     IMAGE: fedora-win64-cross
+    CROSS_SKIP_TARGETS: alpha-softmmu avr-softmmu hppa-softmmu m68k-softmmu microblazeel-softmmu mips64el-softmmu nios2-softmmu
   artifacts:
     paths:
       - build/qemu-setup*.exe
-- 
2.31.1


