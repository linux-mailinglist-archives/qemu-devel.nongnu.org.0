Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0D82D11B4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:21:59 +0100 (CET)
Received: from localhost ([::1]:57696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGSj-00061e-Th
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmGMW-000496-VH
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:15:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmGML-000151-CX
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607346920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qWT6ZPuFzyJ7mCL37uXEPVzuEPlsDzCAhcDUmllvAYo=;
 b=CfuaV92MMz+suZmz9IRo/d9xANGPjvHSu2QFLQtjnQw4pQhc0L8GsQxkltRMdAKmXsxask
 oY+aSF8v7BOtlG/LjGK7xfTVHsvXgaa5UEJkTb0PoaeQSEtpkJaa/nTdDXAsDS/QZqvRCq
 UC+eC3bb2SyiAzcbjXN7aDW/hH2WQac=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-tyGZnUTmO8WJiS-4USF-Yw-1; Mon, 07 Dec 2020 08:15:19 -0500
X-MC-Unique: tyGZnUTmO8WJiS-4USF-Yw-1
Received: by mail-wm1-f72.google.com with SMTP id z12so5305522wmf.9
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 05:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qWT6ZPuFzyJ7mCL37uXEPVzuEPlsDzCAhcDUmllvAYo=;
 b=JeNXGDr13W4LHm0lqQ3F7lcsmpCE5UcFYq65gxqwruGTCGpttS3rZu1sM6wcepTxmn
 81bnmwn6XM06xE4Sk56G0jrX1PDnI/E2hsDHKBcgQbheFrj8wh2APJpIdWXhw+gWFf8n
 5a9FdRaNyLF6xzWdAO0fknLD6BOR+VICjFpu8qckrallpxWQqq4Y8SlqbI3duDSRmhFh
 y6Vb686YubyhZw9vFHWrxqHZLWit2Nr7kBwUklacv8xmJ+QATY/24VYOXBgXHeUW8z8t
 gNtjii8+xE09zw7+ppkB8ybMJJPp1Q6fwPxLq7qUPbVbBbpB5UNR8QDHa93k/cbS4nB/
 NLQQ==
X-Gm-Message-State: AOAM531g9yPeee0cwCmIYhyH+prLnPNgm2RdU0XcBoloFC9aHoqTl6f+
 R9OTcihm6ARRz2fNf62/gODC9AmC+wBARV5DLlYUGNuWWikVjcW416CipQIhTnLtsPsC7umwITS
 PRlGjexyTXE0oo4RM4t5mK+ru2CgLdzoU96ZnD/IZDt3fImdUFxnyIKSsEZchC2oU
X-Received: by 2002:a1c:61c3:: with SMTP id
 v186mr18343504wmb.146.1607346917922; 
 Mon, 07 Dec 2020 05:15:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5+KW+PFE10MP9jLpogYR1x1fZIHiIwppZYhRhxY3siG36Pzyg4Q4bF1rYwvWWqwdmc6Rj+g==
X-Received: by 2002:a1c:61c3:: with SMTP id
 v186mr18343465wmb.146.1607346917703; 
 Mon, 07 Dec 2020 05:15:17 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 65sm12953670wri.95.2020.12.07.05.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 05:15:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] gitlab-ci: Replace YAML anchors by extends
 (cross_system_build_job)
Date: Mon,  7 Dec 2020 14:15:00 +0100
Message-Id: <20201207131503.3858889-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207131503.3858889-1-philmd@redhat.com>
References: <20201207131503.3858889-1-philmd@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Willian Rampazzo <wrampazz@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'extends' is an alternative to using YAML anchors
and is a little more flexible and readable. See:
https://docs.gitlab.com/ee/ci/yaml/#extends

More importantly it allows exploding YAML jobs.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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


