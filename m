Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA2A3462D1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:28:33 +0100 (CET)
Received: from localhost ([::1]:36522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOixM-0004Ii-Jq
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOit1-00080g-DV
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:24:08 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOisz-00053Q-5S
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:24:03 -0400
Received: by mail-ej1-x62f.google.com with SMTP id l4so27739896ejc.10
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 08:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=LAVh0+jK9fBscsqhhnpVCGXSOIAZAbmseSFkMjhwLBE=;
 b=H7YKRnRYGc4ax4MVwyKvPQCC24XRV5SlC1Z6Tne+u1RMcCdb04I9TT9A4/tVtz3xp/
 UF7ZKQf+N3gUSjn88xClPn6uPmjeH99GkPWQ7JOT4JmdWgKK4giUwagFQQENodMkuumr
 qGsq8nmstMF0vjPHhbMUtHLxmOD/iCCXhn3Z4zKggVRZV/V/hpRnI77BbFCI3WCK234W
 FvcTTHnn4uTdKpU4Yre1973EdZhCsiDGV+1eC8BF9XdC+daGAju1t1hMqwzdt/9lcrFw
 eynwv0gq9alQRosGLq7RzFwlV6rPRFiSZopAzYpfDZ1pE4zciF7hXSxdYWMXqzZX3mGL
 AmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=LAVh0+jK9fBscsqhhnpVCGXSOIAZAbmseSFkMjhwLBE=;
 b=dD9eQt44PspM9xYLGWmYiMtnzb+S21xNgzdgM2jw//AnvbXakOJxzMqm+NF3cgE9f4
 ra+nHh0h9uzEbr6lyzmpUj6W8nGMdbUQD0vyk2xYRyy5Tf03Pgzp6MRT6Cbo2vDByn2Y
 LP3+3MzO791B8YwEe5LGipFQ4AswP5W9/PfzqHud11kesojHIXzRjsv1flYhZoBR0q6h
 5wGFzFrPY1syNMhSMKHQRUsG/48a52HbD6HOmRZ/d/n/adkK6ZFg0r6Bl+TCqBwUrCN9
 Zt42ZrnG5tXHzEfMWbPnUngzpJRG4jpBvBhE3xlzbHqbJ/fWG8h3hOxRY+G0p67ipS7r
 9HlQ==
X-Gm-Message-State: AOAM532M62OwKnm7MDFY9dbscfvKMAZg5mdSqeRN09cTCSlMB0myHIpS
 n/9cVbvStsSm6UrbffHGJwlGc5XZyQg8Yvo9qVfz9e1abQvtQ9aT
X-Google-Smtp-Source: ABdhPJyRhe6Y6u4X9Vig4zn2Ggd26UZb2H8Blke5i+f4Y6RNUxTAOBksUf2tqdWMidH0/3d/WfgVaIYLHmtj+//wPPk=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr2354995ejh.4.1616513039351; 
 Tue, 23 Mar 2021 08:23:59 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 15:23:30 +0000
Message-ID: <CAFEAcA_j3iBiwxNCN7AdDUv6rTGTn_gAzQ9E-h2dG9bmk3ez_g@mail.gmail.com>
Subject: 'make check-acceptance' odd error: "'bytes' object has no attribute
 'encode'"
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I just got this running 'make check-acceptance': does it
ring a bell with anybody?

[etc]
Fetching asset from
tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips64el_malta_5KEc_cpio
Fetching asset from
tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips64el_malta_5KEc_cpio
Fetching asset from
tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips_malta32el_nanomips_4k
Fetching asset from
tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips_malta32el_nanomips_16k_up
Fetching asset from
tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips_malta32el_nanomips_64k_dbg
Fetching asset from
tests/acceptance/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt
Fetching asset from
tests/acceptance/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl
Error running method "pre_tests" of plugin "fetchasset": 'bytes'
object has no attribute 'encode'
JOB ID     : 71b2d5569d9ccc8b68957d3ad2b2026bea437d66
JOB LOG    : /home/petmay01/linaro/qemu-from-laptop/qemu/build/clang/tests/results/job-2021-03-23T15.09-71b2d55/job.log
 (001/142) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg:
PASS (465.84 s)
 (002/142) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_kvm:
PASS (27.46 s)
 (003/142) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg:
PASS (99.43 s)
[etc]

thanks
-- PMM

