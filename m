Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6C511D7A1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 21:04:25 +0100 (CET)
Received: from localhost ([::1]:36820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifUhD-0007aQ-Ps
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 15:04:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ifUel-0005x9-Na
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 15:01:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ifUej-0004Bk-OE
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 15:01:51 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:57803)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1ifUeh-00045c-Rv
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 15:01:49 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mc0Aj-1i9Am62F1b-00dYKu; Thu, 12 Dec 2019 21:01:45 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] q800: add machine id register
Date: Thu, 12 Dec 2019 21:01:42 +0100
Message-Id: <20191212200142.15688-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191212200142.15688-1-laurent@vivier.eu>
References: <20191212200142.15688-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LHAt3RXFVpaySF64Kl9iPBd2yyjs6PJChFZ47pyeTU4QVdbLu3D
 c9UDqwQitq5X7o1nAMxnk+3ffYqE589wysy9/igmY/IRPvYhvvZqS0YO3Gxi0WUHke3o77s
 SDRlAEFcuJcob7Szrws2jHopfk5RCiXVnBu38xerDb6XAv6QyMZZNFbpe2i4cpqhA/dIQjc
 ZB8TVpdhaPa3PXOux4unw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HEBpSguBOKU=:Evf6mzJ4WaMmoL/KM3Cflj
 MQVfeMwMAjL/8K+cbsO8zgwMStHi+GWmmjckALJV5vIoyWSiYxXpAqvWDzlwMgQyxG2C0TT1t
 9yLABIX6xZF6O8GWQ49fDeBoboqSBvCjNbY+noP2N6KBV8u5sELEZ2sJzXKfHYvfMpqf06yPf
 hLiaA1NOlhrGMGGRVtYGdYUJ1fElN++g6XWgKm9gISliC2CcS0deOpwP2Q6dfiBTWjaZ20OqH
 +V/VPy36wGm7b4LjMqAyz8j3tWzdoWbDB9BxjvaHYq2K7FkSs3xClXK5m984zjeMrkgEWl5ok
 F62EuD2ODSBKl5dqACV0tst8pe6B9+22f0hHP/gWxkXD1rbAofYFf945c9Z6kUssEktXIHNcY
 qz2TEqNGLSaaKgtQaEtHfLfDudB4FgB+ETPrMTrnn5OCaov0At1R0orlaNFSp67jzkl1CWdmW
 Z0t+4TWlzg7KuRlhXWN+9pjWIF2HoAA8u4b+PcdBkeuAwy5CMhCbtXJfa8v7PjhyRz9+4tOTo
 uqswnDDGgAWmSCzfojixa1C+jcN+nCwrBUfYXobw1UFNhNBWwVhOFVaeAlMHFrV+TGa7htPVR
 FVwsxkUwRorCRczK9X2DMTDI6a8yfz83S3InkB4b05+ggG8x09Z8xO9h8kzE9TMTBT5mZZzE/
 9Q368rA9kckGzOcQgUVKO+8NsFjOSXCqnn7RRH7Ytb40TjbCtWYQK3fXjonV/b9xZSCMa8kxU
 GJ2esys++W/ZMIGCtFnzn/r9T210IdgI+WSp0ZwMNGLwRUAHALr6qRTbkON4hrDY+R0oIZdNP
 7+CtQBi016kXd5pTSMQUO/n7v+VTjE8XrqhyRsCO+4f+bIs8m6hZzeokaCcNooWg0FEW/aBWl
 gu02HZX7wtbRwQch2/5w==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.17.10
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MacOS reads this address to identify the hardware.

This is a basic implementation returning the ID of Quadra 800.

Details:

  http://mess.redump.net/mess/driver_info/mac_technical_notes

"There are 3 ID schemes [...]
 The third and most scalable is a machine ID register at 0x5ffffffc.
 The top word must be 0xa55a to be valid. Then bits 15-11 are 0 for
 consumer Macs, 1 for portables, 2 for high-end 68k, and 3 for high-end
 PowerPC. Bit 10 is 1 if additional ID bits appear elsewhere (e.g. in VIA1).
 The rest of the bits are a per-model identifier.

 Model                          Lower 16 bits of ID
...
 Quadra/Centris 610/650/800     0x2BAD"

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 9ee0cb1141..c2b2aa779f 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -97,6 +97,23 @@ static void main_cpu_reset(void *opaque)
     cpu->env.pc = ldl_phys(cs->as, 4);
 }
 
+static uint64_t machine_id_read(void *opaque, hwaddr addr, unsigned size)
+{
+    return 0xa55a2bad; /* Quadra 800 ID */
+}
+
+static void machine_id_write(void *opaque, hwaddr addr, uint64_t val,
+                             unsigned size)
+{
+}
+
+static const MemoryRegionOps machine_id_ops = {
+    .read = machine_id_read,
+    .write = machine_id_write,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
 static void q800_init(MachineState *machine)
 {
     M68kCPU *cpu = NULL;
@@ -110,6 +127,7 @@ static void q800_init(MachineState *machine)
     MemoryRegion *rom;
     MemoryRegion *ram;
     MemoryRegion *io;
+    MemoryRegion *machine_id;
     const int io_slice_nb = (IO_SIZE / IO_SLICE) - 1;
     int i;
     ram_addr_t ram_size = machine->ram_size;
@@ -159,6 +177,10 @@ static void q800_init(MachineState *machine)
         g_free(name);
     }
 
+    machine_id = g_malloc(sizeof(*machine_id));
+    memory_region_init_io(machine_id, NULL, &machine_id_ops, NULL, "Machine ID", 4);
+    memory_region_add_subregion(get_system_memory(), 0x5ffffffc, machine_id);
+
     /* djMEMC memory and interrupt controller */
 
     djmemc_dev = qdev_create(NULL, TYPE_DJMEMC);
-- 
2.23.0


