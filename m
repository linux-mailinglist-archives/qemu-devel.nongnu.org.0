Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FE2495C1D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 09:42:12 +0100 (CET)
Received: from localhost ([::1]:34178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nApUm-000187-Gs
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 03:42:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0l-00005T-DV
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:59 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0j-0004B6-As
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744977; x=1674280977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XLGMZBRPx0NEetu49RSwi6gA4yKtlkSNpzB0qHWSzmc=;
 b=fAxeezQ/06VueAyOt5+zEt23yIqVFPw6/2c3UUKDLX7maN+Br0AV5iUI
 wmtHTsndgzdk2JcNIhsFya+DnsUsNnTCJLVBkaS6KVYj7EjVYkF1ETFjn
 o1Ohm5PhtKfN5IjWuvP1/1q5ll9TMMkRim1aiphhBfJ+ASSfutIo8w9wq
 55cRpX6C9RUho0Rzwy/zMuRY9yK4At3W4pt0tEhdJP07jO01LnGr6Ezbv
 v7D+DOhJpQAfjS4u7WzTNac/CxRCkWtoj8CfcVLyYND6cDidYJku56JFw
 h+5hXl582IS1GLMENsnu1jOYev5SxyQDvnqLZpdNCFI3cheZDrMkYovUl Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083070"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:01:45 +0800
IronPort-SDR: OttMhFRebfPaLetm1K/5UVPAYpNJTwPVjc8pGxKMC8v+U6MRc1b17dmfCglQmX5cpr8MYS63BT
 X0Azx9u+ul2YT9mO0phAXYfnRwTEKNwam3ebyuzrw+CzRAqzsAelNGJjVS0ezuuBZsXRaO/wgw
 P6Znt/pjo4ohgOUNlZS+tDYDN7JK2r25N0oGuZbWfTkbRCrEasE0g4kzrcFHUv9lu0krxW0D92
 jTYJinY0Br4h42u+17yS6vOlSBXDwykSeE9dUNiYExvzeEpjOjVgccFv/q8AdW41OGqyNf40f1
 zRairAKrDrLbXKbPehMhmV2+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:35:13 -0800
IronPort-SDR: TGTM8eG6hwBD/31gEGqFhOLuB2hh9xxCIViwPTnbtG60pBAzwM4r6vSeA/PI3iohMtBqg7+0Rh
 UG+212CkwofcEDQ17jb7rtkPgpUOEbSynzcfMJmoJVr/hbWr2CrsFf67Lk7hk1BkT/W0t203Ko
 UfrxNsZ9Ap5+rH7UjGCjhPgsT+SVLOWi34k1K5ibY/i4HvvQZyBP7nRUNB/AxnFX6Yf7OvE7o5
 D3+qMrqVLjV7I8zWyrfkvdnv2rkjQmWFo3/dHNvSkowZJe8/M6X4K798/n5VHOLgwube5xpp9n
 3aM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:01:45 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg8093qTfz1SVny
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:01:45 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744905; x=1645336906; bh=XLGMZBRPx0NEetu49R
 Swi6gA4yKtlkSNpzB0qHWSzmc=; b=FVF+dwKk/C30+mjF48DiuyTM7kj3+dmwG+
 qguxgGv0ZzSVyizmLJ72x0sE9mG7MeENnKHwa0BZDy1a6hVbckh3+1dONRweXBS1
 sS9QIcrcXSm9El5cnea1sTQR0bEQolZ/SUW35Z2z9QwxSXoSXKhu8pvYbOCXEfGH
 vGgSbCOd2EyFV7aF9AzQbQNZ+w8nYCp9BA/rnZ+3lTK90to0JN6WcvwOTieHov30
 B1bsF/TCt8Wco62vuXSY0+h3639tQZMRQDVFnvZW7eMSx8QZjEMJzrWarqipKbsG
 NwDj6N3UQ/7uMI3dzWH+oKCBSPBoX0RCUukMKKQtkEi7d1mGLxOg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id I3JubT14yB1m for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:01:45 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg8051Qr5z1RvlN;
 Thu, 20 Jan 2022 22:01:40 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 44/61] target/riscv: Ignore the pc bits above XLEN
Date: Fri, 21 Jan 2022 15:58:13 +1000
Message-Id: <20220121055830.3164408-45-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

The read from PC for translation is in cpu_get_tb_cpu_state, before trans=
lation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-7-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 8ebcd57af0..d73925a823 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -43,7 +43,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ul=
ong *pc,
=20
     uint32_t flags =3D 0;
=20
-    *pc =3D env->pc;
+    *pc =3D env->xl =3D=3D MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
     *cs_base =3D 0;
=20
     if (riscv_has_ext(env, RVV) || cpu->cfg.ext_zve32f || cpu->cfg.ext_z=
ve64f) {
--=20
2.31.1


