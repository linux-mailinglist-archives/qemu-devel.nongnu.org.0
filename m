Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207243BEFD1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 20:49:20 +0200 (CEST)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Cbm-0002ur-N1
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 14:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1CYW-0007VD-Jm
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 14:46:00 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1CYT-0000mH-W9
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 14:45:55 -0400
Received: by mail-wr1-x430.google.com with SMTP id f17so4206771wrt.6
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 11:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=56gR6h+g7L9H2037HDJ+qXb8Zxz+C++a+ARB8leo2t8=;
 b=MQnz+D6X715nGWsTdJ3yyKL9Ucv9krTZOc5vvIDI0yuVahre6bDRPVUrJREFpljurF
 /VvqptO76O35BY6n6OiOQj+CXTQLKpKn0IB+TAp/D7eTj1/GYHvLxCuInbSXrouZn3lr
 lmbLIZnQiBxv3w1KhjKeOseH1Je8c6q1Ni9+VK8xgGhccvxlU5Lw2ti5VPag3tVJJ8DZ
 ABdyGGDv2wd3MR35bE0kYwfaEVFW2NbV9oncqdgHwCdGTizUlJK0+aU8rx28GlqfIiGN
 9JV0twkZPryPQqbstR2HZqzzq25oy1K+gV5y/IZBWlR/kgmhN90CZZawfX3DXK47uQid
 owlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=56gR6h+g7L9H2037HDJ+qXb8Zxz+C++a+ARB8leo2t8=;
 b=CFyyVcu5xQ+Fh/+11LbNUKVQwqjv9ivOBFfgo3uDvd+BmNOC3esMishVYAwP52Z2eJ
 8LSCASzxeoBM6jTPqyAqzg/M5zOoUPMDHg1p6QHWBm39sVABw7BRX3t1OKzJqYnnlJY2
 a4+z0krSKW8xmJZKB0UtXkHRKO4MwfuJbq69n5ph24OlbaryqnJVkic/8H5faIGuG5a5
 RYdakiKp5TwTOyAMB5yORKJ6phR4744v4L5r+Y0QlKDq/rJE13H/lPKAV62nVEpcsWcF
 V0CzBKW/BGgiw49FaWSutmJK5o8R4V9tYaEcgYdiEpDW9wXK7/klsPZHXoWTxShM7g+W
 AErw==
X-Gm-Message-State: AOAM532LwDRt7GgtYDnYdhupA9XFx4IyyAHQWhQcOh5DCGHvpSLK6sYl
 IMcKzS7tlu3yO5jcfh7WD42+dQ==
X-Google-Smtp-Source: ABdhPJy6rB9nuzZ54D/9kmccGVnIIUc+xeqkvp8tRVpOOXqW4tfgvjZBpTFrgXdgbqzubWN1IxLo/g==
X-Received: by 2002:a5d:4e05:: with SMTP id p5mr2227209wrt.322.1625683550839; 
 Wed, 07 Jul 2021 11:45:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n5sm12461821wri.31.2021.07.07.11.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 11:45:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 389951FF7E;
 Wed,  7 Jul 2021 19:45:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/2] some device emulation documentation cleanup
Date: Wed,  7 Jul 2021 19:45:47 +0100
Message-Id: <20210707184549.24436-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series attempts to improve our documentation by:

  - grouping various device emulation documentation in one place
  - writing a preamble that explains concepts
  - writing a section on vhost-user

Alex Bennée (2):
  docs: collect the disparate device emulation docs into one section
  docs: add a section on the generalities of vhost-user

 docs/interop/vhost-user.rst               |  4 +-
 docs/system/device-emulation.rst          | 79 +++++++++++++++++++++++
 docs/system/{ => devices}/ivshmem.rst     |  0
 docs/system/{ => devices}/net.rst         |  0
 docs/system/{ => devices}/nvme.rst        |  0
 docs/system/{ => devices}/usb.rst         |  0
 docs/system/devices/vhost-user.rst        | 57 ++++++++++++++++
 docs/system/{ => devices}/virtio-pmem.rst |  0
 docs/system/index.rst                     |  6 +-
 9 files changed, 140 insertions(+), 6 deletions(-)
 create mode 100644 docs/system/device-emulation.rst
 rename docs/system/{ => devices}/ivshmem.rst (100%)
 rename docs/system/{ => devices}/net.rst (100%)
 rename docs/system/{ => devices}/nvme.rst (100%)
 rename docs/system/{ => devices}/usb.rst (100%)
 create mode 100644 docs/system/devices/vhost-user.rst
 rename docs/system/{ => devices}/virtio-pmem.rst (100%)

-- 
2.20.1


