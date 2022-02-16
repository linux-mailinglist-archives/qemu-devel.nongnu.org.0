Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3284B80DE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:58:57 +0100 (CET)
Received: from localhost ([::1]:33354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKEHA-0001kZ-2u
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:58:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqx-0007Kh-6N
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:52 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:31697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqv-0006tE-Ho
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993109; x=1676529109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Op9MBksbJCLjCPcsH3y+BxEHX7yAAvSi//ZF4kTyuyI=;
 b=Efe1H56ZtBrc6mQ7axrNxKWiGybT0Ffi9eYPGeFQ91kr57ErmrRb62zQ
 sv0lLfS28RVihOYGtv5/8peDQCRRM084a1udU8cmSW/GOc3MU4dAd77L8
 FARotWvxPnOaeeTGU3vwwcNWmn6HJGIN4aemFshg/m5e7XLmFDJpcjhqe
 vK6mnd3r9MmaH4v8jFUcgP9pW+j8LAxz+xLPrxixB4tM+ghBIDEsrwClp
 ondI3awI0EpvkpWKTmOKy9BrRyACoKLNWE78AOZc9TjQDYSBi1zWAE6kY
 kD53hoOhBVbLIJLQtoE9wQObX4znF1kX+86CAMLSszwqNHbzTG07jTpWy w==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="304974653"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:31:48 +0800
IronPort-SDR: VxAZfY6uAv1B0lxHwkGZvuRM9lfgKBFmSjxEsaTZW+BseOi2pPFyRQ4PraRGV4juWedt38oL6j
 j0ZNhRIuNc/ILRz5IeiJryxvRqzi91xgRuteL4650VbZpdc8bMwPzJ0T40M1R375jf2xH6DOKx
 P3Pu47T1IFUvoFlXoTDjfoOYtjZD+O4DlCfFYIKGhJQnQH9MpaAkLw1JPtV2Qo3+5bviiL0XSj
 z/Jd0KGLUwlPOuckw2trKnVtT7m6ixBVWtLvxXLSENdyKCHMXR6sVY+Xkc2/00E8X1RCSDsM0y
 SC+uhrtbtfmGxiKK+mVDVWcg
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:03:28 -0800
IronPort-SDR: qzOCvQ2oR/7plTKxKfIhRVoJWYkbQ4sOJ8JFl7O5OujOnPwOUhv/jU5lXZfIT5XFe/NrA2NA04
 vgIK5xAk89GRDG6FFWq+G9cuRRrpAbEMTNobATe/j7RQFIfvXWsVDmSslk6duIE//UjnlyKs87
 TuGUotJ7WeQLAdgxDYJtGwM3xNaUQ0KX+yEoKYdAN04cnZToD0aucp6R92b2ANTI+Xy0HCiO9L
 Apou6PUhQY1irI6sLu2NY0Jj/j5DpG8Ds3SFTj/X0jFViNLB7Wp9zzy6JY0GvrbWdo83SmBy37
 r4M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:31:48 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7Qq71Lhz1SVp0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:31:47 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993107; x=1647585108; bh=Op9MBksbJCLjCPcsH3
 y+BxEHX7yAAvSi//ZF4kTyuyI=; b=pMAMcCtjBVraUGmu6FnV3wRUlJbfxhxRfl
 J0sXAdtkOPxXimSsCe9+ztFkbOEj5FAbs03p2baYnSecXU7IGzicuLA/JXoMj2D2
 wry7FFP5clHOVCgodhZVnkLalXoBdKOv2RDHCSa7rn5QwfJxGO7sZwgJgPVsd1NR
 WhC8SoFWam+L0BOUP9rBUnzzjcZDAf6R+jyKunhHfPgzQY3dLmT59M+ndBzKC8Ie
 M7LBjKaBVWvHOzMIA3rPnoe/qEq6Fo8Dw19kS4bZ+oE4Hn3jDF2sabCG+HBmsH4R
 jublAiJAY37OH1F3YRiWfvLEzflXVzDux2/s15CAu4bQyvhaVLnQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id GlM6hPFL4Lzb for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:31:47 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7Ql5Kydz1Rwrw;
 Tue, 15 Feb 2022 22:31:43 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 31/35] target/riscv: add PTE_A/PTE_D/PTE_U bits check for
 inner PTE
Date: Wed, 16 Feb 2022 16:29:08 +1000
Message-Id: <20220216062912.319738-32-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

For non-leaf PTEs, the D, A, and U bits are reserved for future standard =
use.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220204022658.18097-3-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7df4569526..25ebc76725 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -937,6 +937,9 @@ restart:
             return TRANSLATE_FAIL;
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             /* Inner PTE, continue walking */
+            if (pte & (PTE_D | PTE_A | PTE_U)) {
+                return TRANSLATE_FAIL;
+            }
             base =3D ppn << PGSHIFT;
         } else if ((pte & (PTE_R | PTE_W | PTE_X)) =3D=3D PTE_W) {
             /* Reserved leaf PTE flags: PTE_W */
--=20
2.34.1


