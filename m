Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B144C1438EC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 10:03:48 +0100 (CET)
Received: from localhost ([::1]:50154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itpRr-0001ih-Lo
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 04:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55257)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2824cb5c5=Anup.Patel@wdc.com>)
 id 1itpO2-00073m-Nm
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 03:59:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2824cb5c5=Anup.Patel@wdc.com>)
 id 1itpO1-00059Z-2m
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 03:59:50 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:23944)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2824cb5c5=Anup.Patel@wdc.com>)
 id 1itpNv-00054Q-Sm; Tue, 21 Jan 2020 03:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1579597184; x=1611133184;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TmubP0aukutzoQv+IOjP80oasdL2wH5nwCYUI4ebVLY=;
 b=A/jigAZiFeMSJV5a9ZkfDbp/cvp9/Z55fKcbpTDJfCo4KKbUZVPP+fII
 VnkCMldGNM6stPrJXMPJQgGekkzCZtaZddnDr7elwsb0EDdIsDHYiyPlN
 rIisODA+lyhOWcRz3K8TY04sKzkeq6FGS2yOvFPw5Zq0nkAf6k6UI1dBo
 Un+fwYS7t696XU+3H5qEkRJHQnKCOKLs/nSGpbNGQSwb8/YWOVpdWgsLk
 JN/ccHbXX1SzRZcAU9+MeLa9u9eeRSyG4u0okCUKmq+0x7jofSVzFRaue
 +nvnIvz7ZLgRw9abtSOKQ+hwGUYQrdMJ1Fi9znSmpvLfltK200Cyu1BsJ A==;
IronPort-SDR: MBkCi7AS6XJ81rOs4KiE60NhzhzcEthYs83Qwf17lbaAasSxoogq0WbUusLVtpilk9hpX50ReT
 VlLFuwd6CIAA0phReWkNLlCa2cENa+bKtyWrMMRr+A9AgpTs85vYnWgUxDmnyfnT/702jIElwF
 SOHHpDavKJq5ub1uWco+wSRE5GzZ6bgLuaofmCqSyBuJ//491UQ46Adnsudp5T7hAa2IYZHr9f
 Q8mLhgjYLslUVm4wy8vAbndOR9Om26YSETVS9IFJqmzSFvH2yOqsIREPYLa3f0kZdCI8IUbTYD
 /2k=
X-IronPort-AV: E=Sophos;i="5.70,345,1574092800"; d="scan'208";a="132437027"
Received: from mail-cys01nam02lp2059.outbound.protection.outlook.com (HELO
 NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.59])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2020 16:59:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Paw3NomDoXM9d8MpnFMN8VJD2t2BJLFVenctX6FznmYopaNrXHCaLKG0MlbmTgA6axPjuSUWKX3S2qBcwgVJfz+2tx0q5mAE2m8jhZ+b8nz1AeO/bw8DEhf31ZFGoqsbBX6n/GZExCrSuwxRfv/V4Kt6KCnnnoTdeCoslvsattUKeXEmL3GAYHYyRp+OOMHb8zt1uadvUqKF5gERgG1dt2kMUoIRaEWNc+Qzx8xc8epjjroo8142BrexlVtewtu50qs8yKB2PerTpqlZQzillcAMXHH2EeASzDirx0jDh3Yu1PcSdR5pb7aSenualygjNFmzUEaPF2Z9EJ43Zsa8CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4P+I2jArYjL2qzLeCt7MRRXL73EePqrTq1BNEZAhbw=;
 b=lhyPm7WLMWAo4cWjBsJxAGkjm2piPAxi+wLZnmU/RF2FRyPAvfSOitA4H8a06vmLetRe/VZMcOBSPu+MxziBnudLOIYrI0umg+1gsIJDjPt3XQUHxlKP8jAPRjIB8R+/GSHwQB9q+9WSYbxqkYrJ+DfrN3sRcHrOgLbr61IALZ2GHKj1mF0hPGGAI5frRWnu6MoS1ZXgBqCl5ujg4gZRdzn0YqnAUwoJjt71q4gxdZkuXxK903wZsF9Kykm1bge8vaCTmx9UBHjgXC9WArjH23jA+XeHqQlD0LzVlDJlyDJHh5RPGfF0I1GmnEOFWXB2i2vi9C3/rYitr0FgQyF6og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4P+I2jArYjL2qzLeCt7MRRXL73EePqrTq1BNEZAhbw=;
 b=ibCusGzlby7uZDt5xGy1AcpO5I5XMClEoVE7mAHffzXnB6l1qqJic95e9T22kr1fvJCG15nm98I0tgQxmBWc9+ocCtZKK1T0VkrPRFmmwM5SAjs9zjpjZonWi+pqlxN0PXsfhK73AScY4kIVPmKM1k3rG1M5WOMwVjXBiexSLsA=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5839.namprd04.prod.outlook.com (20.179.21.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.21; Tue, 21 Jan 2020 08:59:41 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::a9a0:3ffa:371f:ad89]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::a9a0:3ffa:371f:ad89%7]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 08:59:41 +0000
