Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBDC2DDE68
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:08:25 +0100 (CET)
Received: from localhost ([::1]:60544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8wB-0003bX-NT
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pW-0004zx-Ct
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:31 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pT-0002GA-13
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271596; x=1639807596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tMmSr1nqZV0rmgvOuZZl7S5xE7RpzDpThy+2oxxPGH4=;
 b=azAo6UwaSNr+zxMQC2poiIOG5KC9yYSj0+us0cWFLSir1frN4SbzgyAF
 nyR6pkLLN+bpyPAbj3Z03M1RgTwr54hP03s+w7aHHxBvxtjsR7t+da4r5
 6a733s/UX6o+VuVWotAXgzo7vsKTlXwWhu2gXAAzzbWVtcgRlj2oc6pQo
 t8nvWzGAok71mpR1QxCmcUTzBqu9ZtBWzFtftwOv2nd400LH2bXBO8e7X
 ILHhvxr1Oyjy9KvUe/WRejvW/HwkK+Jbo0f8/fn3R5vPJkRuTgWSK1DrY
 ubJxMAaJdjyVVvDQaGeOYpQKLgfCWZ6/cyrD60kYWUUd2ycqMm78Ozd2Z w==;
IronPort-SDR: 4nw16QzP+heYcbU1MQS53HnXMVUT1TWDmSoPOxmPrPuhGnWva9ZnnLsNN1i4BfQCifs8cZV0Mj
 qH+3//4eage78JJDEiQHaphll1mEc3fW1xs9YfCYwTfOTqBzfMd+4+25tovEjo1VpPeyNkly2h
 r/NMDxcQwjYHq9wZ5nyX/H740wsp2segnX7Ogtdsah8Ynyqv7iL73Q++8ddkMCeVWznBz0DHO3
 QbsHS4QNe42FkhWSSaPLsSrM0Bcm7t1piHDbiRvoSrKXk8qFbNOZ13Zx3oQxlpKN20gkjBYjKJ
 PH4=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237041"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:25 +0800
IronPort-SDR: qD4MqfYIDzZ0TCBz6ucuQLkVxAdd8SreX1JVneEozxzOYJXmaTxejf3nZ0RLvGM/w8Rmq/zHkN
 rkj2ZJI4f0ghjykpmFq+Vu+MulLgGDVIubUfuXcKOPthrth1POMsMARiVs+OpsFAjNhZmuhj/n
 AahBrMZ6hLK4/oKqte50Jo8w9vPNLzwITVqhp8O/qzo000nIi8PP6b5Y1tLObjg8MEzAZj6MM5
 YAlC5G30kCqQfjUc0H3Mv8mmEhIlZCx7/BsCu21ljSFmZiWG1bmDigIZ3cf9y3AT1YkVmgLfaa
 QczBh+B/55aZT6RZL7IcB2eD
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:35 -0800
IronPort-SDR: 5vdBUtY6UUN8nB4sDYkkG8mnWDc6+f7Hw6TtzlZfU9MkLRD70Wp0/g95PihwvLL+emOahnq/pq
 EpgKOM03kS4pExwHJ526Hxui6ECM963g1FPmlfRTquwiMdQPCBxG9Z5n5JcjhfH8U/nLJ7ROkP
 pme9garyHomTKdsnTkrMrKQbsXskvD3N59YXokkQoMO0HFbaZGKD3VFQ9ltQkr3Aacpsr5uFMN
 I5nosOhdrkHmoh84TLjVdNb2+YnMdukYv6s5A2zjeJhzmttnDvtFpbxoHFHWXQxkG8BZ5QJFzp
 wRU=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:19 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 05/23] target/riscv: Fix definition of MSTATUS_TW and
 MSTATUS_TSR
Date: Thu, 17 Dec 2020 22:00:56 -0800
Message-Id: <20201218060114.3591217-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>

The TW and TSR fields should be bits 21 and 22 and not 30/29.
This was found while comparing QEMU behaviour against the sail formal
model (https://github.com/rems-project/sail-riscv/).

Signed-off-by: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20201130170117.71281-1-Alexander.Richardson@cl.cam.ac.uk
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 24b24c69c5..92147332c6 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -379,8 +379,8 @@
 #define MSTATUS_MXR         0x00080000
 #define MSTATUS_VM          0x1F000000 /* until: priv-1.9.1 */
 #define MSTATUS_TVM         0x00100000 /* since: priv-1.10 */
-#define MSTATUS_TW          0x20000000 /* since: priv-1.10 */
-#define MSTATUS_TSR         0x40000000 /* since: priv-1.10 */
+#define MSTATUS_TW          0x00200000 /* since: priv-1.10 */
+#define MSTATUS_TSR         0x00400000 /* since: priv-1.10 */
 #define MSTATUS_GVA         0x4000000000ULL
 #define MSTATUS_MPV         0x8000000000ULL
 
-- 
2.29.2


