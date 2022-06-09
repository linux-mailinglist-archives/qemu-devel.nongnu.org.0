Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AF55445AB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 10:27:37 +0200 (CEST)
Received: from localhost ([::1]:51062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzDVw-0003W6-Dl
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 04:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nzDS8-0001A8-WA
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 04:23:41 -0400
Received: from mail.ispras.ru ([83.149.199.84]:50232)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nzDS6-0007Uu-39
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 04:23:40 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 4E0AF40737AB;
 Thu,  9 Jun 2022 08:23:32 +0000 (UTC)
Subject: [PATCH v2 0/3] Cavium Octeon MIPS extensions
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 aurelien@aurel32.net, aleksandar.rikalo@syrmia.com
Date: Thu, 09 Jun 2022 11:23:32 +0300
Message-ID: <165476301211.40568.5713018312386387782.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following series includes emulation of the platform-specific MIPS extension
for Cavium Octeon CPUS:
- basic Octeon vCPU model
- custom instruction decoder for Octeon
- implementation of arithmetic and logic instructions

v2 changes:
 - simplified instruction decoding and translation (suggested by Richard Henderson)

---

Pavel Dovgalyuk (3):
      target/mips: introduce Cavium Octeon CPU model
      target/mips: implement Octeon-specific BBIT instructions
      target/mips: implement Octeon-specific arithmetic instructions


 target/mips/tcg/meson.build        |   2 +
 target/mips/tcg/octeon.decode      |  41 ++++++
 target/mips/tcg/octeon_translate.c | 201 +++++++++++++++++++++++++++++
 target/mips/tcg/translate.c        |   5 +
 target/mips/tcg/translate.h        |   1 +
 5 files changed, 250 insertions(+)
 create mode 100644 target/mips/tcg/octeon.decode
 create mode 100644 target/mips/tcg/octeon_translate.c

--
Pavel Dovgalyuk