Received: from wdc.com (129.253.179.161) by
 MAXPR0101CA0061.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.19 via Frontend
 Transport; Tue, 21 Jan 2020 08:59:38 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>, Sagar
 Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH 1/2] target/riscv: Emulate TIME CSRs for privileged mode
Thread-Topic: [PATCH 1/2] target/riscv: Emulate TIME CSRs for privileged mode
Thread-Index: AQHV0DkdWjUbgqPzqU2PcaK7gIVjnA==
Date: Tue, 21 Jan 2020 08:59:41 +0000
Message-ID: <20200121085910.28834-2-anup.patel@wdc.com>
References: <20200121085910.28834-1-anup.patel@wdc.com>
In-Reply-To: <20200121085910.28834-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::23) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 428f87ef-4001-4d3f-9f83-08d79e504054
x-ms-traffictypediagnostic: MN2PR04MB5839:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB5839F577B9BC584332F2D40E8D0D0@MN2PR04MB5839.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(189003)(199004)(186003)(16526019)(8676002)(478600001)(8936002)(81166006)(81156014)(26005)(8886007)(2616005)(956004)(55016002)(2906002)(6666004)(1076003)(4326008)(44832011)(110136005)(86362001)(52116002)(7696005)(71200400001)(54906003)(5660300002)(36756003)(316002)(66946007)(66476007)(66556008)(64756008)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5839;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /486ok5Q0aIgH8qTid4KUeI/Kg0SO4hHMsPnW3uSD6XmY5UpZ/wdLQ2MNY5z2Fs94ZzOzCP+aUU3BkLwrcFa/+6Qgvy7BCYRIUf7HSdfezbb/Q2qilI/y+LPsAFIeQYPM7oRmnuieFwW0xUVpD5SS8GthYn8tHta8BTOmKA8AJrBvGWHaN3QD4EEtKPXwQX9UXnZ3umUkRJiAUHoLy3blZfn7COLNJzvfRS10JptvJd8R5fYELlZt29Ytq+epzKvPZJE72odx9yfGtBaQIpD6sa/O80f2MgFNMAFVEsWwYVCaxqBihXv5INHpRetEZ6NhQ9TlAcu99NhKg67Oms2UfYJ/yIiN0KqvZq6ZmlFDv5PxxLdFE1ZPer+woSWCdOtxCsa5IviRUpiBUb90EGl14AI4mQAm06Dfz1I2+IC2TXNuVOjh60XRRuff/dVUj/t
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 428f87ef-4001-4d3f-9f83-08d79e504054
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 08:59:41.2633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T2oK0NKrkz2ydDvwoWatNuFHMuQwvMniC3is2L/2wXHPWvOq2k0ml3FsR8jOxT7a89264/rNzLbELUav7XR9dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5839
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.153.141
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
Cc: Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, TIME CSRs are emulated only for user-only mode. This
patch add TIME CSRs emulation for privileged mode.

For privileged mode, the TIME CSRs will return value provided
by rdtime callback which is registered by QEMU machine/platform
emulation (i.e. CLINT emulation). If rdtime callback is not
available then the monitor (i.e. OpenSBI) will trap-n-emulate
TIME CSRs in software.

We see 25+% performance improvement in hackbench numbers when
TIME CSRs are not trap-n-emulated.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.h        |  5 +++
 target/riscv/cpu_helper.c |  5 +++
 target/riscv/csr.c        | 80 +++++++++++++++++++++++++++++++++++++--
 3 files changed, 86 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 53bc6af5f7..473e01da6c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -169,6 +169,7 @@ struct CPURISCVState {
     target_ulong htval;
     target_ulong htinst;
     target_ulong hgatp;
+    uint64_t htimedelta;
=20
     /* Virtual CSRs */
     target_ulong vsstatus;
@@ -204,6 +205,9 @@ struct CPURISCVState {
     /* physical memory protection */
     pmp_table_t pmp_state;
=20
+    /* machine specific rdtime callback */
+    uint64_t (*rdtime_fn)(void);
+
     /* True if in debugger mode.  */
     bool debugger;
 #endif
@@ -325,6 +329,7 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)=
;
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
 uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value=
);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value =
*/
+void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void));
 #endif
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
=20
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7166e6199e..c85f44d933 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -250,6 +250,11 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t =
mask, uint32_t value)
     return old;
 }
