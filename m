Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CD4370D91
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 17:07:09 +0200 (CEST)
Received: from localhost ([::1]:40618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDgb-0005Qi-1a
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 11:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKj-0001Pj-Pt
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:33 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKh-0005DN-2i
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:33 -0400
Received: by mail-pg1-x530.google.com with SMTP id d10so1900326pgf.12
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ANqvCljUwyEEHHedDj3/bUM/EvfjNzycWYdOdklpBSg=;
 b=k4C2sTD+H3RRxtUK5DKKLvWk7JWyoGHrIPkXAfR6caHvcS6zzwhXMBi9tz7qi/mxZQ
 5LvpsWDWPRxcwLCbd4vdpKTXDKi/4FU3qv0gON15H5Y8V8OCjIrnD4gT65z+z1kM0wxk
 IOTYx1Jy8fgbeuBB5KJ97uZCYoePdltYTOnTuKBC6TNzrdC9ZXWTSKc83TRkF5AerfHc
 A/dcBjW3HGnplTShTjFdN2N+ZhxjDFQq4Zm8ef8yxl0S8J/NetTpXdLvNH339BpTjawS
 cWi+bOQBWLsZ1GxF3KKyJMsatJobOd843lD29A0qkmFVbrP5sE3aqxKGRLa98Hu6XLeb
 322A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ANqvCljUwyEEHHedDj3/bUM/EvfjNzycWYdOdklpBSg=;
 b=n1kno7GQmQHwejrPRtuK0EI0u8EMLv0uW1WXHuaQxcLQLJ2XAxhGnuVo4L9EPwu9rV
 okN0xUJyXiXaGFZj4WLCULC5DJ5PcbmavTbO+rfvKVOPoT/puDEQM2fwQExm9xUEqTqz
 OErIokZWtVWPG1y4i+QXWbd+aoWe+R318w/gOdJMcM7EE73BYbk0+xa4aAasmjnxqNZ3
 N4KVAB2s1ySM9JWq4S9mOlmFr8hkMGxX5TtPj44Qf4F9c9JkChHNm6zfKsk3YCdLZPR0
 s6sr5loLUpzR8a0X6ikIRkqm4LaZR6o0Dkz/qKz7pXgpixN/cHBa8BGIAyYt4sEYkJPG
 IvNw==
X-Gm-Message-State: AOAM533MoEs4/GDH5G3X1lQT/MZvQxZWPfB/8tgDkzC+MaklYyGyAbyS
 OoOogLlktmhYc9ME2j5TXnG6APbfTfHChw==
X-Google-Smtp-Source: ABdhPJz2cJSu87jvF84ytGeOr4K+T3KCVnJ4tZyyaVpSvuh/LCOMygnIO3FfXxw96BrqBFltjZKgxw==
X-Received: by 2002:a63:86c7:: with SMTP id
 x190mr14224342pgd.194.1619966669748; 
 Sun, 02 May 2021 07:44:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 14/31] Hexagon (target/hexagon) change type of
 softfloat_roundingmodes
Date: Sun,  2 May 2021 07:44:02 -0700
Message-Id: <20210502144419.1659844-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-10-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/arch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
index 699e2cfb8f..bb51f19a3d 100644
--- a/target/hexagon/arch.c
+++ b/target/hexagon/arch.c
@@ -95,7 +95,7 @@ int32_t conv_round(int32_t a, int n)
 
 /* Floating Point Stuff */
 
-static const int softfloat_roundingmodes[] = {
+static const FloatRoundMode softfloat_roundingmodes[] = {
     float_round_nearest_even,
     float_round_to_zero,
     float_round_down,
-- 
2.25.1


