Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC3646CE04
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 08:03:01 +0100 (CET)
Received: from localhost ([::1]:38284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muqyi-0005vw-Fu
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 02:03:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqgC-0002Qp-LQ
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 01:43:58 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:16960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqgA-0006Cc-LH
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 01:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1638945831; x=1670481831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SPZIA74TJTVMJ/EW0ChuA+m3vlMDh9qmBIfXrpPLqp8=;
 b=V6PZIlhDZ+OhAiQq3ynn5HTux1RMxmi/kqHzNjMiQbLQs37spkPtSlZQ
 nlGwjNfnRTys7ibXbyqxqQiyPV6DQzLdsfN0kjh+kppIMayopQHUzbpw+
 n36waf78AASXPnvQyz3dgk7JCTzuchN6SOvizKrZS1r9gC1rL496tsc//
 3HWnrhXVUsyW7d0zxtACFcEwF/yaUC9UcQA9oGv/dO9E4LaJPlFhlVulW
 NI/gqz3tT3vDpauqmWUpN86mhUHmWWpJVDoXlM+PJHlNgVHDJgHNMU7M6
 EnaWG/PC21z/mSN37Nr9ztM7y+zwuc0O/NWRKtv/U9a0+oy0jHf6S0WIy g==;
X-IronPort-AV: E=Sophos;i="5.87,296,1631548800"; d="scan'208";a="188732852"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2021 14:43:47 +0800
IronPort-SDR: lcwJPM8ilc9Dg/yj9ZWOhDjnnY/F5MaRvno92jWEq5H9XCjul3CFRqs+v7enZs1clPjOu56JM0
 COrKWFk4COX4JC5Ze8F0zMiZU4HbpUmwZaMRVq/GUl2JhLpr3lOwSIY8YshapU+lV3nXkdC95e
 ul1vAGhKOh1fTX6rct/VleAYb1cdWQsES/Rrp6dW7xC8RFYwPDBeEspIw+59jX8xj8Ifziy6FB
 ZpQ40CA0c1yYd2uJhW+YXfQIN7VWALji/EisaGa2unAInikZj5Y4IbXHUuDXdGP/eP1tWQrGS6
 NCXlM7BivGzcSC9WuBfzvypk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:16:50 -0800
IronPort-SDR: XmjEz9f6jpIntIvjH9hHezvM8RV8Tt+iA3fmQqk6O8TzM+CxiX1HkawbScNTFehs033F2b9n24
 VTIL5G52Bk8wgc92L7PW8qnKCbU1stjhrfZSegcYVKaKylYZtpkEGUvdiyhguqZo22uFw93mJc
 2CDVnriKv7/oDTzQRMPLT9l6xxN+GZdMwkLoPQSw7jAJGiNdNHeiHxg5K89z3PCQgD6yK0bK9w
 xa124S4WJqcM4z/j5op4Y0z/UcjVcIUc3Pn5UEFYGlG+Pr0T5qJ5jUNq1YWIbmkOMh6K3okZcb
 P4s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:43:47 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J870y1FDcz1Rwnv
 for <qemu-devel@nongnu.org>; Tue,  7 Dec 2021 22:43:46 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1638945825; x=1641537826; bh=SPZIA74TJTVMJ/EW0C
 huA+m3vlMDh9qmBIfXrpPLqp8=; b=o7GHGcrB4mSA3F62M9UTEa6y6QUwTGSLkS
 gysZVzRNTvKlWzpgBARmZztpYLy1B5UAFeS3i9esoQ+AHzsY8a9Rrh1I0j/nbYWF
 CcgH8ji1aq5vjQwm79mLuWQsCjT8XxdA5on0OEae+oPM8EKrzw9YLoRC1PWfa2Ef
 xR4E4v9LzMlTZzXzuJ9UmBX57mi3KRW5vIUHAVLKTxhgotHLtafpijVep8JHJMqv
 osDjva35/wzTROwooWuzn6zm9g01fBjJ4DNTsGWZKupdG7KtjEaIbmX1s5o7RSsx
 os9ADw3YOtMlX6vd+DEa5KemZENHGDBUmihM2Xt3pqlLoZjW08IQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id g37ZdXR8DhhV for <qemu-devel@nongnu.org>;
 Tue,  7 Dec 2021 22:43:45 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.65])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J870r73ztz1RtVG;
 Tue,  7 Dec 2021 22:43:40 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH 6/7] target/riscv: Enable the Hypervisor extension by default
Date: Wed,  8 Dec 2021 16:42:51 +1000
Message-Id: <20211208064252.375360-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
References: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=96943765b=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

Let's enable the Hypervisor extension by default. This doesn't affect
named CPUs (such as lowrisc-ibex or sifive-u54) but does enable the
Hypervisor extensions by default for the virt machine.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1edb2771b4..013a8760b5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -626,7 +626,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
-    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
--=20
2.31.1


