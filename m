Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 022C86DC064
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 16:43:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plWFd-0004Qb-S2; Sun, 09 Apr 2023 10:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1plWFb-0004PQ-Dv
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 10:42:39 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1plWFZ-0000oq-VY
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 10:42:39 -0400
Received: by mail-pj1-x102c.google.com with SMTP id c3so2888367pjg.1
 for <qemu-devel@nongnu.org>; Sun, 09 Apr 2023 07:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681051356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=daXUQhYr/lJl2shhoQ6P5QMPeeWhQkMAH/077BsEr44=;
 b=apV+dC8hg8BQ9p01TvPGkkXuui8g8Fds6EzKkn9MIU6wQnXaMMG9mHkBDxpmI9GeD5
 kH0/bOYl7vA0QqUax3lFzzZzNCaKUOvh4loBhlPKjgCZifNUr6hMeW3hZrQ8fw4fekpr
 d8ZX6MT6wXFiG2JnUoljgQl0CNT0dmklvO96KjPSIy647Gp0nbpfuDRr5NoUvXx/+poq
 6v3lytpVbfDA39Id0A/ps1MCh4xZaky8bKK52pzDPTF4MVGJ0d5nO9yjWowvWHYRjgwh
 H2+WDDtGQ5CfZtlxojCiF0UU1jZelO4pc78yp0lbZAGMxjFToGQqXDWNYyZJlUdNrk8X
 qtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681051356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=daXUQhYr/lJl2shhoQ6P5QMPeeWhQkMAH/077BsEr44=;
 b=7W1r6lxOhv/mmOV/POZGtmiJbbly3qiNQSUvcQ0fbvs9u2LdIYPLHS0w+NHbFZWHWY
 Uv3Cpmesv08XwSsYZALJjrHrrsDwo2U3QfxYLBOeBr6M7PdVg6t0JA9vk+1vSyOPhvMO
 p56JhEtXWqQ5nxqBvJrXE4sR59+WqRthpg2xm8PhsJYVVD9F6bz8ssaE0BXk/ADG0nX/
 7IvBnBZZuCzfSvjSWDWUfkkylHRzU1TIJIEG1KKhT1pj4yzJ26j63730oqa/gq+Xnyp9
 X8v1pApo6ZXHn1ZD8llNG9B6kbvK8Hmf8iU7eaUbGJ9Wbb9kNcSj4Jv9WwE4jLidjL0A
 7kLg==
X-Gm-Message-State: AAQBX9cky60i3YJkv9fpmh0R1WE33Ac//eeBFKjrJjpupW3wWhPSCYl6
 XcDeuWfRgrnCKxBswUIWHxBQm6yyT0Yr/A==
X-Google-Smtp-Source: AKy350bV6bfN1LcRFZA7h/DhgLXW7bAg5y1JARIc9Lgbp/pUJgIb2+upkZSbgRSAAFxR/i2wVUl6tw==
X-Received: by 2002:a05:6a20:4659:b0:da:c40:8d6 with SMTP id
 eb25-20020a056a20465900b000da0c4008d6mr7917304pzb.0.1681051356248; 
 Sun, 09 Apr 2023 07:42:36 -0700 (PDT)
Received: from localhost.localdomain ([113.173.97.170])
 by smtp.googlemail.com with ESMTPSA id
 k5-20020aa790c5000000b0062e00158bf3sm6369804pfk.175.2023.04.09.07.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Apr 2023 07:42:35 -0700 (PDT)
From: Bui Quang Minh <minhquangbui99@gmail.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw2@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bui Quang Minh <minhquangbui99@gmail.com>
Subject: [PATCH v3 4/5] intel_iommu: allow Extended Interrupt Mode when using
 userspace APIC
Date: Sun,  9 Apr 2023 21:41:55 +0700
Message-Id: <20230409144156.8313-4-minhquangbui99@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230409144156.8313-1-minhquangbui99@gmail.com>
References: <20230409144156.8313-1-minhquangbui99@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As userspace APIC now supports x2APIC, intel interrupt remapping
hardware can be set to EIM mode when userspace local APIC is used.

Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
---
 hw/i386/intel_iommu.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index a62896759c..fd7c16b852 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -4045,17 +4045,6 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
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


