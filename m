Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7585E3B1825
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 12:33:38 +0200 (CEST)
Received: from localhost ([::1]:52922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw0CP-0002l3-IC
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 06:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw079-0001NU-Ff
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:28:11 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw076-0001da-FF
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:28:11 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 t11-20020a1cc30b0000b02901cec841b6a0so2991437wmf.0
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 03:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F/YqoPHEqBNHEz0s3p1tUO0xl0oRU3oGWhZgHMrBzTw=;
 b=aMAZyoX3nzpTh2s2SCs9NF/uWoKuhHV6WqhQyavcPksEBOxLkDz6M3uBy7iZMQnnP0
 K31zMGeEb8Ap3ZEht1Gegtt3F+ppHwjjq3pJUVbunzGVbMS4VnFzngYDuQ0EzxlA3dP9
 lQUitQy67phsKzYNqAYaxAFTpVsdZdJk/kQM0rYCVU91kaGPSD+MnVidiBJEFdpUgp+s
 MxrAuk4pqMyYynrc6cQ/iBACu7hd3Y4h1Z7vfc+hHaDFGGy5fW8OXOQwZ3u3T9ZZ/cKG
 I93voxMES5LjJB7QaFd0iJxgskSdsUvjC23VVXSBXF4f8l86OPoGoipZmKTgd7UpZ7a/
 zLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F/YqoPHEqBNHEz0s3p1tUO0xl0oRU3oGWhZgHMrBzTw=;
 b=rhdKRHLWeWHDx0xQBm/NEMUFVA1OoirRgGm58/0Nhl18tM+1GA22vrzh22bzFNboWq
 fhH2bg9N33ZVXCGt9Rcg3Ql0Um/3DlxX5+0RnznNMf/Wu8dD0iO+NiSS03pB2ueDwSFF
 EpxieO+yN/svMNrp0OYvdRuHRHSy9LeXIkB6JBYk4O9jzxIYwBD8e+5Qz761/RPa+ukw
 6pGuJ6t4//LPICuU1njGlKr6mKUe7moWi1yScqR0yLNfa3M8kP+yOwHLNfAAo3M1+XOt
 uQ/UdGSV13jQX4k9X/2yBJMBa07ZaZvlpRf/6zt9MkFnTAEWl0hk9yWScShmddCxyP4H
 e4Mg==
X-Gm-Message-State: AOAM532AJugVBmcD8tAq8j5xDrt1El5t62BppBuiXsBPVwgi1ZRBSRw8
 Zljluhf9BUmJtbXo+b0KkChvkw==
X-Google-Smtp-Source: ABdhPJx+Ndt6pTFcuf0ZNQx4lRAysHJ8jI8FYHDFDIAPcogVq8GryA8P5HMmf0Joi5BOHoU0G4iORw==
X-Received: by 2002:a1c:25c6:: with SMTP id l189mr10295970wml.49.1624444083154; 
 Wed, 23 Jun 2021 03:28:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm5507874wmj.8.2021.06.23.03.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 03:27:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 28CE01FF91;
 Wed, 23 Jun 2021 11:27:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 5/8] GitLab: Add "Feature Request" issue template.
Date: Wed, 23 Jun 2021 11:27:46 +0100
Message-Id: <20210623102749.25686-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623102749.25686-1-alex.bennee@linaro.org>
References: <20210623102749.25686-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
 Thomas Huth <thuth@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Based on Peter Krempa's libvirt template, feature.md.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
CC: Peter Krempa <pkrempa@redhat.com>
Message-Id: <20210607153155.1760158-3-jsnow@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab/issue_templates/feature_request.md | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 .gitlab/issue_templates/feature_request.md

diff --git a/.gitlab/issue_templates/feature_request.md b/.gitlab/issue_templates/feature_request.md
new file mode 100644
index 0000000000..7de02dcc2c
--- /dev/null
+++ b/.gitlab/issue_templates/feature_request.md
@@ -0,0 +1,32 @@
+<!--
+This is the upstream QEMU issue tracker.
+
+Please note that QEMU, like most open source projects, relies on
+contributors who have motivation, skills and available time to work on
+implementing particular features.
+
+Feature requests can be helpful for determining demand and interest, but
+they are not a guarantee that a contributor will volunteer to implement
+it. We welcome and encourage even draft patches to implement a feature
+be sent to the mailing list where it can be discussed and developed
+further by the community.
+
+Thank you for your interest in helping us to make QEMU better!
+-->
+
+## Goal
+<!-- Describe the final result you want to achieve. Avoid design specifics. -->
+
+
+## Technical details
+<!-- Describe technical details, design specifics, suggestions, versions, etc. -->
+
+
+## Additional information
+<!-- Patch or branch references, any other useful information -->
+
+<!--
+The line below ensures that proper tags are added to the issue.
+Please do not remove it.
+-->
+/label ~"kind::Feature Request"
-- 
2.20.1


