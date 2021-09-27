Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA97418FBC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 09:15:45 +0200 (CEST)
Received: from localhost ([::1]:51558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUkrX-0006M7-QG
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 03:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=897d3aada=alistair.francis@opensource.wdc.com>)
 id 1mUkpl-0005gt-KT
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 03:13:53 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:6131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=897d3aada=alistair.francis@opensource.wdc.com>)
 id 1mUkpi-0004r0-67
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 03:13:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632726830; x=1664262830;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t3bzS1775j+tHFw5+acFJ7DeBVfviDy1b8XEhnA5Z2o=;
 b=VpJ/JzHT3T+Bhvplqg5NgaXg3Lu+VDGX8rJTuk66xx3hYwhhUqvHegrh
 kxAV3YoDktxn0u97DM3/s6sxeRtMIlb9tfU2+kAnPw7g0Y0QDVLfIDQSP
 TykTqsMDFOa4m7mONswY1W44Vx0PDberofdod19Xy6EmSSHnD31uO4QcF
 2vatl57yuCMzeK7/rZaon7uQk4IUr+hQUAxgqsc+PT8ozduvKYyQGBCxQ
 Jh4l6s8f9NDd0jgfF8lWQG2GRVWK6qx2VYso8AHjFNz6TffWgVufT5MvG
 jkUEqYSD3ItwVddciMS12Ac7Ri8zcPURLhofrwrHDmEutnQBmbuWZ2IyB g==;
X-IronPort-AV: E=Sophos;i="5.85,325,1624291200"; d="scan'208";a="181654340"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2021 15:13:44 +0800
IronPort-SDR: 3dPFMMTzL+i3v5ug+J1MsJqMwuAtSpDs1QQZ9ecOkzujlg/XpJagFuqjO41XMHqDiDplhOFewQ
 d1l/CR2x9vuuTT9heHAW1LXd81gaha8SI3+LqyYvw+yZy0qE1D3B+f10cVXF0qV2EEcwZ9mkPR
 Qs19y+WIIsgDQki6GG19PGN9GDiLPvQ1Q/qSRyt6d6vO1cBGIKSaMQED0Bv4LJrY3B7h1iabLn
 4b3Nr8flekLX40kIaO1/+Ho9yHzsFnoqTLujIhaqObxSOveHVrytA8YaNgdgQwho0tdlsEaA0P
 rjiPzo3YXPxTl/0YUPSeYVJu
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2021 23:48:17 -0700
IronPort-SDR: na9dWIGYkhb8/mmQl1r1Uf6X9+aWyr8vYsFB82LU5GmoM3e5qCLuI2HvTkE8obnJ0vH27/Q4Cz
 IIoHNME+OeM9Uk/noWQwlP+kC0zJlcEJYPXu7UbD4v0fEPZz5/+YJaDYDRFIXiC5v2hiy0bcgJ
 wtbn6e4ppr00H7ct/Pj8y8xClHDyzCXb5/P6+c8OOUVo/X+0oWBfDZqkuWT1dPwqiunFzQkMiM
 2i6FEY9/gYiozhIlZ8Yb3NVgzZFL1Jzx4lrAbXuHRGIs9dVX5usQa6BJ0SU+vmVij47mTKg+F1
 ZKk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 00:13:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HHv4l29cYz1SVnr
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 00:13:43 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1632726822;
 x=1635318823; bh=t3bzS1775j+tHFw5+acFJ7DeBVfviDy1b8XEhnA5Z2o=; b=
 V8ht1vBn85SSKKHEuXBlstNju/7JhOOwRqUI0zSPYQscGsooff0Grtp579ml4IoK
 YhzPpT6oRblAzxe9/ppU4NNpL9kjxijA45H4jHZp36upUY4sTxvw1ZkuHEKmWvYK
 DlRf2EY1YiEeWaWDTkJooxtfWj/WTRA5XOXTONeR+KCY4PnfjGItWofBHARsC5id
 0GXH+d8SY/t5BUTO8KPgSmX4Ij+kiUeoZ2ctxpNrHa6LTBAeNJWkmfNW0iAS+9MF
 x8jugo0hawBC3y9A5CFgrgkr1JCElP2K8AwlutMfS4nADfB9eyup9mgekteoxdfM
 Kyo89DhPRx/cibi+rIXFIA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id gJSkXQzIWRQS for <qemu-devel@nongnu.org>;
 Mon, 27 Sep 2021 00:13:42 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.27])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HHv4f2JQSz1SHvt;
 Mon, 27 Sep 2021 00:13:37 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, f4bug@amsat.org
Subject: [PATCH v1 1/1] hw/riscv: shakti_c: Mark as not user creatable
Date: Mon, 27 Sep 2021 17:13:32 +1000
Message-Id: <bc032f02f44192bfa057cc4f09311fd18d07ef1f.1632726758.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=897d3aada=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Mark the shakti_c machine as not user creatable as it uses serial_hd.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/639
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/shakti_c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 2f084d3c8d..603992d442 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -150,6 +150,8 @@ static void shakti_c_soc_class_init(ObjectClass *klas=
s, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     dc->realize =3D shakti_c_soc_state_realize;
+    /* Reason: Uses serial_hds in realize function, thus can't be used t=
wice */
+    dc->user_creatable =3D false;
 }
=20
 static void shakti_c_soc_instance_init(Object *obj)
--=20
2.31.1


