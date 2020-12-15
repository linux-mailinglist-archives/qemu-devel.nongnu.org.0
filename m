Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9369E2DAC5C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 12:52:31 +0100 (CET)
Received: from localhost ([::1]:37974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp8sY-0003C2-Lu
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 06:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8or-00076d-Rp
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:48:43 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:40173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8on-00013c-BV
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:48:41 -0500
Received: by mail-pj1-x1044.google.com with SMTP id m5so8756701pjv.5
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 03:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mrjluUaox9O/GuGcT66MzvHqCruw4iiBn+9QuZijTSY=;
 b=GPZblvh9i1SL6COgx2p1gw9Ef+OQXIYyVTeunJwySArRuRlcLn4r8psh7Z3Mp9bIP4
 AmEA2dbSlMleslqJGjCKAnmze0i8RX2Bkm4r20vekefussArHPLSZ0RaELXh5HI7kAVx
 YOy8J/QALYOsQVLn9MZ2/pwqNOhDb6J48uXthp8oGR1bXbl8j1lMht3IweMW7VjJVudR
 /y3y6ZDa64lUomcEfHdEkp+z3aJh0ucPF4I5spnsv/fJVGAf66AHcOGuzYzWnp/qGp/C
 rTsbITvvkODoEMqnhqCyHg+3S0AdKsHQ+b/PG7WheTeYDwt1kWe/w0fWE0N3dZdO2iqp
 Mvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mrjluUaox9O/GuGcT66MzvHqCruw4iiBn+9QuZijTSY=;
 b=hznsatPWaULbDbdju41AuTFLWECQ+gK3ZaCQm7tEr0iDs3xFJdx7Fqh2jY6X5EH6pz
 Iani+ZCokYra7O6GvJqMejCMgEuGjrulf9pw0X9qpvBUfo6IBMFtQPyWZ2QWsjp+OEXx
 7x3nsOPm+S5uYu6QL26dMIVbCkUPNi+1jtBN0Ud6swjlhQnyK9IdmaLl5A2RMu/xAYoy
 TZ3aPy6Pc/huqSuml/PfI8J7tEwvTroPw+XWFTmUVpkXg/etPqvWHNEuxJEv0SO5Vexa
 G/Iw8bD42zZiQo4PDZaqqraB826EWdMLxn92/W+jF0hgfx8sw80qkVXj8F7ZMJUGieFI
 gSHw==
X-Gm-Message-State: AOAM531WST5RBUAj1JazU+H/DkHMdLFgHj/8niDpj2TOp8+NTCNh/mN8
 Xrf+1OWZyoD/vac0I7/dU4OOLw==
X-Google-Smtp-Source: ABdhPJw0x8rf1TtLO84GYilRcOv+Gx+bo1Ddo1HuZWuyK1YRCdSo66R+WwsS6G7EyTFtXSOqp2+J/Q==
X-Received: by 2002:a17:90b:16cd:: with SMTP id
 iy13mr29350787pjb.182.1608032914880; 
 Tue, 15 Dec 2020 03:48:34 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id z23sm23340001pfn.202.2020.12.15.03.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 03:48:34 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 0/5] target/arm: various changes to cpu.h
Date: Tue, 15 Dec 2020 11:48:23 +0000
Message-Id: <20201215114828.18076-1-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=leif@nuviainc.com; helo=mail-pj1-x1044.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
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

v1->v2:
- Correct CCSIDR_EL1 field sizes in 3/5.
- Rebase to current master.

Leif Lindholm (5):
  target/arm: fix typo in cpu.h ID_AA64PFR1 field name
  target/arm: make ARMCPU.clidr 64-bit
  target/arm: add descriptions of CLIDR_EL1, CCSIDR_EL1, CTR_EL0 to
    cpu.h
  target/arm: add aarch64 ID register fields to cpu.h
  target/arm: add aarch32 ID register fields to cpu.h

 target/arm/cpu.h | 71 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 2 deletions(-)

-- 
2.20.1

