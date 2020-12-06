Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27912D06C5
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 20:03:28 +0100 (CET)
Received: from localhost ([::1]:36158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klzJf-00027e-Q8
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 14:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klzC7-0004jB-RU
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:55:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klzC5-0001wR-Rw
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607280937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vxt3MEZXS260piBfvrRF2LPibTg2rLk2j2FgrTceEtE=;
 b=T1jvEwq7Em4yW6lMzfI7oJLiCIkSa8+/UyCu9k+LsvbEN9LhiFDZzIWacmQfXrWwIrR+yx
 j6YbvI6AwHBhUZ0jhKYwD5FPkUQoWlDhSTI0LpO2OnmFUolxyRKTDPm0m93DzbAKiUVy0P
 TVqRflLAPBnWrRF0McAk9zEiMGy3FSo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-cPnBIuP8P8GmjfevVZ_nxA-1; Sun, 06 Dec 2020 13:55:36 -0500
X-MC-Unique: cPnBIuP8P8GmjfevVZ_nxA-1
Received: by mail-wm1-f72.google.com with SMTP id d16so1732505wmd.1
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 10:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vxt3MEZXS260piBfvrRF2LPibTg2rLk2j2FgrTceEtE=;
 b=Gy/MikUJUzCGpL5Dmov3mkMgjfHcaBxA665cZWiqutLDHuMkV5cfjM8CK085epJHo0
 f8MrC045jfTBwlocnDOimgLrXJ6Uu86eALIhYNkMCZdnAr1BsEQyc+aexMZzoaq6Mb7O
 3EaH9cHlz9Xa1Lux78155kUb69ZNmsPAHZGIn8RJ+5Ld49ZHHLwmnzRM/0pQ/B+xqjDy
 ecHLRP16xRcZv0qAm9iB2L58VJ26eWk2P0uIL3z3OkIEM6TsLIOj1yTq/rBCZ9MDuOF4
 B/ES853LEPyiqW/ZHKQHAqK9Pi4rgzMAbLieUCtBBOYBNZ2xsZUuUzjS3QSbYCyeNGnI
 DHmg==
X-Gm-Message-State: AOAM531I8t2iZXV14KGy6RMwd3/l4rpD9VbEAbLzGhXK+BprHbFoDFhz
 dFGu6No87pKbclskXkgeNeIY1y0Fh8FRIwZLYYZN1Xe57uqi3MKzywESTNr8GmLmtBuu7FEBQkT
 fZetZ8OtONSOV+wHHiF1E+pBFzYy6JTv9/07QVr29KOE8Dsn5bCsfGzKGtZoPVN38
X-Received: by 2002:a1c:48d:: with SMTP id 135mr14975810wme.147.1607280934550; 
 Sun, 06 Dec 2020 10:55:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4k4/YkSarxB89UuEp4wGBYMDt9qPp414ZW0Hy6JgLmQ1zgyBWhlkGZseJ8x91ebcKHRE8vw==
X-Received: by 2002:a1c:48d:: with SMTP id 135mr14975772wme.147.1607280934329; 
 Sun, 06 Dec 2020 10:55:34 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id l8sm12023533wmf.35.2020.12.06.10.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 10:55:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] gitlab-ci: Add KVM ARM cross-build jobs
Date: Sun,  6 Dec 2020 19:55:04 +0100
Message-Id: <20201206185508.3545711-5-philmd@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Cross-build ARM aarch64 target with KVM and TCG accelerators enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
later this job will build KVM-only.
---
 .gitlab-ci.d/crossbuilds-kvm-arm.yml | 5 +++++
 .gitlab-ci.yml                       | 1 +
 MAINTAINERS                          | 1 +
 3 files changed, 7 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-arm.yml

diff --git a/.gitlab-ci.d/crossbuilds-kvm-arm.yml b/.gitlab-ci.d/crossbuilds-kvm-arm.yml
new file mode 100644
index 00000000000..c74c6fdc9fb
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-kvm-arm.yml
@@ -0,0 +1,5 @@
+cross-arm64-kvm:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-arm64-cross
+    TARGETS: aarch64-softmmu
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index cdfa1f82a3d..573afceb3c7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -13,6 +13,7 @@ include:
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index 8d7e2fdb7e2..40271eba592 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -386,6 +386,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: target/arm/kvm.c
+F: .gitlab-ci.d/crossbuilds-kvm-arm.yml
 
 MIPS KVM CPUs
 M: Huacai Chen <chenhc@lemote.com>
-- 
2.26.2


