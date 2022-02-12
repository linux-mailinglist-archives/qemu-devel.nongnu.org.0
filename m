Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4354B31EC
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:24:39 +0100 (CET)
Received: from localhost ([::1]:40970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgDN-0006Xi-FM
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:24:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfro-0006vo-Fi
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:20 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:1923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfrk-0000JP-BY
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624136; x=1676160136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DVUTjB2lAiVl3JnKm7Gl1e92WjdQT2bI1iA7+W7EZ4Y=;
 b=Z5dQVEgRbQjTwkLCjy4lbrIyWr2Eok5sRCxqQy499FtsOBtyazEn16Iv
 kmHLicWpilK3NYPzgUWit+psX0tRH49ufh0trgfXiGCTuLfqAcjNQC1wF
 CM7RI+9ip90Xl0TN4lQZqZO0G3eJLI3fbOVJVrLpH64fv3WWWKHZRFujr
 RIHh1Sb+jgfegxCC5UMWw1ruBZlE1cF254rwsWQxvYrJxJlC3634nMses
 abSccsImcsKI3YmDTzA0IPLZZ6YMZGgnKadZA6NZARQZiOnDFRpuLKzoc
 ilgJkEMCJi45fKUMFwvqkZ/eGEKem+zQGWXn56v4Hy8HGk6zu6F1/k2iw w==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="296835812"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:02:14 +0800
IronPort-SDR: o7FMzo5Mpi0eTJyL232Sg834BZamxoJzz8195TOgm0UQYcoHsMqYn2ZzLYaCIohPbUdT76nHBJ
 lOb8QMSW0dywfJtwMQTPVNazyrS9SQGQZwYyCiXdvVyI34K4cr4uH4rAo1GOurs/od4pvQeqRX
 MA4o1KCCPh2IuPzyUd+kTqBKbafKUGCA+mV56xEgjtaBxJN/u/5SF1lJaMIXqgIPQ76kwPw3b+
 LvyxsNHVK31CMp96IsMy1UzM+6nALyjtQA5PYsceKyn2ZlXOB/d+UNuNyBxyYnudy116HbvaHZ
 rwf/7OmHjoY1xN11jOz+WVxE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:35:09 -0800
IronPort-SDR: BhbyUXWA5J341N0vzjHkhFp4Jk5O8w4g6ylFgKJsUDpurrqQ+bst1cAZA5e0unk0v7gimLA6EP
 aovSeXybD6zV9TbR2l3NGs3UNoLSDVUF6eYx3FsZsFWaEza0Umv99m3x+X6ndb2veY1wujX7Dm
 dcgvro+qLXucZsQBAKsuYMZm5oY3ozRU7h7934Xvw/Cto8MhQ2jLL/EsBR4O5aHqUncmbo66kz
 sDGhAOFlPCSntgda2tBbOvdd0uE9WP1EQ8YmU0iZ5VhXg+TGEQPkM1fSzYqhGn0FtqzojisaXr
 l48=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:02:14 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVzB3ShGz1SVny
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:02:14 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624133; x=1647216134; bh=DVUTjB2lAiVl3JnKm7
 Gl1e92WjdQT2bI1iA7+W7EZ4Y=; b=EEOgMaBJ5oVJZZ94g+N/zzTMZSsR1/RwOh
 jTyPs//10+JLarvLh4cw1Y4T/lQeg5WWwnlaRnEnsIesQNzoVlyTkC508YKkNlJB
 4RrDrVriWIkLKlc/p+FecM4tMSPxFizqkqVmscooVC2y51lhnnH/1XA8AuQx5hnK
 kSawZyIaLuqUFK3shLRaWhHisxI3XZhmnllVWm6FzYfiHpJesnRlyP5ek6RMkVsW
 n8JzDzIGZrjMyuXQIWhblfWqNcMEE3M67Y9T4XBH1UQUDQfY1hYNDGXzptxRcjlh
 Z9CDfblP1D8jy6+iEoa3L9YCId2rUPCDyFsI2uFSajhVX7roUsiQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id uXHc8dKM_clN for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:02:13 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVz50Q4Yz1SHwl;
 Fri, 11 Feb 2022 16:02:08 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 16/40] target/riscv: Allow setting CPU feature from
 machine/device emulation
Date: Sat, 12 Feb 2022 10:00:07 +1000
Message-Id: <20220212000031.3946524-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
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

From: Anup Patel <anup.patel@wdc.com>

The machine or device emulation should be able to force set certain
CPU features because:
1) We can have certain CPU features which are in-general optional
   but implemented by RISC-V CPUs on the machine.
2) We can have devices which require a certain CPU feature. For example,
   AIA IMSIC devices expect AIA CSRs implemented by RISC-V CPUs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-6-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  5 +++++
 target/riscv/cpu.c | 11 +++--------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f030cb58b2..283a3cda4b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -379,6 +379,11 @@ static inline bool riscv_feature(CPURISCVState *env,=
 int feature)
     return env->features & (1ULL << feature);
 }
=20
+static inline void riscv_set_feature(CPURISCVState *env, int feature)
+{
+    env->features |=3D (1ULL << feature);
+}
+
 #include "cpu_user.h"
=20
 extern const char * const riscv_int_regnames[];
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f1c268415a..ff766acc21 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -135,11 +135,6 @@ static void set_vext_version(CPURISCVState *env, int=
 vext_ver)
     env->vext_ver =3D vext_ver;
 }
=20
-static void set_feature(CPURISCVState *env, int feature)
-{
-    env->features |=3D (1ULL << feature);
-}
-
 static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
 {
 #ifndef CONFIG_USER_ONLY
@@ -508,18 +503,18 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
     }
=20
     if (cpu->cfg.mmu) {
-        set_feature(env, RISCV_FEATURE_MMU);
+        riscv_set_feature(env, RISCV_FEATURE_MMU);
     }
=20
     if (cpu->cfg.pmp) {
-        set_feature(env, RISCV_FEATURE_PMP);
+        riscv_set_feature(env, RISCV_FEATURE_PMP);
=20
         /*
          * Enhanced PMP should only be available
          * on harts with PMP support
          */
         if (cpu->cfg.epmp) {
-            set_feature(env, RISCV_FEATURE_EPMP);
+            riscv_set_feature(env, RISCV_FEATURE_EPMP);
         }
     }
=20
--=20
2.34.1


