Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AE055053
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 15:27:58 +0200 (CEST)
Received: from localhost ([::1]:60212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hflUK-0006jY-Fx
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 09:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50887)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1hflAJ-0001CR-EK
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 09:07:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1hflAH-0007hK-7u
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 09:07:15 -0400
Received: from telepax.uni-paderborn.de ([131.234.189.14]:50718)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1hflAD-0007bl-Hv
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 09:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZDTlTNGLe5y+uwRIjxeWwTiP+BGmJBAiOFQxbCucOqg=; b=FPE/416A/QTWlE6GLjgG//Rtpf
 XVtQP1u+LMOh9wW+TUtcFX+4eEIUml9JcFiLr+HeQi3kPMfjpUi6cvuZkGA2kvKgvq60Ya9qkWEW1
 4Ze+Hv93oWlIpoYdkKIFcEl9GRb09lRRB0wecnjJyp0MgC8PXxkd1b4CPNcOmX53jz4A=;
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Date: Tue, 25 Jun 2019 15:06:53 +0200
Message-Id: <20190625130658.24895-1-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2019.6.25.125716, AntiVirus-Engine: 5.63.0,
 AntiVirus-Data: 2019.6.18.5630002
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 131.234.189.14
Subject: [Qemu-devel] [PULL 0/5] tricore queue
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde:

  Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-2019' into staging (2019-06-21 15:40:50 +0100)

are available in the Git repository at:

  https://github.com/bkoppelmann/qemu.git tags/pull-tricore-20190625

for you to fetch changes up to 8317ea0607a2d01b3cb6329aef1b8c8ca00471e1:

  tricore: add QSEED instruction (2019-06-25 15:02:07 +0200)

----------------------------------------------------------------
* Add FTOIZ/UTOF/QSEED insns
* Fix sync of hflags and swapped args of RRPW_INSERT

----------------------------------------------------------------
Andreas Konopik (1):
      tricore: add QSEED instruction

David Brenken (3):
      tricore: add FTOIZ instruction
      tricore: add UTOF instruction
      tricore: fix RRPW_INSERT instruction

Georg Hofstetter (1):
      tricore: sync ctx.hflags with tb->flags

 target/tricore/fpu_helper.c | 126 ++++++++++++++++++++++++++++++++++++++++++++
 target/tricore/helper.h     |   3 ++
 target/tricore/translate.c  |  14 ++++-
 3 files changed, 141 insertions(+), 2 deletions(-)

