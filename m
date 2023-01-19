Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B93E673E0E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:58:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIXHa-0008Dl-5P; Thu, 19 Jan 2023 10:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIXHY-0008DV-Bb
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:56:52 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIXHW-0008Gy-KV
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:56:52 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso3242446wmb.0
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 07:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RDIna7ij6Yf0MB04RDYvi8Fx5L9kaw5DJw8yW2vb+7k=;
 b=zQdin/zQCGIJIfDAibCSKu8mQ80KJpjd46fnMOUvDueccWY1VB6jTrtaYuSkaIMzFu
 qcMCVVPoOzI9Y2G7VKoDzUs0ip8gg/BaELPM4+rK5EV/HBjyM7xrEtatI2bNPSSdn7bK
 2Ts/V1rk+LjXwuD4whk2PKvyD9QCVfZEvLmcHv8oRk0b1uN+MtrMV9JGfsHdEEN4sHuF
 2x9a25DjFS8avkf7+1iUhMag0Mkg5uG3krEDqIYnJLgpD7mAaO5siaAm+EI1lgZnyIfO
 C0myedUfxRJwZAFZT+gHQ7sSSKD3d3ldCoXH4tzYWu1ykaeX9wccv8j3ZirwogLdk1fE
 f+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RDIna7ij6Yf0MB04RDYvi8Fx5L9kaw5DJw8yW2vb+7k=;
 b=Dbw3pOmOrQJMSJ5ytI0qo/1epeHHgRvaKshSFlZnM5Vic9oSZDoQ4/1U7luaBHfAFI
 7ZB2zwOMvZRa6mPszxLx+wFitXCLk+zWnAZ01AFgBvMp0kUlAAxw5fxW7OOIyGjEprLf
 NPuqTfEHpiBGY/REjTgeVOV1VJOZDnJcJmATkmOV+AY2LuUQoqFfeNtNI+xL9MEMGLEW
 uAssvUE2aO9EPkYmaZHa4Z1OEkvIJTBX1XzKmGj7aFfKng/qsFV6LnmNV5O5Cd7FWUmj
 /J2RlUIkz9MFXcfwj1rRl9jjEB4JDhpdvP36SNSnJJi/UrXGzPYXO2JzKpHdXznLNGnp
 L6Mg==
X-Gm-Message-State: AFqh2krtK2N5AFRjNhW1JmSWXeEeVvO6eZRk/GswpczqjgEjvHjFsEqT
 yjXC60HzGKs24miDh5q1/DCFOORMukjjyD4m
X-Google-Smtp-Source: AMrXdXsDDrhPShVkdnN7O/JpBoVRBMZL/0Ezpo/cpyxujxJa2rg93DdK0wgwJP0l7Q+k6kB1SotQKw==
X-Received: by 2002:a05:600c:331d:b0:3d3:591a:bfda with SMTP id
 q29-20020a05600c331d00b003d3591abfdamr19289005wmp.27.1674143808709; 
 Thu, 19 Jan 2023 07:56:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b003db00747fdesm5307957wmo.15.2023.01.19.07.56.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 07:56:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-arm@nongnu.org
Subject: [PATCH] gitlab-ci: Check building KVM-only aarch64 target
Date: Thu, 19 Jan 2023 16:56:46 +0100
Message-Id: <20230119155646.50503-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

gitlab-ci: Add KVM-only aarch64 cross-build job

Add a new job to cross-build the aarch64 target with
only the KVM accelerator enabled (in particular, no TCG).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Based-on: <20230118193518.26433-1-farosas@suse.de>
          target/arm: CONFIG_TCG=n part 1

Successful job:
  https://gitlab.com/philmd/qemu/-/jobs/3630178191
  Duration: 15 minutes 25 seconds
---
 .gitlab-ci.d/crossbuilds.yml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 8dbbb8f881..fc78d36b31 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -210,3 +210,12 @@ cross-arm64-xen-only:
     IMAGE: debian-arm64-cross
     ACCEL: xen
     EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+
+cross-arm64-kvm-only:
+  extends: .cross_accel_build_job
+  needs:
+    job: arm64-debian-cross-container
+  variables:
+    IMAGE: debian-arm64-cross
+    ACCEL: kvm
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-xen --without-default-devices
-- 
2.38.1


