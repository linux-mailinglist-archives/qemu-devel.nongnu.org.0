Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA85743DA97
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:54:31 +0200 (CEST)
Received: from localhost ([::1]:36392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxQr-0003l3-MI
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHB-00084K-94
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:29 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:41722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxH4-0002ce-Jy
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396262; x=1666932262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NYpkni887wsvZV9VMS0VGs5wJ2vISIuVhBmrnIJ8b4U=;
 b=I/cMqDNU6s15AvLmGfsPlnzgKdGHCy6NFjud61iZG1LiOqrkkuuSa8SZ
 Umh5qE/aG9pI2brHmDw7BfDQnPkrxP53lobRrp3ScSfGapZgVrPcoE6tp
 e0DLn+a4LzRBkB67tXlFlYYGGigMSU7wP4bSuDYdzpT0ZdRfagmj6GkA/
 lrwPeT0yBGEg+Y2ngf92WSGFj22FZL0xS5/xhNdDi7zOgU6otJhrpNWnX
 EFibxlR/D/QoFwrN5rehVf2ZWNOMvV789FYzfdvSQUJHfjUHYcYi2X0Qc
 TgOCiplqK7+DDu7uBWnipBQ+tw7wchUGz6mslcuj5uALliPoowzOG6stE Q==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="184975499"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:44:22 +0800
IronPort-SDR: b3mo7HKIJOJM5P1QPIvNWjNjqPKWPdcSO9MZ9ywHeyQXLp9JyORbtdJV+3M3Es+LFT5rmoYj2I
 VHyo5RYpxLz+X07pmSkv/RKCb83hN/lMD4a2L3SwFn7DeyH1pZRiJXpCub5KavbV9rno7qHR2k
 80IG0+IYevYWG458lCwUCGQApGvd6zL2lTSyW8RaOYiavwexptVylHoajqcovJNN/b67YQJcFL
 uDfybApCa6p7A74cHVeLbKllmPzQLiGcbwQzAXAUyXVVv8f9Is/ApmU5kanr/wIr77Ka7gAizF
 Yqzwm82MFG4wwMHXkdtfDDtB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:18:17 -0700
IronPort-SDR: DYUKaFYB4hiX4d5ee6crPNDMGrA6khsYrMiTcrSynNl/QWR9RKyr6OC7jK2K3YjFgxzf1nhS94
 4JWaJt5dhxftnGdMFGPUHjkOUk+Qvsh8JSFXA6jd39wIInL5lPla6pcwSFj7hF8znEmQBC51tz
 11vaS3ASs1wLHXpY4QtaA89+gF9P1W22M3JCRZJOzkLfyqI2cPJPui8CS196p/ICPjDzzpGAGC
 +qRkHr7u3+XonGbMbElW0Zq0GHoV9nHzRAaQdLxthDxc3rRKIi7SCTK6yr+Ndl1RM+Rv7ochE0
 Jx4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:44:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftJ553sxz1RtVn
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:44:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635396261; x=1637988262; bh=NYpkni887wsvZV9VMS
 0VGs5wJ2vISIuVhBmrnIJ8b4U=; b=IJtbyPKYJFndEQhwrKB/C40uKlWCBWXjHL
 E5V3a/E3oY1lkdNYoRjGpKSluM9Oa1JmStdmt3wcwMUSoCGk07ShYPTVwWMUULJO
 m2iJl4Gwtw0VBTeoMcHQighMuhUMqg2F/CwnexDLa/8dZuux8pLo9h/nr6QfwGRY
 zmA2t/0xj6E9fJNw5Ve3zlcwK9oZeQhL7exstoZAh972DgKqpz96MIyw/ddCqkaa
 E4eyNR2q94lfR8bWlLEzOQHhWMafr3s1bDHDfp/qqKErXHyyYP37ZSHIG6xpAa6W
 vv+Re/bYN7+Bwts7L3tCOZI4mGRUx6KFQbmxHnRBoPJ6iLTY/MiQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id bYyQBgl3IC4s for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:44:21 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftJ224pQz1RtVl;
 Wed, 27 Oct 2021 21:44:17 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 06/18] hw/riscv: opentitan: Fixup the PLIC context addresses
Date: Thu, 28 Oct 2021 14:43:30 +1000
Message-Id: <20211028044342.3070385-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Fixup the PLIC context address to correctly support the threshold and
claim register.

Fixes: ef63100648 ("hw/riscv: opentitan: Update to the latest build")
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20211025040657.262696-1-alistair.francis@opensource.wdc.com
---
 hw/riscv/opentitan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 83e1511f28..c531450b9f 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -161,8 +161,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
     qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 0x18);
-    qdev_prop_set_uint32(DEVICE(&s->plic), "context-base", 0x200004);
-    qdev_prop_set_uint32(DEVICE(&s->plic), "context-stride", 4);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "context-base", 0x200000);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "context-stride", 8);
     qdev_prop_set_uint32(DEVICE(&s->plic), "aperture-size", memmap[IBEX_=
DEV_PLIC].size);
=20
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->plic), errp)) {
--=20
2.31.1


