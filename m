Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668F25333C0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 01:02:59 +0200 (CEST)
Received: from localhost ([::1]:46922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdYI-0001Ua-Ga
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 19:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGu-0007nB-6G
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:01 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGs-0002Yx-77
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432298; x=1684968298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OaZEqH/Jgf/h/iHh5cHRITvnD6CrreQJbyp/cHKr9gg=;
 b=PfDms6pc2w0JInzgHiCiz3pRcjlUsdsLYJxjo8eiwLNqa7HOdeJsz7Ew
 y1Y42CksGXtrJ9Z60aRXxspBk1v+Fhqz4Lskcs/egoZ6Fzy7E3THGfrPZ
 8pf+gACB6nWBnbWkLz1WUg2a8lhKDBLEFkja1C2IxPycinFNaxIKUk9tR
 dnANQg8RV4CZOBBo+82a+A1q/gpipWRPuh6n1QdHeJVlM/zyS4WDS3e6b
 bBP6TXtKxmWyq+LdTY6ysGN28notoj4LeIbdVeyh/HQ9dO+P7rihw/1rK
 lpyqVoQj5Q7ZLU++PFsXgWIwTMs/IF/cVH7a8d1PzvlT3vymQ7ZQbGPzR Q==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566666"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:44:57 +0800
IronPort-SDR: l8qQn7RcS9iO6RDZXzghS/gKJkYfqnt73oVloi9ZgT+0hc1lBeHDoHmQRv9wDgZ0oLUE3JHxOU
 H8tTxHG3iDcF3wWntg/Dc3DE0/Lt+ayGCKVfWoOks8vj6z5cjv9TAS078f4p21Pof0rsjAQvT1
 wAlnnvLAtExaWWJFhVemLInUzC/rarme7LxrjicZmn0riYk1htItRPEn9j6BZv6fnqAYeky98s
 xS2dq7BkhQI73dONu7rwhfs4CdcTIP1MxiW23IzJtlM3PATi5Kv5lNVKcT2B/4LIKvy9hNAb5U
 uk5spMUkM/ue5R3BKIuDlleV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:29 -0700
IronPort-SDR: k0myKYrqS02PYlzxB5+Ykrj9XFN9XJlLsrNkpP15znZSS5w6dDEhE44AOHOH5HDVqUG0Ply0Mt
 IyBMn5vpdyCiuhSFwJ7ySyD3QP8/zTYik58XZ2AmaftWhUY2elzXN/65c0pCwM1PJcC97oQmkq
 KqjFM0aOyU/gdaeXRtrSj5KzVqHWvvBgUWWRj5YCOWtp9nrn7Qs5k2+XqltYGHWrDCWAaEAKTk
 pnG/2bWo66pvtzfPmZMh5Bk3q5rVg2WL0Hcp6Uc6ubWv0J8n9UaKTd0jVRM7LQn6iXqR6QqHe9
 Voo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:44:58 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78Qx2JCYz1SVnx
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:44:57 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1653432296; x=1656024297; bh=OaZEqH/
 Jgf/h/iHh5cHRITvnD6CrreQJbyp/cHKr9gg=; b=OZdcNx0su+7oTZogVmRbnlm
 igvBy2pVXGLguEW8Lx9NvMlpqzkVqihDBSxNJEnxI+60Rojn7CqcblfTDk9FdwRF
 /2VeJ0GBng4xuexUNaykBvs2BRqCpyu7LpvkAMyBF4S2Ltd4nJ7eRvIP3or1ELmT
 RRraz4jJ785lhDrneHE9tfHxWRL7cMcmHlaY72rnZTPLgo13dobj2sq4iOhMCnTs
 Kt53HBwC2a8c05exFcCDhS7enarb7eca+3JfggvfEr2o5oyOsisatb/IEg+LS8C9
 EMyXY/PQqMzY5opBtT5HkoMHn7VyrVP9uYU19OfO4w/epWy6Y+AFsUN6TpQ0o0A=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id RB2j8aTBwdng for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:44:56 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78Qt5Pc6z1Rvlc;
 Tue, 24 May 2022 15:44:54 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 08/23] target/riscv: Fix coding style on "G" expansion
Date: Wed, 25 May 2022 08:44:13 +1000
Message-Id: <20220524224428.552334-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Tsukasa OI <research_trasio@irq.a4lg.com>

Because ext_? members are boolean variables, operator `&&' should be
used instead of `&'.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <91633f8349253656dd08bc8dc36498a9c7538b10.1652583332.git.rese=
arch_trasio@irq.a4lg.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dc93412395..e439716337 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -596,8 +596,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
             return;
         }
=20
-        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
-                                cpu->cfg.ext_a & cpu->cfg.ext_f &
+        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
+                                cpu->cfg.ext_a && cpu->cfg.ext_f &&
                                 cpu->cfg.ext_d)) {
             warn_report("Setting G will also set IMAFD");
             cpu->cfg.ext_i =3D true;
--=20
2.35.3


