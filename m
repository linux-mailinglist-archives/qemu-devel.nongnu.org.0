Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5DC3D0556
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:28:59 +0200 (CEST)
Received: from localhost ([::1]:53948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zAY-0005Rc-Uy
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8n-00031z-6K
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:09 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8l-0005Xg-JN
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:08 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n1so149902wri.10
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hAsc0QtB2b1m6bNCgwSFnGZxpVoBBdkE9pVOA7Z1A5I=;
 b=MlSChECJoaUBdILURpx5OiedY1EJCIwQYQSnbswSJWt+seJ6ArjPKFLz6FipR2wtIX
 1T5vCQI/elEVjt4RHG8zNXPQtuCzPWBlpVkTlCveI92qcwHC10AOJKjAAqD5uy6D0QEp
 CTmrjZkokf4H6QfJe7Nw1u9OiqZvU1IK9KdSoZ9EVl7KMSjd6AzfINMs9zq0AnHTUGub
 jgwZss4mJuMAo74EEENFxK+50XC90pxTQO27XBS+phLLbMNH8x0yB/1EbI9zO81OcDqH
 SQY8sP4FR7mPcR243kgxgnBStQZAm2LYjeXfuUpB+HvHfb+cCccupiItd/gzJuYSP7CH
 H4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hAsc0QtB2b1m6bNCgwSFnGZxpVoBBdkE9pVOA7Z1A5I=;
 b=rD8IDCyoNpp37kl/2LoeUZ07TVQQv6WV+OJWktxI6m4GxHAxQF/cHNCG3Mr5oDFlAB
 CSW1xCDN9jUgg+6zXf4SMm1FNKvl6HMgrZZ40sduvafn/awJGaaYJPvio6Km2dy5+x14
 qjlUD31q9xW82LtfJN1P6qRCcZvrJDZ8cjToDG0T5SINkIKlIewCt4dvh0iMJ6LuPxKR
 r0p78LZ7L78iofMU9IIH3VgjtS7njrKr93yHZ8iv26BElL3dukQuDxFbfLr5EmjkfTCX
 28gUHomPtlFGLzEFzMdS5hqsqob1uXW/1LUcpeRcbKWL9i6h5HPMGXEBpYLeVctIwhJM
 Rmmw==
X-Gm-Message-State: AOAM5325qWXKlzIdq97bnu3wOnAvJos7XV2/3qzqJ+oOX78vP9O7A0T5
 c3WIyRtIRDP7dQRe1IUIJlU3Vw==
X-Google-Smtp-Source: ABdhPJxZfy9xxogYUaBr99UtjWIiSCziTufbzKpokrYobXAOTIsEIShqahf2Sx8WFtrAAze0+/GTGw==
X-Received: by 2002:a05:6000:12c2:: with SMTP id
 l2mr6349567wrx.144.1626823626099; 
 Tue, 20 Jul 2021 16:27:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d10sm24802216wro.43.2021.07.20.16.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:27:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D77B51FF87;
 Wed, 21 Jul 2021 00:27:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 01/29] gitignore: Update with some filetypes
Date: Wed, 21 Jul 2021 00:26:35 +0100
Message-Id: <20210720232703.10650-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, Viresh Kumar <viresh.kumar@linaro.org>,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Viresh Kumar <viresh.kumar@linaro.org>

Update .gitignore to ignore .swp and .patch files.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <79262dbe1f7888eb02e1911501eebafa6f2f6400.1616583806.git.viresh.kumar@linaro.org>
Message-Id: <20210714182056.25888-2-alex.bennee@linaro.org>
---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitignore b/.gitignore
index 75a4be0724..eb2553026c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -13,3 +13,5 @@ GTAGS
 *~
 *.ast_raw
 *.depend_raw
+*.swp
+*.patch
-- 
2.32.0.264.g75ae10bc75


