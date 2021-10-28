Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE2743DA9E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 07:02:38 +0200 (CEST)
Received: from localhost ([::1]:50670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxYj-0005HA-HJ
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 01:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHV-0000If-EA
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:49 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:41761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHP-00057N-Sy
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396285; x=1666932285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NOi2wUJPbzMYjoO8hDlZIw3xVQn+T7NEBBLu6imMlYQ=;
 b=XriSxVOETW3d2BHxbKvc01x5BjzsRV9pMxu7NrQp9+2uek5pIRQeCGPy
 DwDtwtiyOp1fVZd9Tarsrmwsr6PByZM/PPTykboq0VuNxsHRscPI3s89N
 31mEbsdZ+mc+TlB6GUi5XZsrXmfDaueB3C+t1r97J3Fs1UnrWih53+fQs
 +RAkMMqIfCJGjf5FnsoVWOeOy5+EgLoqH88NnYf+O30b9FsWq4weDa2Sr
 bJ9K8vFMGsJWayyz3nBkHiXqs86Yre7pag3wuDXVifaKBeCYtLXo1o+7s
 S2lISwhLu5hMuTrkNBhw19e924WW08gNah3u18OSHtrfeT3yAihot0I99 Q==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="184975511"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:44:44 +0800
IronPort-SDR: +O90PoQN/lb0UGU0bj7YaFKxjjNtMDp9QnPUxA01G9AKQSrYDN+Hqbm0RZUeyPCvbYmRC6dw7J
 sxRBK+yaG8TYOzO6PTHGDasLa5sIkEWiK02euH4vgz52ueX9jDfDMVTJadIIIi72lyVFo7GCHg
 WWJxADxspXakjAOUPh6amkT6II3n80lACUlClULdO/uJPJGsH+wUk/H+RXIqJTDvOnY79I3SRv
 7kHqYQLT4ENkTJ9O/He8AchYK9dw5u5V6Mgrs1zIhwg6EHpbNkTPemY/+wn253KQgWlarCfG+l
 P4AywtEbHw7N26h9Wikd/kA3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:18:37 -0700
IronPort-SDR: Wm2JUIJTC7V08xIMu4EsUJM/d4mq/DxlDwUEbHvtkAqhSo6SsdMdK6PgowFSjcgbwuonMwG/7R
 Pnf5vCfvqXOPZ2JZjym+0Ofvz02PzR7aDUBHXJ4oSAH8BZ6pDPsQuvUMacWDt1aVylmMWy8Y8l
 +LzgcgMLKcYZnmjTrL5ysi8jBalh4S3HR/QFy58PotVh41CGpmSpybXPB6iF8sq1K56A72IP8C
 JT3WFJkcMRrfh2dRq7JGKdvg4jWwMLCGk7F3QCVpc9ZWF0gHNC0mDJAreRdjfOBH3iG9vfZ5t8
 WdU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:44:42 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftJV2nSrz1RtVm
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:44:42 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635396282; x=1637988283; bh=NOi2wUJPbzMYjoO8hD
 lZIw3xVQn+T7NEBBLu6imMlYQ=; b=Y1tHLC8uFevzTmVyAcDV6tl0IwPzCPZsoM
 p288AugJXwgwrR8QBcfUDZ7uW4krfoiupjvv7aATLIWVDIeP2aohvF4jCWdMJ5dF
 EpbsCjHd59HD+q9O06u06h4tk1kSbUQq55FlSsdw0xWT04QHzFPeIB60EnTD/XFR
 rvYpaL9jEX4+xZ62n/4b9eFxv9HT/NnfQ1v/Tm60x+xC+CnO6MDP7iV9eQ3tborb
 GjnJxfaOiOuu2vgP1NJvIUUGpcesipoJc53607e8vToe3ShkGEaEhL10mqoBK6Fb
 /sn1gC+nNlT3uiJVmG4OC3J5ssyb5g50jt7EQcDedMTq7iuHoHaA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id w151jX12ZttT for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:44:42 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftJQ3ZNMz1RtVw;
 Wed, 27 Oct 2021 21:44:38 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alexey Baturo <baturo.alexey@gmail.com>,
 Alexey Baturo <space.monkey.delivers@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 10/18] target/riscv: Add J extension state description
Date: Thu, 28 Oct 2021 14:43:34 +1000
Message-Id: <20211028044342.3070385-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211025173609.2724490-5-space.monkey.delivers@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/machine.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index f64b2a96c1..7b4c739564 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -84,6 +84,14 @@ static bool vector_needed(void *opaque)
     return riscv_has_ext(env, RVV);
 }
=20
+static bool pointermasking_needed(void *opaque)
+{
+    RISCVCPU *cpu =3D opaque;
+    CPURISCVState *env =3D &cpu->env;
+
+    return riscv_has_ext(env, RVJ);
+}
+
 static const VMStateDescription vmstate_vector =3D {
     .name =3D "cpu/vector",
     .version_id =3D 1,
@@ -100,6 +108,24 @@ static const VMStateDescription vmstate_vector =3D {
         }
 };
=20
+static const VMStateDescription vmstate_pointermasking =3D {
+    .name =3D "cpu/pointer_masking",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D pointermasking_needed,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINTTL(env.mmte, RISCVCPU),
+        VMSTATE_UINTTL(env.mpmmask, RISCVCPU),
+        VMSTATE_UINTTL(env.mpmbase, RISCVCPU),
+        VMSTATE_UINTTL(env.spmmask, RISCVCPU),
+        VMSTATE_UINTTL(env.spmbase, RISCVCPU),
+        VMSTATE_UINTTL(env.upmmask, RISCVCPU),
+        VMSTATE_UINTTL(env.upmbase, RISCVCPU),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_hyper =3D {
     .name =3D "cpu/hyper",
     .version_id =3D 1,
@@ -191,6 +217,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
         &vmstate_pmp,
         &vmstate_hyper,
         &vmstate_vector,
+        &vmstate_pointermasking,
         NULL
     }
 };
--=20
2.31.1


