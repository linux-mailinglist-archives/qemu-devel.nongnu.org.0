Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA3336D822
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:16:31 +0200 (CEST)
Received: from localhost ([::1]:54220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbk3K-0006mH-Ar
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lbk0S-0004uM-My
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:13:32 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lbk0Q-0006Gj-Sr
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:13:32 -0400
Received: by mail-wm1-x32e.google.com with SMTP id i129so6824471wma.3
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 06:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g3p4V77a0Cc6be8hya2aaNH8iUJ8Dhm84y5LrILPYkM=;
 b=wznQ+w5gdVkZoc6cg00HkpXg9CYxjOX+tOKHRpndqqA9affIAf1jqaMmxjC3QP0Hcn
 xn44RYvQm8AQstVoPj4q224tII3EFcLkG8nbbEbwx5YrjxHD9D2sdQf2hJarCn2zBt7V
 SSEwFLQ4Xfa3Z4mvB8oBahz6wMyMI0kY+uryLktHu5PJ9Qs4WhLfQL3nFOryCpjmPbqm
 K86SpFi9y3y5Cp4pKqPA1QI1+RJLllZ9FkQ+GAcqISM4uhZ+mQwTjFkzy0IrbFjo64rU
 stEgHsQQdkRme5xyP6DWcAOSxUC+smaMHsy5WM8Vxjz27VLBOAkR4fUNAH7wPt0SaZ5S
 IXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g3p4V77a0Cc6be8hya2aaNH8iUJ8Dhm84y5LrILPYkM=;
 b=R8QgVJ8h+XaHjc9mw93h56QL1JqHNTvz0tp5sDqbduDWcq2TCCuVZMWi20QpCEgYA5
 RudA3H5J3ezKbXQoeqrjA7vJxuJ5bJ3Zb9PCKg97DsC4NQxKKvq39BQqgPI34z1GBqi9
 ElHDnOa3E/hfQ5tozv8ARROcQG8k6O+xuAofdINeJzvFU7/wMbs1aB5oUyZs6DTDou6I
 HbHHo1ngcxrNEY3jGqRYuz6CVzpQ2wCZqpEg1f60QN5WTfxvjdoH9Eb1f1iPXZSw9zb0
 ApB0t/haDTtrGjdnTviGvtvgut3LFgM3jynfbAEly2HOOiY04IhRcaMUhxX4YmZtdVNI
 JI2w==
X-Gm-Message-State: AOAM530aCrTlhCyrimQksvL5e8P1mtYT0bZkuVGFJd/rOi9EnBq8/EDv
 XilAFBT9yltGk5N/9Zy5u86JmQ==
X-Google-Smtp-Source: ABdhPJzfkn2qV8Cdmi28gqCh3HXCoSfaWfnAn9eVvzqGzQriASPotCxbOE83ekMtVgivAyP5lBoVvA==
X-Received: by 2002:a1c:9a95:: with SMTP id
 c143mr31256095wme.143.1619615608775; 
 Wed, 28 Apr 2021 06:13:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j13sm7873547wrw.93.2021.04.28.06.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 06:13:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EAC011FF7E;
 Wed, 28 Apr 2021 14:13:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs: fix link in sbsa description
Date: Wed, 28 Apr 2021 14:13:16 +0100
Message-Id: <20210428131316.31390-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "open list:SBSA-REF" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A trailing _ makes all the difference to the rendered link.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/arm/sbsa.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
index b8ecfdb62f..27b0999aac 100644
--- a/docs/system/arm/sbsa.rst
+++ b/docs/system/arm/sbsa.rst
@@ -4,7 +4,7 @@ Arm Server Base System Architecture Reference board (``sbsa-ref``)
 While the `virt` board is a generic board platform that doesn't match
 any real hardware the `sbsa-ref` board intends to look like real
 hardware. The `Server Base System Architecture
-<https://developer.arm.com/documentation/den0029/latest>` defines a
+<https://developer.arm.com/documentation/den0029/latest>`_ defines a
 minimum base line of hardware support and importantly how the firmware
 reports that to any operating system. It is a static system that
 reports a very minimal DT to the firmware for non-discoverable
-- 
2.20.1


