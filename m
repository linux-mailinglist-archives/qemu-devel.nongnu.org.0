Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3A0E43C8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 08:53:21 +0200 (CEST)
Received: from localhost ([::1]:56072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNtTM-0000Yv-1D
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 02:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35405)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iNtDu-000312-2Q
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:37:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iNtDt-0008NC-0P
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:37:21 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35097)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iNtDs-0008Mk-PJ
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:37:20 -0400
Received: by mail-wr1-x42d.google.com with SMTP id l10so932019wrb.2
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 23:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9U6VJzyn/CEOB4/CyQIKZOWv5ZeIvdrRbrpNWyazKps=;
 b=PfWmAA2tKSj1JXHJduG2Jsmf/itFFTtpUPo3EsUmzgOG6c99pe3YhIXT8WpcUxVwPI
 EvZN0jGdIKyiyi57XAvBVnu45sRAt3iZKVxY1/BOyOC81e1Geh1RMTaS5DCEzqS60rIp
 OInFlWo3Z3sZdOafLFKiWAxolDgsxgKGH4DrdZ9EHgJgdoQhdWt8YR7IDy8+OV4xojj7
 GgA/UV2dtjYg3x55Yy3VvtHsAWNvZnR/5gtBqYLAa6J1ABAHShz3radWhcvUbXTzQg5Z
 fyGJx1AUjmRkGE+g9+d5U79URcoFLqg8pavtKy7omUcD39PvmrHveYOdklCVXnfZnoC9
 BBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9U6VJzyn/CEOB4/CyQIKZOWv5ZeIvdrRbrpNWyazKps=;
 b=dybksaDBU5zfwEnz0UvuWe/J4sOkbjIzJyvXhW9XYQoHhN+f907aWXb21hkCpuo1QB
 H8+AQPqQRCNCUldWZS7+OTRM+cWIfzmk3A3JPXBmL/i5hCOf/RRnLitb68WcFMSiwBFv
 ay0Hgg/5fA1GRDXT3zfwkGbYGTz/jgKoM0RvXVbIB20JO19fDarjcoeS8goNfsiLo3Yo
 gGyc2X/Xu4+uUA9BUP9+4A9jOeBchXgdFCKLGFbv0+fYGIwcRt5tele+3yI1aMXu6MRz
 C4iEL7G5hfdccd9gYbZh1C6U7Ndt2qOfbksNxN/Gw3gv3T/6SAiHhOK1f1Mbprib+hQM
 OtNQ==
X-Gm-Message-State: APjAAAW7vo7VTLLD+/7z4GHKC9+KIK99kWhg6EO/3bYOYRRYKEtM0rEj
 8E9s2kPHZDl7NxzWqFFjcfSvJQ==
X-Google-Smtp-Source: APXvYqxnGCsKkpyhiI2NKmgVjBmGBwYYGPVD/S23ymRH4b4dqI9VYO7GLGEkF6OdoF3C2yhxtVEVQA==
X-Received: by 2002:adf:9f08:: with SMTP id l8mr1200053wrf.325.1571985439615; 
 Thu, 24 Oct 2019 23:37:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f20sm1069033wmb.6.2019.10.24.23.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 23:37:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4515F1FF93;
 Fri, 25 Oct 2019 07:37:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 06/73] travis.yml: Test the release tarball
Date: Fri, 25 Oct 2019 07:36:06 +0100
Message-Id: <20191025063713.23374-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025063713.23374-1-alex.bennee@linaro.org>
References: <20191025063713.23374-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42d
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Add a job to generate the release tarball and build/install few
QEMU targets from it.

Ideally we should build the 'efi' target from the 'roms' directory,
but it is too time consuming.

This job is only triggered when a tag starting with 'v' is pushed,
which is the case with release candidate tags.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191007160450.3619-1-philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/.travis.yml b/.travis.yml
index 7e0d4ad2b31..f2b679fe701 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -343,3 +343,26 @@ matrix:
         - CONFIG="--target-list=xtensa-softmmu,arm-softmmu,aarch64-softmmu,alpha-softmmu"
         - TEST_CMD="make -j3 check-tcg V=1"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
+
+
+    # Release builds
+    # The make-release script expect a QEMU version, so our tag must start with a 'v'.
+    # This is the case when release candidate tags are created.
+    - if: tag IS present AND tag =~ /^v\d+\.\d+(\.\d+)?(-\S*)?$/
+      env:
+        # We want to build from the release tarball
+        - BUILD_DIR="release/build/dir" SRC_DIR="../../.."
+        - BASE_CONFIG="--prefix=$PWD/dist"
+        - CONFIG="--target-list=x86_64-softmmu,aarch64-softmmu,armeb-linux-user,ppc-linux-user"
+        - TEST_CMD="make install -j3"
+        - QEMU_VERSION="${TRAVIS_TAG:1}"
+        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
+      before_script:
+        - command -v ccache && ccache --zero-stats
+        - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
+      script:
+        - make -C ${SRC_DIR} qemu-${QEMU_VERSION}.tar.bz2
+        - ls -l ${SRC_DIR}/qemu-${QEMU_VERSION}.tar.bz2
+        - tar -xf ${SRC_DIR}/qemu-${QEMU_VERSION}.tar.bz2 && cd qemu-${QEMU_VERSION}
+        - ./configure ${BASE_CONFIG} ${CONFIG} || { cat config.log && exit 1; }
+        - make install
-- 
2.20.1


