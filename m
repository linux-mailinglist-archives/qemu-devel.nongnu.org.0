Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57732ADB36
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:05:01 +0100 (CET)
Received: from localhost ([::1]:48926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcW8i-0000np-SR
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW64-0007Pw-Ih
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW62-0003X7-9T
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3y1C5StOcNT1GPWvuNwXUSiFTVKqm5kP9TOY3ZYBopk=;
 b=M/wo0rnJhFmbhIIVzywlBZ/r9jQJKPLf+wsVXu7NdJOL/UNwmqqTGFqGCk6aZnDYwkkrq9
 VwGMgcDpYG2ZPrVY2ZTvze5hDDfPKr06tDEkICIfHW/DdhHDFbFR6cfzGnurEuRLXjdUhL
 cuBp9BqzSIVDzdUueWXQ0B5K2YzRVCM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-LPS2hwtgN1CInEArZ4tD9w-1; Tue, 10 Nov 2020 11:02:12 -0500
X-MC-Unique: LPS2hwtgN1CInEArZ4tD9w-1
Received: by mail-wm1-f72.google.com with SMTP id a130so1323291wmf.0
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3y1C5StOcNT1GPWvuNwXUSiFTVKqm5kP9TOY3ZYBopk=;
 b=W+P24WmK6oSLqd29lUIIJdGNgIlLpfXeIS5hrnXm0N86a56atIbQ8YW2GLfB6jsEZC
 l78dAKZFOyvcTvvuMFRw9cEB/GARmJkKX74d6rNi4PSZ23kWZ8xf1Amp/553+Y2TVfML
 xUcQcDbq0yr4+6qnDqyreBhtcWlgiBFjZU9fZBTK4MANK8reoikib0aFM5esy6hN9O3t
 xSAkqLc8HBZ3w5Khj2kwohh/jM9tNCi0H8d7wYyxOQN+TSHXejGj11bWof4b+GLazl+y
 EXekahdt3uscuzVctzaXL/8uol0KgKmqUZWclBIDatMQzmZtPZkmXiDpRoy3FBUJKsPw
 NwAg==
X-Gm-Message-State: AOAM530RMdlV46ckx6WnSzrZ56O2zM+6Sr0gU311DIFwyak272dJJy4T
 mlhkzLFLpanOvO6yslbpqqi5xNWOwmMQ/Z+wYKlFRuXkW33TcgYkt/2RH+HqNq20Tp9M2KRM7Ft
 1zPPDRzdmAhH7xWvlcj3NgnH0iU1VBB9ayYVylISk/u7IoZzrzOSclkpwZpbXi1fw
X-Received: by 2002:a7b:c846:: with SMTP id c6mr338124wml.143.1605024129373;
 Tue, 10 Nov 2020 08:02:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpFlwK18+nTDZDJlvzoPMQchVMptLlTDuTQzWnlqe5ftTgtiPui0Vi+Ml+aSIX+HUaBSN8Kg==
X-Received: by 2002:a7b:c846:: with SMTP id c6mr338085wml.143.1605024129137;
 Tue, 10 Nov 2020 08:02:09 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id l24sm3464456wmi.7.2020.11.10.08.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:02:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 05/16] gitlab-ci: Replace YAML anchors by extends
 (container_job)
Date: Tue, 10 Nov 2020 17:01:29 +0100
Message-Id: <20201110160140.2859904-6-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 .gitlab-ci.d/containers.yml | 72 ++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 11d079ea581..7e664878cab 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -1,4 +1,4 @@
-.container_job_template: &container_job_definition
+.container_job:
   image: docker:stable
   stage: containers
   services:
@@ -29,220 +29,220 @@
     - if: '$CI_COMMIT_REF_NAME == "testing/next"'
 
 amd64-centos7-container:
-  <<: *container_job_definition
+  extends: .container_job
   variables:
     NAME: centos7
 
 amd64-centos8-container:
-  <<: *container_job_definition
+  extends: .container_job
   variables:
     NAME: centos8
 
 amd64-debian10-container:
-  <<: *container_job_definition
+  extends: .container_job
   variables:
     NAME: debian10
 
 amd64-debian11-container:
-  <<: *container_job_definition
+  extends: .container_job
   variables:
     NAME: debian11
 
 alpha-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-alpha-cross
 
 amd64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-amd64-cross
 
 amd64-debian-user-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-all-test-cross
 
 amd64-debian-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-amd64
 
 arm64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-arm64-cross
 
 arm64-test-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian11-container']
   variables:
     NAME: debian-arm64-test-cross
 
 armel-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-armel-cross
 
 armhf-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-armhf-cross
 
 hppa-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-hppa-cross
 
 m68k-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-m68k-cross
 
 mips64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips64-cross
 
 mips64el-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips64el-cross
 
 mips-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips-cross
 
 mipsel-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mipsel-cross
 
 powerpc-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-powerpc-cross
 
 ppc64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-ppc64-cross
 
 ppc64el-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-ppc64el-cross
 
 riscv64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-riscv64-cross
 
 s390x-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-s390x-cross
 
 sh4-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-sh4-cross
 
 sparc64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-sparc64-cross
 
 tricore-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-tricore-cross
 
 xtensa-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   variables:
     NAME: debian-xtensa-cross
 
 cris-fedora-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   variables:
     NAME: fedora-cris-cross
 
 amd64-fedora-container:
-  <<: *container_job_definition
+  extends: .container_job
   variables:
     NAME: fedora
 
 i386-fedora-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   variables:
     NAME: fedora-i386-cross
 
 win32-fedora-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   variables:
     NAME: fedora-win32-cross
 
 win64-fedora-cross-container:
-  <<: *container_job_definition
+  extends: .container_job
   variables:
     NAME: fedora-win64-cross
 
 amd64-ubuntu1804-container:
-  <<: *container_job_definition
+  extends: .container_job
   variables:
     NAME: ubuntu1804
 
 amd64-ubuntu2004-container:
-  <<: *container_job_definition
+  extends: .container_job
   variables:
     NAME: ubuntu2004
 
 amd64-ubuntu-container:
-  <<: *container_job_definition
+  extends: .container_job
   variables:
     NAME: ubuntu
-- 
2.26.2


