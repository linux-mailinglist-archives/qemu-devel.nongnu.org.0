Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBBE2D09EB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 06:06:11 +0100 (CET)
Received: from localhost ([::1]:43936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km8iw-0006r6-Sy
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 00:06:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1km8gp-0005bi-8d
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 00:03:59 -0500
Received: from relay3.mymailcheap.com ([217.182.66.161]:47145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1km8ge-0008Vx-J0
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 00:03:59 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id 5AC1A3F15F;
 Mon,  7 Dec 2020 06:03:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 9ADD62A3E6;
 Mon,  7 Dec 2020 00:03:45 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1607317425;
 bh=he4+ITVT+eWSjEMdmpF2I2R5NjPRB5oUE6IJxUTlBZk=;
 h=From:To:Cc:Subject:Date:From;
 b=rAzidl1/WTrESLwf8Ir6HEsUjo1YED2Qx6L4S6HH6a3UGTJt5CrAzbdXJgA2oRUyt
 JBsCxviERtxEBTyoFKE5CUiujOgOEsZCH7szSDgrePWdhJ4zu2UdR/f9Bhxc4e3B/3
 0bGcPjqa10TStp64CQltIiEYGOVJOYUehCvc19hA=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkaEIuAdRqyx; Mon,  7 Dec 2020 00:03:42 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Mon,  7 Dec 2020 00:03:42 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 3228441FB1;
 Mon,  7 Dec 2020 05:03:41 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="gKAXdRQl"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 097EF41FB1;
 Mon,  7 Dec 2020 05:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1607317397;
 bh=he4+ITVT+eWSjEMdmpF2I2R5NjPRB5oUE6IJxUTlBZk=;
 h=From:To:Cc:Subject:Date:From;
 b=gKAXdRQlg4gs1CdgeA8RN/0cUUNj/u2Qb/R/cPRponjHorxPNHbyyjqH5lC9I6fzx
 qxGD3bmPRyuWZC5dMcdKlXkjwcEaCl2xglQwK0As6i5ny7YYD8mhUIEfNFJO0WHp7q
 EkVTx06uX6BaMHR95kF2U7PFMxbvQcE/DvBCrMa8=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] MIPS Bootloader helper
Date: Mon,  7 Dec 2020 13:02:26 +0800
Message-Id: <20201207050231.2712-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3228441FB1
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
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Received-SPF: pass client-ip=217.182.66.161;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay3.mymailcheap.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: chenhuacai@kernel.org, f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

I'm back! Now I'm also helping CIP United, the present owner of MIPS
in China, take care of their open-souce infrastructures.

Btw: I'd like to add kernel boot tests for boston and incoming loongson-virt.
Where should I place kernel binaries?

Thanks.

Jiaxun Yang (5):
  hw/mips: Add a bootloader helper
  hw/mips/malta: Make use of bootloader helper
  hw/mips/fuloong2e: Make use of bootloader helper
  hw/mips/addr: Add translation helpers for KSEG1
  hw/mips/boston: Make use of bootloader helper

 hw/mips/addr.c            |  11 +++
 hw/mips/bootloader.c      | 150 ++++++++++++++++++++++++++++++++++++++
 hw/mips/boston.c          |  60 ++++-----------
 hw/mips/fuloong2e.c       |  35 ++-------
 hw/mips/malta.c           | 108 +++++++--------------------
 hw/mips/meson.build       |   2 +-
 include/hw/mips/cpudevs.h |  10 +++
 7 files changed, 216 insertions(+), 160 deletions(-)
 create mode 100644 hw/mips/bootloader.c

-- 
2.29.2

