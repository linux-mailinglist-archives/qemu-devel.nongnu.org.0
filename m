Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136FFE54D6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 22:05:13 +0200 (CEST)
Received: from localhost ([::1]:35738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iO5pb-0003Dv-P4
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 16:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iO5Xm-0002HW-Nx
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 15:46:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iO5Xl-0000nq-39
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 15:46:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38276)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iO5Xk-0000nG-Ty
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 15:46:41 -0400
Received: by mail-wr1-x435.google.com with SMTP id v9so3655888wrq.5
 for <qemu-devel@nongnu.org>; Fri, 25 Oct 2019 12:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KMazBJxRnY0zm7YsZlBAdLDLJgZeGc4MSXDFTtk/xpM=;
 b=kjBwpR55p0MuWwCj7wzmE0To985J2NIT00CWc6nyFDUe9Cd76g5ocW26xTWvsoIQPr
 Q3B6XcOZeKdEXtuPOutfiGj7x9DrDcaTR6IaGOok68K8qvSfoQsZU+DJc3tiFHBSMkmj
 FBHOTVm83UYMlblxXNpIaJkVO9BymtVabhox8Fg7TGxcvnv8R//47V4PbWrJQnFSXv4n
 EvtMgNw7zlaJipm0uNp/kWWkgE0Kr8haJeNEWP6CeuTT2mJJfsPLKkUGzKD5i0GGWtuH
 oSqhT4dK4px6JMycdXKZzsb96Dj3wlW04thO+IxEMASlxfapRUiWRkhQpsxyuNXDoeuC
 8Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KMazBJxRnY0zm7YsZlBAdLDLJgZeGc4MSXDFTtk/xpM=;
 b=DJ6t5HG7D+aygPbpLWHKqjB8bRRR5WXTFjkaCV1bbZSL56YT+XBJ6npi/zlY82q1Ar
 Uvct+FDpkSGCgxDCrxi2nbqQsWL5rqVxgVKfjNO0FqdKaFjfL6LE4DB9+6k5CggHaYpN
 lmclBZXzX/ZkquhGz/r/rhJUzedKw4DSneC9rs7ApNUtERi7QIoWzIfmyztQ45zmau7d
 BjkQQ6o/dB1u6ltTn6nic9tROLxbJb4nTpWRpqld954gjPm77KqrLgGv+qodBh4NYVGy
 2aujhkCLmganEZofe+nuGwTPXWdbTnddG8Bh8AtVK5SU7c8EzrV6VLy5V5DDhYs+VUUm
 CrIQ==
X-Gm-Message-State: APjAAAVGSdmMfdzDXcWAvNnL7+skCSOQ52a3UbiEiOfRDy+F3QQYulpD
 fk+f3Q10061N6tV4OvOULwo/IA==
X-Google-Smtp-Source: APXvYqyCLfGS6bWdFZqV6Fj2hjb72H7Rmo4XNEvoj+yr8k5Z2gdXz0JlYJId/WQl77K1rz7qo2TaKQ==
X-Received: by 2002:adf:da4a:: with SMTP id r10mr4694438wrl.356.1572032799716; 
 Fri, 25 Oct 2019 12:46:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f8sm2935770wmb.37.2019.10.25.12.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 12:46:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6A21D1FF9B;
 Fri, 25 Oct 2019 20:37:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v3 11/15] travis.yml: cache the clang sanitizer build
Date: Fri, 25 Oct 2019 20:37:05 +0100
Message-Id: <20191025193709.28783-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025193709.28783-1-alex.bennee@linaro.org>
References: <20191025193709.28783-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hopefully we'll see the same benefits as the other builds.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

diff --git a/.travis.yml b/.travis.yml
index da6a2063fca..c43597f1331 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -189,6 +189,7 @@ matrix:
 
     - env:
         - CONFIG="--target-list=${MAIN_SOFTMMU_TARGETS} "
+        - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-sanitize"
       compiler: clang
       before_script:
         - ./configure ${CONFIG} --extra-cflags="-fsanitize=undefined -Werror" || { cat config.log && exit 1; }
-- 
2.20.1


