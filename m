Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2537B2B43C6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:32:44 +0100 (CET)
Received: from localhost ([::1]:44970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedgZ-00025q-7i
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:32:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYo-0001wD-M5
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:42 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYm-0003CH-LP
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:42 -0500
Received: by mail-wr1-x42b.google.com with SMTP id k2so18519840wrx.2
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B18e+BpFDaCqmpOB60TiGLIYa4fVaamK8mnIgG8BoPM=;
 b=UJKMFjbMkrTGlQQ91HviaPQUqV+pml8l7ZJulRi/4OjlL1Mi4R2y98n9G3QgMiPyo4
 A258JSnUuLOXR9z4LGqVGxpEZmDvzWW/1spkXJYh+hZbg2Iw1C+Ghw+g/Z3TT17DHy2v
 x6J2nw11VyqPx46fCnBlab1stW4LCJseNmfKB5r8dUKRurVuznU1nNDFanQEj2iXyQDh
 XNv5qmGhSCq30OJGW+yFy8VYZ4ThZqGzX9WNUIPH3o9Ru+OZgtDefU95Bvb1F5ZH66B6
 ocGDxX5x24B+b1WPoB4VPDzbAZ2bc655AxaNTiFbHxzslqur7nrD/J/kzMOvsh7Nwlt4
 R8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B18e+BpFDaCqmpOB60TiGLIYa4fVaamK8mnIgG8BoPM=;
 b=cVn/2BHLtD4YiQ1SadypS8+ty1F+HVFS4R6o53c/Dwf9kMTcCl/6Z5CKmLwzTXWveW
 643LFjz/6lLdRLtSS4XnjA1n+tsx34r2vqorfRE7Lith73fFQX8IO1M7d+9EbPLdJefb
 Jq0+b9qCGKtmohztAf0oNPzc9e6sXo3iFySOkFYx19usZkf7d1djMVTk0i1dOdH7RhYX
 0t0FYtaf40v++ooBXdX7NAEHaMWpzC/XabiPdln0104hcISBXG3PKwR3iHvfzlhJa57C
 Oenu7jjRv3tleCszLX/Z5d8r4+Gkul4ybdBAKMvKdQlHb9Yd3E3kaOrXl2+zkpKHo4oe
 fVAA==
X-Gm-Message-State: AOAM531MiB6YTx95vdkm20msT25lpZFsk9guvjpkI9W2kqaKmCUGbvtJ
 NnHqEn+uXw2oFwXMLPCp5WcZzg==
X-Google-Smtp-Source: ABdhPJzpevC7AmiT4rtExbt9gGp2z3nzNd+hJVRlxla5ILVpLJ/IXt34NAIA2XpahW/CVSJcApiIjw==
X-Received: by 2002:a5d:46c6:: with SMTP id g6mr20048789wrs.170.1605529479146; 
 Mon, 16 Nov 2020 04:24:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u7sm553018wmb.20.2020.11.16.04.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:24:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9D6441FF98;
 Mon, 16 Nov 2020 12:24:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 9/9] .gitlab-ci.d/check-patch: tweak output for CI logs
Date: Mon, 16 Nov 2020 12:24:17 +0000
Message-Id: <20201116122417.28346-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116122417.28346-1-alex.bennee@linaro.org>
References: <20201116122417.28346-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need running commentary for the CI logs and by keeping it
short we might just see the problem on the first page. While we are at
it flush the previous line so order is maintained between script and
sub process.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20201113174404.19608-1-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/check-patch.py b/.gitlab-ci.d/check-patch.py
index 0ff30ee077..39e2b403c9 100755
--- a/.gitlab-ci.d/check-patch.py
+++ b/.gitlab-ci.d/check-patch.py
@@ -45,9 +45,9 @@ if log == "":
 
 errors = False
 
-print("\nChecking all commits since %s...\n" % ancestor)
+print("\nChecking all commits since %s...\n" % ancestor, flush=True)
 
-ret = subprocess.run(["scripts/checkpatch.pl", ancestor + "..."])
+ret = subprocess.run(["scripts/checkpatch.pl", "--terse", ancestor + "..."])
 
 if ret.returncode != 0:
     print("    ❌ FAIL one or more commits failed scripts/checkpatch.pl")
-- 
2.20.1


