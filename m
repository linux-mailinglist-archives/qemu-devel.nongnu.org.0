Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289DA63E057
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 19:57:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0SFs-0000mv-Ko; Wed, 30 Nov 2022 13:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0SFn-0000lf-Aw; Wed, 30 Nov 2022 13:56:19 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0SFl-0001LP-Jx; Wed, 30 Nov 2022 13:56:18 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 9702A11F1E5;
 Wed, 30 Nov 2022 18:56:16 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Wed, 30 Nov 2022 18:56:16 +0000
Subject: [PATCH qemu.git 0/1] hw/arm/virt: add 2x sp804 timer
MIME-Version: 1.0
Message-ID: <166983457648.13115.4940680286975412418-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: ~axelheider <axelheider@gmx.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch adds timer peripherals to the arm-virt machine. The
use case is, that this machine is quite useful for testing purposes
when it comes to non-Linux operating system (seL4 in our case).
However, is currently lacks a dedicates timer peripheral, so some
scenarios cannot be tested easily with QEMU. The RTC cannot be
used, because he resolution is too low. Since the sp804 supposed
already exists in QEMU, adding these peripherals seems easy and
it does not appear to break any existing use cases.

Axel Heider (1):
  hw/arm/virt: add 2x sp804 timer

 docs/system/arm/virt.rst |  1 +
 hw/arm/Kconfig           |  1 +
 hw/arm/virt.c            | 47 ++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h    |  2 ++
 4 files changed, 51 insertions(+)

-- 
2.34.5

