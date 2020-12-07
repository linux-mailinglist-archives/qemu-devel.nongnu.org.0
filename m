Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99722D11F5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:28:57 +0100 (CET)
Received: from localhost ([::1]:43244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGZV-0003vC-0B
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmGMj-0004Hn-NE
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:15:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmGMY-0001Aq-M3
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:15:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607346931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R0x/t12SaUJO2Fk00rNBDpsAQee1BNuzclT5nFRV5W4=;
 b=hDDXTieIHZZkaFqpDDrWrlZF4vH4hW1anY0uUJPiDJLlRhZlUrJfGTujnJ7XbuJuSCRgbP
 GD4G7eMbbacRvu4jCbkHIr+ZMnjt/6lM0uRrFQYNwcI/ZDybSfyUmn8pEYMmJO11Siux9R
 6Qvy+YZDT7KkRDILDe5EsOTepGpRv5U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-RlT62XxmNSC2tL6vJFX2HA-1; Mon, 07 Dec 2020 08:15:30 -0500
X-MC-Unique: RlT62XxmNSC2tL6vJFX2HA-1
Received: by mail-wr1-f70.google.com with SMTP id m2so4844794wro.1
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 05:15:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R0x/t12SaUJO2Fk00rNBDpsAQee1BNuzclT5nFRV5W4=;
 b=IWawsxNmktBr7CdLCAcPnjrmMk8umezOhjJ8/s2Fi/4ZzmJEWDxzdtY26ULb/aDL9K
 f3d0ZMy4xEifSsf6eYxax7oSr55rxn69NBZWrgn37Z8zPo82dwIICgKxyXS3a90C9k2r
 JUOx5gDz8+lyXhKWWeUyTfdafcazmdX8c1vXAHzw5EX/ML4sFtdLtSrtAE9MOOrZ5MP8
 RCPLgXNBotBbHRtRME41os/JjpuJ0rgq8/lLfo6rAU6BatvDuSDCEnFMq0vwJyaUHDBd
 y0dIm0Y13wZwczmHulz0CbbIMxTkGLhc0nF3cRWNyOA1ypakjj3WEkLYN3fr03Bqrgk4
 P2/w==
X-Gm-Message-State: AOAM530r/IKTPXwS/UXq05GNry8qfRFTRjfp3xllv8rVpMB6buoGbc+L
 4skeAVRYxLRHq2r6yGR/bDiaHRWIjRzJIz6ofTVP7orVN6HRK3jx3GpZU0nzycaBuSwsv/NSwAe
 TFkxlKgJ7lLUCkXCzBbTIchuG00CGG63ybMVCiyx8WC6l1apzgTFZT6/vMycQXYUo
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr1638526wrs.317.1607346928637; 
 Mon, 07 Dec 2020 05:15:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/E42Mjl9lrV3uJy+mcMKaCC0ghVf2euOZZfgnjWsjT11kOCMnAwQ1c7Ca2DexAj4PkQkYFw==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr1638484wrs.317.1607346928431; 
 Mon, 07 Dec 2020 05:15:28 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a62sm7862008wmh.40.2020.12.07.05.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 05:15:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] gitlab-ci: Add KVM s390x cross-build jobs
Date: Mon,  7 Dec 2020 14:15:02 +0100
Message-Id: <20201207131503.3858889-5-philmd@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

Cross-build s390x target with only KVM accelerator enabled.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index b59516301f4..51896bbc9fb 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,4 +1,3 @@
-
 .cross_system_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
@@ -120,6 +119,12 @@ cross-s390x-user:
   variables:
     IMAGE: debian-s390x-cross
 
+cross-s390x-kvm-only:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-s390x-cross
+    ACCEL_CONFIGURE_OPTS: --disable-tcg
+
 cross-win32-system:
   extends: .cross_system_build_job
   variables:
-- 
2.26.2


