Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529B225B04A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 17:55:13 +0200 (CEST)
Received: from localhost ([::1]:36190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDV6O-0006nX-Bw
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 11:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDV1H-0000sX-32
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 11:49:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58774
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDV1F-0005SP-3G
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 11:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599061790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4T/dQATnRq/UbP0+yjfKccgYYk0yU7sz2Ycyc9owkWQ=;
 b=icIMRYMi+9P+QCM9tq1nFGWpfgkggJsEUk03hZr7yUFo1hKHiejd63chAiTpJXmVQRWJ1k
 IteZeE/JPLFZAnPxdlO1dc9DOyE6QCwWxxNhHygRJoYtGir9mWLCPwtxNAHtFoTA7cvpRF
 QYd/XOni5MWOYl7rxvDP1NK9hv4fOww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-211NYHY-Os-cU1gSXalCnA-1; Wed, 02 Sep 2020 11:49:47 -0400
X-MC-Unique: 211NYHY-Os-cU1gSXalCnA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09EE0107B794;
 Wed,  2 Sep 2020 15:49:47 +0000 (UTC)
Received: from thuth.com (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 304915D9CC;
 Wed,  2 Sep 2020 15:49:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 05/15] cirrus.yml: Split FreeBSD job into two parts
Date: Wed,  2 Sep 2020 17:49:22 +0200
Message-Id: <20200902154932.390595-6-thuth@redhat.com>
In-Reply-To: <20200902154932.390595-1-thuth@redhat.com>
References: <20200902154932.390595-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:26:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The FreeBSD jobs currently hit the 1h time limit in the Cirrus-CI.
We have to split the build targets here to make sure that the job
finishes in time again. According to the Cirrus-CI docs and some
tests that I did, it also seems like the total amount of CPUs that
can be used for FreeBSD jobs is limited to 8, so each job now only
gets 4 CPUs. That increases the compilation time of each job a little
bit, but it still seems to be better to run two jobs with 4 CPUs each
in parallel than to run two jobs with 8 CPUs sequentially.

Message-Id: <20200831154405.229706-1-thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .cirrus.yml | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 0742aaf8a3..3dd9fcff7f 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -1,20 +1,40 @@
 env:
   CIRRUS_CLONE_DEPTH: 1
 
-freebsd_12_task:
+freebsd_1st_task:
   freebsd_instance:
     image_family: freebsd-12-1
-    cpu: 8
-    memory: 8G
+    cpu: 4
+    memory: 4G
   install_script: ASSUME_ALWAYS_YES=yes pkg bootstrap -f ; pkg install -y
     bash curl cyrus-sasl git glib gmake gnutls gsed
     nettle perl5 pixman pkgconf png usbredir
   script:
     - mkdir build
     - cd build
-    - ../configure --enable-werror || { cat config.log; exit 1; }
-    - gmake -j8
-    - gmake V=1 check
+    - ../configure --disable-user --target-list-exclude='alpha-softmmu
+        ppc64-softmmu ppc-softmmu riscv32-softmmu riscv64-softmmu s390x-softmmu
+        sparc64-softmmu sparc-softmmu x86_64-softmmu i386-softmmu'
+        --enable-werror || { cat config.log; exit 1; }
+    - gmake -j$(sysctl -n hw.ncpu)
+    - gmake -j$(sysctl -n hw.ncpu) check
+
+freebsd_2nd_task:
+  freebsd_instance:
+    image_family: freebsd-12-1
+    cpu: 4
+    memory: 4G
+  install_script: ASSUME_ALWAYS_YES=yes pkg bootstrap -f ; pkg install -y
+    bash curl cyrus-sasl git glib gmake gnutls gtk3 gsed libepoxy mesa-libs
+    nettle perl5 pixman pkgconf png SDL2 usbredir
+  script:
+    - ./configure --enable-werror --target-list='alpha-softmmu ppc64-softmmu
+        ppc-softmmu riscv32-softmmu riscv64-softmmu s390x-softmmu
+        sparc64-softmmu sparc-softmmu x86_64-softmmu i386-softmmu
+        sparc-bsd-user sparc64-bsd-user x86_64-bsd-user i386-bsd-user'
+        || { cat config.log; exit 1; }
+    - gmake -j$(sysctl -n hw.ncpu)
+    - gmake -j$(sysctl -n hw.ncpu) check
 
 macos_task:
   osx_instance:
-- 
2.18.2


