Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B602D06B4
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 19:59:38 +0100 (CET)
Received: from localhost ([::1]:59054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klzFw-0008J3-PD
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 13:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klzCJ-0004w6-Sq
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:55:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klzCH-00020o-TT
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607280949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OgnINeMOsSyDZG4XwDK8Xw/XSsfPDxGpQ5JDhRmZjUY=;
 b=CAopMyajJehc2dVd8qLO5n8LE/KYgBAfziz5CA88UJW6ioMSPkXrl1VFuwKm/r5a0YdvPR
 M8IhMv57l+y1tRq7ZMVWwu8Hmj0StLDsoGe+QwlSVLGQD4yGQPy4zOj81jUPw5sC98y0Aa
 cRIe7xn2ZMqY8YX1PxBOUUxgkr1DS+w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-Q_QzCXERNq2G0MJKIIR31A-1; Sun, 06 Dec 2020 13:55:47 -0500
X-MC-Unique: Q_QzCXERNq2G0MJKIIR31A-1
Received: by mail-wm1-f70.google.com with SMTP id z12so4305492wmf.9
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 10:55:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OgnINeMOsSyDZG4XwDK8Xw/XSsfPDxGpQ5JDhRmZjUY=;
 b=tPr3PW+2TWQdJPUt612RthgNdseN1B/X6i+gE1fGBhpq9Q/VKODR+rO/joFyRyXIQl
 GIfHq86xF29F0A+7YePSiM7qSd4VAOx2wlyCkZzJIn6NHorrfmD/oq+G/OaFYINNGdCT
 IGSx3R7tb1FJ3o3a6oalZSZ3e2jEH64PKVCqdqIDUn3/O2kRUu6C9czKzSQkGKsE/0Zt
 mXVr01ddqjjCD//Hf1oxNYMmPGgnfM17EqALu4iiHgiYmvyfNi7ukjR8LKZDE+J/mhW9
 158ZbobYyxfs8LfM6MHxHay1tGDATZx8sxtrmB9e+lIrv+pfEwfjNtlR+7ntFdyKYPgQ
 aLNg==
X-Gm-Message-State: AOAM53379JTrLQSaIlGryXQu9UAkZWA98xFMuZYvzUdRLyW7/ARM6X9H
 OnXKrv3W5MyVGYh4GZOYSL/T088y4IEZCcX7RieKRlGcbFQuVm4C2xgFLDxnPgMsvNztdnnjWY/
 iwrnjo0iipkN6nRyagavD/YrD4ZYI+pAxRFwY3waQDECagh8NmIZpLH5lR15HDbN7
X-Received: by 2002:a1c:27c4:: with SMTP id
 n187mr14572213wmn.157.1607280946136; 
 Sun, 06 Dec 2020 10:55:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzP5ckHKkPnoBNFErvKN6cx0NmMNVau5K2sPqOp9OxzOmSHemiybPRD6ErRhCPAEZm1F015Rw==
X-Received: by 2002:a1c:27c4:: with SMTP id
 n187mr14572172wmn.157.1607280945820; 
 Sun, 06 Dec 2020 10:55:45 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id f16sm10763171wmh.7.2020.12.06.10.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 10:55:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] gitlab-ci: Add KVM PPC cross-build jobs
Date: Sun,  6 Dec 2020 19:55:06 +0100
Message-Id: <20201206185508.3545711-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206185508.3545711-1-philmd@redhat.com>
References: <20201206185508.3545711-1-philmd@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Thomas Huth <thuth@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cross-build PPC target with KVM and TCG accelerators enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
later this job build KVM-only.
---
 .gitlab-ci.d/crossbuilds-kvm-ppc.yml | 5 +++++
 .gitlab-ci.yml                       | 1 +
 MAINTAINERS                          | 1 +
 3 files changed, 7 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-ppc.yml

diff --git a/.gitlab-ci.d/crossbuilds-kvm-ppc.yml b/.gitlab-ci.d/crossbuilds-kvm-ppc.yml
new file mode 100644
index 00000000000..9df8bcf5a73
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-kvm-ppc.yml
@@ -0,0 +1,5 @@
+cross-ppc64el-kvm:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-ppc64el-cross
+    TARGETS: ppc64-softmmu
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a69619d7319..024624908e8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -15,6 +15,7 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-kvm-ppc.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index d41401f6683..c7766782174 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -397,6 +397,7 @@ PPC KVM CPUs
 M: David Gibson <david@gibson.dropbear.id.au>
 S: Maintained
 F: target/ppc/kvm.c
+F: .gitlab-ci.d/crossbuilds-kvm-ppc.yml
 
 S390 KVM CPUs
 M: Halil Pasic <pasic@linux.ibm.com>
-- 
2.26.2


