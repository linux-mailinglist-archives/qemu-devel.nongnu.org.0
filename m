Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC43032D5C5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:00:27 +0100 (CET)
Received: from localhost ([::1]:55818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpSk-0004LZ-Rn
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:00:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpH4-0001kY-5t
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:23 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:44463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpGt-0007up-HA
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614869291; x=1646405291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vcl4rsSJoDxQvjH4XMjoEMp6WtgPCYJiICvSVp5q3EE=;
 b=e7igYcOjP2cp6mTI0S6TNzTMMXVN/kGTJ0d8updX7Gk6NiOM3Ih6M6kr
 0UhbZeDNYe6CdJattc5cZc9owpzj6CxhO74IeytODKl//mYC/3dcxc+nX
 yfD3M5zfVVbIhX6OWQ4LZX/D2PeByXIulQyyKm01bTOqFM0Y6c4uNrzxP
 gius8VJOuL7k0B5giCz/iPSuox7BdswZN4vu9dE0LTm7BQzzRXWCyDRDz
 QPhEVrB6DYXq8yJpGZUHXySCKTklQFu5S1xt9sOanP3famxHRONxJYWbq
 3y/ksPJM2XaeBEg2xAcl4G/Vpz8oRtnvbgTGE9g47W4xpznos6nHUYDeM A==;
IronPort-SDR: +2GN0t3H4ve6lkt3tHsmMmTIaZTb37UFF//j2R2Kz8LQJgfUXqic1se5ak1LJ76XyyqRoTC8D5
 9vIZOv042KZ0TXK1CGEIiagMDPCNdXRQH1ISlMPkyIT2UpuL8nK/cKcZ8EEJTkabEe/K2kdEuX
 C7IJ9T7hEhHe1jXX/dAJNR5Wq2cu2hF6WUQC8JaGfJJM4R9sa1x5O0ls5eJUxGhxvpW9TzNnFJ
 tbz9PeMW2M9cju42KcLL1GAAvqAdw1RVYYnFs8ob3UmduG0waQgncB7oqicy03cFKxroHiVj8D
 82M=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="271984406"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 22:48:07 +0800
IronPort-SDR: yvBnG1KIyLx6noHZXoQ5Dr7Xw1feGppZxeLSzurNsDrEJwRd3tChrvH0LapF7wtk5iU1vD04xJ
 F6V7/jGufOuRpMBnIAYIfxzNfzapW2183R+stk0fy3YQw3zhRDd1nXGWfAa19VNkOfz4Muwpqc
 c+CjEz8bIaYvJ5WFizDN4scuQTqJbWN1m6JozCL/hs8sh0cGXBNlVG0RTb4n5+u0ZCBk7Moftc
 Kd/qMVdbH6zghKTzN8Cp+CVXd5KzSJx5CFRn8cBWCGew3jctqO+p+rw/rbkfbqvtQPQR0/qyUV
 SrWougQqJFb/1p4t3+RaZ23q
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:29:20 -0800
IronPort-SDR: Xq+nKCPu+ohKJ4o7V8VIQ7a9/t/3uVHGskn+SqFNsJu4+pg9q3lBkEuKopgTprklB5rPjGLLDD
 hox0gG2W1ntPgPUwz1yxfoIuD386fMqVF86d9ePL8TswVDj5RtcTuUac5BPvX83Gby+IDpSePz
 tE5m+F3Q8ckIegY5NB4z31hu3BGobNcsC0vhV+TWbjymSYlPoeVnQIhWiMS0hX/AcBR/yYuEyz
 poYgpoIvhUWMOYPIpn/ZkTI4UGzKALNb59uDrtkQRL6lL7frVPoFeiY8snKlF5qU8e1Hu90pub
 3RQ=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:48:07 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 05/19] hw/block: m25p80: Add ISSI SPI flash support
Date: Thu,  4 Mar 2021 09:46:37 -0500
Message-Id: <20210304144651.310037-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304144651.310037-1-alistair.francis@wdc.com>
References: <20210304144651.310037-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=690dc056c=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
2.30.1


