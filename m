Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF9B5333CB
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 01:12:05 +0200 (CEST)
Received: from localhost ([::1]:34292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdh6-0004Iq-5l
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 19:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHp-0000ll-HO
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:57 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHj-0002oX-Bp
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432351; x=1684968351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bmtKxYnoULXbt3IKBXBwJL2/mOux+7FD0WrfghcE8MY=;
 b=aWdKeN+6I1H7m3Asilzvx5txKg+FFq8lVBzT6/WLFRGSQPJDx4Uv5sps
 kNfkPGrGqQDvuZCBYBQxbsqvxH5v59FZkLsx4BvvOwrNM/pu7qrL1ankk
 eBl7ZhgkFge4v4fjanhpZrEtpGLTIq5yaZGHQXutBEV1bv3iDPCYlnRj3
 wNZ/fLYqi8NDNX9W5ldHlwnu9PyXpiVgHD2xkyPs18V9nfwBFz/rnO88w
 Qo3zbRvdqfLMJR67Qrs2sGgACnnjWp0qvEL4h0GTSIpiQOxVgAUhR+cob
 EINkw8DEQmr+vCbWCIYnjFfwfZffOoDebwH5YaoyTIkGFNA7KvIsB0W/q A==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566712"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:45:30 +0800
IronPort-SDR: XxuhKL8EMQDdI4nm/ZtXxj4JBsP2nah5IDoRNzGHeR9j3zliqqJ5dAoNo45mUuIKB9zv+JyqXh
 7rimJKJ5FX8w7Jc8ST92tHvTeBIH3CCGgXT6Cggomnm8GkCNXOLLitRoMlVBpJvdOXV2xe3H2F
 acdBdPpdUFLu5T5EhGTSSTX0K+pk0v1sguBfR01mnPF6i8HPgv1gL/ry8byeiwNUlDx1cYMm1N
 RelRXrsVBC/ZTvUcGPoPes0PKlAVvNW+W/Auv8sbItYE9uOPkFQkpVzQl+k71EpplZRlVRT1M3
 lyHVYFmJCsX/WXjjz88Yhhxh
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:05:02 -0700
IronPort-SDR: a7rD8CMHMkrrCrWEzbc1Wkrrz496Qn/sWmAKeM4vFjsnXR+JZ0W4q9NLoSa1gFoIwhYT1gyvKN
 TCyVpwXT215wUi2fjDRm0I4GiDMku/RBM596MTUC3/g6i07WBp+g13TGi1uafog0W95JVyyCuV
 Zupbugj5MxQZ7Xh/G6sRYz4xlJAB+LlHkNtvPsSVN1CMChOhM6HIJ6GeE8FanTET2nsIMmIMHc
 rJa93p9hWF7CdsngCPctN2/8vnc5GYS+LOpMeFbRpVQzA6F5IcKpehkG5i69i3yqBzROZG11/y
 XOE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:45:31 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78RZ52kxz1SVny
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:45:30 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432330; x=1656024331; bh=bmtKxYnoULXbt3IKBX
 BwJL2/mOux+7FD0WrfghcE8MY=; b=i0yXuKhgriSrgFbuSUwgLeASesTdkXmfa9
 uSJ1FmhU6c47Nvzd5UFjS/IZSHtzm7yuF5t2V4T667ix7wZzfpQk/LOiyJfLKoCZ
 lZKNrKnIj4C+mykK9cwH8Kbjrl7fQwc+uqgcCnVvhN4tq8feTm8s0THlWHPGS1O1
 n+F5a7aLOWFZdoQjtX78VUIFef3D4t21ENdc4BPrKEuZodcovXqN1B6FaWFhVvn6
 gvW1ujFbbfYD6EofChl2qex19XZISTeekiz5Sjk0UvXvSJ/s8AaBzDyO4ijH8Wos
 RXQ5klUHerDnBMFHAgvFuSA24K1gZhKeK/MYeZmGcf7weYjJCmBQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iJnfcENddNLz for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:45:30 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78RX1M3Fz1Rvlc;
 Tue, 24 May 2022 15:45:27 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Jiatai He <jiatai2021@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 21/23] target/riscv: add zicsr/zifencei to isa_string
Date: Wed, 25 May 2022 08:44:26 +1000
Message-Id: <20220524224428.552334-22-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
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

From: "Hongren (Zenithal) Zheng" <i@zenithal.me>

Zicsr/Zifencei is not in 'I' since ISA version 20190608,
thus to fully express the capability of the CPU,
they should be exposed in isa_string.

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Tested-by: Jiatai He <jiatai2021@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <YoTqwpfrodveJ7CR@Sun>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ce1c257eef..a91253d4bd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1029,6 +1029,8 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, cha=
r **isa_str, int max_str_len)
      *    extensions by an underscore.
      */
     struct isa_ext_data isa_edata_arr[] =3D {
+        ISA_EDATA_ENTRY(zicsr, ext_icsr),
+        ISA_EDATA_ENTRY(zifencei, ext_ifencei),
         ISA_EDATA_ENTRY(zfh, ext_zfh),
         ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
         ISA_EDATA_ENTRY(zfinx, ext_zfinx),
--=20
2.35.3


