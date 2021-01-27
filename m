Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514113052B0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 07:01:04 +0100 (CET)
Received: from localhost ([::1]:50748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4dsz-0000X1-48
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 01:01:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4drP-0008WN-CC
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 00:59:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4drM-0000Z0-ML
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 00:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611727159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3O7pxM7z0HFjl77zbwQ41VqfS2lpzlsFL/4RzcObj/o=;
 b=f4o+Nk9j4iksNNeRzwFBuUyUcld6Gz5Wun9gsz+6jJa3DEQnHduuKmiflv7jyTFWCyD0mf
 baZnsg5Fd9yRvSd2A8pa5iZA9GcTVRjMfJj5Y9okisVTcYH5qUl00iuxrVfXQPbcnKGZur
 xeVbHLMcP5Om8ue3/lxWPQ//Xw4M/8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-VaENb8ePMRi4IhB_EHT8jA-1; Wed, 27 Jan 2021 00:59:17 -0500
X-MC-Unique: VaENb8ePMRi4IhB_EHT8jA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 073CC802B40;
 Wed, 27 Jan 2021 05:59:16 +0000 (UTC)
Received: from thuth.com (ovpn-112-136.ams2.redhat.com [10.36.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9A8260C05;
 Wed, 27 Jan 2021 05:59:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci.yml: Run check-tcg with TCI
Date: Wed, 27 Jan 2021 06:59:03 +0100
Message-Id: <20210127055903.40148-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e=20?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's now possible to also run the non-x86 TCG tests with TCI.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Based-on: 20210126192518.2019885-1-sw@weilnetz.de
 CI-run: https://gitlab.com/huth/qemu/-/jobs/988742434#L5200

 .gitlab-ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index de3a3d25b5..19602f4319 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -475,7 +475,7 @@ build-oss-fuzz:
 build-tci:
   <<: *native_build_job_definition
   variables:
-    IMAGE: fedora
+    IMAGE: debian-all-test-cross
   script:
     - TARGETS="aarch64 alpha arm hppa m68k microblaze moxie ppc64 s390x x86_64"
     - mkdir build
@@ -483,7 +483,6 @@ build-tci:
     - ../configure --enable-tcg-interpreter
         --target-list="$(for tg in $TARGETS; do echo -n ${tg}'-softmmu '; done)" || { cat config.log meson-logs/meson-log.txt && exit 1; }
     - make -j"$JOBS"
-    - make run-tcg-tests-x86_64-softmmu
     - make tests/qtest/boot-serial-test tests/qtest/cdrom-test tests/qtest/pxe-test
     - for tg in $TARGETS ; do
         export QTEST_QEMU_BINARY="./qemu-system-${tg}" ;
@@ -492,6 +491,7 @@ build-tci:
       done
     - QTEST_QEMU_BINARY="./qemu-system-x86_64" ./tests/qtest/pxe-test
     - QTEST_QEMU_BINARY="./qemu-system-s390x" ./tests/qtest/pxe-test -m slow
+    - make check-tcg
 
 # Alternate coroutines implementations are only really of interest to KVM users
 # However we can't test against KVM on Gitlab-CI so we can only run unit tests
-- 
2.27.0


