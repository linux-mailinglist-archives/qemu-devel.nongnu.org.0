Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429374B0EDF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 14:32:24 +0100 (CET)
Received: from localhost ([::1]:53612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI9Yd-0002Bh-Bq
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 08:32:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI8eK-0002H1-Ke
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:34:16 -0500
Received: from [2607:f8b0:4864:20::629] (port=40714
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI8eI-0004uc-G6
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:34:12 -0500
Received: by mail-pl1-x629.google.com with SMTP id y17so1690991plg.7
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 04:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ZHvwK76AXeDFLae8v7VIk0UwKqCdHVFdpkz56Zp3hU=;
 b=NleMWTQG3Td4i+fwuE7NYKWM/MSWBGBnfaa8uI8UNVPMwjsbtvhg5JVTqcP2H0QPrl
 Z+DgLjKuW/weoOeWrg+tzUH3ooi5gkl+muwwGWJm5A9C078OtemPd5PSrHRnD7PSxF3f
 cJaUHe+860YLB7530+AzZEq3NymBNu/DgtUzb1VdPLeZbjkPKz2UEAPMFPrD7a7L6fqL
 zEXMEHwaU818h2MXV/pLd41imuh4KMeovxUD4PYM8vQJ0swRvT0Ot7LobfzoC1WjQvb5
 i7bHnBdTO2o3wxGVBjftSptLuHvWBwJUewPpqmgPCeUzHs9l1UEmU+6b8McXrljyBpUB
 o2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ZHvwK76AXeDFLae8v7VIk0UwKqCdHVFdpkz56Zp3hU=;
 b=y6QPnJk0PMPrIyzgGVer39qNKPmoFfhxRA2J8fZD51oRboxxMgX2uF7pLrJoteMjE9
 49lCJIidrXEl7WZsyj0H2hXVCLr6Bro+qSvZDO9ptpwj6JBNrghZ1l4GL6g7/sWbbytK
 2w+QBWMiycg+HzMfyLcOW+BKJDQUtyqrPEUMjp8ugHcgP7jqZxp7qchxr1CpnqFSyY33
 Sv9KoSlnn50JlbiVrbpfLrSkUVzZgQPZ/ruXHgTYLu4aoVLeuHRcZH5ShK1jK5P8r+eS
 UoJ6Ik6+BqSQOU20TMAw28vXUgs8gEPiEmhWm+Zk7MHN8jJwLKd0c6in4y0WAz1NcKEh
 GeWQ==
X-Gm-Message-State: AOAM531dVI/5ch2MX6fGHauqwi0tYGmpQ4s/iqnDNJ73YD7Rz6FDUALm
 RNKnkGJ34A/Da0LJuYp56AG+Q/NF+zp5kQ==
X-Google-Smtp-Source: ABdhPJyACBgRKONetoox7NnSScGjSXocQN4PCVmd+5JbID4UcKec8yPjBfhBHHK4o31b7JgmYtCxcw==
X-Received: by 2002:a17:902:8d91:: with SMTP id
 v17mr7220156plo.154.1644496448517; 
 Thu, 10 Feb 2022 04:34:08 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id h5sm24367127pfi.111.2022.02.10.04.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 04:34:07 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/4] OpenRISC Device Tree Support
Date: Thu, 10 Feb 2022 21:33:59 +0900
Message-Id: <20220210123403.2059926-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Stafford Horne <shorne@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes since v1:
 - Fixed typos pointed out by Philippe
 - Moved usage of machine state to patch 3/4
 - added config dependency on FDT

This series adds device tree support for the OpenRISC SIM hardware.

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

Stafford Horne (4):
  hw/openrisc/openrisc_sim: Create machine state for or1ksim
  hw/openrisc/openrisc_sim: Parameterize initialization
  hw/openrisc/openrisc_sim; Add support for loading a device tree
  hw/openrisc/openrisc_sim: Add support for initrd loading

 configs/targets/or1k-softmmu.mak |   1 +
 hw/openrisc/openrisc_sim.c       | 261 +++++++++++++++++++++++++++++--
 2 files changed, 248 insertions(+), 14 deletions(-)

-- 
2.31.1


