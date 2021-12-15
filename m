Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B815A475790
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:13:26 +0100 (CET)
Received: from localhost ([::1]:45276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSDt-0003fX-Ig
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:13:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiX-0006gO-0r
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:01 -0500
Received: from [2a00:1450:4864:20::32f] (port=46013
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiP-0008PR-K6
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:40:58 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so15649972wme.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3biCzHE2MCm5qbLc2Z8ma5yuIbmYSUQlxcCb6aKsIYU=;
 b=UTw907jtfYmpxSpkGLqevlOi23mHGAqzP0wgGttDT1H0wr3EXCJ2Cfyasf/MliKd05
 wp4oNO9LoUNhFcqTBgK+nfCvx+GSH5pwxf/3sK7BChIYfBJfgu/LStwh65ri8m9kaf+Y
 qsTAKQc/Pa87rea8Vc6+xHksLy398XJqoVtbOBYa+gbDsGqvzcc9j77DCuOgi4fsd7VU
 4XzGfrzSbKhsdL/WHEcnVPM9YJXsessQDQIHrUuBlH59twPwE47DE+nmCD8MUBwU1AIa
 zAFQBz52tWLVEs6NX4peTMj8jhrno3NRYX+LnepABVeNG+Ptr6sqNdexZpRU19/B9j+h
 W3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3biCzHE2MCm5qbLc2Z8ma5yuIbmYSUQlxcCb6aKsIYU=;
 b=FOMhrmgRAT2ZYwDv1jJ88kUCkO2JgQDkpJflbor0rnO0ISUewa2dZx7zqoSDnnvt6X
 2J2ml2JAkATjjB1uCQDERxCAHC1BsYlqL1CksPhi4EJUU6ctBoArQxhk1AVFvTvwWlKU
 sF6Q8vg6A/HWYW2d0T0XBwkLR6Wa77bYshA1ldn3NxKcTP/eTfFsMi/OhL+tIlH8tEEb
 oOVO3SmKCPxTTSa7jN+CpV31VHaD96mXBNt4HYUHTgVIPn6RGTPUp6iG4aFWoVQHYTqv
 lMlhn/vaTiHdHaZGtY+yFsZA1u2F6/3H38oh+wRnWVBTK/4Wa7lEECJ3VfGAWh+Us68o
 HzMg==
X-Gm-Message-State: AOAM531nr9a8DAsEpQ3qtAtLlFaeNYbISFZyj0wWeStUdp5C8a6aF9Fc
 LdIxJSnz7ZFuucKpJY/aMOmovaXylIx7aw==
X-Google-Smtp-Source: ABdhPJyEbEzo0ya4QmO5OZsS5dIKgihTND0IQASy+CrhMZsdu5w8OjndiL5fD93XCvfKoAuimuGHXA==
X-Received: by 2002:a05:600c:1d97:: with SMTP id
 p23mr4098832wms.186.1639564852393; 
 Wed, 15 Dec 2021 02:40:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/33] docs: aspeed: Add new boards
Date: Wed, 15 Dec 2021 10:40:18 +0000
Message-Id: <20211215104049.2030475-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

From: Joel Stanley <joel@jms.id.au>

Add X11, FP5280G2, G220A, Rainier and Fuji. Mention that Swift will be
removed in v7.0.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-id: 20211117065752.330632-2-joel@jms.id.au
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/aspeed.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index cec87e3743d..41a9bd5608e 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -14,6 +14,7 @@ AST2400 SoC based machines :
 
 - ``palmetto-bmc``         OpenPOWER Palmetto POWER8 BMC
 - ``quanta-q71l-bmc``      OpenBMC Quanta BMC
+- ``supermicrox11-bmc``    Supermicro X11 BMC
 
 AST2500 SoC based machines :
 
@@ -21,12 +22,16 @@ AST2500 SoC based machines :
 - ``romulus-bmc``          OpenPOWER Romulus POWER9 BMC
 - ``witherspoon-bmc``      OpenPOWER Witherspoon POWER9 BMC
 - ``sonorapass-bmc``       OCP SonoraPass BMC
-- ``swift-bmc``            OpenPOWER Swift BMC POWER9
+- ``swift-bmc``            OpenPOWER Swift BMC POWER9 (to be removed in v7.0)
+- ``fp5280g2-bmc``         Inspur FP5280G2 BMC
+- ``g220a-bmc``            Bytedance G220A BMC
 
 AST2600 SoC based machines :
 
 - ``ast2600-evb``          Aspeed AST2600 Evaluation board (Cortex-A7)
 - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
+- ``rainier-bmc``          IBM Rainier POWER10 BMC
+- ``fuji-bmc``             Facebook Fuji BMC
 
 Supported devices
 -----------------
-- 
2.25.1


