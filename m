Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C0E51419C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:55:17 +0200 (CEST)
Received: from localhost ([::1]:50316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIez-0006F0-1d
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJO-0000Mw-GI
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:58 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJM-0002Wc-PY
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206776; x=1682742776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xk6vRZRXkcs9cOUqxNsAshNYX7gU/teY1GDdoyIMC6U=;
 b=XQnQfKBLFiJ4UliuddRvTUs3flzjsvkgVYmlxBtGC+nak/NuDwcxAADK
 EEVo8a2cFLntEj3B56gf26rsSLaFMUyNOHmhLRLCexc/7MuYE7UtRNSAQ
 y02GUZsHUX/5wrDXa5Gl27P+1jlci3wQYexjg6dCHFAmuepAsZWHAg9y2
 W2t3X8ucTZ9g0WS17gufDpUGs2tTJxKde2uLOUWmbWnc4jYMyK2ItAErO
 XjB8s90B7Z9QIhC7Pyi1h1qAdQuJ9Gom3hjDzGcU5i66s4udKsgtO9v6u
 8fmO917gAm9QoskYi1HksSCAhvLvALTILPWbl+L/SK7CTifYuux9nmZgi w==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995983"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:39 +0800
IronPort-SDR: VHf37Eo4TfjOncJczwKWLpmcYEQeeeZ6iqKi1nPz6pPxptDRzZVOp6XIUiDiIXPVbNnINHpJuM
 96C9JhWQEeb6z8dSEanFEch2RMZiwRXq6lzYEp6tAfq4UlBMQRpWTBevRTzYclNyDhfq8G9SjI
 bnFINT0Ke5rUyvs7oyx3Tsbe5jwCeQBtrHLiWmf6mVs4pCm2cfSeNWWd6RqeJkb0pbQWYGSouV
 wJxhLUbTsJTgPAPHJBA+i3oJOOIObgxpKhaN2H5NpQiDywVW/VxT1xpuFpq1zHX3KJwow934L4
 rAQN7s/t1CqJlXl2lDuwPcEW
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:47 -0700
IronPort-SDR: eCtPg8KorCluqNOQxcsk2uiyqKqh57WVvBRPbF2LtRz674GCtEJtD2mVd6N+b0rNoCkr8jCwcF
 LxJJS0iX2uD7HV6xOZgHaZZIUkn0h6LvD5wXY4ktQWsiDv84IqRhk2EqRhaTltOSQtuXcIyB6l
 AiNLJqZj/CgCZPgw289zulQ2qfd2J6rhx19LsRbKlbz+1O00EDqMOV+2F32jKVzETzzbgBIQBE
 sydQpiZgj+j/06EmIAg8Xd6+DlwtXVLIGxlduSorYdqM1gpqjy9yTvBTtxJYYB7V7309lg0Rak
 3nM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKN744nhz1Rvlx
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:39 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206759; x=1653798760; bh=Xk6vRZRXkcs9cOUqxN
 sAshNYX7gU/teY1GDdoyIMC6U=; b=DhK6BkUWtNEr3gjAQRIpJBIoPMFqktV3zx
 kFsvFt0VmlrTPa502XX2VBSFi944vjypGo6jBlR3U5c9nU3eD3lIeF3BR/JbwwM9
 HYY3zAAMiDlQ4A19O/7MrueuuJhhFLHrgNoehE5l895GIIv/G1d23fB9AWdnHD8R
 Zx2suanJqAh/8aHg38YLyTYfRLjRivlBz5QDVc5/qnmziGgXE401ysKC33649X74
 BGpOM+OgfqffrU/h8uqJ1IxLK0wXawSW5s/gxTUt+UI58ghe2wNlG5DRS6bPyebr
 7WaXYHFeIYzlUB3BhX9TrCYYmyrqymQXqDSvQxYJXkp4YjwhmDhg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id l14DPmpiwWPa for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:39 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKN45jc9z1Rvlc;
 Thu, 28 Apr 2022 21:32:36 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Jiatai He <jiatai2021@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 19/25] target/riscv: add scalar crypto related extenstion
 strings to isa_string
Date: Fri, 29 Apr 2022 14:31:13 +1000
Message-Id: <20220429043119.1478881-20-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

 - add zbk* and zk* strings to isa_edata_arr

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Tested-by: Jiatai He <jiatai2021@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220426095204.24142-1-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dff4606585..ccacdee215 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1005,7 +1005,20 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, ch=
ar **isa_str, int max_str_len)
         ISA_EDATA_ENTRY(zba, ext_zba),
         ISA_EDATA_ENTRY(zbb, ext_zbb),
         ISA_EDATA_ENTRY(zbc, ext_zbc),
+        ISA_EDATA_ENTRY(zbkb, ext_zbkb),
+        ISA_EDATA_ENTRY(zbkc, ext_zbkc),
+        ISA_EDATA_ENTRY(zbkx, ext_zbkx),
         ISA_EDATA_ENTRY(zbs, ext_zbs),
+        ISA_EDATA_ENTRY(zk, ext_zk),
+        ISA_EDATA_ENTRY(zkn, ext_zkn),
+        ISA_EDATA_ENTRY(zknd, ext_zknd),
+        ISA_EDATA_ENTRY(zkne, ext_zkne),
+        ISA_EDATA_ENTRY(zknh, ext_zknh),
+        ISA_EDATA_ENTRY(zkr, ext_zkr),
+        ISA_EDATA_ENTRY(zks, ext_zks),
+        ISA_EDATA_ENTRY(zksed, ext_zksed),
+        ISA_EDATA_ENTRY(zksh, ext_zksh),
+        ISA_EDATA_ENTRY(zkt, ext_zkt),
         ISA_EDATA_ENTRY(zve32f, ext_zve32f),
         ISA_EDATA_ENTRY(zve64f, ext_zve64f),
         ISA_EDATA_ENTRY(svinval, ext_svinval),
--=20
2.35.1


