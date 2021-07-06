Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE64E3BDA23
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:26:16 +0200 (CEST)
Received: from localhost ([::1]:51816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mxj-0004e7-S6
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0moz-0002Q4-OK
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:17:21 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:45662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mor-0004u0-I2
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:17:13 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso2505814wmj.4
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DPKLxk04De7Sb5Hr8SfgY3P9LZx+smJYFH9/zYZ+ZF0=;
 b=Lqbh9cyB4tKdGWFGvfgio/p++gXxhtFWWILhc8OpdFWEOS+sPDJCFJVRIgcVUsJYLq
 hftQgdGAIx4knV4rfYVhzyPcbWxJotxS7BqNpYAUB+acLMIQePh1uxhyHByrk3MiVN2D
 1UJN+780whMtwbtMXZ+FJmicmc3jIrQBvTH3E1bu3cZBVjnw6OuPo0cnR6EBmhdI+1b1
 CUrAsK/7bVRz0j1+3YsLRGgPJmCuoA9xmuiUg3NbCQw0T+VtbJmDfBDnsLKSk3n6QsIY
 ruJgntVJ48lvFp436SjkqN+4whB08w5/sNFjgJE9jt4LYBhvUUq/qF5qEICik1wJOGOO
 uOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DPKLxk04De7Sb5Hr8SfgY3P9LZx+smJYFH9/zYZ+ZF0=;
 b=LqNn1A+u6kMLyXoG2223EIsItGh0s4IOVkxsnsE0WX3swrpWmBn4OByjFvFWxzTzqG
 tkE8zjkYVYLNFllmbhuevtzGGqivfOQuNYBzLJzbeUxyQrcOSgHu7Jqqj8wuGkmfXC3i
 hDTXqa7RY0vLl8k6yvemKdCP90iw3lp2xCEmLNwyMIrrt6TTQXOuK1V5LpCpwKk0ShKz
 HG4e5VYYPXpWzBXUPHu1mjo7iLSI8HOX+cScP3hDPUKCVcAYtlwjNgOJ+jlhiaZE4FA7
 5kWjbTfg8EQrnlLnrLcoGosZjTi2Ye58+ORAteoZtQ9TDl2aesf/b9wSAWXs1Sa5btHe
 Mnuw==
X-Gm-Message-State: AOAM532PJ60jxRkn5I8pUdHZ5ivRXWSU8k+v7uV5VwuNdx+5WxYmfEs/
 T0JuCKrYHz/OBpgyOcBdxxYtmg==
X-Google-Smtp-Source: ABdhPJzH5tBUgjVHuiofaTwjHGJB4vX8VMOuQlXn0g8QoMeiLgXdPCqdjhaKZw/NiWxETimItgW1Hg==
X-Received: by 2002:a1c:1bc3:: with SMTP id b186mr1397435wmb.27.1625584624221; 
 Tue, 06 Jul 2021 08:17:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l7sm16412461wry.0.2021.07.06.08.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:17:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D9521FFAE;
 Tue,  6 Jul 2021 15:58:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 25/39] tests/vm: update openbsd to release 6.9
Date: Tue,  6 Jul 2021 15:58:03 +0100
Message-Id: <20210706145817.24109-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brad Smith <brad@comstyle.com>

tests/vm: update openbsd to release 6.9

Signed-off-by: Brad Smith <brad@comstyle.com>
Tested-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <YLRDeJV8qBrt9++c@humpty.home.comstyle.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/openbsd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 4d1399378e..c4c78a80f1 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
     name = "openbsd"
     arch = "x86_64"
 
-    link = "https://cdn.openbsd.org/pub/OpenBSD/6.8/amd64/install68.iso"
-    csum = "47e291fcc2d0c1a8ae0b66329f040b33af755b6adbd21739e20bb5ad56f62b6c"
+    link = "https://cdn.openbsd.org/pub/OpenBSD/6.9/amd64/install69.iso"
+    csum = "140d26548aec680e34bb5f82295414228e7f61e4f5e7951af066014fda2d6e43"
     size = "20G"
     pkgs = [
         # tools
-- 
2.20.1


