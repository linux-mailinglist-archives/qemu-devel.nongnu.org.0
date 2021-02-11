Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F5E3190E8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:22:59 +0100 (CET)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFgA-0007Im-8l
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:22:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAFd9-0005To-QO
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:19:51 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAFd8-0005B7-3A
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:19:51 -0500
Received: by mail-wm1-x32e.google.com with SMTP id o15so4456801wmq.5
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 09:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TL6W7d73N3GCIvRIjYMLyXwnB4yeGf0qOX3lyLDdBu4=;
 b=EhrJgNj+rqe4e0/GVhKmxbOe9lxjJ5L9gjz6PiG8j0QQosmYD466hhVvdnX85G7hwU
 Z6S/GHysPn7kLK8NIPDdtl891EDpm9PBagn2RJYeua6mDmOCslp75bzwJnr6pFkIvQos
 UjAEUORUnOfUG6SX/aSEY5DRGnmXchX5AJ2gB/vvXHr0hxjKrVKoti7/Q2wDrKu/727f
 +Hpsy8L9K7OaAaQiLMglrF15jw+craZ4ZnAIzVJ30rZTxvCerYpw/crrxiuuYAt6z6Mq
 ZcJcp1ub2AFd0shcMC+tcqOJWPRAxc+aFSejPyy2kb9SmauIIOY8CzdQK6ZDCG9hk3UO
 JmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TL6W7d73N3GCIvRIjYMLyXwnB4yeGf0qOX3lyLDdBu4=;
 b=pYoa2wdQbOkL8w5uhUlJ+Sm++oE160PIOStW6lgyIGGweE24wO0XfTKSzpW0nAV7d5
 CFxu2STjCU9H8gPLVLgAOHcZCuKRA7AfmqOlkBTJwAkYZBAn0nPQBCyimCJ4WMc5T0cH
 fFB8uDYDwy1XkuteIYrg5ZWzJAYjfxBQkV95LMfzZfYSgHsuzNH/Hm8btFyLf/V2U2i5
 cG/RtGAqRF+cEiZKgBl8t3nEe2HoUoljWSknkK2xPqxq/sxi7AxbkFfOQr6QCsv9mHST
 EaUhYvfWBzGQmZe6erlHuTKO8E0GiwIfh2nZYPPQ4LbQagxdM5lOvXvODkn7Xtk+Sz9/
 wlEg==
X-Gm-Message-State: AOAM532/EfkdRLw5FlX/77Hh9jYlEbQsKFu32t5DBRWpl6DNzh5Ulfhz
 /GRfFq86TmdP3yJ7WGGarCN2Qw==
X-Google-Smtp-Source: ABdhPJwfc92IAQZFHyt9zLftcVjQAQ6qq5klu9mtEeWvx9NXaKZ4BhyBwZ597NnKMkWsjqRkB3sJaw==
X-Received: by 2002:a05:600c:41d6:: with SMTP id
 t22mr6094059wmh.74.1613063988088; 
 Thu, 11 Feb 2021 09:19:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z5sm116078wrn.15.2021.02.11.09.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 09:19:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0EE761FF7E;
 Thu, 11 Feb 2021 17:19:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 0/7] Xen guest loader (to boot Xen+Kernel under TCG)
Date: Thu, 11 Feb 2021 17:19:38 +0000
Message-Id: <20210211171945.18313-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

These patches have been sitting around as part of a larger series to
improve the support of Xen on AArch64. The second part of the work is
currently awaiting other re-factoring and build work to go in to make
the building of a pure-Xen capable QEMU easier. As that might take
some time and these patches are essentially ready I thought I'd best
push for merging them.

There are no fundamental changes since the last revision. I've
addressed most of the comments although I haven't expanded the use of
the global *fdt to other device models. I figured that work could be
done as and when models have support for type-1 hypervisors.

I have added some documentation to describe the feature and added an
acceptance tests which checks the various versions of Xen can boot.
The only minor wrinkle is using a custom compiled Linux kernel due to
missing support in the distro kernels. If anyone can suggest a distro
which is currently well supported for Xen on AArch64 I can update the
test.

The following patches still need review:

 - tests/avocado: add boot_xen tests
 - docs: add some documentation for the guest-loader
 - docs: move generic-loader documentation into the main manual
 - hw/core: implement a guest-loader to support static hypervisor guests

Alex Bennée (7):
  hw/board: promote fdt from ARM VirtMachineState to MachineState
  hw/riscv: migrate fdt field to generic MachineState
  device_tree: add qemu_fdt_setprop_string_array helper
  hw/core: implement a guest-loader to support static hypervisor guests
  docs: move generic-loader documentation into the main manual
  docs: add some documentation for the guest-loader
  tests/avocado: add boot_xen tests

 docs/generic-loader.txt        |  92 ---------
 docs/system/generic-loader.rst | 117 +++++++++++
 docs/system/guest-loader.rst   |  54 +++++
 docs/system/index.rst          |   2 +
 hw/core/guest-loader.h         |  34 ++++
 include/hw/arm/virt.h          |   1 -
 include/hw/boards.h            |   1 +
 include/hw/riscv/virt.h        |   1 -
 include/sysemu/device_tree.h   |  17 ++
 hw/arm/virt.c                  | 356 +++++++++++++++++----------------
 hw/core/guest-loader.c         | 145 ++++++++++++++
 hw/riscv/virt.c                |  20 +-
 softmmu/device_tree.c          |  26 +++
 MAINTAINERS                    |   9 +-
 hw/core/meson.build            |   2 +
 tests/acceptance/boot_xen.py   | 117 +++++++++++
 16 files changed, 718 insertions(+), 276 deletions(-)
 delete mode 100644 docs/generic-loader.txt
 create mode 100644 docs/system/generic-loader.rst
 create mode 100644 docs/system/guest-loader.rst
 create mode 100644 hw/core/guest-loader.h
 create mode 100644 hw/core/guest-loader.c
 create mode 100644 tests/acceptance/boot_xen.py

-- 
2.20.1


