Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6392C3D3E69
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:21:14 +0200 (CEST)
Received: from localhost ([::1]:35936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yrJ-0005Ij-E1
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yg9-0005mg-88
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:41 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:47005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yg7-0008Ed-NN
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:40 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w12so3036559wro.13
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1XrtnTNaZ0b/JSDRPxYa+0ljZ2Ob8i8G0ZXugAjf3Ig=;
 b=m7s+oLxzVBUHIse5BVFTUPVvJLeyPoJI5rsXLA/I8s0Pr5b5CBffAUK4eTe58T/Ps+
 5siBB8jWcXx4+EXAx++9fVhj3mXoQ4IGUKQBaksABUgUjHidYHg88RCMe60VwVeHw07W
 oMvfbRx/ETYuZ4eVyu1THn7/hkBd8ASoYlqWVFAKIkLKFJFYugFhNd3v5tVvPqdnCmjX
 UHAIZv5eM5F23jl2eQ1T03HQpwJztQN1h6gzuKwAH7WSS8rPaG0gWNyMUTNVfhgxrLmb
 ikfo4K5kMfVe1sStCNQxI9dXrp3oYs4a34DQkUhpsmrwrz7pw6xbfYMGu+/FJmngBe05
 1GVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1XrtnTNaZ0b/JSDRPxYa+0ljZ2Ob8i8G0ZXugAjf3Ig=;
 b=i9szPnBGnAasDEYH8tVD838QAM8I0dzEj3Em/dSaKyyYQ+h6LvS03As+lu1ubK9CLW
 QOA3M6jgkEaBBwmYyv/qqcZp9PZJtghhXcbKckOHcbba4/EVWbu6kVToqNJb0P7TYzZt
 Ixxz0BxI0GwXKwD4EtYhyK+JgtiI6LN9xbWLmRNKwIFMKuKPEjHIYzNOQfqYgtTipOTV
 G9xYIImTmQCzbGENNj2glbe84rV5ymAhG3wM/0ywvzI6F/1fjlNAawCJ6cXT7jUr+Lkn
 ijA22TrPKLnb7cPFsE64EYT+3xuebII57qx56iM15J++LLb81JF7JDpXj4Y4ig8QLXcF
 37cg==
X-Gm-Message-State: AOAM531SYhobV0JArLDdSMX9UVMR6enoWqIWIAw+xuzeRLRDfvsdL4xJ
 liXPbkEqIVgfyaSVKNkL5gR4Gg==
X-Google-Smtp-Source: ABdhPJycAFQdIIj1nusB6oD3n6Jf2dI4qXuGY6xASQvBbGF/FvfxKdoIC5NfZC18rDL8OUvgQSK+Gw==
X-Received: by 2002:adf:eec5:: with SMTP id a5mr6303362wrp.317.1627060178322; 
 Fri, 23 Jul 2021 10:09:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o18sm33460122wrx.21.2021.07.23.10.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:09:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE59D1FFA5;
 Fri, 23 Jul 2021 18:03:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 17/28] contrib/gitdm: add an explicit academic entry for BU
Date: Fri, 23 Jul 2021 18:03:43 +0100
Message-Id: <20210723170354.18975-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some reason Alexander's contributions were not getting grouped
from the plain "edu" mapping.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20210720232703.10650-18-alex.bennee@linaro.org>

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


