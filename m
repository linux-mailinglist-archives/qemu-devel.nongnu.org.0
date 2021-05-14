Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BA3380927
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:06:37 +0200 (CEST)
Received: from localhost ([::1]:41232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWaS-00007T-C7
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhWYv-0005j5-3b
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:05:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhWYt-0006Ld-D3
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620993898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=js88CfIw/sof8cXTkiaHvuNoV7yQFJJrwEDZk5/BaGU=;
 b=bGOCvWjKTeRMMPWC6tMQFZNsVswXkM7kQzWpotPq7+Chk3NMVIXqAE9rKSfhaAHRYNLcmZ
 FKcVLhsX2yI0sHYhiP7Lr3UhtW+cVLdLaXnENxfbOPHwHH3/JKBfyo8v95C4YQM2Uwbm+W
 apMSUU5MTlhWg0U4zQLxpUfqm1s66c0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-OoZrzS-eOFW_eheYxvWW4Q-1; Fri, 14 May 2021 08:04:55 -0400
X-MC-Unique: OoZrzS-eOFW_eheYxvWW4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B4DF8015A8;
 Fri, 14 May 2021 12:04:54 +0000 (UTC)
Received: from localhost.redhat.com (ovpn-113-212.ams2.redhat.com
 [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65FFF1971B;
 Fri, 14 May 2021 12:04:52 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/12] crypto: bump min gnutls to 3.5.18,
 dropping RHEL-7 support
Date: Fri, 14 May 2021 13:04:09 +0100
Message-Id: <20210514120415.1368922-7-berrange@redhat.com>
In-Reply-To: <20210514120415.1368922-1-berrange@redhat.com>
References: <20210514120415.1368922-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It has been over two years since RHEL-8 was released, and thus per the
platform build policy, we no longer need to support RHEL-7 as a build
target. This lets us increment the minimum required gnutls version

Per repology, current shipping versions are:

             RHEL-8: 3.6.14
      Debian Buster: 3.6.7
 openSUSE Leap 15.2: 3.6.7
   Ubuntu LTS 18.04: 3.5.18
   Ubuntu LTS 20.04: 3.6.13
            FreeBSD: 3.6.15
          Fedora 33: 3.6.16
          Fedora 34: 3.7.1
            OpenBSD: 3.6.15
     macOS HomeBrew: 3.6.15

Ubuntu LTS 18.04 has the oldest version and so 3.5.18 is the new minimum.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.yml | 15 ---------------
 configure      |  2 +-
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f44c5b08ef..f386f445d9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -703,21 +703,6 @@ build-coroutine-sigaltstack:
                     --enable-trace-backends=ftrace
     MAKE_CHECK_ARGS: check-unit
 
-# Most jobs test latest gcrypt or nettle builds
-#
-# These jobs test old gcrypt and nettle from RHEL7
-# which had some API differences.
-crypto-only-gnutls:
-  <<: *native_build_job_definition
-  needs:
-    job: amd64-centos7-container
-  variables:
-    IMAGE: centos7
-    TARGETS: x86_64-softmmu x86_64-linux-user
-    CONFIGURE_ARGS: --disable-nettle --disable-gcrypt --enable-gnutls
-    MAKE_CHECK_ARGS: check
-
-
 # Check our reduced build configurations
 build-without-default-devices:
   <<: *native_build_job_definition
diff --git a/configure b/configure
index f077cdb9c3..2fa86ccaa1 100755
--- a/configure
+++ b/configure
@@ -2790,7 +2790,7 @@ fi
 
 if test "$gnutls" != "no"; then
     pass="no"
-    if $pkg_config --exists "gnutls >= 3.1.18"; then
+    if $pkg_config --exists "gnutls >= 3.5.18"; then
         gnutls_cflags=$($pkg_config --cflags gnutls)
         gnutls_libs=$($pkg_config --libs gnutls)
         # Packaging for the static libraries is not always correct.
-- 
2.31.1


