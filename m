Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59962238DE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jul 2020 12:02:03 +0200 (CEST)
Received: from localhost ([::1]:51658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwNBq-0000dB-7X
	for lists+qemu-devel@lfdr.de; Fri, 17 Jul 2020 06:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jwN6M-0002L3-54
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 05:56:22 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51415
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jwN6K-0001CO-Ga
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 05:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594979779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=S+NxEYjQhiR7ZlQQLlZcKwhAMkulU6hOsdS2i0RjHSI=;
 b=Ou1tX62HL28ZIOu02w6V1P0F2xu61VpwvMAlgUj98q289HBV0NDTlfbsgq5K2/fhH6GZhn
 aj0p5TWgGQJbcZrJDR210NO+gR/QX6VXAHFNHSjeOjM+hPyApqmBC8EtqGvmXfKKH/Fd8+
 zJt5zrEILS9m0OyQWq4HRRL1Ao4wRe8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-qhCnN9YhMBK88diLrVu2OQ-1; Fri, 17 Jul 2020 05:56:17 -0400
X-MC-Unique: qhCnN9YhMBK88diLrVu2OQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 508721080;
 Fri, 17 Jul 2020 09:56:16 +0000 (UTC)
Received: from thuth.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77C5A5C240;
 Fri, 17 Jul 2020 09:56:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 6/6] gitlab-ci.yml: Add fuzzer tests
Date: Fri, 17 Jul 2020 11:56:05 +0200
Message-Id: <20200717095605.27589-7-thuth@redhat.com>
In-Reply-To: <20200717095605.27589-1-thuth@redhat.com>
References: <20200717095605.27589-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/17 05:27:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

So far we neither compile-tested nor run any of the new fuzzers in our CI,
which led to some build failures of the fuzzer code in the past weeks.
To avoid this problem, add a job to compile the fuzzer code and run some
loops (which likely don't find any new bugs via fuzzing, but at least we
know that the code can still be run).

A nice side-effect of this test is that the leak tests are enabled here,
so we should now notice some of the memory leaks in our code base earlier.

Message-Id: <20200716100950.27396-1-thuth@redhat.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5eeba2791b..41597c3603 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -161,9 +161,27 @@ build-clang:
     IMAGE: fedora
     CONFIGURE_ARGS: --cc=clang --cxx=clang++
     TARGETS: alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu
-      ppc-softmmu s390x-softmmu x86_64-softmmu arm-linux-user
+      ppc-softmmu s390x-softmmu arm-linux-user
     MAKE_CHECK_ARGS: check
 
+build-fuzzer:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: fedora
+  script:
+    - mkdir build
+    - cd build
+    - ../configure --cc=clang --cxx=clang++ --enable-fuzzing
+                   --enable-sanitizers --target-list=x86_64-softmmu
+    - make -j"$JOBS" all check-build x86_64-softmmu/fuzz
+    - make check
+    - for fuzzer in i440fx-qos-fork-fuzz i440fx-qos-noreset-fuzz
+        i440fx-qtest-reboot-fuzz virtio-scsi-flags-fuzz virtio-scsi-fuzz ; do
+          echo Testing ${fuzzer} ... ;
+          x86_64-softmmu/qemu-fuzz-x86_64 --fuzz-target=${fuzzer} -runs=1000
+            || exit 1 ;
+      done
+
 build-tci:
   <<: *native_build_job_definition
   variables:
-- 
2.18.1


