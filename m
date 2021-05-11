Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E41637A7BD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:34:33 +0200 (CEST)
Received: from localhost ([::1]:34114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgSWu-00020k-AM
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgSQu-000869-8s
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:28:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgSQs-00012v-J8
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620739698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YTr53wtUG6JqqhFOqEGJ3TxMVUA3Q1EX0AQ4lUvpWtI=;
 b=gvSYu4pAs5/eY/e5Fq+n8VHLGdx2BPQM5WVHjniWrCFwEFnJ4+xW36WDQ91v6oC4eApkub
 jKj20F2uIz3iqMw+WuHK2PoDgXZdHy1tCDxYTExiSo+WhkNDT0dRTP8/hsDVVeq5+wcknj
 NBzsCpcT6Sczh6hUCyLqULDEDsA2KQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-8sRpjh_TNg2Z-D43I706Lw-1; Tue, 11 May 2021 09:28:15 -0400
X-MC-Unique: 8sRpjh_TNg2Z-D43I706Lw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECC9DCC651;
 Tue, 11 May 2021 13:28:12 +0000 (UTC)
Received: from foo.redhat.com (ovpn-115-93.ams2.redhat.com [10.36.115.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B32B9CA0;
 Tue, 11 May 2021 13:28:10 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/12] crypto: bump min gnutls to 3.5.8,
 dropping RHEL-7 support
Date: Tue, 11 May 2021 14:26:35 +0100
Message-Id: <20210511132641.1022161-7-berrange@redhat.com>
In-Reply-To: <20210511132641.1022161-1-berrange@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
     Debian Stretch: 3.5.8
      Debian Buster: 3.6.7
 openSUSE Leap 15.2: 3.6.7
   Ubuntu LTS 18.04: 3.5.18
   Ubuntu LTS 20.04: 3.6.13
            FreeBSD: 3.6.15
          Fedora 33: 3.6.16
          Fedora 34: 3.7.1
            OpenBSD: 3.6.15
     macOS HomeBrew: 3.6.15

Debian Stretch has the oldest version and so 1.7.6 is the new minimum.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.yml | 15 ---------------
 configure      |  2 +-
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0fefda2674..c5b8ea0d94 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -712,21 +712,6 @@ build-coroutine-sigaltstack:
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
index d5569f9252..69631fad3b 100755
--- a/configure
+++ b/configure
@@ -2790,7 +2790,7 @@ fi
 
 if test "$gnutls" != "no"; then
     pass="no"
-    if $pkg_config --exists "gnutls >= 3.1.18"; then
+    if $pkg_config --exists "gnutls >= 3.5.8"; then
         gnutls_cflags=$($pkg_config --cflags gnutls)
         gnutls_libs=$($pkg_config --libs gnutls)
         # Packaging for the static libraries is not always correct.
-- 
2.31.1


