Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4F168D074
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:18:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI9X-0000oN-5R; Tue, 07 Feb 2023 02:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8a-0000Rf-Ou
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:33 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI8Z-0000FW-2J
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753890; x=1707289890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nAEGQFI1FHQzfJo42rtu+JUbjk/iQKPLMYjeGOQU254=;
 b=AahOUEe8ioJHAoXcRaBQPqgPKCbqVo+clfX1rwKt4eArVoIza7HeRqPT
 vc587VIajfPcbtk8ivzU5gJ0t15w6Rixk83CqoFzvBV2mnZ/zwPXscSY3
 7Zr0O0on0fI3jU17wrQA/q8b7pRGFBBakdKJog/UPP77QCrzqjTCgrxI+
 UvEWedLFOhAyvG9IB5n7wUbfAJEyDl0Iae15fv4sKL99/g7w/FlIsQW/H
 g1wxiyV6mlDDdOVDgbvw3CTvlik9e88/AOqnjXmHomNvXxGjXyQ6Q4Su1
 NHp6NhXpT9rbGKSuiIpOtu/erodsUdmQN2RGDIMPdi9U30qccJcvqhTcy A==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657569"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:45 +0800
IronPort-SDR: 0aZ2XGvmRVy7leT2JTFyw3NDRC9JnvHRMi1Li+bN9O2g6+LGl66CBeP3aLbCKe85WNw0wI55G0
 z0LlMZnmJd2jUxoG6jr1R9LmvJWOxzAcHQAk7DHsvutSb8kg0yBi7d2jGP7GWDSQ/qWO+6RKcl
 bDEDoeeH3uJkTLSR46wl7WJY5/7zJrDq9fokVE3eCvyX46dyIF1YZeM8ZGtzoJNw5C0dArfcCR
 co8ygq74yq95fLYOH6fOk+QKSSJJ6Uknte0misNTE4E3t7kcu0aOWOGnfxqXL33J53RMfWSRfv
 rlM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:28:02 -0800
IronPort-SDR: f6zFsmhHUSCLcwukVUgrYn3fy5l0GRFjnJgcorsq0hDsDeScABD6baqrgSdrKTpZt9VSRszvFT
 c4aQABLKvqUHfWEB1LH4Hn1xTwbp5AS4rKPGrBPUyfietf0RKTzWw070rAJ5YoiNXq7fPxp/kV
 3IPJ+34yvCv71eoDLnkdCxs1MV1HmuA5Crq2et+QzFzge6FLUKIPzgWypcsuSfmubwJ/TRouL8
 W8nMs0hj4iBL4qUmuJaK0EjsZHSzeuVcqH9AzIhEiZj7IJN10ukFHesDXDfcHDaKUjXK4I9xY4
 TQg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:45 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vRT0kSxz1Rwrq
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:45 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753844; x=1678345845; bh=nAEGQFI
 1FHQzfJo42rtu+JUbjk/iQKPLMYjeGOQU254=; b=sG4CfVC6jvzHThFKkUb2CYf
 u46/Lo7+EuXorN1q8qAO7dXn1FISiWy/YB6TYYz9q6JthRGNtAqnH+Y5jTfPz3Y0
 h5jXD7uuENKHuPuAXnCWuFfOtZUkcxxuaDybfxrzwfdSOh6A33jAwWS1lRvLJDP+
 AQ/+uh9MvwCWIB3nX5xJsP89nZcdTx2OG8ASatqNJtliRT3HtW/bKFcpKnluYxvA
 BEqjcWdLbjt2RXL67RowEiEDbcK5UaB62daiwt9IlEURRPL6nCLMcDhQ0qsJc1ir
 xQsigoAUxckn6H+90hwMC5eHtvNE42RPRSKTEnri0s3u204CUqBgJCCafGIN5Pw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KAq0mZK0f3pz for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:44 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vRR1SQNz1RvTp;
 Mon,  6 Feb 2023 23:10:42 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 28/32] target/riscv: add a MAINTAINERS entry for XThead*
 extension support
Date: Tue,  7 Feb 2023 17:09:39 +1000
Message-Id: <20230207070943.2558857-29-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

The XThead* extensions are maintained by T-Head and VRULL.
Adding a point of contact from both companies.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
Message-Id: <20230131202013.2541053-15-christoph.muellner@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa10ecaeb9..96e25f62ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -295,6 +295,14 @@ F: include/hw/riscv/
 F: linux-user/host/riscv32/
 F: linux-user/host/riscv64/
=20
+RISC-V XThead* extensions
+M: Christoph Muellner <christoph.muellner@vrull.eu>
+M: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
+L: qemu-riscv@nongnu.org
+S: Supported
+F: target/riscv/insn_trans/trans_xthead.c.inc
+F: target/riscv/xthead*.decode
+
 RISC-V XVentanaCondOps extension
 M: Philipp Tomsich <philipp.tomsich@vrull.eu>
 L: qemu-riscv@nongnu.org
--=20
2.39.1


