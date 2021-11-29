Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ECC461C9A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:19:06 +0100 (CET)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkIz-0004pS-MS
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:19:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrkF6-0002Y8-IG
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:15:04 -0500
Received: from [2a00:1450:4864:20::42a] (port=44914
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrkF4-0001Ub-2Y
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:15:04 -0500
Received: by mail-wr1-x42a.google.com with SMTP id l16so38397943wrp.11
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 09:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bhQs6QxD/f/fgQr3W8xnrVDVaMbkSmn+kxyq8ZZ62CM=;
 b=VZWWUylMr+WZhjlKnpL/ra2kh3wSKBPpatUPDrmZ6lZB5tynzTiJVwRfEihvFRkVHv
 +VjEviTDHNoOc1NY7rXiIAW3ZRVMv5pKj2Fz0ZN6cL/iEri+pf87cEimo9li5uAPK+Zr
 MLl1SLaJ+flE4RAS9LYGJOyaK4qnJPsJ49HyxHCv2Wm/dnuuNGHBJ+w8pnkOQRXUZS7D
 pbyJMaHObhXykrl+yt5a1wFWzI9OEdjxZoEwqJzb/bg3o9l97LZ7v3wnbq0iAuyUJCBf
 L6Ba6VxBiYd4ewNbUORmlrmMd6mpjfSjeQRVRLtLjAgzZZFRvAjI0EfkkHu8OAlV1AkF
 450A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bhQs6QxD/f/fgQr3W8xnrVDVaMbkSmn+kxyq8ZZ62CM=;
 b=un7z3ygR7Y+RK5m6/Fv7/48DpNmhm2j7PFObK7P8WF2beqymykGkEQFh7ekcLjnkeP
 032Op2nWMGTBlFD6TyXmrp1bOtxyWP9vrKFVeGDEaktiiU7VCrtVGMN9XldLuirFrdHm
 9S124owXGqf7nibhcEbqBfsfTRs1LBMYSWFMKCHcAwIukAPU9mQaVDVML0poCv88+1MT
 SxYwT33qKQxr/dv66IjplnVdRqq+ttE2d/b9jSB7UfQGHnt+KICrrvVu94GYmJ7VjUMM
 c0eEIEi7iCvxf2jrgqXhE2R7sJD+f65F1eqjRQx5XPBVOAfHnsrok9z/ELTkfVDQ18sh
 zCsQ==
X-Gm-Message-State: AOAM531sXAX2j/HNdVn3Y2pDbVB9bfiXIn8E49VwVG0hnY+xzrlGgkIm
 p/ZUOOXVLadnu17stFRuNd3dFg==
X-Google-Smtp-Source: ABdhPJw2TxkNRAknLxatUrHxqwp4NlGaKdJamfIsZoZHiwf5djiU6NK2kis2tTdyQu92NrPwj/55Cw==
X-Received: by 2002:adf:82f7:: with SMTP id 110mr35464667wrc.111.1638206100736; 
 Mon, 29 Nov 2021 09:15:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v15sm14323079wro.35.2021.11.29.09.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 09:14:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 439B61FF9D;
 Mon, 29 Nov 2021 17:14:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	peter.maydell@linaro.org
Subject: [PULL 6/8] MAINTAINERS: Remove me as a reviewer for the build and
 test/avocado
Date: Mon, 29 Nov 2021 17:14:47 +0000
Message-Id: <20211129171449.4176301-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129171449.4176301-1-alex.bennee@linaro.org>
References: <20211129171449.4176301-1-alex.bennee@linaro.org>
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Beraldo Leal <bleal@redhat.com>
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
Message-Id: <20211129140932.4115115-7-alex.bennee@linaro.org>

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


