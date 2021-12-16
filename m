Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9931347694E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 05:59:44 +0100 (CET)
Received: from localhost ([::1]:53872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxirn-0003a4-OK
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 23:59:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinS-0003IG-Kh
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:55:14 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:63333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinQ-0003uZ-SZ
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630512; x=1671166512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SPZIA74TJTVMJ/EW0ChuA+m3vlMDh9qmBIfXrpPLqp8=;
 b=lenHX9z/f8MXBVj2g5ZXKSh4IrbRIawdCdKZ2BRGjAEHi2niV+YLpzy1
 hLaxa1gWQzw7o+nZK6GJc2e2bk4yWs19MCyhO2T/H+IVZAzj99fqvyeYP
 odRl/HSTBHYoFUMBHNXjT0jckgpi9X+C2qLcovpjFI8yM+XKZ7gMWTIxN
 Hlk+1G493K2nyxIHLE72he3bXwhNifzhdPd54DQ0NwiCmbB4HV9AVn/h+
 jC/5Gt4QmQqCHq35HEIm9t39RiUvAi7BDTIxcq2I6+tJky1MwsDcgk4+H
 GPvkYRkovjAyI3053xvVL+BtkIqzKDTIUMC9qoNXnWmKref8gmXckSCSI g==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="292375155"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:55:11 +0800
IronPort-SDR: m6oWUgVERFMGpZasgftgcNdzz2GzOO+v5EI5Sn6uHMhoZZ8mbVF8QbefqA434Q6DYH4G8+YsQU
 Hjzjegw3CjPSr6MUPY57ctocfNr3KrxWEOYLIADbu5P+5QYzQDO6Pa7tq3Z3+MUllZtW2l4Tbq
 F0gPkuKZqUq8mGfMSWAXT3iHUnT8xvMu70kTmdQNH89vzl90NZVXtjDDPqDpz6znIgBlM8V+xE
 1dmAWp37FBKyN1LY7ZJ5oUx/jEDic73e7VbrP6vpTFpp02xlY3bgmh1ZZ/dXIwVJou0WyhX0q9
 RJl99kQwaFWsah0AsEgAkjJs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:28:05 -0800
IronPort-SDR: tp/B32USnrTSQJ/WNDEYhGLzxnIuLSP57TfvwbeP63HRYKxAXSfd3nFwzCO1Gz5AoeiiAMGKK4
 fPX2fQsBSB7e11v5IoSIsyk80ajzJaeMDmF0Dlp8S2vxVbNWdh7bxAMeH1KhR+cRkaY/CX0189
 /Pj43bFG6gr7LiLzcwkqNmCUT5cjLKQhiBg6GUsWEy+t4WCkqcubz16RkDfCW4YzWrY9OxorwS
 1/RXzJvZXV5GmzMNXsHNX5jw7K23EtwiLQ+hQhcqEeV7r/YDymSGKixL9zgxANmygstdIU1eSQ
 BCQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:55:12 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0Cz0ljdz1RwFN
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 20:55:11 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639630510; x=1642222511; bh=SPZIA74TJTVMJ/EW0C
 huA+m3vlMDh9qmBIfXrpPLqp8=; b=bmRm9JlPdOT5BoSsP9M15mYKN4MWF+6rg+
 0sHrOxZI7h49AYRBP5Kof+9w/zo+yuAHBP9FnIshetKGFYbYqtc8IYRzTLVKmhFj
 RXEEgrUinJpePGFDxiWUuTt/pPeDs6XssoBwJacsVM1Y7/pz5cY/sZa11FOlbwxH
 0mJxxBocsVo4djjZMM3WLlSbC9uouxKlwonNSqS2pdF6yeYOfan4zCFIlseQym2r
 gIYmWd63eQcAJ4dT8n1zvFJdhBOSw3syqGBA8S2sbNET9oub0STXOsf5jdTPoG5Q
 hvbwnqu12eqvSOZpd0enIcKhE9BktOnsz4cznkj7YAMYB9fV60Rg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id n3c7QymB-q7v for <qemu-devel@nongnu.org>;
 Wed, 15 Dec 2021 20:55:10 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0Cs6XGkz1RtVG;
 Wed, 15 Dec 2021 20:55:05 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v2 6/9] target/riscv: Enable the Hypervisor extension by
 default
Date: Thu, 16 Dec 2021 14:54:24 +1000
Message-Id: <20211216045427.757779-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=977d27bfe=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


