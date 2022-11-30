Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19E763DB78
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 18:05:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0QRy-00046Z-Ul; Wed, 30 Nov 2022 12:00:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0QRu-000443-5W; Wed, 30 Nov 2022 12:00:42 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0QRs-0004lJ-Cs; Wed, 30 Nov 2022 12:00:41 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 9031011EEE2;
 Wed, 30 Nov 2022 17:00:35 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Wed, 30 Nov 2022 17:00:35 +0000
Subject: [PATCH qemu.git 0/1] hw/arm/virt: make second UART available
MIME-Version: 1.0
Message-ID: <166982763526.10484.9925072056712598801-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, daniel.thompson@linaro.org
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

This is a follow-up on older attempts to make a second UART
available for the arm-virt machine in normal world. The use case
is, that this give a simple I/O channel in addition to stdout, as this
simplifies various test scenarios. Especially for non-Linux operating
system,s (e.g. seL4) where arm-virt is handy as a generic machine
for testing purposes.

There are existing discussions about this topic at:
- https://lists.gnu.org/archive/html/qemu-arm/2017-12/msg00063.html
- https://lists.nongnu.org/archive/html/qemu-
discuss/2018-11/msg00001.html
- https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg01613.html

This patch tries to address the concerns raised there and also
avoid breaking compatibility with existing setups.

Axel Heider (1):
  hw/arm/virt: make second UART available

 hw/arm/virt-acpi-build.c | 12 ++++-----
 hw/arm/virt.c            | 55 ++++++++++++++++++++++++++++++----------
 include/hw/arm/virt.h    |  4 +--
 3 files changed, 49 insertions(+), 22 deletions(-)

-- 
2.34.5

