Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEFA682A2F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:15:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMndJ-0002pw-Hk; Tue, 31 Jan 2023 05:12:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMndF-0002oI-IM
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMndE-0002bb-0M
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675159971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBRBLicNql+tCS1VJPyYMUYYBjc9aES1YasbqWQRwxM=;
 b=U6pFmYCSzMyZbnCfY/qoELu5d5//jM2obcaltyD1YxXZmCmRJjwhXeGEDYAo9zGXD8he+4
 jJwwW33Th2MyylZpJoZj3xfc4zPPYTY/8e1K5xXXegOswI36K9nOy/iIJYvjAyO0nZ8mOY
 1iInhxu2cew1C9Yq26Lj0W13IZEXfsA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-B7DRfhkaOnG1UCTyQ0iQ3A-1; Tue, 31 Jan 2023 05:12:47 -0500
X-MC-Unique: B7DRfhkaOnG1UCTyQ0iQ3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5044B2801E4C;
 Tue, 31 Jan 2023 10:12:47 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A7B8C16020;
 Tue, 31 Jan 2023 10:12:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 27/27] gitlab-ci.d/buildtest: Merge the --without-default-* jobs
Date: Tue, 31 Jan 2023 11:12:05 +0100
Message-Id: <20230131101205.1499867-28-thuth@redhat.com>
In-Reply-To: <20230131101205.1499867-1-thuth@redhat.com>
References: <20230131101205.1499867-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Let's safe some CI minutes by merging these two jobs. We can now
also drop "--disable-capstone" since the capstone submodule has
been removed a while ago. We should rather test --disable-fdt now
to check a compilation without the "dtc" submodule (for this we
have to drop i386-softmmu from the target list unfortunately).
Additionally, the qtests with s390x and sh4 are not read for
"--without-default-devices" yet, so we can only test mips64 and
avr here now.

Message-Id: <20230130104446.1286773-5-thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 406608e5fc..1c35cbfa10 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -557,29 +557,22 @@ build-coroutine-sigaltstack:
     MAKE_CHECK_ARGS: check-unit
 
 # Check our reduced build configurations
-build-without-default-devices:
+build-without-defaults:
   extends: .native_build_job_template
   needs:
     job: amd64-centos8-container
   variables:
     IMAGE: centos8
-    CONFIGURE_ARGS: --without-default-devices --disable-user
-
-build-without-default-features:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-fedora-container
-  variables:
-    IMAGE: fedora
     CONFIGURE_ARGS:
+      --without-default-devices
       --without-default-features
-      --disable-capstone
+      --disable-fdt
       --disable-pie
       --disable-qom-cast-debug
       --disable-strip
-    TARGETS: avr-softmmu i386-softmmu mips64-softmmu s390x-softmmu sh4-softmmu
+    TARGETS: avr-softmmu mips64-softmmu s390x-softmmu sh4-softmmu
       sparc64-softmmu hexagon-linux-user i386-linux-user s390x-linux-user
-    MAKE_CHECK_ARGS: check-unit check-qtest SPEED=slow
+    MAKE_CHECK_ARGS: check-unit check-qtest-avr check-qtest-mips64
 
 build-libvhost-user:
   extends: .base_job_template
-- 
2.31.1


