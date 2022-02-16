Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535234B8175
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:24:21 +0100 (CET)
Received: from localhost ([::1]:56442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKEfk-0001Js-6y
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:24:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpM-0005bT-RF
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:12 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:61649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpK-0006K3-Bu
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993010; x=1676529010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lq1YADGSCZFa18AOrj3oFEX4AW2ekGKuYY1tpRjAVEA=;
 b=Z5iD0fpMLr+VRXQXtkLKA+D+P0SivUuqYf+I/l5Wp3u4F0e3QbVMdvOj
 8tLJXYOm74TuIhEhKf61kTFauHHxoPoXi8UXsZOkFM/4VkNrruBKUnN+R
 6g5akq6tWhgyqHr8MNN40BtD/jrymS/pr0x5Eg1w9A4KxIU3wveuZ0OnQ
 I4jqpPR8TOi6W1QWSGnUyvInIkIDEF3lAwDJh35M1W/esZ/2TRHbvSQZN
 y1us/3MBHmozgYetx3eDVR8tecwRIFtxKIdlhs2tVfoeIsL21D0Nvjp8s
 Ia94hIwKYGNdfqEk2i/F38kP6duIDWmdisZAvwsnR6fDIoiifeHIMq5i2 A==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="297181729"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:30:09 +0800
IronPort-SDR: BeoGIgvlkJSAAKWVO5nrUYeR9LBlJivLAv1a2CrC9xbAlSOTcgXs1tg+l0rM5TSbgs5kq/MrvT
 SAFBmsmgl1qzs5H3GVlhMh6sZJrlbbnlHFx96zgH8H1I9SucJgYLVsQTF1tRgGSTmBQ1StpVy9
 u7WJf8GJyV+edAvOjf7IFSP9ms5j1jqBUmmzOSfJ7+xyW5qU52adQwvE4X5AUihaa7WLhkdi9P
 v7CoD8SMeQIiJyplpSTeI9QrbRZ7TyWHy90d3FSCiB7R/nsxziaU/S3nYzlviRAxzElWfXFIc3
 Um10Z2ncJJ1TDgSEP3GqZrdr
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:02:57 -0800
IronPort-SDR: 5PGLwW+1mnzTrQGtFJKf/iSZBJjqakHUW+kEdXwpfF2dYxnIrZ/XNf7NxW+GuNtNE0dRgUrOw1
 JVWJXsfSfgDVoiCWWE6+9hZuNHDfDj57cECftCl6iv9KhfQ3aoWzcZoLVHEBvyhOmH+k6yu04e
 98Kyq1yMo3esmXESeRua/bOkoOhncS70T8jqksKMXpfxXyRJrVvaqaQvfJGfwMxCPLxXhWZsmF
 1n5cL/RTuurtkgACfNu8bavBGsFNYu7Uy2RMQU74TRo/VXnPc2OOyiwEFO4ZAjLNaWSxALZKEV
 DLs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:30:10 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7Nx37TMz1SVnx
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:30:09 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993009; x=1647585010; bh=lq1YADGSCZFa18AOrj
 3oFEX4AW2ekGKuYY1tpRjAVEA=; b=C5NlOlyadqc0vwWt0AUxNSAABmG2aq8/0a
 pclO+BmyZ5uO03A3LdlCKMYjReR5ZR7uCY7Xx3ATR80kwYCBQ75oXe/0+ttF7W8n
 90klClDa8pu4BNeMWNaD6ql8yc5Vi/6JT15+f99tKZiSSFZIqApLb3K0Q6EaFaCh
 coZhTca9v3ZPlfbsWMyXXKnuMIG56Vb3tdodo8rB8aZvaqn9hl6Ns+PtQoMQ3/xo
 Dm1YlZZUzPwlRpDfeNRot5ud+fby3ewOUmhNFYkmEFXf6cind+qn+dqfvc7tgLEr
 bFxT3ulqNq/vDH6aH43gY4CNCWNfmfOjITmXlFlJiKWJtzd9jh9Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3OE2N-ALB6jl for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:30:09 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7Ns5pnFz1Rwrw;
 Tue, 15 Feb 2022 22:30:05 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 11/35] target/riscv: Fix vill field write in vtype
Date: Wed, 16 Feb 2022 16:28:48 +1000
Message-Id: <20220216062912.319738-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

The guest should be able to set the vill bit as part of vsetvl.

Currently we may set env->vill to 1 in the vsetvl helper, but there
is nowhere that we set it to 0, so once it transitions to 1 it's stuck
there until the system is reset.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220201064601.41143-1-zhiwei_liu@c-sky.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 020d2e841f..3bd4aac9c9 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -71,6 +71,7 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_=
ulong s1,
     env->vl =3D vl;
     env->vtype =3D s2;
     env->vstart =3D 0;
+    env->vill =3D 0;
     return vl;
 }
=20
--=20
2.34.1


