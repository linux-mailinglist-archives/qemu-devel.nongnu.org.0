Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDCB36E720
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 10:38:17 +0200 (CEST)
Received: from localhost ([::1]:38688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc2Bc-0003IH-M6
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 04:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc27c-0000dm-3H
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:34:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc27Z-0002I6-96
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619685243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3tvRtEG6tt8cn8cej6kki7kV2Coq9A9XlN/JsFcij9o=;
 b=Z1QGg3SuzuwxlOcQw7p5owRwUd4C7fNnc4Y+BVdBbPiW0ezFxbRtgvmJKn1tfkZH4riUhl
 4vXY60bfa7+6esXvXCMLyhXtFQUt6GJSxgGa6iJbHDxehgxrIwXxP8uS/1lSLHvKqvi8xE
 qnOxxg4VHTlQXuSfhca9uDzdr8ykS+0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-2jldhpKrPxWmLXABD0qJEA-1; Thu, 29 Apr 2021 04:34:01 -0400
X-MC-Unique: 2jldhpKrPxWmLXABD0qJEA-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a1ca5120000b02901333a56d46eso5754569wme.8
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 01:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3tvRtEG6tt8cn8cej6kki7kV2Coq9A9XlN/JsFcij9o=;
 b=PlNIJcGY3MjkjMVUEA6FgMsWIDKf/hid8cugl6Gc/81uVqDPNRrVEiV+5bEZ4f8e//
 WiZ4hT75hhJJOkkcd5ZY8x/uri5tfTZXRmyWAwfnOlHG/dtHRnl692zfIQ/Xeg93Z7MX
 +rTg4RveWxJ6bz1avkbC7z+kUltct5RqASD5tZ6gzsrRFE0uKoID+HXG3jGo5pRZHang
 IC0L4KjshjPNPrbC8NTRwX2dBnIM28LZxrJ35eV2IA4AW7qLnF1upS53Wdrkb2LUclOk
 N/E8COKYy9w5dti0Da7oLjvSH8B2y+xyJIiDCAht+QycxilU4mjzmb8FsutkG05F6tuZ
 eQtw==
X-Gm-Message-State: AOAM530o+ClSLl/3evFZCW1zw3X0+wPQxEqfnnxNzxR4mbHYyDZu13Ka
 6h313NtLOA5PySaqEorU+8EnrenefZ8xtYQTfPB8+rX1ecQpLJUNjunn7R4Wm5TBRSHM2lNZtaV
 5vUSpGi4O1mcXKWo9o91b+wPPbqIfTmpsghxJLkDwBPEGhaeHPhMjAvYHdYPKAFr6
X-Received: by 2002:a05:600c:4885:: with SMTP id
 j5mr35279038wmp.107.1619685239086; 
 Thu, 29 Apr 2021 01:33:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXtBt5mFnXIG04Clw8dqsUOsUh14EN5swBXYf7BOi/btwtfWhMahGWra2tj77VIF56HSaEiQ==
X-Received: by 2002:a05:600c:4885:: with SMTP id
 j5mr35279007wmp.107.1619685238932; 
 Thu, 29 Apr 2021 01:33:58 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id s64sm2847861wmf.2.2021.04.29.01.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 01:33:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] gitlab-ci: Add a job to build virtiofsd standalone
Date: Thu, 29 Apr 2021 10:33:46 +0200
Message-Id: <20210429083346.61030-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210429083346.61030-1-philmd@redhat.com>
References: <20210429083346.61030-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a job which builds virtiofsd without any emulation or tool.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
https://gitlab.com/philmd/qemu/-/jobs/1222007991
Duration: 7 minutes 48 seconds
---
 .gitlab-ci.yml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 52d65d6c04f..ba3c7ade6ca 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -800,6 +800,19 @@ build-libvhost-user:
     - meson
     - ninja
 
+build-virtiofsd-fedora:
+  <<: *native_build_job_definition
+  needs:
+    job: amd64-fedora-container
+  variables:
+    IMAGE: fedora
+    CONFIGURE_ARGS: --enable-virtiofsd
+        --disable-system --disable-user --disable-tools --disable-docs
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build/tools/virtiofsd/virtiofsd
+
 # No targets are built here, just tools, docs, and unit tests. This
 # also feeds into the eventual documentation deployment steps later
 build-tools-and-docs-debian:
-- 
2.26.3