=20
+void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void))
+{
+    env->rdtime_fn =3D fn;
+}
+
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
 {
     if (newpriv > PRV_M) {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b28058f9d5..a55b543735 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -238,6 +238,30 @@ static int read_timeh(CPURISCVState *env, int csrno, t=
arget_ulong *val)
=20
 #else /* CONFIG_USER_ONLY */
=20
+static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    uint64_t delta =3D riscv_cpu_virt_enabled(env) ? env->htimedelta : 0;
+
+    if (!env->rdtime_fn)
+        return -1;
+
+    *val =3D env->rdtime_fn() + delta;
+    return 0;
+}
+
+#if defined(TARGET_RISCV32)
+static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    uint64_t delta =3D riscv_cpu_virt_enabled(env) ? env->htimedelta : 0;
+
+    if (!env->rdtime_fn)
+        return -1;
+
+    *val =3D (env->rdtime_fn() + delta) >> 32;
+    return 0;
+}
+#endif
+
 /* Machine constants */
=20
 #define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
@@ -931,6 +955,52 @@ static int write_hgatp(CPURISCVState *env, int csrno, =
target_ulong val)
     return 0;
 }
=20
+static int read_htimedelta(CPURISCVState *env, int csrno, target_ulong *va=
l)
+{
+    if (!env->rdtime_fn)
+        return -1;
+
+#if defined(TARGET_RISCV32)
+    *val =3D env->htimedelta & 0xffffffff;
+#else
+    *val =3D env->htimedelta;
+#endif
+    return 0;
+}
+
+static int write_htimedelta(CPURISCVState *env, int csrno, target_ulong va=
l)
+{
+    if (!env->rdtime_fn)
+        return -1;
+
+#if defined(TARGET_RISCV32)
+    env->htimedelta =3D deposit64(env->htimedelta, 0, 32, (uint64_t)val);
+#else
+    env->htimedelta =3D val;
+#endif
+    return 0;
+}
+
+#if defined(TARGET_RISCV32)
+static int read_htimedeltah(CPURISCVState *env, int csrno, target_ulong *v=
al)
+{
+    if (!env->rdtime_fn)
+        return -1;
+
+    *val =3D env->htimedelta >> 32;
+    return 0;
+}
+
+static int write_htimedeltah(CPURISCVState *env, int csrno, target_ulong v=
al)
+{
+    if (!env->rdtime_fn)
+        return -1;
+
+    env->htimedelta =3D deposit64(env->htimedelta, 32, 32, (uint64_t)val);
+    return 0;
+}
+#endif
+
 /* Virtual CSR Registers */
 static int read_vsstatus(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -1203,14 +1273,12 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE]=
 =3D {
     [CSR_INSTRETH] =3D            { ctr,  read_instreth                   =
    },
 #endif
=20
-    /* User-level time CSRs are only available in linux-user
-     * In privileged mode, the monitor emulates these CSRs */
-#if defined(CONFIG_USER_ONLY)
+    /* In privileged mode, the monitor will have to emulate TIME CSRs only=
 if
+     * rdtime callback is not provided by machine/platform emulation */
     [CSR_TIME] =3D                { ctr,  read_time                       =
    },
 #if defined(TARGET_RISCV32)
     [CSR_TIMEH] =3D               { ctr,  read_timeh                      =
    },
 #endif
-#endif
=20
 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
@@ -1276,6 +1344,10 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
=3D {
     [CSR_HTVAL] =3D               { hmode,   read_htval,       write_htval=
      },
     [CSR_HTINST] =3D              { hmode,   read_htinst,      write_htins=
t     },
     [CSR_HGATP] =3D               { hmode,   read_hgatp,       write_hgatp=
      },
+    [CSR_HTIMEDELTA] =3D          { hmode,   read_htimedelta,  write_htime=
delta },
+#if defined(TARGET_RISCV32)
+    [CSR_HTIMEDELTAH] =3D         { hmode,   read_htimedeltah, write_htime=
deltah},
+#endif
=20
     [CSR_VSSTATUS] =3D            { hmode,   read_vsstatus,    write_vssta=
tus   },
     [CSR_VSIP] =3D                { hmode,   NULL,     NULL,     rmw_vsip =
      },
--=20
2.17.1


