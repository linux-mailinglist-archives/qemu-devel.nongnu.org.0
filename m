Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE004CA59E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:10:03 +0100 (CET)
Received: from localhost ([::1]:34486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOjy-00078J-1p
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:10:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPOei-0003Xv-R3
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:04:37 -0500
Received: from [2607:f8b0:4864:20::52b] (port=43753
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPOeh-0004xX-25
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:04:36 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 27so1564824pgk.10
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 05:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bbH8XXnjQJM6yhYrzG0KAYzzaS4bpxWDEH2hSAtOzls=;
 b=achS8/pyL6+F0MF9F04wtH7eK7XTJ/cd6R61wRdjr+aNR0vXRo9aRLWQhGBOQdiulW
 of8us4ptHrRiI3aRy1Xwhe3j7AdhA5/rGhWGZENH3R14LHlgx597f9aArNYJgsxN4n0n
 /MsM34s+Vnaf6XaVYDjF+Lr2d2BGpVJHqhSRzTJxl5SkWLOdZMjJRiyDcPo78bbRbE/K
 Abp+RP9yamYr1NqW9GIu0LOHosE9uXmvwKV0Zh+rgO1JIqB5hSL6/LgnWFjC+FQ0X2bD
 SEQWYtLvG95WU4MuZlm/J5etFku4KVsSlS+Zc69CrA50Oi28z/K4aviwEwOtBQCIAmRh
 yLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bbH8XXnjQJM6yhYrzG0KAYzzaS4bpxWDEH2hSAtOzls=;
 b=Tj4ENbv45xITjbhuzfXMX602qlYs2WtI6nlYe8jly/IZk9zpfjQIb09SOJ4oOESbd8
 7ZUmgVDAkzdXT54bvVcxZFx/uAvH8Ez1RJn78M7aMHX93PacBQs+LZ3GSIwR2/bV2Vzj
 w192H6Q8yAmMFGybwePCWFT7z89m7TJLCtDaO1So8deVjOOVqrxX79yvM6fLpPOTG/vd
 aSuuFLisLJY1n6C2MBgvTC/aMwkopLJYdbMDlnvxXZlJqPS2Q8UWE41ss8AdiH+yd+rC
 1SgunpoupZDkhUVVZ2soLE/w2WPf72FV1j9fzR3tgf7qM7YQALnJP7VpdFs+AWIoE6+/
 dFXA==
X-Gm-Message-State: AOAM530dsHXYBeCI6rafsfL0qTkmjGCKRebAt59pSbqj7eUqEyYSQZHU
 qtK/CnbtCNwvDQJfLv4d+KmblQRxohrXaw==
X-Google-Smtp-Source: ABdhPJzfQPBZsnlO0nz4oQjiRBKyWVSAcz1X887ifX9Rn7CtdHvGzkl5IqURhxjClXtXfJbap3Z/Gw==
X-Received: by 2002:aa7:94a4:0:b0:4f3:6215:5d1e with SMTP id
 a4-20020aa794a4000000b004f362155d1emr33253831pfl.73.1646226269782; 
 Wed, 02 Mar 2022 05:04:29 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-e000-59d7-a02b-4f1b-c415-11a0.dynamic-ip6.hinet.net.
 [2001:b011:e000:59d7:a02b:4f1b:c415:11a0])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a056a00140d00b004e13da93eaasm21947964pfu.62.2022.03.02.05.04.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Mar 2022 05:04:29 -0800 (PST)
From: Yan-Jie Wang <ubzeme@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/9] Many improvements to HVF memory-related codes
Date: Wed,  2 Mar 2022 21:04:08 +0800
Message-Id: <20220302130417.18551-1-ubzeme@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=ubzeme@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>, Yan-Jie Wang <ubzeme@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

changes in v3:
* Fix last two patches which contain mistakes:
 - hvf: only consider directly writeable memory regions for
    dirty-tracking
 - hvf: remove the need to lookup memory slots when clearing dirty-bits

changes in v2:
* Rebase to the current master.
* Correct a mistake in "hvf: simplify data structures and codes of
  memory related functions" patch
* add two patches for HVF memory listener. The changes are
 - only consider directly writeable memory regions for dirty-tracking
 - in `hvf_log_clear`, use provided `section` (MemoryRegionSection)
   from the caller to determine the pages that need to write-protected
   instead of calling hvf_set_dirty_tracking to write-protect the memory
   slots that contains the pages whose dirty-bits are cleared.

----------

I recently bought a Mac with M1 Pro chip, and use QEMU to setup a Linux
virtual machine.  QEMU crashed when I started a VM with HVF accelerator
enabled and with the device, bochs-display, added.

After digging into the source code, I found that dirty-tracking in HVF
did not work properly, which made QEMU crashed. Therefore I made this
series of patches to fix the problem.

Followings are the summary of the changes that these patches make:
 1. Move HVF memory-related functions and codes into a new file
    hvf-mem.c
 2. Simplify the logics of adding and removing memory regions in HVF
    memory listener
 3. Fix HVF dirty-tracking logics for both Intel and Apple Silicon Macs
 4. Use GTree and dynamically-allocated structures to store HVF memory
    slots instead of fixed-size arrays. This makes memory slots more
    scalable. It is inspired by the recent changes in Linux kernel
    (v5.17) that use red-black trees instead of arrays to store
    in-kernel KVM memory slots.
 5. Add a lock to protect the data structures of HVF memory slots

Patches have been tested on Apple Silicon Macs and Intel Macs.

Yan-Jie Wang (9):
  hvf: move memory related functions from hvf-accel-ops.c to hvf-mem.c
  hvf: simplify data structures and codes of memory related functions
  hvf: use correct data types for addresses in memory related functions
  hvf: rename struct hvf_slot to HVFSlot
  hvf: fix memory dirty-tracking
  hvf: add a lock for memory related functions
  hvf: use GTree to store memory slots instead of fixed-size array
  hvf: only consider directly writeable memory regions for
    dirty-tracking
  hvf: remove the need to lookup memory slots when clearing dirty-bits

 accel/hvf/hvf-accel-ops.c | 221 +-----------------------
 accel/hvf/hvf-mem.c       | 343 ++++++++++++++++++++++++++++++++++++++
 accel/hvf/meson.build     |   1 +
 include/sysemu/hvf_int.h  |  18 +-
 target/arm/hvf/hvf.c      |   5 +
 target/i386/hvf/hvf.c     |  25 +--
 6 files changed, 359 insertions(+), 254 deletions(-)
 create mode 100644 accel/hvf/hvf-mem.c

-- 
2.32.0 (Apple Git-132)


