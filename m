Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D1131E42F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:05:05 +0100 (CET)
Received: from localhost ([::1]:44466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYgi-0003Ay-O4
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:05:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYbs-0006L8-M1
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:04 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:40590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYbp-0008KW-1a
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613613601; x=1645149601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+7XcHpHqtDRB6mwY33HBJZywMabN7LjmembEnoLJVNE=;
 b=WfySrywxRq8F3sHmDr2rcbNIHqhIMuLxEvyBSHZkSA5vdsY1mvlL+muC
 jkcGkWfh0ygTy6ebRXG5/XX14JLwIObG3GkT4p9vuwrSJahjGLIzvEs9L
 8SAB0pKklzVf7enpNzcFWwiA0j2+TdwgGlBb2zmw6NKa6v0m//wtKSfBq
 HuiMcMZK64zkjuh5NObYv3O9/E7C0jCFCn1xitD72U92sQTozcurKIMI/
 ppN9LlbH/7hCFkqYtfTBW7xxr1A0A15lvEbOrdIxGyO5DFiS3HQPdXOfp
 CqKdidF5JZkjc+jmwjEJEetYf4qahMmur7tuDnpi6KCmyKpZl9Ru57/mD w==;
IronPort-SDR: 0oLgv+8jTZRM0dDLolk1XfUcnpKuk3s+QGt/WU4IqVHw8wcWwrn3tbtkDTMcYBgxJtrWJ1XSvF
 7STQAEX93a3kIhE9lxl9uC1RjuHsC1lIhGkOpy00szPRDt/8Z+8v/oWftOm+Xl3z2DjHcUQIHo
 Gb4eYDNmeM+SM9Jyyn4pM3OdY6tCp+8TK6TFh0HPQ3m5hYqMHWyepJfeoVuc8VJIGNi4xVlRnx
 wvr7v+5t01OCnt4zOZ1CnrAOtJ3R2CgjYokXOlTsUYzNLszXskr9KUNkJ3sTnGS1H/KTfpLVl7
 p7I=
X-IronPort-AV: E=Sophos;i="5.81,185,1610380800"; d="scan'208";a="161392121"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2021 09:59:58 +0800
IronPort-SDR: X1arh2kF6pqgbvMNZB3jq0vvIWP7Bam9ClrHsmlScfygleUGkTjUX0szilrFSBOrP6vG6tfRaC
 qAfVC/Eaw4naA8T72dmDD3nYPDzvfu/XwzVmvM9GJc3OMyxYNXGn+fGllojKUTa4R5L74U5Whz
 oTonnbZJTpz4tCeGHoenQAUfjimntfjpl0Jn5+HIcD6W62+iFnlPO0GXXEonhkP7yGJkaaxmLm
 eg3Qy3/b5ZjxEwO/+UzX4zIz3+bBPtEuGsLnRPXneVGhMwiXTSQB2bZqJ3oYW7cm2Q0P4VSYfz
 P0Rp+5UacX5vPbBYVa03iOfR
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 17:43:28 -0800
IronPort-SDR: fU96+siqwjovTmVcVXh+k8GJpdKdG75T6AeGJzqs/EpB0UCPOW08qKo2zMXBDJlfhW75w7lmJB
 z3unZ6mxAL14eAnlfB5pGt4tAvYDchdMCaG682fNhaokuzGe0JCgL/+L/3l5VKwtN7B59ha9e2
 RyG2y8Qt9GHuZjnke6XwbTnEZVOL0E/9xFs8+FRpllVmL8i1L6vdIzNuWqxyHWsWgJjfCwbMy1
 DswGrPAJNL044JsCbSv1Kfmrao6S+pV8kz6KM+4Ptp5dKT1kRzrIznWFhZfbwSlelgji9JvZhi
 4G8=
WDCIronportException: Internal
Received: from cn57xfd72.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Feb 2021 17:59:58 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 05/19] hw/block: m25p80: Add ISSI SPI flash support
Date: Wed, 17 Feb 2021 17:59:20 -0800
Message-Id: <20210218015934.1623959-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210218015934.1623959-1-alistair.francis@wdc.com>
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6763bdb70=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This adds the ISSI SPI flash support. The number of dummy cycles in
fast read, fast read dual output and fast read quad output commands
is currently using the default 8. Likewise, the same default value
is used for fast read dual/quad I/O command. Per the datasheet [1],
the number of dummy cycles is configurable, but this is not modeled
at present.

