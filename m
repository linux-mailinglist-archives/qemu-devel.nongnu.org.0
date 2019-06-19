Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516974C0BA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 20:22:53 +0200 (CEST)
Received: from localhost ([::1]:40986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdfES-0001gl-Gh
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 14:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59951)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdfCH-0000Kh-JO
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 14:20:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdfCG-0008Te-C4
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 14:20:37 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:49299 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hdfCF-0008Q2-Vk
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 14:20:36 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 653DA1A4541;
 Wed, 19 Jun 2019 20:20:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 494891A2079;
 Wed, 19 Jun 2019 20:20:31 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2019 20:20:16 +0200
Message-Id: <1560968418-21301-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 0/2] target/mips: Misc fixes and maintenance
 for 4.1
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

This series contains miscelaneous fixes, improvements, and
maintainance items intended to be integrated into QEMU 4.1.
I will gradually add patches by the end of June 2019.

Aleksandar Markovic (2):
  MAINTAINERS: Update file items for MIPS Malta board
  MAINTAINERS: Consolidate MIPS disassembler-related items

 MAINTAINERS | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.7.4


