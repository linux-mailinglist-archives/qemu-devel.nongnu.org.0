Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DFD495AA1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:27:42 +0100 (CET)
Received: from localhost ([::1]:37674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAoKj-0004J6-KA
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:27:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn16-0000D5-2W
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:25 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0v-0004B6-Lp
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744989; x=1674280989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T8TZTLkm6TVOiPDKon5xAmNZPmH96wo+nLKM8NyUM5c=;
 b=dVfjrialjG7z4zDLX9l45QQZ6hHrl1St9GNJJ95gWUwEtPO5e1jOYMs3
 EJuvFOyW8q3UCNJOaGvi5ev1U7UBwREDzk8LPSR7HQXjNjWqE+K/iAT/i
 bj7Ag8rQHmwktXNt/LQvj5c562VXL8GK/C1s0nQcElWTc6EUd45uOeyRU
 hVkf6LYimTmFIqqcltjOKB27d70FcPz59HXUfuH2Rso+tH/MIfre2g4ch
 cBBW4YTENrAC9ikPxY1BleD0E96vuvF088YWhtmnYj2tum0Sb16ZUmnLs
 CfkRugGqcPBiu1aj7OVZGfeOFCn+Ka2oVQG6npqvjuPqFTppRRX7g4idP A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083102"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:01:59 +0800
IronPort-SDR: pS30i9UAPfbL6PEC5p8JcA2PZ6JFnn8r+heRNAqWWunGIvMACvgOBNGKXnVMtWLeYWE4XY8bTE
 Y1K1r2va++zOSPR1s+z3Y92DqHKlOctQ7AqXM9hs899Fwa2p0rV/YXc/ZrJKa+ueJglu1G8IRi
 hUZWyWZVPy6ZP8gZPfYs8qaIDc+wHkWEGF7QLUCJuL1IxS2jDulK0mp3CqJ62GYjrcIl2aflMe
 wpWS9hKPsLeNd5W3v3l5zzdkCwKrODFmOUJV5CFRQfXfKXWtZL3luyCh/l0G8FcVu/E784GcF5
 dxnD/DwRVilAWq9gEF2jyOZC
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:35:26 -0800
IronPort-SDR: IZ9jYesM+FWUn9gQiUmGInbyEXzyYuae8jZ9ad9Xf695TgOyGdAzs6+jrxa0emf2uBY6OUx2ON
 6AIqyrbNGHFC8oFnF9EAbZmHcLoipapQs40ekiZi/X1jGMR4NE/XQAi8nZYilmKLigaNYStwi8
 9uJXLZQNkjARuNL2jUCE6HlkZTemxmPMxeyjmkNalWqvKXso/s9wkCT6ei7Mc1Z6A3tqZDsS9G
 abLh4LJ1Ij+T0Kh6K3E2YloVbqjU+/6qG2jB5N7nnMJxmc9bcjyGttGHg735UH0pgfvnDgDLOh
 usI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:01:58 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg80Q3mnbz1SVp3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:01:58 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744918; x=1645336919; bh=T8TZTLkm6TVOiPDKon
 5xAmNZPmH96wo+nLKM8NyUM5c=; b=KURQy8VAWrMfcnbLFssfamuwbhMLPzhO77
 JfOEjMLo+XpG7wFxOfkUE3MCQioCqzWvpVuYSZk0V9KPc6oObz7HB+wv9X6WTO4g
 w2Mybke2fOZ8tVtJP+1nC+96WWiPRCTsEqwhSLl3kFUs8siG7gDKxqlJs2oWPCTy
 LWoi4ieiIUr46zmYeuzflJMv9uah8g3FCqtX9Xj+BSAm75AMcwUNTxGfgOg00egl
 trtMfQLnApUPCJ5/+idFivHQ/meLaKNQF+FxL5Omo+qUgPi3efKBQxb1fPCHcH7d
 NCb9X9ctrob4AonX/9NNA4wcZuyfsE/3LDRSbteDpeJZIITGq7rw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2xa5E4QChXWq for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:01:58 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg80L3wKSz1RvlN;
 Thu, 20 Jan 2022 22:01:54 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 47/61] target/riscv: Relax debug check for pm write
Date: Fri, 21 Jan 2022 15:58:16 +1000
Message-Id: <20220121055830.3164408-48-alistair.francis@opensource.wdc.com>
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

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-10-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9be2820d2b..c00a82022e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1556,6 +1556,9 @@ static bool check_pm_current_disabled(CPURISCVState=
 *env, int csrno)
     int csr_priv =3D get_field(csrno, 0x300);
     int pm_current;
=20
+    if (env->debugger) {
+        return false;
+    }
     /*
      * If priv lvls differ that means we're accessing csr from higher pr=
iv lvl,
      * so allow the access
--=20
2.31.1


