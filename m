Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA953036EE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 07:59:30 +0100 (CET)
Received: from localhost ([::1]:52960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4IK2-0007bX-0A
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 01:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4IIl-0006ab-Hg
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 01:58:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4IIh-00043k-JM
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 01:58:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611644285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=B1c6q9U+8sUe3FtpUgAZPJaqIdOAYObNxB3Lg8L/i6I=;
 b=JQd69hSOfTF5dzjWm5PIGiHVSmz8UxnLaYidzcdOAmQiWXIk+qk9t7FWWJfvUECaJw9qRC
 lhd4f6w8Ua/q8pRWCBOypqWF9LNDSzwMIP3UrsuN0iPLg+mVVQIaWIWcG/cBaFp6tpHv3U
 TQx3ehAFXk1T6EkvRa+lpNGpynqs/Gw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-CIHbTiHnNPmlpwqiw7Ct2Q-1; Tue, 26 Jan 2021 01:58:03 -0500
X-MC-Unique: CIHbTiHnNPmlpwqiw7Ct2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C43F8107ACE4
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 06:58:00 +0000 (UTC)
Received: from thuth.com (ovpn-112-143.ams2.redhat.com [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59C0119D80;
 Tue, 26 Jan 2021 06:57:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci.yml: Avoid recompiling the sources in the test jobs
Date: Tue, 26 Jan 2021 07:57:57 +0100
Message-Id: <20210126065757.403853-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, our check-system-* jobs are recompiling the whole sources
again. This happens due to the fact that the jobs are checking out
the whole source tree and required submodules again, and only try
to use the "build" directory with the binaries and object files as an
artifact from the previous stage - which simply does not work right
anymore (with the current version of meson). Due to some changed
time stamps, meson/ninja are always trying to rebuild the whole tree.

In the long run, we could likely use "meson test --no-rebuild", but
there is still some work going on in that area to improve the user
experience. So until this has been done, simply avoid recompiling the
sources with a trick: pass NINJA=":" to the make process in the test
jobs. Also check out the submodules manually before updating the
timestamps in the build folder, so that the binaries are definitely
newer that all the source files.
This saves ca. 10 - 15 minutes of precious CI cycles in each run.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index de3a3d25b5..16fea25ba9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -38,9 +38,11 @@ include:
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
+    - scripts/git-submodule.sh update
+        $(grep GIT_SUBMODULES build/config-host.mak | sed 's/GIT_SUBMODULES=//')
     - cd build
     - find . -type f -exec touch {} +
-    - make $MAKE_CHECK_ARGS
+    - make NINJA=":" $MAKE_CHECK_ARGS
 
 .acceptance_template: &acceptance_definition
   cache:
-- 
2.27.0


