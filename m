Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7CA8F696
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 23:44:21 +0200 (CEST)
Received: from localhost ([::1]:47388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyNXg-0008OV-FH
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 17:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60396)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=1236ab962=alistair.francis@wdc.com>)
 id 1hyNS7-0002z5-IM
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 17:38:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=1236ab962=alistair.francis@wdc.com>)
 id 1hyNS6-0006I6-Ab
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 17:38:35 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:54904)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=1236ab962=alistair.francis@wdc.com>)
 id 1hyNS5-0006Cd-UN; Thu, 15 Aug 2019 17:38:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1565905115; x=1597441115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mtN8VsVTJ5yGXOOOwZJu4dyH/vwKNXbGitRWezTpJus=;
 b=Fs4LNCNn3H4DmdJZ8d/S/18qm3EZyK4KAQFm7NM/apzW3Ag8pAz1R14W
 8bMJ5/tGQ87mTPNPbJV5+HNV+D8/VzYfkarFiHYRbgSGElVVZJxsuNyob
 7rPs+Yslu15QEg8heutpdz+Pru/IfiWTd25ZP/m+6aCddWlWvqE1j59Xm
 ihU1om60rYwT8W7BHwVT60BMKOIFGY+rorPZknm7koZlSHbAvu49NdquB
 VKjXYG9A4rq1WUahU/Q3p59gt1V5SfazvwPoVnOscxE90QegL1lDZtDJ+
 xvxynoZM4RTW7exvxc/ZwSpVrz3fqU1F08vEFEWHkMObEnfKKwG0GSrgG w==;
IronPort-SDR: 6SGXrum4XXWW1BZQM4+hL4hkOK7SpDdZ5qIajjKoPtdsFgZbjg08CzIuRxO848KxUdYKuZAZkt
 0/Cd+OAB/Xz5LmtWcNRabpbOCNqHLu8iTOqwueV6C0E/4tbAkbwDxI4iBRuBpuF09fLLqBImYf
 IQd9WiYfiPUeVQht3SELEEsFuZyqAIHWNWerX+4QNXjw9lHk1qbSLhExkSIsE6cZXglumfI/pV
 2XjnsDVYprIDWNKUuQCXfRpq7a5VlFaTsa9E0ZG4zjFikB0zxirIi6gRsBG5u0yzzgL1c+nVxM
 0pY=
X-IronPort-AV: E=Sophos;i="5.64,389,1559491200"; d="scan'208";a="116881542"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Aug 2019 05:38:33 +0800
IronPort-SDR: m0A5vs/dSkhZpwa1MJBenFoZaUmjcunxwJyvHwUoWaTI1jxnREBj+RWdbS95g+KLs4u3U35xF1
 ZGh/XlIbZsr8ehhJmcv8hNc04FOG5ebIakFHlNLGU7Of5IjqJLBX+/OE3r0WjLyRmwWoXP20Tg
 TD+Y3agbgFGLwtDJVqj4Kjh22OaZzdjzfOky88K4CVe1CE+bDJn3Z/fQ/srtUEvBDX2eK+H/B5
 c+41YMPccrDIGUiEz8uBNcjEZVomiHIZutDVcf+4Hco3uS2ph+U+78NDf9pCnmHZNf/O/AFUN9
 L/DsW85NF9fl8X7/Q6J6rGTH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 14:36:03 -0700
IronPort-SDR: 4HPxB2ojzz9R0wPEaoxKVEftqx7w39CUOQ78zDob1dWCJzsUuoBXmShxQ5bz1UzqoOP5mHBIQO
 bTnqN5TSyIVZncSRUZLnQ6TIirNfqOahvqJc0VdtbcHCpaVMe9f9fYR7mjzsZurWmvzp5Yojfg
 SOoao3SU9zQbydYU7WFxf8dRqeCHb5kMqikPyD96tTfL0v3WbDHDOm8wklccTzGgKRaeFZRlxj
 TsYBLrHNrjvss5qYFz4cG1LXqaQF8gGOAVBfiUW6dZrW9kQKhcZqa2d7wYouYhKv6sW5Y5VADh
 oC4=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 15 Aug 2019 14:38:33 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Date: Thu, 15 Aug 2019 14:35:04 -0700
Message-Id: <7e476df36a8c2ba53162e9a5f62e9fa171da00ad.1565904855.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1565904855.git.alistair.francis@wdc.com>
References: <cover.1565904855.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.153.144
Subject: [Qemu-devel] [PATCH v3 7/7] target/riscv: Convert mip to
 target_ulong
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
Cc: alistair23@gmail.com, palmer@sifive.com, alistair.francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The mip register is an MXLEN-bit long register. Convert it to a
target_ulong type instead of uint32_t.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2dc9b17678..0a7985c3f7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -130,7 +130,7 @@ struct CPURISCVState {
      * wuth the invariant that CPU_INTERRUPT_HARD is set iff mip is non-zero.
      * mip is 32-bits to allow atomic_read on 32-bit hosts.
      */
-    uint32_t mip;
+    target_ulong mip;
     uint32_t miclaim;
 
     target_ulong mie;
-- 
2.22.0


