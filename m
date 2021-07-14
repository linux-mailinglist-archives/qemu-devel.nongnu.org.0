Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFD63C8209
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:49:51 +0200 (CEST)
Received: from localhost ([::1]:57044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bWY-0002bd-6K
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK8-0002NJ-Qq
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:00 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK6-0004OZ-WF
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:00 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so1001289wmc.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kvc0BPKB1sR/Rn+i6q+NnoukvDXoahmUQu52zM+1gKA=;
 b=owq3AD6JEW1sSD7l8kE9N4g0JYB6ZP8W4S/GueZJOpG1NybLPro6c/pS879gF3Tyl4
 ne77dbo4UpE2LONJMFtB5lE+8pxk+M15LXyj+qv56kTBPpfR+NR9W3KPRrl3kl/cV3KV
 m/wS+YLo2SajbjnYsYrBwISlVdP3qSBwq7rEy8ZTym7zh11dubVHZg2au5n6lZIFO/GT
 p/LTAdE3V7DuLu4b5gQYCcs8AhYxpERfjt09wFi9aIupho7z7Tl5I2F3HjbL8v8zyk+u
 0hOE4QwSLrd6szLV1216d3/QER0fuZpx32kAWInFqOBXOcnfON0r8Kg+5Byh3mw2tsBI
 dYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kvc0BPKB1sR/Rn+i6q+NnoukvDXoahmUQu52zM+1gKA=;
 b=k2kR7QaRiP4ylHAQGHmFmBHDy64L5VpvrzGFNRlwkUN3XqLA603caurTv0xYETidN8
 yAG4OEMuxauOYg7GAmMsiDMrnUPNgbQMwJ/sRWiwQ/9hA/VWM2LT5liYBT0PXTejlpGo
 auTQBG7h9OQ4l2KvLpqUIgWNBFlgPoDVXWvmiqFcd3sxuA7eYwa9+Rg+crrOsixrkOkf
 fRjtufdqMXMXyL2jk/kr0Q1aURzHaJClxIrtt/n6JIkNHxYYm1T0Pj3/Z+3asV/2o9Rp
 25lnB99mg2r98gPQ9QkZPR0MsPa0hajAyggvPZzUvKqWPM48IXRpC6wy7qAb1j/DjK04
 8taQ==
X-Gm-Message-State: AOAM531H/DQdUzVTzIQHwAiiyQxR1Ddx1vf8DrDmahRdGH0t787Gfs07
 sKnKjXdMjXVa6JC1o9iKhCKjcA==
X-Google-Smtp-Source: ABdhPJyYHfwOaLAW2aQ28wVnyFO2SpSmyunFbjpdD6/2IYhYeLb53dxr8xu0aYvoFM5M365fbrpmOA==
X-Received: by 2002:a1c:5985:: with SMTP id n127mr10032413wmb.75.1626255417487; 
 Wed, 14 Jul 2021 02:36:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 6sm4903844wmi.3.2021.07.14.02.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:36:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4B3561FF9E;
 Wed, 14 Jul 2021 10:36:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 15/21] contrib/gitdm: add domain-map for ZTE
Date: Wed, 14 Jul 2021 10:36:32 +0100
Message-Id: <20210714093638.21077-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
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
Cc: Yi Wang <wang.yi59@zte.com.cn>, Yun Liu <liu.yunh@zte.com.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yi Wang <wang.yi59@zte.com.cn>
Cc: Yun Liu <liu.yunh@zte.com.cn>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index e42861cd11..bada5384dd 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -40,3 +40,4 @@ windriver.com   Wind River
 xilinx.com      Xilinx
 yadro.com       YADRO
 yandex-team.ru  Yandex
+zte.com.cn      ZTE
-- 
2.20.1


