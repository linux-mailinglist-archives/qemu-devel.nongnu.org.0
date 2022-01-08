Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039B2488228
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 08:29:27 +0100 (CET)
Received: from localhost ([::1]:47064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66AI-0006nz-Gg
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:29:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64f1-00015B-DY
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:07 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64ez-0006wI-Pg
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621180; x=1673157180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CpjFIVDUyup+SdF7i7NKBh+G2IBjSLOQKoRzLPkUUqk=;
 b=HmOyjgB0tc5UtSRLXqxHWeAU2OgeefTgENIHXPzjgKxubSB1YwbmULle
 alOxZoPKjnYfOPkkAwzn4heTjyYim5pmqSim0uRzcgNcS3u68t9qsBi+L
 EUmafha8UionTd/Vjj4hHEHqqAsBZS6Ci8sKlALu9PMAmb8NOfr7ieRmT
 TQ+A7HV7M2aBruoHu3CzVAOBTUG9B510yv5k8OLrHUTgOX97CkiGOlkqj
 Ln78OeCIl0sfjklEi/29lDTR7v/V6KykukbvzD4tp7vHleqJwxoGmr1kN
 7UOSXjBXOvQn4l8IXSxaCqUXcrVpe6mS6hwZz51hhi+O5wMS8pODZgIZS w==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984937"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:52:59 +0800
IronPort-SDR: zm5I1klfdD/GYT0Z3xftKUjtQBEf6lsxBD6k982XjVhjdIAj36FKEeEIWLtABLdy7SyvPGtYdN
 N9wM53xK6jwEdM6L3ncwDsqLpHkWGpszzpY8ffPM5zs7cjHvUVInw7KAxmL8I2Kdk64Z52wbwU
 2yX3i5l7dXwhvpTJlt0IVAE5qlJCClHNRopCujzNC+PtojvM7TfCpNYi5n+QgUixZCk4RFR3Ag
 wArJgBNtK3Hdr2WCsJqIsYE18pq2p4GKzNjs21czxFcnr2VQQXTK2Jur7w2bNlP+RnM+gXxipd
 hRVp1WH9hXTaZIo5TNOj1L4g
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:27 -0800
IronPort-SDR: NRaRqTyjwA1/IAt0wt8tT3LuDh6B8kIFgdrD1MI75PxeDahGFX67gXIbo9UhCjpQJ94wTSrLJ5
 gd9QNouHARsi7JgoZH+QeQOcNgS8uXfqvkJ6zvZHCmvhH0/rCNYTvyYAf4nRm7MbUAKMRKip7h
 jG1F9u0en/hh9Q8xrh2ujTC6lJKqUJx5dUnLw+wAobIiK2wrfzznjxanNYuL9TTID18FnQQMTF
 X9RM96xwH4uxrbt6zJ07+G6l1wrLJkhgdhfMRGzdPUKryvm0GunwpzWedg8BOzGF3/vHUfxrTE
 M9g=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:53:01 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Q41TJBz1VSkg
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:53:00 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621179; x=1644213180; bh=CpjFIVD
 Uyup+SdF7i7NKBh+G2IBjSLOQKoRzLPkUUqk=; b=DqHJpQqijum/Y1PfjWLaYBO
 hW4FJqX5piv5BnuKTseL5VQtCACPfS5xUMhfKFvi2S6FvyZHSZzDtNtcDBAJt+DW
 5751wbqLotvbi27w1Cyhq6E5BGxpEfS93E+/Yw7JMWji/+FI/W5QctAoO6mxhe5J
 JcJFURVvbbHnb8a25E4YMXoQe20lCu4gTQMb1S9w04hjMuA/FrCfo5sjTMHPew/E
 wtspnTdpSW6AgBJEGuvBaY6I9EE35WsGUH7PCv+CgqiQicefTdfLB9zHRZESZJ5i
 1Mdy0vX/SAQjQTSqneVEWNUxadgdy7LfTFy9ZN2hzRVQxeRPlomM3MRIthd7U6g=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id tfEojYjnNuw7 for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:52:59 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Q019tyz1VSkf;
 Fri,  7 Jan 2022 21:52:55 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 26/37] target/riscv: support for 128-bit bitwise instructions
Date: Sat,  8 Jan 2022 15:50:37 +1000
Message-Id: <20220108055048.3512645-27-alistair.francis@opensource.wdc.com>
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

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

The 128-bit bitwise instructions do not need any function prototype chang=
e
as the functions can be applied independently on the lower and upper part=
 of
the registers.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106210108.138226-11-frederic.petrot@univ-grenoble-alpes.=
fr
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d4cf965c9e..b43efc9bc3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -523,7 +523,15 @@ static bool gen_logic_imm_fn(DisasContext *ctx, arg_=
i *a,
=20
     func(dest, src1, a->imm);
=20
-    gen_set_gpr(ctx, a->rd, dest);
+    if (get_xl(ctx) =3D=3D MXL_RV128) {
+        TCGv src1h =3D get_gprh(ctx, a->rs1);
+        TCGv desth =3D dest_gprh(ctx, a->rd);
+
+        func(desth, src1h, -(a->imm < 0));
+        gen_set_gpr128(ctx, a->rd, dest, desth);
+    } else {
+        gen_set_gpr(ctx, a->rd, dest);
+    }
=20
     return true;
 }
@@ -537,7 +545,16 @@ static bool gen_logic(DisasContext *ctx, arg_r *a,
=20
     func(dest, src1, src2);
=20
-    gen_set_gpr(ctx, a->rd, dest);
+    if (get_xl(ctx) =3D=3D MXL_RV128) {
+        TCGv src1h =3D get_gprh(ctx, a->rs1);
+        TCGv src2h =3D get_gprh(ctx, a->rs2);
+        TCGv desth =3D dest_gprh(ctx, a->rd);
+
+        func(desth, src1h, src2h);
+        gen_set_gpr128(ctx, a->rd, dest, desth);
+    } else {
+        gen_set_gpr(ctx, a->rd, dest);
+    }
=20
     return true;
 }
--=20
2.31.1


