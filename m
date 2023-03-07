Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515E86AFACA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:55:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh9A-0007xP-Jm; Tue, 07 Mar 2023 18:55:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZh98-0007vE-St
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:55:06 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZh96-0003vP-L6
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iF0K1D3TimhnfmLN95AQOPCbn33PGQoGPgX9+u7U+KY=; b=OYOe/JqbKnYe4YqcHK/0a83gn0
 SB31I/cdqL0MMVW4N4DG7c0yZtDTxQUhutNzW6b5bzogapmelvPhax+ox+rCTMJAB3HdTO5Lj4Kgg
 TYYZcE6H/WKSyyfjrJ0WNslmUpoo5Pii1qSy24c4Q7XwoTWnHIv11K1wr2uEkKi0r/XcFB0STght4
 ySxo7fowGoeX95O/lkS1VTzZ4TomRCwoFI2azI1tRPd7T6OTU+BFWudqnWjH2aHOOLYQtYiDC6rvN
 D751M/7SqR9/vHT3JrwW7G1tp2dR4SKmP8YmBdYb5ozIkCsGQTmSI1XL0jGtAWmEMSN8IZZyrDNBd
 b0la1IT9P6HKmKZi6oYbBdOUq2LV6RoEgFfMIHagk6yIRPri4rt9KyWbosseb/RuIooIZh8+2cOkP
 wqy/v+4JgTDSpzk5jhnok5XvxI5XzIzMzcwWoZQ5mY/I0VYWvO7CVxKtx0zXFSNZc8ScbL9opwIX5
 g6uHPjlhUQRm4hJoq2B2b/d8X9M+dLHMbv+FTnQMtyMk05A2aImsMiVLo3mRLEx/MD/d0yoYFIln+
 LhSHtxnsxWyMdiXaGqI8XaPMFSOmO+23q3GYjwWP8IoixvynzHSxU6tCTyMi75UPsmH7btYSxkzZf
 c6ZIWh/SDh6KV/ifm3Ph4cRVJoqLvrhswNS3TS5JA=;
Received: from [2a00:23c4:8bab:d400:2a4f:fc6b:227:2848] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZh8O-000BuW-UN; Tue, 07 Mar 2023 23:54:24 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Tue,  7 Mar 2023 23:54:54 +0000
Message-Id: <20230307235455.282070-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bab:d400:2a4f:fc6b:227:2848
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 0/1] qemu-openbios queue 20230307
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

The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:

  Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)

are available in the Git repository at:

  https://github.com/mcayland/qemu.git tags/qemu-openbios-20230307

for you to fetch changes up to fff1aaf4451231ac680aa278e9fafc4f8b69ff57:

  roms/openbios: update OpenBIOS images to af97fd7a built from submodule (2023-03-07 22:30:06 +0000)

----------------------------------------------------------------
qemu-openbios queue

----------------------------------------------------------------
Mark Cave-Ayland (1):
      roms/openbios: update OpenBIOS images to af97fd7a built from submodule

 pc-bios/openbios-ppc     | Bin 677196 -> 677196 bytes
 pc-bios/openbios-sparc32 | Bin 382080 -> 382080 bytes
 pc-bios/openbios-sparc64 | Bin 1593408 -> 1593408 bytes
 roms/openbios            |   2 +-
 4 files changed, 1 insertion(+), 1 deletion(-)

