Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E9E3C5C60
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:41:18 +0200 (CEST)
Received: from localhost ([::1]:53432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vFM-00022X-Tr
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1k-0004Ny-TJ
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:13 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1j-000894-6J
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:12 -0400
Received: by mail-wm1-x336.google.com with SMTP id k32so8074179wms.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gya0rhZdDHpqfN5h59vk9zddDbflAcf+45r7VgBsyyE=;
 b=CMnFQdJQPUP8sl6LAz68UBKE8mZkpcy4TDBoBWK2HmCVnwzmiYz/ybHhbcVWt4kfk+
 q1Y/lHo0FItm+aeXGuMc9Gpk3/W3UYH/aMS+hLbRcLi8SlwEbCqY1REBOOozqq75NH1y
 yBVzDJRHIrTH3mlxqeCXVRmYVZ2F2qHDBdS6O12sfw2dCo+kGWbNVdpYE5t7gG+A2a8P
 g7i86pxnbclwdTes32B7J5WcQr5HogjlZVVCQmMpZJH7S/0TK4PKbo0c5n2HTmCJjb4T
 GPj3jN2QaasJU3Hj0vaB/n7/VcHe/MJXHU69VCU2jqn3IIvkK8cgfQW/NKHl+EoP3jgw
 nsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gya0rhZdDHpqfN5h59vk9zddDbflAcf+45r7VgBsyyE=;
 b=Gdi0ebY5yRMTYpP/u4fw7ePzqVdJxIRODqnIO7D9VuncG7RAxeRBA/XdLG0ZPS5vJi
 d5D1EuJPh4Ez3IEITd9YfpIrV+H77uhb/eeQ3s1WmIQvdOB5EEq8tPy78x8VBURP1pYL
 Wg6x8cOzX40/dTPZ+9sVRzF/qiA9uKH50im2aqgIxqTGeIntmRTbaukt3r03pB/2KOFW
 b+lq4e+TKnPDN+dhcbH4lYn3RfDOLTkBjwohp3q4y/LhpBT6oqHraKIkCOH35fX0Mqfc
 5F0MJGAGvmcs/9AJij4j2RracCb5QWZQcvdYNtncHeAnVCeIV5Dk4auoHfpbscU0kXIv
 R6Qg==
X-Gm-Message-State: AOAM5314ClFXewXNnlUMxBBaTwDNjCQmMjcwULCgWjF5exff58b8T5yL
 GU3d6lvuZnyOTB8bykmuhXDMKw==
X-Google-Smtp-Source: ABdhPJxHGxeL/NoM65aI6xnVjfzc/3yswvpVK7kr5vynMeg3KUPVTk6K+eD91wkEwAMvP7T8oCL2aA==
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr13644559wmh.89.1626092829826; 
 Mon, 12 Jul 2021 05:27:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q19sm19542536wmc.44.2021.07.12.05.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:27:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 95EE31FF96;
 Mon, 12 Jul 2021 13:26:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/40] cirrus: delete FreeBSD and macOS jobs
Date: Mon, 12 Jul 2021 13:26:21 +0100
Message-Id: <20210712122653.11354-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The builds for these two platforms can now be performed from GitLab CI
using cirrus-run.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210625172211.451010-4-berrange@redhat.com>
Message-Id: <20210709143005.1554-9-alex.bennee@linaro.org>

diff --git a/.cirrus.yml b/.cirrus.yml
index f4bf49b704..02c43a074a 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -1,61 +1,6 @@
 env:
   CIRRUS_CLONE_DEPTH: 1
 
-freebsd_12_task:
-  freebsd_instance:
-    image_family: freebsd-12-2
-    cpu: 8
-    memory: 8G
-  install_script:
-    - ASSUME_ALWAYS_YES=yes pkg bootstrap -f ;
-    - pkg install -y bash curl cyrus-sasl git glib gmake gnutls gsed
-          nettle perl5 pixman pkgconf png usbredir ninja
-  script:
-    - mkdir build
-    - cd build
-    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
-    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
-    - ../configure --enable-werror --disable-gnutls
-      || { cat config.log meson-logs/meson-log.txt; exit 1; }
-    - gmake -j$(sysctl -n hw.ncpu)
-    - gmake -j$(sysctl -n hw.ncpu) check V=1
-
-macos_task:
-  osx_instance:
-    image: catalina-base
-  install_script:
-    - brew install pkg-config python gnu-sed glib pixman make sdl2 bash ninja
-  script:
-    - mkdir build
-    - cd build
-    - ../configure --python=/usr/local/bin/python3 --enable-werror
-                   --extra-cflags='-Wno-error=deprecated-declarations'
-                   || { cat config.log meson-logs/meson-log.txt; exit 1; }
-    - gmake -j$(sysctl -n hw.ncpu)
-    - gmake check-unit V=1
-    - gmake check-block V=1
-    - gmake check-qapi-schema V=1
-    - gmake check-softfloat V=1
-    - gmake check-qtest-x86_64 V=1
-
-macos_xcode_task:
-  osx_instance:
-    # this is an alias for the latest Xcode
-    image: catalina-xcode
-  install_script:
-    - brew install pkg-config gnu-sed glib pixman make sdl2 bash ninja
-  script:
-    - mkdir build
-    - cd build
-    - ../configure --extra-cflags='-Wno-error=deprecated-declarations' --enable-modules
-                   --enable-werror --cc=clang || { cat config.log meson-logs/meson-log.txt; exit 1; }
-    - gmake -j$(sysctl -n hw.ncpu)
-    - gmake check-unit V=1
-    - gmake check-block V=1
-    - gmake check-qapi-schema V=1
-    - gmake check-softfloat V=1
-    - gmake check-qtest-x86_64 V=1
-
 windows_msys2_task:
   timeout_in: 90m
   windows_container:
-- 
2.20.1


