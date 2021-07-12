Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EA53C5CA5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:53:49 +0200 (CEST)
Received: from localhost ([::1]:60260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vRU-0001B8-Na
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7G-0004bv-A1
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:32:54 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7E-0002IH-HC
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:32:54 -0400
Received: by mail-wm1-x329.google.com with SMTP id w13so11300971wmc.3
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QQsPUcmmvCXpidPMt9LFIQWrpqM/fEvzdVYo5rHypHA=;
 b=CD3iw/9Oi/7wgkSHFA+2iBd4bfx6W0J2pVs5SFN8uUliToVq2TXWr5oWgHpGNFcbx4
 Zh/doZPz8JUvYAR2ud0G1gGNq1boh+dgtcUlQ1Rca441Uvrsztfk26jwtbY4MaarBoPG
 shpQBZRA9l4E2zR1jn5q33/+2xomM2u5a2t7eej8m5X7uWVoQm4kZZo9HVx4xmGw6Djd
 a+y1y5qchxFx7SlXLY6v8Qpl1U34sdM7vlF+YTmuYQZ4CEft8gga0mR+bkX+hNW3PEoD
 QH6MU1SPrTUtUPHdiOWhNlC8CR3rHQvxwces0s79lQXWEofdN85N38Zbb0PS3jg3E0hP
 8NAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QQsPUcmmvCXpidPMt9LFIQWrpqM/fEvzdVYo5rHypHA=;
 b=DhKOZljM0NPSi/ilBsylFwyrzm73ASEz5j2pcmbl+SPWTBk4IlNNUC3xmq3jLbcUQi
 X24D2FDrLhl47o/M9HnXDq++eaWfzvMfWKjUyX/bzZlpoh65CIycnfeCxUvfhUzZK+7F
 CIfSnSt69J0Cdo90QICYpvoovawdjHtfQo/z6ZNh/dN2JBKhgR4EkcBhjGkPcJhJuP0L
 OsFTj358bXU/RksY8ghfgLAUpAt18RNzIN+Hyz/dvG7FvYAtewb3XQCrRC/75AC43hLT
 Qi3PeZCtcVceAhNKeB7+rclisuaVJhjyW4uvD1mCqLtIKEES+xD8G9E374tBrNulHSLr
 HRoA==
X-Gm-Message-State: AOAM533ZLWFd3oROi02uF03MJBs+F+AdFSDY9MdsWIu7PSWS2Lm8MvT9
 8UqlGgAbN7/At8EQgjO01GSEBQ==
X-Google-Smtp-Source: ABdhPJzqsQeFUGSC9fq0GqcxO26Fs7mx3eFlrFn8YZCy2XHm0Ah30/RY4eCHk8X33xQCHqF5LRtm5g==
X-Received: by 2002:a7b:cf29:: with SMTP id m9mr7059726wmg.13.1626093171192;
 Mon, 12 Jul 2021 05:32:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j12sm14775142wrq.83.2021.07.12.05.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:32:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 68B9B1FFAE;
 Mon, 12 Jul 2021 13:26:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 24/40] tests/vm: update NetBSD to 9.2
Date: Mon, 12 Jul 2021 13:26:37 +0100
Message-Id: <20210712122653.11354-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brad Smith <brad@comstyle.com>

tests/vm: update NetBSD to 9.2

Signed-off-by: Brad Smith <brad@comstyle.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <YLe+LZ/j0pxVGeBi@humpty.home.comstyle.com>
Message-Id: <20210709143005.1554-25-alex.bennee@linaro.org>

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index b9efc269d2..4cc58df130 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -22,8 +22,8 @@ class NetBSDVM(basevm.BaseVM):
     name = "netbsd"
     arch = "x86_64"
 
-    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.1/images/NetBSD-9.1-amd64.iso"
-    csum = "65bddc95945991c3b2021f9c8ded7f34c25f0a7611b7aa15a15fe23399e902307e926ae97fcd01dc1662ac67b5f6e4be643c6a2b581692ddcb616d30125066f9"
+    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.2/images/NetBSD-9.2-amd64.iso"
+    csum = "5ee0ea101f73386b9b424f5d1041e371db3c42fdd6f4e4518dc79c4a08f31d43091ebe93425c9f0dcaaed2b51131836fe6774f33f89030b58d64709b35fda72f"
     size = "20G"
     pkgs = [
         # tools
-- 
2.20.1


