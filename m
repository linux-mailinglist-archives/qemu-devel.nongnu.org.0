Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C10F5486
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 20:16:34 +0100 (CET)
Received: from localhost ([::1]:59046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT9kG-0001Oi-RK
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 14:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58621)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iT9fx-0006Bn-JE
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 14:12:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iT9fw-0004Gn-9E
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 14:12:05 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:46685 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iT9fv-0002nX-Uz
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 14:12:04 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id BFF2E1A216E;
 Fri,  8 Nov 2019 20:10:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 9CA761A1F98;
 Fri,  8 Nov 2019 20:10:58 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] MAINTAINERS: Fine adjustment for (mostly mips) content
Date: Fri,  8 Nov 2019 20:10:44 +0100
Message-Id: <1573240249-6966-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: peter.maydell@linaro.org, philmd@redhat.com, hpoussin@reactos.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>, aleksandar.rikalo@rt-rk.com,
 alex.bennee@linaro.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

The goal of this series is to:

  * reduce the amount of "unmainatined" files (not having their
    maintainer in "MAINTAINERS")
  * reduce the amount of nominally maintained files, but unmaintained
    in reality
  * increase the role of non-mips open source participants in
    maintaining and reviewing mips content

I contacted most of the involved persons regarding these changes.
I am asking all to accept new roles, since really there is no better
option than this. Please help QEMU maintainance, and best wishes in
future activities and enavours!

I am fine with Philippe and Herve sending direct pull requests from
coresponding areas to Peter.

Aleksandar Markovic (5):
  MAINTAINERS: Add a section on git infrastructure
  MAINTAINERS: Add a section on UI translation
  MAINTAINERS: Adjust maintainership for Fulong 2E board
  MAINTAINERS: Adjust maintainership for Malta board
  MAINTAINERS: Adjust maintainership for R4000 systems

 MAINTAINERS | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

-- 
2.7.4


