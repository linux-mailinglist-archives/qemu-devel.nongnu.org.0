Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4031131AB83
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:07:21 +0100 (CET)
Received: from localhost ([::1]:54828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAuds-0003bP-8m
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:07:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaT-0001tJ-OW
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:49 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaI-000679-Lk
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:49 -0500
Received: by mail-wm1-x32e.google.com with SMTP id m1so2511959wml.2
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RCROluMEcJvM+yAsD3BnKbpRZviimnBaL9KtnMHvw8k=;
 b=PiZxcUyj6ed0Bf/39238tvuDtWw77hQ3BEvB4tIRhtb+5qu3BceBQCo7RmZZdUrhKu
 Vgf5aCe3/yMJs1IrFcGlsFqHy8W62ZSnxpAZOBhub0h4zHsRtdOKeQJgAd8jTHv/rHnA
 zx16gmsmx2DY/GRmvTQxtUSIGEIkSqmvk9WL/asqfynigRfwjyDIcLyVEQrblDrMptlT
 6MI7YIX/W+EKs8DYrAWoqM2O7sn8MOB7ZGK2Co0CxgWR7571TAnktUITHOMOO1gL6ycc
 P1ls1KD/b/ZplRideNvOYoPHZY2A2MH2TpTjGWguEU6SDFa6ftOnygkuVrWdr1lZMo2H
 Kd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RCROluMEcJvM+yAsD3BnKbpRZviimnBaL9KtnMHvw8k=;
 b=Q9RIVStB3IcZoJZVCEevlUNvZ6rghFe/XIapU4xCGPdqGPr6CIw94Tv92lcegz3n8y
 3Z3Up7MTkx8of3a/bx6Pv68lz3Y+MJOkuQWpNbQm+YNTNxQLYUaGiQYDbcSkrq9+4lTm
 8SzdAG9W04KDcl5mvDu97DU8HTXHwYeJ2NoNxeUQjQEjMVW+NJUsUE/8mzH/DzGY7XlI
 b2/vPcB/dHim5gHmUOzA/YZoujPcjl2XZ4HAEgdBDybDydMYR2h6gL7t8RdSl4fv4p6t
 DWwvecYY6jjkoYEkUT7OYjrMmWBXdgojRPbuwmX4/ey8avGV395hYci7d0Ja7CAFPts/
 CouA==
X-Gm-Message-State: AOAM531Tcvwxeyn5qk5/of/qVfssvOcCBN9Qw/Hcd60IvHM94HKAbOwh
 bE+3N4Q175K7iSHfvrr0lxehRQ==
X-Google-Smtp-Source: ABdhPJx+chrM+cnCjB9JAJcLV/OaESmYhGnIex4dGFIY95M35qBB2vDl6+WZDYqaH7ZsNL67BhmJ+A==
X-Received: by 2002:a1c:40d4:: with SMTP id n203mr6706754wma.46.1613221416203; 
 Sat, 13 Feb 2021 05:03:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g1sm17213100wmh.9.2021.02.13.05.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3F8EA1FF96;
 Sat, 13 Feb 2021 13:03:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/23] contrib: Open brace '{' following struct go on the
 same line
Date: Sat, 13 Feb 2021 13:03:10 +0000
Message-Id: <20210213130325.14781-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: zhouyang <zhouyang789@huawei.com>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhouyang <zhouyang789@huawei.com>

I found some style problems whil check the code using checkpatch.pl.
This commit fixs the issue below:
ERROR: that open brace { should be on the previous line

Signed-off-by: zhouyang <zhouyang789@huawei.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210118031004.1662363-6-zhouyang789@huawei.com>
Message-Id: <20210210221053.18050-9-alex.bennee@linaro.org>
---
 contrib/plugins/howvec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 9d6fa33297..600f7facc1 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -145,8 +145,7 @@ typedef struct {
     int table_sz;
 } ClassSelector;
 
-static ClassSelector class_tables[] =
-{
+static ClassSelector class_tables[] = {
     { "aarch64", aarch64_insn_classes, ARRAY_SIZE(aarch64_insn_classes) },
     { "sparc",   sparc32_insn_classes, ARRAY_SIZE(sparc32_insn_classes) },
     { "sparc64", sparc64_insn_classes, ARRAY_SIZE(sparc64_insn_classes) },
-- 
2.20.1


