Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA43D339630
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:22:17 +0100 (CET)
Received: from localhost ([::1]:51824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmQS-00026i-RP
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlae-00042K-FT
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:44 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaN-0002C7-PJ
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:44 -0500
Received: by mail-ej1-x632.google.com with SMTP id bm21so54815017ejb.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tgg01WFzYZWxtwMF3RzuONdmzCofqm4lYuJbp66nklY=;
 b=e9U5fnctqAaxTymmQbwTZNVKbCIAQrVQxTID9Ip8sWTCNHES88Sea+6VcDWvDJEsR3
 UZYgek/HGQkqDDznOn5mHiHFGWO5d9wJfBaI8ZApBhwbSRRDlkuDML9tlRLC9x+wUlbn
 p/DtguzS2vnjtIyOIkRlCjJr6mNvQJE8sTwJYRKMvAePIPpKMpziIrUGo3V/GH9r30pw
 glfUQAXLHByXsIdN974w12G+luUCrcxzYH89uGvL6om5CV3hNQEYZ608ZLGMq7FuB2Gv
 06TuIZQWo4CY70EES/udU9AkziZgISgyOam4F3BNtGKf7QknEqi4wX/aNve73n3U5bbt
 bZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tgg01WFzYZWxtwMF3RzuONdmzCofqm4lYuJbp66nklY=;
 b=GjuAIoB8Hqet/pog0EDuCE7Sqmz1hxmtktVFbHrCk9Xwj/T+mIwcwoq6VKmP5P6S7d
 34kBV9G9hzpmy9MGpqlKfVWiikNY7nGUez3tmPz+PgQ39QAlBHgK8E/HtRazm2kNfe9e
 kuVGvZRTlUyDEVZ4L2WPsYBt5WQHHlIHaedCOUJWv7eWw6q0m1/T7K3IoJT0SIMKlISr
 TYbMPhTgALLYvnPNj3w+3xd5xdC1h7M1U8+5NKcujIhKo3BPEYzC3NkFDO9mR2LBjIVx
 usDV2IumRYDsaC2lXZimPngmPt0Zh/iOppcXmMHaPnoyUnP+AsMME5jDbisko8kOjrey
 PdPQ==
X-Gm-Message-State: AOAM531psw29jMDdpsN5kA8xA506E9DQkuIPTtHj6kCnunBTwOlViaWV
 G0euiBP1loeQwBB6WxzzcssAUQ==
X-Google-Smtp-Source: ABdhPJzAZLhBnEXET17Ag+qIErmus0UvOM6NFlY/0Q+jxghxQrm5/VPwFYvhQKt+qAk/oLqhK5AtwQ==
X-Received: by 2002:a17:907:d8a:: with SMTP id
 go10mr9892867ejc.46.1615570106553; 
 Fri, 12 Mar 2021 09:28:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id rs24sm3108929ejb.75.2021.03.12.09.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:28:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0155C1FF8F;
 Fri, 12 Mar 2021 17:28:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/14] docs/devel: include the plugin API information from
 the headers
Date: Fri, 12 Mar 2021 17:28:10 +0000
Message-Id: <20210312172821.31647-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312172821.31647-1-alex.bennee@linaro.org>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have kerneldoc tags for the headers so we might as well extract
them into our developer documentation whilst we are at it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/tcg-plugins.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 39ce86ed96..18c6581d85 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -63,6 +63,11 @@ valid during the lifetime of the callback so it is important that any
 information that is needed is extracted during the callback and saved
 by the plugin.
 
+API
+===
+
+.. kernel-doc:: include/qemu/qemu-plugin.h
+
 Usage
 =====
 
-- 
2.20.1


