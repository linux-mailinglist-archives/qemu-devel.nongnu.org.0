Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C4566B7E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 13:20:09 +0200 (CEST)
Received: from localhost ([::1]:48321 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hltax-00050o-Md
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 07:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47093)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hltZn-0000Gp-8M
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:18:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hltZl-0000Jy-R5
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:18:55 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36256)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hltZl-0000Iq-HR
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:18:53 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n4so9598356wrs.3
 for <qemu-devel@nongnu.org>; Fri, 12 Jul 2019 04:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pzYCkezYPIi7MiabV/1AE9fTaoStuSceaBxat6YcmnI=;
 b=XhdgBmcZL7q5qe1w2lznd6r7DvnS7s9axGUwPc9GqCXWDOTn+5IERhBU5b6nxfXxR/
 vedBEi+wKxj8SINpBjXWWJnQLBZsPa/hqrzTCjD971guUotmmKVQmUqS3JDjuqcziQ1W
 n/0APxlj1xv9yR4JRfklVdS3DTFS3PrcuSEaxp3tzIp3EHn8nImiUeu5Va99ZdBi1UvE
 GAMRfQ+r/xntYmZGak4VscuLBqn+qDSi3kzIfRTezSlTL0VISP1kh5dZf69gRaGAtlu4
 cx3BxHrM+yGPwFg+lUUTFPBLifS688o5Sc0ptYsWflmA1GhtuJ0Rojn/4fegeOkNNbwN
 dEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pzYCkezYPIi7MiabV/1AE9fTaoStuSceaBxat6YcmnI=;
 b=MlLLDZ5JcDGrWjertSWNr0Bn20m0YbjnMBEhh0FWqpWeMS/BnffeoRYI/PjCGTqM7K
 oujawiRacGi0BMEs9TkdDXLe8JWTIu6Y9a7s3/RfabjTZf6XsyD+PCVVfRUiUCNMbx5j
 5dbftKkpV2nS8cHYxTgULUhcL2joyJOsK3qhN0QEvquDbvDQJzHb2ulX+mk5SHuFUsgc
 WkJ/n3E/p9PJVgEAoIGA0tCLmKytWAnucMcus5ZCHyMDtWzTWckqD96qh53RED4GRoy+
 6j4GuBST09gyuo6U10kETZDJvOJ5Rem437JJN+ugVUSv0yqNyyzD2hKqX/Re4JcFbel5
 rjMg==
X-Gm-Message-State: APjAAAUxvuzmeIXK+DmV0NTzVHYu6MrOeEQsNBUyg5Op3OzI9sOhiYOu
 oiUv0G+K20PDK2ak7OWh6EE9OQ==
X-Google-Smtp-Source: APXvYqyszC+yrRmzJp6dUb4jZOwgZupvN8Z9uYpQoslTmoXNhwqBNnMAzgEw7RLJyiVbiDdC6bsWYg==
X-Received: by 2002:a5d:5348:: with SMTP id t8mr10994743wrv.159.1562930332397; 
 Fri, 12 Jul 2019 04:18:52 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id c7sm7021461wro.70.2019.07.12.04.18.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 12 Jul 2019 04:18:51 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B32A1FF8F;
 Fri, 12 Jul 2019 12:18:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 12:18:44 +0100
Message-Id: <20190712111849.9006-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190712111849.9006-1-alex.bennee@linaro.org>
References: <20190712111849.9006-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42b
Subject: [Qemu-devel] [PATCH v1 2/7] tests/docker: Install Sphinx in the
 Ubuntu images
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit 5f71eac06e the Sphinx tool is required
to build the rST documentation.

This fixes:

 $ ./configure --enable-docs

 ERROR: User requested feature docs
        configure was not able to find it.
        Install texinfo, Perl/perl-podlators and python-sphinx

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190711120609.12773-1-philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/ubuntu.docker     | 1 +
 tests/docker/dockerfiles/ubuntu1804.docker | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
index d3b72209c85..2500ec84b6f 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -61,6 +61,7 @@ ENV PACKAGES flex bison \
     libxen-dev \
     make \
     python-yaml \
+    python3-sphinx \
     sparse \
     texinfo \
     xfslibs-dev
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 9d80b115009..0bb8088658d 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -48,6 +48,7 @@ ENV PACKAGES flex bison \
     libxen-dev \
     make \
     python-yaml \
+    python3-sphinx \
     sparse \
     texinfo \
     xfslibs-dev
-- 
2.20.1


