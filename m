Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67DF374C13
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:45:37 +0200 (CEST)
Received: from localhost ([::1]:56492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leRCz-0003i5-0p
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtH-00017S-Dz
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:15 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtE-0000wu-KP
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257112; x=1651793112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wh2ave+DSkoE9jb+Ncy1LkaCoi2qwdskqhXQshjT/NI=;
 b=bdHysUoxdKoHF3OxCPveiyUJrGKDO/Ec0Fo2L5OKEuLgTpcTJQLDqXEK
 ou1Fjb8nHOXVZxhtVZ9ToFRH7qKmzrpVnz4QMAa79QunwTYDZqnlyl7HR
 4o9BnPnzu5oB4mPu3x8AWc6fo1kA4HrzysrGvBShmNpTqCRLWVFqd3Ck/
 JEsVS7JIj8sQwajxe0aH4rlprFRU04NH6lUpzokemyGCT0stboMBlXDcF
 Z21euKEQq3WM3njBa2Bw90jIIzXSpFRVfM6+mV16upRR9KhwFTd3S85Ik
 W/QNLeO7uiXgnxOrjyql6N4maRHDq1/VJdNUcpRNUfOAJ6WUK9ehjczgJ Q==;
IronPort-SDR: juGjtTVCiOrRTXAT68/GURJcnERQQ0w1UDWm8yWLGeOVPjc9/QH4gH/EauedlcHCu9uenMEUmq
 Ctd7GQ5hAyT6us64lyLBbtopINMDtxw1oexpfPN2MBJwk6RgX5sjfFsOuCLQnHuKGPxBdjnGZW
 THLI4BlaNdtXShT0uDK1VQqfhuE5O6yDfZ2BiWc4SoCMeNszctevUJm4p/exyXhA/ypvkjPZxg
 UxyckBofWTsKuLbgjbeUCZhCmJDO/p9eIJvvK0wjk786xCHtyYqBvrJ2A72pfLnZZs+muwzt2j
 6b8=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585989"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:58 +0800
IronPort-SDR: ljPzPJtbIfiZKhMPajEUnbRTlmuVjV9T76Tmjr0ewHnwNvJ5KHqSnP/93b965xOJcPdn0JUzGW
 ivN9NXmeOIV48nxVaoAUh/3rRLyxMtZ4Drb9gkpGRyff/CjOE/j75PusLvsiMw86g5/eFY4A6x
 EJN43e6ZyUbb8revvbpWwatQHGJKNLuw066JWVk+J6lhIyJdCFJC+WXMjq4K7FmbAz7Dud98N4
 b6PgofU4sscAJKZFvS5oh/Ki/noJgM3NTAXihPyGtCkFmdFvDqwnguWj7i4UWW/wLYjZWbygTw
 8Cw6vgW0jnHoPNUG6S3dKY82
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:39 -0700
IronPort-SDR: RVpw/JZ4ZcWaPHRIDZB9w3y8AZ4PW8GQx/IowRuQ0BLp7AckKhq4q6o7Ea4GSwinox/7WIBLQY
 qP0ULdflp+FpZGCrpF91wVoH1Qwlve1ghf2Cnf3RHYMKm7UvCgUo1iu6eDLs7J22ZJBN7LO4WT
 bxC2FqeK5PDtJszIydiu7Hp1TvEJ8SM6nKy+IMohiWTaySFP1ozi2uuwkwRhNNhgZBuR/2hXo/
 wPIpn4CBhDxQ+PY5043WS2rh3a3Qk+OJG/ucidjcNrJDAswQn/DT0WHyJ0nUxSxFZwp+LcespB
 rYk=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:56 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 30/42] hw/riscv: Fix OT IBEX reset vector
Date: Thu,  6 May 2021 09:23:00 +1000
Message-Id: <20210505232312.4175486-31-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org, Alexander Wagner <alexander.wagner@ulal.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Wagner <alexander.wagner@ulal.de>

The IBEX documentation [1] specifies the reset vector to be "the most
significant 3 bytes of the boot address and the reset value (0x80) as
the least significant byte".

[1] https://github.com/lowRISC/ibex/blob/master/doc/03_reference/exception_interrupts.rst

Signed-off-by: Alexander Wagner <alexander.wagner@ulal.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210420080008.119798-1-alexander.wagner@ulal.de
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 557d73726b..7545dcda9c 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -119,7 +119,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
                             &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8090, &error_abort);
+    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8080, &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
 
     /* Boot ROM */
-- 
2.31.1


