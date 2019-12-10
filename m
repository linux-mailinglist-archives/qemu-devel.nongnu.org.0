Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C25E1188F8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 13:58:32 +0100 (CET)
Received: from localhost ([::1]:56230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ief5z-0003eu-1x
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 07:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52762)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ief4C-0002RA-Hg
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 07:56:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ief4B-00038t-2T
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 07:56:40 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:39379 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ief4A-0002lY-S9
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 07:56:39 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 620541A2057;
 Tue, 10 Dec 2019 13:55:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 45B001A1EB3;
 Tue, 10 Dec 2019 13:55:33 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] MAINTAINERS: Fine adjustment for (mostly mips) content
Date: Tue, 10 Dec 2019 13:55:14 +0100
Message-Id: <1575982519-29852-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: peter.maydell@linaro.org, philmd@redhat.com,
 Aleksandar Markovic <amarkovic@wavecomp.com>, aurelien@aurel32.net,
 hpoussin@reactos.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

v2->v3:

  - changed patches 2, 3, 4 on Philippe's request
  - add a patch on including acceptance test in MIPS section

v1->v2:

  - removed patch on new git infrastructure section
  - added a patch that adds two files in Malta section

The goal of this series is to:

  * reduce the amount of "unmainatined" files (not having their
    maintainer in "MAINTAINERS")
  * reduce the amount of nominally maintained files, but unmaintained
    in reality
  * increase the role of non-mips open source participants in
    maintaining and reviewing mips content

Best wishes to all new and former maintainers in future activities
and enavours!

Aleksandar Markovic (5):
  MAINTAINERS: Add a section on UI translation
  MAINTAINERS: Adjust maintainership for Fulong 2E board
  MAINTAINERS: Adjust maintainership for Malta board
  MAINTAINERS: Add three files to Malta section
  MAINTAINERS: Add a file to MIPS section

 MAINTAINERS | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

-- 
2.7.4


