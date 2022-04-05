Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A350D4F456C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 00:44:52 +0200 (CEST)
Received: from localhost ([::1]:41522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbrut-0007Ta-Pe
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 18:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3zsRMYggKCqMZXKDRWVKJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--wuhaotsh.bounces.google.com>)
 id 1nbroU-0004FN-Eo
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 18:38:15 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:34657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3zsRMYggKCqMZXKDRWVKJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--wuhaotsh.bounces.google.com>)
 id 1nbroS-000321-2d
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 18:38:14 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 y26-20020aa793da000000b004fb7c6f5d10so445588pff.1
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 15:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=4lqFJfMyhM5gSqksn2scdDmPoQUw1eXlvt2iNImqMZo=;
 b=NkBN9HzCvrPiJUXUlaFo+UKNf6vHPCa7lbPQAeayYzaPskdNrBj5EhmgUNZIQMYsRG
 qcZ2gMCW+WKcnecwaYcidX8Pk/GAaIEz2DHNvU91o0jAD8oeTTVSPN0Knjl9nFklUi+i
 L3YzC8Bxsvc9y2lTiggaYkycGSfPq0+tlYMiQoVLdXeX8Mn8jcFN+U5OUhurTC5BhAP0
 STpwKwVY4wE1QwLtYlRBzII8+SZeD7xSO7zbf8Lr453QKx69iQdjQNYD+ztmi7VL75yh
 EUtAVc7B2Oo2uciIZPZSre95cbbXaOTsMzJJ8HIk9bYfn1aH394UCK+BKNV3ZjsyuG5L
 XnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=4lqFJfMyhM5gSqksn2scdDmPoQUw1eXlvt2iNImqMZo=;
 b=LQ56Qrt94I2IHuGM1sQAE15y0gtj1+ZgQzKoNTr/qJKkFQAixmQBzYc/ausZYg6m+0
 x53ObPZYbrx+WHvUVlbjsYz7l8v+zAGFzeX/6w5PAouiLBTVCawd9gL8JpFLr7OzMNUX
 VIyjnIFsqUIIqLra68K+abLFpp2jVzcKvY1w9SApp0zJ2sSXOLKXs09JaQEYOT0OgZX6
 ZISnexOWF3rtwK2TCCac7mFtYrjMxScLYOzeuSqsyXZu5lYj8MZNJWBGYtxDbQVN40Yk
 aiRbuJgJp2OfD4E3kV9jGWAM0NxIJa7FQU037Ro+ezr/eR5+VSRtfZ6K3kfa/eg8ko9a
 MbKA==
X-Gm-Message-State: AOAM533bKQzC2io5kEnOXyEWsZXDqMUl6bxJACtEUG04QqSClraS4q70
 TTgR8kJVcPSKGX8A0hKQKjxDgOlfXpjgyg==
X-Google-Smtp-Source: ABdhPJzGwjyQB8yFJyT/NYQRUohdtzSIg3Lr/RQCShxna7awGJMQbDAcxDTUd/j7cGVocTp42+QAFthd8N/4tA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:858b:b0:1c6:5bc8:781a with SMTP
 id m11-20020a17090a858b00b001c65bc8781amr69727pjn.0.1649198286447; Tue, 05
 Apr 2022 15:38:06 -0700 (PDT)
Date: Tue,  5 Apr 2022 15:36:35 -0700
In-Reply-To: <20220405223640.2595730-1-wuhaotsh@google.com>
Message-Id: <20220405223640.2595730-7-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH for-7.1 06/11] hw/intc: Add a property to allow GIC to reset
 into non secure mode
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3zsRMYggKCqMZXKDRWVKJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

This property allows certain boards like NPCM8xx to boot the kernel
directly into non-secure mode. This is necessary since we do not
support secure boot features for NPCM8xx now.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/intc/arm_gic_common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 7b44d5625b..7ddc5cfbd0 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -358,6 +358,8 @@ static Property arm_gic_common_properties[] = {
     /* True if the GIC should implement the virtualization extensions */
     DEFINE_PROP_BOOL("has-virtualization-extensions", GICState, virt_extn, 0),
     DEFINE_PROP_UINT32("num-priority-bits", GICState, n_prio_bits, 8),
+    /* True if we want to directly booting a kernel into NonSecure */
+    DEFINE_PROP_BOOL("irq-reset-nonsecure", GICState, irq_reset_nonsecure, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.35.1.1094.g7c7d902a7c-goog


