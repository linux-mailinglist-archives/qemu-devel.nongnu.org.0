Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F672EF7BC
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:55:37 +0100 (CET)
Received: from localhost ([::1]:50254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxwvA-0006WN-Rg
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrg-00024V-HI
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:52:00 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrd-0000sE-Ks
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:52:00 -0500
Received: by mail-wm1-x32d.google.com with SMTP id q75so9285228wme.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AcoXdrrQcxeAFhHhxtwxElcM60mUZAzjqTpSoPTvLh4=;
 b=hC4C6LQOdtDEKJXxG2+zbxD2AnHBsOEWwTjrveojRTVMyNpC/pMXz/tXE9r61Jo2jR
 HjfUfKSBAPdotbHCvEBKBhccltfTZNZIzP30dO+fItSR+7Mh82vuoDzJTlvht/Mor+Qy
 AwNuUSzbkmARxV+ijLdQc+ftUoQ38iebVWJ1zxgCjOFq3adUzgXyedWJIz6YBpRV3gd3
 z3l10EmvjfA1thHZcGnQv8mRpYDKYCNefm4AtZl1SR08uDteDcM3JVSQdwEhchyyBKvM
 HUJPytFPWVISAhUa3Z+5F5H4qTf17c+2WJJ1KcJgDXivbOyZbcRAMjmfxoeF0GRIIQVH
 C0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AcoXdrrQcxeAFhHhxtwxElcM60mUZAzjqTpSoPTvLh4=;
 b=qR34KJswPnQmF5hKqzvGpH96G+GmxCqH9hXm66z1tj7U41ds1H5wst0/IBwjnCAI/n
 TP0yCUkpLitMw1aUY0qamUNUsYIkKGkSIEaCxzgYxOu5jQuC5r61aVndf+katTbGedz6
 IKppCGJmGvTfkbctpq0hQMsQfZEh3i/BQclxm9gOKSbMJazljEZDYQNQSFCZnjV+xmDa
 t54SeajLRoGH6CrUygjSXIzzWwMsYTu9LAZNbSqVU9Gf/YGwp7wpit2iFQPNNKBuAVFa
 GbNAr2R1YkBcqLYnEbcbtuNOr2eETCw3zrGWM3SCB9m0iof8P1oW8erpiwjsMasrcfNB
 QwFg==
X-Gm-Message-State: AOAM53063HdZA+eW0squzyjxYXvunt/1Y8G4qvqZLzZ1wuMlO2EniF5R
 LCGrsXOUC2U1mt+vAp5JaOrm7GKSt+mxqHWBKB3QlrACjvlw44NsI0kIgh4xlgrM8j+FkCKjzgV
 0dRdHDg4YRp9FtNrgrF6nfA8H6UpaU8RyOG5xmg68Uvh4mwebONI8BebaYEvYSTOBG/OLag==
X-Google-Smtp-Source: ABdhPJw4J5/wIw14t3OegeqZ7NZITGqmwyv2z9qxBBW73HJwpF8RynBbcyiNllyPzbatJTVMiI/7Cg==
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr4239075wmn.157.1610131915578; 
 Fri, 08 Jan 2021 10:51:55 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b19sm12353373wmj.37.2021.01.08.10.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:51:55 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] target/arm: various changes to cpu.h
Date: Fri,  8 Jan 2021 18:51:48 +0000
Message-Id: <20210108185154.8108-1-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x32d.google.com
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
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

v2->v3:
- Add missing R-b tags.
- Add separate definition for CCSIDR_EL1 fields when FEAT_CCIDX implemented.
- Add patch extending also ARMCPU.ctr to 64-bit.
- Rebase to current master.

v1->v2:
- Correct CCSIDR_EL1 field sizes in 3/5.
- Rebase to current master.

Leif Lindholm (6):
  target/arm: fix typo in cpu.h ID_AA64PFR1 field name
  target/arm: make ARMCPU.clidr 64-bit
  target/arm: make ARMCPU.ctr 64-bit
  target/arm: add descriptions of CLIDR_EL1, CCSIDR_EL1, CTR_EL0 to
    cpu.h
  target/arm: add aarch64 ID register fields to cpu.h
  target/arm: add aarch32 ID register fields to cpu.h

 target/arm/cpu.h | 80 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 3 deletions(-)

-- 
2.20.1

