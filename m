Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036C03BA0D9
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:03:07 +0200 (CEST)
Received: from localhost ([::1]:45250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIoz-0001ot-IU
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIlz-0007TA-Uu
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 08:59:59 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:44008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIly-0007dY-Bp
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 08:59:59 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so6329552wmc.2
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 05:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=C1fMb/avpJFjCQWQSxlIZxx/p9hCZmc8JW8Wn7UU8l4=;
 b=s+IG9gTmFfU5QC6qYfMEEzITQQMM+gGvsds2ejNdfSbpUErtHeLvHo6zrJDH/4+g00
 td7Pl8LF3hc9Fkpsh416pPEyYtnhX/NnSLzrsbxQGrSMSdIyneiPUk/kukaKmY7XlFdx
 /HNiaX+NvL4KZ3JEluP8GCdn++/t++J8Uf4k21Nez0ROyzZYy+50Vcrt1NHNo4KL27lV
 iaYRRwspeOQOEnASkbteyRSbY5DapDiwyYGJYvC4KTylngCqzTCYUhPzykYK9AEMEyD0
 Iw0rw8kRMxDDbqvye9wgaOdOSCoHt5W1whS8FV6zgERkJ844jHabmQWoZVNLf7WNGVZs
 QA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C1fMb/avpJFjCQWQSxlIZxx/p9hCZmc8JW8Wn7UU8l4=;
 b=Df8IxcfRG3FWJRdXG9SwvAa/d9jm6waTC3EUmAK0HviAcXfdKmeYlz0M7XUKRFs5FP
 8a+btz2ktqGWfxh0yJgDD8ea9zyuUlordyk8OtXebFFn0g9IqclVaZXBh5600b+sv3RB
 h53jf0gozWT3PeVIySsLCngBI1YwaOgAVBdcn+apusVdkxVpNu5gb2rz/Y60aqun5fD1
 wnrDEI9zybFKCy17tppuh+XEA6Bu7sdUcWl37Jyso/oADIqNVWJa1bb3UBfHpU2OvAVq
 yipmTrIbvHGgUDrvtm+pDjLyARHWxB1ehpbob2nkiZICuU0W/gTEyJoLl5CnCXFXdEh/
 wt3w==
X-Gm-Message-State: AOAM5333v1OaGIV4j2ZCzmTDp/Hx0orsEedEw9WwjH8Va9qEGpbhJRxS
 V+EYAewMjOw1HbifehEzbq2cfhGE9+K3Ok2j
X-Google-Smtp-Source: ABdhPJw87LYAITRI+Da9J8svIxSaMYwTWaFzl8yc2g0HWQiCp0X3gK0UreDFp6uRxELlvgXempj6Hg==
X-Received: by 2002:a1c:2142:: with SMTP id h63mr5445445wmh.84.1625230796931; 
 Fri, 02 Jul 2021 05:59:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.05.59.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:59:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/24] docs/system/arm: Add quanta-q7l1-bmc reference
Date: Fri,  2 Jul 2021 13:59:31 +0100
Message-Id: <20210702125954.13247-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Patrick Venture <venture@google.com>

Adds a line-item reference to the supported quanta-q71l-bmc aspeed
entry.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-id: 20210615192848.1065297-2-venture@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/aspeed.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 57ee2bd94fc..cec87e3743d 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -13,6 +13,7 @@ etc.
 AST2400 SoC based machines :
 
 - ``palmetto-bmc``         OpenPOWER Palmetto POWER8 BMC
+- ``quanta-q71l-bmc``      OpenBMC Quanta BMC
 
 AST2500 SoC based machines :
 
-- 
2.20.1


