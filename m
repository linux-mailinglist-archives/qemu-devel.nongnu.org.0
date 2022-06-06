Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BEF53E54B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:05:52 +0200 (CEST)
Received: from localhost ([::1]:51154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEIh-0007HY-By
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrM-0002a2-T8
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr6-0000aZ-Mp
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xA/i6g37O3wV+vzWwv6rsvsUuDKo9ad/3Fy9sdDIcr0=;
 b=XbvtxOTludWlZ1aSqNeT0XUmGR9qzE07U8aU4A8NcqO3Cy73eSEgEDVh0UQVwIgVSyKWMl
 iVMWh88x/WiIyGpnmfBGSCk3tGNMkLYXDOpLrflMD/Yx/RBho+XfqVAXRRJbpSW6akCd7+
 yOlL1xrgFE+axQc6mw1KrBBUDvc590c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-X8pGle4JMnCh5aqIEgIquQ-1; Mon, 06 Jun 2022 10:37:19 -0400
X-MC-Unique: X8pGle4JMnCh5aqIEgIquQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n18-20020a05600c3b9200b00397335edc7dso11308534wms.7
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xA/i6g37O3wV+vzWwv6rsvsUuDKo9ad/3Fy9sdDIcr0=;
 b=Qo2FI/bD7uipZ6ApxgR6+Lp/gWo6pFOlv8jkxfKG9UFRkErhbfeP3WHlcdnym8L9NA
 rWmIkOd971dBQEArqOkB9KIb4gM7XDnKHhSXDMJiRjn1HafiMjfqNNsaiigs1eYFN9x7
 BUXND2YyNS5y6QvMMAMo+gsRCQeUfFhs0JSz5TnjkBrq+NNm9aezpZXQx0aanKlIT0Zo
 Hw/AP50T7lktdGrBlYqI8g/OZgqwACjB4q8+RaTVFZaIjw+1wY1hTFVSCjFdJqY0EvbH
 1P0ONFMzjJNYUttpAA92h9EjQZt6r2UZGquJ90dP3kM89gPkW+S3Q3IAsMeaw6Nku4wS
 5eIA==
X-Gm-Message-State: AOAM533PnW3oCFdho6pwFlVzwoDZ7B5LCqpnv8OWChS2OuVtXeZz8RIx
 MDNewtqFR7/+jyOodmRaJuum6VHCu1dMUtDxhJ3NXq60Q1ORbf9YeMSgNYMVt2YD17Ue8OKlQX/
 bSgXHOOvE2QTMvJ0ILRH1uLTNksNBkSalIHNArSGVqF2Asrm3I11y1IjmfTM9vp1CbBc=
X-Received: by 2002:a05:600c:190b:b0:394:880f:ae2c with SMTP id
 j11-20020a05600c190b00b00394880fae2cmr22769341wmq.79.1654526237239; 
 Mon, 06 Jun 2022 07:37:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNj298zCXzULXjjBPHChhDO2nYNTFoQ9ObBTRKB1Udlb9bA3DIq8R+oNtjG1BFi1PsiCCOfQ==
X-Received: by 2002:a05:600c:190b:b0:394:880f:ae2c with SMTP id
 j11-20020a05600c190b00b00394880fae2cmr22769304wmq.79.1654526236898; 
 Mon, 06 Jun 2022 07:37:16 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a5d69c8000000b002102b16b9a4sm15343292wrw.110.2022.06.06.07.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 16/29] x86: cpu: make sure number of addressable IDs for
 processor cores meets the spec
Date: Mon,  6 Jun 2022 16:36:31 +0200
Message-Id: <20220606143644.1151112-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Igor Mammedov <imammedo@redhat.com>

Accourding Intel's CPUID[EAX=04H] resulting bits 31 - 26 in EAX
should be:
"
 **** The nearest power-of-2 integer that is not smaller than (1 + EAX[31:26]) is the number of unique
    Core_IDs reserved for addressing different processor cores in a physical package. Core ID is a subset of
    bits of the initial APIC ID.
"

ensure that values stored in EAX[31-26] always meets this condition.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220524151020.2541698-2-imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9fdfec9d8b..94cc4a8700 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5287,7 +5287,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             /* QEMU gives out its own APIC IDs, never pass down bits 31..26.  */
             *eax &= ~0xFC000000;
             if ((*eax & 31) && cs->nr_cores > 1) {
-                *eax |= (cs->nr_cores - 1) << 26;
+                *eax |= (pow2ceil(cs->nr_cores) - 1) << 26;
             }
         } else if (cpu->vendor_cpuid_only && IS_AMD_CPU(env)) {
             *eax = *ebx = *ecx = *edx = 0;
-- 
2.36.1



