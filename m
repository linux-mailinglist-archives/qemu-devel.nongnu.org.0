Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5644D2AF070
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:20:32 +0100 (CET)
Received: from localhost ([::1]:35752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcp71-0001Qy-CJ
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcozd-0005Y7-9n
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:12:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcozb-0007vR-86
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:12:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605096770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FPr7WGcKbN7NcFNhLhjh0q4En4doO/fy6wUjD+hgG2M=;
 b=TvSGJ6dUI/TzTIrtQFgN4o4cXV52nDtrX4td+gpyH0Fnk/aBzP13kIl4bcL+VCJ4+7C5El
 Mlf7M7t1DTKcqGo6TKa5gQKoi+BNgDfUQ9dyjTpp3Sc/hgT866gbQaQ+kQ/gxl9bdYz5i1
 wNSX5S5x9FGiFtFZyTulx1bioLXxFAg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-Ck7SsMCGMyu7IMlb4DjuhA-1; Wed, 11 Nov 2020 07:12:48 -0500
X-MC-Unique: Ck7SsMCGMyu7IMlb4DjuhA-1
Received: by mail-wr1-f71.google.com with SMTP id e11so529749wrw.14
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 04:12:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FPr7WGcKbN7NcFNhLhjh0q4En4doO/fy6wUjD+hgG2M=;
 b=DJEVl3Yes1B4lt0eUXrlD3iAkHITqJAwuD6Q3UIAholT8/gbhg5Va0v7cAvdJXQjAD
 7SrIQsit4G1Duu7bVqpRhGVCdHwM49F10nVhcmd8nDgbStiVzjiE9FL9Ufu5Wipxwfx9
 5qzfe2bVmuHwEIyjzFS8ykLGzhhE1Rt/icOd/l/AnQjDSgN+SJWHEVANjgdjht2yxbV8
 2g2iURBEZJzVbwT6SQ8aso5i2HFrr2Jdey0oRDe/N4Wsf//bskjAuhPLLIBdkgdpS3OS
 safH0+9ke4nMJoNLo0ZfvT05RsJN4NDQWRat5dKjcDcOA3xuy/M2+cwYAtPe26K0498E
 UYYw==
X-Gm-Message-State: AOAM533MbxUQHZfFZWaWiFl2jazwopQS82yFtq7SXD8CMj+xSIkuEZVD
 2iM/iS8oXJmVIQ5r6QJMFijasetygIdfNPZEeLn38FoyhZKI5fDtrnGz+VjSf+V2qhgHDfTv8WQ
 cUcW/2mTi12Oyzl19D8uN4erEVIjy6QAvLgch/KUxNnL0b90ePtpqQWD65JsFqnU2
X-Received: by 2002:a1c:4d03:: with SMTP id o3mr3890627wmh.150.1605096766897; 
 Wed, 11 Nov 2020 04:12:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBpiIP3/ZiCcmWz3R1B+oN+MzMIlAIx6IvOOgAh/7EIXkt88ziznBowHKFtJ4uUIVjmNPd4w==
X-Received: by 2002:a1c:4d03:: with SMTP id o3mr3890608wmh.150.1605096766714; 
 Wed, 11 Nov 2020 04:12:46 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id x63sm2530594wmb.48.2020.11.11.04.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 04:12:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2? v5 2/2] gitlab-ci: Move trace backend tests across to
 gitlab
Date: Wed, 11 Nov 2020 13:12:34 +0100
Message-Id: <20201111121234.3246812-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201111121234.3246812-1-philmd@redhat.com>
References: <20201111121234.3246812-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to commit 8cdb2cef3f1, move the trace backend
tests to GitLab.

Note the User-Space Tracer backend is still tested on
Ubuntu by the s390x jobs on Travis-CI.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Previous version had "Reviewed-by: Stefan Hajnoczi" but was
testing User-Space Tracer on Fedora. Since I kept Ubuntu,
resetting Stefan's tag.
---
 .gitlab-ci.yml | 18 ++++++++++++++++++
 .travis.yml    | 19 -------------------
 2 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9a8b3751882..06629243318 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -398,6 +398,24 @@ check-crypto-only-gnutls:
     IMAGE: centos7
     MAKE_CHECK_ARGS: check
 
+# We don't need to exercise every backend with every front-end
+build-trace-multi-user:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --enable-trace-backends=log,simple,syslog --disable-system
+
+build-trace-ftrace-system:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --enable-trace-backends=ftrace --target-list=x86_64-softmmu
+
+build-trace-ust-system:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --enable-trace-backends=ust --target-list=x86_64-softmmu
 
 check-patch:
   stage: build
diff --git a/.travis.yml b/.travis.yml
index a3d78171cab..aa19762770a 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -232,25 +232,6 @@ jobs:
         - TEST_CMD=""
 
 
-    # We don't need to exercise every backend with every front-end
-    - name: "GCC trace log,simple,syslog (user)"
-      env:
-        - CONFIG="--enable-trace-backends=log,simple,syslog --disable-system"
-        - TEST_CMD=""
-
-
-    - name: "GCC trace ftrace (x86_64-softmmu)"
-      env:
-        - CONFIG="--enable-trace-backends=ftrace --target-list=x86_64-softmmu"
-        - TEST_CMD=""
-
-
-    - name: "GCC trace ust (x86_64-softmmu)"
-      env:
-        - CONFIG="--enable-trace-backends=ust --target-list=x86_64-softmmu"
-        - TEST_CMD=""
-
-
     # Using newer GCC with sanitizers
     - name: "GCC9 with sanitizers (softmmu)"
       dist: bionic
-- 
2.26.2


