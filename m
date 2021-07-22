Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8723D1E90
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 08:59:03 +0200 (CEST)
Received: from localhost ([::1]:57852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Sfe-00052e-D5
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 02:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6SbZ-0008QY-0N
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 02:54:49 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6SbW-0006sg-Sw
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 02:54:48 -0400
Received: by mail-wr1-x433.google.com with SMTP id f9so4695225wrq.11
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 23:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBJ16bHCrnVyEhPHs5VK7x6q41OYB5aC0xYBDEbNnZg=;
 b=rvHcoLq0+bJnw8jCub5OlX6bN19TsVmjhRk7sVT7L/B6lscFkgAOeMs50R3sh8dBCD
 2QNCLAeIQu8IhDUgct39xx8/HHHEw0xaQgDJq2+VvgV1kMw1at2Slv/hX0O3FMs4qVVO
 7TLoZ+i5pyNm0kNUIhIR+WqGpVf4qDxjk8ZzXhrENsLBf2X8+VDpBnfb60mxa42m6oGU
 773vltOEcL6CgQCejVf4QZYmjKdE0V9cwXvcgersSr1qTCJys5Gun6aalel7a07QDqdi
 akw4InLAKHQDrRy+VnG4NybsFTKxIuorDii+enF5OhWID7OROw4zA26Iws4kbkqZA6Id
 mpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBJ16bHCrnVyEhPHs5VK7x6q41OYB5aC0xYBDEbNnZg=;
 b=ARgL2oMqgBGbSEA+qOBaD7/QvGv3RfGMczRdXRNki+81s5Qg6WkGAoYfTgugU7QcaY
 ehk/u53YK7jRRNLPcnRKZlbxSHOZXsTIe1+AsXRJtTjs0FtOUHUkfFPnFObK05SVm8dq
 ZPp5Y/ra1yOZALeMflzhojkDP206KM2cK6mm4EGKVvwtNVY85ZyxqZN6wg+9H3vsHLAU
 eSLWe1+hNgdXacS7voqsSbJq8zkDV9cMmdDt6qlGQ3GwBdba67XXvh2QA/fA7rX6UjGL
 lAey6zeADkv7SQD/gdXm9pGNSVkGZh2yedeIGkbc5BJ39Irj7mrsGARA2QYcdI6Yo0n8
 +UiQ==
X-Gm-Message-State: AOAM532P+XEPatc7GM1UB479opoNQ54asLLZhhvU2zMHasu1MQ+LfnPK
 0cXC5aglQAVlgU2pAH7UUJGP4CqipPo=
X-Google-Smtp-Source: ABdhPJwFXx5vMj6ii/8flLgFXaLx6vCZPT7MxJUGeOAc+jHFAy/mgAfRgbBAhd8t/qGpG0IWqZ0nEQ==
X-Received: by 2002:adf:d1cf:: with SMTP id b15mr46432432wrd.93.1626936883198; 
 Wed, 21 Jul 2021 23:54:43 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id b16sm29245426wrw.46.2021.07.21.23.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 23:54:42 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] plugins/cache: multicore cache modelling and minor
 tweaks
Date: Thu, 22 Jul 2021 08:54:23 +0200
Message-Id: <20210722065428.134608-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This series introduce some minor improvements/bug fixes in the cache
plugins and multicore cache modelling.

Multi-core cache modelling is handled such that for full-system
emulation, a private L1 cache is maintained to each core available to
the system. For multi-threaded userspace emulation, a static number of
cores is maintained for the overall system, and every memory access go
through one of these, even if the number of fired threads is more than
that number.

Also, raising the levels of warnings induced some warnings, this is
fixed in it's own patch.

Patches that still need review (other patches are already queued):
    1. plugins/cache: Supported multicore cache modelling
    2. docs/devel/tcg-plugins: added cores arg to cache plugin

v2 -> v3:
    1. Included the link of the patch solving the race.
    2. Fixed the title so that the series appears in Patchew.

v1 -> v2:
    1. Dropped the patch with mitigating the use-after-free bug since
    it's not needed anymore (fixed by Alex Bennée here
    <20210720232703.10650-1-alex.bennee@linaro.org> with patch name:
        tcg/plugins: implement a qemu_plugin_user_exit helper)
    2. Summed cache performance data as a post-processing step.
    3. Refactored appending core data to it's own function

Mahmoud Mandour (5):
  plugins/cache: Fixed a bug with destroying FIFO metadata
  plugins/cache: limited the scope of a mutex lock
  plugins/cache: Supported multicore cache modelling
  docs/devel/tcg-plugins: added cores arg to cache plugin
  plugins/cache: Fixed "function decl. is not a prototype" warnings

 contrib/plugins/cache.c    | 165 ++++++++++++++++++++++++++++---------
 docs/devel/tcg-plugins.rst |  13 +--
 2 files changed, 132 insertions(+), 46 deletions(-)

-- 
2.25.1


