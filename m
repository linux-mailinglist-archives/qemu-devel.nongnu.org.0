Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC67552F1C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:49:30 +0200 (CEST)
Received: from localhost ([::1]:32856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3aVl-0005dH-C1
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQf-0007Ql-7u; Tue, 21 Jun 2022 05:44:13 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:39708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQd-0007LT-Gf; Tue, 21 Jun 2022 05:44:12 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 111-20020a9d0378000000b0060c2db66d44so10258465otv.6; 
 Tue, 21 Jun 2022 02:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y30YAq9I6fVgs147wab9vg/3/AVWl6HU49zlNRg6CDA=;
 b=hoHWI7mSkLF7u0cc6UozWl4X14UXuB9UB9imNYlT+eta0sDnTywUsGfN46P3yhunyl
 VFKxTsp8aPzf7IeURc4fjx4R9+Zf2EWTyPYzP3AQTx4z7ul1OBUCPmh0B5+0kIb25J2h
 F1dCljBVH0lKUlTOW751QGHjc4bvr3Imjnigk0f9Ur5yfaUr2YEN/Zy4zH7xbQZVWw3w
 p6YwFsZhndbtvd2qtuucZ5DQeQEpfUuO9ER/A61SSfJJ5X+8yIMnvAL6PD+kax3qb4sR
 pbMO6sdM8zJSaM6SqDrah+bcQ6K42fRMRPT7AyyHS3PhcufnA5nMRiJmZRxreEweDdzn
 eATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y30YAq9I6fVgs147wab9vg/3/AVWl6HU49zlNRg6CDA=;
 b=gE/wmZdWsrGUknqlMbM2ldFKxjlI83EmoyXa9bh4/EL4T0oIiGbNcPPi2/0yz6ZLc7
 2yel+N6ZpzQtGJ/DPm6PNFA5BBSgEx0S9m1IGMtwLmAOhfZ1jssBnM6d7b5pBn3/veLO
 HYW+tZ+e5YvscPBUaM676eQNDMliE49lN7bUVVLWAfx+r1FvniiHFwnji6+7HrdjNpHe
 SKSkuP24b61ZJVx41lNqz6NqZSgDdPjWZyuNFsDpWAZWgyVDoLRjK+ralSDoqrz67OXX
 pq2uUy/Dioi5gHDYQWEl5ZyEYhkDwMuawPGovuBLj80DrDijDPaXe1VUGpGUyTm3h2lU
 NYYw==
X-Gm-Message-State: AJIora+T5D1mko2/pRJ7KVcS1CJONF88AhfzQ9cOXBjSL2eWeFXOyA2Y
 b7v+YFuijO8ZWPvwGzRN8HvMXkayIH+Wmg==
X-Google-Smtp-Source: AGRyM1s5Hg7QF9snA8JYzlYO6fNdBJWZvyw+10O76sfNfN0ZU39Z+ROmil3+kTP2bs19AZsh6Vmv+A==
X-Received: by 2002:a9d:7e8c:0:b0:60b:f6d0:6fa4 with SMTP id
 m12-20020a9d7e8c000000b0060bf6d06fa4mr10793379otp.4.1655804646324; 
 Tue, 21 Jun 2022 02:44:06 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a9d7a49000000b0061020865f1asm7555119otm.50.2022.06.21.02.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:44:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org
Subject: [PULL 00/15] ppc queue
Date: Tue, 21 Jun 2022 06:43:45 -0300
Message-Id: <20220621094400.122800-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

The following changes since commit c8b2d413761af732a0798d8df45ce968732083fe:

  Merge tag 'bsd-user-syscall-2022q2-pull-request' of ssh://github.com/qemu-bsd-user/qemu-bsd-user into staging (2022-06-19 13:56:13 -0700)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220621

for you to fetch changes up to 609b1c866925049f22a79623021076192f7a6595:

  target/ppc: cpu_init: Clean up stop state on cpu reset (2022-06-20 08:38:59 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-06-21:

- tcg and target/ppc: vector divide instructions and a vbpermd fix for
  BE hosts
- ppc440_uc.c: fix boot of sam460ex machine
- target/ppc: fix stop state on cpu reset
- xive2: Access direct mapped thread contexts from all chips
- a couple of Coverity fixes

----------------------------------------------------------------
Daniel Henrique Barboza (3):
      ppc/pnv: fix extra indent spaces with DEFINE_PROP*
      target/ppc: avoid int32 multiply overflow in int_helper.c
      target/ppc: fix unreachable code in fpu_helper.c

Frederic Barrat (2):
      pnv/xive2: Access direct mapped thread contexts from all chips
      target/ppc: cpu_init: Clean up stop state on cpu reset

Lucas Mateus Castro (alqotel) (8):
      target/ppc: Implemented vector divide instructions
      target/ppc: Implemented vector divide quadword
      target/ppc: Implemented vector divide extended word
      host-utils: Implemented unsigned 256-by-128 division
      host-utils: Implemented signed 256-by-128 division
      target/ppc: Implemented remaining vector divide extended
      target/ppc: Implemented vector module word/doubleword
      target/ppc: Implemented vector module quadword

Matheus Ferst (1):
      target/ppc: fix vbpermd in big endian hosts

Michael S. Tsirkin (1):
      ppc: fix boot with sam460ex

 hw/intc/pnv_xive2.c                 |  18 +++-
 hw/pci-host/pnv_phb3.c              |   8 +-
 hw/pci-host/pnv_phb4.c              |  10 +-
 hw/pci-host/pnv_phb4_pec.c          |  10 +-
 hw/ppc/ppc440_uc.c                  |   8 ++
 include/qemu/host-utils.h           |   3 +
 include/qemu/int128.h               |  38 ++++++++
 target/ppc/cpu_init.c               |   3 +
 target/ppc/fpu_helper.c             |   2 +-
 target/ppc/helper.h                 |   8 ++
 target/ppc/insn32.decode            |  23 +++++
 target/ppc/int_helper.c             | 116 ++++++++++++++++++++++-
 target/ppc/translate/vmx-impl.c.inc | 151 ++++++++++++++++++++++++++++++
 util/host-utils.c                   | 180 ++++++++++++++++++++++++++++++++++++
 14 files changed, 554 insertions(+), 24 deletions(-)

