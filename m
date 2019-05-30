Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570172FA34
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 12:22:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50609 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWICJ-0006En-CI
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 06:22:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hWI6Y-0002cF-R4
	for qemu-devel@nongnu.org; Thu, 30 May 2019 06:16:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hWI6Y-0006XT-2T
	for qemu-devel@nongnu.org; Thu, 30 May 2019 06:16:14 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39973)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hWI6X-0006Wx-SR
	for qemu-devel@nongnu.org; Thu, 30 May 2019 06:16:14 -0400
Received: by mail-wr1-x443.google.com with SMTP id t4so3810371wrx.7
	for <qemu-devel@nongnu.org>; Thu, 30 May 2019 03:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=W0YwnQ7RyXinYmA/R3gRUT7SUlaDY+T48f3CddOaKS4=;
	b=is+/WRibWmlDXeyKsRs5GmyS7UPJbnfWF923ZV7AYXKcxqn5PpLdrzy26ni0gIi6te
	obLr59UrIPwgbrj1WUYrmqmDYgT9z2RJRifLE1LVC+5KFZaaAV8qVB3m48p2XLihW5vF
	GTv5JBkZTqLkUFLmT0ufgMNnvMrHKIxytuujuoK5ULCsCihdY11xsTf4Cwp1UJObfIAL
	lj9dfaHBOFZZYPhziXvbA8DYDG7ljIn/9bBPfWqpZfEE4YXNBGjRrG4k2/d6a8OJyf5l
	lxcnnkh7ePCN4XJrPkR4xjnnapE+5JxKJFcuWQcCOmOqGw7KADNhcxGptghbeWnrqzsA
	a6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=W0YwnQ7RyXinYmA/R3gRUT7SUlaDY+T48f3CddOaKS4=;
	b=K6vdjrwlLxle/vb/utQ4b9TX3/SdosrsetBtUCJMN99/oZCjE1Bc5HKzie1jdKWfW1
	ZcpOGP0JpyOhzYIQdNEObsomDdy4D667Wf8+pEGyKDyRCGznxKN9JCU0avPb9E4fKnCk
	RPBBHJWEkh0hXjcCIK3FI9Il/jQWFGWv9zLZjIkVIKk+vPTxZDRE8htEmZXfRzqZ5p6m
	lr2VTqf5n77W0TvT3PegbT9OgDQFEb+Cgr/Q/cz2dmZnu241yYfDbmCahEhiLcfsLAFJ
	TFVVC4TJDUr/WvWj9qUGK4+l9+qxv5Lr74XJUef4Ab3aqGUSF6GnGx8cEMpOGFHhNF3U
	KM1Q==
X-Gm-Message-State: APjAAAXN2PwNAGjdMbPHdhOc4fyKov8sar5ijODcVZ4DXDI+pINQzx9s
	5HFxpXMhao0QM6aPaHcxYAdW3g==
X-Google-Smtp-Source: APXvYqzX+8tBQ8C9W8CsItE4gtgPKPdb+9LiJIwHNszJUh3weKMVkbKy4WFGd1IHEy4z78c+dmmH8A==
X-Received: by 2002:adf:dc8e:: with SMTP id r14mr2067766wrj.121.1559211372802; 
	Thu, 30 May 2019 03:16:12 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	h12sm1917633wre.14.2019.05.30.03.16.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 03:16:09 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9B72E1FF96;
	Thu, 30 May 2019 11:16:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 30 May 2019 11:15:44 +0100
Message-Id: <20190530101603.22254-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190530101603.22254-1-alex.bennee@linaro.org>
References: <20190530101603.22254-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH v1 07/26] .travis.yml: bump gcc sanitiser job
 to gcc-9
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The toolchain PPA has it so we might as well use it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index b053a836a32..f0aa37f2d12 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -240,8 +240,8 @@ matrix:
             - ubuntu-toolchain-r-test
           packages:
             # Extra toolchains
-            - gcc-7
-            - g++-7
+            - gcc-9
+            - g++-9
             # Build dependencies
             - libaio-dev
             - libattr1-dev
@@ -270,11 +270,11 @@ matrix:
       language: generic
       compiler: none
       env:
-        - COMPILER_NAME=gcc CXX=g++-7 CC=gcc-7
-        - CONFIG="--cc=gcc-7 --cxx=g++-7 --disable-pie --disable-linux-user"
+        - COMPILER_NAME=gcc CXX=g++-9 CC=gcc-9
+        - CONFIG="--cc=gcc-9 --cxx=g++-9 --disable-pie --disable-linux-user"
         - TEST_CMD=""
       before_script:
-        - ./configure ${CONFIG} --extra-cflags="-g3 -O0 -fsanitize=thread -fuse-ld=gold" || { cat config.log && exit 1; }
+        - ./configure ${CONFIG} --extra-cflags="-g3 -O0 -Wno-error=stringop-truncation -fsanitize=thread -fuse-ld=gold" || { cat config.log && exit 1; }
 
 
     # Run check-tcg against linux-user
-- 
2.20.1


