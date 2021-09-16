Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918E540ECEB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 23:51:40 +0200 (CEST)
Received: from localhost ([::1]:51046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzIA-0006xA-G7
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 17:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzG4-00049m-0o
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:49:28 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:30129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzG1-00023N-GZ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631828965; x=1663364965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JAjCL/YBrrsIN6lr0YfwCaKEn9AIJQHYJAHcywrCO+Y=;
 b=O2HltT37iglOqZmcuvTzhYBZzDGU+v6zX4ULOMn+RTtaE885P1iI9gM7
 HfjFTZYwGy0juFaVFCIOQjAOLyreSA5RTzvXFOCUKnDb8OLnQPb9GrEzq
 a4g4iiU+/rMWM2lTIwVoIftgOxhyh0/T+0Btn9A1+SdHCl+Ik1JsNPRCt
 uNUfF40VG5CVEQfUl2A7+CfKPibuBnuBKQ8u078Yij7IVcGcy3s/hqNk5
 xdWHcEGDbsqpG1KrarYaCfBWIGADyt1QPFZtZ3qIsKxhmXayYUxsYSOQ2
 7x1loeG/04J08avDwsaNjhByZM4pU32Ptyk22tXBceN0FTPnumjNiweeM Q==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="291828380"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:49:23 +0800
IronPort-SDR: rZpeMlNVYMoOvUXcL+Ln9YtTWbqOLQgkOfiwIUrF2Fc6NovnnhK5Ds73RwbehSmSk5Kjh0FhU3
 WgnazLmN7FGtutT+l9Wmy/FQuKY92gPadQo1jCkroYA9SLHlCJdILekBD4OsUTfPurAL/kG0El
 UM9ZA+Iax3PMsWXXmbbIhYEggmwNHS9IMNqcU3rwd/NMmbfPxOhUJ4hyFQ94FWF+QWZkMVAwKD
 lHlnhZxdR9zgQhZg8wNUZM1CkaupdzUbkUYpEzS1s0HKhkOYfGaDbz5tKx9uQ/vYb3WXmDY+fW
 aM5qg2WsU0ZCnYACz78pg02h
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:24:11 -0700
IronPort-SDR: Oa+2kV7WcDtPDJGiAc9A9AZV6PJXrj/2nJGk7awOD/orcOsMU83+Iql3kOVLhJvcJLIi5t7a1V
 UOrNqlc+B+A2wTIHEkOZ6giEGq1E3UgfOX79rBZuHb7B4N79rBjRM/F5tvrK5tqma0ul2ALyA5
 k0HNEx/P1UL6r7OeHsBdH49UCyLg4sDKXutIu3lABPsAljkzUjbuWT8QLDTJLz+lP78B0q2lQQ
 q5/zQTkfZX4W1U1G6WYilqIDn2YhfBmz9ZZAD0HFVt96EobzATxjiXurzOUH0vY3a+Ni12PotU
 jbs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:49:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W2C6f58z1Rws4
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:49:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631828963; x=1634420964; bh=JAjCL/YBrrsIN6lr0Y
 fwCaKEn9AIJQHYJAHcywrCO+Y=; b=rQC/Z510jEdLr4UtzrqeFt92KW5aXrHBPI
 bXhPphJkuSJoOLQcYfJYtuS3txRjydtwcfaKZEufVXC3JbLZMHA0M8AJ+0rymer9
 lnrtc25Kgd92W6vokOkYpBCbHMQ4Bz2MKzrQV4wf43SNM0psBixKvRHtWoYVbazJ
 WnhnmKKJmAqAa+OgPmNoR2Ne06vljTm3ksbzEg35uIf3VNZqk/7DMlE+c67nTVvs
 MHZn3tOO6DikkbeUj1xGHVsU2RejTrmw7aM882LQ43VtDMRvH/m7qh1YUwhu7JIq
 8qG45v2E9iYUxL+qLU4+7X28ZZc4uEh7jyc4A0kuz+S3XjZPFrbg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4hVx_rm8MYXy for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:49:23 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W273hXNz1RvlV;
 Thu, 16 Sep 2021 14:49:19 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 02/21] target/riscv: Fix satp write
Date: Fri, 17 Sep 2021 07:48:45 +1000
Message-Id: <20210916214904.734206-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

These variables should be target_ulong. If truncated to int,
the bool conditions they indicate will be wrong.

As satp is very important for Linux, this bug almost fails every boot.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210901124539.222868-1-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 50a2c3a3b4..ba9818f6a5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -986,7 +986,7 @@ static RISCVException read_satp(CPURISCVState *env, i=
nt csrno,
 static RISCVException write_satp(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    int vm, mask, asid;
+    target_ulong vm, mask, asid;
=20
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
         return RISCV_EXCP_NONE;
--=20
2.31.1


