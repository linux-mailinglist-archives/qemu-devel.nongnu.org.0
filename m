Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DECD2D06A8
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 19:58:07 +0100 (CET)
Received: from localhost ([::1]:54848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klzES-0006bW-3t
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 13:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klzBx-0004cT-Pk
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:55:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klzBu-0001q4-Gc
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607280925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r0Lqr22l7ATKhofbc7EdyOSapxnrV+ynGfxlD6q9jNk=;
 b=SSnMWYCsfN1oznTMN5e15j3msdb78/4wuJHDZJ3IjSJEqQglO8DyMUIEBmhwVjg/Epa5tu
 6qhnX6SOH82ORSDjgM9XAZkp1VinVgATzFdXRr+OEq6XSgAhS1CuCCzhgYu4jgniL6t3Vy
 6vPfZEEvJ0lreixQMVUmvjlz1T0R7Fc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-yqSrPH8LNrytbAYULeZ7-A-1; Sun, 06 Dec 2020 13:55:24 -0500
X-MC-Unique: yqSrPH8LNrytbAYULeZ7-A-1
Received: by mail-wm1-f70.google.com with SMTP id k126so1497141wmb.0
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 10:55:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r0Lqr22l7ATKhofbc7EdyOSapxnrV+ynGfxlD6q9jNk=;
 b=Tg8vEVKJK7vRTggMU37bJdCQY7FI21UTxO74FVtBwT7Knltim7Z+c4t7nJdBkBKRDX
 JiwNQNeDSTikUOAmhbag4o1FlUGlbwKSBky8w4keG3f7B+QO0tETXIJ5D3mDIzZS4JUP
 +LtDcsNwV+KUIXkDd5U14UAaclIlwujbeGGebC+7eSMsD8HlaR0ugqxeSWgYxqbgmD7Y
 FCo91bhI3wMdqrsV0UZZbyteWl6BjkvSJOwt4p4s7CtQFBTD/GhFYXP62Z0bUfLVrw6o
 ycX3kR7ruiAWx6khc4RxMOCp7zyjjOXWrKKZip4Fi83FinziEtZ9/2SuL0oZ0eGnjksm
 bv5A==
X-Gm-Message-State: AOAM533KPoxjvhrr5y+8mgWYrWXsXHuRwq7y7PxeLNT6e+/vTVy81We1
 gHMf9jfzpYVwMmCIxtODy4T4dEe7q3Wbb1HgCwNbAMmM9+RxvKOmQWLY624RkLyUIDNhuHI8smg
 xvzYGFRJ07bN49dSoS855EFo6+bdimEcFgZJ/4zfZOWNpn933wEVogazF7sHgXq9m
X-Received: by 2002:a1c:e084:: with SMTP id
 x126mr14748238wmg.109.1607280923088; 
 Sun, 06 Dec 2020 10:55:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUdCKKWJAWPI622MaP/oFwVO6CryrIW/lu5gCYVi0AVbbug+7fy7NlRBDMxgrTLJyAtgWuOA==
X-Received: by 2002:a1c:e084:: with SMTP id
 x126mr14748201wmg.109.1607280922898; 
 Sun, 06 Dec 2020 10:55:22 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id m8sm11324488wmc.27.2020.12.06.10.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 10:55:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] gitlab-ci: Introduce 'cross_accel_build_job' template
Date: Sun,  6 Dec 2020 19:55:02 +0100
Message-Id: <20201206185508.3545711-3-philmd@redhat.com>
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

Introduce a job template to cross-build accelerator specific
jobs (enable a specific accelerator, disabling the others).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 099949aaef3..be63b209c5b 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -13,6 +13,18 @@
           xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build
 
+.cross_accel_build_job:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  timeout: 30m
+  script:
+    - mkdir build
+    - cd build
+    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
+      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
+        --enable-${ACCEL:-kvm} --target-list="$TARGETS" $ACCEL_CONFIGURE_OPTS
+    - make -j$(expr $(nproc) + 1) all check-build
+
 .cross_user_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-- 
2.26.2


