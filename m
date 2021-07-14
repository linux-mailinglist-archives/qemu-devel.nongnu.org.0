Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E4D3C8207
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:48:21 +0200 (CEST)
Received: from localhost ([::1]:50380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bV7-0006XE-0U
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK0-0001wZ-NX
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:52 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bJz-0004IR-3t
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:52 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso3065035wmc.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7VqwcD3D/wQtp19xfyzwBEQ4cRkVmHpHd0tvUKcvyuU=;
 b=Bj5Skjh9De3MP4no2xxPHR83fIYkqbuVX1OLx8941n1e/vC20ubLQlAFUnIXoGWiL4
 YrVF1kiqKOg1g7+6q51qIoRvcVGTXov+al1/EjnJTKd6BazyJjanQKyubj5ogbZlayTS
 oyABscaX4Rs9go/c/jedBGH34SNOTWWU4umxRL3tnjZrpL9X8Of4hOOfZiJ2kf5ClR7M
 4hN0ww/USXlJMG8voG/vhhwvi0pQ7acCG7MXf4y3QbSMWLf1hCh5gcwm4BFfa2EJcapz
 FKKtiCFVax9SVU9YlR8/1LBIU/hi7j/9sRVcuOwOoo4q82XrM4csEbgUY4bNjbawQQoD
 hQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7VqwcD3D/wQtp19xfyzwBEQ4cRkVmHpHd0tvUKcvyuU=;
 b=hAjqZewfEbDlyZra6oPoF4Dfl602V17EFclgdFEVF9NLVgUgrmxqJQrI0V5Knfo6U/
 +R0Dv1U3caaMLtO2Bm9nRd0XhFWMrp2LYm2thcTS8g8qjItDhUK/wTcMe5eQte2iwZDC
 VzyNf7cdESMb3BmYvqGPXNgsY8K/UbPvsUpF+5va+wEVhMHBh6yLS0kyzo9EN6ivNHTL
 tqlO7xam1wt4g2yaxnjq0b9A1lknS4CLz4c5pN+Glu+bB8AQfewVHXaXnqNBwc1+z0OB
 GBVwHuHyh2+UWXYAj4JkZc61xV/pU3KNyyt1wQc4CxK7hjOh0MsyyjqJZPjTDvk7gYhF
 GjUQ==
X-Gm-Message-State: AOAM533NmvGGOKc7K6oT7uc0TSc5lqQCxFzYjrUMeV6/M7YZMEtn08R7
 YxdFyfYctXK9Ri65pqW6SyWWaw==
X-Google-Smtp-Source: ABdhPJyaSsnClODnyJsLNYpiQg5t4FDtyTy/W8Hq8Y1nHFWgSaRDNe15SPiW4rPlaWaMivcVa1u1pw==
X-Received: by 2002:a05:600c:4e88:: with SMTP id
 f8mr10141190wmq.14.1626255407303; 
 Wed, 14 Jul 2021 02:36:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x8sm1882815wrt.93.2021.07.14.02.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:36:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E1AD1FF91;
 Wed, 14 Jul 2021 10:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 05/21] contrib/gitdm: add some new aliases to fix up commits
Date: Wed, 14 Jul 2021 10:36:22 +0100
Message-Id: <20210714093638.21077-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yuval Shaia <yuval.shaia.ml@gmail.com>
---
 contrib/gitdm/aliases | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/contrib/gitdm/aliases b/contrib/gitdm/aliases
index c1e744312f..c6ed215e68 100644
--- a/contrib/gitdm/aliases
+++ b/contrib/gitdm/aliases
@@ -31,6 +31,9 @@ pbrook@c046a42c-6fe2-441c-8c8c-71466251a162 paul@codesourcery.com
 ths@c046a42c-6fe2-441c-8c8c-71466251a162 ths@networkno.de
 malc@c046a42c-6fe2-441c-8c8c-71466251a162 av1474@comtv.ru
 
+# some broken tags
+yuval.shaia.ml.gmail.com yuval.shaia.ml@gmail.com
+
 # There is also a:
 #    (no author) <(no author)@c046a42c-6fe2-441c-8c8c-71466251a162>
 # for the cvs2svn initialization commit e63c3dc74bf.
-- 
2.20.1


