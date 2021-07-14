Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4C63C820F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:50:53 +0200 (CEST)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bXW-0004bN-VO
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKn-0003Q4-3b
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:41 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKl-0004q5-Ed
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:40 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d2so2460959wrn.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H5Kii2PogzarIn9PYUJZCxiGHhnTfz9RyRrmcIiHyXg=;
 b=tQSiQKIw8kikzzMlbqlW0ZY+33ln/u5USk4cqOYfYyNQpjKj7p1TSPwNUqOMKdelfF
 Jqyt2fdcIQYZaJ+ouhY8oQ6etcFdNFDbR6JjVlSkixW/9JPLVzqEW+S4M8hka4YJHt9e
 kXR4K8O0o1Vzu1psOsYxHPhI6AP4XC0yMUMqx476EnhYTnX8ibFFeQIx1D6n+9FwvGnR
 QlGhP+VQ9kUTXZhKHUgGkjFw3TLceR1f3gJOkqu9t9gY/nsuiqwYPEUKo2F5qF3GuT1l
 kcJnMdEJvtIbhBphtt+2exYzLsMUaY2aBOiW2HlUsx+x3A+270efIyk0kVKGVkX12OQ+
 QA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H5Kii2PogzarIn9PYUJZCxiGHhnTfz9RyRrmcIiHyXg=;
 b=Uzznt3zJHTUo+lTba+sNSyzz5ddauSFiJNMeDjTSPWdr3ggL5owKADZTzaVla9//8C
 kQYWGlBYtapNHnwp9DTCxgJ9O91KZdYeePPpO0L0X+a4rOIqkiUtXUu6skdT0iBBGBTc
 k0NsNmlAtEVMWPkcSTi/GQGUwgc/WReo/VawGyq5u/XiV3SfDGNx1negI9QRibIcGJGz
 MUsZHAqF4BEYd5XHvI8pIg7GCkzuPHdC9RlHLZCsRHp4K4F2y5IktN2XF5GqMQ3gCe5X
 cnde99KmvqvUf/vZTphUxRF6YsW8wuvhlA700Nymx8euo5jSzAnl0nIG2+fYXCeAxyeR
 z13g==
X-Gm-Message-State: AOAM532CTlGhOiQuH/L7znRmiKIWa/3zFxicKo0KkpAShSjGHovRRPN2
 1hPwD0iMGUDo/4cieHtRaLDaaA==
X-Google-Smtp-Source: ABdhPJxFBleCnXsDem+HpXJ8UUV5IHo8+5rvfQC0ccQq9RbCFQSN28vNNiV2LM/Qy+16+qmyCgLBFg==
X-Received: by 2002:adf:82d2:: with SMTP id 76mr5290153wrc.5.1626255458122;
 Wed, 14 Jul 2021 02:37:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l15sm1952775wrv.87.2021.07.14.02.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:37:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C5391FFB4;
 Wed, 14 Jul 2021 10:37:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 19/21] contrib/gitdm: add an explicit academic entry for BU
Date: Wed, 14 Jul 2021 10:37:17 +0100
Message-Id: <20210714093719.21429-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some reason Alexander's contributions were not getting grouped
from the plain "edu" mapping.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>
---
 contrib/gitdm/group-map-academics | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/contrib/gitdm/group-map-academics b/contrib/gitdm/group-map-academics
index bf3c894821..44745ca85b 100644
--- a/contrib/gitdm/group-map-academics
+++ b/contrib/gitdm/group-map-academics
@@ -16,3 +16,6 @@ cota@braap.org
 uni-paderborn.de
 edu
 edu.cn
+
+# Boston University
+bu.edu
-- 
2.20.1


