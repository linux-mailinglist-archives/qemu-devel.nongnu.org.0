Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA4431E854
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 11:01:22 +0100 (CET)
Received: from localhost ([::1]:40702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCg7c-0006Cg-V8
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 05:01:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfu8-0006n9-Qh
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:24 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfu4-0007E9-7q
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:24 -0500
Received: by mail-wr1-x430.google.com with SMTP id u14so2198169wri.3
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EsPslm2y1fhMEDTOk9iiKfQlaLZSzr5r3t20sdQT3kc=;
 b=Y96TePjJ/MPimbCeVxACEY6qRJDwHzfjco0TkqxoBZL5MPShJ3WCzdadluR9N28ivT
 Q6A9Q8Y+YTU7RBh0HHfzW7rXWOHh7dRmcjSA9CNQaw/VF8ApB5lNiV99M4D4knEks7dm
 XHYP+0NdvPmp4+SgOnPMHZwLUzLqgqZD4+7IB+JcPrWMTkZ5CZw265170HmdcPTw7mYB
 agWyjNYNpPQy+Odgb3uljytjojCsIVRdHVUtbVtqCingWgoT6u9Yrp/ZX5rMGSaeVH9P
 cQPzykJwSsjA6tcZl2wx++IgWfytiU3+EKANmYS/8brEukrvedkuqi0uQ6EIGSAWVsyF
 YWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EsPslm2y1fhMEDTOk9iiKfQlaLZSzr5r3t20sdQT3kc=;
 b=mV/zGkuHzZ41ZBTpBcReeXViVXDiQYrSFiRAx8AamEA9y+Aq2bAGW6N5ojlgvYVIpI
 zX7qevyZwCtUxNUCpwmEgDiR4+glKj8azXcCsRvQBiI2Vq8SwtHYElV8I3M1M+PkBKwE
 zQsWHXhB4FIoI6du/6KuN86Ygt2oMk6MNck9mYzduvSGmG9p4GdCVBnv+sb8oJHicDMl
 e1joyK68UDpFQsYSS6dMWYowY2Bl8OxLNTUXt+EEy08D8C4M7uUONw7TJgkzEE0xjKYU
 /gAWF8DEbguPscjjMR7mhlvOuf05PnRrolnjsx9JWmIU2xoRgRHoKqFDiyp+Rz5/1IZE
 y/Vg==
X-Gm-Message-State: AOAM531E9qEHAnyJamdQOhSaj1H7fU6jZBxp/lrwpFjHqnm+xBQrHkCb
 3HWx8/AwnBtk273vifkgADen/w==
X-Google-Smtp-Source: ABdhPJxeVaGJYP2/ZD1F8XcxsM8A8WpK6cn9LWWOtHpbQZCl/ZUm8UalTKLhD9jf1FFox7XZG+dTqw==
X-Received: by 2002:adf:fdd0:: with SMTP id i16mr3427762wrs.215.1613641638999; 
 Thu, 18 Feb 2021 01:47:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e12sm7584672wrv.59.2021.02.18.01.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:47:15 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A54841FF96;
 Thu, 18 Feb 2021 09:47:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/23] contrib: Open brace '{' following struct go on the same
 line
Date: Thu, 18 Feb 2021 09:46:51 +0000
Message-Id: <20210218094706.23038-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, zhouyang <zhouyang789@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhouyang <zhouyang789@huawei.com>

I found some style problems whil check the code using checkpatch.pl.
This commit fixs the issue below:
ERROR: that open brace { should be on the previous line

Signed-off-by: zhouyang <zhouyang789@huawei.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210118031004.1662363-6-zhouyang789@huawei.com>
Message-Id: <20210213130325.14781-9-alex.bennee@linaro.org>

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


