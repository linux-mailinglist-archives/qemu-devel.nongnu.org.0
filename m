Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4DA21ED4C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 11:54:25 +0200 (CEST)
Received: from localhost ([::1]:55780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvHdo-0004vA-LP
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 05:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jvHcL-0003Jq-Pu
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 05:52:53 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jvHcK-0003wT-1N
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 05:52:53 -0400
Received: by mail-wm1-x32a.google.com with SMTP id 17so4413881wmo.1
 for <qemu-devel@nongnu.org>; Tue, 14 Jul 2020 02:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rpooH7rvGB3Q2o270AjlbKN5BMcUh/GjMl+HqsE1wCk=;
 b=V924s+NoRN+c6b6k3H1j7a91OPnoYYlgfOX4F1J7J6c+6rXCpcpBRBJXK/zuHJaWPu
 mdLEU7ePqDaPCvtdureyJSeX3KLP7zt5hB8Qic7VH/EIVPlIDr8kjBUD5zQAOJRxZFDq
 Ct4RzoaISAxsJBWmmP4KdqvpofILakBIrWJJaeDail+ogVnLZoW5MP2T5sjuNnNhTWmK
 nd5AM3+2aphsTQVStBCOBRad5MEfZImmXltPhJJgGy1iC0W0jLqkmuO7IAYgKopa/ann
 DBFi+cA5AitBlGXcQHn9iZxpZmQ+gR5P+iDjIEQw2a0h96JG73yCdoadQTCYbVg+oKM2
 Eo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rpooH7rvGB3Q2o270AjlbKN5BMcUh/GjMl+HqsE1wCk=;
 b=iJWAKIXB3+wp+66TqXg0vAZFDGixZk+zvh4DbU40TyOOQ4r0gpMACNqICTr9Q2CsEm
 xdvgHyRNVe3AswWXUsSfSovKwd+Vaw/falxCoOdTLizzoON8GKvLqJIMw3PSn6EYc4Gg
 Tn6TDIfFiP1ZH8XdoCTGwBkKknkPiN1Qg563JyUb9RIPef5gVm9oNW4vJm4+v9trbM6H
 g8MVOZDAB/2lOx5WOYwKCgGoty6ch2aUFrLsi+nPH0AY7t4ypEPeKvL8XbkfO9RFf8zD
 HvG5e45ZW9+/nAjbWXYXR8p/9cZn1tEvnXeIvS0c0fNTPkXGr0IAIlDWNVY8UmEG+mXT
 7nhw==
X-Gm-Message-State: AOAM5332TLW3+NNUe2pX2SRblo6SeC10Zr4IacadmONy4D8LzRg9BeaZ
 wp4v8AIHPotOZILi3h7W6SKPaA==
X-Google-Smtp-Source: ABdhPJz6zQv/dKeCqIEu3Md9klfn7C2kiyPfVok9t0Wfd3L0+lNDjPIwfobvwkA5atocSXsRAttg9Q==
X-Received: by 2002:a1c:48c5:: with SMTP id v188mr3384740wma.58.1594720370652; 
 Tue, 14 Jul 2020 02:52:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a22sm3546965wmj.9.2020.07.14.02.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 02:52:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6259C1FF87;
 Tue, 14 Jul 2020 10:52:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 1/9] docs/devel: fix grammar in multi-thread-tcg
Date: Tue, 14 Jul 2020 10:52:39 +0100
Message-Id: <20200714095247.19573-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200714095247.19573-1-alex.bennee@linaro.org>
References: <20200714095247.19573-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Review comment came just too late ;-)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20200713200415.26214-9-alex.bennee@linaro.org>

diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
index 42158b77c7..21483870db 100644
--- a/docs/devel/multi-thread-tcg.rst
+++ b/docs/devel/multi-thread-tcg.rst
@@ -107,7 +107,7 @@ including:
 
   - debugging operations (breakpoint insertion/removal)
   - some CPU helper functions
-  - linux-user spawning it's first thread
+  - linux-user spawning its first thread
 
 This is done with the async_safe_run_on_cpu() mechanism to ensure all
 vCPUs are quiescent when changes are being made to shared global
-- 
2.20.1


