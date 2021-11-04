Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A299444F93
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 08:18:28 +0100 (CET)
Received: from localhost ([::1]:43824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miX10-0006vR-6f
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 03:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miWyS-0004Oi-DW
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 03:15:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miWyQ-0000g3-Lk
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 03:15:48 -0400
Received: by mail-wr1-x434.google.com with SMTP id u18so7086697wrg.5
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 00:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KjkRt3SIb2J0i1qkM6TiJ3KccDT61M6LdBIWDO19cR0=;
 b=H4k5PGw93WsUxu62hBVtc6XpwvyBS4KvCtWJwglptsweXnq4/uIKd11w3WCikdobec
 Z27M9Mna8wXrdVMM5mYYlxthavqL8a1JZtlZqctg8D8m20nQQD+xhE5Re9MIqcOvri0x
 bGi0xSwID1RrdlijZR6lP7loH/Ns5hmasL6S3OKsAaJqZA6DsTZBqtIxX3GCnnISKwbk
 v3BNWABXx6s1CvMu2Z2LALZOc6VHZAEIFa6FrwtYC7tk/mFJy1OhMon8d8OYs1sXhB2G
 dLs2ssALIFHVG3GguiFWstx+pfpHpV4+8y7QVXaFW7xRYLuKPM7vPbxiNnpDxpu9fpzQ
 fJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KjkRt3SIb2J0i1qkM6TiJ3KccDT61M6LdBIWDO19cR0=;
 b=YmqLH3dGcpJNlXuCYQOotgeK7WsazgzLxGSuPwnCAsfZROfpkD4JJqc9a0Bd0uPCt8
 sAHu7YnYtA0K14vej3gfcDyf8yGJBmQnDA/ye2KIj77x7RsZKcNtDH0dZde4JdnF8Gt7
 C8isI2+y9dIg321P/xv9qZFUT+gZ9gCNipp63fPHeJe4rF4O4DzRoEFI65BWSNhnOIUy
 q+A0YiEfSL+kaXE4oE0sa+iI+TfDbZYixKGk6wKs9tLugSioKr2AJTi4UriTJrv/MMTf
 wNJSukuYotpfKdQERVsbo4eg9x3aUtB87sOYJu/wBPJ2J1u2e0FvXNNdJxa6IHGVHjC3
 naZw==
X-Gm-Message-State: AOAM530s1jBodTRJVCt9J7SNJ0V4RxAKbegpMx4PCdt910r9dMo1YuPS
 gF6TBmqamY8JwuPXiWnNibExfYKsrm0=
X-Google-Smtp-Source: ABdhPJy8KVWteMsiRn51J7AnvBek2uAQp1GnHaNKOTmkLeifAHkwya2calCiZdXXHNWC4d9Ck2kjgA==
X-Received: by 2002:a05:6000:1564:: with SMTP id
 4mr26161411wrz.9.1636010144281; 
 Thu, 04 Nov 2021 00:15:44 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id w7sm4221329wru.51.2021.11.04.00.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 00:15:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] linux-user: Add GPL-2.0-or-later SPDX license
 identifier
Date: Thu,  4 Nov 2021 08:15:39 +0100
Message-Id: <20211104071541.3813306-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to help license clearing report tools, add=0D
SPDX license identifier to the linux-user/ files.=0D
=0D
Supersedes: <20211103203146.3630550-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  linux-user: Move the SPDX license identifier to first line=0D
  linux-user: Add GPL-2.0-or-later SPDX license identifier=0D
