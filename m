Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303BA51418F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:49:08 +0200 (CEST)
Received: from localhost ([::1]:36666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIZ0-0005Ck-Im
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJK-00009U-NG
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:54 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJI-0002Vn-Sc
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206772; x=1682742772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zmSfhWc/pJYyKcoUSXSqPGM1mk/FAvOlHsf/NGwBu4c=;
 b=FZOUalZsPpRtyHb50FYXfEs7AWfNhuA0a9/pEgCODYjfhkeS5xJ2ac/U
 31Uj/MKDUdAUqOZ4Un9Fn0pp02gpxp/LnJm7+PVcxBqwfI7taMzbKdh9p
 XEGQ/TUmbOEJIJNPcP3fu4N6yc3PCZYJtvRe7MlRHFC3ShG93fVNWqcyp
 YrO/ylwgqKrI/RrFaorGMG9wnHWOh85oXSAAUWgZU2/it5guSA1Wj7fBd
 MN50v1ELYfEubOWOIhB4xXiZM2Yc4TqMPgIB/Q6dr1iu/XbKREZV9/T/9
 sFt347oitIYTe9N+xjPLXJXJETnjvtuKX88mKCZ9XtLlMy5PdciSW4Qgy Q==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995980"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:36 +0800
IronPort-SDR: gGdP0eEplHQkKt5L96y6YVKOo1WSn5jcokbIxtHzP4gZftN/k0mgrBf77mINOOz6zalqmhqGY7
 HpHLPuQ7w2EOENVbbsrT3ql48H0h+YgNCgV3MDdhFCo8QtqpLhbipQDWEitSqZ50dJFSxNPFfT
 tMEBDIsEdKgEq3nLlbUIYEvbwNzzMSu3OfP0CnBPuLJC7d+qauwf4VqTze8HKDEJ3xfeybJ+ao
 ++cFf0mnu6T5cERlO+g604ymDcAL1kVVjdRbqWWaYOFNtcH6Pu10KSeSeDwVlRnXOJb38dhHuC
 d39iWOcD22W8sun4bloPsgZ7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:45 -0700
IronPort-SDR: 4zDvg0IUAYq+riySyXLK8zzeLwlXSsbGjdBEP1TYdEKrwr9LRsdXvKLbsnwXR+hZLxxHxGS/pB
 Y2FITXA/jjNfVAg2M7xF7Agg4/2eJuuqrwUyKeGT5xOMVO0QUtmP/mizJnir1LZ6qWvWvSnXTe
 pA1gy8eL7So3xOdXe8rC3ojsxowGfMnxhp2lftVmSPXxQX7fQMb1TwjvVWuViBVBdow7OSMITj
 X/4MvJTzVFbadnR5s1XmYWmZLDKUvk75V5KfZBkjvoqzE53+nBUendciW1eCwE54PokShoa3z4
 tso=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:37 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKN44mfLz1SVnx
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:36 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206756; x=1653798757; bh=zmSfhWc/pJYyKcoUSX
 SqPGM1mk/FAvOlHsf/NGwBu4c=; b=hBahsvPDvSg8Rp8IJsoRPBCCUKiYMchtlZ
 zFVRluYidbs+xOMbQEInpSjElOTeuzkcnEhlZwRmvUCR3CoUkPh1MvGXzH1nGE42
 0hE13B4k3V0FvdbIs/6znXd5AcQwgPBVL9NrnIMsSlPz1Y2NB/0ogp6Dntjd/vVo
 CuVmkOfdw5QAuMJWKvd29WzrKcaeoWGzjP2YTA+FSPVQor0naGK8ed60jspx3nv2
 Mj+IfvEKDJUkic4w7RN14tpJ+S+eMOa+KAOZKDAieE2UD7JBLFk8jWzZ16yQl2rz
 WLhDyV0QFvY0BYj8jJuAPvn8a/wFfg8/RfpQoF1RStgsjkjYdKmQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nEqt-mOp8MEe for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:36 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKN20DcBz1Rvlc;
 Thu, 28 Apr 2022 21:32:33 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 18/25] target/riscv: Fix incorrect PTE merge in walk_pte
Date: Fri, 29 Apr 2022 14:31:12 +1000
Message-Id: <20220429043119.1478881-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Two non-subsequent PTEs can be mapped to subsequent paddrs. In this
case, walk_pte will erroneously merge them.

Enforce the split up, by tracking the virtual base address.

Let's say we have the mapping:
0x81200000 -> 0x89623000 (4K)
0x8120f000 -> 0x89624000 (4K)

Before, walk_pte would have shown:

vaddr            paddr            size             attr
---------------- ---------------- ---------------- -------
0000000081200000 0000000089623000 0000000000002000 rwxu-ad

as it only checks for subsequent paddrs. With this patch, it becomes:

vaddr            paddr            size             attr
---------------- ---------------- ---------------- -------
0000000081200000 0000000089623000 0000000000001000 rwxu-ad
000000008120f000 0000000089624000 0000000000001000 rwxu-ad

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220423215907.673663-1-ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/monitor.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 7efb4b62c1..17e63fab00 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -84,6 +84,7 @@ static void walk_pte(Monitor *mon, hwaddr base, target_=
ulong start,
 {
     hwaddr pte_addr;
     hwaddr paddr;
+    target_ulong last_start =3D -1;
     target_ulong pgsize;
     target_ulong pte;
     int ptshift;
@@ -111,12 +112,13 @@ static void walk_pte(Monitor *mon, hwaddr base, tar=
get_ulong start,
                  * A leaf PTE has been found
                  *
                  * If current PTE's permission bits differ from the last=
 one,
-                 * or current PTE's ppn does not make a contiguous physi=
cal
-                 * address block together with the last one, print out t=
he last
-                 * contiguous mapped block details.
+                 * or the current PTE breaks up a contiguous virtual or
+                 * physical mapping, address block together with the las=
t one,
+                 * print out the last contiguous mapped block details.
                  */
                 if ((*last_attr !=3D attr) ||
-                    (*last_paddr + *last_size !=3D paddr)) {
+                    (*last_paddr + *last_size !=3D paddr) ||
+                    (last_start + *last_size !=3D start)) {
                     print_pte(mon, va_bits, *vbase, *pbase,
                               *last_paddr + *last_size - *pbase, *last_a=
ttr);
=20
@@ -125,6 +127,7 @@ static void walk_pte(Monitor *mon, hwaddr base, targe=
t_ulong start,
                     *last_attr =3D attr;
                 }
=20
+                last_start =3D start;
                 *last_paddr =3D paddr;
                 *last_size =3D pgsize;
             } else {
--=20
2.35.1


