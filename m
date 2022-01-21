Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E010E495A03
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:35:52 +0100 (CET)
Received: from localhost ([::1]:39210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnWZ-0000yg-Te
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:35:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxr-0006sB-Og
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:02 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:9014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxn-00045v-9E
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744795; x=1674280795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hHKsDj3kSF8NK8YhDmgUu4/dhSlxBQeuycUlgBSHJOg=;
 b=NbtJfpccAdi/AMHh7QPZqO0uFRtdPSj0zR7pFZkqkE3WdLl2Oua/L3Ok
 f6HNBtIA+6Pyutr0aGvjurES6B154UXlwn3CQqI1JajUuVQPX3MOgy7B6
 LRAL4MaiPpbb50aGwOfRIlryYB1Fxeoqkfs6EAi6Lj3JXmJj29DcEklDk
 Jv0GzR8mubjtxIuxIc5tsjcIWuWnnK0PmV7YgU54cMPODtQa2vGMLo5XM
 C3b1voo20/TWHQaizYHPuuq52C3Bb/8fo7A0Nl7JNVcskfmOtGFawAiuU
 TvYiSVtG7lROClP3iWP6Ov0gzjIAz5wNEVGXoB8y+DGZXTbi/eohStDRB w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="189976543"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:59:53 +0800
IronPort-SDR: oR9HVyhUC11pf4BptW6g7nUTmXeNm462PI9M5fEZkSR3HjhUhWfUo2Db/09pTXvcaAkjTZ8bik
 zG+pe64UKxaZE/9ob6A9Bno3fgRJL13bftKdLkkUcrkBiZWzOQyQWiYbbC4saGk8TCX8li5UCr
 ZMRb4LsUZ1nAcD/YGG3EzZlhBj5j4VY99W9uSq9wrMAxAwk3IbTnVgw7IzsV0bQEFRyK39c9rK
 CcyGSfNyf+AQEXs7bfF3JdAg2vxZgZbbkd/emDal2TxrqlJ+ZQ9+HxUdoAxV82KRtA0Rn4Amje
 6c7/vVu94eNKllTmV4uwCCni
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:32:04 -0800
IronPort-SDR: WJPx9KMpPUtaS1NsqxO4mBn5xEgQfSTwFDsLv9eqE7dDEKQw6UytcIK1nY8Ezgm4FiLqK8oLOz
 17WRxK99yK+Ix22gvSt/XBeJ3dXS2M2iO7SnnyTFe0cljuU6bAZqIBmltmDkMHh4eXnhzZm8BZ
 YHMm1Rpijh+W4inI7ikKTOOyCzN5M+IaSGWjq/1+ewBsuhcVsAhsTViTl7xe8C25eEWqbyCAq9
 rYSnfk/ZAzgs/QItSf7u0Jo8JhNS5GgtMAcQCyiZLC1vZtmOCqJzyfLLCBlwYaYXMFN+w1e1we
 KNM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:59:53 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7y14DpQz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:59:53 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744793; x=1645336794; bh=hHKsDj3kSF8NK8YhDm
 gUu4/dhSlxBQeuycUlgBSHJOg=; b=PFM++hg3OiNWJnVUe2sGUp0RMDWJiezltU
 NDONTUBrxMhs8tQ4rRJiFV+VKE0YRicMrDR7cR4JHM00cVzgvhoILfvSsTlrIiBb
 ONXOJnXplXPxl3iH7ZzQhZNWla66PIydtHE/iksYPEpoPUyCsc195PYkiBnZQXqI
 ymVoZCC/piNAB8NGE7q6ggA5FM668tkAb2uaIsBT2laxz6JjcWgdB5NiqeEaBbR8
 MSAMliLJgUYB8ypETj6zhp57+RkIPUppuztguajXAkVvqzH79JF2BrNe9R94PGiV
 DyJmhvtXR+btTqpylSX1k/+B08jdEvpv0Fvvrz/ch2YgRpGx8beg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id pj8ydikxuRLn for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:59:53 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7xx3Hfyz1RvlN;
 Thu, 20 Jan 2022 21:59:49 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yifei Jiang <jiangyifei@huawei.com>,
 Mingwang Li <limingwang@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup@brainfault.org>
Subject: [PULL 16/61] target/riscv: enable riscv kvm accel
Date: Fri, 21 Jan 2022 15:57:45 +1000
Message-Id: <20220121055830.3164408-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

From: Yifei Jiang <jiangyifei@huawei.com>

Add riscv kvm support in meson.build file.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Message-id: 20220112081329.1835-14-jiangyifei@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index 333c61deba..833fd6bc4c 100644
--- a/meson.build
+++ b/meson.build
@@ -90,6 +90,8 @@ elif cpu in ['ppc', 'ppc64']
   kvm_targets =3D ['ppc-softmmu', 'ppc64-softmmu']
 elif cpu in ['mips', 'mips64']
   kvm_targets =3D ['mips-softmmu', 'mipsel-softmmu', 'mips64-softmmu', '=
mips64el-softmmu']
+elif cpu in ['riscv']
+  kvm_targets =3D ['riscv32-softmmu', 'riscv64-softmmu']
 else
   kvm_targets =3D []
 endif
--=20
2.31.1


