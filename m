Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DE43D0581
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:41:25 +0200 (CEST)
Received: from localhost ([::1]:34516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zMa-0004uj-Mm
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFo-0003ir-ON
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:24 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFm-0001cA-Qg
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:24 -0400
Received: by mail-wm1-x32d.google.com with SMTP id w13so293078wmc.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DFxG2fU/udG1+M52EAQlif3sgDEw+blOw3LWA0i55HU=;
 b=DFR29Ls+xPC/NFet543SXe7xdFIxIwJB6N+mITaFk7rc+9hFoAs60e2UTuLFNEVHNk
 NxsfjVwaoZfkrKDIBuGVopzA+FRYVut+Ep1z290B8mDkxcx0yl/NE7pfnauaQKOSvr9J
 9JgHuhB6H8kf1jkez12pouUr2gTSVbAVUc0DjZvY/O1o8JMz56EF54e/2LQDkOveT4mL
 EJPeEigrgOHjlTS0VPGUirAo7unl2yiO4AbKk+hcu6oBrKkPNGe15LwOWr1UzecIwyay
 SrBzGbAwaAnf1Ix0DGYV1orOacxEGFYBArIERIR1LR2Kby2RLd2q7M3fuqX0q8LZ4hs9
 fxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DFxG2fU/udG1+M52EAQlif3sgDEw+blOw3LWA0i55HU=;
 b=b2/KljK8Q9ceWbRbFFXw/McQF5Lm5FZTjJu01/l+HkEV6ESQKX6zipAcWY9l1YNP/N
 1bg3qaqFeGXYsVggH8NqvG7aVf+KflHDI/LihwKGgG7Aip/bh+Qch1fYG9UfG7Au3U7K
 mJuunDncEZKB/+B0PwE+5sTfMwIa2uivO6Xs7RCfMc0nBO23fdpGdJuyt3D09lHv72iH
 OupAZA1FFb+zqomAxMens4wOzok+KR5hggcnVayVRBjKqcrCpp+DAHCFkt2DIoJAY51n
 8/cbRvZm5JAeORmxx6WQtAoEdCVV1DXZ2zk1+imuBgzIcqne04wMKHCWoMu7/ArDrRhm
 6EaQ==
X-Gm-Message-State: AOAM531pPbcJsRpSf5SX0XAvBPt4H9j7IpexesNCfi6cbnAkKsv8/6s4
 +cU7qJ2MqNvVr7eDBOACiJ8K+w==
X-Google-Smtp-Source: ABdhPJy2vsZAJYXs9SLXwu/TXL3DXwoWlvQQXoGYVWewjub5cPXMaSbRd+77eSEDq97HJ7j/yX58WA==
X-Received: by 2002:a05:600c:4304:: with SMTP id
 p4mr29649053wme.93.1626824060860; 
 Tue, 20 Jul 2021 16:34:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 139sm3971469wma.32.2021.07.20.16.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:34:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 60EBB1FFA5;
 Wed, 21 Jul 2021 00:27:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 17/29] contrib/gitdm: add an explicit academic entry for BU
Date: Wed, 21 Jul 2021 00:26:51 +0100
Message-Id: <20210720232703.10650-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Alexander Bulekov <alxndr@bu.edu>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some reason Alexander's contributions were not getting grouped
from the plain "edu" mapping.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20210714182056.25888-20-alex.bennee@linaro.org>
---
 contrib/gitdm/group-map-academics | 3 +++
 1 file changed, 3 insertions(+)

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
2.32.0.264.g75ae10bc75


