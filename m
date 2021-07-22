Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAB13D2CAC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 21:22:18 +0200 (CEST)
Received: from localhost ([::1]:41002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6eGu-0000V7-76
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 15:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6eFL-0007O7-4V
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 15:20:39 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6eF6-0001h0-3G
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 15:20:38 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i94so7060858wri.4
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 12:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G6S6ou4sqqp6H37h25Ms5wSVAcjyOB9MeMNs1slctvk=;
 b=fNAtk/7qr2lXcddIWEkZqvKikeAwGqIWT3UE5yJ2ev4CesAcgXQaa6xV01Hs70K5KN
 YsU5vCQcuHhQGT3I8EcZAVUZ9JK/f3HLXjgS1Im3C+MJkk+TTjMpLzkJI3Sy5hwG45rZ
 GGqLmKJB5i57IMP98xozCr6C4FY+9ZCCYT7kDOLqIy1F0eSCB0TW0jXLjj/SikJkemIr
 AYiSSU0cohk1UXigB4HfDPkSq1PbRuiitD38ipYnehXWEJL53F//omN1EQ4YSu9UJ60Q
 6p4Crn3xqT/STVACuDlxDrCP9T/nmnXcrW47PZVCym3CJjAOUAitiRBznLDm9OL2VZvb
 n31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G6S6ou4sqqp6H37h25Ms5wSVAcjyOB9MeMNs1slctvk=;
 b=hq3Q7Njvg2V6kJgoRk12KhZ6kfiSZm8U0i8F5Laa80YBMzt5nrQAIvlTvef/HybrTu
 BHZNX7TZ5J2PRkHEgYdV1C+AVYFdpBOY4Bw1rGYwxgZpiX7Q/U556tZLfD+1puyYi+gI
 V/nOwJAx/zpPe6+adWH+w7dSzzlLJonXQqX1PFfwBa5ZSXCC+o3y2SUdc1z81pA8lIvR
 ggDOC2VLqGug1vDMFVp2q6+/OtfotpmuAY3zmYjZWSyiu56dKl9SKnR4IdDcvDd1xwdo
 teb5aIAIbwr/WA+dU5mqrJFS9aHKQZMbEBCVObcQEwsO+S7wF0UNaxJEKn4YTGFgb3SJ
 zyHA==
X-Gm-Message-State: AOAM5316YRJE+M9RNbcibj/J3KrVxUiGhgf3KM1iAByFC2W4/ESN9C7C
 Cl9bBOrEp+MUSmeQ6ED/O6nrdKpvnRl+iQ==
X-Google-Smtp-Source: ABdhPJxcCED97gp1fpNO8DbPxWC4ujJ4LtBbQzAChHn1fsvp/a2AyiFijanCMDqKd4zo2maHX/XL0g==
X-Received: by 2002:adf:e689:: with SMTP id r9mr1461639wrm.416.1626981620440; 
 Thu, 22 Jul 2021 12:20:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z25sm26201612wmf.9.2021.07.22.12.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 12:20:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 2/2] docs: Move licence/copyright from HTML output to
 rST comments
Date: Thu, 22 Jul 2021 20:20:16 +0100
Message-Id: <20210722192016.24915-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210722192016.24915-1-peter.maydell@linaro.org>
References: <20210722192016.24915-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our built HTML documentation now has a standard footer which
gives the license for QEMU (and its documentation as a whole).
In almost all pages, we either don't bother to state the
copyright/license for the individual rST sources, or we put
it in an rST comment. There are just three pages which render
copyright or license information into the user-visible HTML.

Quoting a specific (different) license for an individual HTML
page within the manual is confusing. Downgrade the license
and copyright info to a comment within the rST source, bringing
these pages in line with the rest of our documents.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/interop/vhost-user-gpu.rst |  7 ++++---
 docs/interop/vhost-user.rst     | 12 +++++++-----
 docs/system/generic-loader.rst  |  4 ++--
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/docs/interop/vhost-user-gpu.rst b/docs/interop/vhost-user-gpu.rst
index 3268bf405ce..71a2c52b313 100644
--- a/docs/interop/vhost-user-gpu.rst
+++ b/docs/interop/vhost-user-gpu.rst
@@ -2,9 +2,10 @@
 Vhost-user-gpu Protocol
 =======================
 
-:Licence: This work is licensed under the terms of the GNU GPL,
-          version 2 or later. See the COPYING file in the top-level
-          directory.
+..
+  Licence: This work is licensed under the terms of the GNU GPL,
+           version 2 or later. See the COPYING file in the top-level
+           directory.
 
 .. contents:: Table of Contents
 
diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index d6085f70452..d63f8d3f93a 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -1,11 +1,13 @@
 ===================
 Vhost-user Protocol
 ===================
-:Copyright: 2014 Virtual Open Systems Sarl.
-:Copyright: 2019 Intel Corporation
-:Licence: This work is licensed under the terms of the GNU GPL,
-          version 2 or later. See the COPYING file in the top-level
-          directory.
+
+..
+  Copyright 2014 Virtual Open Systems Sarl.
+  Copyright 2019 Intel Corporation
+  Licence: This work is licensed under the terms of the GNU GPL,
+           version 2 or later. See the COPYING file in the top-level
+           directory.
 
 .. contents:: Table of Contents
 
diff --git a/docs/system/generic-loader.rst b/docs/system/generic-loader.rst
index 531ddbc8e34..4f9fb005f1d 100644
--- a/docs/system/generic-loader.rst
+++ b/docs/system/generic-loader.rst
@@ -1,8 +1,8 @@
 ..
    Copyright (c) 2016, Xilinx Inc.
 
-This work is licensed under the terms of the GNU GPL, version 2 or later.  See
-the COPYING file in the top-level directory.
+   This work is licensed under the terms of the GNU GPL, version 2 or later.  See
+   the COPYING file in the top-level directory.
 
 Generic Loader
 --------------
-- 
2.20.1


