Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49972D06B3
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 19:59:13 +0100 (CET)
Received: from localhost ([::1]:57876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klzFY-0007nl-U8
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 13:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klzC3-0004ir-Oj
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:55:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klzC2-0001vF-5n
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:55:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607280933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zj+VAsR2ZoGWNnB8pF1RFhJWmR0T2bfs3Brc/xrE4Jk=;
 b=Da3fk/eZNv3EufzsxUwMMmAuoSFCsRxKbrOUrBLKLFbUpk3YfLDgGKNMeemwIjhLmmxRs/
 li0UzqAokV1TFYY3xm0M4QZeqvc6WOAuS+IKFwmnR99AlTLolTCNPZtWWTMzLjobgXExvz
 pEmkjpfmRuY7Suwfgz5Gz3Sk3kgiXBQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-wYtohsPTNjOW6OFDCmFd8Q-1; Sun, 06 Dec 2020 13:55:30 -0500
X-MC-Unique: wYtohsPTNjOW6OFDCmFd8Q-1
Received: by mail-wm1-f71.google.com with SMTP id y187so4310618wmy.3
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 10:55:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zj+VAsR2ZoGWNnB8pF1RFhJWmR0T2bfs3Brc/xrE4Jk=;
 b=bjeTuxX/qjVSiO9F44FXgPDBzQ3y1YxFp1rGh9Ood+7MJFFsgf3U+gq2T2WTZfgapu
 eGQqAkO5M/hVr+ofjK/1h1f7mI5TkYnHQ1OsKnRCufvFRRoKsbD0HOd0FFKQLbu7KGoI
 4w5jR4TcV0zpf19JEe571it/jRLEZdEv0UaoscbYDQKlAxAToyHPpKdqmmbVK8sCeKt5
 Z44rWYYXChxIJsYPOIDAlqwjNOzB4oCY+EDbEfqaUgsZtwrCePMLGO3Y9yoTBHpy5Yti
 pXBXQdjBLXZP9YOFku5LXkytcogJTOdY1VgkPMAB9vCty/8KHSLCXa3o46UwpOFYPN8W
 GWBg==
X-Gm-Message-State: AOAM533avsU4KhYaGGIa8fiuXdbSczNZesKX6c9e5+yjuuc6sBuQLsts
 w0jmoE+3f6KViNyIBcPgkxCLywXzWeq37qx9U9tNVacybJoxHfc1QPiMjdlwW9x5MH3e3AZRAne
 AUogBvcO7hXGkzY0n31FWxaS9wdjYpQZK8wYGzRIgW0fb8yoHhzm+XwHQtcuC4NDC
X-Received: by 2002:a1c:a501:: with SMTP id o1mr9847451wme.44.1607280928854;
 Sun, 06 Dec 2020 10:55:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjfkR9jOQCSNmbsQLisARRNPGgWAcGrUN24/vbSdXT+mIj5Zt7/jygW8L9ukGbdalO0fSF2A==
X-Received: by 2002:a1c:a501:: with SMTP id o1mr9847417wme.44.1607280928628;
 Sun, 06 Dec 2020 10:55:28 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id i5sm12530329wrw.45.2020.12.06.10.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 10:55:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] gitlab-ci: Add KVM X86 cross-build jobs
Date: Sun,  6 Dec 2020 19:55:03 +0100
Message-Id: <20201206185508.3545711-4-philmd@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

Cross-build x86 target with only KVM accelerator enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds-kvm-x86.yml | 6 ++++++
 .gitlab-ci.yml                       | 1 +
 MAINTAINERS                          | 1 +
 3 files changed, 8 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-x86.yml

diff --git a/.gitlab-ci.d/crossbuilds-kvm-x86.yml b/.gitlab-ci.d/crossbuilds-kvm-x86.yml
new file mode 100644
index 00000000000..9719a19d143
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-kvm-x86.yml
@@ -0,0 +1,6 @@
+cross-amd64-kvm:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-amd64-cross
+    TARGETS: i386-softmmu,x86_64-softmmu
+    ACCEL_CONFIGURE_OPTS: --disable-tcg
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d0173e82b16..cdfa1f82a3d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -12,6 +12,7 @@ include:
   - local: '/.gitlab-ci.d/opensbi.yml'
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index 68bc160f41b..8d7e2fdb7e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -427,6 +427,7 @@ L: kvm@vger.kernel.org
 S: Supported
 F: target/i386/kvm.c
 F: scripts/kvm/vmxcap
+F: .gitlab-ci.d/crossbuilds-kvm-x86.yml
 
 Guest CPU Cores (other accelerators)
 ------------------------------------
-- 
2.26.2


