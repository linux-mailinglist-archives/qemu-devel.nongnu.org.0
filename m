Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AD07FDAD
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 17:38:10 +0200 (CEST)
Received: from localhost ([::1]:35830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htZdB-0000Yd-6W
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 11:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53542)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htZcF-0008Cj-Jv
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 11:37:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htZcE-0000QW-OW
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 11:37:11 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:57970 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1htZcE-0008PN-IN
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 11:37:10 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id ED40E1A21D3;
 Fri,  2 Aug 2019 17:36:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id CFD571A1DFB;
 Fri,  2 Aug 2019 17:36:05 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri,  2 Aug 2019 17:35:56 +0200
Message-Id: <1564760158-27536-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 0/2] tests/acceptance: Update MIPS Malta ssh
 test
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
Cc: ehabkost@redhat.com, cohuck@redhat.com, f4bug@amsat.org, crosa@redhat.com,
 amarkovic@wavecomp.com, ccarrara@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This little series improves linux_ssh_mips_malta.py, both in the sense
of code organization and in the sense of quantity of executed tests.

Aleksandar Markovic (2):
  tests/acceptance: Refactor and improve reporting in
    linux_ssh_mips_malta.py
  tests/acceptance: Add new test cases in linux_ssh_mips_malta.py

 tests/acceptance/linux_ssh_mips_malta.py | 81 ++++++++++++++++++++++++++------
 1 file changed, 66 insertions(+), 15 deletions(-)

-- 
2.7.4


