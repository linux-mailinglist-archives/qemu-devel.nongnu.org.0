Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536BB9DE46
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 08:58:12 +0200 (CEST)
Received: from localhost ([::1]:47476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2VQh-000741-1m
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 02:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52446)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1i2VPY-0006Vn-BW
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 02:57:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1i2VPW-00029o-Ex
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 02:56:59 -0400
Received: from ozlabs.ru ([107.173.13.209]:46758)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1i2VPW-00028b-8Y; Tue, 27 Aug 2019 02:56:58 -0400
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id DD5E2AE80016;
 Tue, 27 Aug 2019 02:56:32 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Tue, 27 Aug 2019 16:56:50 +1000
Message-Id: <20190827065650.107319-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 107.173.13.209
Subject: [Qemu-devel] [GIT PULL for qemu-pseries] spapr: Render full FDT on
 ibm, client-architecture-support
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d6bb8b27204eaa58f1da948b65454e3a598ab2a4:

  pseries: Update SLOF firmware image (2019-08-27 16:47:04 +1000)

are available in the Git repository at:

  git@github.com:aik/qemu.git tags/qemu-slof-20190827

for you to fetch changes up to da9960a5aaa25d27c9798c3d94c7b4c2d8af31ac:

  spapr: Render full FDT on ibm,client-architecture-support (2019-08-27 16:47:46 +1000)

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      spapr: Render full FDT on ibm,client-architecture-support

 hw/ppc/spapr.c | 90 +++++++---------------------------------------------------
 1 file changed, 10 insertions(+), 80 deletions(-)


*** Note: this is not for master, this is for pseries

