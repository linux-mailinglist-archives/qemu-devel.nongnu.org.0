Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD44183E36
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 02:04:10 +0100 (CET)
Received: from localhost ([::1]:52376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCYkD-0003cf-7q
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 21:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1jCYiZ-0002We-Bd
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 21:02:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1jCYiX-0003n1-VT
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 21:02:26 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:42096 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1jCYiX-0002Ie-Oy
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 21:02:25 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id D63F51A4165;
 Fri, 13 Mar 2020 02:01:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from localhost.localdomain (226.87.148.91.adsl.dyn.beotel.net
 [91.148.87.226])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 520711A4130;
 Fri, 13 Mar 2020 02:01:19 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH 0/3] MAINTAINERS: Adjust MIPS items
Date: Fri, 13 Mar 2020 02:00:49 +0100
Message-Id: <1584061252-16635-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>

Some MIPS maintainership houskeeping changes, and some items
for better reflecting the reality.

Aleksandar Markovic (3):
  MAINTAINERS: Adjust maintainer's status for some MIPS items
  MAINTAINERS: Adjust maintainer's email
  MAINTAINERS: Add a file to the main MIPS section

 .mailmap    |  5 +++--
 MAINTAINERS | 17 ++++++++++-------
 2 files changed, 13 insertions(+), 9 deletions(-)

-- 
2.7.4


