Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA6F4AF52F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:26:59 +0100 (CET)
Received: from localhost ([::1]:55842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHory-0000aJ-Ns
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:26:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnll-00030S-Le
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:30 -0500
Received: from [2a00:1450:4864:20::62d] (port=41950
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnlK-0007r8-9K
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:10 -0500
Received: by mail-ej1-x62d.google.com with SMTP id a8so7707351ejc.8
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uMYb17GyxsrP+NkgdmFVAjR5IMWfK9SZozLUtY0td2o=;
 b=fBDTEGcNTzysdcGSGcKAZmwKKwK6DK+btEFAU9GoujH3vypwoAP+eBuVTCgbUX/Mpk
 cnbfptGUa+fsdsbUVNgxwEC0kFt1GZ3JXCb7EvM/di/FEFGWwu7KqLk8cD2NNffCepKY
 XygyXhsTO37uxrRLwC1atvrUDob3Angex+NAHo7/N4ZArdJNYOATT+YQERFTDV51kL5z
 tcXj8QDve5ZCO630ieMpn4CM+/5iPTIbyPi+dsTrmytqrUr6l6NqW5afH+yMsylvjCgl
 F3aa0mT7ktH9EXuE1qukFUCIbmpQUtix6VkPR+nieEYsWWLB12Aoew5a+9JzEEGR4DHU
 ATEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uMYb17GyxsrP+NkgdmFVAjR5IMWfK9SZozLUtY0td2o=;
 b=lagq2D/TsvUeFD2WU4FS3K4U8F8ErS3o2GXqBiIoThfFADxCcigiU4qEdRPPy2HrCN
 ogoduHPymPH5dpA1tSSwoWlneU3ixDCwlxmbD1Ldmh5orTtY0HqiSupvjE+Y2xM6tAVp
 DTtcCBb046AGMFs98fJjldgxO6VOpqnIDVBIFWt74JM9Ht32xhaTuPA81+yAPgCcIEWy
 yNbJqLlfnjtUoHs3eAOY4gxIDCVP8QjKW1ZUpfvGSKw7aoinG/WLpGRdT9xvm43DpeQq
 NLNcTWoxeeha4YfbjowY7GgS7cM5QF6cGDRRLkP+s7//NO7AYkzZXqn7WirBFYwRViJQ
 fFcg==
X-Gm-Message-State: AOAM531AJRad0Iq4zJq8JAXu27b+pR+i4a0RZ+762hAqeXK8Mq4hTood
 ysNjloNBsCdxE8JsLnkpkBEr5WMHp7xn/A==
X-Google-Smtp-Source: ABdhPJzxDNWpFReXxg1ZU2Qqj+ONn1m9EDA3G2qKC2mvyO+9hC3eIb/APcGRPf3wi3G3bzzuqyr2Nw==
X-Received: by 2002:a17:907:1c02:: with SMTP id
 nc2mr2276653ejc.661.1644416136844; 
 Wed, 09 Feb 2022 06:15:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d23sm6537897edv.79.2022.02.09.06.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:15:31 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 945461FFBC;
 Wed,  9 Feb 2022 14:15:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 04/28] .gitignore: add .gcov pattern
Date: Wed,  9 Feb 2022 14:15:05 +0000
Message-Id: <20220209141529.3418384-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The gcovr tool is very messy and can leave a lot of crap in the source
tree even when using build directories.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220204204335.1689602-5-alex.bennee@linaro.org>

diff --git a/.gitignore b/.gitignore
index eb2553026c..9726a778b3 100644
--- a/.gitignore
+++ b/.gitignore
@@ -15,3 +15,4 @@ GTAGS
 *.depend_raw
 *.swp
 *.patch
+*.gcov
-- 
2.30.2


