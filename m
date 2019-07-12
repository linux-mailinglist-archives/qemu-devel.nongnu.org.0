Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB23C66BAF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 13:39:33 +0200 (CEST)
Received: from localhost ([::1]:48458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlttk-0007RV-KP
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 07:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53585)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hlttH-0006GO-Cs
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:39:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hlttG-00059D-6F
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:39:03 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:57826 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hlttF-0003Yt-S3
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:39:02 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id A9C8B1A1FE7;
 Fri, 12 Jul 2019 13:37:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 7DF961A1FBF;
 Fri, 12 Jul 2019 13:37:55 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 13:37:45 +0200
Message-Id: <1562931470-3700-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.1 0/4] target/mips: Fixes for 4.1
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
Cc: arikalo@wavecomp.com, sw@weilnetz.de, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

At the moment, this includes fixes for problems in switch statements
found by GCC 8.3 improved code analysis features.

Aleksandar Markovic (4):
  target/mips: Add 'fall through' comments for handling nanoMips' SHXS,
    SWXS
  target/mips: Add missing 'break' for a case of MTHC0 handling
  target/mips: Add missing 'break' for certain cases of MFTR handling
  target/mips: Add missing 'break' for certain cases of MTTR handling

 target/mips/translate.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.7.4


