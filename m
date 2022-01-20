Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05380495444
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:37:03 +0100 (CET)
Received: from localhost ([::1]:56330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAcIv-0002sD-RV
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:37:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgW-0004G4-NF
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:02 -0500
Received: from [2a00:1450:4864:20::335] (port=37566
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgU-0003HZ-Or
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:00 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso21599637wmj.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=j8Qp4NuYu0YJhHUjPY9NQXtXjfHNFnQLrtAOoxiHuYQ=;
 b=LSNtpn9QM+Uo+XBQ5jseyw8sBh+09dGSBGWCsS1CeiptOIJSd9JoH1of2NDDCc4h9/
 L+q2OwBSvJtm8frZ2EQSaoD0QscScN051PecyFGvE3WYHFXLwzrjHmUjd2AAQmSBCfbJ
 7XwzyNoHUQryuDL+zTpph9X2NLBytHiuQb0cEJ88Gy2Mku0ww6vCQNic7jB0jpMgeVWV
 urqQK/Jyhio8GK/n6Cu/73v3KXwEn5jorUFa6TN8DYNwgs3khufeExiEGrFL/Foo74/0
 4+Tf3LuGXF1LWvuuQxd2oveKGwTULafQ2t327Yow9etveQzFlyWQRWcI8nTZYd/J+QNH
 kfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j8Qp4NuYu0YJhHUjPY9NQXtXjfHNFnQLrtAOoxiHuYQ=;
 b=S+s5vvAo0hqvQR9O8Kip3XldNZozdQhQ5q9qGyEBpS9TRPJd6uxXq4bGn6X1T4Sxra
 b4I6eXoQGDovbdTfGCEB4g9XSIbbo+IVb/4FiXvWE/2rpPeDHN5/H3G0+f3kDln+x+qs
 vxMuGkRd93ToSQ1Gx+a1HnJwh1LXGkaRT3xD7NawGpp7RDrYzmjgvN8q5LXWw0uc9ix+
 p53SzWnaoHczL/gRqtLKKK2wCiTU8oZAdF4qy8avSqbnaIJ0zePaMzNXsa3lT28y9qFI
 +emHR3LI/mwjEjhvrcyNWA7Wr5GNPkMTeOERIJxGUBlkVDEU75ljjVoBbA4C3YhqqTFM
 beaQ==
X-Gm-Message-State: AOAM531wo3jYxdEZmutPMlQjGc39HXYUrUa0xuqJTSSwLN7ZiZzK1dlp
 Bn7SzUYx8wzkl3oOS51MMOV3XK7g4AQAiA==
X-Google-Smtp-Source: ABdhPJwJaG0RiI+byotdZODeUKzwS8jLAD2v0ndgxvedAYNlRTF3k1JN4fKNzmRxIJU432BGQICjQw==
X-Received: by 2002:a5d:5601:: with SMTP id l1mr33999201wrv.213.1642682217519; 
 Thu, 20 Jan 2022 04:36:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/38] hw/arm/virt: Disable highmem devices that don't fit in
 the PA range
Date: Thu, 20 Jan 2022 12:36:12 +0000
Message-Id: <20220120123630.267975-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Marc Zyngier <maz@kernel.org>

In order to only keep the highmem devices that actually fit in
the PA range, check their location against the range and update
highest_gpa if they fit. If they don't, mark them as disabled.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20220114140741.1358263-6-maz@kernel.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8627f5ab953..8d02c2267d0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1719,21 +1719,43 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
         base = vms->memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES;
     }
 
+    /* We know for sure that at least the memory fits in the PA space */
+    vms->highest_gpa = memtop - 1;
+
     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
         hwaddr size = extended_memmap[i].size;
+        bool fits;
 
         base = ROUND_UP(base, size);
         vms->memmap[i].base = base;
         vms->memmap[i].size = size;
+
+        /*
+         * Check each device to see if they fit in the PA space,
+         * moving highest_gpa as we go.
+         *
+         * For each device that doesn't fit, disable it.
+         */
+        fits = (base + size) <= BIT_ULL(pa_bits);
+        if (fits) {
+            vms->highest_gpa = base + size - 1;
+        }
+
+        switch (i) {
+        case VIRT_HIGH_GIC_REDIST2:
+            vms->highmem_redists &= fits;
+            break;
+        case VIRT_HIGH_PCIE_ECAM:
+            vms->highmem_ecam &= fits;
+            break;
+        case VIRT_HIGH_PCIE_MMIO:
+            vms->highmem_mmio &= fits;
+            break;
+        }
+
         base += size;
     }
 
-    /*
-     * If base fits within pa_bits, all good. If it doesn't, limit it
-     * to the end of RAM, which is guaranteed to fit within pa_bits.
-     */
-    vms->highest_gpa = (base <= BIT_ULL(pa_bits) ? base : memtop) - 1;
-
     if (device_memory_size > 0) {
         ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
         ms->device_memory->base = device_memory_base;
-- 
2.25.1