For flash whose size is larger than 16 MiB, the sequence of 3-byte
address along with EXTADD bit in the bank address register (BAR) is
not supported. We assume that guest software always uses op codes
with 4-byte address sequence. Fortunately, this is the case for both
U-Boot and Linux spi-nor drivers.

QPI (Quad Peripheral Interface) that supports 2-cycle instruction
has different default values for dummy cycles of fast read family
commands, and is unsupported at the time being.

[1] http://www.issi.com/WW/pdf/25LP-WP256.pdf

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210126060007.12904-2-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/block/m25p80.c | 44 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 0412d3e7f4..ad4456b74e 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -412,6 +412,7 @@ typedef enum {
     MAN_NUMONYX,
     MAN_WINBOND,
     MAN_SST,
+    MAN_ISSI,
     MAN_GENERIC,
 } Manufacturer;
 
@@ -487,6 +488,8 @@ static inline Manufacturer get_man(Flash *s)
         return MAN_MACRONIX;
     case 0xBF:
         return MAN_SST;
+    case 0x9D:
+        return MAN_ISSI;
     default:
         return MAN_GENERIC;
     }
@@ -706,6 +709,9 @@ static void complete_collecting_data(Flash *s)
         case MAN_SPANSION:
             s->quad_enable = !!(s->data[1] & 0x02);
             break;
+        case MAN_ISSI:
+            s->quad_enable = extract32(s->data[0], 6, 1);
+            break;
         case MAN_MACRONIX:
             s->quad_enable = extract32(s->data[0], 6, 1);
             if (s->len > 1) {
@@ -895,6 +901,19 @@ static void decode_fast_read_cmd(Flash *s)
                                     SPANSION_DUMMY_CLK_LEN
                                     );
         break;
+    case MAN_ISSI:
+        /*
+         * The Fast Read instruction code is followed by address bytes and
+         * dummy cycles, transmitted via the SI line.
+         *
+         * The number of dummy cycles is configurable but this is currently
+         * unmodeled, hence the default value 8 is used.
+         *
+         * QPI (Quad Peripheral Interface) mode has different default value
+         * of dummy cycles, but this is unsupported at the time being.
+         */
+        s->needed_bytes += 1;
+        break;
     default:
         break;
     }
@@ -934,6 +953,16 @@ static void decode_dio_read_cmd(Flash *s)
             break;
         }
         break;
+    case MAN_ISSI:
+        /*
+         * The Fast Read Dual I/O instruction code is followed by address bytes
+         * and dummy cycles, transmitted via the IO1 and IO0 line.
+         *
+         * The number of dummy cycles is configurable but this is currently
+         * unmodeled, hence the default value 4 is used.
+         */
+        s->needed_bytes += 1;
+        break;
     default:
         break;
     }
@@ -974,6 +1003,19 @@ static void decode_qio_read_cmd(Flash *s)
             break;
         }
         break;
+    case MAN_ISSI:
+        /*
+         * The Fast Read Quad I/O instruction code is followed by address bytes
+         * and dummy cycles, transmitted via the IO3, IO2, IO1 and IO0 line.
+         *
+         * The number of dummy cycles is configurable but this is currently
+         * unmodeled, hence the default value 6 is used.
+         *
+         * QPI (Quad Peripheral Interface) mode has different default value
+         * of dummy cycles, but this is unsupported at the time being.
+         */
+        s->needed_bytes += 3;
+        break;
     default:
         break;
     }
@@ -1132,7 +1174,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
 
     case RDSR:
         s->data[0] = (!!s->write_enable) << 1;
-        if (get_man(s) == MAN_MACRONIX) {
+        if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
             s->data[0] |= (!!s->quad_enable) << 6;
         }
         if (get_man(s) == MAN_SST) {
-- 
2.30.0


