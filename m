Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2D429848
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 14:50:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU9ea-00031H-1s
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 08:50:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hU9ci-0002Qt-20
	for qemu-devel@nongnu.org; Fri, 24 May 2019 08:48:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hU9cg-0001i3-Gp
	for qemu-devel@nongnu.org; Fri, 24 May 2019 08:48:36 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51370)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hU9cf-0001gv-Iz
	for qemu-devel@nongnu.org; Fri, 24 May 2019 08:48:34 -0400
Received: by mail-wm1-x343.google.com with SMTP id f10so1835674wmb.1
	for <qemu-devel@nongnu.org>; Fri, 24 May 2019 05:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4bPrPkcdlNMENU+gORaJCbbqtxXSHOYr8ie8Cov/r1c=;
	b=vuHQMANadARa4pXL6PgQoXBIIqufxvi2z9M/QVI7mk0C2sz+K/WVAwriaz2P3TTdW+
	zSCBxKRxtH8GaDV2lUzXZ6FSx3PnzNYFdMfeBOX0W9lQobZlSBTYB0RHtMuhpc9tIuvw
	YMaTxjaCqaWqvav7UjrpUSrxR8KFqDxCFptIBSNk+EQKL+/KndF5+blnjsGdwPgaehM7
	w+BYWNAW9eafZv8IRCikS4dqG/A7ur+YmcdfsIlKOpPvWFxr69OS16iP4A6XPpdrah/h
	W7ylRL12h0Hmu91hvMQIW0mHYe8WX8qvxWJzceIrCax+BWcj0EjVht9JYKimRQNKS21u
	JMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4bPrPkcdlNMENU+gORaJCbbqtxXSHOYr8ie8Cov/r1c=;
	b=Qw2w1BHaJnyizbHE8J8Kf2Lcj59Mn5wvPNRNJecoqHqVEylAJc8WK0PzMz6vYm0xum
	GFqegFiov1LwE4x6Oy7aaTQ8LHbRjrhBC7XCy20+qo3woGJJtBnmkpWiamqxQhhRhRke
	jT8+OrpwGhE2DlUM39+HDeMqbUsImFKrZzV6Cp9FOUoPwbyccxiusWw8Ob10g6VsccCc
	46vU3hLGSBgK4R30dLGGxqfUFO4ZGZkKy4Sa1C11Iani6kObVMsRHMTeDah9W6SWM/P5
	BnM16Rrw8/e+2Of70IplZBVNDpiLwIwobglhba1ycfUpzJ+EXXegP2slv527wO35zupX
	zJjA==
X-Gm-Message-State: APjAAAWz6AmS7rZBmDGaZ2rIFOjd/+6aHrC7m/xu57POsVxoKJiL2i2n
	tdnKWSpiU7kHAWgR9z6UOHi/NA==
X-Google-Smtp-Source: APXvYqwXvgc3HrTEZVVj/r/xggv/U1pDofYjgx8nVMINiy09u26S15hb8ODfjTjzpvUQT32xBqUrvQ==
X-Received: by 2002:a1c:d14b:: with SMTP id i72mr16015899wmg.4.1558702111920; 
	Fri, 24 May 2019 05:48:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id o4sm3053445wmo.20.2019.05.24.05.48.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 May 2019 05:48:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 24 May 2019 13:48:29 +0100
Message-Id: <20190524124829.2589-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH] hw/arm/smmuv3: Fix decoding of ID register
 range
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SMMUv3 ID registers cover an area 0x30 bytes in size
(12 registers, 4 bytes each). We were incorrectly decoding
only the first 0x20 bytes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index fd8ec7860ee..e96d5beb9a8 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1232,7 +1232,7 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
                               uint64_t *data, MemTxAttrs attrs)
 {
     switch (offset) {
-    case A_IDREGS ... A_IDREGS + 0x1f:
+    case A_IDREGS ... A_IDREGS + 0x2f:
         *data = smmuv3_idreg(offset - A_IDREGS);
         return MEMTX_OK;
     case A_IDR0 ... A_IDR5:
-- 
2.20.1


