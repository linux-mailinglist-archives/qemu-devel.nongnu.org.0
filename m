Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165F34C9ABE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 02:53:57 +0100 (CET)
Received: from localhost ([::1]:42490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPEBg-0001Xv-5p
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 20:53:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3i80eYgYKCrgrgrsqpemmejc.amkocks-bctcjlmlels.mpe@flex--titusr.bounces.google.com>)
 id 1nPE91-0007MM-L9
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:51:11 -0500
Received: from [2607:f8b0:4864:20::b49] (port=54141
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3i80eYgYKCrgrgrsqpemmejc.amkocks-bctcjlmlels.mpe@flex--titusr.bounces.google.com>)
 id 1nPE8z-0004yf-Bo
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:51:11 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 b12-20020a056902030c00b0061d720e274aso158852ybs.20
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 17:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=GlIJF2b8Drq45++1hxBTKoEZIPJ8E+QjOj/1FgeYUhM=;
 b=muZibxf298oqgP//MOYsu0QhspwgRNMM8vkRn4vvB7vgRQHKIzCmCC3uU4FZ1vofWp
 KO4g98tDJ+gja7v0FznfIjKaanStB0xifyxM2PxVW+Do0vqf+yC5L44ZwK7FVt2Gr1at
 JWYi3ybZ7lmxjUzeDSgKYc/JkBZ5lkwpAZSm17eNdztcmvQSgrv5D97vFz0pNa/P4FPc
 XpvQvuOeAF4Nf1l7fGXLq0hzITvNSAIVqjO/2ZgTLpOTrPgAGEjG+jW+aVejWGm1+CHt
 JYdkQC+lp89bqpWofbjKCLxOGZbv4GgqK3pHojV3tYZBxw3ffSy3FDFABs/ZaDA+kIjO
 xIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=GlIJF2b8Drq45++1hxBTKoEZIPJ8E+QjOj/1FgeYUhM=;
 b=W+OCgMGRM1p03Xa5sE+qqRZwmACyiRjkJCZzaKPnWxauuw1UprbUwtmEfE7iMAXU8U
 wWaPDqJy0BqeST8umUT8JcpyjOCLErm3WUKadopXKOfYFwO0luvi9dEH8gbgGRcYge+/
 JvgV6MtFjTxlVnLZuUf7rW3l5vXPqROjKljS3Vq9kRAOfU0tG/HHMmdpVzM92+4wcus/
 LmAsTu9AhXCWmBWj+nrxm7F5mFeC8LEljKOrBs7udgU9gdiu0LAGuBcRoo16gLZfIA0a
 lDFE4XVBiTUWfdlqBdZnbIbH+DBaY+JYAUiI0XJ7wQZ4GAOl7bxoPrvs0Se6hJ1F0/B6
 DaSA==
X-Gm-Message-State: AOAM533a1yqAVPV3p9eBcLxLBuc00pfCRzAe2cOjbB7APAje7XV7k7qf
 2kDDrkUxussNhuD+HWVkeUb9jRWcVdY=
X-Google-Smtp-Source: ABdhPJxZpHg//+IbUsCWxFujNDCKNSdTLz9hwZQRA8yNedVdJVYKfEFvtcsHTaD9eHJ5UGK38dAVJMA/DDM=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a25:b18e:0:b0:624:62c1:be56 with SMTP id
 h14-20020a25b18e000000b0062462c1be56mr26991882ybj.624.1646185867848; Tue, 01
 Mar 2022 17:51:07 -0800 (PST)
Date: Tue,  1 Mar 2022 17:50:47 -0800
In-Reply-To: <20220302015053.1984165-1-titusr@google.com>
Message-Id: <20220302015053.1984165-4-titusr@google.com>
Mime-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v3 3/9] hw/i2c: pmbus: add PEC unsupported warning
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3i80eYgYKCrgrgrsqpemmejc.amkocks-bctcjlmlels.mpe@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 93c746bab3..6eeb0731d7 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -307,6 +307,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
 
     case PMBUS_CAPABILITY:
         pmbus_send8(pmdev, pmdev->capability);
+        if (pmdev->capability & BIT(7)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: PEC is enabled but not yet supported.\n",
+                          __func__);
+        }
         break;
 
     case PMBUS_VOUT_MODE:                 /* R/W byte */
-- 
2.35.1.616.g0bdcbb4464-goog


