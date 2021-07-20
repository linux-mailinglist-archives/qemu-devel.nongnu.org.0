Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836713D056D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:31:53 +0200 (CEST)
Received: from localhost ([::1]:34148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zDM-0002jS-Eo
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8t-0003Ek-J8
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:15 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8s-0005cf-2r
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:15 -0400
Received: by mail-wm1-x329.google.com with SMTP id n4so296173wms.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fueZ92WlXAEMRTCta96CoSJ/YwzYayzkLvIl3JgwYIg=;
 b=UQ5yxKuJ346ei/af9u6thAfQ61x/u7+TtZImlZN/4OQEMNBb4EP5GMkq1MtgDZX0KJ
 CMG8jGXD5Xuj0CqE71j9mkVxVlC2aP5yeSgSpUZ94r6IRPv4LI8LZCqXWHT9GOtXzvDV
 lr0O4ykUTj9g6frDkjloARQsAQQBND+bGPuwRGnbtzwNTPY2o/ZyVNpYYie/JJr+ZoXg
 9KBzqAS9wGfrErPyfbCBPGVYkrVxs69oXqxCbk8aNxtWRQiV505GuraF4Zez/lYlumJ5
 gBKEhD1JsYsEWNz4hGhdtvHRT+EPfrPLHHFwvjAP1YewYk5OP7I3ryCifAV0/vXSX41C
 Qa5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fueZ92WlXAEMRTCta96CoSJ/YwzYayzkLvIl3JgwYIg=;
 b=D7YGsV/JXO1m7QJfITU5jlFU1bkZ7d94j4gvyeVgUlps+gdoHJ1h5AeLS5e4Eag13E
 lLPW1pVJnJkVloyz7/C+S5HXgz3vSJLfnHoGj0ZGlMsT59mS1bNvyfEpZr0FhvAiZUXo
 dWl5m6kAO9PFaPzpbcQqpNAqiQs5x7djjoXQCUZxJ9VROIYYBL4cb8fwwV3TYQyN06mg
 uDinJSOfecSTMpa1CX9YVPoDWZ9EX6P+tYiMvj83uN9aI+OGR9gvcr9A2Zy0C5a3rHq4
 4gh+FGn19dqx3qy8f2Iwv43TeGlDtxK/vp+3JiAf4TUUa7dK+9FBROFaaJOjiZAhxp9P
 0Fqg==
X-Gm-Message-State: AOAM533ptW7ytTWTSbP5qSRqX+Y6l586WRwDNDy0EEvPb5u4RMkkuYVF
 uQYrRGinw4eITroSfBo2WDn0Hw==
X-Google-Smtp-Source: ABdhPJx7onF0H9beSoPvZFiP8UUIkxVVrTU+w62Uah19r9/DcgPEOAX1yMxd6ifwyVZNuxJJ9ZMY5w==
X-Received: by 2002:a05:600c:4656:: with SMTP id
 n22mr960535wmo.24.1626823632725; 
 Tue, 20 Jul 2021 16:27:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k24sm26052552wrh.30.2021.07.20.16.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:27:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 43CE71FF91;
 Wed, 21 Jul 2021 00:27:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 05/29] contrib/gitdm: add some new aliases to fix up commits
Date: Wed, 21 Jul 2021 00:26:39 +0100
Message-Id: <20210720232703.10650-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Yuval Shaia <yuval.shaia.ml@gmail.com>
Message-Id: <20210714182056.25888-6-alex.bennee@linaro.org>
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
2.32.0.264.g75ae10bc75


