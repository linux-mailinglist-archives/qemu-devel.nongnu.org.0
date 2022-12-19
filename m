Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B51D265064E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:21:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75jq-0001MH-2f; Sun, 18 Dec 2022 21:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jn-0001Hy-8F
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:43 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jl-0001CC-LG
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416321; x=1702952321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=390eeG4V0e1ilBaF3agJQhKFOgqHLzF2xG/939DvkZw=;
 b=odPMAN/5oBU4/sqpPVVCcjw0IWBfuemc78RKFGNk2u2IWrddRNBX5qGt
 9QEuEUloOR6Pbs1SGJ6kLkEcQO4ix0g1srqyHXfTWJKQvy4YNY3e+2wX7
 ur5QXi+yrZ7i+NDgI6s5tjR5jAP3LynGA8e2HyIT32t4H3m9WP4AZnesd
 ANS4yRpj5AxgXQzesQTaRm5rxpHLbPbSEH6N+l6Pub0rmDDZdlxq1shwm
 4FmbnG5dE9+1BI4CPttIzdxfLggdvptrlfnGHyp+7zL8398zGhFZN6+z0
 ak+J7DX4BiB/xZJ+13acEPNUPtHKjaQI1doXoxwM5SUcOAmCppaFJXTbD A==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056812"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:37 +0800
IronPort-SDR: C2To00yx7CS5/0V81QghxIQIHbSVFP1+hNlaVWYAUHGvqNKmV6ypE0/SRSWaYi9HclVZlzPNbh
 FzXtRYTcULI28XucjBoUtMrSr9VWqn612kaiQLT8uob94DcN+FEShLOT87PGkEzWrsWgRh+xSt
 06cT2RR1yUu5A1sj0DH2T53J+tnhNs26hG1zlkAJYuWxi+JJfG52w0Vv4NXO2/1+GjLxO4SaCW
 i0LjwPH59Zexil6MTOwz2NbRfGM/YiCLeDLz3v1HW40y6CqnnbVD9y1HW0cIG+/5UlSy5hfqlP
 LE4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:36:54 -0800
IronPort-SDR: 32ae0zao2o8lqoHMpkcmc0PC/sKM4Mb6tjhNyijHBcgHLW7YZR3MloTYooh698fDY2p+3EH7G+
 jbi3lRfAvSU6iIUp5gu5RgP0U45Ff+SB/+MjM3SkOT54C3WKgYi7P3wOVns6rNEgxkVbFM6pOo
 nO22lDOq/2hF+eoNRz4ZWMxj81qRNHX21EM4Qi+qCKLm1x5sal7m4EBND0g6L+f82nlr2UV5Fq
 kl76DECP+d6lHgUWNK9C4PVwibrr9wpYBFZFpzbsli01B41rhr06mXbD95ZKw5iKEOK4yJRu56
 P/g=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:38 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3KT4N1Zz1RwqL
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:37 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416317; x=1674008318; bh=390eeG4V0e1ilBaF3a
 gJQhKFOgqHLzF2xG/939DvkZw=; b=uKwkGFOAl2tH8TQw8r70JTqMcUAOS77Tzx
 6TcBreaCSsDxA5YkV9ooyZD+3WwGg7Bz20U2kCBAylq8RaDlRGsiC1xZlHhUgKrZ
 Zmz2p8tswNdR8eD97pVfMrwMplVXLM8SffR8aR+PZlxDq/kPxBXQrPvdswQu8Bu+
 DAiRrWDX8W2tloesqmxNZ3KA1VdeGDAU/L7E9E8Uyk+LirULdjycL6E8cMhGJjJS
 mDXjYICiQlqrCtwel4/qMTM3HRdS6U1EAqDpoyU7s7BdFD0BSCGgXaOvJzHUdamm
 6JvlJW304mWaa5CH8BYuIosq4WfoQszM8N8NP4w9Tntsr72NNgdA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3xX0VN_mxk8A for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:37 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3KR1073z1RvLy;
 Sun, 18 Dec 2022 18:18:34 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 35/45] hw/intc: sifive_plic: Drop PLICMode_H
Date: Mon, 19 Dec 2022 12:16:53 +1000
Message-Id: <20221219021703.20473-36-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Bin Meng <bmeng@tinylab.org>

H-mode has been removed since priv spec 1.10. Drop it.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-6-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/intc/sifive_plic.h | 1 -
 hw/intc/sifive_plic.c         | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/hw/intc/sifive_plic.h b/include/hw/intc/sifive_plic.=
h
index 134cf39a96..d3f45ec248 100644
--- a/include/hw/intc/sifive_plic.h
+++ b/include/hw/intc/sifive_plic.h
@@ -33,7 +33,6 @@ DECLARE_INSTANCE_CHECKER(SiFivePLICState, SIFIVE_PLIC,
 typedef enum PLICMode {
     PLICMode_U,
     PLICMode_S,
-    PLICMode_H,
     PLICMode_M
 } PLICMode;
=20
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 0c7696520d..936dcf74bc 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -42,7 +42,6 @@ static PLICMode char_to_mode(char c)
     switch (c) {
     case 'U': return PLICMode_U;
     case 'S': return PLICMode_S;
-    case 'H': return PLICMode_H;
     case 'M': return PLICMode_M;
     default:
         error_report("plic: invalid mode '%c'", c);
--=20
2.38.1


