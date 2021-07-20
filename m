Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D913D05C8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:44:07 +0200 (CEST)
Received: from localhost ([::1]:42992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zPC-0002Ah-Oq
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFr-0003sG-64
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:27 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFp-0001eC-ET
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:26 -0400
Received: by mail-wr1-x433.google.com with SMTP id r11so166940wro.9
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UEtmrIZyFhV/VzGCNsDi0IbUC8HYvsuRADUZGX7OW5Y=;
 b=DRtyARLSucM3TeYdRzdMTMubqitzE/L6lbHrZs+uuA93xCxfvwjgcvsP/TbE1DN6ci
 l4e9u2cKv+uajC9oPzJPDUNP/+OySTj7DsikyVHNrEJDv2TT0OZIWh+9VGdanRmQdsrc
 ApIzEDzk4dNklY8yrIHITKJeee3JiZdRIGL6bZIPEixzHUAB4mYTnWMfxypqaFynnMsA
 ZtCxoTxm0c4bMtBjXxwFtT2SI87hQt5q5SdivXHFaqJlpXNmI10nU9pZ5RQCB/o5qryo
 DrEBzgCqW8h11kDcuygJwC1AIwjDIbJskHOxu94knJzdAeYpJH+jO4fwwG1pPQ09Rf51
 6Ebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UEtmrIZyFhV/VzGCNsDi0IbUC8HYvsuRADUZGX7OW5Y=;
 b=NI98cwYYTXB/7F1Qku49t6RptdkCq9e9Myv6U24RqZ+q58Xpo7kvt3D742DBO2zuOC
 W8jsfOmamB4nsnFQMEPm8APKI9/R2Ij7+RK9PWhYQRRc7OZbEUzXv3V0jmzy/FDYkyBo
 DlDab5QDvZv3PAumBJKLGv42+t67N83rt//ZcquKSkurH/+HhBwOJyqlrrfoPMFL8w9m
 wA7T41cEX+ZqoEkbF3PAOLbzCzU9sAQGxZ4AsEu4G3zldqwCMbGcSgPLuJ3FcnLE0mOV
 /OvttvzYKAGOBWHvj1oWHNdQH3bkDSiYP5qp905bIbTOGeE/8jgvDwHdgpWr86ixl3NC
 Vgew==
X-Gm-Message-State: AOAM532Bv4v+nFncSzvs7fKZoWYxdXVrRdrUPLqjYb76Gnqy8OQX6dvQ
 v+hDaCKwzQI0/3/5Y6B+5yPSeg==
X-Google-Smtp-Source: ABdhPJyzwNdZ7Y1b1yGfbknnub0+FPbnbBJMYGokug1kzolpsqrNTq18RWP7tlobB3Lz4kcacjHCTw==
X-Received: by 2002:a05:6000:12c2:: with SMTP id
 l2mr6373647wrx.144.1626824064090; 
 Tue, 20 Jul 2021 16:34:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r4sm25523103wre.84.2021.07.20.16.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:34:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 318421FF9E;
 Wed, 21 Jul 2021 00:27:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 15/29] contrib/gitdm: add domain-map for NVIDIA
Date: Wed, 21 Jul 2021 00:26:49 +0100
Message-Id: <20210720232703.10650-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: fam@euphon.net, Yishai Hadas <yishaih@nvidia.com>, berrange@redhat.com,
 f4bug@amsat.org, Kirti Wankhede <kwankhede@nvidia.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
Cc: Yishai Hadas <yishaih@nvidia.com>
Message-Id: <20210714182056.25888-18-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index e42861cd11..2800d9f986 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -24,6 +24,7 @@ microsoft.com   Microsoft
 mvista.com      MontaVista
 nokia.com       Nokia
 nuviainc.com    NUVIA
+nvidia.com      NVIDIA
 oracle.com      Oracle
 proxmox.com     Proxmox
 quicinc.com     Qualcomm Innovation Center
-- 
2.32.0.264.g75ae10bc75


