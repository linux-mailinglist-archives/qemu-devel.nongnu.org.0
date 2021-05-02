Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6837C370D74
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 16:50:40 +0200 (CEST)
Received: from localhost ([::1]:34718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDQd-0007gq-Dq
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 10:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKd-0001GQ-OG
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:27 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKb-0005AJ-1m
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:27 -0400
Received: by mail-pl1-x632.google.com with SMTP id b21so1475525plz.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lhfa+4fc39/8zQCjA36z3jMbuqMJRs1LoYZWUgZZB5w=;
 b=czpTRb/w+WRQAxXYxZ7IG7/QZwmZ5nTnsb7lpDCc6yuuEwAfrRtAtj3z1032DdO+ix
 y0Yzh8RQl1RDNOpwV/i0MS0mTe754IyozZvDhw7TZLiOpsufiuo2lmYJbAbZzjsJo3gE
 VXjV1l8y+SbnOlPuH+BfsJC8wMyI11iglrcYJMKIpOqjACkn6m547GOJJZMopTwd7xfP
 GsGBNPrY339FtdcRvFznp7VoE3K/4HXapHHb+i/ddpDn6gii4iFguqgMkNM7N0ox0dqX
 Mn5/zJPMPJY2wu+s4Ri3p2NJFpQrSxfARTt206qCp4mFcY1yHVyU79AcamUh9KZ4sHy0
 ZIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lhfa+4fc39/8zQCjA36z3jMbuqMJRs1LoYZWUgZZB5w=;
 b=M2ySw/Bsak3yPCwbb5tdImkwZgCt1PMWf5WTvrqewFsjY42xIFq6yb2dX29t0PjTk8
 DI6sVYkXctQuacoucTBT2LEdl73eOaVFwQw/GZyBErWUVQ9wcC4l8ubwj8ps3VhMAOrH
 NylumEA3CU/SU4emeTapcPtWKzqJzVpYc710eqQhBRrhUuq8MndXkvRdXDfM66Wu//98
 vuaYm6tkJ7DOucjz+Zz2GCeyxR71yoMP9W/Gxx28sTdEakTZYiZ5IeYwoXABy9hxXemq
 pb6sEikxrmXoYh+rXedSlxJTfyR4WLpP9IjyGnby8bnClouACp8H5z2ia4bMYa5AV5HT
 GZlQ==
X-Gm-Message-State: AOAM532hJyO2Be4194mBzlyNKJOZq3sEa+Azbc5jcacFN0l7NcyNxHv7
 Ip1npuXDyvDIUEAf6pIeXkXHvjrU+bl2mw==
X-Google-Smtp-Source: ABdhPJyPDH69zqnEIkY4BiI1FQPzLjTPaHCzywgEyrq9jUcY4YmVTiSrHo5U19wVc9cC7ARmOoReZw==
X-Received: by 2002:a17:902:b28b:b029:ed:19aa:5dec with SMTP id
 u11-20020a170902b28bb02900ed19aa5decmr16152432plr.78.1619966663440; 
 Sun, 02 May 2021 07:44:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 04/31] target/hexagon: fix typo in comment
Date: Sun,  2 May 2021 07:43:52 -0700
Message-Id: <20210502144419.1659844-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <1615784115-26559-1-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 2c6d718579..d6b5c47500 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -298,7 +298,7 @@ int32_t HELPER(fcircadd)(int32_t RxV, int32_t offset, int32_t M, int32_t CS)
 }
 
 /*
- * Hexagon FP operations return ~0 insteat of NaN
+ * Hexagon FP operations return ~0 instead of NaN
  * The hex_check_sfnan/hex_check_dfnan functions perform this check
  */
 static float32 hex_check_sfnan(float32 x)
-- 
2.25.1


