Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8C2257DDC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 17:45:18 +0200 (CEST)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kClzh-0003Ll-5W
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 11:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kClyi-0002wh-9G
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 11:44:16 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48223
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kClyf-0002jZ-Kz
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 11:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598888651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=VSNLuOT9Rvr+qpBnfv5a1XgxRmpKs2V2gsuVXCjOITQ=;
 b=QG66kYyT8M8rHeBoYzkAgvrwiyyTUzBHru+HQSt6xMXfWTRSN2W/OxYxkTBkJuS2gzknDG
 RCvTyTV/9c6I+q34DPTtFpt8c5J2isz89UIz+JOFTTTuHwlVw+J2ymLg6+vWSUbMuVShkH
 kpLrNHYAVAiRwXb5nbr9iIP/zLsoA4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-ool_343xN0SaQJu_eVgn-g-1; Mon, 31 Aug 2020 11:44:09 -0400
X-MC-Unique: ool_343xN0SaQJu_eVgn-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77D731007468;
 Mon, 31 Aug 2020 15:44:08 +0000 (UTC)
Received: from thuth.com (ovpn-112-174.ams2.redhat.com [10.36.112.174])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D25716E28;
 Mon, 31 Aug 2020 15:44:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Subject: [PATCH] cirrus.yml: Split FreeBSD job into two parts
Date: Mon, 31 Aug 2020 17:44:05 +0200
Message-Id: <20200831154405.229706-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 03:06:35
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
Cc: berrange@redhat.com
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


