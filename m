Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B0C6426D7
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 11:39:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p28fk-0001UF-E7; Mon, 05 Dec 2022 05:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1p28fY-0001KT-Tz
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 05:25:54 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1p28fX-0006cr-3M
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 05:25:52 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 b13-20020a17090a5a0d00b0021906102d05so10988022pjd.5
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 02:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JOiFQ+VDr28lfLOOmW8pLV87sBU1U/rvv/jp9D7wkWA=;
 b=K8LjfkBLh2TksaRHdweAU3RYfRNLRgXnpixTjLHdSL2nHACKYM+Z3wepImTPVYfWbO
 +7aZuvcG22FqWUu7OPwU6JSJuGVl+UGYEo2+pelCQYKiUSFyw1VEs4O+0JBXxKzpW7+v
 PbFPse+5A4QqPW84sXrdqf6Z5wU5QdYIGnCDWvQ/4BfASaImMP4pGPXmh7qTlKESHrzd
 pwA/7Vw2/6LCfizJv/Af65yaY/J/UjqpCysaOxb0Dl6X13etShS/MgN9OTwNGeIKQYHV
 /fvqz/m9NiTCaEic4H5go4x2btrPViu5b+2EdJKMfcRkmM9aIIndkk6cYlx1xCr3nRn2
 P1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JOiFQ+VDr28lfLOOmW8pLV87sBU1U/rvv/jp9D7wkWA=;
 b=TFh9I3Jbo4zXum0hDTymkh/dFAYojqpHRnooJdwrXLbBEFwNG4mnkHumxgz8wuQd/F
 3BNoEFwqKme2PPkJlbQPyZ9xlRhdovYH9eYjpb2U5PpdH/z89mtreAOmV4OeceY4vtML
 q6IDhfiremo5jqwDqq5U2NZI4S5qIEOgOozXnyeptpLW5AGQKPz47MQtP+0xnrykcYo/
 vPg/gHUZhSojyoknnQbzDlXUxjpMnMO8+k85trLsCss8oVP9O7aJgkSe7L2VY/Ma2IEZ
 8mPQNtchzrf4GSCBM/8yexc31XFyjLou6CexLtX5TeMsiIi/KMUsKFX3EafVI51VK9CG
 9AcA==
X-Gm-Message-State: ANoB5pkpaaxH+ZH59YCI6fNbV7Lwk8hy4OrjIxPbp4ym960vPD5Sp4rb
 zTCD7aXhpDb1aRzpissTqPb58DigCLza+g+CtHY=
X-Google-Smtp-Source: AA0mqf6nabh0hUBjZPmoNc/QG7ovLqiW4Ly5Jb5sc7QvMjy597DPXlYy1SBfVzRBpYFRhb8WfIcXbg==
X-Received: by 2002:a17:902:c1cd:b0:189:6b31:dc53 with SMTP id
 c13-20020a170902c1cd00b001896b31dc53mr48176049plc.58.1670235946418; 
 Mon, 05 Dec 2022 02:25:46 -0800 (PST)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 ca12-20020a17090af30c00b0020bfd6586c6sm8905807pjb.7.2022.12.05.02.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 02:25:46 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 0/3] target/riscv: Apply KVM policy to ISA extensions
Date: Mon,  5 Dec 2022 15:55:06 +0530
Message-Id: <20221205102509.504520-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x102f.google.com
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

Currently the single and multi letter ISA extensions exposed to the guest vcpu
don't confirm to the KVM policies. This patchset updates the kvm headers and
applies policies set in KVM to the extensions exposed to the guest.

These patches can also be found on riscv_kvm_ext_v2 branch at:
https://github.com/mdchitale/qemu.git

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


