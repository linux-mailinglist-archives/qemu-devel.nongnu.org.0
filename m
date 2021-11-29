Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E36461826
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:26:11 +0100 (CET)
Received: from localhost ([::1]:45318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhbe-0007wI-P2
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:26:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLp-0001Yv-Lf
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:53 -0500
Received: from [2a00:1450:4864:20::42a] (port=33725
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLj-0006Vi-E4
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:49 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d24so37159562wra.0
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 06:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/izHlYo1eDjiSDXKoXYRwJfwLHOfDK99Sn/yTJcOteo=;
 b=hyknblUAE5zpHyqPYon6KtwVJxni6A1aDV5KaSx92becnD0Sh4ugKRu8lD2SPjzJC0
 1NhPXvUqVK4eB41/smwqdnDjMgTFwk5do1NnYjGW8eM3+qqBEjCUlseNs1RZS564mgQZ
 Bi1xevqc77l81w/UNo3VGAJ+UHIjZ/K0bvdNQkj8lDzY4msjgEhupqDFnhga9K+cROSe
 w23LJ5MBu8y9oTBoouBXCcbCmV8+DvgkDxxaUS+pmy60oWQdLbbGCTAvDHUwoikx9HfD
 tZDN1ObMdIFH6EouXDMF0631f2+me0tX3V763AlLtD6zL9gwp8izPoLgZ7Nkupc5BY8+
 IY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/izHlYo1eDjiSDXKoXYRwJfwLHOfDK99Sn/yTJcOteo=;
 b=uGFgDu8td9AdG/DRz1IS41WXzh6cmgChk5S3nWWE6kghj3wLgdppF/8EFkKucvBAiM
 si1AYay6OkmpVDkDkG573/sCRYiwPBrNymz6p+TF5dpw0Jxsqaq9JJQElNmNGm0Bglug
 lW1kAbIGjBPuMDZef70fUvAwiqzp0ajiKVcGdJhwkxnqEB7WmS8vm2PYLE2UyvzD++Jn
 1DaCZeLR6gNxGDB5kLYR9VAZ9c1PWJSLOa5Q4frYzRZ7RThkHWyZVKKvRxwnXW651tbl
 LqPKqGWiiIb4Em//jWlbSl8ubwORJ+YyG270QTLG6kddT8bHfU+j68stkoF72HKotQR7
 J83w==
X-Gm-Message-State: AOAM532/sTF4qvR6740b8WwAaj5ATZ4Lo3+wjqd0JbeBbngISVRYd4gM
 W1p/TCtb+S4nJnjtIgZAg+3Slg==
X-Google-Smtp-Source: ABdhPJx1b5JRspEhNJjDZABH5IyON/cBtOTNiA8YCvC+0yDGdoVKGQ3CJGe02GA/cl9SHXrZmF5pNg==
X-Received: by 2002:adf:b355:: with SMTP id k21mr33101423wrd.451.1638194981510; 
 Mon, 29 Nov 2021 06:09:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b13sm10506295wrh.32.2021.11.29.06.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 06:09:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D7E71FF9D;
 Mon, 29 Nov 2021 14:09:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/8] MAINTAINERS: Remove me as a reviewer for the build and
 test/avocado
Date: Mon, 29 Nov 2021 14:09:30 +0000
Message-Id: <20211129140932.4115115-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129140932.4115115-1-alex.bennee@linaro.org>
References: <20211129140932.4115115-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

Remove me as a reviewer for the Build and test automation and the
Integration Testing with the Avocado Framework and add Beraldo
Leal.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Message-Id: <20211122191124.31620-1-willianr@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211123205729.2205806-7-alex.bennee@linaro.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d3879aa3c1..8f5156bfa7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3469,7 +3469,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 M: Thomas Huth <thuth@redhat.com>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
-R: Willian Rampazzo <willianr@redhat.com>
+R: Beraldo Leal <bleal@redhat.com>
 S: Maintained
 F: .github/lockdown.yml
 F: .gitlab-ci.yml
@@ -3507,7 +3507,7 @@ W: https://trello.com/b/6Qi1pxVn/avocado-qemu
 R: Cleber Rosa <crosa@redhat.com>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
-R: Willian Rampazzo <willianr@redhat.com>
+R: Beraldo Leal <bleal@redhat.com>
 S: Odd Fixes
 F: tests/avocado/
 
-- 
2.30.2