=0D
 linux-user/aarch64/target_elf.h      | 1 +=0D
 linux-user/aarch64/target_fcntl.h    | 1 +=0D
 linux-user/alpha/target_elf.h        | 1 +=0D
 linux-user/alpha/target_fcntl.h      | 1 +=0D
 linux-user/arm/target_elf.h          | 1 +=0D
 linux-user/arm/target_fcntl.h        | 1 +=0D
 linux-user/cpu_loop-common.h         | 1 +=0D
 linux-user/cris/target_elf.h         | 1 +=0D
 linux-user/cris/target_fcntl.h       | 1 +=0D
 linux-user/fd-trans.h                | 1 +=0D
 linux-user/hexagon/sockbits.h        | 1 +=0D
 linux-user/hexagon/target_cpu.h      | 1 +=0D
 linux-user/hexagon/target_elf.h      | 1 +=0D
 linux-user/hexagon/target_fcntl.h    | 1 +=0D
 linux-user/hexagon/target_signal.h   | 1 +=0D
 linux-user/hexagon/target_structs.h  | 1 +=0D
 linux-user/hexagon/target_syscall.h  | 1 +=0D
 linux-user/hexagon/termbits.h        | 1 +=0D
 linux-user/hppa/target_elf.h         | 1 +=0D
 linux-user/hppa/target_fcntl.h       | 1 +=0D
 linux-user/i386/target_elf.h         | 1 +=0D
 linux-user/i386/target_fcntl.h       | 1 +=0D
 linux-user/loader.h                  | 1 +=0D
 linux-user/m68k/target_elf.h         | 1 +=0D
 linux-user/m68k/target_fcntl.h       | 1 +=0D
 linux-user/microblaze/target_elf.h   | 1 +=0D
 linux-user/microblaze/target_fcntl.h | 1 +=0D
 linux-user/mips/target_fcntl.h       | 1 +=0D
 linux-user/mips64/target_elf.h       | 1 +=0D
 linux-user/nios2/target_elf.h        | 1 +=0D
 linux-user/nios2/target_fcntl.h      | 1 +=0D
 linux-user/openrisc/target_elf.h     | 1 +=0D
 linux-user/openrisc/target_fcntl.h   | 1 +=0D
 linux-user/ppc/target_elf.h          | 1 +=0D
 linux-user/ppc/target_fcntl.h        | 1 +=0D
 linux-user/riscv/target_elf.h        | 1 +=0D
 linux-user/riscv/target_fcntl.h      | 1 +=0D
 linux-user/s390x/target_cpu.h        | 1 +=0D
 linux-user/s390x/target_elf.h        | 1 +=0D
 linux-user/s390x/target_fcntl.h      | 1 +=0D
 linux-user/safe-syscall.h            | 1 +=0D
 linux-user/sh4/target_elf.h          | 1 +=0D
 linux-user/sh4/target_fcntl.h        | 1 +=0D
 linux-user/signal-common.h           | 1 +=0D
 linux-user/sparc/target_elf.h        | 1 +=0D
 linux-user/sparc/target_fcntl.h      | 1 +=0D
 linux-user/strace.h                  | 1 +=0D
 linux-user/user-internals.h          | 1 +=0D
 linux-user/user-mmap.h               | 1 +=0D
 linux-user/x86_64/target_elf.h       | 1 +=0D
 linux-user/x86_64/target_fcntl.h     | 1 +=0D
 linux-user/xtensa/target_elf.h       | 1 +=0D
 linux-user/xtensa/target_fcntl.h     | 1 +=0D
 linux-user/aarch64/cpu_loop.c        | 1 +=0D
 linux-user/aarch64/signal.c          | 1 +=0D
 linux-user/alpha/cpu_loop.c          | 1 +=0D
 linux-user/alpha/signal.c            | 1 +=0D
 linux-user/arm/cpu_loop.c            | 1 +=0D
 linux-user/arm/signal.c              | 1 +=0D
 linux-user/cris/cpu_loop.c           | 1 +=0D
 linux-user/cris/signal.c             | 1 +=0D
 linux-user/exit.c                    | 1 +=0D
 linux-user/fd-trans.c                | 1 +=0D
 linux-user/flatload.c                | 1 +=0D
 linux-user/hexagon/cpu_loop.c        | 1 +=0D
 linux-user/hexagon/signal.c          | 1 +=0D
 linux-user/hppa/cpu_loop.c           | 1 +=0D
 linux-user/hppa/signal.c             | 1 +=0D
 linux-user/i386/cpu_loop.c           | 1 +=0D
 linux-user/i386/signal.c             | 1 +=0D
 linux-user/m68k/cpu_loop.c           | 1 +=0D
 linux-user/m68k/signal.c             | 1 +=0D
 linux-user/main.c                    | 1 +=0D
 linux-user/microblaze/cpu_loop.c     | 1 +=0D
 linux-user/microblaze/signal.c       | 1 +=0D
 linux-user/mips/cpu_loop.c           | 1 +=0D
 linux-user/mips/signal.c             | 1 +=0D
 linux-user/mips64/cpu_loop.c         | 1 +=0D
 linux-user/mips64/signal.c           | 1 +=0D
 linux-user/mmap.c                    | 1 +=0D
 linux-user/nios2/cpu_loop.c          | 1 +=0D
 linux-user/nios2/signal.c            | 1 +=0D
 linux-user/openrisc/cpu_loop.c       | 1 +=0D
 linux-user/openrisc/signal.c         | 1 +=0D
 linux-user/ppc/cpu_loop.c            | 1 +=0D
 linux-user/ppc/signal.c              | 1 +=0D
 linux-user/riscv/cpu_loop.c          | 1 +=0D
 linux-user/riscv/signal.c            | 1 +=0D
 linux-user/s390x/cpu_loop.c          | 1 +=0D
 linux-user/s390x/signal.c            | 1 +=0D
 linux-user/semihost.c                | 3 +--=0D
 linux-user/sh4/cpu_loop.c            | 1 +=0D
 linux-user/sh4/signal.c              | 1 +=0D
 linux-user/signal.c                  | 1 +=0D
 linux-user/sparc/cpu_loop.c          | 1 +=0D
 linux-user/sparc/signal.c            | 1 +=0D
 linux-user/syscall.c                 | 1 +=0D
 linux-user/uname.c                   | 1 +=0D
 linux-user/vm86.c                    | 1 +=0D
 linux-user/x86_64/cpu_loop.c         | 1 +=0D
 linux-user/x86_64/signal.c           | 1 +=0D
 linux-user/xtensa/cpu_loop.c         | 1 +=0D
 linux-user/xtensa/signal.c           | 1 +=0D
 linux-user/errnos.c.inc              | 3 +--=0D
 104 files changed, 104 insertions(+), 4 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

