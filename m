Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6134665D48D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 14:41:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD3zj-0003e6-IH; Wed, 04 Jan 2023 08:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD3zh-0003bx-5T
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:39:49 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD3ze-0001Ta-DL
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:39:48 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso26473752wmb.0
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 05:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2gOBY7PKd+CZs4UqengBISqvRx3cfdqmRUdbKw78GGc=;
 b=oyJZwII4s3z8eLEOLRo4hglu9gUyE03r5nK1MT0lt4pP4jwRc6IAaL1o0g7HtWzP1j
 XZkwo1oOVguG/QTkDI/ZTrZZHW/Sn4lhOJ41oobgPJOW/Hzh0YMQcjC0myPMhke85QQc
 YmLzQhD9mTkFVPfIbhV/w2DdD83+URZ6J6yjtI5qdc/f647AEhKKs9OllUaJfT4KbPrw
 ttcbTZjXa60ixhuZgkOd6uAQl+VUbGEs5Aowkm/8LPMjNNDtlaz5zW+qXvtR+uRRvgxz
 GITeqHznP3kvZpGvRvlPnNUtaFZAyRL3uRWVfDl6LOmfugEkSXcTP/jxEgYm5CG+ZLgw
 c7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2gOBY7PKd+CZs4UqengBISqvRx3cfdqmRUdbKw78GGc=;
 b=OIXHmU6Z50EgkvB0Nw+AxTqGgcVvYKHCp0JZy2IV4Wt3+DO0IqfFeSCJXQpG6eahm/
 FCdWykwuPREhpaJjmI3SJxw+IT/h46WlvARqC7JJ8a6AhQQ1jz2Qmtq2Og2DgzpWaaJ/
 52K3et038r/oy9NswhePrY4ahiMUXhZW8a4lsYwMI35AqKB4tvAJkKOtlisLzj4nLcn6
 TQT5K0N/DGG5bDL9NtOkam7DkDOvcW8osuuBrsCAnzn+38qXlFHbBIEMxWmL4HTHiAr3
 9HqTJO9QCKl9rMCZKr790wpsc2cwwFamuJ0ghNKIs8uqOhB27r4VjGVfEZI2azguLBo2
 AJ3g==
X-Gm-Message-State: AFqh2kqDaBLHpRnUqLBh24GDV8zF0msinQSe/XkrViWMshaPJgmoBLBl
 3DeqWso3Psjfkt50vJBMmxFNe7B8LveEU5cC
X-Google-Smtp-Source: AMrXdXuKBa79KuSeHt5XJH7zcutpZBqlxJ2EWe3GuuRyy0EQd9QDSYKUY1fJHznjOHGpJmqJLjgXEg==
X-Received: by 2002:a05:600c:a51:b0:3d2:3376:6f38 with SMTP id
 c17-20020a05600c0a5100b003d233766f38mr32700956wmq.20.1672839577984; 
 Wed, 04 Jan 2023 05:39:37 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a1c7207000000b003cf6a55d8e8sm44843769wmc.7.2023.01.04.05.39.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 05:39:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/6] hw/mips/gt64xxx_pci: Fix endianness swap on big-endian
 hosts
Date: Wed,  4 Jan 2023 14:39:29 +0100
Message-Id: <20230104133935.4639-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

While working on endianness consolidation I figured
a long-standing bug in the GT64120 while accessing
PCI config/data registers from the CPU bus (via the
ISD).
While the debugging was painful, the fix is quite
easy: simply use the endianness MemoryRegionOps
provided by the abstract PCI_HOST_BRIDGE class.

Patches 1-3 were useful while debugging.
patch 5 is the fix and patch 6 add a test to keep
testing on BE hosts.

Philippe Mathieu-Daudé (6):
  hw/pci/pci_host: Trace config accesses on unexisting functions
  hw/mips/malta: Split FPGA LEDs/ASCII display updates
  hw/mips/malta: Trace FPGA LEDs/ASCII display updates
  hw/mips/gt64xxx_pci: Accumulate address space changes
  hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps
  tests/avocado: Add tests booting YAMON ROM on MIPS Malta machines

 hw/mips/gt64xxx_pci.c               | 78 +++++++++++++++++++++--------
 hw/mips/malta.c                     | 16 ++++--
 hw/mips/trace-events                |  4 ++
 hw/pci/pci_host.c                   |  6 +++
 tests/avocado/machine_mips_malta.py | 52 +++++++++++++++++--
 5 files changed, 127 insertions(+), 29 deletions(-)

-- 
2.38.1


