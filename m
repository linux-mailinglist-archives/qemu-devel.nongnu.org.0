Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73C0674E3B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:41:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm09-0007ha-J6; Fri, 20 Jan 2023 02:39:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzt-0007fE-LJ
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:38 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzr-0004mQ-Ar
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200375; x=1705736375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d1thO4oePkp3zh110L9bI4kQhD6/p9FCdae8Xbqu4pk=;
 b=hiUfNaCU2wjy0Wt9khJw/e3dtL5ddfF0iKyzGuLQcO66A1K5ghYWSXUH
 38xMcLJXVnJPIYfwN6t5fAFsk0X8vqIIXlahmLpyZn3vmQ5fCuF6CUQ4P
 1L7RimK8kQLOH2NHgMPNkkdsBMBzi1+O4vcp9S9V5nm+Avmh9+gLeIOBo
 kDTiAaGVIMwBg5FrGy8ByLZjgSi6wQlTfjEwEH0/rzqBoL/W1p2p9KOjg
 3yZdVcPr7Pzp6wFuIaT85fYarTiMQKCbAtSMpB52vdBTWpd0HqiUNSvHu
 HNRgLWMq/jF1YBmKT74fbmGXHFRUxtZC/d8uKR4ujs/4cEJu1nne4MwEt Q==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176685"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:34 +0800
IronPort-SDR: foUSoITvDEW7EPAkxuR0MP6mwmp9urCl9/qu3uiUPx1i3CP3Tom0+jfrUlxm/lMfukypb015I7
 sdk2iehJ1mp6NLVOOOkCt8aC6IeCyDsZ+UY/dW/MinyFGeNrlfWyYcP/xlKRUhuXxOouBrpX93
 X4mZbwFtgUOWRmmgcJNkJ/hCux2/BMGTWsPxrmPdL7iUEUVBI34vY9XjKeJDm4/Kzwz5Vnnkqp
 Tdi9TsAE+Hp2BG9obMsiOB5x3wcX/eivcP8znhimVybYSH+asv8ezkL54YKkVD9RMS9Xh2/IyL
 Sfo=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:12 -0800
IronPort-SDR: /8J4LhKkI9WmJsMWkQgn6w320p+Io3eWymCj5YCgrjCAGgLmmw4fBGAx7QX8U9+3iUpkkEkI4Y
 wsYSetttdAUxkEYgPFXcDn+PoNEVkgrU+ag3zo257J5OT24pmanwNPu7QClKKqmnWhEZ1uIcLa
 mdFrEZogPofaUsyvd9ON/GFxrAztlcybUyxQ1Ri97nST+s7a8PTrxb7ixFOfiOu3KuAd2CjB7z
 Rxd6scH1956d2V5uvdbu1dRQfego8s9VptbZXhA2nmbYzbuqPu3KKYeX80kKA/bdUrrlTdcZq7
 VvY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:34 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrx16FY1z1RwqL
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:33 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200373; x=1676792374; bh=d1thO4oePkp3zh110L
 9bI4kQhD6/p9FCdae8Xbqu4pk=; b=syfu/HhO6Mbpq+8pS1uCs8P+bX9SKMoukL
 zprzIEG/y7g6fj5FzYs8fGdD8oFudkw136wT006wY1/ZjZ1wWdIpwB1UvioNyhJX
 YJWUvM/Yo5IKTf4yXp/hyiipCKSVtjA1s8jQMouSUb5VAVRvYuBZXkvFkgYrsqmy
 XgYe301h1RqKDb9m9A5e01GK5eVO4trchO1Txj3/xEf6hhUoFpOQ7NvsFr7/7X7c
 CsRXXMKunuWqbk5ZG9Vkq8CLIZ+7OgDFmge/ZR7oE3vv0UAr5PJLJuIZ0RYEacGy
 jhqolI3NbLf5rBX3Z3I5YL0+yq1+qBEOqC2VU6wkD6QnX63P+RHA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id SBFpqzq8pQdg for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:33 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrx00VhZz1RvLy;
 Thu, 19 Jan 2023 23:39:31 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 06/37] hw/char: riscv_htif: Remove forward declarations for
 non-existent variables
Date: Fri, 20 Jan 2023 17:38:42 +1000
Message-Id: <20230120073913.1028407-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

There are forward declarations for 'vmstate_htif' and 'htif_io_ops'
in riscv_htif.h however there are no definitions in the C codes.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221229091828.1945072-7-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/char/riscv_htif.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index 55cc352331..9e8ebbe017 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -40,9 +40,6 @@ typedef struct HTIFState {
     uint64_t pending_read;
 } HTIFState;
=20
-extern const VMStateDescription vmstate_htif;
-extern const MemoryRegionOps htif_io_ops;
-
 /* HTIF symbol callback */
 void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_=
value,
     uint64_t st_size);
--=20
2.39.0


