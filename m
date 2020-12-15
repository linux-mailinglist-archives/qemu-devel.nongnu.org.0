Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3998C2DA82D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 07:45:08 +0100 (CET)
Received: from localhost ([::1]:58336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp44z-000495-Bs
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 01:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kp42Q-0002X3-MP
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 01:42:22 -0500
Received: from relay4.mymailcheap.com ([137.74.80.156]:37773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kp42O-0003yW-17
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 01:42:21 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay4.mymailcheap.com (Postfix) with ESMTPS id DC0943F162;
 Tue, 15 Dec 2020 07:42:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id A556C2A510;
 Tue, 15 Dec 2020 07:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608014536;
 bh=cGmOSUpqmmDaRutuNIYSbq+9gyN9f/epd4xjCNcUhBA=;
 h=From:To:Cc:Subject:Date:From;
 b=rhP5fc4247BdQS91uxZlZsXgjWPJF7zcLZh7zRPuRzWf91FG9FQq+rG9LbH30TmoH
 GRmMRxHtkVP3qhk1HlO0CJswrBWUKf8zDbDm9777JsREwOH5uMI1N9VwMIWhut5rRJ
 nx2B3Z2DCFPHO3zcY2dpQZdiI8Ya4C4odaPhEf+Q=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cz4NK2_-hbEt; Tue, 15 Dec 2020 07:42:15 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Tue, 15 Dec 2020 07:42:15 +0100 (CET)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 305D041001;
 Tue, 15 Dec 2020 06:42:13 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="mwVePDwK"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 0649140026;
 Tue, 15 Dec 2020 06:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608014528;
 bh=cGmOSUpqmmDaRutuNIYSbq+9gyN9f/epd4xjCNcUhBA=;
 h=From:To:Cc:Subject:Date:From;
 b=mwVePDwKoUK0HT3jne5ZS3yNPLHYNGvyp4Em/p3TWERgPpzogRZWucz2U9Ho1Y5Gs
 yaX7dezz+i09qhnUAmvtDypRacufkrHssD6QD1Usvhm9++/ZfrDpx4WpwqtLJxR+ep
 BX1drreBkbiQbJN3Q8xW2OuZ83Xt70zOmtZBaxG8=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] MIPS Bootloader helper
Date: Tue, 15 Dec 2020 14:41:52 +0800
Message-Id: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [4.90 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 R_SPF_SOFTFAIL(0.00)[~all]; RCPT_COUNT_FIVE(0.00)[5];
 ML_SERVERS(-3.10)[148.251.23.173];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Queue-Id: 305D041001
X-Spam: Yes
Received-SPF: pass client-ip=137.74.80.156;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay4.mymailcheap.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, chenhuacai@kernel.org,
 f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
A big reconstruction. rewrite helpers with CPU feature and sepreate
changesets.

Jiaxun Yang (8):
  hw/mips: Make bootloader addresses unsgined
  hw/mips/malta: Use address translation helper to calculate
    bootloader_run_addr
  hw/mips: Use address translation helper to handle ENVP_ADDR
  hw/mips: Add a bootloader helper
  hw/mips: Use bl_gen_kernel_jump to generate bootloaders
  target/mips/addr: Add translation helpers for KSEG1
  hw/mips/malta: Use bootloader helper to set BAR resgiters
  hw/mips/boston: Use bootloader helper to set GCRs

 hw/mips/bootloader.c         | 157 ++++++++++++++++++++++++++++++++
 hw/mips/boston.c             |  62 +++----------
 hw/mips/fuloong2e.c          |  48 +++-------
 hw/mips/malta.c              | 171 ++++++++++++-----------------------
 hw/mips/meson.build          |   2 +-
 include/hw/mips/bootloader.h |  48 ++++++++++
 target/mips/addr.c           |  10 ++
 target/mips/cpu.h            |   2 +
 8 files changed, 306 insertions(+), 194 deletions(-)
 create mode 100644 hw/mips/bootloader.c
 create mode 100644 include/hw/mips/bootloader.h

-- 
2.29.2

