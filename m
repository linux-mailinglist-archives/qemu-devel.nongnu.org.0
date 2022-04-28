Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F207B513867
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:31:13 +0200 (CEST)
Received: from localhost ([::1]:46000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk66q-0004fU-RM
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5KC-0005jd-H2
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:41:00 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:55009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5KA-0006WS-AX
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:55 -0400
Received: by mail-wm1-x32b.google.com with SMTP id bg25so3069277wmb.4
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gpwCksN0LZsUzbPY2FkedaNU78SqdrJFCEZ38+wzX7M=;
 b=k1Rv7BfS/xJ8qrQzo1He2evJeWC2yExEhnLMsMy2TkwQK8CR9I8sPmbCJFmAl59sIE
 /dNyMlGRiEgbwlhdWscDP0J6hdsj2RYTwJoDBWJ4QzeRPn+JUgPJtizvjdhgcD+OxGp3
 DTaUD8IzGjELOhdtvAdSDoq18yERhVXKX3+xDyAtk15IiaT7gNOnZsfqLVA1dpDiY2FZ
 hCDLOOzkRa7pXulAgGcY4wvgU2J2e0ZkAwm4rvXyz2N/vtzYidBB9oJH5cdVCI1oE3bf
 g8VyFkFMAwiE39PDFtfw3VdDC9UUzVqAHQeVW2pJcUZ2PLpA+GFWTjQGVR0lgFbR1cpx
 t17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gpwCksN0LZsUzbPY2FkedaNU78SqdrJFCEZ38+wzX7M=;
 b=scZXv8dFq88eR+pYG5pLEDPCSXYlurAQCojgzsmd69ML4Q4SB+Rukh2ZtT0MiQ/YmB
 DMii7RdItKpnbN20N/NhQKtfpFydB1lF3W2jKkCbWkqE4hbHQhFIRazx1VcvZq+jJ5ZY
 W8V0mT7nzzSS97CFLc5jjRU2kw7jC+pEUNplwvsC82hPf9Cs+iaMfz4lGD9Le5CkJ3/o
 T6Iv3/4+6b6kpSrEv0Bf2Wxx7u+OkSGG9gMVbafrGO5uPfI8iJyAXpwt10BhSvOx51FX
 Yt4a8LNlqz5FSMnWd64ouRSEhSXn4tQvWNXZjMB89InvkMLYuhwsSTyQ83pXqmPTEwUb
 uzuA==
X-Gm-Message-State: AOAM5329h3xgCxWnp9N6RYQDB4ZNMlbbRdVsupmTv0G48rGj9LxgJ7il
 PX//s92E9oqBRDjm092SYlawDvN118Boqg==
X-Google-Smtp-Source: ABdhPJyFoWg0cWxupSuGmJWeNYQdMMim5kJB7U9Xch3PBZL1Fdk9DmTyq5eanjkifaLzK3vv+l51pQ==
X-Received: by 2002:a05:600c:5020:b0:38f:f83b:e773 with SMTP id
 n32-20020a05600c502000b0038ff83be773mr31396447wmr.57.1651156851522; 
 Thu, 28 Apr 2022 07:40:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 54/54] hw/arm/smmuv3: Advertise support for SMMUv3.2-BBML2
Date: Thu, 28 Apr 2022 15:39:58 +0100
Message-Id: <20220428143958.2451229-55-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

The Arm SMMUv3 includes an optional feature equivalent to the CPU
FEAT_BBM, which permits an OS to switch a range of memory between
"covered by a huge page" and "covered by a sequence of normal pages"
without having to engage in the traditional 'break-before-make'
dance. (This is particularly important for the SMMU, because devices
performing I/O through an SMMU are less likely to be able to cope with
the window in the sequence where an access results in a translation
fault.)  The SMMU spec explicitly notes that one of the valid ways to
be a BBM level 2 compliant implementation is:
 * if there are multiple entries in the TLB for an address,
   choose one of them and use it, ignoring the others

Our SMMU TLB implementation (unlike our CPU TLB) does allow multiple
TLB entries for an address, because the translation table level is
part of the SMMUIOTLBKey, and so our IOTLB hashtable can include
entries for the same address where the leaf was at different levels
(i.e. both hugepage and normal page). Our TLB lookup implementation in
smmu_iotlb_lookup() will always find the entry with the lowest level
(i.e. it prefers the hugepage over the normal page) and ignore any
others. TLB invalidation correctly removes all TLB entries matching
the specified address or address range (unless the guest specifies the
leaf level explicitly, in which case it gets what it asked for). So we
can validly advertise support for BBML level 2.

Note that we still can't yet advertise ourselves as an SMMU v3.2,
because v3.2 requires support for the S2FWB feature, which we don't
yet implement.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20220426160422.2353158-4-peter.maydell@linaro.org
---
 hw/arm/smmuv3-internal.h | 1 +
 hw/arm/smmuv3.c          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 6de52bbf4da..bce161870f6 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -56,6 +56,7 @@ REG32(IDR2,                0x8)
 REG32(IDR3,                0xc)
      FIELD(IDR3, HAD,         2, 1);
      FIELD(IDR3, RIL,        10, 1);
+     FIELD(IDR3, BBML,       11, 2);
 REG32(IDR4,                0x10)
 REG32(IDR5,                0x14)
      FIELD(IDR5, OAS,         0, 3);
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 3a989b09cb4..daa80e9c7b6 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -259,6 +259,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
 
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
+    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
 
     /* 4K, 16K and 64K granule support */
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
-- 
2.25.1


