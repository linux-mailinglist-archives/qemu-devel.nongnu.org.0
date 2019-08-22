Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF295990A5
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 12:23:18 +0200 (CEST)
Received: from localhost ([::1]:40150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0kFR-0007BA-EA
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 06:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60907)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1i0kDH-0005tk-V2
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 06:21:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1i0kDG-0005XH-9F
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 06:21:03 -0400
Received: from telepax.uni-paderborn.de ([131.234.189.14]:43866)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1i0kDF-0005Sm-8n
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 06:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9hvltkHZDAXhNEYulLjnp92nPBggtUWUYvo27UxriG0=; b=jSocrE/YEBlUK7P06PIn5N0poF
 bPUTepBX/zf+NhfUQF57rSX4ut546eH8fy/xaV60azGYm1AaVmYD0c5qoFf2/3fKh9KLfhHIB/dP0
 +PN3g92yjH8UkgydS+AgVdiZfAYTzyoYKODRJFqcCUjdnmHdPkLjbJr9aK76ZP3k7Rwk=;
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 12:20:41 +0200
Message-Id: <20190822102046.8765-1-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.7.2805085, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2019.8.22.101216, AntiVirus-Engine: 5.63.0,
 AntiVirus-Data: 2019.8.13.5630000
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

The following changes since commit fe066b4848bab4f9365a419f3c8ba59ccecf67c0:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-pull-request' into staging (2019-08-21 16:59:22 +0100)

are available in the Git repository at:

  https://github.com/bkoppelmann/qemu.git tags/pull-tricore-20190822-1

for you to fetch changes up to d4881da9b39df183f976349f223231ac1d81087b:

  target/tricore: Fix tricore_tr_translate_insn (2019-08-22 12:17:01 +0200)

----------------------------------------------------------------
Converted target/tricore to translate_loop

----------------------------------------------------------------
Bastian Koppelmann (5):
      target/tricore: Use DisasContextBase API
      target-tricore: Make env a member of DisasContext
      target/tricore: Use translate_loop
      target/tricore: Implement a qemu excptions helper
      target/tricore: Fix tricore_tr_translate_insn

 target/tricore/helper.h    |   1 +
 target/tricore/op_helper.c |   7 +
 target/tricore/translate.c | 577 +++++++++++++++++++++++++--------------------
 3 files changed, 324 insertions(+), 261 deletions(-)

