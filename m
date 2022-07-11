Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D026570663
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:59:22 +0200 (CEST)
Received: from localhost ([::1]:48318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAusb-0000NL-Ej
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvp-0006nw-7j
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:37 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtve-0002ud-Sf
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:36 -0400
Received: by mail-wr1-x431.google.com with SMTP id v16so7100932wrd.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RcIdbbXzpewsExSM+4LX7uPRbT+xi+nVqfYtgmho4n4=;
 b=QEind2Jf9dCdgO4FuxMA77M1WMoHKJ21n7EvqoZNhvq5DGNRw5CJZRWz0yTMh8y3c9
 kETjkJBfM6KFBD7GBkEyTNS25l//lGry3ga3+lFmZPk5B4HH9iLX8Am/0pXkywsJ2pZ7
 HQFtx0YfrTArFxcXg3l4/8Ahk2monl2mAuc5/RS/e17C3QDsOrNgNTP49W8kBcoL7WV+
 LsbSuxg4zrm5dEK2E3vS5jyLC69lNLGIr47PBEhwWidOLknxaa/XY4Xx+qDmyz+V8HSW
 8NPza4Rz5XhPBIzviUHCtJHhkmTx4898GEIRMgzKZclY+5yMkiOqDP1t6drdt6WzzczE
 MKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RcIdbbXzpewsExSM+4LX7uPRbT+xi+nVqfYtgmho4n4=;
 b=O3hPq974EGhISWg4kJFJoSsnqYa6Dfl6k7DF6Ao2kUJ++QfWxi4cswt833n0ZRp5Gk
 UNdywLJ7y+/T7X0z55iB26fXyV+ybfzTYNOn0HuxPIdwV1xt3HHZWua/po/Gmxu19KDc
 WrgdGWDIvIUJpcQmvnrpsk3N9dInSMYbS2h55QUtZKS++85vfX/sjrmFBhIzQY2ukIFC
 OTS4Fol2JgwFyjSMiiA/p6mozhsc9lUVz/mk/d9iHv6Yj8i4OI6IzHDWsmcKA6k69eS7
 n8R4+gEInGHKucxc7o8dHkZak65Y9pmniqXZ6G/yOCqtn+HXFjPyTAKgdnbJznqB6yhy
 LCmA==
X-Gm-Message-State: AJIora82x6Hd5SBtF1fo/0uWZ8njpoaIrc//HAiTvJ+XEVErmrx4/h+N
 0ng5OQZfAPV9R/s2OE6kmyga1quJal50Qg==
X-Google-Smtp-Source: AGRyM1vm+lSjlPIMtHwqTGzRYVy/PKLbxC2mqHyk5w64IFNL/QdN6Cnm5KF51MEksnshkT+q4WnaNw==
X-Received: by 2002:adf:fbc6:0:b0:21d:3fc3:99e with SMTP id
 d6-20020adffbc6000000b0021d3fc3099emr17159923wrs.550.1657547903776; 
 Mon, 11 Jul 2022 06:58:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/45] linux-user/aarch64: Verify extra record lock succeeded
Date: Mon, 11 Jul 2022 14:57:43 +0100
Message-Id: <20220711135750.765803-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-39-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/signal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 8fbe98d72f2..9ff79da4be0 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -340,6 +340,9 @@ static int target_restore_sigframe(CPUARMState *env,
             __get_user(extra_size,
                        &((struct target_extra_context *)ctx)->size);
             extra = lock_user(VERIFY_READ, extra_datap, extra_size, 0);
+            if (!extra) {
+                return 1;
+            }
             break;
 
         default:
-- 
2.25.1


