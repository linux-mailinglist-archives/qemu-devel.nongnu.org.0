Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDC73B401E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:16:21 +0200 (CEST)
Received: from localhost ([::1]:58000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhwi-0003Hq-Sy
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwhuW-0000XL-Pk
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:14:04 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwhuU-0002ve-D3
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:14:04 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 p8-20020a7bcc880000b02901dbb595a9f1so5368829wma.2
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ES6aP9eLrpmL5vbwI6z5QtaMohdgOgmYVT83oPzFr5I=;
 b=eu/zuwf0ekSIQp2bhEhSbXJ8X/i4kVpqCeosR8+Sqoqqv5Wq14oyofBTddXxbIpAkx
 jy0hc5+E1bI1Op4bJKLwsl4mNE2aEfvbHY5zvRo8hxeFZv5NnDRKKIrkUbZp/MeaHN+m
 964cjzjEJ8CNsJB32NJril2tUYgygHgA+nVD6RjzorS3I9QOirorxYMgPXrVf8wLn18m
 ADww6By00n0OXnVW0i0DSrHbCAIYOSAnkj/x25Tinnd3Cx/ItAsy3C2rWeVPMDQ1+l32
 a0Tahl6ObSUSFibodrjt2Phi4H8cFHJjXrD2vcSrpianwBNAihSj3es92HEUdBWYO+RF
 0bwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ES6aP9eLrpmL5vbwI6z5QtaMohdgOgmYVT83oPzFr5I=;
 b=QcarUcQZuTZDOBoSaxedbQZLRRvcWcAQ6iD+9G3U23y4Xj/VvEbQcEKyHoMKVuL1pA
 IxGcyZAVHqQmAppA3f6ONVCQMsdlnMRKxDQ4LQ7F8RlieyiDPWUe70xTmHpsxVJcCKXo
 /XKa30nzxdbJv3OHJyqA1lKycZEfgXat3yGQvucgicrzq0BrYpR5xe+tm2DSWu3wUKOt
 t4S5aALZ+Cg9p8LoCANvrhcSIji9PaKFfRdmPLjJ7XMyxQUREFgbp+azxW42YU4Rf647
 308g9Ag4CdwoLIMOV5MqPZLgziTXJzY6Q6RdZQBuaTavQjrPu4W4Rmq7EPd9p7YmvV68
 pnuA==
X-Gm-Message-State: AOAM532y10h4bzqueFsSQrEk0ADUNILV45YlzoNHH5vUMMcAmzjXcc06
 NFs/jLFdaybluuW0GDwkMECdwA==
X-Google-Smtp-Source: ABdhPJykHaloikqAMK4iXTtBjqx3fDtRNiKQdWm5heIc8SSQKoHHlsnolqk4fVGDXWrNrel0PDQ3Bw==
X-Received: by 2002:a7b:c8d8:: with SMTP id f24mr9663361wml.31.1624612440801; 
 Fri, 25 Jun 2021 02:14:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m184sm5066849wmm.26.2021.06.25.02.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:13:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A91361FF8F;
 Fri, 25 Jun 2021 10:13:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 3/7] scripts/checkpatch: roll diff tweaking into checkpatch
 itself
Date: Fri, 25 Jun 2021 10:13:51 +0100
Message-Id: <20210625091355.25673-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210625091355.25673-1-alex.bennee@linaro.org>
References: <20210625091355.25673-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than relying on external tweaks lets just do it inside
checkpatch's direct commitish handling which is QEMU specific code
anyway.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210623102749.25686-4-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index 7e685c6a65..c5fa4fce26 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -4,9 +4,6 @@ check-patch:
   needs:
     job: amd64-centos8-container
   script:
-    - git config --local diff.renamelimit 0
-    - git config --local diff.renames True
-    - git config --local diff.algorithm histogram
     - .gitlab-ci.d/check-patch.py
   variables:
     GIT_DEPTH: 1000
diff --git a/.patchew.yml b/.patchew.yml
index 2638b7f564..1b78262ce5 100644
--- a/.patchew.yml
+++ b/.patchew.yml
@@ -138,9 +138,6 @@ testing:
       script: |
         #!/bin/bash
         git rev-parse base > /dev/null || exit 0
-        git config --local diff.renamelimit 0
-        git config --local diff.renames True
-        git config --local diff.algorithm histogram
         ./scripts/checkpatch.pl --mailback base..
     docker-mingw@fedora:
       enabled: true
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index bbcd25ae05..cb8eff233e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -399,7 +399,12 @@ if ($chk_branch) {
 	my $num_patches = @patches;
 	for my $hash (@patches) {
 		my $FILE;
-		open($FILE, '-|', "git", "show", "--patch-with-stat", $hash) ||
+		open($FILE, '-|', "git",
+                     "-c", "diff.renamelimit=0",
+                     "-c", "diff.renames=True",
+                     "-c", "diff.algorithm=histogram",
+                     "show",
+                     "--patch-with-stat", $hash) ||
 			die "$P: git show $hash - $!\n";
 		while (<$FILE>) {
 			chomp;
-- 
2.20.1


