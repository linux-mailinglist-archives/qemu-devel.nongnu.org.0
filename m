Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BBA69E50E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:47:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUVmb-00009b-9i; Tue, 21 Feb 2023 11:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pUV9A-0001pQ-09
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:05:40 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pUV98-0007us-9v
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:05:39 -0500
Received: by mail-pl1-x62c.google.com with SMTP id u14so1620671ple.7
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 08:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWTW2+Ca/8ToXaJenUu+hnPBUwSEF/3VL/OdDDLKkQY=;
 b=AzgcEAGesvcr286TzK6pR7aaG70kJVFaGt8yGdM83r9y+bPBcTkdp9jiGFCYaQkCkr
 6LmMm/hgToCUfhGHRoKsATWp1TMal/0HoWV1IgmZjyzgZy37j3Ze5L00HAfOuf5gX0gA
 aT8ihlJAk8+Fn/tgQaN19qkt3Mm0d0j9DD/AuH6wz4Xat8g36svvyngFj+0aKznmOdzT
 Xo6g0+Ot1cNVI+En6iNdB7FHQ6k4y54kLktU4IV0yqiu9UeLPER3w52h4vYIfOARC0kX
 /y6KZp7mfq8xQ9Di9iHrzAdQm6hG+hfM+vhThfToaJXK1zh5S4ddalxD7ITQtPeODluJ
 T1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWTW2+Ca/8ToXaJenUu+hnPBUwSEF/3VL/OdDDLKkQY=;
 b=vPSLi9jJtUvsb+G86mrAS+fDGjGsL4KMzsIAwNckkncw760ayHyxPGxXOxaZzrsF22
 95i/DJNKsfGJOvCoDIki9h//2vkiT9FMMqmwLbCIMI1YaUJfx8rtQ7njrgXyXl96Vf7T
 33wZHTb3JlnVAmYwUp4Gex4K20H7efZXsSgYgj1wjvTQJinmtL/QVSiF5vFrOBVAs4Wu
 BXYwCxo46hD9MTxQm4lfTvLH3T/LyFCUy+TIP5IMmQhetK3dH1DYotOeLf7cb6WWnYyb
 goVAOiogrxCZixk+8q0oWxlfmkYnqAe+8RXxHPEj7b88kDCKWdunfahJ4V3YBnpZTlLi
 qrwQ==
X-Gm-Message-State: AO0yUKUzLw9P9zfkK9Wz2z3Tv2f1dMap3Wg/f2Xbe8nLU/UzmE3ZCO6w
 94ylQsCYT6AhgYGdmVhAYrmkPq+muDA/iw==
X-Google-Smtp-Source: AK7set9yAwU9lBee3KmH2MmjGn2/wgxwTgtr3NftUJ4JrRHTJkda/oJs03yQgMcXRFVGmC0ihyo/nA==
X-Received: by 2002:a17:902:e84b:b0:199:1160:956c with SMTP id
 t11-20020a170902e84b00b001991160956cmr5618795plg.31.1676995536159; 
 Tue, 21 Feb 2023 08:05:36 -0800 (PST)
Received: from localhost.localdomain ([113.173.97.170])
 by smtp.googlemail.com with ESMTPSA id
 b15-20020a170902650f00b001943d58268csm10076295plk.55.2023.02.21.08.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 08:05:35 -0800 (PST)
From: Bui Quang Minh <minhquangbui99@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bui Quang Minh <minhquangbui99@gmail.com>
Subject: [PATCH 3/4] intel_iommu: allow Extended Interrupt Mode when using
 userspace local APIC
Date: Tue, 21 Feb 2023 23:04:59 +0700
Message-Id: <20230221160500.30336-4-minhquangbui99@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221160500.30336-1-minhquangbui99@gmail.com>
References: <20230221160500.30336-1-minhquangbui99@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Feb 2023 11:46:13 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As userspace local APIC now supports x2APIC, intel interrupt remapping
hardware can be set to EIM mode when userspace local APIC is used.

Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
---
 hw/i386/intel_iommu.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 98a5c304a7..228a944bce 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -4026,17 +4026,6 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
                       && x86_iommu_ir_supported(x86_iommu) ?
                                               ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
     }
-    if (s->intr_eim == ON_OFF_AUTO_ON && !s->buggy_eim) {
-        if (!kvm_irqchip_is_split()) {
-            error_setg(errp, "eim=on requires accel=kvm,kernel-irqchip=split");
-            return false;
-        }
-        if (!kvm_enable_x2apic()) {
-            error_setg(errp, "eim=on requires support on the KVM side"
-                             "(X2APIC_API, first shipped in v4.7)");
-            return false;
-        }
-    }
 
     /* Currently only address widths supported are 39 and 48 bits */
     if ((s->aw_bits != VTD_HOST_AW_39BIT) &&
-- 
2.25.1


