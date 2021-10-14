Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FF242E281
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 22:14:50 +0200 (CEST)
Received: from localhost ([::1]:41980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb77p-0000tL-DD
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 16:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb75U-0006VG-KQ; Thu, 14 Oct 2021 16:12:24 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:12169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb75R-0002Qd-Rt; Thu, 14 Oct 2021 16:12:23 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 51A54756062;
 Thu, 14 Oct 2021 22:12:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 35F06746333; Thu, 14 Oct 2021 22:12:18 +0200 (CEST)
Message-Id: <cover.1634241019.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 0/6] Misc pegasos2 patches
Date: Thu, 14 Oct 2021 21:50:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some small clean ups and improvements for the pegasos2 machine.

BALATON Zoltan (6):
  ppc/pegasos2: Restrict memory to 2 gigabytes
  ppc/pegasos2: Warn when using VOF but no kernel is specified
  ppc/pegasos2: Implement get-time-of-day RTAS function with VOF
  ppc/pegasos2: Access MV64361 registers via their memory region
  ppc/pegasos2: Add constants for PCI config addresses
  ppc/pegasos2: Implement power-off RTAS function with VOF

 hw/pci-host/mv64361.c |   1 +
 hw/ppc/pegasos2.c     | 162 ++++++++++++++++++++++++++----------------
 2 files changed, 101 insertions(+), 62 deletions(-)

-- 
2.21.4


