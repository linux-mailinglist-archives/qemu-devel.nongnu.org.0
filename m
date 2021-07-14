Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5284D3C82AC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:24:32 +0200 (CEST)
Received: from localhost ([::1]:59760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3c47-00035A-Dt
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bvg-00037a-AB
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:15:48 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bve-0005Rf-M8
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:15:47 -0400
Received: by mail-wr1-x435.google.com with SMTP id l7so2519221wrv.7
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 03:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c1lggVCtX37cQ+DIYqj3+NnVAXSG4H/xLTL6lP1X5q0=;
 b=LzX4obtGvPxxW3o5+tKxNtV0jQceYPtmo/8gqLqtSn4PIUJ0sE7SWhIpEwLgtq5ock
 JBb52vJdP/ItmTuGIVP3jN6toMNn/b34UY/7ky5hedvcTq5fnBrBmz8QZGBAZd1OPO0W
 92+7wT6QEimAc1XvCrmnNHDEjbkqM09X176IQ/nDeUMfX+TeR7Eq9YbZBsU8L+TD96fB
 SsCVuvuh/N0EuxFyMm9Fb4/3LmvqrOhHGQ0GP0reSS1Faa3RjTYpVhQVZCRFdov8oUhI
 /bfuhCX0nzHewhgCBHyzHO4yCV+m25IDMLN6hOtHaE7/2LX87aUECGTr7h3addD/SETS
 F/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c1lggVCtX37cQ+DIYqj3+NnVAXSG4H/xLTL6lP1X5q0=;
 b=OlUFV5X4nNP+LpclroJqQN0uXu1WJVqR2z94sGUBuXDYhF6m7q0WsO7A0CKcHu/nAg
 U8s+0O86RpPI5FGCQW+DTGklZuTupv7XwO3UYUwKPsv6rMDd8Mep7ZCSl+kC0vClxsqM
 qKU3JcpI4Q50b04gqhTjLaXqJiyxpO0sGKurhNK2IeplwQGxsHNw2imYhl6OI/0IRAUd
 eCIeyiVEaR+PYjvvSFdqnRhtlSRsvCr/EpI829on88LHJxUnPhssJxdTU2Z3dyi/iOZp
 XPGoblKtuDW0uIFoLhIh7Wt1soi5Ld7AuVFJnnWVrvzbjWz8iMJ7B03tKZZwliFqKvEo
 a2mg==
X-Gm-Message-State: AOAM533VeKD3fPyCjqpSBhawSmdtoTI9BlipAx1qHf1LkNvHNj2H89aJ
 62+NAPJda6yVjvs1FA/iq7FfHA==
X-Google-Smtp-Source: ABdhPJwSj3KQo1+OUBMMNU7BxbT++nMJN5gnHusCEUx9SgpuTY9BDjWF7QaRgkEVjg1uuhw3B8cuRA==
X-Received: by 2002:adf:eb43:: with SMTP id u3mr11980492wrn.83.1626257744956; 
 Wed, 14 Jul 2021 03:15:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k13sm2168920wrp.34.2021.07.14.03.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 03:15:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1BF181FF7E;
 Wed, 14 Jul 2021 11:15:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.1] meson.build: relax the libdl test to one for the
 function dlopen
Date: Wed, 14 Jul 2021 11:15:36 +0100
Message-Id: <20210714101536.16016-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: minyihh@uci.edu, robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the *BSD family dlopen is already part of libc so it's not a hard
dependency to have a libdl.so library.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index c6dd70c400..e5de144233 100644
--- a/meson.build
+++ b/meson.build
@@ -455,7 +455,10 @@ endif
 rt = cc.find_library('rt', required: false)
 libdl = not_found
 if 'CONFIG_PLUGIN' in config_host
-  libdl = cc.find_library('dl', required: true)
+  libdl = cc.find_library('dl', required: false)
+  if not cc.has_function('dlopen', dependencies: libdl)
+    error('dlopen not found')
+  endif
 endif
 libiscsi = not_found
 if not get_option('libiscsi').auto() or have_block
-- 
2.32.0.264.g75ae10bc75


