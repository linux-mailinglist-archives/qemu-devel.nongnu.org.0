Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691532D1270
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:48:02 +0100 (CET)
Received: from localhost ([::1]:45152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGrx-0000Pg-GJ
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmGMl-0004M2-AA
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:15:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmGMe-0001Ct-FJ
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607346937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6EJ4iyK07Ty3dzRyIkzOuiJNHq5RuTRyKsBVarixwBA=;
 b=ZL/h83rGNOMGpjTRKxZRwckMp5/hshrf+qb5BGg/Io6IiMEt6z8MBeTBZXayDbkoru0Qwc
 uKE83oTv3hoeoEdcGXKYKw0ozzafexk+3XS5Iz4xlFTSlQXJz56vj33ygsHjQVkRwtlv+m
 n/KMhdIM4tzaIeqfSm1MWGH15C+kn3U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-VWFxQSDaMzS1n-7M6JEy4g-1; Mon, 07 Dec 2020 08:15:35 -0500
X-MC-Unique: VWFxQSDaMzS1n-7M6JEy4g-1
Received: by mail-wr1-f71.google.com with SMTP id u29so402992wru.6
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 05:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6EJ4iyK07Ty3dzRyIkzOuiJNHq5RuTRyKsBVarixwBA=;
 b=lqnRn+l1CxRXRMRsjYMZQ6fc3pdG/IdRBv43td/9gpmEhkXUOYVwAQlsmDJZvAJQkj
 AsnwW2EPIMTrMxgd7d665asyWEqaVEqqPS+9yChol57zMVodIga3KXucVphDw8EEYTps
 FCVww15KFWT9XOFlLZ8da/9SaoDNC3W6aOmd/G4WPrMLMFQFz4JsWK+k47jUPt7DQy23
 H09r7P7sPc+NSSCdr1KzgF0cYhRmpsK635z4kzePWKeCRRJovFVR1+BiBhTbmk9Zcr2m
 hw514tLpOh6YyqamWP483RN7+ux5M+kqfw78JxHF9Xo2FV9TmDlBmRnieGEHV0bToBAe
 PCUQ==
X-Gm-Message-State: AOAM532bhoLz4QyemFnokLLOmvKKrWKPjbH3z9VMYOEqQLS2INfD8oaX
 JIUMnL+MOpkjZoFpozCj8ZgZ+gGHoOKCNA95VwDLpWJ+i7mMwhKRZZaDBLD5R+afQjY5yEl/WZT
 LX5NY+ROdbprWAehwDOEOefXcu2gFJu3MbKhIeIYvw6ILjVYNvm6PolS3nbI1zbCV
X-Received: by 2002:a5d:4c49:: with SMTP id n9mr20011875wrt.30.1607346934208; 
 Mon, 07 Dec 2020 05:15:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9XTTmfTlfqcd6ffk3O9VyZaaUJTIkcE7tELrfEhCU+PvMWzkv9xF2oA2F54WLRjz0+k84yQ==
X-Received: by 2002:a5d:4c49:: with SMTP id n9mr20011839wrt.30.1607346933986; 
 Mon, 07 Dec 2020 05:15:33 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c190sm14567845wme.19.2020.12.07.05.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 05:15:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] gitlab-ci: Add Xen cross-build jobs
Date: Mon,  7 Dec 2020 14:15:03 +0100
Message-Id: <20201207131503.3858889-6-philmd@redhat.com>
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

Cross-build ARM and X86 targets with only Xen accelerator enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 51896bbc9fb..bd6473a75a7 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -134,3 +134,17 @@ cross-win64-system:
   extends: .cross_system_build_job
   variables:
     IMAGE: fedora-win64-cross
+
+cross-amd64-xen-only:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-amd64-cross
+    ACCEL: xen
+    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+
+cross-arm64-xen-only:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-arm64-cross
+    ACCEL: xen
+    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
-- 
2.26.2


