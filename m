Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A55426AF4
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 14:36:59 +0200 (CEST)
Received: from localhost ([::1]:35136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYp7S-00088u-89
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 08:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYox3-00034Q-6u
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:13 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYox0-0006xD-1u
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:11 -0400
Received: by mail-wr1-x430.google.com with SMTP id r18so29360249wrg.6
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 05:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ey+8hcKjwn/a5eDg/jyMS1kvRV58lceBmDEfg1Aiejc=;
 b=zTkvsGUJlu8oaaZOm1DTSlWwk0Q+sM4uz/7AqntQYYdpXFt0894QyE9IqcMse6alPV
 idFZG5ZfvsCjAZVqJ+CrxRRN0CH9ydNT8WHekWbXjsTUBuk/5fXwFGFUUpXNhZa6Dx1I
 7LDc8o8+57n09sWTCMh7q/R128KbGZ2y34//FKYtXGxJn2z8hcEXjchbQPxAVYXllT6e
 0v0mbsjAM/GLv6/2SZlwMVnIG2OaCqAPKEIqxgdvBnxkELzDQsZexEW4SxoYrqLqU80Y
 0IEqjk0xQRyAZN9Xvl1Mv+BG8x2njLQXfs4KvxWOtNTZ8QLA9wL6QWbAm5kzU0zo/WkT
 MW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ey+8hcKjwn/a5eDg/jyMS1kvRV58lceBmDEfg1Aiejc=;
 b=en0UNNQ6Zhwy/n+HiYfZbbRMlMJUwkl5mQUsrmFeV3Y7/zHLrokplv05OiozbroYAk
 i1xdK+4sIhCRjNOY3sdKJtEIyQDDDTt+dOhmYo9utLnpoVdz1col1sUN/Yyxyk48m5DU
 +5353JMw0uSfGSd364g6TZ+Nxpwi+m0aaeLC8jmLgvp+5UwslGh0wlieRj69bHI24mYG
 PsNo0FXanZQcWSG1wzGcAJDFX+4RwEOBHpIBWn8iSeeocxcrSNox8Bj84vBO2k4e0hMf
 LnEqkasIFm9tzb2HK7VyjrEXaM+U4j2nluDL4QG2LGugl8Vafa83RD0VKDTS5MHxBE6w
 2hFA==
X-Gm-Message-State: AOAM533DLfJPU/d6f4ntGJGZrf7fqFvsd7bKpF0u2KUFHGIVzKu7rIW0
 /905LAin3sYzCMoOCWuP2bhgeA==
X-Google-Smtp-Source: ABdhPJzVJiSntUCXqVVXfOuLus47w568un0rdrc+fdix7GzI3Fj1uTtRWI1XLeeXtI7ZMZX0tSFCgA==
X-Received: by 2002:a05:6000:184c:: with SMTP id
 c12mr3672749wri.127.1633695968645; 
 Fri, 08 Oct 2021 05:26:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 61sm2503719wrl.94.2021.10.08.05.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 05:26:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A59591FF9D;
 Fri,  8 Oct 2021 13:25:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 06/12] travis.yml: Remove the "Release tarball" job
Date: Fri,  8 Oct 2021 13:25:50 +0100
Message-Id: <20211008122556.757252-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008122556.757252-1-alex.bennee@linaro.org>
References: <20211008122556.757252-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

This is a leftover from the days when we were using Travis excessively,
but since x86 jobs are not really usable there anymore, this job has
likely never been used since many months. Let's simply remove it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210917094826.466047-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210917162332.3511179-8-alex.bennee@linaro.org>

diff --git a/.travis.yml b/.travis.yml
index 0faddf7b4e..41010ebe6b 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -305,26 +305,3 @@ jobs:
         - CONFIG="--disable-containers --disable-tcg --enable-kvm
                   --disable-tools --host-cc=clang --cxx=clang++"
         - UNRELIABLE=true
-
-    # Release builds
-    # The make-release script expect a QEMU version, so our tag must start with a 'v'.
-    # This is the case when release candidate tags are created.
-    - name: "Release tarball"
-      if: tag IS present AND tag =~ /^v\d+\.\d+(\.\d+)?(-\S*)?$/
-      env:
-        # We want to build from the release tarball
-        - BUILD_DIR="release/build/dir" SRC_DIR="../../.."
-        - BASE_CONFIG="--prefix=$PWD/dist"
-        - CONFIG="--target-list=x86_64-softmmu,aarch64-softmmu,armeb-linux-user,ppc-linux-user"
-        - TEST_CMD="make install -j${JOBS}"
-        - QEMU_VERSION="${TRAVIS_TAG:1}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-      script:
-        - make -C ${SRC_DIR} qemu-${QEMU_VERSION}.tar.bz2
-        - ls -l ${SRC_DIR}/qemu-${QEMU_VERSION}.tar.bz2
-        - tar -xf ${SRC_DIR}/qemu-${QEMU_VERSION}.tar.bz2 && cd qemu-${QEMU_VERSION}
-        - mkdir -p release-build && cd release-build
-        - ../configure ${BASE_CONFIG} ${CONFIG} || { cat config.log meson-logs/meson-log.txt && exit 1; }
-        - make install
-  allow_failures:
-    - env: UNRELIABLE=true
-- 
2.30.2


