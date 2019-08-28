Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343B2A0764
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 18:30:19 +0200 (CEST)
Received: from localhost ([::1]:38334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i30ps-0000G7-Gg
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 12:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34401)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i30mm-0006tg-Or
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:27:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i30ml-0007lO-BF
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:27:04 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:55076 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i30ml-0007jm-4V
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:27:03 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id B3B8C1A2261;
 Wed, 28 Aug 2019 18:26:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 921971A214D;
 Wed, 28 Aug 2019 18:26:59 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 18:26:24 +0200
Message-Id: <1567009614-12438-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v2 00/30] Clean up handling of configuration
 register CP0
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
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

v1->v2:

  - added cleanup of handling six more registers
  - misc improvements

This series is a spin-off of a former "Misc MIPS fixes for 4.2" series.

The goal of the series is to clean up CP0-related code, and prepare
it for (near) future extensions and amendments.

The series is mostly of refactoring nature, however it may contain
simple fixes (for example, fixes for obvious bugs, or additions of
simple subregister handling). The more complex fixes and improvements
(for example, additions of VPE-related functionalities) are, for now,
outside the scope of this series.

Aleksandar Markovic (30):
  target/mips: Clean up handling of CP0 register 0
  target/mips: Clean up handling of CP0 register 1
  target/mips: Clean up handling of CP0 register 2
  target/mips: Clean up handling of CP0 register 3
  target/mips: Clean up handling of CP0 register 4
  target/mips: Clean up handling of CP0 register 5
  target/mips: Clean up handling of CP0 register 6
  target/mips: Clean up handling of CP0 register 7
  target/mips: Clean up handling of CP0 register 8
  target/mips: Clean up handling of CP0 register 9
  target/mips: Clean up handling of CP0 register 10
  target/mips: Clean up handling of CP0 register 11
  target/mips: Clean up handling of CP0 register 12
  target/mips: Clean up handling of CP0 register 13
  target/mips: Clean up handling of CP0 register 14
  target/mips: Clean up handling of CP0 register 15
  target/mips: Clean up handling of CP0 register 16
  target/mips: Clean up handling of CP0 register 17
  target/mips: Clean up handling of CP0 register 18
  target/mips: Clean up handling of CP0 register 19
  target/mips: Clean up handling of CP0 register 20
  target/mips: Clean up handling of CP0 register 23
  target/mips: Clean up handling of CP0 register 24
  target/mips: Clean up handling of CP0 register 25
  target/mips: Clean up handling of CP0 register 26
  target/mips: Clean up handling of CP0 register 27
  target/mips: Clean up handling of CP0 register 28
  target/mips: Clean up handling of CP0 register 29
  target/mips: Clean up handling of CP0 register 30
  target/mips: Clean up handling of CP0 register 31

 target/mips/cpu.h       |  113 ++++-
 target/mips/translate.c | 1150 ++++++++++++++++++++++++-----------------------
 2 files changed, 681 insertions(+), 582 deletions(-)

-- 
2.7.4


