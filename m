Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5CC4C570E
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:15:45 +0100 (CET)
Received: from localhost ([::1]:50560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0fY-0005RU-TW
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:15:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XO-0008AN-0D
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:18 -0500
Received: from [2607:f8b0:4864:20::129] (port=39792
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XL-0000Of-Bd
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:17 -0500
Received: by mail-il1-x129.google.com with SMTP id i1so201334ilu.6
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 09:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KSys58Xwxvnk5K2E95e4wD1cDJrEVeicwBLkOPfldJo=;
 b=K9ixLZf5ibUY/456H3UYFK+Ocm01WRxd9iAjg5j8sFK8yUoSepNyS6PkSsU/6QBVRP
 +3ONgvn9A4cb1W5AdkWQbZxNqJjl+10VzRqCKIeB0pWb+GqpCiFethTRzVZZb4CPL3oZ
 SV4cQEKDq7aknUdwhSHMQi9AgLaXZYR1yvAVpTUMio7PEnDBN504E+Fq+6jN3+2HA/Wi
 /PD/X8zfdu2/0HD9aiLg4S+bOMVcDrioMzis/XICs80Y82gimcKonoGTDNJ9Yr19I1iR
 TxIbhG09FAM37WBaGrralOxzJhJG7q2nK89q9rFPXwPkidAQCpOWNYKkECpBRD48tR7r
 92ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KSys58Xwxvnk5K2E95e4wD1cDJrEVeicwBLkOPfldJo=;
 b=tMBmKCIlzAEBe9A0CTf5MpcAFb2JYej9OTlmr6TeblB8v0sTtCDwdpbf5i0eE6w0HK
 IJex3HJijag7UP0UMKv/n7ySraLoEQbm3C0GgutkJIrlqQL/ctdGLdvhPSH0PMJvWqJH
 a3eJirqZIyBYARsbmXVsyMu9y+bN431HZQCt4v88s6473YCt99TWI8Kf1QE4VetsdiwD
 oYWmovfIMFRlhORgBueMaYHZFG555zhSKJspbLb3hXNtLwAcWN4zOSHcnrhSoTstnudT
 OM3N1FTTFuEj24wZVuoSVnzfjtfiLG+g7FQ6fYGbP5T7JgPTFW1uDY0eOLd/UvZIVTvA
 cJBQ==
X-Gm-Message-State: AOAM531bz/lF2QsduqLGZMmdHpvpeJCOO627o8XflFSoGjVvMHhHRCtU
 RDA2HQ2/X5Iu09YZusGWxeNIQ/K0/C1+lw==
X-Google-Smtp-Source: ABdhPJxU+a6QdRbOPOsvCLFMKuHeTHC7CVwxmsqBEQc3df46i9EY5h3YlndMmhwCmMaLHsSZy0FPZQ==
X-Received: by 2002:a92:c110:0:b0:2be:b9c8:6594 with SMTP id
 p16-20020a92c110000000b002beb9c86594mr11331706ile.185.1645895233115; 
 Sat, 26 Feb 2022 09:07:13 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 e23-20020a6b5017000000b00635b8032d45sm3138764iob.22.2022.02.26.09.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 09:07:12 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/16] bsd-user: Start upstreaming the system calls.
Date: Sat, 26 Feb 2022 10:07:28 -0700
Message-Id: <20220226170744.76615-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches does two things. First, it starts to give up on the idea
that you can run FooBSD binaries on BarBSD. They are too different to make that
happen any time soon, though I've kept the support for Net/OpenBSD, even though
they haven't built. We'll need a lot of work to make that happen, though, and
I need to simplify to get things upstream.

Finally, it starts to move some of the ifdef trees into target.h.

This is pared back a little from the first patch series: the reimplemented
syscall patches depend on hunks that need to be reworked and there won't
be enough time to do that before the freeze, so I plan on submitting the
completed items to simplify bookkeeping on my end.

Only "bsd-user/bsd-file.h: Implementation details for the filesystem calls"
lacks a review at this point.

Warner Losh (16):
  bsd-user/main.c: Drop syscall flavor arg -bsd
  bsd-user/x86_64/target_arch_cpu.h: int $80 never was a BSD system call
    on amd64
  bsd-user/x86_64/target_arch_cpu.h: Remove openbsd syscall
  bsd-user/i386/target_arch_cpu.h: Remove openbsd syscall
  bsd-user/arm/target_arch_cpu.h: Only support FreeBSD sys calls
  bsd-user/arm/target_arch_thread.h: Assume a FreeBSD target
  bsd-user/x86_64/target_arch_thread.h: Assume a FreeBSD target
  bsd-user: Remove bsd_type
  bsd-user/freebsd/os-syscall.c: Move syscall processing here
  bsd-user: Move system call building to os-syscall.c
  bsd-user/sycall.c: Now obsolete, remove
  bsd-user/freebsd/os-syscall.c: Add get_errno and host_to_target_errno
  bsd-user/bsd-file.h: Implementation details for the filesystem calls
  bsd-user: introduce target.h
  bsd-user: Define target_arg64
  bsd-user: Add safe system call macros

 bsd-user/arm/target.h                |  21 ++
 bsd-user/arm/target_arch_cpu.h       | 139 ++++----
 bsd-user/arm/target_arch_thread.h    |   4 +-
 bsd-user/bsd-file.h                  |  30 ++
 bsd-user/freebsd/meson.build         |   1 +
 bsd-user/freebsd/os-syscall.c        |  92 +++++
 bsd-user/i386/target.h               |  21 ++
 bsd-user/i386/target_arch_cpu.h      |  84 ++---
 bsd-user/main.c                      |  14 -
 bsd-user/meson.build                 |   1 -
 bsd-user/qemu.h                      |  24 +-
 bsd-user/syscall.c                   | 516 ---------------------------
 bsd-user/syscall_defs.h              |  47 +++
 bsd-user/x86_64/target.h             |  21 ++
 bsd-user/x86_64/target_arch_cpu.h    |  85 +----
 bsd-user/x86_64/target_arch_thread.h |   4 +-
 16 files changed, 362 insertions(+), 742 deletions(-)
 create mode 100644 bsd-user/arm/target.h
 create mode 100644 bsd-user/bsd-file.h
 create mode 100644 bsd-user/freebsd/os-syscall.c
 create mode 100644 bsd-user/i386/target.h
 delete mode 100644 bsd-user/syscall.c
 create mode 100644 bsd-user/x86_64/target.h

-- 
2.33.1


