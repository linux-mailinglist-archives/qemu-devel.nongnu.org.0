Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09269268F31
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 17:10:07 +0200 (CEST)
Received: from localhost ([::1]:43974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHq7E-0002Bb-R5
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 11:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kHq4k-0000eR-Ls
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 11:07:26 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kHq4h-0000DN-8w
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 11:07:26 -0400
Received: by mail-wm1-x331.google.com with SMTP id y15so431922wmi.0
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 08:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DcZH3/AM3ITUmRI3mSUTeNdaJ0mGPZEUhU4TVCzbSkM=;
 b=v7tZ0xwkuJ59RtexlPiJASSnnsOx1r+crLg1V7rF4fUpuKqNzdUutYJHUeo7oP4kA3
 fIdYmcgH14APJD3T7NRTrTO3oE6H28fOt+zmsu0vFDn7mpmhoOOsVwLfumhWeRFbrjVI
 /VUrU+gABMDqYMAMe+L6h+2zbprWwWIRANBLhglGMZmtJS8sD5KPvBA7LURqP/uNiSUE
 5XIePlS7sWBwuXyAebkd88So7LaYJvS1dzoTR6bQn2Cj0IxWeA77PuAHOKxcbUZurPD3
 3OAx/5PbRWlU8emCCTFOUg7cOfbo3Nqv6t5EvmyAndFIr+yoKgOV81t38L6oSxGJ9JsA
 3z5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DcZH3/AM3ITUmRI3mSUTeNdaJ0mGPZEUhU4TVCzbSkM=;
 b=f6wAIaUd4BkS5xaZ26aRAvOuaVLgXFxT8wwKMDifuGsCeeXWZxxhNFI4Yqf5LfQtaT
 wR1IZEdadOyF+9NwhEic5GBoK7GquYYG545A/Z5zQoF3wCeWTTD3kI63m/3JdQAzwPAp
 nQPXpz1mkLO8sG38oT++VpsVqItdkBooL+M9YPnuR481IUpQoXhZpt4E6Qpz7nT0A2z5
 v8BrFfa5wCU/5AwllxJJT2XSuYT6xKublq4xoq+CcWuSHAgY50jQyaQuBD8DNm+3ohwv
 PpV9No2cNtBZgPmKFc1D1CFc+qdFCtKafL08+P36BFDmzrUsLWXVBDLkS+IWkvIwd1FM
 p14w==
X-Gm-Message-State: AOAM533IzeSd7aFOwqKIp0kRrmUdGXL2GrCnl9lnBzEW6QaJOLqPYHyh
 GiTIXJzIx7JlwXHIkVovzp9s6xmHX1KGbA==
X-Google-Smtp-Source: ABdhPJy5LF/gylD1qMhEUMI5VN6cQnot/7bM8SAZgLOecUYVj0fNNM8M+cSDOkvLkkJfh3B8S8KpKQ==
X-Received: by 2002:a1c:5a87:: with SMTP id
 o129mr16039757wmb.145.1600096041666; 
 Mon, 14 Sep 2020 08:07:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u66sm19961158wmg.44.2020.09.14.08.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 08:07:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 12E3D1FF8C;
 Mon, 14 Sep 2020 16:07:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/6] configure: use add_to for tweaking deprecated_features
Date: Mon, 14 Sep 2020 16:07:12 +0100
Message-Id: <20200914150716.10501-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200914150716.10501-1-alex.bennee@linaro.org>
References: <20200914150716.10501-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 2b6a1196da50..e365a90cc133 100755
--- a/configure
+++ b/configure
@@ -7668,7 +7668,7 @@ case "$target_name" in
     TARGET_SYSTBL_ABI=common,nospu,32
     echo "TARGET_ABI32=y" >> $config_target_mak
     gdb_xml_files="power64-core.xml power-fpu.xml power-altivec.xml power-spe.xml power-vsx.xml"
-    deprecated_features="ppc64abi32 ${deprecated_features}"
+    add_to deprecated_features ppc64abi32
   ;;
   riscv32)
     TARGET_BASE_ARCH=riscv
-- 
2.20.1


