Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FF357E818
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 22:11:51 +0200 (CEST)
Received: from localhost ([::1]:41726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEz02-0004rV-KV
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 16:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyp5-0003Aj-RW
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:00:31 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:34667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyoq-0005C0-3i
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:00:31 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-10d83692d5aso7598381fac.1
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 13:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K8/OoR02Me9stxYxSo+jPW6qKqDiYqMLh2/3dD8VItk=;
 b=TNVt6KX+oBvbkMrPDi79dWuinb6fS8gCcKS1oKjrIyLN9/bR8QLv1NEoRjILtKPmkc
 q4O8fHuwksRGOiLomxHnwaJ2FOIyF0hSin3pkrB7j/yZtG50mFX17My0N4YrrPzkDKCZ
 hZs6EjSrTgAv7ZNgF8Ju/sRy5DQQrBNapdMvZ0Eo+u2Fym2AWbP1kXbQGx292zG8FK8q
 8GXO1wiMeqyCJZcK2nYM6kHFVjCwFz3uQDviTEojDLxU/bds7J/13Zk48d0pt5pNDgFr
 XUOOUKXGAtRz19HWcT7heKncgntwmFwpuhQzzEca6ZZTonoaaC31Kqm2QVgGDCym2frE
 8gPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K8/OoR02Me9stxYxSo+jPW6qKqDiYqMLh2/3dD8VItk=;
 b=gkX3xWSFSvvbIumycCwzcQxYZSeOcZRLvZDOuQQ8P5bAFoOitvtZMU7cKOm2A41WG8
 Wd82AfhhglAqt/yWAx4ZyiNUqiRxjrxgvomu5iJhFSF2PpojzOUSnCRxJ2h3f01EXJxe
 3+v6PDfJkOEcVPXL7v7GnczDDdqc39zVyac87YjGR6M6dOdaz5fdQyYd/J3zQiAPlDqB
 RPkxxPTxqnJ34s7OwTToUckhgWtA/Pc+LKRm9QVUnmWnmCLTtVu3cD1d2OGq/4ZLOsVy
 S2xxTXva+gQ5slpcz71BnpriYlDavun65EdDnDaapPSwyDYBu71fJYB7YyzXrwo2fjNL
 K6jA==
X-Gm-Message-State: AJIora9camYHbDlKUGKGj8PVxhsLLanCLA5dXpdBM6ykSUB3cP1ODS2s
 2+ElNMDd/RYts9cqWxnvkwT/jr+6xx8=
X-Google-Smtp-Source: AGRyM1t1jjwREJFmAoy0muyxDC6uOjR/AKfkvZ1Z/yz0ZhgMH5Ih2a+AbXbCLDEjgrSfw4RWv5ueYw==
X-Received: by 2002:a05:6871:295:b0:10d:c587:d2c4 with SMTP id
 i21-20020a056871029500b0010dc587d2c4mr911939oae.122.1658520012635; 
 Fri, 22 Jul 2022 13:00:12 -0700 (PDT)
Received: from balboa.COMFAST ([152.254.206.198])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a9d740e000000b0061cae62aafcsm2388218otk.20.2022.07.22.13.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 13:00:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 00/10] add hmp 'save-fdt' and 'info fdt' commands
Date: Fri, 22 Jul 2022 16:59:57 -0300
Message-Id: <20220722200007.1602174-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

After dealing with a FDT element that isn't being shown in the userspace
and having to shutdown the guest, dump the FDT using 'machine -dumpdtb' and
then using 'dtc' to see what was inside the FDT, I thought it was a good
idea to add extra support for FDT handling in QEMU.

This series introduces 2 commands. 'fdt-save' behaves similar to what
'machine -dumpdtb' does, with the advantage of saving the FDT of a running
guest on demand. This command is implemented in patch 03.

The second command, 'info fdt <command>' is more sophisticated. This
command can print specific nodes and properties of the FDT. A few
examples:

- print the /cpus/cpu@0 from an ARM 'virt' machine:

(qemu) info fdt /cpus/cpu@0
/cpus/cpu@0 {
    phandle = <0x8001>
    reg = <0x0>
    compatible = 'arm,cortex-a57'
    device_type = 'cpu'
}
(qemu) 

- print the device_type property of the interrupt-controller node of a
pSeries machine:

(qemu) info fdt /interrupt-controller/device_type
/interrupt-controller/device_type = 'PowerPC-External-Interrupt-Presentation'
(qemu) 

Issuing a 'info fdt /' will dump all the FDT. 'info fdt' is implemented
in patches 4-10.

Both 'fdt-save' and 'info fdt' works across machines and archs based on
two premises: the FDT must be created using libfdt (which is the case of
all FDTs created with device_tree.c helpers and the _FDT macro) and the
FDT must be reachable via MachineState->fdt.

To meet the prerequisites for ARM machines, patch 1 makes a change in
arm_load_dtb(). Patches 2 and 3 makes a similar change for two PowerPC
machines that weren't using machine->fdt.

Tests were done using the ARM machvirt machine and ppc64 pSeries
machine, but any machine that meets the forementioned conditions will be
supported by these 2 new commands. 


Daniel Henrique Barboza (10):
  hw/arm/boot.c: do not free machine->fdt in arm_load_dtb()
  hw/ppc/pegasos2.c: set machine->fdt in machine_reset()
  hw/ppc: set machine->fdt in spapr machine
  hmp, device_tree.c: introduce fdt-save
  hmp, device_tree.c: introduce 'info fdt' command
  device_tree.c: support printing of strings props
  device_tree.c: support remaining FDT prop types
  device_node.c: enable 'info fdt' to print subnodes
  device_tree.c: add fdt_print_property() helper
  hmp, device_tree.c: add 'info fdt <property>' support

 hmp-commands-info.hx         |  13 +++
 hmp-commands.hx              |  13 +++
 hw/arm/boot.c                |   3 +-
 hw/ppc/pegasos2.c            |   3 +
 hw/ppc/spapr.c               |   3 +
 hw/ppc/spapr_hcall.c         |   3 +
 include/sysemu/device_tree.h |   3 +
 monitor/misc.c               |  25 ++++
 softmmu/device_tree.c        | 219 +++++++++++++++++++++++++++++++++++
 9 files changed, 284 insertions(+), 1 deletion(-)

-- 
2.36.1


