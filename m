Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542A963D2C1
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:06:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0JxX-0008Hp-54; Wed, 30 Nov 2022 05:04:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0JxT-0008Hc-In
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:04:51 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0JxS-0006Ag-3A
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:04:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QTsGXdrS+o6f4UJ/vK4pe+lqwtMLqO77GB89H00cGgs=; b=1nUgUnRaGP4TCZZ7AE7EOW5vTT
 WEKwD07+hpIVVggryWaBUOzo/Q7PuQXZh1r1sX/+Rf882LySZvvqp2JDCFRWx12R4dHp/71Wet91d
 Wrjb89xuEdILXMc6vPFRMpbjkUGqK70bEMHa93q0FOnoK6xECZGTZ+oX+pIGZkiiLK5hNZABJ+6T4
 8+oVt8hrNBAAsVa6dbKlfpyPwd2pTBwenZue1jBnNZz6ZbTnunWT4TyYIZ8Y4LZTV6MgEBGG3Ga2V
 KjxEVWFQBH/TNvx2bgBlYmDHw1S1q+xi5KUXyNtw7u9LJESsWAzxe2vn6o8HtXv+4H4+9i29AINS2
 +POaxHda9cyKGQ4z2HAclf3o9b+vmOyS+MxFnJ49hE0JTuKIQJPqjgN5LfpjsnzAHcRziQ40m5Db/
 ZW2mWskxAe4/qgLet6zQCUlvPckroMRKj5378RQ/v/1C7gC0fFqrDNzegq6gL9vxnyinQRNwI0UUg
 maNvmI8fRvcIo1qyk+G/ND9CZiBylDBNa3oW61NAqxte0ASfu6SkZVedTXYJyo/r18sNHiDKtpvHg
 yIO8EyrOjy/YhT/6Qr28/wy+pSmyeGUnU/JekcFU8/ZnqUmo2WrRmFWvxVcsErkOAIcQrM1DJuz7K
 a4eoxUXMQTgTqModjj1UoKwXtQDue4KQ4pz1jj92k=;
Received: from host86-149-46-27.range86-149.btcentralplus.com ([86.149.46.27]
 helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0JxC-000B0O-Ut; Wed, 30 Nov 2022 10:04:39 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org, alex.bennee@linaro.org,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
Date: Wed, 30 Nov 2022 10:04:33 +0000
Message-Id: <20221130100434.64207-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.149.46.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 0/1] tcg: convert tcg/README to rst
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is something I've had lying around in the background for a while, and I
finally managed to get it in a state suitable for submission. The main
motivation was that I wanted to have a TCG operation reference that was
easily viewable online in a web browser.

The patch converts tcg/README to rst and then moves it from tcg/README to a
new "TCG Intermediate Representation" section in docs/devel.

The conversion is fairly straightforward, with a few minor touch-ups to
produce a more aesthetic result which are documented in the commit message.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

v2:
- Use | to designate lines in the "Instruction Reference" tables to fix
  wrapping issues noticed by Peter
- Add reference to new document in docs/devel/tcg.rst instead of tcg/README
  as suggested by Zoltan


Mark Cave-Ayland (1):
  tcg: convert tcg/README to rst

 docs/devel/atomics.rst   |   2 +
 docs/devel/index-tcg.rst |   1 +
 docs/devel/tcg-ops.rst   | 942 +++++++++++++++++++++++++++++++++++++++
 docs/devel/tcg.rst       |   2 +-
 tcg/README               | 784 --------------------------------
 5 files changed, 946 insertions(+), 785 deletions(-)
 create mode 100644 docs/devel/tcg-ops.rst
 delete mode 100644 tcg/README

-- 
2.30.2


