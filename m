Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC2B3728E6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:27:30 +0200 (CEST)
Received: from localhost ([::1]:50014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsH3-00073R-S9
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lds9I-00068X-QX
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:19:28 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lds9G-0003ke-W5
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:19:28 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a4so8784031wrr.2
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJ9m89LqMP6JqoZX9kb8/L/8kKBGmEH5iou5hRLkrKc=;
 b=qjuQJh8lZ+yR8D1Jq4peJ8hr1n8n9769/TJ6at35IQXD/HEO2ZlfsyrCcDdOwoS6GI
 qWtp7utMkIx4b99jistfeCFfPntweU+4NqhIAVaI1eduhBhMMmm3qpzmQ66wiegwZeU5
 lt6Uk8Ltz8eRZODD/MRbB1G/Popim58266WVFedQgAelTPMMTh4gHZaHZHfGNLzCmawZ
 zPEEaoSPSoswVBAuAqsRpLcFfwQ24maQilUvHVg+zbxxTiPrVym1LB1dR2T0ZzNBA3z5
 nWi8BOkh/4MJlwaa7jJZ0Nwc+wWiaJkSsde+9LrqyKa8vVxHx18H84xjPps+OTbDwC5m
 fI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJ9m89LqMP6JqoZX9kb8/L/8kKBGmEH5iou5hRLkrKc=;
 b=mZxroPML02EW2xM9XScXlFzYAut+IDg1M1GOHZv58OO8Taj3B51eKF1q8Q0S+DRdl+
 gLL59mwbTbkPMSeLdGvYQZqxjl839le5jDofpM33MorlprlJyo91OQf5sAXmzZupP7cs
 l2nxCOdAIEzoD65Gdj6c5+Tlyx2jC2zMF7ghjGInzmDdNJo1u5Lf37qgQUHNFBrxKbeM
 Yt4HGDI6dDbKJUEU6+QV9tpBXJrIY0/IAZ8OklRSb/1EkL2gZSQ7Sd2cioQWq/OzX6vS
 VLHqGXux2jpGBOHmPRaCkkpGCCssXFG1t+jIQIK5ORo5eNm8I+mVBXD5g1Yx7Xx8cuj7
 LvLQ==
X-Gm-Message-State: AOAM532WTnV0S1rSisdMaEQ/PQnJuIepBvAj526MWRD4lZLpzkJPECqJ
 k1SPNoLm4S/00SFLVg8UFv9J+w==
X-Google-Smtp-Source: ABdhPJw2ccTYRZ9SydEez8yrEpCje01LiqnY63D4ON1EUP+B1LACPGzWqT4ssEKmua1KW6YlMhJ2Qg==
X-Received: by 2002:a5d:6749:: with SMTP id l9mr31047001wrw.142.1620123565616; 
 Tue, 04 May 2021 03:19:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q16sm2199631wmj.24.2021.05.04.03.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:19:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 247501FF9E;
 Tue,  4 May 2021 11:02:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 15/30] configure: Emit HOST_CC to config-host.mak
Date: Tue,  4 May 2021 11:02:08 +0100
Message-Id: <20210504100223.25427-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, berrange@redhat.com,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

this is needed by the tricore-tcg-tests as tricore-gcc is not easily
available. Thus we rely on the HOST_CC to do the preprocessing of the
tricore assembly files.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-6-kbastian@mail.uni-paderborn.de>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 4f374b4889..bb86c72479 100755
--- a/configure
+++ b/configure
@@ -6139,6 +6139,7 @@ echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
+echo "HOST_CC=$host_cc" >> $config_host_mak
 if $iasl -h > /dev/null 2>&1; then
   echo "CONFIG_IASL=$iasl" >> $config_host_mak
 fi
-- 
2.20.1


