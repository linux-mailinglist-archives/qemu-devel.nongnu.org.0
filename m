Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1287E2DB8E9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:27:33 +0100 (CET)
Received: from localhost ([::1]:39658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMXL-0006BC-LE
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:27:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpMVb-0005FB-9c
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:25:43 -0500
Received: from relay1.mymailcheap.com ([144.217.248.100]:53915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpMVZ-0003e4-9i
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:25:42 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay1.mymailcheap.com (Postfix) with ESMTPS id 754453F157;
 Wed, 16 Dec 2020 02:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id B7A122A5BB;
 Wed, 16 Dec 2020 03:25:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608085538;
 bh=U3/5owsoI3S0Gp4du5zVkDF1QUvFkj6MgJUeJLd1igw=;
 h=From:To:Cc:Subject:Date:From;
 b=FsOIE/jjgmd8wKoUt+ZhDCIW6apcGOgNn2C5GxNUmb1+Z99b3ZhdCP6c3LYnospWy
 Me4KGFgs1ZPp9lxZxeOzS3nrqbUGWDvqphsgzSYU5IRvg2eS7H6zbYFLm2q1Az7NpJ
 p6nZV5fPcjdNCxYJqtg0CXvK+jP4YYnjqbRrj1Co=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H0H6ARvyKkGV; Wed, 16 Dec 2020 03:25:37 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Wed, 16 Dec 2020 03:25:37 +0100 (CET)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id CF63642E7F;
 Wed, 16 Dec 2020 02:25:35 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="Dl9CHNxk"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 00C6142E7F;
 Wed, 16 Dec 2020 02:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608085528;
 bh=U3/5owsoI3S0Gp4du5zVkDF1QUvFkj6MgJUeJLd1igw=;
 h=From:To:Cc:Subject:Date:From;
 b=Dl9CHNxkuxFUoD7ma3+SqyKoJLRQ/6GQ0UGk4BLu2TTtQ4p+EvyZbXBH97PqwUtwV
 iS+aOVVsyuC83/1nxGF2NdWGNesxYuHGAKz6ZhJM8kzPLID7Tbg3/2tfiOzfCpJhoZ
 JH7qBelEgk+SOA7xc5tHB9xC2FybcqcUQYdHO/dE=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] hw/mips/fuloong2e fixes
Date: Wed, 16 Dec 2020 10:25:06 +0800
Message-Id: <20201216022513.89451-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [4.90 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 TO_DN_SOME(0.00)[]; R_SPF_SOFTFAIL(0.00)[~all];
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
X-Rspamd-Queue-Id: CF63642E7F
X-Spam: Yes
Received-SPF: pass client-ip=144.217.248.100;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay1.mymailcheap.com
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
Cc: chenhuacai@kernel.org, f4bug@amsat.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It can now boot Debian installer[1].
I'm going to add acceptance test for it later.

Thanks.

Jiaxun Yang (7):
  hw/mips/fuloong2e: Remove define DEBUG_FULOONG2E_INIT
  hw/mips/fuloong2e: Relpace fault links
  hw/pci-host/bonito: Fixup IRQ mapping
  hw/pci-host/bonito: Fixup pci.lomem mapping
  hw/mips/fuloong2e: Remove unused env entry
  hw/mips/fuloong2e: Correct cpuclock env
  hw/mips/fuloong2e: Add highmem support

 hw/mips/fuloong2e.c  | 68 ++++++++++++++++++++++++++++----------------
 hw/pci-host/bonito.c | 45 +++++++----------------------
 2 files changed, 54 insertions(+), 59 deletions(-)

-- 
2.29.2

