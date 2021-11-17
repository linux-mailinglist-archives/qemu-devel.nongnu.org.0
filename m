Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B74345418D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 08:01:47 +0100 (CET)
Received: from localhost ([::1]:53420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnEwz-0007PK-ED
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 02:01:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtT-0004pA-4W; Wed, 17 Nov 2021 01:58:07 -0500
Received: from [2607:f8b0:4864:20::434] (port=35507
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtQ-0005aP-U9; Wed, 17 Nov 2021 01:58:06 -0500
Received: by mail-pf1-x434.google.com with SMTP id c4so1779548pfj.2;
 Tue, 16 Nov 2021 22:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rm42Lk94YomucCdJ+zK88nEj8TVK864syUAadVvPAHg=;
 b=OGWVeIT5FrMCKQSOE3hASEvw8yee3NPdXGIcyOwBzVdTnaGE5epV1iTPgDRr/TcjoT
 y1kkMxrnp4qJs9FeowDudtvFWSrzLvKUI1fnM8XT6pheKsXDB9y9fSHzRE1PcfKaHPI7
 VXR+U4Egyl0AH/nbURVDwCwpdYOHj0gHw3XrqSDZosV8W9XTtqBGaaJdMfVin09R96FM
 iyDECxTcPkvr8k9UUtAj/RAVshX0wLt0c/G1Q1vrp3Ic2pDXLNim6xtKj82dwKfgjPQU
 VrBOIhxKmPBKbrjxkqjS4NFE45cNs9CciJXpdpuPlphDWXfYXr7kNWi3qJk/Mulf22IW
 H8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Rm42Lk94YomucCdJ+zK88nEj8TVK864syUAadVvPAHg=;
 b=AJVS1TIiQ+q8+RxIX8MSzNQhjAwCWEgzbgwtL4BemCiOMBA58PwQ8/eGNFwv+BMkea
 /sEm1MLrXao56nDqN5XVz3qux+fKq+bsCRI2A2G4liw05Kn3tjRpuCa5poEJTA/hWHd+
 4Eemk3fvRmQIYbCLqL0AybEFV/OvYP3KXT5u4SuQy1mUx4gtZOBkxH1GfZU8dRZyiEaT
 EAw2JyDFjdAElCFkbOnqQMc3ow0hsbRfavRnsjmYDLAitqvrbt75wFLZiw94PeKbY6wB
 xHxWx7dZZCjTnBT2An8Pv9nZjxbw+V9kOecv2MvES1baFSA8XZLl5tbnGI4R2IkYwluV
 ujuA==
X-Gm-Message-State: AOAM531im33ucUUrp9RPssFeo0GfqmtYL/MXWws2tqdBLKZACKpb302v
 K+KnuZQuvS1AQGNI2973OS3GQYZJad4fRw2P
X-Google-Smtp-Source: ABdhPJwNfA9K8SFhILGax2jBY08oT6ubCWqPVSWSRmjpWKEaaBQ8YBCTWM3uCv8lcEVDoapVj8D+wg==
X-Received: by 2002:a65:40c2:: with SMTP id u2mr3595892pgp.309.1637132283392; 
 Tue, 16 Nov 2021 22:58:03 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id d13sm21914618pfu.196.2021.11.16.22.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 22:58:02 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/4] docs: aspeed: Add new boards
Date: Wed, 17 Nov 2021 14:57:49 +0800
Message-Id: <20211117065752.330632-2-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117065752.330632-1-joel@jms.id.au>
References: <20211117065752.330632-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add X11, FP5280G2, G220A, Rainier and Fuji. Mention that Swift will be
removed in v7.0.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Add POWER10 to Rainier description
 - Include Fuji
 - Mention Swift to be removed
---
 docs/system/arm/aspeed.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index cec87e3743d0..41a9bd5608e8 100644
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
2.33.0


