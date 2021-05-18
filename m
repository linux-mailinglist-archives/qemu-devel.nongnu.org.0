Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0C63880C4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:51:07 +0200 (CEST)
Received: from localhost ([::1]:56378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5kA-0006YZ-S6
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3yhmkYAcKCpkO7GMNK79HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--venture.bounces.google.com>)
 id 1lj5gj-0007z3-QN
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:47:33 -0400
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49]:34505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3yhmkYAcKCpkO7GMNK79HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--venture.bounces.google.com>)
 id 1lj5gb-00079A-RZ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:47:33 -0400
Received: by mail-qv1-xf49.google.com with SMTP id
 f17-20020a0cf3d10000b02901eda24e6b92so8277483qvm.1
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=1R4OqYgXALabVeS1jjyB5oy/+6Sj3iQ62rsKQF+LgxI=;
 b=Sk77cjIGQyY9yV3nr7g6YR0KnAHpng7S9Qf4iEH7CG2Oc6CZboVJGQgxCLKeg6x1vK
 iUy5WDpCQfFQxDW2JDo/hzw5ZHFQUn4P83Xhxhq4UKDwg6y+lkoleVjgNwIkX0xvDq4U
 sD4C+aoF7XVnRCb+6/2aMI5jIPCLumLRiba5BvHFFnPfPaKkyb+tZEv5DrG+zj6T2Yfr
 qfsFplwmMbQVR40jZhSLsBsT0ixITgfqiGWNM0G7lecw+PpAqkS2Kkt/nDn/Pq0Dk4my
 8E18Hi74alLZqsWVHjKd3v8I8kYaXItaqHsXny7ZU1EXrcoHCLXZxyuVNkJoroMDXIqH
 RPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=1R4OqYgXALabVeS1jjyB5oy/+6Sj3iQ62rsKQF+LgxI=;
 b=dPY01HY2tfvdRgnLfRpSmeLgz7DvvOgyJdZhX5IA5hyVq+jNEzK8Ndg+Y1XCdGUlBf
 t/WX6MhGGMnkoYdnJeJfDydnuadQezY26q6ykdNhBhgjBJb1J447tYMXT0rD2HHaqsUv
 64AzH7wH5vlIJrNsPT1vGdkSjHiYFDNdeB+/hi2RQLF1vhBIm0IDJT0YxRaWRtjcc2ZP
 zx+dXGmxz1QB3Fe3IlFhW2KVQ5iVaUtAhodsNvXt0QcRuP1tSDclmUJbS1tEgd4irtCa
 xfs7OYgoUb3QS2LUeVyofVuFj+5COTzuhBylezOKWCXAqVyYRSbVUHMqJH3aavcEsNQh
 t5wg==
X-Gm-Message-State: AOAM532dUDtqKa5LlQJG3s5zs/Xev/GSyE8SyTGmBlIymMvrOcFF5t9W
 ym2sAZdiCSHubbtm9cjwoyBPOdnaB5WC
X-Google-Smtp-Source: ABdhPJyuG+y9N0sP9rOVa3gOqjPnEOFA1IGeH7258RgYz5tyhmksj81u1aR/OX5kFxXWOU5V1h/qs/kCZJ5Z
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:5902:8a04:d917:4e93])
 (user=venture job=sendgmr) by 2002:a0c:cdc8:: with SMTP id
 a8mr7897551qvn.12.1621367242071; Tue, 18 May 2021 12:47:22 -0700 (PDT)
Date: Tue, 18 May 2021 12:47:04 -0700
In-Reply-To: <20210518194704.764241-1-venture@google.com>
Message-Id: <20210518194704.764241-3-venture@google.com>
Mime-Version: 1.0
References: <20210518194704.764241-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH 2/2] hw/arm: quanta-gbs-bmc add i2c comments
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Brandon Kim <brandonkim@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f49;
 envelope-from=3yhmkYAcKCpkO7GMNK79HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--venture.bounces.google.com;
 helo=mail-qv1-xf49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

Add a comment and i2c method that describes the board layout.

Tested: firmware booted to userspace.
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Brandon Kim <brandonkim@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 60 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 34a214fe79..d9de375826 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -238,6 +238,65 @@ static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
     npcm7xx_connect_pwm_fan(soc, &splitter[2], 0x05, 1);
 }
 
+static void quanta_gbs_i2c_init(NPCM7xxState *soc)
+{
+    /*
+     * i2c-0:
+     *     pca9546@71
+     *
+     * i2c-1:
+     *     pca9535@24
+     *     pca9535@20
+     *     pca9535@21
+     *     pca9535@22
+     *     pca9535@23
+     *     pca9535@25
+     *     pca9535@26
+     *
+     * i2c-2:
+     *     sbtsi@4c
+     *
+     * i2c-5:
+     *     atmel,24c64@50 mb_fru
+     *     pca9546@71
+     *         - channel 0: max31725@54
+     *         - channel 1: max31725@55
+     *         - channel 2: max31725@5d
+     *                      atmel,24c64@51 fan_fru
+     *         - channel 3: atmel,24c64@52 hsbp_fru
+     *
+     * i2c-6:
+     *     pca9545@73
+     *
+     * i2c-7:
+     *     pca9545@72
+     *
+     * i2c-8:
+     *     adi,adm1272@10
+     *
+     * i2c-9:
+     *     pca9546@71
+     *         - channel 0: isil,isl68137@60
+     *         - channel 1: isil,isl68137@61
+     *         - channel 2: isil,isl68137@63
+     *         - channel 3: isil,isl68137@45
+     *
+     * i2c-10:
+     *     pca9545@71
+     *
+     * i2c-11:
+     *     pca9545@76
+     *
+     * i2c-12:
+     *     maxim,max34451@4e
+     *     isil,isl68137@5d
+     *     isil,isl68137@5e
+     *
+     * i2c-14:
+     *     pca9545@70
+     */
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -282,6 +341,7 @@ static void quanta_gbs_init(MachineState *machine)
     npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
                           drive_get(IF_MTD, 0, 0));
 
+    quanta_gbs_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.31.1.751.gd2f1c929bd-goog


