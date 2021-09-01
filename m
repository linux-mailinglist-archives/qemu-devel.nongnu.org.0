Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048623FD89D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:21:53 +0200 (CEST)
Received: from localhost ([::1]:33918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOJU-00027F-1m
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNce-0007EF-7U
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:36 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcX-00061z-Js
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:35 -0400
Received: by mail-wr1-x434.google.com with SMTP id t15so3734191wrg.7
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ckp80nlDU4/ey/A8MJ/XLY8rFcOiqC46e1I8EaAN4Kw=;
 b=B5RkjGbrsmxikKlMRG2RmL+UfeDS6lh6J/oLs5V/yD3UDu8A9QpKRs2zcIStAgmY6B
 BLlGsft31OeG8mjjsl25rFmgkEYoBflOPZngdVMS8JVyjQ/mnOh/bj/A6wQdNmw+5qHZ
 Oq+kCfIOQpT5TzIOejvkPFbj6ruqxLKep+spikSRNTdDwBKHYlBuH9cGs8B5zGvKyJKt
 kz42mrYP1JaGjjCgTCqxCgGjWxQq5woU0uu5AYpgZ0m+twNpIuXLSZusdoyoZGAdV8f7
 IImH0Djwi16HHSMfhLP5WRAO55zUsTWlSf9FYt7nCnA05AiLd9EBvz3dKMHaWvx2td38
 f3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ckp80nlDU4/ey/A8MJ/XLY8rFcOiqC46e1I8EaAN4Kw=;
 b=ooptzRgmPsErjjBMAId/7zYAx1iPjbJBvFhNyimGN+7sQGnWxzuYZZhyPjUGUima4i
 yOpN+nEbtRwHg3pfcyleVaG29bK9Zc/MHGhKk+6J21c0J4z50eKBURo/LFB+Cwjbsmg6
 e2t/xb5pp1JCwh3XgF5EIPrQPUWpCnH5rczqv/L9ZfZbpvRSayGrEzN0Ss56Bm3MHkAt
 boTd4p/iV0BfAip9F5UHBOQyn/+rk/27MD/Hpj5K/R+xmx/krninNVfqNhmsAMhwlALk
 mPS5AIx1HBCtbm646Q9oMGZJ7iwhybGF/Ghu2ojaN2UpudWVAP+HcbWx6Q/s6iPEERyD
 MR4g==
X-Gm-Message-State: AOAM531Mma6VJ96XDlDEEK3dhQRLuVlg2budo0uN7goH2uLfpgrMJC/9
 X/pn9LWCcTI1zb8KoqEJymo07kBMiLZ8UQ==
X-Google-Smtp-Source: ABdhPJzDLt5/kmzUQP/pv6i4PC/9deV4PuoMoKmPAePorFLS8BJAEiCQ7eWCesz+rshZrNRR5Jpy3Q==
X-Received: by 2002:a5d:674b:: with SMTP id l11mr36701521wrw.357.1630492648260; 
 Wed, 01 Sep 2021 03:37:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 48/51] hw/arm/stellaris: Fix code style issues in GPTM code
Date: Wed,  1 Sep 2021 11:36:50 +0100
Message-Id: <20210901103653.13435-49-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Fix the code style issues in the Stellaris general purpose timer
module code, so that when we move it to a different file in a
following patch checkpatch doesn't complain.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>
Message-id: 20210812093356.1946-23-peter.maydell@linaro.org
---
 hw/arm/stellaris.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 8c8bd39e2fe..a32c567ce11 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -97,10 +97,11 @@ static void gptm_stop(gptm_state *s, int n)
 static void gptm_reload(gptm_state *s, int n, int reset)
 {
     int64_t tick;
-    if (reset)
+    if (reset) {
         tick = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    else
+    } else {
         tick = s->tick[n];
+    }
 
     if (s->config == 0) {
         /* 32-bit CountDown.  */
@@ -227,9 +228,11 @@ static void gptm_write(void *opaque, hwaddr offset,
     gptm_state *s = (gptm_state *)opaque;
     uint32_t oldval;
 
-    /* The timers should be disabled before changing the configuration.
-       We take advantage of this and defer everything until the timer
-       is enabled.  */
+    /*
+     * The timers should be disabled before changing the configuration.
+     * We take advantage of this and defer everything until the timer
+     * is enabled.
+     */
     switch (offset) {
     case 0x00: /* CFG */
         s->config = value;
-- 
2.20.1


