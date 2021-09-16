Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174A540DC8B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:14:37 +0200 (CEST)
Received: from localhost ([::1]:59130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQs9p-0004N3-QA
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs6A-0000ao-7Y; Thu, 16 Sep 2021 10:10:47 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:46855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs62-0005rH-8t; Thu, 16 Sep 2021 10:10:45 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MV5KC-1mIasz2PCg-00S3CB; Thu, 16
 Sep 2021 16:10:31 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] hw/i386/acpi-build: Fix a typo
Date: Thu, 16 Sep 2021 16:10:18 +0200
Message-Id: <20210916141026.1174822-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916141026.1174822-1-laurent@vivier.eu>
References: <20210916141026.1174822-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KNx/rCS/bZzp7BV07Drg8AKK9aroGsX2XEkkDn6TWGoYkGSPYp3
 y0KWXdta+otkAgdmRdU66W0FqbpZJ61rXbLSBICAswHg2sO53g1ZoN6h1YaJFiCDKx9Gz0H
 XPQY45bxvaumx+ambmEZvMf45ZqshuXQSvLgMKk/d3lZnkP6CSx7+LrGQbzuFR/QOOZakQi
 iDYzk4TmYP9x9P3zMUPcg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r2MjFjCFOa4=:kKduPJFLL0Fxclhgdef1fi
 +Joa8gkeZH3ah3uUJQblralX8qaJ1aQDHpvLIw9hk48n59KFDD7Qsc57/fuv+AJPZzv9YIhY0
 mW3hZtJn2BeFW03Xrpqa0dMpf5HejZXe67kc/YRLUgJgViz/MSBALxbrxjiE8QoUQ8LSXA5jf
 +wqNuRG3Jklv9KNmwzX5gKfi9OMGQhPeas/XYg8Q7q68DQOVr7ouFA3aLLNKshL2NnY7KnN6Z
 03mMrtWzKLlixk/DLGEg4JsPXWru4dAK+9xFKvpW4yP0P0M3nBE6w7Q7Y+MaQ9Ib/jPgdBb5O
 dXEPcwFOtWC6q7ldiOE7XcttLrg3nRhhRlGllny1BxN4w5dmBBApc9RKD+w1HTSIX83P0eCOz
 Vbb3MiyBCcIHv78ei4Blnf6s33HtSQqLca/HQfuZFu0epf7OUIjUuH8l2N91w4g7OGtogzEiL
 35pt/2lPHTfD5H6JdL1oDHMkrm+XDw63RyTibpKqfsc2Nsu7mxsEPszTKhJTrz5xRBmQs5LsF
 3Lcul0/I5QtYWBBT3B0o0gn85SkB/KaWue8IBs34kv2ZxP7uJw+GrRwOZ+RWQ+dmPmyASLac8
 c7Aw0HpEg/QYa4lxcNlZfuyesEYG/ieF4xPIPutfk0SFsmlRAay74c463SrU5g3kkAi/rgRvq
 fdkAmxWDV7Bwdj3aD9+AxkLjgWi1/LxKzAHW/u+Oa6iTpAMx3mroa/0oMy2CnOjC3HwXl42ZD
 PK2Y55YQa4zDe/Dn5CKzJiAt1LQrHHODKlT1yw==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fix 'hotplugabble' -> 'hotpluggable' typo.

Reviewed-by: Ani Sinha <ani@anisinha.ca>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210911082036.436139-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/i386/acpi-build.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d1f5fa3b5a51..dfaa47cdc20b 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1916,7 +1916,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     PCMachineState *pcms = PC_MACHINE(machine);
     int nb_numa_nodes = machine->numa_state->num_nodes;
     NodeInfo *numa_info = machine->numa_state->nodes;
-    ram_addr_t hotplugabble_address_space_size =
+    ram_addr_t hotpluggable_address_space_size =
         object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
                                 NULL);
 
@@ -2022,10 +2022,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
      * Memory devices may override proximity set by this entry,
      * providing _PXM method if necessary.
      */
-    if (hotplugabble_address_space_size) {
+    if (hotpluggable_address_space_size) {
         numamem = acpi_data_push(table_data, sizeof *numamem);
         build_srat_memory(numamem, machine->device_memory->base,
-                          hotplugabble_address_space_size, nb_numa_nodes - 1,
+                          hotpluggable_address_space_size, nb_numa_nodes - 1,
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
     }
 
-- 
2.31.1


