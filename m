Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8560B1C1168
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 13:17:05 +0200 (CEST)
Received: from localhost ([::1]:36538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUTfE-0007BU-E0
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 07:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36144)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jUTdR-0004bc-Bu
 for qemu-devel@nongnu.org; Fri, 01 May 2020 07:15:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jUTdQ-0002bQ-PC
 for qemu-devel@nongnu.org; Fri, 01 May 2020 07:15:13 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jUTdQ-0002WF-Bq
 for qemu-devel@nongnu.org; Fri, 01 May 2020 07:15:12 -0400
Received: by mail-wm1-x329.google.com with SMTP id u127so6008508wmg.1
 for <qemu-devel@nongnu.org>; Fri, 01 May 2020 04:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dbl7vz/2JDzRYFnfm6XKsckDvoap7FMNqmtKMQ9jX5c=;
 b=trjUVAjjS3qcjwZAyKeBh9VILeR6xgRHdVzPBrRIBGCJm/nZbc+ATp4MhFhulCrbDo
 h+kqVTFVnOGUqzSmsTBqMajGiA97TkFx2X6GGYQVb+af2laWb9sZ/bWtqjL4+59nGw06
 zFUf9XB95JF+9V9gwLSG3hwuhJETxfidwytyoyCpCIYmK9C4jjNTLwzo/OTucqWQFgFw
 2YiZ8BEIqeBeESTPzZ5596UcdTvDoEhlY+j9l0kENz90RFjrAyTc+bWIX/V2LfLW8AvY
 80EvGtYG/3biicDQAYOJo+fdNiQEVmoig3E2CBrg5/o4l9Eq5okfrjhE8dlHTET2Hikz
 Bvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dbl7vz/2JDzRYFnfm6XKsckDvoap7FMNqmtKMQ9jX5c=;
 b=ql55xyVWjI1LUUjyPCNQ+dNySYWVGpsSicdLi5V6vIqpQwPBeh+80w6EZHHqSw8pzH
 2y99XGTFX+Lp8ksqdYcoxa7zmR6O+4eRCYZ6CVEPuEtFhObLe1+HqNK7LaJw0jktf/Yc
 1Z+gyQI1GR8a66CxMZJ+5w/bxXGLvPHEKl2vQnY4YDW8d30V8O7kJipghMAngH3N62F5
 wLybQD/+2jCZ9k8D/t+nM4z0fCtH+gH8uzq6tdx9a1K0AJc51IDNplod+PnIgKq9sw6I
 qWJ1CVN9El1hD8IIAUYtBULikwuGGNojSUT3/XzPFa0/ymew81u/pcVG94WA63ja4u/M
 1VMg==
X-Gm-Message-State: AGi0PuYfi3AcH/O/uvEwNDdgw6FOcjwWJ+4KB/zKYkck4TMSMYDI8+IX
 8uUzoaM5mMluEp6MUAakRLjVeetsE68=
X-Google-Smtp-Source: APiQypJ0H6ovfA/wZ9pDuxoy/1BelI8139tlSRbM67j58onUvZFlK88F8HqHN2vgOzx74A6iACfCvQ==
X-Received: by 2002:a1c:7905:: with SMTP id l5mr3755391wme.5.1588331710803;
 Fri, 01 May 2020 04:15:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e11sm3840434wrn.87.2020.05.01.04.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 04:15:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A5BF61FF8C;
 Fri,  1 May 2020 12:15:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 2/4] .travis.yml: drop MacOSX
Date: Fri,  1 May 2020 12:15:03 +0100
Message-Id: <20200501111505.4225-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200501111505.4225-1-alex.bennee@linaro.org>
References: <20200501111505.4225-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::329
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This keeps breaking on Travis so lets just fall back to the Cirrus CI
builds which seem to be better maintained. Fix up the comments while
we are doing this as we never had a windows build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml | 28 +---------------------------
 1 file changed, 1 insertion(+), 27 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index a4c3c6c805..49267b73b3 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -9,9 +9,8 @@ compiler:
 cache:
   # There is one cache per branch and compiler version.
   # characteristics of each job are used to identify the cache:
-  # - OS name (currently, linux, osx, or windows)
+  # - OS name (currently only linux)
   # - OS distribution (for Linux, xenial, trusty, or precise)
-  # - macOS image name (e.g., xcode7.2)
   # - Names and values of visible environment variables set in .travis.yml or Settings panel
   timeout: 1200
   ccache: true
@@ -271,31 +270,6 @@ jobs:
         - TEST_CMD=""
 
 
-    # MacOSX builds - cirrus.yml also tests some MacOS builds including latest Xcode
-
-    - name: "OSX Xcode 10.3"
-      env:
-        - BASE_CONFIG="--disable-docs --enable-tools"
-        - CONFIG="--target-list=i386-softmmu,ppc-softmmu,ppc64-softmmu,m68k-softmmu,x86_64-softmmu"
-      os: osx
-      osx_image: xcode10.3
-      compiler: clang
-      addons:
-        homebrew:
-          packages:
-            - ccache
-            - glib
-            - pixman
-            - gnu-sed
-            - python
-          update: true
-      before_script:
-        - brew link --overwrite python
-        - export PATH="/usr/local/opt/ccache/libexec:$PATH"
-        - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
-        - ${SRC_DIR}/configure ${BASE_CONFIG} ${CONFIG} || { cat config.log && exit 1; }
-
-
     # Python builds
     - name: "GCC Python 3.5 (x86_64-softmmu)"
       env:
-- 
2.20.1


