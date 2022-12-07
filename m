Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E4864607D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 18:43:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2yQL-0004bk-LL; Wed, 07 Dec 2022 12:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2yQK-0004bW-Fe
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 12:41:36 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2yQI-0001lG-Sf
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 12:41:36 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d1so29094439wrs.12
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 09:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FreQweA8lWnxlMBYTOR6YrpxMa+butBNui3VmthXE/Q=;
 b=y7vvmou3PJyn2pCFR9t0wToMnv2JTkd2HLJJmQ2iE+iG/ggB1ESD0wS3loX63FeM6Y
 0spbyX85VP6Vw6K/t6UxuyotZNAbf+P26ytFbD2i2fF4nfxyBQz+uyDNZw8vxjnEJk+E
 J1pysJuszsQV2tuf0xpBq+C0TR1tH8QDVpFLU3oInDbNyl8PA4j3T8jm62O2ehRkQAx5
 NoBflI02McNdQGQuI7jalVN6oc3mS8q7p1iTp4e4pbzLvtEHZdyrf8Rnr1S0MFMoXktP
 lko0KjYJXHHub3dbTBqqyYdUbxe1Cq7G33bfyjaPZpZIxtj4t7DngjqmGTRQxFBYQyuE
 b0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FreQweA8lWnxlMBYTOR6YrpxMa+butBNui3VmthXE/Q=;
 b=HW/W5mKgzE/VOIjHOZ2EE5JFy6D54d1LVPvAk47l5f47hOp583VkRIYtsJxRJdFEBL
 +PC+3GbjK9ZAUuJbtyZQYqc3OoyclehcdD6eBSaO5mMVODW2jynAIygAG9KQGrKcQM8h
 2gl8ecOUT/0y0Lnqkse+IRzn71Y0oz4g2wJm+q5qpneYqLI9Q+LmQ+ehjAsJ+2GfWzgb
 1NziERFnUV/8sZIgAyev76Gce+M7Me09eiYPalukEEvWRbSa5f56kQPgtwgKxsjsUsL3
 /+EU+Ktel9T8YDX6+10h9+IAmQystUgQj7pgrX/LcNSvV5mtTHWAfCfo+tDgCmnLRLbA
 +ryg==
X-Gm-Message-State: ANoB5plHLtZ4m2tiltISMuIPhPeMT5jwM/pfCpFysyBOqG1bCWs/OK7s
 fZ4/7bwm4V7HpQxGlEooX81I6hPPXt7/BRRVAq4=
X-Google-Smtp-Source: AA0mqf6zTSCADcHeVLuczU42BbKGU0C4dHGJ22VNN3NpzQY7UtHMw9ZsjXOpyhlm9EJxPCqxvpHQLw==
X-Received: by 2002:adf:ee0f:0:b0:242:17c7:d98d with SMTP id
 y15-20020adfee0f000000b0024217c7d98dmr26474341wrn.87.1670434892760; 
 Wed, 07 Dec 2022 09:41:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 az40-20020a05600c602800b003d1e1f421bfsm2537738wmb.10.2022.12.07.09.41.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 07 Dec 2022 09:41:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marek Vasut <marex@denx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Greg Kurz <groug@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Anton Johansson <anjo@rev.ng>,
 qemu-ppc@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH-for-8.0 0/4] target/cpu: System/User cleanups around
 hwaddr/vaddr
Date: Wed,  7 Dec 2022 18:41:25 +0100
Message-Id: <20221207174129.77593-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We are not supposed to use hwaddr on user emulation.

This series is a - trivial - preparatory cleanup before
few refactors to isolate further System vs User code.

Philippe Mathieu-Daudé (4):
  cputlb: Restrict SavedIOTLB to system emulation
  gdbstub: Use vaddr type for generic insert/remove_breakpoint() API
  target/cpu: Restrict cpu_get_phys_page_debug() handlers to sysemu
  target/sparc: Cleanup around sparc_cpu_do_unaligned_access()

 accel/tcg/cputlb.c         | 4 ++--
 gdbstub/internals.h        | 6 ++++--
 include/hw/core/cpu.h      | 6 ++++--
 include/sysemu/accel-ops.h | 6 +++---
 target/alpha/cpu.h         | 2 +-
 target/cris/cpu.h          | 3 +--
 target/hppa/cpu.h          | 2 +-
 target/m68k/cpu.h          | 2 +-
 target/nios2/cpu.h         | 2 +-
 target/openrisc/cpu.h      | 3 ++-
 target/ppc/cpu.h           | 2 +-
 target/rx/cpu.h            | 2 +-
 target/rx/helper.c         | 4 ++--
 target/sh4/cpu.h           | 2 +-
 target/sparc/cpu.h         | 3 ++-
 target/sparc/mmu_helper.c  | 2 --
 target/xtensa/cpu.h        | 2 +-
 17 files changed, 28 insertions(+), 25 deletions(-)

-- 
2.38.1


