Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16DD43A9E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 17:22:41 +0200 (CEST)
Received: from localhost ([::1]:40844 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbRYm-00054x-VY
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 11:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42982)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hbQqA-0001nO-H9
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hbQq6-0001uI-Ds
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:36:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37874)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hbQq4-0001hd-Fr
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:36:28 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DA41430860D5;
 Thu, 13 Jun 2019 14:36:09 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B227C1001B0F;
 Thu, 13 Jun 2019 14:36:06 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 16:34:35 +0200
Message-Id: <20190613143446.23937-10-philmd@redhat.com>
In-Reply-To: <20190613143446.23937-1-philmd@redhat.com>
References: <20190613143446.23937-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 13 Jun 2019 14:36:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 09/20] hw/i386/pc: Rename bochs_bios_init as
 more generic fw_cfg_arch_create
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
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Rob Bradford <robert.bradford@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Ortiz <sameo@linux.intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bochs_bios_init() function is not restricted to the Bochs
BIOS and is useful to other BIOS.
Since it is not specific to the PC machine, and can be reused
by other machines of the X86 architecture, rename it as
fw_cfg_arch_create().

Suggested-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Rename x86_create_fw_cfg() -> fw_cfg_arch_create() (MST)
---
 hw/i386/pc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index acde575ced..75fb1a154a 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -932,7 +932,7 @@ static void pc_build_smbios(PCMachineState *pcms)
     }
 }
=20
-static FWCfgState *bochs_bios_init(PCMachineState *pcms)
+static FWCfgState *fw_cfg_arch_create(PCMachineState *pcms)
 {
     FWCfgState *fw_cfg;
     uint64_t *numa_fw_cfg;
@@ -1512,7 +1512,7 @@ void pc_cpus_init(PCMachineState *pcms)
      * Limit for the APIC ID value, so that all
      * CPU APIC IDs are < pcms->apic_id_limit.
      *
-     * This is used for FW_CFG_MAX_CPUS. See comments on bochs_bios_init=
().
+     * This is used for FW_CFG_MAX_CPUS. See comments on fw_cfg_arch_cre=
ate().
      */
     pcms->apic_id_limit =3D x86_cpu_apic_id_from_index(max_cpus - 1) + 1=
;
     possible_cpus =3D mc->possible_cpu_arch_ids(ms);
@@ -1766,7 +1766,7 @@ void pc_memory_init(PCMachineState *pcms,
                                         option_rom_mr,
                                         1);
=20
-    fw_cfg =3D bochs_bios_init(pcms);
+    fw_cfg =3D fw_cfg_arch_create(pcms);
=20
     rom_set_fw(fw_cfg);
=20
--=20
2.20.1


