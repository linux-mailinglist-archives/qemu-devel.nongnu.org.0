Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F473DEB81
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 13:04:08 +0200 (CEST)
Received: from localhost ([::1]:55788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAsDO-0007VP-H4
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 07:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAsC4-0005eZ-Qk
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:02:44 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAsC3-0003fw-9x
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:02:44 -0400
Received: by mail-wr1-x432.google.com with SMTP id b11so19527971wrx.6
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 04:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZOnyiACEMsiPUwmm/qUkHA1mDhN36kHA6oD+2+/bm8Y=;
 b=toBrj59kGf9w37oAIVaHR1N0N924d3A0BpwPJ9dnrq1v5DA8lMIxmtBBd7tJdBGciP
 wpX9+5CnaZw6ZEA8tcJjQXMPjtTS2XSWZowsKB4saS19AWcDYLztvDvlEVP+Po8BJ8cj
 JYXAugJoBaEhLaXpaj9COjtYF9LLsz0FZt7Q/bfoxfop1y436YgK8VO1iD/FATJ82Lzl
 pbZiLUwqA/BjYYj376eglxm11NFYdlS5076V1aKk5ZeWgNl+VqRP6b1DokPZfBGWL6no
 fIsMJK3g2/EymqVvAapVRtKKNWOMMNbMujCPi74SZbFxSktkQ5Fm15dsWqX4AbgvAESs
 LZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZOnyiACEMsiPUwmm/qUkHA1mDhN36kHA6oD+2+/bm8Y=;
 b=TUQ1pn0GFTaGNByPk6NSQnonqq33iJXtbxk6yG7uSOAhUyKo17ARjybVUxKJ7aB1kX
 dqcskX4rJj6Vjwx3T39vULdMLu6Pn2y+dxI2hbb9jq2PJdB7Uh5cz4awKDJVrj8XguaT
 DZaLrroLyvxOu5TOzGnj6RtBc8fPzBeOMA4YVkXCeqom5nw7HA6yZM5B7j66RnCMPoKu
 MABn+cMetT626m0j6Suw3QaVnFtbODPTX3xKx/1jpiud2uu6NT086ED8IaevneLxbupq
 u9RMUXbEy8oc9ESJwSAhSUy9zY4nXSarrOBsXcHANPq2EEtmIF/1OnWBOERrREA3hXJj
 gAVw==
X-Gm-Message-State: AOAM531aifHCf8BQmriscy/h9NARDgPQ2Iy3+6Zcph0gQ1vqfks3+2xq
 w93+H0gvWBsASM9ASZVTrtjOsw==
X-Google-Smtp-Source: ABdhPJxqWfAibh2tawPbOhoKoTUWmVk8WM7al5K6vQeY5cYK5uWgackESfI/616feJQfY4ziH1v+nA==
X-Received: by 2002:adf:e10c:: with SMTP id t12mr22116068wrz.36.1627988559678; 
 Tue, 03 Aug 2021 04:02:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o17sm14481441wru.11.2021.08.03.04.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 04:02:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E87131FF98;
 Tue,  3 Aug 2021 12:02:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/3] configure: don't override the selected host test
 compiler if defined
Date: Tue,  3 Aug 2021 12:02:35 +0100
Message-Id: <20210803110237.1051032-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210803110237.1051032-1-alex.bennee@linaro.org>
References: <20210803110237.1051032-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, imp@bsdimp.com,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are not many cases you would want to do this but one is if you
want to use a test friendly compiler like gcc instead of a system
compiler like clang. Either way we should honour the users choice if
they have made it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Warner Losh <imp@bsdimp.com>
---
 configure | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 9a79a004d7..eadc434144 100755
--- a/configure
+++ b/configure
@@ -1691,8 +1691,11 @@ case "$cpu" in
     # No special flags required for other host CPUs
 esac
 
-eval "cross_cc_${cpu}=\$cc"
-cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
+if eval test -z "\${cross_cc_$cpu}"; then
+    eval "cross_cc_${cpu}=\$cc"
+    cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
+fi
+
 QEMU_CFLAGS="$CPU_CFLAGS $QEMU_CFLAGS"
 
 # For user-mode emulation the host arch has to be one we explicitly
-- 
2.30.2


