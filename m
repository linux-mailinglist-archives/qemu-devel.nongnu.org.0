Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032D64396BE
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 14:53:44 +0200 (CEST)
Received: from localhost ([::1]:43420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mezTz-0008Bg-1P
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 08:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mezKN-0001Fk-Uy
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:43:47 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mezKL-0004ht-7R
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:43:46 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 v1-20020a17090a088100b001a21156830bso4829631pjc.1
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 05:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kOs2Bq1/GGwM4a/Wa2Jzo0+y+GnD8X3Yq7P4b31d40w=;
 b=IM0+tT/7xYFRiSnrIyJnmiXpF0UU8WsNw7VtuVrJkIiO/sdNuOsEDoSjHlQigP9z6e
 5zZYQGx9Ae8HKzyLYhhNK8H57DSqU8PLFGtYhjF+bNhzbyLOI7a/PSz2VK2d5mTRxizz
 hQGwUep5kZJpytuCPDTMxaL6ArqigAHQYiRvR8U/Fw6x+2I4mjGFZj2fY6OQoyw/nT5J
 ccbg7fNGH2ufXxOC1nGoAfQq47Mb/H1XHYK8QbbFLfVPQC/KsxICdMsqxNvTKFt5pO2b
 eYFArvx1u4YqyLgLpD/R4e0QWxgfLfmgse7crdFsQy6RkTQfRH4UpMUdZe8aytl0GXyf
 v6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kOs2Bq1/GGwM4a/Wa2Jzo0+y+GnD8X3Yq7P4b31d40w=;
 b=GZVIdNKqtkvKCz8/XbL/RxVF6uFfjC2SvdB/SvasNMKOLbovxD3BIdJjcRjevQ38ss
 2CR/75ZN/dOp+cGrLm38F4GjuZ6BLCXhiRWSwsjiLEWg+LSFyfmPWE2byyZFicolW7Sj
 ROq+RtBfFDt4GyVGvkn2xkIYchJ2dPPgDd0zdZW3SfuRJ1ZmeFVGnw9NF9lX+cQw2Ks4
 1Vl+KLn5YbyXJc7gcfYHIpjVNLmac5ldMOg2sFge61+az2VvjRmn1nBC4pfUqfnvM0Dl
 2kIh91i98sZjK3naViC+HsPM0IdZ0r5F4VsLbANX0OD3ambONFj/8GLVZy/pBLRvt0DQ
 Q3/g==
X-Gm-Message-State: AOAM532pBjcF8LQhzix0yzrpYrIoMKZrTevDraztFJrnzrgu2TuS8t+u
 lyTV6Ib0Mnr5OtaO9cp6hihfJw==
X-Google-Smtp-Source: ABdhPJz9w/uM74No566XEkad42u+MYyXaqkl6mhcrIq0o42lYm1HvY9X+Y+TMHTMzJl/a97ZveyXdg==
X-Received: by 2002:a17:90b:4b4f:: with SMTP id
 mi15mr6673589pjb.150.1635165822792; 
 Mon, 25 Oct 2021 05:43:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6817:c049:7263:28b8:7cdf:c7e4])
 by smtp.googlemail.com with ESMTPSA id nn2sm3293461pjb.34.2021.10.25.05.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 05:43:42 -0700 (PDT)
From: Rahul Pathak <rpathak@ventanamicro.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, bmeng.cn@gmail.com,
 Alistair.Francis@wdc.com
Subject: [PATCH v2 0/2] mconfigptr support
Date: Mon, 25 Oct 2021 18:13:17 +0530
Message-Id: <20211025124319.195290-1-rpathak@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=rpathak@ventanamicro.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: rpathak@ventanamicro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patches add the mconfigptr csr support. 
mconfigptr is newly incorporated in risc-v privileged architecture
specification 1.12 version. 
priv spec 1.12.0 version check is also added.


qemu-system-riscv64 -nographic -machine virt -cpu rv64,priv_spec=v1.12.0

Changelog:

v1->v2
------
1. Added privileged architecture spec version 1.12 ("v1.12.0") check
2. Added predicate function for mconfigptr which verifies
for priv spec version v1.12.0 or higher.

Thanks
Rahul

Rahul Pathak (2):
  target/riscv: Add priv spec 1.12.0 version check
  target/riscv: csr: Implement mconfigptr CSR

 target/riscv/cpu.c      |  4 +++-
 target/riscv/cpu.h      |  1 +
 target/riscv/cpu_bits.h |  1 +
 target/riscv/csr.c      | 19 +++++++++++++++----
 4 files changed, 20 insertions(+), 5 deletions(-)

-- 
2.25.1


