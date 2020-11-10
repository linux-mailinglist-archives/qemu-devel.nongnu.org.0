Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA4F2ADB42
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:07:47 +0100 (CET)
Received: from localhost ([::1]:56458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWBO-00046Y-FX
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW5p-000799-8G
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW5m-0003TR-AF
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SqCgheEYQU/PnUVG5SCH/2qKRl09/5J+gAl4bIZmroY=;
 b=J7ISnupkCeerCpa2eJC8MP5/W1r/cl6MohlfbzkDiHekkuNJCailGEuWJ96ezfBxGbpzjE
 wsnuoxVni2Ue0n7OKV7xmrlRm8hmZie/lpAiVzQfjXXrbrm9mB31cVpPKebKCCoFQL+BV+
 tHKMeDzQNif6dKvPtbAYI6UgW+HoDPM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-C0bHA8YqMeuevgOgNeDGNw-1; Tue, 10 Nov 2020 11:01:55 -0500
X-MC-Unique: C0bHA8YqMeuevgOgNeDGNw-1
Received: by mail-wm1-f72.google.com with SMTP id a130so1322742wmf.0
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:01:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SqCgheEYQU/PnUVG5SCH/2qKRl09/5J+gAl4bIZmroY=;
 b=FWVksMgT3WM+79F/lU+RidEPBv6DtB0vrfHHZjVL4j/XPrGki1zQ7EkAnTe4cbjcsV
 lu8IkR2du3K6mfti/kVCvnuGjthMqw0VxScsBbBP49utO+fvhOR5KmXencP8lSmhhmw9
 wiBtHPO+2uUMvk5uPozWnQ0azvfY/a2acQGW98RGIDor7kOpo1rCb+AziBONZV3JcWb+
 JkpIKjgQmLYWg6alccSNcwb2TnunueBrjoj1TWFX2opq05TAygP1i+XMuGMY3wsVEhqt
 GScvQ3Q3oUtBHGYwXMBdzldfvpGVZrDVXprf2TiF6pEjEBCQ+7Qcsyfq+Ih74bLiyici
 hZvg==
X-Gm-Message-State: AOAM5335lIa7xu1jZ2ZUSsDqhnCRyrWKMFe2dorwQ0SRmQfzErGPOQXj
 TkxFdF93xsH8Hk4M4xXz9OkBcpWngdmaMYK2LvdDu4OCcwImbtoqkKW9N41kUqy6btR50ZJzbL3
 o2/P6k/HcTp9TCY8vAwR6vJEhVW3B/0Tdibg8fM0FUULqvyr4+w71eVXbZZgyvo+j
X-Received: by 2002:a5d:52c1:: with SMTP id r1mr4068013wrv.255.1605024113637; 
 Tue, 10 Nov 2020 08:01:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxc/4hsK8BVDjKKc15JYkeg2czD1IQLAi08EeKgbQWSgfi1OvOqGq46j0rdDWRVe2ayoegDkQ==
X-Received: by 2002:a5d:52c1:: with SMTP id r1mr4067964wrv.255.1605024113316; 
 Tue, 10 Nov 2020 08:01:53 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id m22sm18328267wrb.97.2020.11.10.08.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:01:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 02/16] gitlab-ci: Replace YAML anchors by extends
 (native_build_job)
Date: Tue, 10 Nov 2020 17:01:26 +0100
Message-Id: <20201110160140.2859904-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110160140.2859904-1-philmd@redhat.com>
References: <20201110160140.2859904-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Bin Meng <bin.meng@windriver.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'extends' is an alternative to using YAML anchors
and is a little more flexible and readable. See:
https://docs.gitlab.com/ee/ci/yaml/#extends

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9a8b3751882..d013504593a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -13,7 +13,7 @@ include:
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
 
-.native_build_job_template: &native_build_job_definition
+.native_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   before_script:
@@ -68,7 +68,7 @@ include:
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
 
 build-system-ubuntu:
