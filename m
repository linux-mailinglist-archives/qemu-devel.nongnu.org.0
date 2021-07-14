Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012EE3C828A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:13:56 +0200 (CEST)
Received: from localhost ([::1]:42282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3btr-0007P3-UK
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bmj-0004eP-Os
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:06:33 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bmi-0007T3-9A
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:06:33 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso3109734wmc.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 03:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2tML9PBFUQ02pvNz8oc+UiCp1dT3K9Inf3Z+G2zPJKw=;
 b=kJw4lThRheh4d6aWZOmW0urXQUkPo1toD8wtHUoOpQuSeEk8kYJ22UKXTV9PC7CIlZ
 pQOuxlapTeJDznE5cjDfpyRHQcBDSFE45pcWge/ZfykB/BHfUsuMZtoHEutABaXr5yMj
 TxPHqXCQY/YTT/MppSS0cOd/8iZ6rcE0ArOCY1eh+BWH/3iDJxbCwYl80okykyyI/Q7O
 40ABZWWYzKnUJ9AXU74blFhGqeVWcnzGipvYzQg4yUxFd7BjGvEHYxsfA/U+LdIffdBH
 bXTB7S5LbiHa7PBzBjEWuuFJFOKtdjSD9905rFi4cbwbqYGnoyFjthczY6cEaxK3NIb3
 cUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2tML9PBFUQ02pvNz8oc+UiCp1dT3K9Inf3Z+G2zPJKw=;
 b=A4L5vvFMJk9IZ6oOmopbkEyviO8A4NQwLLBheRwiZ9P1jLGDDqUt/kLbtrp3thzqWJ
 sxKg20bt7kVFJQWzIcX40nyCMp6OngkZVbmIrBdUmZMN7mvaYlB1X/KLHkGkuZOowOSg
 He+lP/qEeq3UDaAu0D5ZJ9QSt72fj+280EPn3weGKfMcxJrc/9pSr+Amm1UfNvSlrSf9
 TvQ6pKU3afTlyg7ZFOl3AdA0TnNDGGGUUWLE19wywqrF7E5BSQqCgK6pcxjAhWVGMTXw
 Lmia92U5smvlgD1jU/YSnCfCtmt1X7OU9ZQctZMl2oE7eauKXAcHsWTwAPN71RstDUTa
 FiqA==
X-Gm-Message-State: AOAM532EJSt0U6rd0tY8I00H8LJ7j6XF13qn/SY+zGE5vcfntwa1BEGO
 ZAVyN9S/pSlJbRZK3ieOik/Jqg==
X-Google-Smtp-Source: ABdhPJxHnk1dJFatbDaLzhIkqBFNSl60obS2RnVG5e5//77IIqn9xzh8hSVN359DJ/RYULnwH1+apw==
X-Received: by 2002:a05:600c:4a17:: with SMTP id
 c23mr10275489wmp.7.1626257190351; 
 Wed, 14 Jul 2021 03:06:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b12sm2051150wro.1.2021.07.14.03.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 03:06:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 725C21FF7E;
 Wed, 14 Jul 2021 11:06:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 21/21] contrib/gitdm: add more individual contributor
 entries.
Date: Wed, 14 Jul 2021 11:06:28 +0100
Message-Id: <20210714100628.10460-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Li Qiang <liq3ea@163.com>, Li Qiang <liq3ea@gmail.com>,
 Chetan Pant <chetan4windows@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?= <dirty.ice.hu@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Again this is guess work based on public websites.

 - Chetan lists himself as a freelancer on twitter.
 - Akihiko lists themselves as an individual developer on GitHub
 - Jiaxun's website looks like a personal one

[AJB: Won't merge without confirmation from appropriate people.]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: "Kővágó, Zoltán" <dirty.ice.hu@gmail.com>
Cc: Li Qiang <liq3ea@gmail.com>
Cc: Li Qiang <liq3ea@163.com>
Cc: Chetan Pant <chetan4windows@gmail.com>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 contrib/gitdm/group-map-individuals | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index 36bbb77c39..853fb98bc3 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -29,3 +29,9 @@ mrolnik@gmail.com
 huth@tuxfamily.org
 jhogan@kernel.org
 atar4qemu@gmail.com
+dirty.ice.hu@gmail.com
+liq3ea@163.com
+liq3ea@gmail.com
+chetan4windows@gmail.com
+akihiko.odaki@gmail.com
+jiaxun.yang@flygoat.com
-- 
2.20.1


