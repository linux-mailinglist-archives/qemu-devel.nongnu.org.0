Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED7F635860
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 10:56:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxmTE-0003wd-8a; Wed, 23 Nov 2022 04:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oxmT7-0003wQ-G5
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 04:55:01 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oxmT4-0004UG-0q
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 04:54:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TAbyxwMCMhLqOiOd9VoDSSNr9QT5YPTgH8XrcGFpM30=; b=djdbUZzhqn0q9I9LMWozxXQO1M
 QVsZDUJCgcD/5WPEzegy1OzFSYxRLjWKwS/yJ/ZmoE8E/+r7e0obAzbn7hfnzRHXwoFq7eo6zUMeh
 8Jj4jg1R6zT+brFyaKbtCgBVlr9DIF5jA/prxVoV0EzOR0YltoFo9/NoNdufEMGyfXzErFfpr5kxN
 T6LMJTVRe7nj1j2d96AXsupaLf0YGmwepkNsw8EPz8SY9OPQWynv/lpC1ACxGgvzR8WQAZh2QqD/2
 CrMgfnOuTExeZnbXh/H6eNGocsbUk3LB2t57AMi2Hvd/D8lUfya6EURy0UqeFgViaF1RU7Rfo4y3W
 32JJ0RnHz4qOwnB1jfrPUo5IDhKZVI91z9i201kL4F1K2wzBXYDcA88BoIxzpQVpJzvYceBFqgFHx
 jqnGniij/3FAHQpNKHRVfe+y285yp8HoQREJJDeKaLNTHe0i2ykwFwE7hM0f53aZTt7DDYTQ2+OAo
 gs7BLjibj1mRUjtGZScx3ouSyY4kBIQsDw7xf81/VLxJsMJAwlADQjFl0Wy3i6lMQUwyvK+VtkcIb
 pp9qwsh0nN47QQVmHAiCeNKkU/UlQF3VKLd6julBxuq1GAzupQ2fKetUYMqVbzPuTtZlVz8Ivag/S
 qsKXEJczvqyAIieiW8lnX1BDjaY53jVZ5K4RqG1ZM=;
Received: from host86-149-46-27.range86-149.btcentralplus.com ([86.149.46.27]
 helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oxmSo-00050W-2o; Wed, 23 Nov 2022 09:54:46 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org, alex.bennee@linaro.org,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
Date: Wed, 23 Nov 2022 09:54:44 +0000
Message-Id: <20221123095445.31970-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.149.46.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/1] tcg: convert tcg/README to rst
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


Mark Cave-Ayland (1):
  tcg: convert tcg/README to rst

 docs/devel/atomics.rst   |    2 +
 docs/devel/index-tcg.rst |    1 +
 docs/devel/tcg-ops.rst   | 1018 ++++++++++++++++++++++++++++++++++++++
 tcg/README               |  784 -----------------------------
 4 files changed, 1021 insertions(+), 784 deletions(-)
 create mode 100644 docs/devel/tcg-ops.rst
 delete mode 100644 tcg/README

-- 
2.30.2


