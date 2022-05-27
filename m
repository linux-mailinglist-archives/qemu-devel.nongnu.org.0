Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260B3536690
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:29:15 +0200 (CEST)
Received: from localhost ([::1]:55736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudly-0005Fu-20
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nudkV-0003OD-V7
 for qemu-devel@nongnu.org; Fri, 27 May 2022 13:27:43 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nudkU-00048s-3e
 for qemu-devel@nongnu.org; Fri, 27 May 2022 13:27:43 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so7694428pju.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 10:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dKxraNqOZmC1Qjd1FJlCqqyBvierGHSKYTP+opFyWIE=;
 b=Yc87GM7+F/nYRNEVqsZA8OJ4YLOq9NqBGBEzFB8cquToTRhQp/2IwQTPAObKVNRBen
 xy5lEjmV4XzaVbrBtHAUg1XO3xLxRHIP5fZyb5/tSYhuf5/cTJXlcI1MI6R9VCQFm+kk
 nsQhgGVdrkN9gkbegRP7dE0xIgOCZtJV2VTr2SjWv/voxPI012arrt7boo/YVOG0zzpZ
 emX0aElByuwOH8GlpC4xCDC3+CCLuud5vAuMGLeLAyAVIpewPCxqbmx1hOKjAWUYLqPc
 lvWOl8dhzR1OENf86LFVcF5cJssKiY+u0ZIg6qKaLUdyCu4DijCrWFUF5eDSmJOa0HFq
 DHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dKxraNqOZmC1Qjd1FJlCqqyBvierGHSKYTP+opFyWIE=;
 b=nzR7KdNX84VkxMFCQguwf+Iza4SejKVFq0FucE89+aTIGeNmSi8mbvpn2RhUUj3Sh4
 dcVx3B5SlCxuAO0dd/1sHH7hZGUxczTbyUxgF1AsdW9s/1rITLXd14YCeus8+M53b/lT
 1xPSwB1/BfCzmVu1jg4ZwfZSWC96RfxnAa9n1ulpxPOWjaV64O9bxopwVanf1SHoVkod
 BPWHtiAk1mckXBOmvQLFMu6jB59vcE/S1L7QJCIDwPrCpZIxTA4ZRmMQevDxWRBuXB6O
 SmGZzR15olkzYLmd0MQSszuyNHJeAXjjhfVlG94+27VJI2K5ynoPnZ2nZqh9Ul45MTQf
 MiCw==
X-Gm-Message-State: AOAM53035uESX+t3kR8QpwsDq3OqZPuV1aw4NvfdM/zpmF45SU0zXF3/
 PebTCYmPyyD+H8Rc6IIdFdGnszifPXqIeQ==
X-Google-Smtp-Source: ABdhPJzsjUwA4OHUFiopRUYj+HP+AsaLxQoaYY1U2mrRMfaxsXCSZG9SfCXxNB/Ho0pNZY00xLeG8g==
X-Received: by 2002:a17:903:244c:b0:162:4b19:a0e7 with SMTP id
 l12-20020a170903244c00b001624b19a0e7mr18380075pls.44.1653672459159; 
 Fri, 27 May 2022 10:27:39 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 u27-20020a63455b000000b003db0f2d135esm3599647pgk.49.2022.05.27.10.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 10:27:38 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Stafford Horne <shorne@gmail.com>
Subject: [RFC PATCH 0/3] OpenRISC Semihosting and Virt
Date: Sat, 28 May 2022 02:27:27 +0900
Message-Id: <20220527172731.1742837-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I provide 2 options here 2 help with OpenRISC CI testing sush as the wireguard
testing that Jason has been working on.

The two are:

 1. Add semihosting to openrisc to handle l.nop based Halt and Reset
 2. Define a new virt platform, this includes widing in the sifive test device
    that provides a syscon interface to allow for shutdown and reboot.

We could upstream both of them or just one. I am leaning toward dropping the
semi-hosting work and just going ahead with virt.

The semi-hosting stuff was discussed here:

 - https://www.mail-archive.com/qemu-devel@nongnu.org/msg884560.html

Also, I started to propose architecture changes here:

 - https://github.com/openrisc/openrisc.github.io/pull/18

However, looking at how other platforms define semihosting it seems the openrisc
requirements are quite different.  We do not use the open/close/write etc
syscalls as riscv, arm etc do.

Stafford Horne (3):
  target/openrisc: Add basic support for semihosting
  hw/openrisc: Split re-usable boot time apis out to boot.c
  hw/openrisc: Add the OpenRISC virtual machine

 configs/devices/or1k-softmmu/default.mak |   3 +
 hw/openrisc/Kconfig                      |   9 +
 hw/openrisc/boot.c                       | 127 +++++++
 hw/openrisc/meson.build                  |   2 +
 hw/openrisc/openrisc_sim.c               | 106 +-----
 hw/openrisc/virt.c                       | 429 +++++++++++++++++++++++
 include/hw/openrisc/boot.h               |  34 ++
 qemu-options.hx                          |  16 +-
 target/openrisc/cpu.h                    |   2 +
 target/openrisc/helper.h                 |   1 +
 target/openrisc/meson.build              |   1 +
 target/openrisc/openrisc-semi.c          |  54 +++
 target/openrisc/sys_helper.c             |   5 +
 target/openrisc/translate.c              |   6 +
 14 files changed, 690 insertions(+), 105 deletions(-)
 create mode 100644 hw/openrisc/boot.c
 create mode 100644 hw/openrisc/virt.c
 create mode 100644 include/hw/openrisc/boot.h
 create mode 100644 target/openrisc/openrisc-semi.c

-- 
2.31.1


