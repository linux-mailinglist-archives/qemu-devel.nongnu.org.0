Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A302A70D4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 23:52:39 +0100 (CET)
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaRdu-0003sA-6V
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 17:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaRYO-0005c4-F5
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 17:46:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaRYL-0006yN-7L
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 17:46:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604530011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpLX9DyDtPv5J9Kb6VvonpOVnvS/v0Bt0CgJMTWK7g4=;
 b=JDr++jZFa1cP3goRtYxIsYQHytxw0nPWGfKScDYVEHRL4dDua2AeZqZul/JdU1TAN+O5Vm
 E6VSRyIOI5m6DL8Y5Ab6vE8Of5XpwyfQzkf1sLBY5MV3u3QM+Q4nYtyaGkGazmwp/id9We
 EUp2S3e3AsBnTYV7nU7yzl+8ewX0zzw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-vfmYQH9uNe-mZnvFKxfBjg-1; Wed, 04 Nov 2020 17:46:50 -0500
X-MC-Unique: vfmYQH9uNe-mZnvFKxfBjg-1
Received: by mail-wm1-f70.google.com with SMTP id y1so476899wma.5
 for <qemu-devel@nongnu.org>; Wed, 04 Nov 2020 14:46:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FpLX9DyDtPv5J9Kb6VvonpOVnvS/v0Bt0CgJMTWK7g4=;
 b=pUua/rRbCGhBs18KuyHZmaV3yAfBpfG0di43PlVFSvJ5nEv5M60f/2G22lizwYa2Xw
 e8FGE4idkk9P5zXTNo2NnYdRrcbut7H8qhGNp7h/oQDt+qpluESljFxY2FwX8C1JocLB
 m5/zGvqjoM4v6xNm0gYeq3wSqcI0K3BWbCrgnUjk5tWoX7MjFRQ2lC2r7cTjPVt2TZ0s
 KeF94KJGWI3a7UkeNxM8ZUSpPeGJEfKOEeMnPHfs9TmYF/C1+geDscp8d/E2R87YGP1V
 Qe9siXn3TCzJ8zQYF6vmezMRFLu8TU6yxncx3MlDNCab0fVVMIlgTaoVE+6kANk7aa1i
 BMgg==
X-Gm-Message-State: AOAM531MGhbYBtBGSM9SKziMxO7k+QlWwcvYMDnqSOdkB8E4Bpwycrvb
 pPmq2v2/TnawgfIl1VsibyZTVmBVXEhseVqOJ8zhJB1oPVa+xz5IQwIMXcCQSOb8JzOwpEvm9sD
 NArTwUCyoI4O9n4E=
X-Received: by 2002:adf:f74e:: with SMTP id z14mr244710wrp.312.1604530008660; 
 Wed, 04 Nov 2020 14:46:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWTMC/bJuH0Z5OZNDyRUvcEPOfkIl0/Y9YW1vv2gMMsssf/xwYgpj+BZKuFUdP0aCo3rpSbA==
X-Received: by 2002:adf:f74e:: with SMTP id z14mr244687wrp.312.1604530008509; 
 Wed, 04 Nov 2020 14:46:48 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f7sm4892993wrx.64.2020.11.04.14.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 14:46:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 9/9] gitlab-ci: Add rules to skip building/testing native
 jobs
Date: Wed,  4 Nov 2020 23:45:58 +0100
Message-Id: <20201104224558.3384595-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201104224558.3384595-1-philmd@redhat.com>
References: <20201104224558.3384595-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add rules to skip various build/test jobs.

The following tags are available to skip CI jobs:
- user        (user-mode jobs)
- system      (system-mode jobs)
- centos      (jobs based on CentOS distribution image)
- debian      (...           Debian)
- fedora      (...           Fedora)
- ubuntu      (...           Ubuntu)
- crypto      (jobs testing the crypto feature)
- tci         (jobs testing TCI feature)
- fuzz        (fuzzer job)
- integration (integration tests)

Developers can combine tags in the SKIP_BUILD variable when
pushing a branch (or tag) to repositories. Examples:

  $ git push -o ci.variable="SKIP_BUILD=user"                    myrepo mybranch
  $ git push -o ci.variable="SKIP_BUILD=user,debian,crypto,fuzz" myrepo mybranch

References:
- https://docs.gitlab.com/ee/ci/yaml/#rulesif
- https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 961070d2cbe..432daccf590 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -21,6 +21,30 @@ include:
 
 .native_common_job:
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  rules:
+    # If the if statement is true, the job is excluded from a pipeline.
+    - if: ($TARGETS =~ /softmmu/ || $CONFIGURE_ARGS =~ /disable-user/) && $SKIP_BUILD =~ /system/
+      when: never
+    - if: ($TARGETS =~ /user/ || $CONFIGURE_ARGS =~ /disable-system/) && $SKIP_BUILD =~ /user/
+      when: never
+    - if: $IMAGE =~ /^centos/ && $SKIP_BUILD =~ /centos/
+      when: never
+    - if: $IMAGE =~ /^debian/ && $SKIP_BUILD =~ /debian/
+      when: never
+    - if: $IMAGE =~ /^fedora/ && $SKIP_BUILD =~ /fedora/
+      when: never
+    - if: $IMAGE =~ /^ubuntu/ && $SKIP_BUILD =~ /ubuntu/
+      when: never
+    - if: $CI_JOB_NAME =~ /crypto/ && $SKIP_BUILD =~ /crypto/
+      when: never
+    - if: $CI_JOB_NAME =~ /tci/ && $SKIP_BUILD =~ /tci/
+      when: never
+    - if: $CI_JOB_NAME =~ /fuzz/ && $SKIP_BUILD =~ /fuzz/
+      when: never
+    - if: $CI_JOB_NAME =~ /^acceptance/ && $SKIP_BUILD =~ /integration/
+      when: never
+    # In all other cases, the job is added to the pipeline.
+    - when: on_success
 
 .native_build_job:
   extends: .native_common_job
-- 
2.26.2


