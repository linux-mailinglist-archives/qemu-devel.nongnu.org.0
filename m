Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ED36F822A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 13:41:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1putnN-0003fp-0n; Fri, 05 May 2023 07:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1putn6-0003dw-Hw
 for qemu-devel@nongnu.org; Fri, 05 May 2023 07:40:02 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1putn4-0001Vn-5h
 for qemu-devel@nongnu.org; Fri, 05 May 2023 07:39:59 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-64388cf3263so1260704b3a.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 04:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1683286792; x=1685878792;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o4QIeyMszmut9Rf7OAQprZix2Eig94pGzBK3AJhGo48=;
 b=VTgkRB5oaNCh55/AV431dfVQSGRV+QBvvzUinDYKwiCf/3viu/J5VE+/nwAFayGHtA
 UbbJe+cTT5kjl3Y++2+k4UTuq5jfoQX8dRiXd6NolbKcLyFD5/yBPXe/NPmddAzm9eaY
 O74+liB2HorrMO7QJ8VyLCR2c61O0u6Sm8/E0EFno27mqdKHlfd7Jg9FvN7zudE4o0n9
 bFTdqpz3r0HeOa63agMVhhpcQfNDRE+AlMmXopaBPHhczjaplvQeYVy2JfviTe8msrpG
 aIsA/3bKF6+Xv/I0HYwkkp0EuZWIVaW53IYMwaTRWwjzPin/dMbJb97PsdogbwnaYbRk
 9dFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683286792; x=1685878792;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o4QIeyMszmut9Rf7OAQprZix2Eig94pGzBK3AJhGo48=;
 b=LqHApcjDHngxcjyOcn9+0iUFyxvROaAgebqBQpThk+G4xZAZk8yZblhPQE0KWMD8kU
 Df92rMPFp22KO7Yu2OltbH2g5FikTqDJdbhbJSuC2UnqQ89cbJzgrctR74/TD61Mndb6
 UGH3anyJX0P1krvmOhXYA8fT52kHczpBp7mZmfcEFz76KtlAhJp57pASQigjc23SNitJ
 OY2WvuNe7uG7hTx+HNq5qxd+EfmyCBTFEQIF/p3NpJ8g0572FPUxvbeYbqJrX8I9J16L
 gk7L1Yu0D5JCuSvV2J2ZF2Q7+67KJmz0e8u0uf0lhbveftUTN5B5deQ7zo+u61jyjy9J
 hQ9Q==
X-Gm-Message-State: AC+VfDyMHkr2ow8p6uumg7C0GtsjN1AlGm60yzfJVvJAf/2jBFHB4/xh
 iInI7C8DnzbT+AsLQrw6b+f3T4tbfLOwu2CXHwZ4BNMLONelm7VBSKOofER2yailSd41YAJKHKX
 0bsUyf/IpwNUKEHlOJu2CbcG/ih64nigbDGSiMQqVp8KJSLgFpo4jshXDKgspx9C4R95mj99sjt
 G5iD6a
X-Google-Smtp-Source: ACHHUZ7V9ZJpCCjBcLd4rKzY3Ezu9aMqGRlBB9h47hjKMx61BoBzkzxcBAi3zuxS/CUlzdaB4XmyTQ==
X-Received: by 2002:a05:6a20:430a:b0:f0:b2f2:2020 with SMTP id
 h10-20020a056a20430a00b000f0b2f22020mr1459312pzk.50.1683286791910; 
 Fri, 05 May 2023 04:39:51 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 y17-20020aa78051000000b0062d859a33d1sm1448171pfm.84.2023.05.05.04.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 04:39:50 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, jim.shu@sifive.com,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PTACH v2 0/6] Add RISC-V KVM AIA Support
Date: Fri,  5 May 2023 11:39:35 +0000
Message-Id: <20230505113946.23433-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series adds support for KVM AIA in RISC-V architecture.

In order to test these patches, we require Linux with KVM AIA support which can
be found in the qemu_kvm_aia branch at https://github.com/yong-xuan/linux.git
This kernel branch is based on the riscv_aia_v1 branch available at
https://github.com/avpatel/linux.git, and it also includes two additional
patches that fix a KVM AIA bug and reply to the query of KVM_CAP_IRQCHIP.

---
v2:
- rebase to riscv-to-apply.next
- update the linux header by the scripts/update-linux-headers.sh


Yong-Xuan Wang (6):
  update-linux-headers: sync-up header with Linux for KVM AIA support
  target/riscv: support the AIA device emulateion with KVM enabled
  target/riscv: check the in-kernel irqchip support
  target/riscv: Create an KVM AIA irqchip
  target/riscv: update APLIC and IMSIC to support KVM AIA
  target/riscv: select KVM AIA in riscv virt machine

 hw/intc/riscv_aplic.c         |  19 +++-
 hw/intc/riscv_imsic.c         |  16 ++-
 hw/riscv/virt.c               | 207 +++++++++++++++++++---------------
 linux-headers/asm-riscv/kvm.h | 105 ++++++++++++++++-
 linux-headers/linux/kvm.h     |   2 +
 target/riscv/kvm.c            |  96 +++++++++++++++-
 target/riscv/kvm_riscv.h      |   3 +
 7 files changed, 343 insertions(+), 105 deletions(-)

-- 
2.17.1


