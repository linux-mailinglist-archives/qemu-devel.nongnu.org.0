Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8CE52DBDB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:51:02 +0200 (CEST)
Received: from localhost ([::1]:59260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkIg-0005yc-1L
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5B-00069I-57
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk59-0000rH-Go
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:04 -0400
Received: by mail-wr1-x435.google.com with SMTP id j24so8228091wrb.1
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0MRYFoKHH0P6fTCSzGiTG9Fn0htP7R7Lw2a3huhksuM=;
 b=OUmpkIOB9hN+4e0Az+SxB4ddaldcTS5H539sSzQO3wi21AoZhsJmouvLw1GkcXATPm
 I1x6FKA47q28O3IsWVTSra1i3cv6Y3W5wPyWjwTqmVcqxlkmpsepS7vo7kwqRYjBmeaR
 chprpjaOz+CX+Fn/VB4rT/H9YwMbKmMuuDWGjzsltCtI8xVT2QqyKu2T57l8P7Ya3/cY
 tykz6yKTe1PDi5JBH7sGQj4+l5L+CE3ECTNFyIGC7qjrTc4gKUape+ehphvy10zbWL70
 RU1TOoEz5qAXzIFugQydIli/JR99EiikNvnqWBFxHQDqO2q71/sDpDZkH3FfkI/v8SJY
 q2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0MRYFoKHH0P6fTCSzGiTG9Fn0htP7R7Lw2a3huhksuM=;
 b=Qhldggskd48be7ctkioemSKYFPO6klQwyHp9J21xYy6U645P+UuHCDwTS0BXWH3aIr
 1jbokFUYVy2yC5AkTUPVrcIFR1t0z2YDV76xR1uMwa7uN9liV51hcJYXYi3SvTVfCyuo
 9vF/9HAeHmxb58s2zRQ7TbChecunSYcwMUwd89GPYYyKHWXVNqbPP6iBdOd4Zz2FmY6R
 lISRbQotFE2+bNT2JmYKsdcsW9O9nYWoHO1BpCnv8/xLPUgQb1biyrhQlNkqIOYcKuNC
 4XG9imCuoELy1H4UiYgTeVHIYqmFxieiT5QPSUqJdev2C1bLMoF6DZV/4XCtPEtyRI9S
 t8ag==
X-Gm-Message-State: AOAM533qzsbyw6GRwQ5QvkXy8abRW+ctxS8USl3YBQNEL/PJgJ7+ds6O
 NuYBnJ/NFHopcAGUglDIVXNTUW70aysKYA==
X-Google-Smtp-Source: ABdhPJx8MlFfPNEm9VYJ+0ywDQ1F0qixcUOWg0nrbPSfMSggMykFY31E/Zp0aeMeY5CDJlPeUEFzIA==
X-Received: by 2002:a05:6000:1e09:b0:20e:6f3e:d887 with SMTP id
 bj9-20020a0560001e0900b0020e6f3ed887mr2914469wrb.628.1652981821224; 
 Thu, 19 May 2022 10:37:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.37.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:37:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/22] hw/intc/arm_gicv3_kvm.c: Stop using GIC_MIN_BPR constant
Date: Thu, 19 May 2022 18:36:38 +0100
Message-Id: <20220519173651.399295-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

The GIC_MIN_BPR constant defines the minimum BPR value that the TCG
emulated GICv3 supports.  We're currently using this also as the
value we reset the KVM GICv3 ICC_BPR registers to, but this is only
right by accident.

We want to make the emulated GICv3 use a configurable number of
priority bits, which means that GIC_MIN_BPR will no longer be a
constant.  Replace the uses in the KVM reset code with literal 0,
plus a constant explaining why this is reasonable.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220512151457.3899052-4-peter.maydell@linaro.org
Message-id: 20220506162129.2896966-3-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_kvm.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 2922c516e56..3ca643ecba4 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -673,9 +673,19 @@ static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
     s = c->gic;
 
     c->icc_pmr_el1 = 0;
-    c->icc_bpr[GICV3_G0] = GIC_MIN_BPR;
-    c->icc_bpr[GICV3_G1] = GIC_MIN_BPR;
-    c->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR;
+    /*
+     * Architecturally the reset value of the ICC_BPR registers
+     * is UNKNOWN. We set them all to 0 here; when the kernel
+     * uses these values to program the ICH_VMCR_EL2 fields that
+     * determine the guest-visible ICC_BPR register values, the
+     * hardware's "writing a value less than the minimum sets
+     * the field to the minimum value" behaviour will result in
+     * them effectively resetting to the correct minimum value
+     * for the host GIC.
+     */
+    c->icc_bpr[GICV3_G0] = 0;
+    c->icc_bpr[GICV3_G1] = 0;
+    c->icc_bpr[GICV3_G1NS] = 0;
 
     c->icc_sre_el1 = 0x7;
     memset(c->icc_apr, 0, sizeof(c->icc_apr));
-- 
2.25.1


