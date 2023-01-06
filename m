Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B6C65FA02
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:15:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdBz-0001Hb-UB; Thu, 05 Jan 2023 22:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBx-0001ED-VV
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:49 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBw-00088M-BU
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974888; x=1704510888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5r1V+bBAoaOnA5sAMND/kCX+QwSnGCJPzX5P5e7+rZY=;
 b=gEAmrnBvely4pgQVrcQTYaSn++l/AhL3K0nzhcK+AzXBiZToUl4DTCQH
 NJUNZ6A6R4g/upP9H/gx7l0uR/y680mW6zx5YWISvUwgMFOCgFhw0jTHG
 zo3i6QLzSODbfncvfwG+VMhvdOshIMo1q/r52M26y44LDBWGUoHhCgxe+
 WbH8YTPvEezTf+rZzU+0adJdEYA3IlyDjbIMvm5gSqKh4g945xs7G7wpB
 Nhk3xmsOwgXAI+gNOv2wq9cpo96s395vLMryBPOf5mzwn/AjnGmZcc629
 h6gWbilPuFaAKC6FUBYRSt98lw8WQwqoqV0HdjY8knglzvFiyj8/wcxJd Q==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254781"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:29 +0800
IronPort-SDR: 8iUHRHUXbV2Pse9J3eYl8S8iHHaSAHAKWTon2WpcFIdB/qgbb/ws2UiCQinG76l3qUoXF/RU1+
 wybJm3Q3u/cMBIWNS3u6Li7qiOz640tULfA6gD64xD9986PBUjWs6XmNU9qQGZOyMFu63UosFq
 xRf3kCTVUqOQWc0mkFxxh3d7hxLiBYIAKWU3o5Me/bMTMQChfUzd4yyFxqlHkd8nlwmEVdOzUV
 R39NYIKjbBgPeN02E9o4srVVp8Sr606PgFRPWuGcpIxT8LF5Pk5oGyWAPnigjF+qFRd69OzhdV
 rT0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:40 -0800
IronPort-SDR: flvDZTKLDy5K1Jk+I3Tf5AABJPsz+8BMNugHW4aJmBq6luWk+yTHRp1dLCmRrns2kJaVSZp6A+
 7xcDsPwdskVGLoGUBNu/gti7bdqX/0OZKFaspwvAuPEoKq0PTnw0wZfbaLSpS4eKQ45LP44lAi
 uAuOxw0nEgxJEgPoY/blIR8Ag6ISp6vWTdgTyZCZUnZ+2maln7vVnL4lc5E/VGZSZCGkfVCJ9X
 7FTLdT9ymZzCgOVdwcYMCa0OLWb3h6Ej25/MgxvelV+7UCBiN7HpJH3vKB19fCiUUsVvzgyFhP
 Xd8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:31 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jd5PWJz1Rwrq
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:29 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1672974869; x=1675566870; bh=5r1V+bB
 AoaOnA5sAMND/kCX+QwSnGCJPzX5P5e7+rZY=; b=mNCrYjgEHQDzer8+IIbwXmU
 De9wOqrwxgMOce5W/UI/LloCXeJX2cZpoW/vUBhLwpPWU2M67M1JbDGWMj4QXL+d
 rBu7N3rSy+YMCIsPq9FbBadjjCdXIgaKP2fPGraTbn22Zj5dNCG1CaicWAzVJMTD
 HIEBGTK29xEpXET0EAHou3l/aAnGWbwgJpj8przECzCsd0yv8NhRsLefaQq6DDwW
 cIdp6Fc1R/0OA679yQH45zII9mwaadfE02zWW5rEYtWy/3e03riOIy+g0tlLZe0T
 FXRvzgel5Wy3ZBmsT+0krS+wdzA2LRa+HlHbpZ5i5l29qn6TIe1PtjSv9ywEsBg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Z6l58xSlLdEs for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:29 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jb6SNrz1RvLy;
 Thu,  5 Jan 2023 19:14:27 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v3 14/43] hw/intc: sifive_plic: Renumber the S irqs for numa
 support
Date: Fri,  6 Jan 2023 13:13:28 +1000
Message-Id: <20230106031357.777790-15-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

Commit 40244040a7a changed the way the S irqs are numbered. This breaks w=
hen
using numa configuration, e.g.:
./qemu-system-riscv64 -nographic -machine virt,dumpdtb=3Dnuma-tree.dtb \
                      -m 2G -smp cpus=3D16 \
		      -object memory-backend-ram,id=3Dmem0,size=3D512M \
		      -object memory-backend-ram,id=3Dmem1,size=3D512M \
		      -object memory-backend-ram,id=3Dmem2,size=3D512M \
		      -object memory-backend-ram,id=3Dmem3,size=3D512M \
		      -numa node,cpus=3D0-3,memdev=3Dmem0,nodeid=3D0 \
		      -numa node,cpus=3D4-7,memdev=3Dmem1,nodeid=3D1 \
		      -numa node,cpus=3D8-11,memdev=3Dmem2,nodeid=3D2 \
		      -numa node,cpus=3D12-15,memdev=3Dmem3,nodeid=3D3
leads to:
Unexpected error in object_property_find_err() at ../qom/object.c:1304:
qemu-system-riscv64: Property 'riscv.sifive.plic.unnamed-gpio-out[8]' not
found

This patch makes the nubering of the S irqs identical to what it was befo=
re.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Message-Id: <20221114135122.1668703-1-frederic.petrot@univ-grenoble-alpes=
.fr>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index c2dfacf028..b4949bef97 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -476,11 +476,11 @@ DeviceState *sifive_plic_create(hwaddr addr, char *=
hart_config,
         CPUState *cpu =3D qemu_get_cpu(cpu_num);
=20
         if (plic->addr_config[i].mode =3D=3D PLICMode_M) {
-            qdev_connect_gpio_out(dev, num_harts - plic->hartid_base + c=
pu_num,
+            qdev_connect_gpio_out(dev, cpu_num - hartid_base + num_harts=
,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EX=
T));
         }
         if (plic->addr_config[i].mode =3D=3D PLICMode_S) {
-            qdev_connect_gpio_out(dev, cpu_num,
+            qdev_connect_gpio_out(dev, cpu_num - hartid_base,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EX=
T));
         }
     }
--=20
2.39.0


