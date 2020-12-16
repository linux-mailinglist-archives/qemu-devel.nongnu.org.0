Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573622DC1B1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:57:40 +0100 (CET)
Received: from localhost ([::1]:36226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXJD-0006Hp-Bl
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpXHG-0004yu-68
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:55:38 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:40306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpXHC-0000rF-Dr
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:55:36 -0500
Received: by mail-ed1-x52b.google.com with SMTP id h16so24882674edt.7
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 05:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EQrQs/1HXu49/BZQfK7EnJ2hPLx3j900fQSwF0No3uM=;
 b=Z2fegVw4TO6WxqNb53YjSn3TdoQrnHg5QA6492sZwmA1vMS2oBAt0H+MHM7xJvljhZ
 MOKmSvNv+7naVYF5q0ATjcprwGt/zt7D+FBzrCtEsuoOk4GKM7ht/U4AEuyzWpK9zTg2
 M1cjZNDLiafxoZ2lTMIBuhZ0SaYmUlcLLfD8MSQXH5WjU1p/gTBYmkverRx165VK7gCj
 u3rMmhUEwnTAbXID2aQz+8qjrqAWtx6Zd8cJ2CzUDlIhVmyJzB/ob5zPJftM+7bmrCg6
 WrRltRvMN7/fzvUoqczHHdT9zhlCPyQn8KvQnmWrwByJLd7qpDLt5gOzThsP55Pp2B90
 lI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=EQrQs/1HXu49/BZQfK7EnJ2hPLx3j900fQSwF0No3uM=;
 b=V00XY9G5YtANbs0npigcEfGc+OhribywL/Hz9UomejVeWcS5X94blcSOnUfPh3Nziw
 iqFGXpIoMjOKCE7d3k2PkJT513B03CKLqEmD0gOk87LJBt+MeiGR1u3pJZ7yRxvMJ1+1
 bQN07/kwri1r1XBMHz8eC7QrDDbo5+RdD9RDwwKVXleQIgQcl+jQhqlww13eqdhzi7Wd
 qDRuf4oiozcGHWmJGAKRdGZ0Tja1pbqmbLwEZaV6EBI7l5nJNNOekltBkagz7BiEa49F
 MgNrC9WFjZeSol8xnEzuaIR2CxnJrEOjVzJoWN2mED7qwojcc3LogTnWxSfN+OGlo/9M
 bmGg==
X-Gm-Message-State: AOAM533azJuNfaXop5UKsNw605g5VkYp7+eP+HejuOqJmW0rmfnyYvET
 /gbGJiAOV5nP7OQ2icleEKHiOme+1z4=
X-Google-Smtp-Source: ABdhPJxSPt68Dx7rPrH0BxK2lurZ3VChfc3VRtnjcjuXXTQSUt8pU4D8QKd8m4GRofCh3008j0/60w==
X-Received: by 2002:aa7:cf8f:: with SMTP id z15mr33904599edx.17.1608126932391; 
 Wed, 16 Dec 2020 05:55:32 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id k16sm1423216ejd.78.2020.12.16.05.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 05:55:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Cleanup includes for no-TCG builds
Date: Wed, 16 Dec 2020 14:55:26 +0100
Message-Id: <20201216135529.265165-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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
Cc: philmd@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now, accel/tcg and tcg/$tcg_target are part of the include path for
all builds, mostly due to exec/translate-all.h and the flush_icache_range
function.  But there's also a few useless tcg/tcg.h includes that can
simply be removed.

This small series, mostly consisting of code movement and file renames,
starts cleaning up this area.

Paolo

Paolo Bonzini (3):
  remove TCG includes from common code
  move icache flush out of tcg.h
  trace: do not include TCG helper tracepoints in no-TCG builds

 accel/stubs/tcg-stub.c                      |  1 -
 accel/tcg/cputlb.c                          |  2 +-
 accel/tcg/translate-all.c                   |  2 +-
 accel/tcg/user-exec.c                       |  2 +-
 cpu.c                                       |  2 +-
 hw/i386/kvmvapic.c                          |  1 -
 include/exec/flush-icache.h                 | 64 +++++++++++++++++++++
 {accel/tcg => include/exec}/translate-all.h |  0
 monitor/misc.c                              |  1 -
 softmmu/physmem.c                           |  4 +-
 tcg/aarch64/tcg-target.h                    |  5 --
 tcg/arm/tcg-target.h                        |  5 --
 tcg/i386/tcg-target.h                       |  4 --
 tcg/mips/tcg-target.h                       | 11 ----
 tcg/ppc/tcg-target.c.inc                    | 22 --------
 tcg/ppc/tcg-target.h                        |  1 -
 tcg/riscv/tcg-target.h                      |  5 --
 tcg/s390/tcg-target.h                       |  4 --
 tcg/sparc/tcg-target.h                      |  8 ---
 tcg/tcg.c                                   |  1 +
 tcg/tci/tcg-target.h                        |  4 --
 trace/meson.build                           |  2 +-
 util/cacheinfo.c                            | 25 +++++++++
 23 files changed, 97 insertions(+), 79 deletions(-)
 create mode 100644 include/exec/flush-icache.h
 rename {accel/tcg => include/exec}/translate-all.h (100%)

-- 
2.28.0


