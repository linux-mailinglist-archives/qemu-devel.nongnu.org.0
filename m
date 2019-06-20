Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA644CFE4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 16:04:06 +0200 (CEST)
Received: from localhost ([::1]:47964 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdxfa-0002Qq-0q
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 10:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52641)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdxOI-0004VJ-5I
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 09:46:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdxO8-0003Pt-2B
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 09:46:11 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:36063 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hdxO3-0003Ms-V1
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 09:46:02 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id CC0361A46DD;
 Thu, 20 Jun 2019 15:45:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id B37DB1A2271;
 Thu, 20 Jun 2019 15:45:55 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 15:45:45 +0200
Message-Id: <1561038349-17105-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v2 0/4] target/mips: Fix some issues of MSA
 emulation on big endian hosts
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

Fix some issues of MSA emulation on big endian hosts.

v1->v2:

  - updated commit messages

Aleksandar Markovic (4):
  target/mips: Fix emulation of ILVEV.<B|H|W> on big endian host
  target/mips: Fix emulation of ILVOD.<B|H|W> on big endian host
  target/mips: Fix emulation of ILVL.<B|H|W> on big endian host
  target/mips: Fix emulation of ILVR.<B|H|W> on big endian host

 target/mips/msa_helper.c | 148 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

-- 
2.7.4


