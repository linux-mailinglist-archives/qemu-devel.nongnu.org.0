Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8953C2ADB3B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:05:21 +0100 (CET)
Received: from localhost ([::1]:50070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcW92-0001HX-84
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW60-0007HY-8J
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW5y-0003Vg-50
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NaqlQxNvH3AUGOJqrVZYZoAO4Lf395wo2rX6dkLCW10=;
 b=HezBa4VWangGNL1vURQ+sxdbATEORTsG2U8Ww0ZwbAubWOAvWJmHLroabw3dLhqO0wPxMo
 Oq6zCnFofSdPRDQAJKov7FE+WfajDjrv8BdXRXFZsv3Vi3m0Z0m5b512uKoWz8B0VZ2GnI
 JlxL0Fo3gTtvQTuTjKaCqNOL5ypzOqI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-l78JJOQgPue48Wiw2ilRGg-1; Tue, 10 Nov 2020 11:02:06 -0500
X-MC-Unique: l78JJOQgPue48Wiw2ilRGg-1
Received: by mail-wr1-f70.google.com with SMTP id k1so4543430wrg.12
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:02:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NaqlQxNvH3AUGOJqrVZYZoAO4Lf395wo2rX6dkLCW10=;
 b=kOaR+Yh1v/zQgiyw22naEB32SwonwlDOyILU/yVLg7KVpp+H0PQXjkA5JocvGTAceA
 TB3osScJYxcDhUzS8HeR3V+KHQhYagMBQYG5tzI1w9yv3Ad+s9TwMtVjrsTbd/DXfrk5
 BWwGSn0btq0GXy49dqdhxSsoXahz2BrakVAWS2JfVKMKm0GG99F5cva2+1TMvNo4UYfh
 mvtpo2nq4LERdqoYyTvNyaPq2cG3y0YJkSvY3gdMK5tjqrgTHJ+IBMDdZerEmZvx2qxP
 o8RpHvoxz4SOc7OnrR/pABXyXI3gKKwn28oi2s2do67IgTt3KSYteJ6gH0jKW2SEC9hx
 ri2g==
X-Gm-Message-State: AOAM530+l4Q/8Sb2jLnPbso8yQxENu3c9EuKSnoaJZ5YyAmtsPRZtZgy
 tMALm7cQ18svV2tFE35EeLoYK+OqBg9Up04x9vCby8bb9JVUUK46uptOunmxwUyYZAAX+rs0RXb
 sw7l/YN2349iaEmncnyH6Jey3Hydpjo2tHNY39oKjCAHjeTSo37xgenbpwHwA1XTZ
X-Received: by 2002:a05:600c:2282:: with SMTP id
 2mr420670wmf.154.1605024123976; 
 Tue, 10 Nov 2020 08:02:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/pq95zFh1obtopXKRHlurt+wMS4j+Ja+Zf3k3XTtxbpFD4DD+mTivmR3G+LcuDeRa7FSzdA==
X-Received: by 2002:a05:600c:2282:: with SMTP id
 2mr420633wmf.154.1605024123693; 
 Tue, 10 Nov 2020 08:02:03 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id h62sm17904011wrh.82.2020.11.10.08.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:02:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 04/16] gitlab-ci: Replace YAML anchors by extends
 (acceptance_test_job)
Date: Tue, 10 Nov 2020 17:01:28 +0100
Message-Id: <20201110160140.2859904-5-philmd@redhat.com>
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
 .gitlab-ci.yml | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c8fdaecaf51..a45444f884b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -42,7 +42,8 @@ include:
     - find . -type f -exec touch {} +
     - make $MAKE_CHECK_ARGS
 
-.acceptance_template: &acceptance_definition
+.acceptance_test_job:
+  extends: .native_test_job
   cache:
     key: "${CI_JOB_NAME}-cache"
     paths:
@@ -90,14 +91,13 @@ check-system-ubuntu:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-ubuntu:
-  extends: .native_test_job
+  extends: .acceptance_test_job
   needs:
     - job: build-system-ubuntu
       artifacts: true
   variables:
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-debian:
   extends: .native_build_job
@@ -122,14 +122,13 @@ check-system-debian:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-debian:
-  extends: .native_test_job
+  extends: .acceptance_test_job
   needs:
     - job: build-system-debian
       artifacts: true
   variables:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-fedora:
   extends: .native_build_job
@@ -154,14 +153,13 @@ check-system-fedora:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-fedora:
-  extends: .native_test_job
+  extends: .acceptance_test_job
   needs:
     - job: build-system-fedora
       artifacts: true
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-centos:
   extends: .native_build_job
@@ -186,14 +184,13 @@ check-system-centos:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-centos:
-  extends: .native_test_job
+  extends: .acceptance_test_job
   needs:
     - job: build-system-centos
       artifacts: true
   variables:
     IMAGE: centos8
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-disabled:
   extends: .native_build_job
-- 
2.26.2


