Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEC5453D8D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 02:16:11 +0100 (CET)
Received: from localhost ([::1]:51388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn9YY-0006z4-7j
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 20:16:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mn9So-0003j8-Tb; Tue, 16 Nov 2021 20:10:14 -0500
Received: from [2607:f8b0:4864:20::1033] (port=39610
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mn9Sn-0002iX-8P; Tue, 16 Nov 2021 20:10:14 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so3754217pjc.4; 
 Tue, 16 Nov 2021 17:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tVvt6Vwz3dPYOBwiwhjknVbHvlBgY8b56em/D6WrUlA=;
 b=X0sax2EtfvR5orcSy3LNm/34FErVNxrL40PePTG08EuVCga/+83+1WZ+Pa1hkFsb5e
 WpQMUtJFY3buG6kOKQaF3NUhECICll96MfHZk2ts4r/D0lvHHKsNGpOeafc4OIax4Fym
 y++5aAWa/P7bQxfd9RE335dIcwmP2mst93UEB1Lbb0P/EBo6S/dUI53oRm0INR6Nr2XU
 bUNHbjh+DxogMdjyDGGwQgsn+9Vt6IZ0mXolEkCFq5hXW60rrB+aIQr+oE8C/WkDfaYU
 hBAVn5xv2sw/MFNsDyfxF97sJC6VyK9ElICQ7AbDpCwH1WDs1+09moXZxhXW9CPAayS0
 vbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tVvt6Vwz3dPYOBwiwhjknVbHvlBgY8b56em/D6WrUlA=;
 b=DWPwK+YdvPmIqa28TxYXLKToRs+epoU0rbZZuWyIQCYtvY9LyM44torAPqBbsLxmNd
 fyo/rjRhtrtGN8eut6F4dlZJ8fJy58rvDyvwBkEhp6tAvWuKdiKVPm0yjXggCafiILQm
 0+chibzVAWkTQnT3CrQHvGX1mwXvBq3dXhV/Xa/+De5J/CB+HzyWwksIIayJf9+gkyP6
 MRqzi4iuVPkJ9NdR3+QG7Hu5uH3Mr/DnBPwAlaWibmetG6VAl97c+ON5gdxWnlp3GIGU
 Mf5Fd0fXr7lhgyjjvsLvQ4dwD1fMy2es7sIa0RcZP/PvV01cKrLl5PyVCPIhJQgK7IOq
 dPZw==
X-Gm-Message-State: AOAM533ZPkuUcI7H91tASD8CznHeJMAdLJPsd0mJ+cmkbL2ty4L1AX5x
 SszkY9WQc+1gZX7CHNQrG8c=
X-Google-Smtp-Source: ABdhPJwBvizPYHBHHhoeDYBu8vrKBoeLwVnMFD+qQjavzK+hdueaWhOgPdr0yuaCDvFpufueW/diaw==
X-Received: by 2002:a17:90a:ca11:: with SMTP id
 x17mr4503750pjt.61.1637111410165; 
 Tue, 16 Nov 2021 17:10:10 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id z16sm15211376pgl.29.2021.11.16.17.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 17:10:09 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [RESEND PATCH 3/3] docs: aspeed: Give an example of booting a kernel
Date: Wed, 17 Nov 2021 09:09:47 +0800
Message-Id: <20211117010947.297540-4-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117010947.297540-1-joel@jms.id.au>
References: <20211117010947.297540-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

A common use case for the ASPEED machine is to boot a Linux kernel.
Provide a full example command line.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 docs/system/arm/aspeed.rst | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 4bed7b5221b4..de408b0364ea 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -77,9 +77,9 @@ Missing devices
 Boot options
 ------------
 
-The Aspeed machines can be started using the ``-kernel`` option to
-load a Linux kernel or from a firmware. Images can be downloaded from
-the OpenBMC jenkins :
+The Aspeed machines can be started using the ``-kernel`` and ``-dtb`` options
+to load a Linux kernel or from a firmware. Images can be downloaded from the
+OpenBMC jenkins :
 
    https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/
 
@@ -87,6 +87,15 @@ or directly from the OpenBMC GitHub release repository :
 
    https://github.com/openbmc/openbmc/releases
 
+To boot a kernel directly from a Linux build tree:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M ast2600-evb -nographic \
+        -kernel arch/arm/boot/zImage \
+        -dtb arch/arm/boot/dts/aspeed-ast2600-evb.dtb \
+        -initrd rootfs.cpio
+
 The image should be attached as an MTD drive. Run :
 
 .. code-block:: bash
-- 
2.33.0


