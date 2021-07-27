Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53713D73CC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:55:12 +0200 (CEST)
Received: from localhost ([::1]:53550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Kjv-0006n5-G5
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8KdD-00022W-QM
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:15 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8KdB-0004yc-Re
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:15 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 u15-20020a05600c19cfb02902501bdb23cdso1570806wmq.0
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ih0WcZCqBS3wijHWbQbMBxsBau2gLemW3Qrf/f5JYQM=;
 b=Vpe1RXvyStLgOQIh90YM6Slp84GQ5l8Kft06A3kNSM6rR+N+EpI7186p0YWWD2cAb7
 ol5c7DWp3R0bXYw74AoTX/QV03l/PNU6/NAkOQ0PiYxnfncF8QVxzpT35HH0jPfovggb
 y+4WprhlpyNa1+D5vw8LN1i1xLk+iAsXV4AFCG0RT46HtjhvQoD114oKJks1NbnevR3U
 BLUPgwAqxelo0Qsq4kIb6LmDzVMqMahcyC/h5ZSl4/6cYbpfGxmBbk+AIld+Ey3IALWr
 Qjr5EaLDVpDQcp3RZ2ekf8MJRdJOd7+XplcBzLHpGHbtS4sulg0RW1NcFfVIc4F5QBdS
 ZCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ih0WcZCqBS3wijHWbQbMBxsBau2gLemW3Qrf/f5JYQM=;
 b=njsoTU6I1qZLr4XiWMgk/K7dmgWHS9dwAS/ZmWvpRKrBEEKTdHD3S7AokUr/Gm/Gkh
 aS//EYHmmuN2w/e9r1MPJWikszQc10MnT8vyQvwmO02G1YiwT6dwBvzasT7CjBCWavTk
 BFmJ+tQUv7tIqK2pcQcqKO4ljEL+1s9NN0RpFYc1hhP+AzuVnJ/XxaYRLJ5MTnQ1m9Ov
 n4wQh5cTZ4Am62SowKs+CjyjNEjA+BUCYmL22Flef3Ah2G2WkH5/EUa8/8QvsBG1BLrW
 pdVa4mxEh0NIG0WnRK3kTMpc8A5kXsn9SLtoiMWGt62DsOxOQ6VFqBw0HeZfqp4ND6oO
 bIKg==
X-Gm-Message-State: AOAM531owzMXHkQvy5Hu4ICfbz7LucdE0qf+mo8gZ4B2MQo6N8+2a+1g
 rccFcuZrjRSJF0FH9ysPiaTN5M75/nu/1g==
X-Google-Smtp-Source: ABdhPJyAFAO7eGm4fWN2SY2VqGqoXK1UM8lyXGdDP5kJkCHq2d8ZzD+Zw8tDS119rFIFFW1IysrrFg==
X-Received: by 2002:a05:600c:35d1:: with SMTP id
 r17mr3502182wmq.98.1627382892545; 
 Tue, 27 Jul 2021 03:48:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm2413598wmi.33.2021.07.27.03.48.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:48:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/14] hw/arm/nseries: Display hexadecimal value with '0x'
 prefix
Date: Tue, 27 Jul 2021 11:48:00 +0100
Message-Id: <20210727104801.29728-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727104801.29728-1-peter.maydell@linaro.org>
References: <20210727104801.29728-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210726150953.1218690-1-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/nseries.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 906c915df78..af3164c5519 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -692,7 +692,7 @@ static uint32_t mipid_txrx(void *opaque, uint32_t cmd, int len)
     default:
     bad_cmd:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: unknown command %02x\n", __func__, s->cmd);
+                      "%s: unknown command 0x%02x\n", __func__, s->cmd);
         break;
     }
 
-- 
2.20.1


