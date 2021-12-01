Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7670C464767
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 07:49:15 +0100 (CET)
Received: from localhost ([::1]:37916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msJQY-0001oe-33
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 01:49:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1msJKs-00005E-2R
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 01:43:26 -0500
Received: from [2607:f8b0:4864:20::631] (port=46670
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1msJKn-0004Vq-RT
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 01:43:19 -0500
Received: by mail-pl1-x631.google.com with SMTP id p18so16883628plf.13
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 22:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gt8Xfde1FZkRpHbDgvJ7uGcCcOhogE84Q6Rw/TrIoUU=;
 b=sDDjTKI8nUMtSIvk6E+Tj8MnbQRanI8FYvZoCUUgIWeTT5TyOec8bKsDKm7AhYA8tv
 BMFKMR1yBENSrogCXqXWZRiWkoggOIprlDrGBReKCoik1m0Jfb4kfe7ouZUE7+K3/NIF
 Q0SadeyZiR9aGVHe3AvwxfqdoWo7yWSGoqw8VOvCkOW24xg3HlSB8XWSXGRb2OMzKW6p
 yvcwA8/KFqpMCg4fyr5cBJMPkW141rQlvZNFKEjBvSUGOeUKW/7qX+XiU50qQo/XZUFR
 OqsokVz9/2U/Ap6247zjlEfFGYvaBAtgc0ggAyaJQQtheF0lsdWmbrrJv+Gz++Gy69by
 olnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gt8Xfde1FZkRpHbDgvJ7uGcCcOhogE84Q6Rw/TrIoUU=;
 b=sSnzN8RQS/FruQxAS2k34kgiL2hBX+Ma5PTZyKlU7gPqKU9Wz9uMHddxDcBwuE/jAL
 XRpTX/dXK0g86Of6XGtqjQQgLW8ORUgo/weNeHjj8iWwmBdVByx3H9GuRifZ/C/l+tg2
 EvmWnlz7VFpOnTMxCkXaNZ3YDm7bGuiIKHhSlR+zFDz5iqcpKdtgPRgT7Y966j1OcxNX
 aSt3mFEC6MKtdE3mCa6nvPpLojFLwYlzC9zvafiu/Y37Mj8+pNaft2PHMKskc6NMqXNx
 CeqxOt+q9z4sj48Mj9Lk/tYUw4NYjhy/oUfTQv83DScodwwkiVXFL7slr25kGrwPZv12
 tS7w==
X-Gm-Message-State: AOAM533gEb8wV7UXpYhYBTZp/Rj1DClwJPwOOU745ZuRBwLc+E8DIn6H
 UmM3a1er5RZIQHfXBOlK8Rpbe08LOubA8g==
X-Google-Smtp-Source: ABdhPJzFatmBCuV6KfcC17dYJwR2y19+cATXGo0z5FVfwETYW4hksNKFU4v+J4+GZAS91i15nHC3/A==
X-Received: by 2002:a17:902:74cb:b0:143:6fe9:ca4 with SMTP id
 f11-20020a17090274cb00b001436fe90ca4mr5374801plt.2.1638340995342; 
 Tue, 30 Nov 2021 22:43:15 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([49.207.225.199])
 by smtp.googlemail.com with ESMTPSA id f29sm16423958pgf.34.2021.11.30.22.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 22:43:14 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH] docs: fix section numbering in pcie.txt
Date: Wed,  1 Dec 2021 12:13:07 +0530
Message-Id: <20211201064307.107293-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x631.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no 5.2 section. Section 5.3 should really be 5.2. Fix it.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 docs/pcie.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/pcie.txt b/docs/pcie.txt
index 89e3502075..90310b0c5e 100644
--- a/docs/pcie.txt
+++ b/docs/pcie.txt
@@ -262,7 +262,7 @@ PCI Express Root Ports (and PCI Express Downstream Ports).
         Port, which may come handy for hot-plugging another device.
 
 
-5.3 Hot-plug example:
+5.2 Hot-plug example:
 Using HMP: (add -monitor stdio to QEMU command line)
   device_add <dev>,id=<id>,bus=<PCI Express Root Port Id/PCI Express Downstream Port Id/PCI-PCI Bridge Id/>
 
-- 
2.25.1


