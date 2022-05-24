Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03B85333A7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:48:47 +0200 (CEST)
Received: from localhost ([::1]:46178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdKY-0003pd-VA
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHZ-0000Ai-2d
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:41 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHX-0002oX-AE
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432339; x=1684968339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6NkxVoKV+MyZURRtDEFl/naZ0w3j4SzRqRi1vZAomWQ=;
 b=kGv1RNXe7nW8wa64qAj/thDKSXpeBaMjmwWvlGZboR7pm71XdflXGZNR
 ZnfXOr8+XuyiadhFvIuOdluv56FD/0nCS0BfoJatCqkCfK+SUKdQQbVTw
 B2sa1Quob48D41P5czOKW8YIUDDuuTM3gFeYmrNJbPKxPypF6joBCwkGW
 eBjs0PveyBggTwjr0Sjow/pmgc7+Y9rmawNKK0B+HjelzY07FF8rqk3i2
 2cOZ1oi8Hg4mu9OFseAtbYwP0tCv+jZ8cLD7l66T9L/dXXlK5WQpc5WHm
 jRz5JusDr/IGRbVtGJ1IKjAr8Pdr3mqEWXXEJtiB7bviy+mldR/YfIY8W Q==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566705"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:45:22 +0800
IronPort-SDR: p0D7LtBZfNNlgFTewVDnAsxWNidddtd8WL5ownUBSV1WmTigcJtCRO8eIHQ1k2p0c33e51n4q6
 tzbR5HpxjO7zZmV3uh2MnmSV3ROhpOt7AThxuxYQQJ64Nr69K8zjkMAjcWT2hXGNeAloaJ0fK6
 MFycAswlnStj90DmTZaW8U3wxQNF5XmFeuS+S3eia068HOF4lBFsg2hT0ogB1OIdOkNnZ59O/f
 mog3kcen0VW9MW6wCZODXoFZ/k3wuKs+Du8dSCUqZoNDBfgzrJLRJGjrQalYxuZvas1OpyHDfh
 Mx5o5VlGDb4Ume+zwGFZB3w2
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:54 -0700
IronPort-SDR: TAOy85bVYjdHl94iuHMobmFtBUzxSKSc0lVi4U04jpWZLpGNFRNPvJoRkxdce4HGWLHpwnePN9
 I/rFtSncW01MsctjIrKr2lm3ClCSmhVQCAIZJMIvaM6bLcwOIrEOrqtAnJ3o42Eq7SzQLf5qV3
 NerILPB9XaunAEXZ4+G1gHWJW56PyCW/GZZmaXyvJcrpMspWFaJZVj1YNUKD7kd90dOuKlhZV0
 WWQmVNs6tApE1bITIIc51FjTd0sgZYi2xbt9k5UJ4d8cKmHsl13pn6NG0PzGs1z6AZ2c1Tb3B3
 HpQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:45:23 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78RQ5nFSz1SVny
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:45:22 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432322; x=1656024323; bh=6NkxVoKV+MyZURRtDE
 Fl/naZ0w3j4SzRqRi1vZAomWQ=; b=ABfupcybOY1eoXvzpFhwp9N7m6WfciEt5/
 2CwwJFq5CGpILwuTT8ozLDR53VnEkX4X9gYc62dHAWKUZQ6aZu9R/xks6kTv6sYp
 lrrX1gYBqGvKpeWk/q1BuypzlEzBwrjsSnb2H4wIGkKtL7PiLeaMEl/rGd5wE6A6
 CdXEsxFwWF43/0pURRNAfPZ/0TnxwTfrPFDpIJKlGzfzUaU90h4PXK8H4YmSF8KV
 8kwhDTwC6llF6eD6jZKvfCg0cmR8pdaODQf99scDs+uvDp7lbXPa/fEr84Ub9uty
 gYIzxlGKlUt+Dx7I6oGZXg7dqISuCEphztILbDQOEuP8hyz8RC1A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UNNPstkddhlb for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:45:22 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78RN4HtZz1Rvlc;
 Tue, 24 May 2022 15:45:20 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 18/23] target/riscv: Fix hstatus.GVA bit setting for traps
 taken from HS-mode
Date: Wed, 25 May 2022 08:44:23 +1000
Message-Id: <20220524224428.552334-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
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

From: Anup Patel <apatel@ventanamicro.com>

Currently, QEMU does not set hstatus.GVA bit for traps taken from
HS-mode into HS-mode which breaks the Xvisor nested MMU test suite
on QEMU. This was working previously.

This patch updates riscv_cpu_do_interrupt() to fix the above issue.

Fixes: 86d0c457396b ("target/riscv: Fixup setting GVA")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220511144528.393530-3-apatel@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e1aa4f2097..b16bfe0182 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1367,7 +1367,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         case RISCV_EXCP_INST_PAGE_FAULT:
         case RISCV_EXCP_LOAD_PAGE_FAULT:
         case RISCV_EXCP_STORE_PAGE_FAULT:
-            write_gva =3D true;
+            write_gva =3D env->two_stage_lookup;
             tval =3D env->badaddr;
             break;
         case RISCV_EXCP_ILLEGAL_INST:
@@ -1434,7 +1434,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 /* Trap into HS mode */
                 env->hstatus =3D set_field(env->hstatus, HSTATUS_SPV, fa=
lse);
                 htval =3D env->guest_phys_fault_addr;
-                write_gva =3D false;
             }
             env->hstatus =3D set_field(env->hstatus, HSTATUS_GVA, write_=
gva);
         }
--=20
2.35.3


