Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFA72B7F12
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 15:09:00 +0100 (CET)
Received: from localhost ([::1]:41882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfO8p-00065F-Hr
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 09:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kfO7l-0005EV-It
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:07:53 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kfO7j-0007uj-2X
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:07:53 -0500
Received: by mail-wm1-x341.google.com with SMTP id a65so2850790wme.1
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 06:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P893C0RtMJlLc7UgmhuOR3HNdWOQpwqhCwhuOv9aJqU=;
 b=Uo1MFl6DeFxGG6Mfj6X3UUougzYx0mD/qdNnMh2pXH6VQ/GWxsT4XV5d/ZG33Lyq/O
 JH40196QmKjFJZv6eAhGDk8/KNu9+/phUHQWNJjT4VO6K95N0akdtXHFoAXU3YMIQzwY
 QB0Ak+bnIOSXjjTehn1btR1Vii3hpFsxZhqDd8L3kMxQjLJ8Tbe7TYb6cp+G7jmfwYyl
 cSMlnRH9C3ukDQ2MwBEw21+W5Y3/bqF8PcnXIvj+7pNnMl3YYsqoNSskrP86YqHcZU6f
 fegWERzZ0AWFIcoyUO+pMf+cc/uq0mjXRcxzMxQrSXJxpuBaCZRQMHpg8EtyFQDYcnlC
 efKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P893C0RtMJlLc7UgmhuOR3HNdWOQpwqhCwhuOv9aJqU=;
 b=Xst5xTDVPGdN73vEnPAUwrDGlXfjVaviIMJJp8bIPdQZq8ADS90jAn2sAlWGEU7ViY
 VkyyQN3C6uKKLfrkdbIen5WJB6aDweK5tVVJX/vLFD4eB2c/pDU/eTCurkoOerE7RyjY
 9cR+X5FgvLr4ivvqm+u4ewyYdGaS/IRg+tiPgTgB/SoA7bvwdqEjv1x2La/TS6f3BvMN
 R/sToYntYogIHKFXTDMydH4lczWimrV15YrSAjd7n1YHjZzD8y7mWp+7r2xbJZJGNGr0
 IE3lkpS89Nt0aC8BlP+cu8DnCFzaM3wQAh7+GsLmyKtVYGj+DEmd6BdKJ/mLqOoyMW3v
 gvnw==
X-Gm-Message-State: AOAM531Wo0VJidtRNMUGtSuozHUZxCOH3foq51+OKZTWG2OeqBdKh8A8
 fpKU0BzP/k/iOS0tHplvipW5Hw==
X-Google-Smtp-Source: ABdhPJxxLBcbaApEvviJwcxDf3JBWeldRu2a/4tYmm+LP6sQXbmsBd7EV0JkVBwOZFP1ex3y1R6yVg==
X-Received: by 2002:a1c:df8a:: with SMTP id w132mr231417wmg.90.1605708468817; 
 Wed, 18 Nov 2020 06:07:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t13sm34652506wru.67.2020.11.18.06.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 06:07:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1EA6A1FF7E;
 Wed, 18 Nov 2020 14:07:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] .cirrus.yml: bump timeout period for MacOS builds
Date: Wed, 18 Nov 2020 14:07:39 +0000
Message-Id: <20201118140739.18377-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
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
Cc: pbonzini@redhat.com, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These seem to trigger timeouts with some regularity.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .cirrus.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index f0209b7a3e..08db7c419f 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -18,6 +18,7 @@ freebsd_12_task:
     - gmake -j$(sysctl -n hw.ncpu) check V=1
 
 macos_task:
+  timeout_in: 90m
   osx_instance:
     image: catalina-base
   install_script:
@@ -32,6 +33,7 @@ macos_task:
     - gmake check V=1
 
 macos_xcode_task:
+  timeout_in: 90m
   osx_instance:
     # this is an alias for the latest Xcode
     image: catalina-xcode
-- 
2.20.1


