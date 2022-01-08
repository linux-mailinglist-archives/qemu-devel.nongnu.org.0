Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C504881EE
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:56:41 +0100 (CET)
Received: from localhost ([::1]:39768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65ea-0003Pa-Jg
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:56:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64eG-0000dH-5H
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:16 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64eE-0006sW-Ao
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621133; x=1673157133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1QSvHceYV+JaHdD8fOuwsLgZdYmNl23giOReN2L9akc=;
 b=DeUH0vc1udnRI6FFVjxFSa1bRebizt7k8gLYb8skKhJZ1VopEx0Ogbta
 BibJKkcrmCh/rISTAJcJQBZJdB5fLqETUMAz3EAWW2xLJWS4vKkqa7msB
 Hql7lIdbKNnzgpPaHla/pefmNdb/m5RzyjUzjRqTf1YPbSJG06hEoXuO/
 4vrj/8XY8lHTjSeqSIgRMzSSrnHoDYwOV23R/fbtfPYMxYlrvyISypXGH
 hOVyO57IZCKVQC3mshWU8YpgzTnzJD7mSwxpK1IpkGKNMTkeB5TnrMlr+
 SzuP1+dH9iMaW0juY+J6FZuhKB5RojxkO7fTvkkzi0epCdUQlrAb4/73d Q==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984916"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:52:12 +0800
IronPort-SDR: YdEQbHEMhJaf4RoLqkTC8XhLK1HP2VNU+Dxf3EYjjFeAq5kV3dq9A27iDEFn+cqg3L25nkITuv
 P0qcM1tBbtbsHFl4TffLaEDIu9t83fGYrQ1DgT+0OTRKUSleepYqQj7y/gSoO6yXFyJO6yenVW
 aU3aAKOdrlGNAKu8wqGauLv4dVGjW8JfEWZ0dsC5GgnwDJSTprWnY9/lQqIfhzDCBZPDkudgN3
 HoSVBQpZenCI6Xj8FfVdjffw7+5yzerVKDYetSvi8gBKoBBObM8B1EQi2IkzYvVIE9eClpbood
 KkuwI+ILkJM86yejl/WudGmO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:26:00 -0800
IronPort-SDR: ZHxAljxa4S8yj/3mT9Du+YJ84M55/Fu8xZ1Cv8S3s4IntshaxFngBW3qNImkRzffZehVuyZEKO
 E76TUoN9dWZEwJWI9Dvu0/dhI+ZcqQBcysnWanJSVSyLfZ0oGy8WzLCbcfj9fdD3n8vPq3swzV
 ubG4/qvfv6jiRlUKtdApShx/7+wCSgGNGtlnguFjCYTbzF455w0WeJtOWO/3Pv4DcUAD/kWH9B
 2Q4/df76EVUMjAgbJdv53i8T4Xzqr9EsYBSoQT6uqfpsY99scZitllOLVz5sU31VDUHF3gK/5L
 sbo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:52:14 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8P931wDz1VSkY
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:52:13 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621133; x=1644213134; bh=1QSvHce
 YV+JaHdD8fOuwsLgZdYmNl23giOReN2L9akc=; b=eQxFgTtLOu6CfaHtr4LDUKl
 8+ilCdtPuszFqdkw1nsDfzdQBfDBS05vk3E2Xfx5bsYBswVWpwuD8BR1hYJp22zZ
 L7wYU17m10fQLV9DvlzJgXIGPDmJknkIaVH/FU51nkkWwr2LXeKN1YNGWXTuCAbx
 4L89MrCE5q8PIjnKmsjlZe40llt0Byj2f5r5eB5MGssiaPhYT4Vp+xc36sA9fni1
 6YFEB5Fq7BXYEeit7g7oTeujrtpdvQagjczWTuugXQ5iLeBrckXArzwBVbs1i/ev
 vhBrSaTQ2x3wVOdRkrYvwvoWepyXt++1l95Ax/zIntYTRJe0lxO6V7fYNXx1xqA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id v0mDRsD0PhgN for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:52:13 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8P539KJz1VSkV;
 Fri,  7 Jan 2022 21:52:08 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 16/37] target/riscv: Fix position of 'experimental' comment
Date: Sat,  8 Jan 2022 15:50:27 +1000
Message-Id: <20220108055048.3512645-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

When commit 0643c12e4b dropped the 'x-' prefix for Zb[abcs] and set
them to be enabled by default, the comment about experimental
extensions was kept in place above them.  This moves it down a few
lines to only cover experimental extensions.

References: 0643c12e4b ("target/riscv: Enable bitmanip Zb[abcs] instructi=
ons")

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106134020.1628889-1-philipp.tomsich@vrull.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 29749e834f..ce21c1b5b1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -641,11 +641,12 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
=20
-    /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
     DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
+
+    /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
--=20
2.31.1


