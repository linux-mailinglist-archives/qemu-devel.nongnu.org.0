Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8857F3B182C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 12:37:17 +0200 (CEST)
Received: from localhost ([::1]:59782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw0Fw-0007Qi-JG
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 06:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw0Dz-0004xH-1O
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:35:15 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw0Dw-0005wX-Ux
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:35:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id e22so2081524wrc.1
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 03:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z6mqxYtsl7lpcW7rht6AD8AivX4ujauO/piq+96DP6k=;
 b=vjVXziva3HBtIhgklp8yeoT7NGywFwcJIOOIrWHuaxlKucnW+4svycznmZfhJi2oSL
 fNyKuLlSBupWKpE9v8YJYfhlpS6z9B2VUlq1IAwOfAq1/h+Ya5MUkShvs8i/zhgsNXIA
 OEF4kWYMKe8kBKc6prRsLhEQl9Eoh9nDyF+DFl2qa47BiLEkKyS4/h1WyRnUc3LmvIZG
 i5VMx1bP4ntAd7BRlHe9ltHz1TsChjaZDQ9ZIsuoeXHWuiWcU4zP4qzpoDTW1eW5eKp+
 fCdQSUT88RV9yw/vyrukmw+LQizrorcjf9CXO1NtWww4Mj35PUOwvdSFTOeYziH+VnP8
 1F6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z6mqxYtsl7lpcW7rht6AD8AivX4ujauO/piq+96DP6k=;
 b=Z3OzTgQmbn1rr18FAqjVJ7OsGBgfbIwgaicfiVxaooRC6fMeisN3BI8bDbzd+yK+ja
 ZS/N/P9+9gCcNAgEfDMrdeEhneNrciExxCfRZ4CbRfRLhGkNqo/hNBwnKzFlksdNiIPo
 m+lTyJvm84fOG14FaRNOLf45fmcx6QARM6PcZlANfJVS4iJCYxAuHw28CDk5GzgsFHb3
 +/F38kWWzSm0VMdrsCC2jqPrGBlZjBGudV/ZEbOZU6HuXbkjrMbpaOhBh6ruLj8qKqF/
 mYwtAkZJRMChrWCN3kYGlAgRHMG1HEW2QduQ3h/kGrHRr8brofGEPaabK8KfggbKiaQw
 241g==
X-Gm-Message-State: AOAM530KnVwYPGNxv0enWq55o+9ibQgQHTJYc2XmCoMAn0xF1EJuNOWI
 kq/bmtgz3np3RP0sggMDKzqc5w==
X-Google-Smtp-Source: ABdhPJznAxNcqBnQfeZc+px8Bi2q/s5cN/v397H9gJdpqZa80hE2prCWxqvrdbeK3AAffIEqWqs93Q==
X-Received: by 2002:adf:9bd0:: with SMTP id e16mr10547061wrc.392.1624444511266; 
 Wed, 23 Jun 2021 03:35:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r3sm5068135wmq.8.2021.06.23.03.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 03:35:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D9BF1FF96;
 Wed, 23 Jun 2021 11:27:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 8/8] Update documentation to refer to new location for
 issues
Date: Wed, 23 Jun 2021 11:27:49 +0100
Message-Id: <20210623102749.25686-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623102749.25686-1-alex.bennee@linaro.org>
References: <20210623102749.25686-1-alex.bennee@linaro.org>
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210619154253.553446-1-sw@weilnetz.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 README.rst           | 6 +++---
 .github/lockdown.yml | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/README.rst b/README.rst
index a92c7394b7..79b19f1481 100644
--- a/README.rst
+++ b/README.rst
@@ -131,16 +131,16 @@ will be tagged as my-feature-v2.
 Bug reporting
 =============
 
-The QEMU project uses Launchpad as its primary upstream bug tracker. Bugs
+The QEMU project uses GitLab issues to track bugs. Bugs
 found when running code built from QEMU git or upstream released sources
 should be reported via:
 
-* `<https://bugs.launchpad.net/qemu/>`_
+* `<https://gitlab.com/qemu-project/qemu/-/issues>`_
 
 If using QEMU via an operating system vendor pre-built binary package, it
 is preferable to report bugs to the vendor's own bug tracker first. If
 the bug is also known to affect latest upstream code, it can also be
-reported via launchpad.
+reported via GitLab.
 
 For additional information on bug reporting consult:
 
diff --git a/.github/lockdown.yml b/.github/lockdown.yml
index 07fc2f31ee..d3546bd2bc 100644
--- a/.github/lockdown.yml
+++ b/.github/lockdown.yml
@@ -14,11 +14,11 @@ issues:
     at https://gitlab.com/qemu-project/qemu.git.
     The project does not process issues filed on GitHub.
 
-    The project issues are tracked on Launchpad:
-    https://bugs.launchpad.net/qemu
+    The project issues are tracked on GitLab:
+    https://gitlab.com/qemu-project/qemu/-/issues
 
     QEMU welcomes bug report contributions. You can file new ones on:
-    https://bugs.launchpad.net/qemu/+filebug
+    https://gitlab.com/qemu-project/qemu/-/issues/new
 
 pulls:
   comment: |
-- 
2.20.1


