Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C295B2D1014
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 13:09:05 +0100 (CET)
Received: from localhost ([::1]:50256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmFKC-0001Gg-HT
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 07:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmEdU-0004NO-Q9
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:24:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmEd6-0004cy-Md
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607340268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SEo8ObuiWti6ikwYfSkzOi/pKrNqwxWSbgMNYO8oMYs=;
 b=BmRnGjkWTdzTJ4nzGoGD4rq9Wj49c0yU7OFuMT9MpyjTYNJev5gr5Hzq9vl3tGibZG+lrb
 qs31LZDmAISgUHVwF2dTwEiAqn+VEro7lvo1dihjdZgOgCSGl/CHP21gPsq/AcI0e5luT1
 cCiejK594CGMLXK2Lru6/YvMIe8Yw7A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-f8B4RCmAMWa31pZfvNj3wg-1; Mon, 07 Dec 2020 06:24:24 -0500
X-MC-Unique: f8B4RCmAMWa31pZfvNj3wg-1
Received: by mail-wm1-f71.google.com with SMTP id q1so4081578wmq.2
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 03:24:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SEo8ObuiWti6ikwYfSkzOi/pKrNqwxWSbgMNYO8oMYs=;
 b=l03uDCzZvg/FGpFgvR2OsKQ0pY/gyS1fURANWuWjmFCs6rhLXHebXPBXSZOsHZhsJ1
 OQHLQFQEhGnnwVQ5hulTuHNp8KolTrqE5qLo8XLx080ZqSChxzIP9D+Ne/OklASx3zvm
 JdFZsBTw5WSkz0KBYYn9A8XtQcuVWRx1WHplLOXj/30P+EXOapH0vQ/WASI6uoM0LnTI
 RoH8cX3uIOMl3JhM0Uk4wVubbVMRIP2oOdhIzqqUKerS7XZLcoGmlfYXPooVB170N40p
 f5WfRbFsgN4rHWqFSdeNJ2y7O57nbr243DezPr5S7S6p6e+lq+yNJOoVGbNKZRYTe77M
 NGYw==
X-Gm-Message-State: AOAM530UklJIJrUV125zVYgOR0Q6rfROdaXuoJTuGNkM6ayUGoTJeGFx
 D8e0yHPGWYOwKk30l4Jh+b0T9UwrJ/Wsy+gqJkq4m0m5dMASr5mlUJ2Jm99YulYSd0uqUldfpdz
 7yJDR4pLGetFhbbei90wvyF43Ox1/Hfc26iAv6t4fXA+TeoNlS4UOIuB2EJhcYUtW
X-Received: by 2002:a7b:c1d7:: with SMTP id a23mr17761631wmj.62.1607340263652; 
 Mon, 07 Dec 2020 03:24:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDr6itnK8hiEddAxr/Psf+fnJpJGiFVhvH4Vq5j5+wSxG6IJIVGf7oSHkC7/zpJDDY93Vnkg==
X-Received: by 2002:a7b:c1d7:: with SMTP id a23mr17761592wmj.62.1607340263423; 
 Mon, 07 Dec 2020 03:24:23 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id m4sm8219391wrw.16.2020.12.07.03.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 03:24:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] gitlab-ci: Add Xen cross-build jobs
Date: Mon,  7 Dec 2020 12:23:53 +0100
Message-Id: <20201207112353.3814480-6-philmd@redhat.com>
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

Cross-build ARM and X86 targets with only Xen accelerator enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 7a94a66b4b3..31f10f1e145 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -135,3 +135,18 @@ cross-win64-system:
   extends: .cross_system_build_job
   variables:
     IMAGE: fedora-win64-cross
+
+cross-amd64-xen:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-amd64-cross
+    ACCEL: xen
+    TARGETS: i386-softmmu,x86_64-softmmu
+    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+
+cross-arm64-xen:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-arm64-cross
+    ACCEL: xen
+    TARGETS: aarch64-softmmu
-- 
2.26.2


