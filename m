Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAEBE21F2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 19:41:28 +0200 (CEST)
Received: from localhost ([::1]:42956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNKdT-0000Vq-1o
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 13:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1iNGqG-0007I3-7t
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 09:38:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1iNGqE-0002K6-QQ
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 09:38:23 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:58030 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Filip.Bozuta@rt-rk.com>)
 id 1iNGqE-00026n-Jf
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 09:38:22 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 3902E1A2171;
 Wed, 23 Oct 2019 15:37:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw493-lin.domain.local (rtrkw493-lin.domain.local
 [10.10.14.93])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 10D861A2143;
 Wed, 23 Oct 2019 15:37:16 +0200 (CEST)
From: Filip Bozuta <Filip.Bozuta@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/mips: Rearrange handling of vector compare
 instructions
Date: Wed, 23 Oct 2019 15:37:03 +0200
Message-Id: <1571837825-24438-1-git-send-email-Filip.Bozuta@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
X-Mailman-Approved-At: Wed, 23 Oct 2019 13:09:41 -0400
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
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify instructions by removing unnecessary argument and creating separate
comparing functions for each instruction.

Filip Bozuta (2):
  target/mips: Rearrange vector compare equal instructions
  target/mips: Rearrange vector compare less than (signed) instructions

 target/mips/msa_helper.c | 160 +++++++++++++++++++++++++++++------------------
 1 file changed, 100 insertions(+), 60 deletions(-)

-- 
2.7.4


