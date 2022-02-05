Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3DF4AA533
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 01:53:57 +0100 (CET)
Received: from localhost ([::1]:37392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG9Kn-00054a-Kw
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 19:53:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nG94S-00021M-C0
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 19:36:56 -0500
Received: from [2607:f8b0:4864:20::235] (port=46885
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nG94P-0001lo-Sm
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 19:36:56 -0500
Received: by mail-oi1-x235.google.com with SMTP id y23so10396913oia.13
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 16:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y2tcMCDmFtSM7eKk3eKqNe+/OAAgB42qjeSPCisRDIk=;
 b=mwpsOgCjmQpzdBsHQAuaPIpxZFwTEZDP1tYOuNpvSUOyTnW9jJUlH421wLzUlQawbu
 X0TaeJ6e7EnnA+tvtwvRF9TS9J8HPWhEondF3OaC0RYIyor4er8lbUFVIom1bPYgxXwX
 VYu/U23dISqd3NVMp2URMpBRY62TmrwMQMU/ym48epssfP8ytiU/IQe0gKpKpSno/P+c
 yv7Irt0W6/6QJ8tUZ75ugc+z8z1cAMsxKfRx4ziDPHmAU341uO6aPfy06EVs+PDkMkuU
 ESbBt5zEY22nfcgF/LQsBHAfNec2CPVD/8QDwi/oK7eHwkLINroB0ec2q1JTH1x+U3xR
 4Vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y2tcMCDmFtSM7eKk3eKqNe+/OAAgB42qjeSPCisRDIk=;
 b=ACHNeYTWVBnp3i7ybyVN/RIayaEDN7o2gOqedAfxniAnpKtryfURd43nD9o+TgOfO+
 /dRT+uPQKhaM/eojjHm280or8JbqDG5dLGH3yJzmvVz/O4SXx0hC72NZICdlSObyeMCO
 JUXQ0W5gBvllB3lrjSWA9m02v4ZwlHVqbCYArXEq/8XxUx6be9hUn+esuC4flJn1V0XG
 iZCiKj5qkGCn6HEKbpdtijwsIa6q1QxWOpyb0TPGUrcjfZAyLTGFhwtlN8USL1FEB+7v
 sn1xP9LZznqHjuuQbuMchAvpCOWIGT9vJ2MD5RU5eshlb3A1Z1dFnmvpZnjzFtzTvqxV
 JNfQ==
X-Gm-Message-State: AOAM533CA5Nm3a/jf/gJkn3QJ7/+9ghYFSWTLg1uao/TkxRsknlYTPfR
 Y39QLJyEBis1cSQpQ/4HeC1F4gRnH/Xasn56
X-Google-Smtp-Source: ABdhPJx2sOVcivcAVVMhdjvV8jZsuUp8Q9gDA3kdz5p1woktwugoezhpbnrqgFsJ9TWNVOqWilXtdw==
X-Received: by 2002:a05:6808:148e:: with SMTP id
 e14mr2569876oiw.188.1644021411780; 
 Fri, 04 Feb 2022 16:36:51 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id c22sm1148888oao.43.2022.02.04.16.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 16:36:51 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] Privilege version update
Date: Fri,  4 Feb 2022 16:35:59 -0800
Message-Id: <20220205003605.1150143-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x235.google.com
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
target/riscv/cpu.h      |  16 +++-
target/riscv/cpu_bits.h |  40 ++++++++
target/riscv/csr.c      | 197 +++++++++++++++++++++++++++++++++-------
target/riscv/machine.c  |  24 +++++
5 files changed, 245 insertions(+), 40 deletions(-)

--
2.30.2


