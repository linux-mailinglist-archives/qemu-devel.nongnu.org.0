Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00A3545B36
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:41:59 +0200 (CEST)
Received: from localhost ([::1]:45784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWT8-0001qT-Rc
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFO-0003L9-1V
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:27:46 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:23579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFM-00011H-AM
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:27:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835264; x=1686371264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ydyFe4L2CS18cjIsAWZil7IWbtmtaOyWPCVN2h6MtrU=;
 b=OTg0ci8F//0ILPAleQUkL6AJkhjICemDBUn3s4gRRclmTZtxqX/EMU7p
 RkEw7puvn1tyT+KR+24HMSNoHP+DC3axcQfO4S6ga0kd+A3SSpuRYwyvt
 Ffn2CH7LSI25eBhKXDjbgke9fSE5wfuEjFk47h5HtJBZ9FyBjPIvNoC8D
 uAGuHLyHMnBWwuFoCkPJ4yCMoxC7ny5xLqjfXrLh2/BR0DSQwEKcCXiK0
 JxkL4StMS40B2kshFzWmkl4T+Pu5o77XpF+CKFRyFt/v460TwTuZ5iKve
 74bAcH+1C/eOOeBviEZt+72JL6VNVwyPM9insxp+FcR5xADcYzDoz761e A==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="307046436"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:27:43 +0800
IronPort-SDR: h4P8JqRtMt3xCqOdbSGGQq3GdGKUyjC0j2UEgBIcr2CPGj5iyEiZGe1td2rCNFOaQAjzGlM4/k
 QxiVPjWUnMiIPXdiSQehoh21ZdeLnG8WdQMlbEYj6JYW6BCl37uBJbHDmXbkCuX/TNO0aGwCYe
 HVGfkuB9DQKgy2n0BdxVgRU1oJx/tgC8NjkejBafHEAMTHL55BSlWj2Ngwsvnfd5/1gH6nR/6r
 cCfRNUZCgjyENLzh0Ib5xvMq+7PDVphOMc+sbWjLi57pIvX38KCHbsRObkIn43joCZs8NzsUcS
 7TlElKHnqjhhP/FZqXkr8BqS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:50:51 -0700
IronPort-SDR: 4TVUF0cOEoiUt9ZHfjjYYtnLfrkfwXUXBL9FqP2eiaDuAxABRu1grjrf8vq0WyzuXbNvriipev
 maBgnTlfZQFqwcAUglIfOrKJ1XpapYnWrn6Y0iFQJA60RaqMrhli1e+N1VK68Nd9ZbgYocUccP
 JCwgaXAvRqwJ9u6C6b7VK2Xka9cHVW1Ib4H+TYZ63ZKCySVLLVKA3+J5WJmbuvsla9i35yp6n4
 34M+a9h9//ikcSnKwhocF4sZnAhq/qGeg/5gBy09nZQi4HDtCRws+r5nWtZpRGBcCTHPfuBCIH
 Zo4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:27:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7H30qMrz1Rwrw
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:27:43 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1654835262; x=1657427263; bh=ydyFe4L
 2CS18cjIsAWZil7IWbtmtaOyWPCVN2h6MtrU=; b=LJeabsrvykmJkwaEnDnsXpA
 qEftEOW51XryRJczn0ZSq9TmjYYmMPHkew3dsDJBA2ghiwqpIp/YC7PAV55q0Lww
 Qow0yA8mqhVkV7V6FmPwU6kuxzSojKAA6KRDomr4DXA6reJb1wud8bFHWaec+15e
 p5mw3MW154YU7ZZQeJhz548rXx56O2rUn9Dku1TcTRE6m9z64PEoElMkaSGyFc2E
 SC52/JuxZWGf8LDW+XqT5m89MFCv3o6duCPGgvCPHD0dMNeveL+bEpxVbHoYPBCl
 o+JFFWc54xZtiGA5qP8z+jJERVPK4jemNwgHmFaiEQRTn5gkigew8OZQVt3a65A=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0BsFz-J1QaaO for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:27:42 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7Gz3p79z1Rvlc;
 Thu,  9 Jun 2022 21:27:39 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 07/25] target/riscv/debug.c: keep experimental rv128 support
 working
Date: Fri, 10 Jun 2022 14:26:37 +1000
Message-Id: <20220610042655.2021686-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
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

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

Add an MXL_RV128 case in two switches so that no error is triggered when
using the -cpu x-rv128 option.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220602155246.38837-1-frederic.petrot@univ-grenoble-alpes.f=
r>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 2f2a51c732..fc6e13222f 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -77,6 +77,7 @@ static inline target_ulong trigger_type(CPURISCVState *=
env,
         tdata1 =3D RV32_TYPE(type);
         break;
     case MXL_RV64:
+    case MXL_RV128:
         tdata1 =3D RV64_TYPE(type);
         break;
     default:
@@ -123,6 +124,7 @@ static target_ulong tdata1_validate(CPURISCVState *en=
v, target_ulong val,
         tdata1 =3D RV32_TYPE(t);
         break;
     case MXL_RV64:
+    case MXL_RV128:
         type =3D extract64(val, 60, 4);
         dmode =3D extract64(val, 59, 1);
         tdata1 =3D RV64_TYPE(t);
--=20
2.36.1


