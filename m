Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA28A080D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 19:03:35 +0200 (CEST)
Received: from localhost ([::1]:38822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i31M6-0000Il-7B
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 13:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42449)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i31CE-0007ii-0U
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:53:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i31CA-0000ww-4f
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:53:19 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:34644)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i31C6-0000rm-B2
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:53:16 -0400
Received: by mail-wm1-x32b.google.com with SMTP id y135so103936wmc.1
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 09:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HmgqT/HIUKoP+z/2ztUMKoEQehWucsoXeXun56Y0Jjg=;
 b=iOveHdMfubhWEClABqTNbEnkLUAAZdKqSKIkZmQA0Wl0Wx9+coWlIO4eA9Sj96DyDf
 xmFw0GW0vbfBAvcn3ehVTSp4pqifLqsLHWUEzW6tqp9CRfLIuwBvSvsahSYDBEfQ0Mw8
 wcFh75B/B4KBroW7c408iv5S+hdqzKdNA+azcFc0jghXQEFvoUoAd1UROFo0lNqrp54d
 OW5eP1Hqb8Zylfrw6/9aBZldUz7XP081tspSMi5QyBxdFl7e26CgtWCPFvni8L+dY3m+
 RaoqFvl1ouy9kj4QBS8/wn4QY4P4i+Q9pTTd9WFyagPZVqsdEPvUb0wd7c1hneacqumU
 hcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HmgqT/HIUKoP+z/2ztUMKoEQehWucsoXeXun56Y0Jjg=;
 b=debOsNX9v5uXZOk6NmgTeXKCI3KIeHKIH9BNCNwiQM5/CTIoreQpkqYrX3+c9Y0+JH
 YmYqnHlbTQGkgGOwTUketPcVDOKLbPynB1aUV3P7jwRwxk/bQ1uOYWzM8Md+TW0EUh8o
 PClB9zQr1PvzozDxuy/8h8Pw8OE575Ykh1qngmUGWiwTr0Dzq5Ncnd4HgY0wRf/Mzd8P
 tAGjMkG1zoMI5hFtKOFyn/nNmwPc4SjxxSwo6QUJOGjTPqCp7Rq+on9w4mVnCNjpAoTS
 vOEUQpvLGO1xBCIoTaCcwzQRP8nbz7GnS3lQ6ANS95hk4V4UowCPyzNYMgMEp3tOB4j6
 X1mA==
X-Gm-Message-State: APjAAAXA1kabFriYKy0CxAGnGQPka+P6lWw3/P6a8CV0wlt7SF/c/kxd
 m6ArqR/iLalxHrueDa448iGwOg==
X-Google-Smtp-Source: APXvYqyarmep8enJEr45W6yxhIZbFzi+eKT6IhicPL/z2LRsAVHhBXD58WT3MRsrMX3E0OH/amiXAg==
X-Received: by 2002:a05:600c:1087:: with SMTP id
 e7mr6103029wmd.19.1567011192043; 
 Wed, 28 Aug 2019 09:53:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r16sm6048320wrc.81.2019.08.28.09.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 09:53:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DDDB51FF93;
 Wed, 28 Aug 2019 17:53:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 17:53:04 +0100
Message-Id: <20190828165307.18321-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828165307.18321-1-alex.bennee@linaro.org>
References: <20190828165307.18321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32b
Subject: [Qemu-devel] [PATCH v1 6/9] tcg/README: fix typo
 s/afterwise/afterwards/
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
 "Emilio G. Cota" <cota@braap.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Afterwise is "wise after the fact", as in "hindsight".
Here we meant "afterwards" (as in "subsequently"). Fix it.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tcg/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/README b/tcg/README
index 21fcdf737ff..ef9be5ba90e 100644
--- a/tcg/README
+++ b/tcg/README
@@ -101,7 +101,7 @@ This can be overridden using the following function modifiers:
   canonical locations before calling the helper.
 - TCG_CALL_NO_WRITE_GLOBALS means that the helper does not modify any globals.
   They will only be saved to their canonical location before calling helpers,
-  but they won't be reloaded afterwise.
+  but they won't be reloaded afterwards.
 - TCG_CALL_NO_SIDE_EFFECTS means that the call to the function is removed if
   the return value is not used.
 
-- 
2.20.1


