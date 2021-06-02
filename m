Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA3B398353
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:42:28 +0200 (CEST)
Received: from localhost ([::1]:48390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLWF-0005ir-MQ
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQf-0000Is-Ff
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQb-0003u8-0l
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622619395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2eqeKOvBmrC0eKKvq1TmwSg0ldJ96MCY9EK7Yj+EBxY=;
 b=fO4Bwc0Xq4Qb6mAYbzVjsSbq7LQ90IujjGU1bhsUHdvMaapVgLBsv4EFpGkFqokPa0HAB3
 Dunzt31udhkav4P13zUUwbbqylLkgzWRq6J3pejD7QTJ/Ik4BrKkBr68V+gYozzRHhs4nj
 CyECrrAoGr/5B3IMlJVo9Q7J7LrUdGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-MPwf8Q7RMZuSeBUJSteHLw-1; Wed, 02 Jun 2021 03:36:33 -0400
X-MC-Unique: MPwf8Q7RMZuSeBUJSteHLw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C60921854E25;
 Wed,  2 Jun 2021 07:36:32 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA6885C67A;
 Wed,  2 Jun 2021 07:36:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/17] crypto: bump min gnutls to 3.5.18,
 dropping RHEL-7 support
Date: Wed,  2 Jun 2021 09:36:00 +0200
Message-Id: <20210602073606.338994-12-thuth@redhat.com>
In-Reply-To: <20210602073606.338994-1-thuth@redhat.com>
References: <20210602073606.338994-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

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
Message-Id: <20210514120415.1368922-7-berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
[thuth: rebased to use .gitlab-ci.d/buildtest.yml]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 15 ---------------
 configure                  |  2 +-
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index fe44a5c2be..b72c57e4df 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -626,21 +626,6 @@ build-coroutine-sigaltstack:
                     --enable-trace-backends=ftrace
     MAKE_CHECK_ARGS: check-unit
 
-# Most jobs test latest gcrypt or nettle builds
-#
-# These jobs test old gcrypt and nettle from RHEL7
-# which had some API differences.
-crypto-only-gnutls:
-  extends: .native_build_job_template
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
   extends: .native_build_job_template
diff --git a/configure b/configure
index fb8c5187e8..b36df40c27 100755
--- a/configure
+++ b/configure
@@ -2801,7 +2801,7 @@ fi
 
 if test "$gnutls" != "no"; then
     pass="no"
-    if $pkg_config --exists "gnutls >= 3.1.18"; then
+    if $pkg_config --exists "gnutls >= 3.5.18"; then
         gnutls_cflags=$($pkg_config --cflags gnutls)
         gnutls_libs=$($pkg_config --libs gnutls)
         # Packaging for the static libraries is not always correct.
-- 
2.27.0


