Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1482738E9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 04:51:30 +0200 (CEST)
Received: from localhost ([::1]:49548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKYOu-0004MX-Kn
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 22:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kKYNI-0003Vs-Gx
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 22:49:48 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kKYNG-0001j6-Db
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 22:49:48 -0400
Received: by mail-pf1-x443.google.com with SMTP id f18so11092960pfa.10
 for <qemu-devel@nongnu.org>; Mon, 21 Sep 2020 19:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vJ3cxLFhTpDWS08SToKUKDKkdzgNUw/wzl1LSID55iY=;
 b=JhA0HYZnIgYvGdQjHWqD5DWUbYGhMLzZ14aQGlonUc4k06aVGLLd0UFzN3jksouVfB
 i4nMYpHvM5DzUegeY9RNrlIjdREyPpsY5g+LrsYbrVWWeUhi+p+AVwLHFMYQYD+ivW02
 j9+dIDZoEKOR0l3D66gTmG06CFCqJ/I9BFgv08HX4kxVghxz/hjrCCorqDEjnfGeIb6r
 7RNO52dHNrVfEbnyc1PYHJm2rMZH3VHG7N5+i85jN4xk5/e7fo13DRRNgaPSGrIcQjIg
 rDFzCBlkN5QnzVvQNPtN1Ln5+0CDM+r881cxWtDzWOLZzy2ZoNIjJzue63wLpFE87ElT
 cTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vJ3cxLFhTpDWS08SToKUKDKkdzgNUw/wzl1LSID55iY=;
 b=JqnroFxjmCsbRPSaXOW5p2dQg/IgWiVfz9kaUmCABy8UgbGV1dpvuoXMVbTI4z7Epj
 Xr6e536yEzxPXDIL6n+O7Yjk3eOApT8gii4ok6GmOY3BhevNIqBapAivqjrbwkYVPF/R
 dXLKHE+CoEb/0pZy5cDy5HXZnt1FH+waIZWcngeJEYXcOfRtqD59vFL+sbZtxhSZF533
 tUd8PpM7hL1P8TKN8UC5Y9fIhQjuSHUnq3PnrRWjVpFYfRnJxKHWE1fqqKk/WcuCHrXI
 PGJJgmCtD+5lN/apXa4OmCySS/H834rsmTBe6GrLcfuPzOFKMElL0gBnUoXo/W2oA9pL
 Hhpw==
X-Gm-Message-State: AOAM5328EV4UWn7ZJg1t3tKRbE9eD7kfeGsxqESccPmo3SVN9hY7vk6s
 b/OeOkiMRwc/ZWh+KfdzMJk=
X-Google-Smtp-Source: ABdhPJxmhWO+Q7L5dxqOf08Zops6T8sWORJx8fd+IEymzSMdKK3+nS7ZogjqkDsTipfxWEaZvc0kiA==
X-Received: by 2002:a62:242:0:b029:14f:8e68:e7c6 with SMTP id
 63-20020a6202420000b029014f8e68e7c6mr2474619pfc.54.1600742984459; 
 Mon, 21 Sep 2020 19:49:44 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
 by smtp.gmail.com with ESMTPSA id q4sm13263677pfs.193.2020.09.21.19.49.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Sep 2020 19:49:43 -0700 (PDT)
From: Huacai Chen <zltjiangshi@gmail.com>
X-Google-Original-From: Huacai Chen <chenhc@lemote.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Subject: [PATCH V10 0/8] mips: Add Loongson-3 machine support
Date: Tue, 22 Sep 2020 10:49:19 +0800
Message-Id: <1600742967-12933-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=zltjiangshi@gmail.com; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@gmail.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Loongson-3 CPU family include Loongson-3A R1/R2/R3/R4 and Loongson-3B
R1/R2. Loongson-3A R1 is the oldest and its ISA is the smallest, while
Loongson-3A R4 is the newest and its ISA is almost the superset of all
others. To reduce complexity, in QEMU we just define two CPU types:

1, "Loongson-3A1000" CPU which is corresponding to Loongson-3A R1. It is
   suitable for TCG because Loongson-3A R1 has fewest ASE.
2, "Loongson-3A4000" CPU which is corresponding to Loongson-3A R4. It is
   suitable for KVM because Loongson-3A R4 has the VZ ASE.

Loongson-3 lacks English documents. I've tried to translated them with
translate.google.com, and the machine translated documents (together
with their original Chinese versions) are available here.

Loongson-3A R1 (Loongson-3A1000)
User Manual Part 1:
http://ftp.godson.ac.cn/lemote/3A1000_p1.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A1000_processor_user_manual_P1.pdf (Chinese Version)
User Manual Part 2:
http://ftp.godson.ac.cn/lemote/3A1000_p2.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A1000_processor_user_manual_P2.pdf (Chinese Version)

Loongson-3A R2 (Loongson-3A2000)
User Manual Part 1:
http://ftp.godson.ac.cn/lemote/3A2000_p1.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A2000_user1.pdf (Chinese Version)
User Manual Part 2:
http://ftp.godson.ac.cn/lemote/3A2000_p2.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A2000_user2.pdf (Chinese Version)

Loongson-3A R3 (Loongson-3A3000)
User Manual Part 1:
http://ftp.godson.ac.cn/lemote/3A3000_p1.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A3000_3B3000usermanual1.pdf (Chinese Version)
User Manual Part 2:
http://ftp.godson.ac.cn/lemote/3A3000_p2.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A3000_3B3000usermanual2.pdf (Chinese Version)

Loongson-3A R4 (Loongson-3A4000)
User Manual Part 1:
http://ftp.godson.ac.cn/lemote/3A4000_p1.pdf
http://ftp.godson.ac.cn/lemote/3A4000user.pdf (Chinese Version)
User Manual Part 2:
I'm sorry that it is unavailable now.

And human-translated documents (W.I.P) are available here now:
https://github.com/loongson-community/docs/tree/master/English-translation-of-Loongson-manual

Both KVM and TCG are available now!

We now already have a full functional Linux kernel (based on Linux-5.4.x
LTS, the kvm host side and guest side have both been upstream for Linux-
5.9, but Linux-5.9 has not been released yet) here:

https://github.com/chenhuacai/linux

Of course the upstream kernel is also usable (though it is "unstable"
now):

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

How to use QEMU/Loongson-3?
1, Download kernel source from the above URL;
2, Build a kernel with arch/mips/configs/loongson3_{def,hpc}config;
3, Boot a Loongson-3A4000 host with this kernel (for KVM mode);
4, Build QEMU-master with this patchset;
5, modprobe kvm (only necessary for KVM mode);
6, Use QEMU with TCG:
       qemu-system-mips64el -M loongson3-virt,accel=tcg -cpu Loongson-3A1000 -kernel <path_to_kernel> -append ...
   Use QEMU with KVM:
       qemu-system-mips64el -M loongson3-virt,accel=kvm -cpu Loongson-3A4000 -kernel <path_to_kernel> -append ...

   The "-cpu" parameter is optional here and QEMU will use the correct type for TCG/KVM automatically.

V1 -> V2:
1, Add a cover letter;
2, Improve CPU definitions;
3, Remove LS7A-related things (Use GPEX instead);
4, Add a description of how to run QEMU/Loongson-3.

V2 -> V3:
1, Fix all possible checkpatch.pl errors and warnings.

V3 -> V4:
1, Sync code with upstream;
2, Remove merged patches;
3, Fix build failure without CONFIG_KVM;
4, Add Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>.

V4 -> V5:
1, Improve coding style;
2, Remove merged patches;
3, Rename machine name from "loongson3" to "loongson3-virt";
4, Rework the "loongson3-virt" machine to drop any ISA things;
5, Rework "hw/mips: Implement the kvm_type() hook in MachineClass";
6, Add Jiaxun Yang as a reviewer of Loongson-3.

V5 -> V6:
1, Fix license preamble;
2, Improve commit messages;
3, Add hw/intc/loongson_liointc.c to MAINTAINERS;
4, Fix all possible checkpatch.pl errors and warnings.

V7 and V8 have only one patch (machine definition) with some minor improvements.

V8 -> V9:
1, Update KVM type definition from kernel;
2, Fix PageMask with variable page size for TCG;
3, Add TCG support (add Loongson-EXT instructions).

V9 -> V10:
1, Split fw_cfg to a separate patch;
2, Split boot parameters definition to a local header;
3, Update MIPS machine documentation;
4, Many other improvements suggested by Philippe Mathieu-Daudé.

Huacai Chen and Jiaxun Yang (8):
 linux-headers: Update MIPS KVM type defintition
 target/mips: Fix PageMask with variable page size
 target/mips: Add loongson-ext lswc2 group of instructions (Part 1)
 target/mips: Add loongson-ext lswc2 group of instructions (Part 2)
 target/mips: Add loongson-ext lsdc2 group of instructions
 hw/mips: Implement fw_cfg_arch_key_name()
 hw/mips: Add Loongson-3 machine support
 docs/system: Update MIPS machine documentation

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 default-configs/mips64el-softmmu.mak |   1 +
 docs/system/cpu-models-mips.rst.inc  |  10 +-
 docs/system/target-mips.rst          |  10 +
 hw/mips/Kconfig                      |  11 +
 hw/mips/fw_cfg.c                     |  35 ++
 hw/mips/fw_cfg.h                     |  19 +
 hw/mips/loongson3_virt.c             | 775 +++++++++++++++++++++++++++++++++++
 hw/mips/loongson_bootp.h             | 187 +++++++++
 hw/mips/meson.build                  |   3 +-
 linux-headers/linux/kvm.h            |   5 +-
 target/mips/cp0_helper.c             |  36 +-
 target/mips/cpu.h                    |   1 +
 target/mips/translate.c              | 443 ++++++++++++++++++++
 13 files changed, 1524 insertions(+), 12 deletions(-)
 create mode 100644 hw/mips/fw_cfg.c
 create mode 100644 hw/mips/fw_cfg.h
 create mode 100644 hw/mips/loongson3_virt.c
 create mode 100644 hw/mips/loongson_bootp.h
--
2.7.0

