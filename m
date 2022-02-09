Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FF54AF4BD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:06:48 +0100 (CET)
Received: from localhost ([::1]:57416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHoYQ-000642-Qt
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:06:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnuC-0000jf-4l
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:25:12 -0500
Received: from [2a00:1450:4864:20::330] (port=52817
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnu8-0001NN-Ss
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:25:10 -0500
Received: by mail-wm1-x330.google.com with SMTP id v129so1592083wme.2
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CVpYJY8/v7LNfM9dUETq5TipA+OkYAaNIcnr10j39ms=;
 b=cbE7LVLcdfW7eKfR/wPWVWl7KFudveAWtBAnc0BEVRvNjmHq7b7UeP8T5gxdK+xNz3
 NAi7jIfPWiFtsFLSrkOd/h1enbp+DR6eDpsm5YiopLDlSkZQUVE4zFg01fuAu1LoYmCp
 vu9NQrgcPdXPxL91X9B5C3WYSyO0GP/Uj3TqArRUDgnh/l0wwkC7dHB+2cph2BRiLDAd
 KR/40dDnwysVtRNP1tZgQH1SZgfv9CwSBXCnE6ihufzpS8ZsIOHxfTlsoNBplrF0vbMr
 LN25zD99j37zUQjrh1Rv3DbG4OG53uEy8TnXBj4jtIn9hNEybt9ZxwYMxqEPH20FWkPV
 eUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CVpYJY8/v7LNfM9dUETq5TipA+OkYAaNIcnr10j39ms=;
 b=ULdAFFR7bnW7AfyMhwtcvM46KwzNBN2lr/OQ9u8if4Mji3YFd0PlwzqKBPbXzyWzm1
 PKZrEm9bZz/+MVwPTAYYptN69fXpCYoK4DQnggRLFa8ehw1zkMCFGb8tNTxjMUSra+sz
 l2pZGsmnw3EO3lnD20XljvrHybp+2Gt2/CgBo2S9Ql6bBf/qkvv7PZeHJxFgmJbCXzYZ
 8Bc4M8cdi1gUfzqcmnICmtNyTYMruU1RK8MAau4tsXANGW87HVlBcbs6aZXA4F4cTeOp
 dtDdrdTgx0j7CJWYWTjmRYHyhhRZDbFWYbcKfU2//VnkCYSCfcZ83LloNgQ0CNJwhCuz
 37/w==
X-Gm-Message-State: AOAM533Ljg6Ibas1lEyfnl5ERooVNyNfTR81HUSptlIFNQY0+pNV79oE
 eyBopLB/KgzttcCNH7lkCPOAIA==
X-Google-Smtp-Source: ABdhPJyj4j1Zqwlxbv9YmF2yjVV5fdB4dM98LJ6NvHHQT6K+sAowrcQHRp5R0U7IgtszR//BIS7qbw==
X-Received: by 2002:a05:600c:1e0e:: with SMTP id
 ay14mr2767515wmb.118.1644416705011; 
 Wed, 09 Feb 2022 06:25:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o3sm8989473wrc.41.2022.02.09.06.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:24:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7471F1FFC5;
 Wed,  9 Feb 2022 14:15:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 13/28] gitlab: fall back to commit hash in qemu-setup filename
Date: Wed,  9 Feb 2022 14:15:14 +0000
Message-Id: <20220209141529.3418384-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Personal repos may not have release tags (v6.0.0, v6.1.0, etc) and this
causes cross_system_build_job to fail when pretty-printing a unique
qemu-setup-*.exe name:

  version="$(git describe --match v[0-9]*)";
             ^^^^^^^^^^ fails ^^^^^^^^^^^
  mv -v qemu-setup*.exe qemu-setup-${version}.exe;

Fall back to the short commit hash if necessary. This fixes CI failures
that Greg Kurz and I experienced in our personal repos.

Cc: Greg Kurz <groug@kaod.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220125173454.10381-1-stefanha@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220204204335.1689602-14-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 10d22dcf6c..29c3c2b826 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -14,7 +14,7 @@
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
     - if grep -q "EXESUF=.exe" config-host.mak;
       then make installer;
-      version="$(git describe --match v[0-9]*)";
+      version="$(git describe --match v[0-9]* 2>/dev/null || git rev-parse --short HEAD)";
       mv -v qemu-setup*.exe qemu-setup-${version}.exe;
       fi
 
-- 
2.30.2


