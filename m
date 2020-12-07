Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FBB2D0FAD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 12:48:09 +0100 (CET)
Received: from localhost ([::1]:36210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmEzw-0002TI-FQ
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 06:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmEdA-0004KD-Nn
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:24:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmEcz-0004cK-Sb
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607340261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MSG4LDxzGyW4ZC1IxX3fWcY4XCf9aUhCu+WzuAKC2lo=;
 b=arAYHgRDljPWHYGpL+Rq2lHGCIBZRjqGaIWjgzfJI5wbZte7WlSrS+pskFSnwzcHnKXWQM
 0DxyH3l6SoSPPLCHoj/TBaJvvoqYkKkXPOgr3N2I291s8EzXdJmSMXbuC6Y2cSvNyosl2f
 2HcwK9mePFk5AcnKlGaaQHsDzNg7Ads=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-yM3TNt6nMXK2IH7e4ReVag-1; Mon, 07 Dec 2020 06:24:19 -0500
X-MC-Unique: yM3TNt6nMXK2IH7e4ReVag-1
Received: by mail-wr1-f69.google.com with SMTP id e6so4695427wrx.13
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 03:24:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MSG4LDxzGyW4ZC1IxX3fWcY4XCf9aUhCu+WzuAKC2lo=;
 b=U6C4fVAg7waC1kVDUIKbymQgthT2yv3ZyKbwZPuuaLSIoORYYNRjtBsLwkxMeiLq+y
 5pSJJLq4Jw2L3bSXOSuPer/zeNVEO5OmUsGG63G3z+WdJl/44fF7BIov4CaJOJ/1E/8t
 ouK6zv2WEfpWce6Io9jpCCaL9qNCSpxudNpdaS47ceKYzFm2hW2SoLpdKqgNcoKycwoi
 qBSxmPWMHqQpb3jVSfCkYP6ZoMyfaOCNMssJ+8Kvg1RMwrg0e+xJFH3aJEKwdSADobbl
 gUKzCh9Kgtfs97/4M0AF3S/k6nQYFJypTKoVrepyzHBh0ZSJauV5xa0fRsMUV7UVd4gx
 qTTQ==
X-Gm-Message-State: AOAM5311k6Gg8EGit1O/2AbkOlup5FoqnLO2OtWJF+E8ZLWWWwBo9zFZ
 hOZMA9LP0KE4AItwqVWB1DZ8cZfXVFZRxMUTzgk7KT3jFyNYRVGsdhtDQi7yDl+vUTo++SlmOh2
 H8bNuEmuvanQoeIsL66EtnEQ9EGNw1H3MIQyIyzlvPHDhYKycu/UeR4utYSc9e0Qp
X-Received: by 2002:adf:e444:: with SMTP id t4mr19219673wrm.152.1607340258447; 
 Mon, 07 Dec 2020 03:24:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoNIgHdpMpGp2bUcwaH+FdRRx2uvKYslTLHSrs8jOZKgCeWvKJMTuuRmK450fuWJjSTjvKmw==
X-Received: by 2002:adf:e444:: with SMTP id t4mr19219640wrm.152.1607340258267; 
 Mon, 07 Dec 2020 03:24:18 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id e16sm4243619wra.94.2020.12.07.03.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 03:24:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] gitlab-ci: Add KVM s390x cross-build jobs
Date: Mon,  7 Dec 2020 12:23:52 +0100
Message-Id: <20201207112353.3814480-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207112353.3814480-1-philmd@redhat.com>
References: <20201207112353.3814480-1-philmd@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Willian Rampazzo <wrampazz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cross-build s390x target with only KVM accelerator enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index d8685ade376..7a94a66b4b3 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,4 +1,3 @@
-
 .cross_system_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
@@ -120,6 +119,13 @@ cross-s390x-user:
   variables:
     IMAGE: debian-s390x-cross
 
+cross-s390x-kvm:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-s390x-cross
+    TARGETS: s390x-softmmu
+    ACCEL_CONFIGURE_OPTS: --disable-tcg
+
 cross-win32-system:
   extends: .cross_system_build_job
   variables:
-- 
2.26.2


