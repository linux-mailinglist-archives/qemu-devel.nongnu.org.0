Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C83D3AF892
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 11:12:03 +0200 (CEST)
Received: from localhost ([::1]:48386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7yfS-0002ay-5D
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 05:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57999)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwa-0000FS-7j
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:25:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwY-0006z8-UG
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:25:40 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55446)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xwY-0006yg-Nj
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:25:38 -0400
Received: by mail-wm1-f67.google.com with SMTP id g207so2322223wmg.5
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 01:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=9GK2Bf5OnfdKtfsKMa0SLxJhchcsTnh1ghEkn9cP/2k=;
 b=bGzlaDSTpROVxea19CvHLHZkKsUtB/DDExlw0nBZWehuhkSzXc7g9cyRt7wazEJGf+
 kfrhs+aLhaXmy1Fkk59hiLKzmq2lkhTZcnrWwHYOJukKrcyKkvy7fdwqMico973BvEhI
 dpfiIIzXtCCEl3ZlXN5q89R9+111+7Bji4xrOeqKQciClVDCBMmebcphO2kDOz0mshBj
 GH27xYv8pimCCk66PTbSL2HgYvhWBgqTjL1WRe2e0hu9PgTCYn2Ibuf5Uoe8sDnkRzAh
 gUdo4Wi+26Dt+n8F39s0zOw/vhD3yjmSKxV+IKQKS6byhJtmeLpvbwKkKbO5vryl2DF2
 oK8w==
X-Gm-Message-State: APjAAAVpRxpZBI4LFJJwYfzeeWYEd+Vm5NvR0ywfEn3WW5W5R+W5+p/1
 NsxTP1Ts6ibMYRte/cufiFOC4X4qtV88BQ==
X-Google-Smtp-Source: APXvYqx4b8fcm6+z2J9BVueXQJB06f9sWQr/czlXgu6hflbrH2E7AjcsVWjE2V0klFemMixIpkLP1g==
X-Received: by 2002:a1c:1acc:: with SMTP id a195mr2834573wma.106.1568190337504; 
 Wed, 11 Sep 2019 01:25:37 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id x17sm2039918wmj.19.2019.09.11.01.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:37 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:05:11 -0700
Message-Id: <20190910190513.21160-46-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: [Qemu-devel] [PULL 45/47] target/riscv: Use both register name and
 ABI name
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
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@sifive.com>,
 qemu-devel@nongnu.org, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Atish Patra <atish.patra@wdc.com>

Use both the generic register name and ABI name for the general purpose
registers and floating point registers.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6d52f97d7c..f13e298a36 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,17 +34,20 @@
 static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 
 const char * const riscv_int_regnames[] = {
-  "zero", "ra", "sp",  "gp",  "tp", "t0", "t1", "t2",
-  "s0",   "s1", "a0",  "a1",  "a2", "a3", "a4", "a5",
-  "a6",   "a7", "s2",  "s3",  "s4", "s5", "s6", "s7",
-  "s8",   "s9", "s10", "s11", "t3", "t4", "t5", "t6"
+  "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
+  "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
+  "x14/a4",  "x15/a5", "x16/a6", "x17/a7", "x18/s2", "x19/s3",  "x20/s4",
+  "x21/s5",  "x22/s6", "x23/s7", "x24/s8", "x25/s9", "x26/s10", "x27/s11",
+  "x28/t3",  "x29/t4", "x30/t5", "x31/t6"
 };
 
 const char * const riscv_fpr_regnames[] = {
-  "ft0", "ft1", "ft2",  "ft3",  "ft4", "ft5", "ft6",  "ft7",
-  "fs0", "fs1", "fa0",  "fa1",  "fa2", "fa3", "fa4",  "fa5",
-  "fa6", "fa7", "fs2",  "fs3",  "fs4", "fs5", "fs6",  "fs7",
-  "fs8", "fs9", "fs10", "fs11", "ft8", "ft9", "ft10", "ft11"
+  "f0/ft0",   "f1/ft1",  "f2/ft2",   "f3/ft3",   "f4/ft4",  "f5/ft5",
+  "f6/ft6",   "f7/ft7",  "f8/fs0",   "f9/fs1",   "f10/fa0", "f11/fa1",
+  "f12/fa2",  "f13/fa3", "f14/fa4",  "f15/fa5",  "f16/fa6", "f17/fa7",
+  "f18/fs2",  "f19/fs3", "f20/fs4",  "f21/fs5",  "f22/fs6", "f23/fs7",
+  "f24/fs8",  "f25/fs9", "f26/fs10", "f27/fs11", "f28/ft8", "f29/ft9",
+  "f30/ft10", "f31/ft11"
 };
 
 const char * const riscv_excp_names[] = {
-- 
2.21.0


