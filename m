Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718194EE4EC
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 01:50:24 +0200 (CEST)
Received: from localhost ([::1]:55220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na4YZ-0006yM-8b
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 19:50:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=08287e7cc=alistair.francis@opensource.wdc.com>)
 id 1na4TP-0004ez-PS
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 19:45:03 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:51368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=08287e7cc=alistair.francis@opensource.wdc.com>)
 id 1na4TN-00007o-9S
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 19:45:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1648770302; x=1680306302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dr5DFYtEwc8z5mTl6J0dwGTBJnbp99CDmAQ6LgWqGik=;
 b=mAFDtw/CEnjZKrLuSnWWdPQyDZHaqajzsRVwEbNmtw4WVs4nnypUxyF0
 T+upOZTXA3BrGdh8ZgB7Y27Jg5h5pFmzl5OaFuA+BsFqVq43v6jM4X1ZP
 0mZg3FCGRvjI/B/Ktgolg/I4q7g7KMFFAJoDdDlh6Nqag2Wcgp18nE6vi
 U/5HFWpKVsFBsEANBpeVVysyYOcwHfFQcxlmRWrPU4+W3oX/nlY+hSnIO
 /RU4uGPXVGJqTJBoHEw/NZclJgG2k7Y5kKwBTnClv4fCVYXO/sswUN3sL
 g+VTuB5EoKUL0aq17mnWP3eeDtB+Zq6/3pDPqz0jqjb+cDtfXY5jrfYfx Q==;
X-IronPort-AV: E=Sophos;i="5.90,225,1643644800"; d="scan'208";a="197691427"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Apr 2022 07:45:00 +0800
IronPort-SDR: sBPoUw3s7cRJIGhF83DPwXCUCq0RYJTkMfp3BRdSMA1BE28ErgtW7PKXYJBQFAQB1Ssv/bwMal
 YIz412Z03nT4Sb2/LSNs3n4q/emeYnCpON/y/V19Px+GYSpcNogw+dG27HrMSZt2HHD7VHEjXc
 bBaCAqoK4Q63mwyBMDRlJrFNY9UdNz2vWCu+kpN9K9Ju7ojX7JphYYdNo1nxSjOGfgOYLP+IOb
 QtS+T9EfWlQftCGW/l2vy5kuaV3wCpUKIc/9HpJ2egM43VlK5cfy+F+JBFRCswwKzJSR93U+gb
 MJ3UAA+NRqg2KzUFwSNxuqn4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2022 16:16:39 -0700
IronPort-SDR: vnUqgwIBuEX+I+dy0JlGgjPxT1gWBLzByxYom1nh7806i/IwUrRjqC9XEIc15G30s/SPzna9rr
 Mbl0m0N+jzuWOgqt9rH8wsasDgs5oCxM5LlqnGrlUC0MOj+aP4ekL1/3ZHp9yetyiAtttkPadW
 b1pIKs0OvmCcQcd4M1krKdNCXcEmEcDjNkw9HnkMCa1lco8DRk5lEjtFAbrD0sEqmhFupC5dIF
 ckMvs4OmlvyCYAcepw6+9TQkAbSa65zjzZp/NUWI5/yhC7/Vv9lIG7LNP7oPCquB84ViBjBGDh
 qSs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2022 16:45:00 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KV0K71lS9z1SVp0
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 16:44:59 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1648770298; x=1651362299; bh=dr5DFYtEwc8z5mTl6J
 0dwGTBJnbp99CDmAQ6LgWqGik=; b=aK1hRMwkOOCTsvvllN4tjV6gcANmrApIY8
 8O2NeDRKoVn5tXZ8Pt6kUf8MJVEgcRP+kIyG11IAfzh7Okb5oJEErBRjaQPit9Gr
 nVyGXn6yA46PMxzzuZ6omyU0WkO3LWi7IgbAeX0LR1hpHCZNQZvIxFHLw0icwge2
 Zqe+RKypcdPLk3rzpXfZtA2kpuYZH5mgDRm76gH2YdZTTP0B6QH2FWBwggNdwpgq
 FHbfOhjlyHcwLPa1CMgGvK/En6aojD2ODB2k8deMpg9nzOQbbc0+C/iPVspawI1J
 Vq//zMiX7Z8tp5DnB7RaT+4NGhLHwUR5x/wzm8XFKxA8gJvcF0uA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CbHnxx0qtaVG for <qemu-devel@nongnu.org>;
 Thu, 31 Mar 2022 16:44:58 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KV0K351vrz1Rvlx;
 Thu, 31 Mar 2022 16:44:55 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Palmer Dabbelt <palmer@rivosinc.com>,
 phantom@zju.edu.cn, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 1/2] target/riscv: Avoid leaking "no translation" TLB entries
Date: Fri,  1 Apr 2022 09:44:40 +1000
Message-Id: <20220331234441.15920-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331234441.15920-1-alistair.francis@opensource.wdc.com>
References: <20220331234441.15920-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=08287e7cc=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Palmer Dabbelt <palmer@rivosinc.com>

The ISA doesn't allow bare mappings to be cached, as the caches are
translations and bare mppings are not translated.  We cache these
translations in QEMU in order to utilize the TLB code, but that leaks
out to the guest.

Suggested-by: phantom@zju.edu.cn # no name in the From field
Fixes: 1e0d985fa9 ("target/riscv: Only flush TLB if SATP.ASID changes")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220330165913.8836-1-palmer@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0606cd0ea8..341c2e6f23 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1844,7 +1844,7 @@ static RISCVException read_satp(CPURISCVState *env,=
 int csrno,
 static RISCVException write_satp(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    target_ulong vm, mask, asid;
+    target_ulong vm, mask;
=20
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
         return RISCV_EXCP_NONE;
@@ -1853,20 +1853,22 @@ static RISCVException write_satp(CPURISCVState *e=
nv, int csrno,
     if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
         vm =3D validate_vm(env, get_field(val, SATP32_MODE));
         mask =3D (val ^ env->satp) & (SATP32_MODE | SATP32_ASID | SATP32=
_PPN);
-        asid =3D (val ^ env->satp) & SATP32_ASID;
     } else {
         vm =3D validate_vm(env, get_field(val, SATP64_MODE));
         mask =3D (val ^ env->satp) & (SATP64_MODE | SATP64_ASID | SATP64=
_PPN);
-        asid =3D (val ^ env->satp) & SATP64_ASID;
     }
=20
     if (vm && mask) {
         if (env->priv =3D=3D PRV_S && get_field(env->mstatus, MSTATUS_TV=
M)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
-            if (asid) {
-                tlb_flush(env_cpu(env));
-            }
+            /*
+             * The ISA defines SATP.MODE=3DBare as "no translation", but=
 we still
+             * pass these through QEMU's TLB emulation as it improves
+             * performance.  Flushing the TLB on SATP writes with paging
+             * enabled avoids leaking those invalid cached mappings.
+             */
+            tlb_flush(env_cpu(env));
             env->satp =3D val;
         }
     }
--=20
2.35.1


