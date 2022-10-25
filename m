Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FAC60D243
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 19:09:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMyN-0005Pe-4I; Tue, 25 Oct 2022 12:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyJ-0005Oi-KF
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:12 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyD-0001Q3-6U
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:11 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h9so10986469wrt.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vyKoVIaZ14z5rmK2eOBlHnplzEcKxB4jMXPTjeFMRWo=;
 b=f7582MHa9Cux2cSBMZEregsz/Mwwj9fOVC3WM58/cOz6ZlaaWRGbqHO84l72g3kZrk
 8cHz7WYPe39uyPQ/gm0KANcDbSd3AODjh+TXG8KpmdpiuujU6H1HQrr5mLV/x/UFl9wG
 Mtu5yq32tojIkHcQHrWPP4VZb07O7glS1FJgD3xb9YkQ3zxShGVEx3ruJ9ZWDYUs4v6e
 SdfzXMTHDE/I/lS4ozJYnEtqXwUzZqwV+SKQtHlH2bt/ZaoimQ16Uy2XdnT7V54/XKXH
 jcMKBvoX4QE4Ub1kaFDjRy4mR8pCNIzQBn7i3BLMCGJJkggZjMozvEva1cR8H/B8cSIJ
 0vHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vyKoVIaZ14z5rmK2eOBlHnplzEcKxB4jMXPTjeFMRWo=;
 b=ooozL9lv7vtMGnDCDWg0Rp+EfHHtTYLSIWpGB8xZH4w6pew5QHhCS2hZYVDqfaFs+M
 tHsprxNUIl+niuqvWmc2laPrxdbJTVkcFI4dLY0I9HIBavxiPTZvva1EEArP/ycAg9ZV
 TW18buTQ00ACVwgGNdyIpCZttvESsgks2XTpRGZFEYgajVjF+WZvX4LuNSwZw3GniXyi
 PmW6f3af2eoC0EQw/fpNnZhJOkWfhv4F6+S0zhtL+A4jKus2Aa9SPsm6oEY74H7ZB3gN
 5DwUqrFSPxfVyNHJRhnaKWDHI14/pth/ncYCNNCIihB6tFLAxaAbGCycgzqkofAEQ03M
 9k6g==
X-Gm-Message-State: ACrzQf3/uPwh/IzIYVroBkqnHIcfpoXYMU3kSa6mi2oOPOMhNDH15B7P
 NJg7S/NDjLQzboLDjlhystxuAN5ZySmPzQ==
X-Google-Smtp-Source: AMsMyM48k7bEBwg6/Nt84s7fjHQ8uN7ljFbkBbY2pylHxLWFePuR4nfxqKFgTFEKPUZh12ZgIlg/9Q==
X-Received: by 2002:a05:6000:15cf:b0:230:ba81:cefc with SMTP id
 y15-20020a05600015cf00b00230ba81cefcmr26121432wry.544.1666716001783; 
 Tue, 25 Oct 2022 09:40:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/30] target/imx: reload cmp timer outside of the reload
 ptimer transaction
Date: Tue, 25 Oct 2022 17:39:28 +0100
Message-Id: <20221025163952.4131046-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Axel Heider <axel.heider@hensoldt.net>

When running seL4 tests (https://docs.sel4.systems/projects/sel4test)
on the sabrelight platform, the timer tests fail. The arm/imx6 EPIT
timer interrupt does not fire properly, instead of a e.g. second in
can take up to a minute to finally see the interrupt.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1263

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
Message-id: 166663118138.13362.1229967229046092876-0@git.sr.ht
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/imx_epit.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 2bf8c754b21..ec0fa440d72 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -275,10 +275,15 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
             /* If IOVW bit is set then set the timer value */
             ptimer_set_count(s->timer_reload, s->lr);
         }
-
+        /*
+         * Commit the change to s->timer_reload, so it can propagate. Otherwise
+         * the timer interrupt may not fire properly. The commit must happen
+         * before calling imx_epit_reload_compare_timer(), which reads
+         * s->timer_reload internally again.
+         */
+        ptimer_transaction_commit(s->timer_reload);
         imx_epit_reload_compare_timer(s);
         ptimer_transaction_commit(s->timer_cmp);
-        ptimer_transaction_commit(s->timer_reload);
         break;
 
     case 3: /* CMP */
-- 
2.25.1


