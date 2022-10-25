Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA48960D1EC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:49:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMzf-0007Ua-PJ; Tue, 25 Oct 2022 12:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMz1-0006e0-7n
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:55 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyf-0001km-LL
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:50 -0400
Received: by mail-wr1-x432.google.com with SMTP id bs21so6188375wrb.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Eln4ge06npuUpSMBwWAzr3VNU4hXMayNTGSGJ/gD114=;
 b=BI0z7qfQhZWPTltWMDsSY5di33s5cPeKHWgi5xTObpmqyYVM20k/xF6bl26N9oHQOQ
 R4TvZml04Yp4xNxZUwqma5WyEDbc2NGYm4EWf50R7Z0vXtooNE4tadhsP3KNZwOln1yH
 ifC784TLE65j2S9Ly32+pD/I2h7Rv1nFpLO818P6kmCmuhy/UEvwo4EaNCEKAIwZOOXT
 AbMpR089TM+iORgrblHvJNtHpzXQU9pFKM4PzNf0aCHy4q2uHlNa08l07HCyzlJVWl9N
 8tZRx1QZHxVrJbSlsplM1YYnn4v4/ViUyeQ4t2CxFTBmw6qxKrB2hI/ViHtuCEgOqfr9
 JCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eln4ge06npuUpSMBwWAzr3VNU4hXMayNTGSGJ/gD114=;
 b=wDkaYtGjSsjCKoR37g4I8TuEhdMPT/4wtvKo7SJGKg84F0NS8h7dLtV4o49P9DOwvu
 I4RmGKiuOeYNBBvuPAL+fOpI/jOYXBslyPzbqd5DWVIgUSxugQyc7GC8PuvTkKBc13qt
 R9/Ut1gyULV13xyBkup93okh7fn5lnRHJlEuqqh9hH12mIbgpi1+wK1oFIe+tsuXd4I6
 4MLtiGkJU0F3gGSUc0pJcOphQN6lEaeplHxA5OJ5ffWFjmrJ8IGkKqKd9DKypvULAKth
 ei3sakj5RsYNAgV3w7MVopR5nE8NeOrdT6SnUgvvPzdDr2gPKbGeGGJxBAF9w5llOQ+h
 F4Tg==
X-Gm-Message-State: ACrzQf3Yl8w+XV5iLV0CFRzLDiSlxM2ar/JTjHy4jmgRXsibGmpDM17M
 k0KbyxPYdIqpuwh3Lwo2HWanWgsha7nPXg==
X-Google-Smtp-Source: AMsMyM5H9izKxEgk0SSB8Ktb5G5H5NjZZ5WifwHgm5KjTFibtSrOc9XBOkn3XKl/G+WiRKt4qoprbA==
X-Received: by 2002:a05:6000:1143:b0:236:5ede:cdad with SMTP id
 d3-20020a056000114300b002365edecdadmr12723586wrx.410.1666716022828; 
 Tue, 25 Oct 2022 09:40:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/30] arm: re-randomize rng-seed on reboot
Date: Tue, 25 Oct 2022 17:39:46 +0100
Message-Id: <20221025163952.4131046-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

When the system reboots, the rng-seed that the FDT has should be
re-randomized, so that the new boot gets a new seed. Since the FDT is in
the ROM region at this point, we add a hook right after the ROM has been
added, so that we have a pointer to that copy of the FDT.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-id: 20221025004327.568476-5-Jason@zx2c4.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b0b92af1889..b106f314685 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -683,6 +683,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
      * the DTB is copied again upon reset, even if addr points into RAM.
      */
     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
+    qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
+                                       rom_ptr_for_as(as, addr, size));
 
     g_free(fdt);
 
-- 
2.25.1


