Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CE243DA8D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:49:04 +0200 (CEST)
Received: from localhost ([::1]:53706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxLb-0004J0-3S
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHW-0000LA-8l
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:50 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:41754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHU-000571-5J
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396289; x=1666932289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uXZMUuGz8PVeGA7k0v699hnnvPnR8BIPKrSp1FBz7Ms=;
 b=RgbpHw00Jb7Umo7QgXpZsSZT2dYJVF65qZNLFeHwM0UxDhu108C7yQ5h
 75Esp1DmaEXAHHttPJrSfjEzBYlDvA2pW10YQirgTtcAjVtKhTdjnCldZ
 5eFNd9pKhgiu0SFrpdzdeKaVpZHAJcEsuSHZ6qLkXcIKibuq6uZot4lm3
 rVxzUdZuf2V3SSy1R0+q/YHlvhPU/gYnjZTgdjr6u3ZKRdO1TBK9UPf2n
 gATQb0HShn94AOsi2Br5vcVnRw/whDdsgHsqjrr+BhqABl/D2B7cd0bEE
 oWHolrIOtkkT563X7GXEsjYaBXy4eSmjbkVwl3n2nn/u09XM+gF1xUFc9 Q==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="184975515"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:44:48 +0800
IronPort-SDR: OZO5tfHhMf5vWsHW+ATHIo1Y6PoIK4msAKhJvvucWRc1c+ZMuTWIs01PT1rFKyTcJI5YQloP//
 t83Pir//9OYhRIIemhpdCw3l28G2nqubCA6HW1VFKAkKg4VGfUOwIoDQrHEbaoqDoK0dMFy7XF
 fYBnXbMm11osEbhjd+lNrsywBR+WfJKESpUuPlgXyfIjwS/eI/etsBfObdsMgra5I3Rk76vPHT
 c8/8H3qEom52KW5Z1RfMXMnDcPTw5MVctjGmfd0n6stpgrXEJLvOpUkenvLIA9K7+5b3DfzBzM
 ir/qqDihIWrX8FGhq9qbL3lN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:18:42 -0700
IronPort-SDR: 5L39mFlt9zkimg6gCbvHWe9y2Y3sfHAeNSu8xmeOU4sl6cK2hV5rvWtBmpLOoz7f2AtpfZUaXf
 WLTHQdXSTLuRvenWjH2ZGQf1lMHPH2TGo0RIQscYzckYhZJe5QTFHa7Zl0zSY2ssyGLXHs054b
 ctIWfyYrxlEulb7nXShyHTWghNalDqKmGHycrYwCtZT0WSZH357sflCfWWG495Pl6hKDYkZrTF
 RJIRPaMYny3sawjA6AUCXG22Jz3U+V+oEukNB8osaFuECRaHLHPsLRFeDinHjsqI+9oRTEACz/
 QN4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:44:47 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftJb1bnVz1RtVv
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:44:47 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635396286; x=1637988287; bh=uXZMUuGz8PVeGA7k0v
 699hnnvPnR8BIPKrSp1FBz7Ms=; b=MQIsXmqKvtIP7QAoKb7Ev9yXzCo3AXrERn
 Oqg81wiNHRkXppgOjic+oLfi3bKypZjqQnFZPIkrXHI26W4UR/5gwOXDKJXb1Avd
 SgkfMnrLX22x7LhEr7HG+1C0BQhyCEj6RsuRjNbDmWm3nD4O1g9MbacL/1pJVhjf
 TVdSJaezVUHxTmvPMkNPaXPISsBp4n87skKzyr7AQzuPgAb0/veahdkjphqMb3GI
 NuD4VEXL9tjKAy3Jdm/hPELBQZcmHFOwdgkdBBCuOvtIMSazzqZcR+dU1bpxkGdX
 RiZbwMc7N735irc7JPpfcXVPHwdC5vWHhp5NL1ftTvCborS4pOOA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3ARg8lRKKfbM for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:44:46 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftJW0vXdz1RtVl;
 Wed, 27 Oct 2021 21:44:42 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alexey Baturo <baturo.alexey@gmail.com>,
 Alexey Baturo <space.monkey.delivers@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 11/18] target/riscv: Print new PM CSRs in QEMU logs
Date: Thu, 28 Oct 2021 14:43:35 +1000
Message-Id: <20211028044342.3070385-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211025173609.2724490-6-space.monkey.delivers@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6b767a4a0b..16fac64806 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -271,6 +271,13 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE =
*f, int flags)
             CSR_MSCRATCH,
             CSR_SSCRATCH,
             CSR_SATP,
+            CSR_MMTE,
+            CSR_UPMBASE,
+            CSR_UPMMASK,
+            CSR_SPMBASE,
+            CSR_SPMMASK,
+            CSR_MPMBASE,
+            CSR_MPMMASK,
         };
=20
         for (int i =3D 0; i < ARRAY_SIZE(dump_csrs); ++i) {
--=20
2.31.1


