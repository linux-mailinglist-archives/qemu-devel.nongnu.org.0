Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDED64724D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 15:56:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3IIE-0000XU-4h; Thu, 08 Dec 2022 09:54:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1p3IIB-0000WV-Ue
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:54:32 -0500
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1p3II9-0006J7-Eb
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:54:31 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 o5-20020a4aa805000000b004a020f841cbso249912oom.3
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 06:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g5jjcmtsXgcdYuoBpy0plLuV603JGXCxxVQ/y11M/JA=;
 b=iDWSp9LbgTkq6K4cWSXgpIwh5LqYlrLhMIKICCdbYBzmrP55/HdV9oRhmJVdc8HA4I
 CRR0DUGzvJv7BzVYjfXt/PLPR/S2FYn+ey4ocZUWTn3FwYXn8phWk4zEf6vyco8ZgpAS
 uMFxsllL50hmWeVf2kAOxBpGyzTH11f1E2gsxEN4HERz9wlrAJJa5yMWwSjgGkVrrK1F
 Wn4BywWg5Z44oNQ7bvqLBABlQYT867YXugjKD6lDMGbIhLM61/JisKsaE3kpgbhmNkMH
 6Vl3t/e2xEl9esgtBgRyY7NOa+OCP9R/ABv3ttBUeH2H162ldIMcshyfdCa9zt16Tkwd
 DIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g5jjcmtsXgcdYuoBpy0plLuV603JGXCxxVQ/y11M/JA=;
 b=hcm585lcisbuAtQvPOfnlMeF5JoAB1sdqRXq5btoGWkR26lmKFA8LMo5/NoT2kEmXd
 mNOGDxwW+QADqlGJveBxH95BbB/DOg17nuTWwHPJhThKfPFGxUrru7eWZm4kW5KfpMIi
 zJHCjo2aeOfZHof5wFojr1hrdyguh0QwoNLGEm9NBbDFbKs+vw5bQnmTVTqTJ9zmqh34
 D9PB0Sk5BIib9kwtnOUvxvspMYG5UFUFD5uqS8E23lRbThqqWMC6rOn/A08vGN4V49pm
 N6HsRamyt0S3BzvIW+F5mtSMm5mc7Psmb3GeairSlPcH+D69pYxfAtta14FhNJsRMFDX
 xXGA==
X-Gm-Message-State: ANoB5pneTXSb0OWuyDCISYBl2nohnk0ieczRh/SX1eAqGqwlC16vsTJH
 GW7rflPqa4ASNfpEAxMmEHwoGBLTQA6/6UE3ZA0=
X-Google-Smtp-Source: AA0mqf4AHa+emN/NClnNjjAYtnkkq2oxjTw7zO6qZ2WU1HbRZv6ex0Zl+idpoSCB/ScZLgUI/tjVIQ==
X-Received: by 2002:a4a:e0c9:0:b0:49e:eb9b:bd79 with SMTP id
 e9-20020a4ae0c9000000b0049eeb9bbd79mr1026619oot.9.1670511265715; 
 Thu, 08 Dec 2022 06:54:25 -0800 (PST)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 b14-20020a4ae20e000000b004968311a31asm10044225oot.39.2022.12.08.06.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 06:54:23 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 0/3] target/riscv: Apply KVM policy to ISA extensions
Date: Thu,  8 Dec 2022 20:24:08 +0530
Message-Id: <20221208145411.122799-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Currently the single and multi letter ISA extensions exposed to the
guest vcpu don't confirm to the KVM policies. This patchset updates the kvm headers
and applies policies set in KVM to the extensions exposed to the guest.

These patches can also be found on riscv_kvm_ext_v3 branch at:
https://github.com/mdchitale/qemu.git

Changes in v3:
- Address comments from Bin Meng

Changes in v2:
- Rebase to latest riscv-to-apply.next
- Update linux headers to version 6.1-rc8
- Add reviewed by tags

Mayuresh Chitale (3):
  update-linux-headers: Version 6.1-rc8
  target/riscv: Extend isa_ext_data for single letter extensions
  target/riscv: kvm: Support selecting VCPU extensions

 include/standard-headers/drm/drm_fourcc.h     |  34 ++++-
 include/standard-headers/linux/ethtool.h      |  63 +++++++-
 include/standard-headers/linux/fuse.h         |   6 +-
 .../linux/input-event-codes.h                 |   1 +
 include/standard-headers/linux/virtio_blk.h   |  19 +++
 linux-headers/asm-generic/hugetlb_encode.h    |  26 ++--
 linux-headers/asm-generic/mman-common.h       |   2 +
 linux-headers/asm-mips/mman.h                 |   2 +
 linux-headers/asm-riscv/kvm.h                 |   4 +
 linux-headers/linux/kvm.h                     |   1 +
 linux-headers/linux/psci.h                    |  14 ++
 linux-headers/linux/userfaultfd.h             |   4 +
 linux-headers/linux/vfio.h                    | 142 ++++++++++++++++++
 target/riscv/cpu.c                            |  52 ++++---
 target/riscv/kvm.c                            |  88 +++++++++--
 target/riscv/kvm_riscv.h                      |   2 +-
 16 files changed, 408 insertions(+), 52 deletions(-)

-- 
2.34.1


