Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1113B4022
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:18:28 +0200 (CEST)
Received: from localhost ([::1]:37124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhyl-0008Gj-GW
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwhuZ-0000dD-10
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:14:07 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwhuX-0002y7-3o
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:14:06 -0400
Received: by mail-wr1-x429.google.com with SMTP id l12so9069313wrt.3
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jonKQhmSMkqSTTFdINa7PAmkJCWi21KE+KwnNcX2cII=;
 b=VBGrW80ZB14hYV0PNdCNK0DBSaw3UmYBMpYrRVC9tp10WXl3GX21DdWMIyhYKihltB
 AyP/EL1EErEkrOqzcj7h19wYWaI2giAyoLBfvumPt6uLZuioFdUvfcCgLGD2dKiGhn+q
 mJmG/uoyDtP6XZt+ZlYJ0oyBrhzkua6QtKa6naj+KpQc1SwyRt5Y3l6wIwYuKNDL3ziV
 c6TuX7HGirsI9Xngd9F1QshYIuqPa9JtKFj+zuwRBfXezxZnc+DSNBezb9Fog9ak0iP2
 FuK6rRJkITLWR+lFp/FrEupllrGN/b1JeKR65Vvl1qU3lHcGrsS/S6D4lhgE+hgdRTfv
 XzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jonKQhmSMkqSTTFdINa7PAmkJCWi21KE+KwnNcX2cII=;
 b=WXnjJUk80ULn0/B5F3+FAYyhkcbVaCSM+lt1ttq1GpwijZsLagbrHRZOaVydCFJTbL
 JFqva64Rv6H8MADc/DgVbBeBCLXndqNhP0GP9BCAOwLvptErqiUperwrA8FXHaMhRm9Y
 gK6mOWMdpaxZcgAGVmDDCsNnuGC6iNUVONwaQn8zhHTcAB3cc7xLzaTabnZf9SCV+3rh
 KeYEOxzYsaxNR7WiVqkeISYHMpj0UKrPP7MArPMKYw9E/L0AWgbTMLVm0EeF5loVaiCY
 vPP4YFriiKMSkbyrdaw6SS791dz7wjEXuM3irwBxKRSz0Y25awejMthL8xaGyolI+4u6
 ogdA==
X-Gm-Message-State: AOAM530v1VFJaLwXsLyRUikrEM8O7M5vihgEFWQuk15Iy7qd91HbPi/W
 cjkoteXOAbt1nkECJlgaXPKWnA==
X-Google-Smtp-Source: ABdhPJzfUOTSiEIO8vmFi289F1KdmftdU94AJf8184tkNe2WwMPwGQvEjcXrzPOyooX5EtcAKy8b1w==
X-Received: by 2002:adf:fac4:: with SMTP id a4mr9983643wrs.189.1624612443830; 
 Fri, 25 Jun 2021 02:14:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j17sm6624489wrx.0.2021.06.25.02.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:14:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D5A571FF91;
 Fri, 25 Jun 2021 10:13:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 5/7] GitLab: Add "Feature Request" issue template.
Date: Fri, 25 Jun 2021 10:13:53 +0100
Message-Id: <20210625091355.25673-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210625091355.25673-1-alex.bennee@linaro.org>
References: <20210625091355.25673-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Based on Peter Krempa's libvirt template, feature.md.

Signed-off-by: John Snow <jsnow@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
CC: Peter Krempa <pkrempa@redhat.com>
Message-Id: <20210607153155.1760158-3-jsnow@redhat.com>
Message-Id: <20210623102749.25686-6-alex.bennee@linaro.org>

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


