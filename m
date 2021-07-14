Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7403C81E5
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:42:50 +0200 (CEST)
Received: from localhost ([::1]:59262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bPl-0001xu-Az
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKA-0002TU-QN
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:02 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK8-0004Pm-Kl
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:02 -0400
Received: by mail-wr1-x436.google.com with SMTP id t5so2351057wrw.12
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H5Kii2PogzarIn9PYUJZCxiGHhnTfz9RyRrmcIiHyXg=;
 b=utlUWtzK7A2KzGXNEHqNItq/T3l6r6h+zDSuGNeo/kWDSMl4KA+wIx4m1xskm7X5tP
 rzL6kIhnKxQ2bS6r5I9fjVr9tsBxPdQPqlzeSpmvGtNEwDk5YkGYMSKP2yOXPT17kwCa
 pL8lKV8XnV7zRHURX1abnHGEsZVFvu3BbZRgOawkGpmDHjx5MYADxgEwynpD3g9ktPbY
 Rjfhkl1sX/HPo5MKQNdDnepss9sqMnZNMAFaLPGR+Pwciwcdqe/6UknCGHBwAe5NJX/9
 qksAJzQUHaALYIXViF9v6hp0HM/fRAMtO6AvpW66asSz2oJRfc826ALFSSEB5I0ijNp2
 hUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H5Kii2PogzarIn9PYUJZCxiGHhnTfz9RyRrmcIiHyXg=;
 b=JUWDSG+3xWj6OhfsJ/aZ1VFj24kwlrGjJ0Ei2d9Gt5zAhMXZ6k3eWBf9IombJnidCb
 Qd+qwHG+tQes+XKJdCg/1jvPHIxCPKPsvUM5H7OIVRy/Zc49CEIGhcUsKsBKqRm3hB6d
 ZU/ck+pbApSr4NR44YTRzZPH+Yq9pcmNmOFTcJS8A6/ye2hIL/sw/DHP3PXS6orfcqM4
 Jd5XYnOaTVXuPUwiYzazrRFJ8ZTljKDj2XDvqd0bFeyRRbz51QFEbQ7m8e24cdftWiLj
 kyDVzXe0vKUni6wN9TKqHSfSPynt65UKXz1Vztf7Zvfu2/1mfMYACLXGyxuC/4ApqsED
 tB+g==
X-Gm-Message-State: AOAM5308JxYSyHg0lfVmn20JBAC5MZKx9dOg0MHnq5um2LDgjECgYoOk
 1QfcLCQMO7E11KT38vgpmoKH5Q==
X-Google-Smtp-Source: ABdhPJxFKI7iV6htJBjLtqjtEkr6RzgaOCg+fubBeZeM8TcQkRQEFCAFZUbXsF1i3R0yUIRk8W75vw==
X-Received: by 2002:adf:e488:: with SMTP id i8mr11780754wrm.285.1626255419311; 
 Wed, 14 Jul 2021 02:36:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j16sm1969321wrw.62.2021.07.14.02.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:36:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A58231FFA6;
 Wed, 14 Jul 2021 10:36:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 19/21] contrib/gitdm: add an explicit academic entry for BU
Date: Wed, 14 Jul 2021 10:36:36 +0100
Message-Id: <20210714093638.21077-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


