Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264AF2D7D2B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:42:53 +0100 (CET)
Received: from localhost ([::1]:33772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmRQ-00031C-1b
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knm2i-00041s-V4
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:17:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knm2d-0005Oo-Bn
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607707034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9js6tWuavZqGk0V0v9buhtJVS4jKDh4XdWkJL3pBnw=;
 b=JoGkUFg5qceoaeLUam9FPwTqCLnbaR1V7cOvOQ3xrJqDm9q5hNLDgcTVEQS7xnNeKfeAYt
 kDXzLLfl3t6I3EvBpqpUf98zzFyJiF+99j9XfnG0I3MzIA8sFrF2S/HqjD01hBaxUjbR4d
 9NBmBBBcWdj+TvZnQKQIoN5lGHpFOkI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-sK-lINlGMVe6ugSyPIKUIA-1; Fri, 11 Dec 2020 12:17:12 -0500
X-MC-Unique: sK-lINlGMVe6ugSyPIKUIA-1
Received: by mail-ed1-f71.google.com with SMTP id bo22so4206418edb.15
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 09:17:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y9js6tWuavZqGk0V0v9buhtJVS4jKDh4XdWkJL3pBnw=;
 b=HNxDoxsNqJLAHloLeNk4mEq5dFPz/qsFhk/FbYUIhTCfvuxm68gzYalRswM4UW0r/Z
 zoCEbO41KKRtMzy4+bFD1wgeXw/IALZzpgpG/6c/jluZ88Bxst9AOyCvJ1gzgzWfWdUz
 LFvDI6rrK8k2ppl0JmwIymO0o9wG+mLGafmKHWIQc2poviU0fyobqBiYmVm6WtgChFjg
 +AKKR/1kU7MsvNWSqQxHX62KZ6sdLX4c3oZGlrOq/F3u/fr60oByHkNwCFsMBMQuxyKy
 I+mdB5UKZ8tQJaIaFGLB7cRd1b2FhLpQjHWzr/vgVgXgKV2GhKuD64cK3VnkZIDZxnd6
 x7ag==
X-Gm-Message-State: AOAM530cpWtNaveEjD2kqI2v4DxNqiQUS3L08++3UOkDlp7h9Rkvp3J8
 k8zMEGiJmVXRJhTm9y9NH35JYJ7cxJa9iUXYfcVWfZw1AzREq8icPPRBau5xMpRhx2E2JmyopFj
 4T1L/yrQS6K5n0iNY9zNcRg38jXFZLXB44d7Ynwy2RUdAhOhQf7BZpwFlI8KxhfsR
X-Received: by 2002:a17:906:8594:: with SMTP id
 v20mr11645649ejx.470.1607707031244; 
 Fri, 11 Dec 2020 09:17:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcvMxoOsCzK+JxjtE6LFfkvxzmjLqz2/y1qpUGQOgqR9wCIaVW2SZ7aE1Id9dPGTk5ilWqfQ==
X-Received: by 2002:a17:906:8594:: with SMTP id
 v20mr11645622ejx.470.1607707030982; 
 Fri, 11 Dec 2020 09:17:10 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 2sm7263733ejw.65.2020.12.11.09.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 09:17:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
Subject: [RFC PATCH 1/2] gitlab-ci: Step in to maintain the fedora-i386-cross
 runner
Date: Fri, 11 Dec 2020 18:17:02 +0100
Message-Id: <20201211171703.537546-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201211171703.537546-1-philmd@redhat.com>
References: <20201211171703.537546-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 virt-ci-maint-team@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As I am interested in using the runner based on the fedora-i386-cross
docker image, add a smoke test job to be sure this image is usable,
and set the JOB_MAINTAINER_NAME/JOB_MAINTAINER_EMAIL variables so
other developers can contact me in case there is a problem with the
public runner based on this image.

We will eventually send a patch to make script/checkpatch.pl parse
the Gitlab YAML jobs to understand the JOB_MAINTAINER_NAME and
JOB_MAINTAINER_EMAIL variables.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index bd6473a75a7..864cad7cec5 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -39,6 +39,13 @@
       ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-system
     - make -j$(expr $(nproc) + 1) all check-build
 
+.cross_sanity_check_job:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  timeout: 3m
+  script:
+    - /bin/true
+
 cross-armel-system:
   extends: .cross_system_build_job
   variables:
@@ -69,6 +76,14 @@ cross-arm64-user:
   variables:
     IMAGE: debian-arm64-cross
 
+cross-i386-sanity-check:
+  extends: .cross_sanity_check_job
+  variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: philmd@redhat.com
+    GIT_SUBMODULE_STRATEGY: none
+    IMAGE: fedora-i386-cross
+
 cross-mips-system:
   extends: .cross_system_build_job
   variables:
-- 
2.26.2


