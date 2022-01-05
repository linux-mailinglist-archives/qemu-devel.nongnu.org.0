Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADC3485B45
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 23:05:46 +0100 (CET)
Received: from localhost ([::1]:52142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5EPi-0003wu-0S
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 17:05:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5ENA-0001Wg-AO
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 17:03:09 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:55126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EN8-0004wo-PO
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 17:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641420186; x=1672956186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZGx1B3MgM+U6Kfsl3iEYfy3ZvGCUTB6i+cs1K5eEnAk=;
 b=McT9FYyfICZVIvurSGiyL3xphDoi2RsoXc8daTv1bU+QauEB+2glckfF
 rKLEzapsZ5s7r8aETdFiktgBqueVlJIdF60Lm5kaVvcIuL29mssbtLepT
 SrJfzRL8IBQAOX+nJ6XW0ZEFboo3KnG28nrtbUhMhIwzdg4CP6Q6c50cQ
 ssOpatByAnlQh2ZsYgMOVjrhgwsg0vxbmP8hTs6KoSiKUxaq4dBJuEIa9
 wE3B7dFaU4DqU6E6NEk13VgCUaak0uaYNSdjup7MnDi3xTLtOW2VzY6v4
 9OcmWf8fum6QxaYfGr5zQRdVJATh/D47iB6eY95qmDwzHHnqcKA2/8FgL w==;
X-IronPort-AV: E=Sophos;i="5.88,265,1635177600"; d="scan'208";a="293830349"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2022 05:40:19 +0800
IronPort-SDR: yAn4odw+q/pTmDvuFCOHK5sbuswEZUnbIH7I6/0SAMwIxpoebnvhdJel2yMkYvGPS0/4jjsIuv
 kdjmBIy/BzkHYuYowhG/BN0EQTLESPGwi7f+H3xfvE5NbHIegMtBatYI6moBztSMD6rzOXMDWd
 uXVw6m4/PEx4Am1KjEHJnlSHxRNxo3WjV6szVuM1D6u3+uaNoz4tZpqAiC2vy9VTkaNgcnZqMY
 S9snOqioye+cCSd7JOFit0td33yPRAz73iu9q91IeWpOyBMcxlFk3BmU2GTYZcae2/m91wWceC
 PrLjCKdy0rdIUtxtbOOYte7d
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:14:11 -0800
IronPort-SDR: cHkPl5Hxg4XlTI5LZ29ZyVI2Yd04kahAbzaubGE1lQNQ00mtghQd2T1M9YXXDNNm0jbsl/pTKF
 8awzuPyINXxsZlp2/ClsDUWDH4Z6VfEXySHF9L9gQuVWrkFTjWCxz8JdMT6lX0Kzn3NwhkRYma
 6wBE5Xrg1v83rY6JP7HzMO/XQT+UZHWmcdwqiGlYT7JZ7akbNE/b+MOtiewhiHDXtBHmAJNtlG
 WqfA+n4XGWPtcePfJxJNQXZ44tIaoy1wK5VYR3PFdW77y07CivJI1sJIu2gqlUTDxWHTvgSE+s
 8xU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:40:20 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JTjZW2JCsz1VSkk
 for <qemu-devel@nongnu.org>; Wed,  5 Jan 2022 13:40:19 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641418818; x=1644010819; bh=ZGx1B3MgM+U6Kfsl3i
 EYfy3ZvGCUTB6i+cs1K5eEnAk=; b=HwTyC69yi/HyiZeCZdY6VHp/HP6oFlWV6a
 aaIHLUb9xQn3uMtbMwBI6crIA29NjdRu1W6zNUHUgY1WHcqvONoQgVrVU2dfX9hr
 38zXA87Hvep0QiWg5Pg1xQddHPe1wUL1YL/CwIgwfRV51HJSTaOI+MU0KXppjiMP
 cfWLnE/AH6kPuGUBc7JkXAWS0bSIlQVxWvQXs1rnmjgbUXueENCWmLEVb9Iz+h1G
 ZYmvY/uQ99LnJ45EHADOrzFDfDUk9x0qUvylvJaaQfKDryW62Flk/MRqnBoP6ET9
 JD2Se8VaNRiEzYxq+dcKFVOjrXZR3X9XypH5SQwqnFr0T/LNoMSQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id eCh-XbA88M_6 for <qemu-devel@nongnu.org>;
 Wed,  5 Jan 2022 13:40:18 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.73])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JTjZP01mwz1VSkV;
 Wed,  5 Jan 2022 13:40:12 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
 alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 5/8] target/riscv: Mark the Hypervisor extension as non
 experimental
Date: Thu,  6 Jan 2022 07:39:34 +1000
Message-Id: <20220105213937.1113508-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
References: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9978dc08b=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

The Hypervisor spec is now frozen, so remove the experimental tag.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6ef3314bce..9ea67bedd3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -627,6 +627,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
+    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
@@ -645,7 +646,6 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
     DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
-    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
--=20
2.31.1


