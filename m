Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F0E3C262C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:45:34 +0200 (CEST)
Received: from localhost ([::1]:50852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rkx-0004Z3-PL
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdK-0004hT-Dc
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:38 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdI-0000DR-FH
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:38 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso9235043wmh.4
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oS1S2allDRCwTqJLfgxd4YbJAktd2ptss87hkbFVJp0=;
 b=iNvvE9CNnBmAhP4cas2brMgvoAOGUqK5YHgZGAE2EmtABnIsl6IDSIYwgs4DHdnD9/
 dL7Xo/oyj+ub7JabBW03mS9e9jxt/rLyViXnqNvj64ic2jqu1oEPMIsnqUT6O1pMG3V4
 LfSTfxOS+Ai88Yu0CCbciGmoJpMcJz6Oy5U5muc6MW3bp9ZxmZuRL7dumVXM7zBVl9Yc
 KELcu5w6ViOgmjsMYnJ0YWxFaTuOt+vQJlOw4lFEmuTrcSxFE+jBVR2uyjy1HeZkW9yT
 3kY8hRiiQonPEgluIlgpbZVflBdRSFkCFj+jNSeYGMqTZvRoIoOFTRICeqj4m5EfgZgz
 pU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oS1S2allDRCwTqJLfgxd4YbJAktd2ptss87hkbFVJp0=;
 b=udHM8Ej0T8Mbj07PX3ghV/0hZo6T25EEb1YsAypBg/KplYVH2DNhIoh4p3iymnHfKB
 b8z/FgP/8gyac40Lo5TZGgoduzX8zIfqkHiPSmQ3fYh+a5SV2kOVNNrPcBkP7lehf/0R
 qFFbAQshuNuG5BqllquWu8+/K4hx+cWpWn0D9MPsPfg9i72K7p5g6Gvf1mxXc7X39w4e
 5DGas+ZKJ0r5tniCS9V0OKU9Izx6nkqErFUxeXJ38obeHGERisUm+mkIl25Lw4mmya61
 zij4Z7EJcJeAa67alr45OEj5RGv5QkBNHAaN+R1OYQiYuc3NjOFZqMvHDgRI/nQMO1Wl
 69rA==
X-Gm-Message-State: AOAM532gFUOKSKhIhmE3M61Iakroq1E+7GJVfftHXe1Hg1Quw5u/xQ3w
 0xQbr8g5J29rHngyUSW5hWvjYQ==
X-Google-Smtp-Source: ABdhPJy73Bg0nKRXUB73pXpe0okOZaSmfw/bBWmzRFabcFR/Hb78KZOHCjKOv1r+LvEwuYwPwPYY0w==
X-Received: by 2002:a05:600c:2189:: with SMTP id
 e9mr11615179wme.35.1625841453876; 
 Fri, 09 Jul 2021 07:37:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l16sm12919842wmj.47.2021.07.09.07.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:37:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB5071FFC1;
 Fri,  9 Jul 2021 15:30:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 40/40] MAINTAINERS: Added myself as a reviewer for TCG
 Plugins
Date: Fri,  9 Jul 2021 15:30:05 +0100
Message-Id: <20210709143005.1554-41-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623125458.450462-6-ma.mandourr@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ee456e5fb4..77b304afac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2982,6 +2982,7 @@ F: include/tcg/
 TCG Plugins
 M: Alex Bennée <alex.bennee@linaro.org>
 R: Alexandre Iooss <erdnaxe@crans.org>
+R: Mahmoud Mandour <ma.mandourr@gmail.com>
 S: Maintained
 F: docs/devel/tcg-plugins.rst
 F: plugins/
-- 
2.20.1


