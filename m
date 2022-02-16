Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698664B82CA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:19:24 +0100 (CET)
Received: from localhost ([::1]:53534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFX1-0006gA-Gq
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:19:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpI-0005RU-DQ
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:08 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:61649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpG-0006K3-7X
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993006; x=1676529006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1fU6cqKCGbr6WNItb3Jk0dOYrbRZzurPXX5iPA9BtE4=;
 b=bbTJJXUaSTbMwA5VuapZ//q4d5ypkLc+qwWy8R0OFSGPgfHxMhPVubtK
 EqWhPDRntjF0iBaI64S87rdrrCy2fAHteZ7o3gjUaLxB4Mi8AlTX3mT3x
 P+pWWIwjv+QWbi2QAfLB0R/bgppl90R5sDY9GiuQuLd1rAlLrlT9y9Ysn
 yqd3xEIZ/mj5aNgYPRQOXkJwJTuzXLEkYJTCbjKJyjBGHYsSNlyNAjh+V
 E5gHApdJ1TkQ9NaSWtxACEAEFVBQ5ERUGi6Ne10bWwZuZEuGm92FImKsH
 +IcB1Fsj6ZS8b78wWF13pvA30NzRCgpg4lziCgoZwAxL++xQ/eypSZIJv Q==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="297181721"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:30:05 +0800
IronPort-SDR: xyydeil+7zNmRGt0s3dXpAVwdyL+8gxQKPCRadogNQWEHPgrIDHJKLaGBqqPQq7TRULb8Y5og2
 BiP34Sbhvwy8hBHdlaYySuatxV6OpeMKP0PXHnjZzU/b9fZN9x9eC3nLJzduKXv9GGAtoacVMm
 7pnmN99v2lAYDGWwMCy9DXUp61XbPZUXpMEQpTkqmctALsNfMrx5YzOJeSbGXZROvGtG8eYDWt
 HTTc/wk34l06+d7DGxKlkTGe7OjMSCOReWI4/oSUyZ+RLG7Ctpt19fjofVzTaT0xJ6mlDMvkLS
 FClf8wPoup+xHGddOVHt6zhD
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:02:53 -0800
IronPort-SDR: 2JFcIIQhj0saNiNPj9nGXRk6wO5pvzA6PjG1snp/u/8r2lxCI+REUATHLoOE/v60Ej7yMH+sGL
 mnfCyb+W1MOx5xt9VtBxVpOGCPJJ46jkkZ1eZcT3/tzfrbi3llNQl7g5C9zjlimnrt++gncZeG
 3pi0wTlik+/U6JLA2yh0R4pFzSQ7eMibpr1GB/ptSinujugPbeKHNd2kBOFTmveSdxdsV57nGR
 SI1nomcBKVdj53qdx4KBdQ9cB3sCE6QAbcdLgfwjTedUAdrntuaQGqeSXSAFiw1Zx8FWbVvx1D
 En8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:30:05 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7Ns1KW1z1Rwrw
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:30:05 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993004; x=1647585005; bh=1fU6cqKCGbr6WNItb3
 Jk0dOYrbRZzurPXX5iPA9BtE4=; b=UEEy533yoMdG/VzR0LlIRGdnqZBRi+al8R
 MBKOSxP2XpgzQrvPDltxGj9Rp1dkECr7nJw3Se0Hq7UgWSlOjJbtb7IsZgxM9rI2
 mFNEECWH58h7igFHoCrBNKclqMVXptAh7Lv+GG00lse6uPPBlt++J1j1s/lTSRfq
 lo7E5Icnu/9+bsJ60nDdUvWlkkz4OojCJi1D+ce3XezM98BqJWXT6MxgJPdKLFky
 0W/RtrxuHuqSefuOBEBNLu/bFN9BFV2Ho1dJnn/4oRDBMqX8h/PpOTnsETXjHZWQ
 Ccn9aLP1y0BxDs3GO52EnjThTbIpc/mW8JB79GQdX0K3axPOa6Hg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id rh45ubxyMtvc for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:30:04 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7Nn600bz1SVp1;
 Tue, 15 Feb 2022 22:30:01 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 10/35] target/riscv: add a MAINTAINERS entry for
 XVentanaCondOps
Date: Wed, 16 Feb 2022 16:28:47 +1000
Message-Id: <20220216062912.319738-11-alistair.francis@opensource.wdc.com>
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

The XVentanaCondOps extension is supported by VRULL on behalf of the
Ventana Micro.  Add myself as a point-of-contact.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220202005249.3566542-8-philipp.tomsich@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b3ae2ab08..81aa31b5e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -286,6 +286,13 @@ F: include/hw/riscv/
 F: linux-user/host/riscv32/
 F: linux-user/host/riscv64/
=20
+RISC-V XVentanaCondOps extension
+M: Philipp Tomsich <philipp.tomsich@vrull.eu>
+L: qemu-riscv@nongnu.org
+S: Supported
+F: target/riscv/XVentanaCondOps.decode
+F: target/riscv/insn_trans/trans_xventanacondops.c.inc
+
 RENESAS RX CPUs
 R: Yoshinori Sato <ysato@users.sourceforge.jp>
 S: Orphan
--=20
2.34.1


