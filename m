Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FD14BC61E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 07:57:15 +0100 (CET)
Received: from localhost ([::1]:42986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLJgA-0001Tt-PL
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 01:57:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nLJTA-0006j7-Cy
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 01:43:48 -0500
Received: from [2607:f8b0:4864:20::531] (port=37857
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nLJRx-0007VM-Pc
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 01:43:42 -0500
Received: by mail-pg1-x531.google.com with SMTP id 75so9695729pgb.4
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 22:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YSDnws2jtvwOsh/6+WQ4L7j5CJeYUgtHCT0IriW0joE=;
 b=p2lHD8rRIhSYRp5/qFn35MeJHCJXNf6Z52YmFWHytj8rcu8znsKmzip1Nr5VBrLeMB
 yhj68wfunyKZufa642B58vBJUuTqT6h/cLoawXhBU7gEexaDvTrv1HVH/HdUg/R1t5rc
 KNdl4SOTN069zIn/DXuW2EuzWF//NkiTLiclYCsMFRVMKbcasEXV1ynRYCdFJlGRPR6A
 GaCu3C6Ni9e3tvsle0qlLfzut2PM5OlSRHIL/MT3dqlPhjlmHs7k+o4q7jftHHxe0JQv
 xD+2E6ub7+8pzyc96bK/iUIMrfK4siD2d/XZ1c3JJ8n9jGwMNgASBDPcVS8IJiBO7Qyi
 694w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YSDnws2jtvwOsh/6+WQ4L7j5CJeYUgtHCT0IriW0joE=;
 b=mJ2LavgTmIXTnbiWErUMMRJ5t8u3x1dJcTowkTemaseehs+P8+QijrC1r9b5ODY+NP
 8HxndxLZKBtcHZDSTDyKPtefyui4XjhR31xx6ognwooWAzS1fJBcap1RRIOkl7fRr+Up
 YKAej6Z87PyB/vQ6BBm++olcy89bO2PxebQzEeMsvymEGXG/7nig4QYttKXrapf/8Cbr
 CIcvwrkMZf/ZrZ+JLtCNNkqJ5iyCiDDc/8T+cpePtI4fxUSMGdE9LQlDDUO8EAyBAa2N
 KF3OTBzYVseGcTlYpZZJzMrIkAqV3GdEf/CiJ6QA0BJpLTG49dUr9xJSIUE24JE9+4pb
 fULg==
X-Gm-Message-State: AOAM530B3Z26VsBsZU3lCYmmH14pKXytRJItGm/t5AsSiWmdsB0xRGLb
 L1IYfjTQE8BCPseyYwYvvDiZK7wPkHLUxw==
X-Google-Smtp-Source: ABdhPJzk6PHU2Z7NNq1sGcZm5Ckr6Oqfvc6l7HqtWXFboVMgi3sgQM2RGn033ZdwgKB4SNJuqGsDuw==
X-Received: by 2002:a05:6a00:1c4f:b0:4e1:5bc:e63a with SMTP id
 s15-20020a056a001c4f00b004e105bce63amr10834822pfw.53.1645252943605; 
 Fri, 18 Feb 2022 22:42:23 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id r12sm12652082pgn.6.2022.02.18.22.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 22:42:22 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PATCH v3 0/6] OpenRISC Device Tree Generation
Date: Sat, 19 Feb 2022 15:42:04 +0900
Message-Id: <20220219064210.3145381-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x531.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes since v2:
 - Fix description to say devicetree "generation" not "support"
 - Fix up various indentation issues.
 - Use HWADDR_PRIx string formatting.
 - Split device tree population out to device init.
 - Do not load device tree or initrd if we have no kernel.
 - Added patches to split uart initialization out to it's own function fix 2 CPU
   limit.

Changes since v1:
 - Fixed typos pointed out by Philippe
 - Moved usage of machine state to patch 3/4
 - added config dependency on FDT

This series adds device tree generation for the OpenRISC SIM hardware.

The simulator will generate an FDT and pass it to the kernel.

For example:
  qemu-system-or1k -cpu or1200 -M or1k-sim \
    -kernel /home/shorne/work/linux/vmlinux \
    -initrd /home/shorne/work/linux/initramfs.cpio.gz \
    -serial mon:stdio -nographic -gdb tcp::10001 -m 32

Using the linux kernel or1ksim_defconfig we can remove the built-in
dts and the kernel will boot as expected.  The real benefit here is
being able to specify an external initrd which qemu will load into
memory and the device tree will tell the kernel where to find it.

Tested this by booting single core and SMP kernels with 4x CPUs.

Stafford Horne (6):
  hw/openrisc/openrisc_sim: Create machine state for or1ksim
  hw/openrisc/openrisc_sim: Parameterize initialization
  hw/openrisc/openrisc_sim: Use IRQ splitter when connecting UART
  hw/openrisc/openrisc_sim: Increase max_cpus to 4
  hw/openrisc/openrisc_sim: Add automatic device tree generation
  hw/openrisc/openrisc_sim: Add support for initrd loading

 configs/targets/or1k-softmmu.mak |   1 +
 hw/openrisc/openrisc_sim.c       | 308 ++++++++++++++++++++++++++++---
 2 files changed, 285 insertions(+), 24 deletions(-)

-- 
2.31.1


