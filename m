Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBF8A9478
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 23:06:38 +0200 (CEST)
Received: from localhost ([::1]:39820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5cU8-00027j-QF
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 17:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51651)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i5c3z-00013g-Ny
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:39:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i5c3y-0003Yp-Lt
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:39:35 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52711)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i5c3y-0003Y2-6Y
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:39:34 -0400
Received: by mail-wm1-x344.google.com with SMTP id t17so221668wmi.2
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 13:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1rnhVYQn9Oe6VywY+z7ygMm/a3pGbUQnt3yqRufslG8=;
 b=mnomE3rmloITVa50F1AfB25Cswm3F9CoVE6xOSg2JLfcglDm0SPpK/0PJ9RR+dBQN3
 vZKMPSrlUpWR5q+oLgcQniVkt0KUWrDzw4rpR2Qd/rRBCQ7S6v0VqLGE5FCuEdM5/c7P
 qfZ+K/OoH3rpo80hS+1FB8Q6FwxT5yCy608oTT7q5vO9KgwtObZlfM6OCdt2jt0kyI/1
 NeDQ5n5ujfiZ1QApPmTbQ84+8/A3z6O+4u111ZcvM3oW/xah9VphLoxzOJIsSkAUFc5o
 O/ScybrorzfMKVMXRXE8MjxGHLefdZpIVs3kVIgEt3LYfDkL5Eu4Z+YoXkG9gMd/FrM4
 ZyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1rnhVYQn9Oe6VywY+z7ygMm/a3pGbUQnt3yqRufslG8=;
 b=SPuo8bTKEEp3yOM+0o3+Ag7yXRm6HbZXI6uAya8GGPeP4RFCqEvstZSMmovqBoacny
 kKgfE4PmQp2/0NUxLpgaeoeUA2ZBLpBi2o8lv+PQmbcQ8rQ7HFImsE46LUMVPQ7bOZIg
 18EuYz6ZAA70bjxqpgIMn/3AR/3FidxB2wAIFr4Q1F3G+k0lkH7OsCVdUvK3WwnCfkyq
 soIt+RUFrFa3zHrRxXle4NNUXMGzIdiCtXjkrTzRaBzbf1l3HeNf3/eFaWGKE7PTtW+Z
 czIQR4brI4QL/zUYUGkT8fKXmkIkrZodx/J56y8pqewBtwVmmyFbUTEKDmc2XnaQmfhz
 0tPA==
X-Gm-Message-State: APjAAAXJc4n3SW7zBPYOVerhlZhM/Rj3mDbVQEKA2p1BoEEtb3Gb8xCw
 5bZLT/0YX0LzupP3M9hDnZJU3w==
X-Google-Smtp-Source: APXvYqyKmMXpRRhhw9diK61jKjYB30QFwAOZq/g7i4bOwjQjS2LFQCrZXO30vo3nfML3j4F66iYbsg==
X-Received: by 2002:a7b:c091:: with SMTP id r17mr124082wmh.74.1567629573137;
 Wed, 04 Sep 2019 13:39:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i9sm113716wrb.18.2019.09.04.13.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 13:39:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E78051FFBF;
 Wed,  4 Sep 2019 21:30:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 21:30:10 +0100
Message-Id: <20190904203013.9028-40-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904203013.9028-1-alex.bennee@linaro.org>
References: <20190904203013.9028-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH v1 39/42] .travis.yml: Cache Linux/Clang jobs
 together
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

These jobs build different components but use the same
host features. Put them in the same cache bucket.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .travis.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index 63cbf41e573..17aca3cd9c8 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -173,11 +173,13 @@ matrix:
     # Test with Clang for compile portability (Travis uses clang-5.0)
     - env:
         - CONFIG="--disable-system"
+        - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-default"
       compiler: clang
 
 
     - env:
         - CONFIG="--disable-user --target-list=${MAIN_SOFTMMU_TARGETS}"
+        - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-default"
       compiler: clang
 
 
@@ -190,6 +192,7 @@ matrix:
 
     - env:
         - CONFIG="--disable-user --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
+        - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-default"
       compiler: clang
 
 
-- 
2.20.1


