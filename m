Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91393C19AC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:14:43 +0200 (CEST)
Received: from localhost ([::1]:36292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZTu-0003ig-Rq
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPH-0003Q7-Pj
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:09:55 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPE-0004mj-4z
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:09:55 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i94so8843211wri.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bTttEc+oJXhPYrt7q5iIhClUXDghFeYtwNO1q7NtVDA=;
 b=lZC3WKeuVUh9oqyvFyl2h2nSMoipfcWUFZO//z587J60hi+MXF8o2PcQL9SgfPA4bv
 xtQrOhu2RLUyz6y0aRXA78dUjRyja2CTrSFjnI7GvhZ52zy89Bk7X/MN4eyt4s0XZ5/o
 9/hRHy9bIpXkM0m2ayaamH5eRdDYbHpLT/MRRdonLi5zp4o+m44pHgTYCHAf50gIo2CZ
 adCTKLn+RqQR1u+yAtYbiDd+KaJOoOcx29/xWW8V3BVRDUA3XSqOm9IL4oCQRVgHBLDk
 GBH/V3Bq6GYFzTpT1P32nv6sq3PNCKXj6h8lGalNZll8rUQbgwyX8P/wgyGJ7rIww8jP
 qO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bTttEc+oJXhPYrt7q5iIhClUXDghFeYtwNO1q7NtVDA=;
 b=AGzSei+mcduaKcwlT8JJPd1RuA3B2juUGj1FoDlOCvM22ef8p1nupFJdyIh3uVLbw/
 5U1pOKE1PmMdFcQ3ABOnk5QzpYMAw4ecWpXc/k7iwhiie/aNpQSFJHo5v70fYT/0FfyV
 0AZgR8JI1PXoD5mKyEvTxxLyDDBaOGQdYEx/jVkC6UZr4CLYRJO7zEv9xSnhsM6if4R0
 qCXNTBEVXYT3rRwqeRnbFL8KMxKyQ8vjAO0kPUVPOFjGtVtrA3LjBYxt2fHDUOt50VgY
 HBac5LH7PdphrudW8lSmKa5tQ4SqIIuG2hZI7P60hjG8LOaa5xZkfqHKoBpyTdiesYM1
 5lnw==
X-Gm-Message-State: AOAM532AxL+3Hp3nSpFB5wPuaeoqUxRxDZGs3rmv5oHplqegcKrcLH+l
 cmDnx1JlLOCRg6Q6nlO0bJXV/w==
X-Google-Smtp-Source: ABdhPJwvURE1A9ZBHuNjAjxV2B3hy8XANMp9Ci1dYm1CoK/BSdaId39l9vy/x6YRRgirua+jeDD7Bg==
X-Received: by 2002:a05:6000:50f:: with SMTP id
 a15mr30277578wrf.108.1625771389656; 
 Thu, 08 Jul 2021 12:09:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o7sm3570695wrv.72.2021.07.08.12.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:09:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C76611FF96;
 Thu,  8 Jul 2021 20:09:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 08/39] cirrus: delete FreeBSD and macOS jobs
Date: Thu,  8 Jul 2021 20:09:10 +0100
Message-Id: <20210708190941.16980-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, Ed Maste <emaste@freebsd.org>,
 Willian Rampazzo <willianr@redhat.com>, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, aurelien@aurel32.net,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The builds for these two platforms can now be performed from GitLab CI
using cirrus-run.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210625172211.451010-4-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .cirrus.yml | 55 -----------------------------------------------------
 1 file changed, 55 deletions(-)

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