-  <<: *native_build_job_definition
+  extends: .native_build_job
   variables:
     IMAGE: ubuntu2004
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
@@ -100,7 +100,7 @@ acceptance-system-ubuntu:
   <<: *acceptance_definition
 
 build-system-debian:
-  <<: *native_build_job_definition
+  extends: .native_build_job
   variables:
     IMAGE: debian-amd64
     TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
@@ -132,7 +132,7 @@ acceptance-system-debian:
   <<: *acceptance_definition
 
 build-system-fedora:
-  <<: *native_build_job_definition
+  extends: .native_build_job
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
@@ -164,7 +164,7 @@ acceptance-system-fedora:
   <<: *acceptance_definition
 
 build-system-centos:
-  <<: *native_build_job_definition
+  extends: .native_build_job
   variables:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt
@@ -196,7 +196,7 @@ acceptance-system-centos:
   <<: *acceptance_definition
 
 build-disabled:
-  <<: *native_build_job_definition
+  extends: .native_build_job
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS: --disable-attr --disable-avx2 --disable-bochs
@@ -221,7 +221,7 @@ build-disabled:
     MAKE_CHECK_ARGS: check-qtest SPEED=slow
 
 build-tcg-disabled:
-  <<: *native_build_job_definition
+  extends: .native_build_job
   variables:
     IMAGE: centos8
   script:
@@ -241,7 +241,7 @@ build-tcg-disabled:
             260 261 262 263 264 270 272 273 277 279
 
 build-user:
-  <<: *native_build_job_definition
+  extends: .native_build_job
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-tools --disable-system
@@ -251,7 +251,7 @@ build-user:
 # we skip sparc64-linux-user until it has been fixed somewhat
 # we skip cris-linux-user as it doesn't use the common run loop
 build-user-plugins:
-  <<: *native_build_job_definition
+  extends: .native_build_job
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-tools --disable-system --enable-plugins --enable-debug-tcg --target-list-exclude=sparc64-linux-user,cris-linux-user
@@ -259,7 +259,7 @@ build-user-plugins:
   timeout: 1h 30m
 
 build-clang:
-  <<: *native_build_job_definition
+  extends: .native_build_job
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS: --cc=clang --cxx=clang++
@@ -269,7 +269,7 @@ build-clang:
 
 # These targets are on the way out
 build-deprecated:
-  <<: *native_build_job_definition
+  extends: .native_build_job
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-docs --disable-tools
@@ -294,7 +294,7 @@ check-deprecated:
   allow_failure: true
 
 build-oss-fuzz:
-  <<: *native_build_job_definition
+  extends: .native_build_job
   variables:
     IMAGE: fedora
   script:
@@ -312,7 +312,7 @@ build-oss-fuzz:
     - cd build-oss-fuzz && make check-qtest-i386 check-unit
 
 build-tci:
-  <<: *native_build_job_definition
+  extends: .native_build_job
   variables:
     IMAGE: fedora
   script:
@@ -337,7 +337,7 @@ build-tci:
 # These jobs test old gcrypt and nettle from RHEL7
 # which had some API differences.
 build-crypto-old-nettle:
-  <<: *native_build_job_definition
+  extends: .native_build_job
   variables:
     IMAGE: centos7
     TARGETS: x86_64-softmmu x86_64-linux-user
@@ -358,7 +358,7 @@ check-crypto-old-nettle:
 
 
 build-crypto-old-gcrypt:
-  <<: *native_build_job_definition
+  extends: .native_build_job
   variables:
     IMAGE: centos7
     TARGETS: x86_64-softmmu x86_64-linux-user
@@ -379,7 +379,7 @@ check-crypto-old-gcrypt:
 
 
 build-crypto-only-gnutls:
-  <<: *native_build_job_definition
+  extends: .native_build_job
   variables:
     IMAGE: centos7
     TARGETS: x86_64-softmmu x86_64-linux-user
-- 
2.26.2


