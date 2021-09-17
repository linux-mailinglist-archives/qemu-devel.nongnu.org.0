Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6636F40F543
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 11:49:48 +0200 (CEST)
Received: from localhost ([::1]:36128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRAV9-0003QI-HS
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 05:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mRAUF-0002lR-EU
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mRAUB-0003q8-8o
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631872126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LQAzm+Ao/YYgWMgvlmZ8MSs5GPUWQkW/b35fTbokEP0=;
 b=F1s/Ug03OXYQgp9D+cuwJM1j2EKBzL3ngBtGnXtjGyte0fgBhb6in4+Jt9TcQjAG0TDUPK
 hBUV5xbap/WZYVgnH+m/jVDS7dp8OCmVXrmrQ9KuQ092Y9WjbRctR6ClmRir2RpnkP7p5z
 6kAsb4s/2Uj1SZfb2Lv/pZO6fpDgSrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-e75nstFhPfOt9qYOIhiwCg-1; Fri, 17 Sep 2021 05:48:43 -0400
X-MC-Unique: e75nstFhPfOt9qYOIhiwCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42B498B426B;
 Fri, 17 Sep 2021 09:48:33 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20BAA5FCCD;
 Fri, 17 Sep 2021 09:48:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] travis.yml: Remove the "Release tarball" job
Date: Fri, 17 Sep 2021 11:48:26 +0200
Message-Id: <20210917094826.466047-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a leftover from the days when we were using Travis excessively,
but since x86 jobs are not really usable there anymore, this job has
likely never been used since many months. Let's simply remove it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .travis.yml | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 0faddf7b4e..41010ebe6b 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -305,26 +305,3 @@ jobs:
         - CONFIG="--disable-containers --disable-tcg --enable-kvm
                   --disable-tools --host-cc=clang --cxx=clang++"
         - UNRELIABLE=true
-
-    # Release builds
-    # The make-release script expect a QEMU version, so our tag must start with a 'v'.
-    # This is the case when release candidate tags are created.
-    - name: "Release tarball"
-      if: tag IS present AND tag =~ /^v\d+\.\d+(\.\d+)?(-\S*)?$/
-      env:
-        # We want to build from the release tarball
-        - BUILD_DIR="release/build/dir" SRC_DIR="../../.."
-        - BASE_CONFIG="--prefix=$PWD/dist"
-        - CONFIG="--target-list=x86_64-softmmu,aarch64-softmmu,armeb-linux-user,ppc-linux-user"
-        - TEST_CMD="make install -j${JOBS}"
-        - QEMU_VERSION="${TRAVIS_TAG:1}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-      script:
-        - make -C ${SRC_DIR} qemu-${QEMU_VERSION}.tar.bz2
-        - ls -l ${SRC_DIR}/qemu-${QEMU_VERSION}.tar.bz2
-        - tar -xf ${SRC_DIR}/qemu-${QEMU_VERSION}.tar.bz2 && cd qemu-${QEMU_VERSION}
-        - mkdir -p release-build && cd release-build
-        - ../configure ${BASE_CONFIG} ${CONFIG} || { cat config.log meson-logs/meson-log.txt && exit 1; }
-        - make install
-  allow_failures:
-    - env: UNRELIABLE=true
-- 
2.27.0


