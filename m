Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70FA674E40
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:41:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm09-0007hQ-76; Fri, 20 Jan 2023 02:39:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzp-0007ba-FP
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:35 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzm-0004mn-JK
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200370; x=1705736370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1tjsEiMWRJO9aUthDa7dGdc5q/vCCXImXu/Bv6Avj2k=;
 b=QGvtJoIRY89vB/DCC1EvBc3joa1ti2rez+vMB6jfsbJtOTokHPjNc7nd
 0F+8Sw1E0AW/5MUnzhuuwSHyQKp0Bx+MO84zvQOqnjLhfmkbU034JicVR
 r67jdivYy2ye2wjjmJeJiv5BVnHEB6nRfe3vXycMOCrykQAcE+8RwvFj/
 7yh2FrR2P+Z+X8ZZCAyeZTWi5oem/rQ4M17d0oRLgaINWEHdN4F3cVx/+
 2J8+z/D6alvHBpHAi2uF6saRVkh8CNw074SRaOMlA5qUbaCaOT8BqllNt
 8uMqIw4B4KGU5W2CU/kF2mPEqUv3KWPZ0Vw7a4iNp5jc3qyj3fy3ChwA+ A==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176674"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:26 +0800
IronPort-SDR: 6WZn2PHtkFStEg33Re7BgXTAI5mCzyPL3ug0XHu6uJrqsthYAxs0TJvdW1172vEsoell6u59rM
 XAwpW1+ve9P2tbkKbyJc9c8WBBZLnuZntehGlqBa2DnbHVtFqcn5A19w5oYTkG4FRD10ArEWNU
 Cr07GV12BYNWWmcov+DZvYvn9wuMvpQ9ZmdkkCh3LoP0q/+FjUjfrJkLpClxHwfuXZDggLWR26
 oin1tVNz2w4LRfvrp+yVCTfAgMar9HC3/rlcMj2r7XAhK3VRUFgJGhkqX2sseV33qAJMFlmO/L
 v3E=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:05 -0800
IronPort-SDR: k3XoRwXJMhBAyBkjy6xVvoRzTX19m6+m5+pkt492Xw5sZqoc4jOrD+AdFlIlh9K4LiQsI6s4+k
 uDwDxFLziu4aiegXBouEKvlloeR040vCSrY+mMD0y1aoi9WasAIRFM5QtIDUfqBP1Re4FKG3Uz
 T2+afL0NAsc/IXP7kEqmO7nzsShW8vnUmScGEjldOXj02yC21vvtv1XxfUO6Ay9zOvfhz27l4c
 2qpg8Tww5MHOarHcyxIpt2brVn6CdqpwFpQLxZ9g3W7V/fpBrYg1I6vo4k5G3NcWmUMI+4gK/U
 TbQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:27 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrwt41qSz1RwtC
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200366; x=1676792367; bh=1tjsEiMWRJO9aUthDa
 7dGdc5q/vCCXImXu/Bv6Avj2k=; b=YLgu4TxThzSkexGJ0Gz5Z4PA8hiAvAwaZx
 6VB5jAtzHkICaG8XwOq+jQH2GhJUtCQzwdJrBzC3ZHBToGHWiRgIpqdnWybftCoC
 mLr4ubtyJ15QU+C0Sq+YjSKreipHH0A5VOmV8nBauVbx6t/f8RcIzIZJYdkZUn9x
 8aWcpFRS4BCcQpiAs9aQVmSolHmG0N9rWn4S91B8rednEEdmuwXrJ7bGXPz5LLe6
 DfIyavNJWEDipzZp4/HEDify5PjQ6kVB5h5OgDo7vdi5mFKqPXJQ445F8+zFKv4k
 g6MHBO1WqNyTKgNCVlFmLNDHm5BYCAXai+1/ES7Jz0xCqnfk/0aw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qlk1G3_rxFUu for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:26 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrwr57S5z1RvLy;
 Thu, 19 Jan 2023 23:39:24 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 02/37] hw/char: riscv_htif: Drop {to,
 from}host_size in HTIFState
Date: Fri, 20 Jan 2023 17:38:38 +1000
Message-Id: <20230120073913.1028407-3-alistair.francis@opensource.wdc.com>
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

These are not used anywhere. Drop them.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221229091828.1945072-3-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/char/riscv_htif.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index f888ac1b30..3eccc1914f 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -33,8 +33,6 @@ typedef struct HTIFState {
=20
     hwaddr tohost_offset;
     hwaddr fromhost_offset;
-    uint64_t tohost_size;
-    uint64_t fromhost_size;
     MemoryRegion mmio;
     MemoryRegion *address_space;
     MemoryRegion *main_mem;
--=20
2.39.0


