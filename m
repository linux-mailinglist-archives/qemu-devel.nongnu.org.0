Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129FCAE6ED
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 11:29:00 +0200 (CEST)
Received: from localhost ([::1]:36566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7cSJ-0005o2-6P
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 05:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38982)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i7c0b-0004bv-3z
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:00:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i7c0V-0004mR-Ac
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:00:20 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38587)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i7c0V-0004la-3H
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:00:15 -0400
Received: by mail-wr1-x436.google.com with SMTP id l11so18468741wrx.5
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 02:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mWFw3drxQFdjCgGDCtjzGJodYnXOghm6SEi/8qbmbkA=;
 b=EbUl0L0k1hyhXsEGc45gDxW89zIMcVLmr+7Nxp5nphkEgYDWKjxptelhHGNvGp6HXr
 J5qQ4jEgG3AkkpZGTJ9LzKzS1wV6Mv/FZfMk+Z9BCkD28nAq+yzxdzxn+usgF6jkuTF6
 J2y7FdESmAV8aUa9uJMfb87R8X1noub12ktAjec67pOtxSwp1m5O4JPrpxC0HO5V/p2Y
 a1a+nmnhwom3/eDbKv4fsc7EA2rkSuKjhU8Fa0CcK9GeRHEXfAHsDsT/+e+060e4wrtI
 P2bntidNJgHNOFwC++aygAWIgQ/S+DDP3AVCj6/NxPO31LaiJ5BZoZZHsmMsTfrbKrJk
 G+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mWFw3drxQFdjCgGDCtjzGJodYnXOghm6SEi/8qbmbkA=;
 b=df/W4K8Jf4o7OQCib6qsoOpbNSOjEdaLkRVG5Tv96lSksiWNxECIDkz7aQeOl06XTi
 milwZa1Eenj8EKmh+GsmgHRRsc1HpsWTLEgvOCGWg9RKV8cHL85XTg5eIzqXYS/2J+hJ
 fA3JDIUV0RRhBWAsyfC0h9NZ5v9/ky7+5gWzxQCjikjnKf4JMtThuGng9fGJiOHaK/ye
 Fo4HChVgaehRKc/DifnmGv5IMX5j47G1DLck3Wm609b5QbfWeaBdoCiMCl0fi9xYTuYT
 3ZjmgZqnfBZKZiXEevT5UIZDHfFxaCHAJxlk6+3a1Q0620ALY9hd6vDVMwog3TdlJSiv
 ay4A==
X-Gm-Message-State: APjAAAWvTTM+4uNZEd1obymIYfQ80qu5biQt7qubhJc8d0irGhbcnheR
 j3xot79v+peE1lbES+p6JA+LAw==
X-Google-Smtp-Source: APXvYqwP4Mmxq8o/sARLUG6SLv5mfKo4SNIbOzGzgfUTDAFnP1NYAtWhwn6JVlUqLz5VfyRplnT8Zw==
X-Received: by 2002:adf:f406:: with SMTP id g6mr11905113wro.325.1568106014033; 
 Tue, 10 Sep 2019 02:00:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v6sm3475371wma.24.2019.09.10.02.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 02:00:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 433F31FFBF;
 Tue, 10 Sep 2019 09:43:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Tue, 10 Sep 2019 09:43:44 +0100
Message-Id: <20190910084349.28817-41-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910084349.28817-1-alex.bennee@linaro.org>
References: <20190910084349.28817-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::436
Subject: [Qemu-devel] [PULL 40/45] .travis.yml: Document how the build
 matrix use caches
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

We will set the CACHE_NAME variable to improve the caching
of various jobs using the same characteristics. Document it
first.

See https://docs.travis-ci.com/user/caching/#caches-and-build-matrices

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/.travis.yml b/.travis.yml
index 3d1c7f0d7e0..51c7d19c071 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -6,6 +6,12 @@ language: c
 compiler:
   - gcc
 cache:
+  # There is one cache per branch and compiler version.
+  # characteristics of each job are used to identify the cache:
+  # - OS name (currently, linux, osx, or windows)
+  # - OS distribution (for Linux, xenial, trusty, or precise)
+  # - macOS image name (e.g., xcode7.2)
+  # - Names and values of visible environment variables set in .travis.yml or Settings panel
   timeout: 1200
   ccache: true
   pip: true
-- 
2.20.1


