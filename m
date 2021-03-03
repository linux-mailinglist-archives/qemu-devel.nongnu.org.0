Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4088D32B97E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 18:38:32 +0100 (CET)
Received: from localhost ([::1]:47206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHVSA-0001VH-NU
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 12:38:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHVQW-0008MW-5s
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:36:48 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHVQU-0002na-E8
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:36:47 -0500
Received: by mail-wr1-x430.google.com with SMTP id f12so20800625wrx.8
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 09:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tycmjp6CJiWbZvVw6Aok39MbRvYMS6RtER+7yrB8OAA=;
 b=YULpRfZUogvoBjS7IKX4NXSjOLdIbt0oqgCZlNxkM4Vg3XZlaR8yKSykZ2svwrC2gK
 cZBzTdpvGE/LjH2vM3J0GbKWBh+3LS1PpoVSLRkDHmg9jF4ZA1UCKSjacxnVFfSi51v5
 gFPktTEhl0kutYJSB5N2NU7vOTwPFMaLkm9zAM2yeR9xYVRhHWgRBrjFDB/jK+CLp4Gr
 HUiKolu2a9Oenj/glmKfavTIH+5Ge+nNJkq5/p/6y6Ih1Yyi/jJqRKrMkSLJ54Mz5u7F
 D8vVuB4geNcKyf98IjwqUKtmF+Gczsg0MPQtPyBHX1mJg2ZjNO24hj92ccgOELiWToY1
 yotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tycmjp6CJiWbZvVw6Aok39MbRvYMS6RtER+7yrB8OAA=;
 b=mn8de+/6wD3ItHJsR3MXe0+ZoaoWek3Iohp+U+ehYLrz+W1b+d1rQxkixQuXHK43es
 GcY13sIzhAWGQLdz5tkjB/qHy85AI5Zcx6SqTBYLE1FNjXEif6qljAzQSHPBFjk2Yjiw
 IDdorrdyjtpBpMPiGQSthnKGl5ZY+2J81/Po6ey9c2RpvgJ7PxptBhSvgE/NavW2Hgxh
 t4vyQ+/Wc/QcOq4xrY2CynjlLb0Cne3pIhbNlgKrnDVyzegumzHAR8i7s+FNGRq7jhQE
 MH8hmQrXDsWY6BOUydN5CNhtdqdCZmMmmAszKJ5bMaHTzFTqILNncxLoWOn3bv0mFhXe
 0B1g==
X-Gm-Message-State: AOAM532w/smkG8SDZ8Du0XKE+GbmXdfd1IB+ouGsJo4YVALIkPsjdIjr
 db/lanO4HEpCVTo3w/MWbbRDXw==
X-Google-Smtp-Source: ABdhPJxRUCcHeBftPQjidg5ANnhVVk7OaZCMfovO8zD1hlzAWv4XeFe4Or+MxE+8iGqAwrh754sPJA==
X-Received: by 2002:adf:ed46:: with SMTP id u6mr28044204wro.350.1614793004070; 
 Wed, 03 Mar 2021 09:36:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f14sm6528499wmf.7.2021.03.03.09.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:36:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4253E1FF7E;
 Wed,  3 Mar 2021 17:36:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 0/7] Xen guest-loader support, pre-PR
Date: Wed,  3 Mar 2021 17:36:35 +0000
Message-Id: <20210303173642.3805-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

Trying to get my ducks in a row for a merge of this before softfreeze
so this is my pre-PR posting of the Xen guest-loader support.
Everything apart from the loader itself is reviewed and given it's
been tested in other patches and I'm going to maintain it I don't see
a reason to hold it up from going in. However if you would like to
review it please do ;-)

The only real change is a tweak to the final patch where I've added a
stable archive URL for the Debian Xen packages.

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
 tests/acceptance/boot_xen.py   | 118 +++++++++++
 16 files changed, 719 insertions(+), 276 deletions(-)
 delete mode 100644 docs/generic-loader.txt
 create mode 100644 docs/system/generic-loader.rst
 create mode 100644 docs/system/guest-loader.rst
 create mode 100644 hw/core/guest-loader.h
 create mode 100644 hw/core/guest-loader.c
 create mode 100644 tests/acceptance/boot_xen.py

-- 
2.20.1


