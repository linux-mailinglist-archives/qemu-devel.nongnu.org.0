Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8553D5B84
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:25:42 +0200 (CEST)
Received: from localhost ([::1]:49334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81Y5-0008FC-HP
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WD-0005O2-BO
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:45 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WB-0008Oz-Ix
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:45 -0400
Received: by mail-wr1-x429.google.com with SMTP id l4so11317204wrs.4
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 07:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yn7blkb0f6XoVxzZMIcR5RpiUR0GwJynhTh2o+9emH0=;
 b=eV10zmHGHRijP6xLdO5AoBQdXngvOtkcW6Gqu3ZwPmy2dVqB+YXNDWrCGIoo1mDf08
 KLcLsQWV9tin9aQmI2LbLpEEI02Ejbehh3WWceLJ1ajTmUVYikdKb0fsMz21z1bIcK4y
 YqXAvyprU4YpwSF4SR/tlqnywK57up7uNCdItfYQt+iH2/gT+95w+SJI47AAYJRFDkSU
 YMm9sOG6KQ8qad003K6UBoMvu/PAqS2nOwrdiiSqUgZd5VtjfCJo5KMGY+3wacNu6JGi
 KUJsLkYXg03L09uQEO/tFr/Tlq3/1d+edBSUiJw4Fm8zg/SSCsos+tduPuYrJ7R5ykhK
 Fv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yn7blkb0f6XoVxzZMIcR5RpiUR0GwJynhTh2o+9emH0=;
 b=ddQ3fvCXFjw3UUX16ZNrYpt885Ld0bInbR3p4wj6m9nbnb7MiWwWuKpFKkxHnhZPjQ
 RURhSFX4MtDExZZ1AdzlY5IqjwHKN8kzSxnod2G1PQW3Fj7kKXNXQOeMz4IDmRQnC7IH
 e3FTH+qZ7u/9Wv1vIkfIJbk5tOfIacJRy4Vzd19Q9uSXRXXXractzwrzylUOZyDGvva8
 fxuumDwe/I6/Vlq2tmct+jEewT3rnfKmpiiBZhkuLp0iZ1VoukR8D0RzD9p27Ua9fUbi
 6qhMIiz/CiUuuPSdmLZg4ILMfuerFVWa25Q3jypH8Vh4ra3pgWTdc3oGukyNuI0Iw6sN
 frdA==
X-Gm-Message-State: AOAM533el4YK/oYfSdJfQARgIQnxCgQA2OrIWtbhvj/ItnQG66ZfqKZc
 s9/bt2dF9VlcPgH0qzI+ZDbWyhxVwEeNtA==
X-Google-Smtp-Source: ABdhPJxxvh17B1wIuFzm/etI74ppV2vzbUtL/azO/tdIsJQGGGK8hdDyBajbO9lDzTyL98Ed5CaFgA==
X-Received: by 2002:a5d:6804:: with SMTP id w4mr19287240wru.417.1627309422353; 
 Mon, 26 Jul 2021 07:23:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 6sm13823427wmi.3.2021.07.26.07.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:23:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 02/10] docs/devel/build-system.rst: Correct typo in
 example code
Date: Mon, 26 Jul 2021 15:23:30 +0100
Message-Id: <20210726142338.31872-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210726142338.31872-1-peter.maydell@linaro.org>
References: <20210726142338.31872-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One of the example meson.build fragments incorrectly quotes some
symbols as 'CONFIG_FOO`; the correct syntax here is 'CONFIG_FOO'.
(This isn't a rST formatting mistake because the example is displayed
literally; it's just the wrong kind of quote.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/build-system.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index ee660a998d0..3baec158f22 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -235,11 +235,11 @@ Target-independent emulator sourcesets:
   symbol::
 
     # Some targets have CONFIG_ACPI, some don't, so this is not enough
-    softmmu_ss.add(when: 'CONFIG_ACPI`, if_true: files('acpi.c'),
+    softmmu_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi.c'),
                                         if_false: files('acpi-stub.c'))
 
     # This is required as well:
-    softmmu_ss.add(when: 'CONFIG_ALL`, if_true: files('acpi-stub.c'))
+    softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c'))
 
 Target-dependent emulator sourcesets:
   In the target-dependent set lives CPU emulation, some device emulation and
-- 
2.20.1


