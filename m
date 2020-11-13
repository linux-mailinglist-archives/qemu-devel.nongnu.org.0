Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44822B22CF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 18:45:53 +0100 (CET)
Received: from localhost ([::1]:53376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdd8w-0007M2-L5
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 12:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdd7V-0006sf-Ja
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 12:44:21 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdd7U-0004YO-0t
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 12:44:21 -0500
Received: by mail-wr1-x436.google.com with SMTP id d12so10790738wrr.13
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 09:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t2D1wshxWIICGnGJhuIqTqgBAWd0CjtW2FCqhoV6P1w=;
 b=ho1ydvfWLDVHaKxxqAezH1Rv+8ACOHqs/ayUd//WlxM1LPSBwiRGFEOHJOA+0Q6G66
 iF6r6ZENod5ZZFemyorlGrBHj7Qk/yqKjyM0Ukk5be20k9AhHDWExhmkFpbVEG6DzEhf
 VPsnR4Vq5v2D42TDNiMLBLbZcK+6nLHEQGxQjtYSc5xfCjQH0t2PZDhjbylWzkKyuFXj
 iWpsfCTPRwHpCArZHOJ/oFTbuRphz9slg2VpZ05UcLXW0SuI/XlBDs++9YfbvDn61+k8
 30ZsNNfCpF0XyXoXNfhW655sSq+ox6HfdC35IoEgK/taWyeScSRbB7USlsa9I3HBarAU
 0Wew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t2D1wshxWIICGnGJhuIqTqgBAWd0CjtW2FCqhoV6P1w=;
 b=WijEoMRF5tjqt6vsSmT6aYawUTxT4OBxs8fjHLtPHKk/nnayCixHGfVrwI3xLAXV9C
 eSCMnrzMhe9KwxEtyaloY9U414GgZv8r7NMebgDIv/pGpnTWauliDl0Tw40yb0NydURI
 U2ZU/PJfg51zoNAa3/vMk0h9PAu+hKx3QiwuGSnrsFyRqCrSVqgAphZyGc3G2OCnl7+p
 vc9V7KxZFG6XZHmP/mrUNPb9w3PQbX0FUpHwIihGBRrz0W/212mTf9jYtt9PK7RzJYE3
 AmixgBcoDoLuFgqSj1xppd8h+eB8arfG14smRPCL6KiBjzjr4v6mT5HO2oCOxemYiflB
 cl3w==
X-Gm-Message-State: AOAM531KVkAe5Ah+5D+un92htwnPx6m50nj9j6TIWICj4XH9UI37YV2b
 hutc66p52shKL+tGCuk6Boy0wg==
X-Google-Smtp-Source: ABdhPJzIP7jCc7UOWAaYKSuRP1rJBzXLsIAGc7GNavY92fINql8exG8QAxzOYa/mvWf06EVAfseM+A==
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr5125613wrm.81.1605289453512;
 Fri, 13 Nov 2020 09:44:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s188sm11118600wmf.45.2020.11.13.09.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 09:44:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C1EC91FF7E;
 Fri, 13 Nov 2020 17:44:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] .gitlab-ci.d/check-patch: tweak output for CI logs
Date: Fri, 13 Nov 2020 17:44:04 +0000
Message-Id: <20201113174404.19608-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need running commentary for the CI logs and by keeping it
short we might just see the problem on the first page. While we are at
it flush the previous line so order is maintained between script and
sub process.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/check-patch.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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


