Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E832B2D2AB8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:28:32 +0100 (CET)
Received: from localhost ([::1]:43416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmc6Z-00038f-VF
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kmc1Y-0007Pd-CH
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:23:20 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kmc1U-0005kK-0d
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:23:20 -0500
Received: by mail-pf1-x444.google.com with SMTP id t8so13753108pfg.8
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 04:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iBbkZq6ClnBw+To4SaPmaZqw/tjsXjd3Cb3nT5r7/Hk=;
 b=mxP2ej0OgWNdtmMQKrr+oMAiIAjz5F3CPPoYABFoM7LaiNJ19o8xGjphKmC9s+Lhu1
 i57BV12ess8kC2tFG9M8GOkQSRUd9gpNadrN/vWEHhox1U5NBMvTmfAGeG1K+wXc0mtr
 olHQS+RieZ7Dy9l1nWXnPFUz4pOMWnoGrdsurZ4NH8+ak/34b5YwPjazp7PDPgrGS3ix
 QkOQscEjLobxFOMr0OjSEhOwvjsJd1wW/s1Rva93by1r1MrpAA/C2CBMpMuPsd7wJ1G2
 JgUX20GWfG+WkohCgXm5U3gKb2kgx5YboPX3a7hIBzJrotRcsAENpTFvgd8WcWrQGDjb
 MoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iBbkZq6ClnBw+To4SaPmaZqw/tjsXjd3Cb3nT5r7/Hk=;
 b=WqW7b7L+aZnwEDG0ycrQMeTpmzgYXkvpHal4Ivt5KswOD88rMs2pXJRsIpCRH3EIgv
 2ly/Wu8Jbh9THH9KPT98tHk7tCoXRbY8N+PPEKq2VFGYR9ff6ZfenhODVy75yfruc9pT
 CV7xC4KBBr1y59XWfvz0LX7hePT7XoVRctUS1UN22a35J8ISqn/7+4U5e3hT1II/NeG+
 dkTad4Lq+w6Jab9njcdCAed3xMd/ztWdZRXtzuO/EvYMB0uMWqb3MRpqX9JwgDkciCJT
 tMhHS73R58NV4KD8K1z0JTEhvKQQSJ6xhOu3lMSt/+sPAr2aankQLbOIvyqjX2MnmTUA
 mxAw==
X-Gm-Message-State: AOAM531wsrjjXoq1gY4JxEGJulkcIaTYBAmRnGLUqSnUS7WZbcf9Ak02
 ou7xlHvrf/DjjpeAs1bc6qu+vg==
X-Google-Smtp-Source: ABdhPJxUA77zuvLOgD0NV5tt7TaNVoFaofKBy61z3WHJBsgB02nE8I8OlPCWZSgFAzLb6Ag1LGI4Mw==
X-Received: by 2002:a17:90a:73c2:: with SMTP id
 n2mr4160187pjk.37.1607430191954; 
 Tue, 08 Dec 2020 04:23:11 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b2sm3472377pff.79.2020.12.08.04.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 04:23:11 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 0/5] target/arm: various changes to cpu.h
Date: Tue,  8 Dec 2020 12:23:01 +0000
Message-Id: <20201208122306.8933-1-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=leif@nuviainc.com; helo=mail-pf1-x444.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First, fix a typo in ID_AA64PFR1 (SBSS -> SSBS).

Second, turn clidr in the ARMCPU struct 64-bit, to support all fields defined
by the ARM ARM.

Third, add field definitions for CLIDR (excepting the Ttype<n> fields, since
I was unsure of prefererred naming - Ttype7-Ttype1?).

Fourth add all ID_AA64 registers/fields present in ARM DDI 0487F.c,

Lastly, add all ID_ (aarch32) registers/fields.

Some of the ID_AA64 fields will be used by some patches Rebecca Cran will be
submitting shortly, and some of those features also exist for aarch32.

Leif Lindholm (5):
  target/arm: fix typo in cpu.h ID_AA64PFR1 field name
  target/arm: make ARMCPU.clidr 64-bit
  target/arm: add descriptions of CLIDR_EL1, CCSIDR_EL1, CTR_EL0 to
    cpu.h
  target/arm: add aarch64 ID register fields to cpu.h
  target/arm: add aarch32 ID register fields to cpu.h

 target/arm/cpu.h | 80 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 2 deletions(-)

-- 
2.20.1

