Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474C4412EE0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 08:58:08 +0200 (CEST)
Received: from localhost ([::1]:46036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZjC-00021L-U7
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 02:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZfq-0007a7-K5
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:54:39 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:32908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZfo-0003Yx-VB
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632207277; x=1663743277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JAjCL/YBrrsIN6lr0YfwCaKEn9AIJQHYJAHcywrCO+Y=;
 b=gM4hk5OKRszYGWXl8a5yhRNjPAZ8PFibyfw0Xu7mCbJTr9QedJXzBhJp
 gr5uNHjLjnSsIwlCQSghIpK2465oTSN6IR+/y3blK0d/Lx2iO426jL2ST
 enwK63tb96B7PF1eHcChExI66waDQVBLiWnsw6S/2QbnUXArqSZHcCYAe
 b+KSLSOVfhD/DxEnZ2s8l5bafIdNtXX76+Bi3OXkO9YZzA6K6Ej42f/fu
 NM2XeVZSzxbKe1Nx8ZYTxXn3lemSNhY0zyoJwn5DxzRmCYl1PmsjesvL2
 kBfa0FZxfgHqX8lCaDqNFZcrO6XryYEyUm0N+QtKJMHyjkZ1ZjTXJqt7G g==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624291200"; d="scan'208";a="181039194"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 14:54:36 +0800
IronPort-SDR: kwXzHysLXnGugceOOxo7SUoToEp8piOlBEw+beeBq6nveWZ7G+ygTs30YuaXRHvvA7oVJYM4z8
 1CPPsniI2V4mIDgRZPqMPgypKXXaWxlgqZxuIgpIeLmCwAQOxavCZT6yVnj7+SkL8St1gHqPUa
 8vFxris+Aa+ESk40SobmXYlmbKrqtkwmlzW449BEnfweULObN9gyoTNx1oVm8hjezom2kJYurS
 B7gu0fe5iN5y/Kfxu2M5nzUkyBaAPUcLqrCHAbqtnJkEUNB01d8XRa3V1SntOBTT8WVVWqoAud
 kd8/S9yCXjX6MiiUWPjLPMFI
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:30:49 -0700
IronPort-SDR: boz3thHWapmoPvTa/DW/an5MsVT8Ol5rpIH+VCAGustW8DqaJSN8aZ2WbSLhYTI0aqjsPOVwbm
 K/oSaahfLi7517ZXrvOf/01ldW2DjUt5Zk85LwZ6kpELMepQ+yZOwsX8iJJv7rVXEuVutEFfWb
 9115uRhjWUbK/tmuXEBB/h8sZ/9w6irmIYqNIga4upza/DZZ2OgUxqrKI26WsuPb66ABn5ezvQ
 rwjE9agNnVRZ0iId4gd+ezac3XqEslSOfqtfAGILDjdMHJuTPTKiSqPU7dGY0PTN/YGTX4gXVz
 /Hg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:54:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HDBxR0X7rz1Rws7
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:54:35 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1632207274; x=1634799275; bh=JAjCL/YBrrsIN6lr0Y
 fwCaKEn9AIJQHYJAHcywrCO+Y=; b=QR2H4Ck9frzUZjPEbIBXF1wenIRMQyfg3Q
 4y62khqC4sIK7+FfVGgI54WkUzbSpBjgCfT6/wQDWdz+Rl1SJRS33ACJWW63aIo4
 nwtswK2y2HBeB2MOXF3o1qn6Hdys2vnJxHpOYHBwP9slaBPptriEwnnGTh4I/vZi
 4lVR3FDqqHwt4yY6UPmFpKkCDuh/+hiT4v2sPUusCAB5W4MTnUnbWWkhwJp3nFWo
 4gUSexwE92y3TtHtVI1/AU79BDXIxShKomZLpVc+sdTgljs3xeC8rsSYw6yByPPX
 GUAkCm5hbpI9eWpPqGtAVvUWJxV/vBDdqx7ObuQFGUwFSPFDpoOw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id O4mtypHE4h3u for <qemu-devel@nongnu.org>;
 Mon, 20 Sep 2021 23:54:34 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.26])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HDBxL2JFPz1RvlH;
 Mon, 20 Sep 2021 23:54:29 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 02/21] target/riscv: Fix satp write
Date: Tue, 21 Sep 2021 16:53:53 +1000
Message-Id: <20210921065412.312381-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
References: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=891501f09=alistair.francis@opensource.wdc.com;
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


