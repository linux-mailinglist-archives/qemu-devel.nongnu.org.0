Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973CA495734
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 01:08:06 +0100 (CET)
Received: from localhost ([::1]:36366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAhTJ-0005o9-Ci
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 19:08:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nAdj5-0002jL-V5
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 15:08:08 -0500
Received: from [2607:f8b0:4864:20::82c] (port=36553
 helo=mail-qt1-x82c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nAdj3-0006W0-Lp
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 15:08:07 -0500
Received: by mail-qt1-x82c.google.com with SMTP id c19so7639688qtx.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 12:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8qXVNgaYeIfFu3Ow7r38oZP5uUxirnl8ygQjSCeLRuM=;
 b=mxch+Tg3BGjFyrqf/sl9mVfgkWSG1XKCgg6cTv+wjqwSMqwV5Hz5GbT2vWYYJW4qQn
 7SYZXQu9H8Zk7Naev67VVcrQQr0gVd4E6fCoh1vSqjfqNTIwTVvAoiB3XqNuv2uzPWKD
 kSYfEzV/6h3vwQzfr4bxNDDhwS7EHTD6x24KMlk//XT+y/W+z0uX+2E7L+wDarDJhGZc
 arnSvNiZbkNDcGP1ULrfU3I/DRREg+ARrNtOBbbq2kVeaQFXMlJO2MUzfFcgdBKrz7fI
 MeRVe7iH3zG4tKu0F9b1Jfrmk/gMB6w8gFlpbHCg80YSCSensDvJQEG3zofqWllpYzN5
 9rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8qXVNgaYeIfFu3Ow7r38oZP5uUxirnl8ygQjSCeLRuM=;
 b=cXy6KmoKeQoAFr0SQjd7dMkqVeUlxYD8DjFKW2LLkYed7PL7UYSs6URb4nOXLnyvWx
 sAD0+TaNUv8Z1SI83RR8cyXVtcq3hayku06Tkz0QdW0VM+zpTx0QiEzNFGcUrc0JS/68
 pZIULC/0WjsaZGFVAMW0/qLi18JSS5K1kPdWh/BXfhpGD5NUllCJQHbrufsO/rbUqyge
 poVYj45TN13peyJ3OxHdon5bRtFVDBoFi4uudOoeaaqAU2+lsbSYUtXcGCbpg4N5UzYv
 kZyMbKVmVxy9JNOnPSlakZ9xkxs6w5lyxL9eUe8/LaogrosSfh4N+Elmbzp+U3texKMr
 4feQ==
X-Gm-Message-State: AOAM530niepEPp5DjBNj6/rwsJ92TL2OHyAE1OjeUJNaw3gwfPHh4V+c
 O385HB2lPQQ0sBNJ1cfGXK/XTjrOF6hUcQ==
X-Google-Smtp-Source: ABdhPJw5zpT5GYvfLTt170+JO3RmLOreE6Tybk03InBOs1rVSR0qoA1DsO8cOR0RAOBQgU0wGlMssg==
X-Received: by 2002:ac8:5988:: with SMTP id e8mr586034qte.459.1642709283339;
 Thu, 20 Jan 2022 12:08:03 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id a136sm1834160qkc.56.2022.01.20.12.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 12:08:02 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC 0/5] Privilege version update
Date: Thu, 20 Jan 2022 12:07:30 -0800
Message-Id: <20220120200735.2739543-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=atishp@rivosinc.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Anup Patel <anup@brainfault.org>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
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

Atish Patra (5):
target/riscv: Add the privileged spec version 1.12.0
target/riscv: Introduce privilege version field in the CSR ops.
target/riscv: Add support for mconfigptr
target/riscv: Add *envcfg* CSRs support
target/riscv: Enable privileged spec version 1.12

target/riscv/cpu.c      |   8 +-
target/riscv/cpu.h      |  10 ++
target/riscv/cpu_bits.h |  32 +++++++
target/riscv/csr.c      | 199 +++++++++++++++++++++++++++++++++-------
target/riscv/machine.c  |  26 ++++++
5 files changed, 237 insertions(+), 38 deletions(-)

--
2.30.2


