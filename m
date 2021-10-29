Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FC143F7C4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:19:40 +0200 (CEST)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMAt-0000I5-J7
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM6R-0005xs-Lx
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:15:03 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM6P-0000Qz-0f
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491700; x=1667027700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NOi2wUJPbzMYjoO8hDlZIw3xVQn+T7NEBBLu6imMlYQ=;
 b=NHSor3ci3zYF9wNf4UYvUTeL+tV+gOgRG9dIiQupzyRd/XNKNwaYiHFU
 DqcL/lzrhWlXLLfbA8ylEWs1ee+M3HTUkSDT5mqvUI9d+2tQeyT2hr9g/
 QOycLcwMGcDPmQbRczIJFpYBMgpHZl/ru3lOsIOuIrw2PNNKGU4qgMHlq
 2zgY7Qryh0kANlbf+ql9bSzazNHTA9LiAi/ifFQAsbXLiTIbtxAeN88+H
 6vv6o0seUkgXv0TuAn3gHn9F9leqnLSUDlpPI+28ktiZYAPhsXZ+BsgO8
 H0zNTNsh3rz7J3EUDdlAXB8TrkADkgJZm+g0dj9ELkLg4F4hl1EwO5gUn Q==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="188934202"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:14:58 +0800
IronPort-SDR: VY2EQCFOvXzThQa1DrG5uONRyCD3EBr5oiekrjSbJCHjoy/k6NYCN4cBGJmgGWmeAJctQw8R8S
 kTR7ISfRZAdR2h+CrTeG3KqELRsF7GMp40U9mlBptSGjV/ei0jDU/frr0cZnaqoVpnBYR/dS8P
 oOxdy/saKSCII0KPZ1+ndAPSBxJOSFZHCxBiwG7GFAczlHRETtkygCwOzd2Urb4mIO6ugxnWR1
 mFZpTWWWxuo95XqPlp8GU0sU7YL/E4sSix4s6HfpgLeWiHVV6C4vN70IbtG6hnTeZidFmMqSXy
 4+UhbCzGzlHl/THo7W0aovY+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:50:26 -0700
IronPort-SDR: LyWl/492SNvbpchQWycudUrdY1TlkJoL0zqTgQxKBntUqcVt6Z8AclBeSyeSpErpJftisMTVLK
 yHRgywhxj6c9U+oWoN5xsT8hCijy2HPfO/8SFdfoLXz8bBkPDFMdtO4ev5oTyqrNSyjXdzPOLr
 QBBqUGvGUocsTwZQ91YSYpoBlXr9kONUKY2j59z+PQ43xnPi7izMHKNh/mfG6G5cUlKHUljsoh
 kkxUA3oJMJXzxBQKDaUVj9ZmOEKDWk2Cd6MgGOu/J34sIZZHCLUVeNYYMfAGj3Ck1Y4+3SrLCP
 JjA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:15:00 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYbR2Smtz1RtVm
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:14:59 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635491699; x=1638083700; bh=NOi2wUJPbzMYjoO8hD
 lZIw3xVQn+T7NEBBLu6imMlYQ=; b=ZIRvTv51rvyPdgQaF3TTqs1Mn/OjGyWBpE
 9jcwaX0YYgJhHZRTjxHlSA9Q55fW/JzptZuadeboad6AJsTy0muHs2dchd9zrbIn
 Z9qDHC4cTTXpkF+9icaoNeRA2kuF5PXe535Jm13ZgAXOXkhF68bBlP+XuI2/m7t2
 BWMUhsWTK7/Gu3hwIwG8JbztdwfO/un9QyIsElUcvTQufB8eewnPgluvDTJyfSmY
 x5g0RdibV+rVWe02CLB9KL6/V4IcoGETsE5wQigj+lwhdZ470nYkEQn9ne0hudva
 BWqa5UxoeLx7Ff4tmJuYOBiia+zdwh0kv9IZVInJm17MQTUyqsmw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id FPSKRQjTOqjr for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:14:59 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYZm4Wq8z1RtVl;
 Fri, 29 Oct 2021 00:14:24 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alexey Baturo <baturo.alexey@gmail.com>,
 Alexey Baturo <space.monkey.delivers@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 10/18] target/riscv: Add J extension state description
Date: Fri, 29 Oct 2021 17:08:09 +1000
Message-Id: <20211029070817.100529-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211025173609.2724490-5-space.monkey.delivers@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/machine.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index f64b2a96c1..7b4c739564 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -84,6 +84,14 @@ static bool vector_needed(void *opaque)
     return riscv_has_ext(env, RVV);
 }
=20
+static bool pointermasking_needed(void *opaque)
+{
+    RISCVCPU *cpu =3D opaque;
+    CPURISCVState *env =3D &cpu->env;
+
+    return riscv_has_ext(env, RVJ);
+}
+
 static const VMStateDescription vmstate_vector =3D {
     .name =3D "cpu/vector",
     .version_id =3D 1,
@@ -100,6 +108,24 @@ static const VMStateDescription vmstate_vector =3D {
         }
 };
=20
+static const VMStateDescription vmstate_pointermasking =3D {
+    .name =3D "cpu/pointer_masking",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D pointermasking_needed,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINTTL(env.mmte, RISCVCPU),
+        VMSTATE_UINTTL(env.mpmmask, RISCVCPU),
+        VMSTATE_UINTTL(env.mpmbase, RISCVCPU),
+        VMSTATE_UINTTL(env.spmmask, RISCVCPU),
+        VMSTATE_UINTTL(env.spmbase, RISCVCPU),
+        VMSTATE_UINTTL(env.upmmask, RISCVCPU),
+        VMSTATE_UINTTL(env.upmbase, RISCVCPU),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_hyper =3D {
     .name =3D "cpu/hyper",
     .version_id =3D 1,
@@ -191,6 +217,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
         &vmstate_pmp,
         &vmstate_hyper,
         &vmstate_vector,
+        &vmstate_pointermasking,
         NULL
     }
 };
--=20
2.31.1


