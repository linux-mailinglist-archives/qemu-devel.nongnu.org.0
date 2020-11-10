Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E557E2ADB35
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:04:36 +0100 (CET)
Received: from localhost ([::1]:48006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcW8J-0000MF-TV
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW5j-00077d-UF
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:01:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW5g-0003SR-AL
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HkmWM8pdBxBAkh2ux+VVNAnnOD7tHToqsp9wNXfrvV8=;
 b=hgilkgPfmbpTAY4eIyaEbqx5k/jtvVEA1wqBLpzRvIORfcjIpkdXnDjS63SPlXi3V+VKGa
 jp7P1fHNPpyqjorMKG5G2qNMVk5nblYQUgSIsxP6u6c4EFOPjEsR2eJw32H3gU1octxzPk
 QyE/T4+yQ6VaDUkJNpcfRkPJ8FFq+1Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39--awXIiK_N0uLxgY5p2J0Zg-1; Tue, 10 Nov 2020 11:01:49 -0500
X-MC-Unique: -awXIiK_N0uLxgY5p2J0Zg-1
Received: by mail-wm1-f69.google.com with SMTP id 3so1444320wms.9
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:01:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HkmWM8pdBxBAkh2ux+VVNAnnOD7tHToqsp9wNXfrvV8=;
 b=MsiiD5NE7FE5N9wG8r6nMX2i58CePxIjX6pHTfr2zyG08aTc5a6zM6OxRezkL9hXFD
 QnrR2Tb0e8dCk2yJ4RkfaBqXChbXt2yJ4buJYiVaSfJw6laPcW7DG+HBfVrVE/RvoVhU
 WNKorCQZ1G4HxSUJCHpJ6Kh2ZG/ZFufDjsGdx9ITjdF7BoTJq8nfmSzywkNR9kcWQW7X
 g3rV+cXNaAUXNEcTLjWcmLM/TdZX5FXxTx4COuPs/9NKpFgY3jsUHCNhOEeoMf4sOxH1
 1oZKj4e3yidvpukGGhI21fh1bw+7PdVaF7y0JbmhKeqJCrA1WtXSeBYP9abCiaP9rWeM
 34ig==
X-Gm-Message-State: AOAM531HByLg/Bi4OY2j/bannldYVwHrrJMvex4zIO3rl8LISY00n7Gg
 9bfTpjNGeBFkq91wvEG3Yk6Dvsmjxx5LA2u0b+DtHqEKIlE7vrrDyPfG3gkq4WNEgQgNdTF0Uf4
 mfm1lt4ztxxKvcThsjdT9/gIJdSTbTVoaaq46mpGCUj8LsUIXeVD+Qfw10Vz16N5b
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr24420365wrn.362.1605024108528; 
 Tue, 10 Nov 2020 08:01:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxy2eFdPYW4fmnkH4NJbkKrmxRNyaQjXI7gT3ixkVz/hBLdql5e1+teZkKL9TZZ+2gQZC2QYQ==
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr24420304wrn.362.1605024108081; 
 Tue, 10 Nov 2020 08:01:48 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id s202sm3223951wme.39.2020.11.10.08.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:01:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 01/16] gitlab-ci: Replace YAML anchors by extends
 (cross_system_build_job)
Date: Tue, 10 Nov 2020 17:01:25 +0100
Message-Id: <20201110160140.2859904-2-philmd@redhat.com>
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
 .gitlab-ci.d/crossbuilds.yml | 40 ++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 03ebfabb3fa..099949aaef3 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,5 +1,5 @@
 
-.cross_system_build_job_template: &cross_system_build_job_definition
+.cross_system_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   timeout: 80m
@@ -13,7 +13,7 @@
           xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build
 
-.cross_user_build_job_template: &cross_user_build_job_definition
+.cross_user_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
@@ -24,91 +24,91 @@
     - make -j$(expr $(nproc) + 1) all check-build
 
 cross-armel-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: debian-armel-cross
 
 cross-armel-user:
-  <<: *cross_user_build_job_definition
+  extends: .cross_user_build_job
   variables:
     IMAGE: debian-armel-cross
 
 cross-armhf-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: debian-armhf-cross
 
 cross-armhf-user:
-  <<: *cross_user_build_job_definition
+  extends: .cross_user_build_job
   variables:
     IMAGE: debian-armhf-cross
 
 cross-arm64-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: debian-arm64-cross
 
 cross-arm64-user:
-  <<: *cross_user_build_job_definition
+  extends: .cross_user_build_job
   variables:
     IMAGE: debian-arm64-cross
 
 cross-mips-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: debian-mips-cross
 
 cross-mips-user:
-  <<: *cross_user_build_job_definition
+  extends: .cross_user_build_job
   variables:
     IMAGE: debian-mips-cross
 
 cross-mipsel-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: debian-mipsel-cross
 
 cross-mipsel-user:
-  <<: *cross_user_build_job_definition
+  extends: .cross_user_build_job
   variables:
     IMAGE: debian-mipsel-cross
 
 cross-mips64el-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: debian-mips64el-cross
 
 cross-mips64el-user:
-  <<: *cross_user_build_job_definition
+  extends: .cross_user_build_job
   variables:
     IMAGE: debian-mips64el-cross
 
 cross-ppc64el-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: debian-ppc64el-cross
 
 cross-ppc64el-user:
-  <<: *cross_user_build_job_definition
+  extends: .cross_user_build_job
   variables:
     IMAGE: debian-ppc64el-cross
 
 cross-s390x-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: debian-s390x-cross
 
 cross-s390x-user:
-  <<: *cross_user_build_job_definition
+  extends: .cross_user_build_job
   variables:
     IMAGE: debian-s390x-cross
 
 cross-win32-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: fedora-win32-cross
 
 cross-win64-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: fedora-win64-cross
-- 
2.26.2


