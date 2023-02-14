Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AC6696673
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:20:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRwAA-0004Wg-AK; Tue, 14 Feb 2023 09:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pRs10-0007oO-Pg; Tue, 14 Feb 2023 04:54:23 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pRs0y-0001mj-EM; Tue, 14 Feb 2023 04:54:22 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 4CB8A11F07C;
 Tue, 14 Feb 2023 09:54:18 +0000 (UTC)
From: ~ssinprem <ssinprem@git.sr.ht>
Date: Tue, 14 Feb 2023 09:54:18 +0000
Subject: [PATCH qemu 0/2] hw/at24c support eeprom size less than equal 256 byte
MIME-Version: 1.0
Message-ID: <167636845806.2107.2382940753543768501-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, srikanth@celestica.com, kgengan@celestica.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 14 Feb 2023 09:19:53 -0500
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
Reply-To: ~ssinprem <ssinprem@celestica.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series includes 2 patches
1. Improve at24c to support 1-byte address EEPROM such as 24c01 and
24c02.
2. correct the EEPROM size for aspeed/fuji platform.
ref: https://gitlab.com/qemu-project/qemu/-/issues/1485

Sittisak Sinprem (2):
  hw/at24c : modify at24c to support 1 byte address mode
  aspeed/fuji : correct the eeprom size

 hw/arm/aspeed.c         | 32 ++++++++++++++++----------------
 hw/nvram/eeprom_at24c.c |  8 +++++---
 2 files changed, 21 insertions(+), 19 deletions(-)

-- 
2.34.6

