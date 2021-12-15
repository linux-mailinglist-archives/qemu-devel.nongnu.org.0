Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C700475798
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:17:01 +0100 (CET)
Received: from localhost ([::1]:53982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSHM-00011W-FU
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:17:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiX-0006ga-Vd
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:02 -0500
Received: from [2a00:1450:4864:20::430] (port=42986
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiR-0008Pa-Hu
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:00 -0500
Received: by mail-wr1-x430.google.com with SMTP id c4so37352702wrd.9
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5tWc0SpCxjJ+nrESHqQyrz7We4RccBy36x+rXAWJeBE=;
 b=SqVMyirxDOnN56MasCFEu4cgL7i6jC2KpwRBlnrccfaUgbDxH8pcmqiyOWK6RaMrot
 EZf+fVG+B1CPVMcXQt7dEc9jHSKk2t1HAV85X/WCBT2s864LxCBgv1PpwaVbtY6u5GAt
 Q46iiKPo28auMOXQUK+M4oa5y8/0Tie8Tp257/fm86OeXP+9ShU0W+01Afhi6TVcKZML
 izv6XT0i2xMjTE4VNGLixZy81pzFM6AQfC3kp97NtTEpRYiDnmpgXkA4WmXCfjtoPPTe
 3zaRe1DZa1YnJGlwRtpAo3H+XmuERXmTxzchneO7aeho7XvKZN/J8SQFW7gHxhLWv5x9
 kR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5tWc0SpCxjJ+nrESHqQyrz7We4RccBy36x+rXAWJeBE=;
 b=P/USKSnl3S1x4DWIA0etFqCBFL74Hb4Q+d8PZSn5Eg0BTNhROX+fvaMGp7XjJ+TDf6
 hKmHESEHMB9nfJ2eB6LzqdZVnaFTDd2qnCN84qUKFe9CIFiSmYLE0xYwMBFu7gTC6YVw
 fU+RgpQKYuc38zSNYazdGqY5jWFaPVfkE3Fiakch5vNz79kKKQCVWDlQ9rAnL2OxLDb5
 GbBNOSGYL6GHRKDMdFzPrM/KjYbwKg0rRu7BK6W+ifZit6M9yA3Q+b+AC/cf9gtNK+Vb
 VMvvrwF+FGMuuWe4h2nOZhP5cQMbWIMgthCNHi3oQ5faS0yduSF+ka4O6By1DGDsx4mv
 0GIA==
X-Gm-Message-State: AOAM530sMdkQyJWL9Dj/Sy8+MkTeT4KNtjVi52NTzYcpGB0CES5uahTv
 OUk2znNdhxYVo7sn7Kerp21t9awXbG25sg==
X-Google-Smtp-Source: ABdhPJybORKTu9HAH6Y8Mm8aWB1OKJcrkdGvOQf4JVGe0r6Mo8gaqdNtfk2bboMNtFSf+P01sGN2qw==
X-Received: by 2002:adf:fa83:: with SMTP id h3mr3274563wrr.434.1639564853409; 
 Wed, 15 Dec 2021 02:40:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/33] docs: aspeed: Give an example of booting a kernel
Date: Wed, 15 Dec 2021 10:40:20 +0000
Message-Id: <20211215104049.2030475-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

A common use case for the ASPEED machine is to boot a Linux kernel.
Provide a full example command line.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Message-id: 20211117065752.330632-4-joel@jms.id.au
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/aspeed.rst | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index b87697fcf0b..6aafd611e9a 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -78,9 +78,9 @@ Missing devices
 Boot options
 ------------
 
-The Aspeed machines can be started using the ``-kernel`` option to
-load a Linux kernel or from a firmware. Images can be downloaded from
-the OpenBMC jenkins :
+The Aspeed machines can be started using the ``-kernel`` and ``-dtb`` options
+to load a Linux kernel or from a firmware. Images can be downloaded from the
+OpenBMC jenkins :
 
    https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/
 
@@ -88,6 +88,15 @@ or directly from the OpenBMC GitHub release repository :
 
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
2.25.1


