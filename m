Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332AE4AAE85
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 10:23:57 +0100 (CET)
Received: from localhost ([::1]:56120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGdlz-0002P9-PB
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 04:23:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nGdh5-0007si-1J
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:18:51 -0500
Received: from [2607:f8b0:4864:20::c31] (port=43842
 helo=mail-oo1-xc31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nGdh2-00012S-Sw
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:18:50 -0500
Received: by mail-oo1-xc31.google.com with SMTP id
 v17-20020a4ac911000000b002eac41bb3f4so10233497ooq.10
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2At++k3TSFcMMs4SbEKHNukTgNfYQ+uGSqymtWnxyBw=;
 b=XChLXpPqEwmUzjVYB1k6Y/rB71dgLIiSNMW4I4WAry/2ykR6Q+lQi5q8Zg+/NINpoB
 dcLko9byqrqqLvi6zOaImc/DTvGfWfJkdMQBX6MU8SIbo+VH2RgBnkMwaQOMLC2Crb4u
 JwEbuLbpw1ashO5Dw4way3HRIqoTmQ0eT0Pr7xSYhkjdv6VC3RUwkwuqDMu4JnIFuNdo
 L6o31Czz9h8f9X5NgXQRln+q27lQ3d5MJFsaTB1Gbto+X4xHjYZt8+A2ctNuGsinDVUI
 mxBTYsvMkQ04dk48Dy6X0ZEWSdDwCuMOG1VfPbNshT2nEfisgQLMBpxiApFFFP8LoGLl
 47Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2At++k3TSFcMMs4SbEKHNukTgNfYQ+uGSqymtWnxyBw=;
 b=NtyZGMyw6jrEieJp3jDR4HdxUX1u2LKO0TbjSBZybRUcDmkr9m+dBGHaCZXt75OgwY
 4SWu4DbtHzLHzDXzHFJc19TwsUIma9HsbLevFeg1HNA4AP64WOxI/imMSXIYbWjjL5dB
 80906dYjAv8XCyWe9S6cUmsnUPlfeJsaeLqIXFf/rLvzfeccCp918YtQkVxtnoSdzZBd
 RlQd195APBHb3rOR2DZlh8giNMEzd+4B8b+9t63EXafMilzY1tGfRHM1uu1pgvEOc3j4
 POKDyQyT7+5DV4oXJK5HgBCPo6zbdCrtHG2zlEBwfudROxA0ckgT9YeA1/jcU955gu6Q
 2dlA==
X-Gm-Message-State: AOAM533QJzucYv7j68wLssdcLI079iSks7W+mVf+99xJU2Ofur0sI/Ts
 yAtT9aaMYnNAluMSAgRKRFh04nLkOi9wXEW/
X-Google-Smtp-Source: ABdhPJxywUbOciYUK5vCA1lC5V5nOhL2vUxQeN0OBMyLvdrCFKwD/SDryzI1JZL3A5xJJ1hnMqENQg==
X-Received: by 2002:a05:6870:12cc:: with SMTP id
 12mr1915094oam.215.1644139127085; 
 Sun, 06 Feb 2022 01:18:47 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id 1sm1596841oab.16.2022.02.06.01.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:18:46 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] Privilege version update
Date: Sun,  6 Feb 2022 01:18:29 -0800
Message-Id: <20220206091835.1244296-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RISC-V International (RVI) has ratified many RISC-V ISA extensions recently[1].
The privileged specification version is also upgraded to v1.12. It means
certain CSRs introduced in v1.12 should only be accessible only if the
priv specification version supported is equal or greater than v1.12.
Doing this check in predicate function is not scalable as there will be
new CSRs introduced in the future versions of the privileged specification.

This series tries to address this problem by adding a field in the csr_ops
which can be checked in csrrw function before invoking the predicate function.
To keep the code churn to minimum, it is assumed that the minimum version of
the privilege version supported for any CSR is v1.10 unless specified
explicitly in the csr_ops table. Any new CSRs introduced in v1.12 have been
updated accordingly.

This will work fine for any ratified extensions. However, it is bit unclear
what should be done for the stable draft extensions. My suggestion is not
to update the priv field in the CSR ops table until the extension is
marked experimental (i.e. not frozen/ratified). Once the extension is
ratified and graduated from experimental to available stage, the privileged
spec version should be updated in the csr table if required. I am open to
other suggestions as well.

[1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions

This series is rebased on top of the AIA v8 to avoid conflicts.

Changes from v2->v3:
1. Only update the bits defined in *envcfg CSR

Changes from v1->v2:
1. Unified both [m/h]envcfg & [m/h]envcfgh into one.
2. Changed the priv spec version enumeration
3. Improved csr_ops table to provide better redability.
4. Fixed the compilation error for CONFIG_USER_ONLY
5. Rebased on top of the AIA series.

Atish Patra (6):
target/riscv: Define simpler privileged spec version numbering
target/riscv: Add the privileged spec version 1.12.0
target/riscv: Introduce privilege version field in the CSR ops.
target/riscv: Add support for mconfigptr
target/riscv: Add *envcfg* CSRs support
target/riscv: Enable privileged spec version 1.12

target/riscv/cpu.c      |   8 +-
target/riscv/cpu.h      |  15 ++-
target/riscv/cpu_bits.h |  40 ++++++++
target/riscv/csr.c      | 217 +++++++++++++++++++++++++++++++++-------
target/riscv/machine.c  |  24 +++++
5 files changed, 264 insertions(+), 40 deletions(-)

--
2.30.2


