Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6234F6DDC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 00:36:27 +0200 (CEST)
Received: from localhost ([::1]:46040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncEGI-0004hV-4g
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 18:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hxVOYggKCgQ0ylesxwlksskpi.gsquiqy-hiziprsrkry.svk@flex--wuhaotsh.bounces.google.com>)
 id 1ncEEl-0002sp-Dg
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 18:34:51 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:34635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hxVOYggKCgQ0ylesxwlksskpi.gsquiqy-hiziprsrkry.svk@flex--wuhaotsh.bounces.google.com>)
 id 1ncEEj-0004VV-Su
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 18:34:51 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 d15-20020a170902cecf00b001565c6e4025so1803829plg.1
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 15:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=za+GIZQ1g+M8oIvy1mifuz9vQx1PyLnJAIldTNUuLEo=;
 b=AHpZdoFce/H6DS3k+znjCLT+08vzPPi7OemRgp2h/68oAszPTBOXkvX7WlnwSMSe3M
 OpaFsrLYiZe9KZ8t3nC7O79XQux6GAwnvtzJAHDdUo/JjnXfc6xjJ+8eSSmdTmO5tarl
 wdi1+NYI5ekZElnR0zJPoE0xJ3or3GcgSr5ZllrxV+ELk9MOnpeQWIl9QfFs+GHPWF7E
 Xavq7oKGwHO+uQEoHBgGMCw4V2lzLNAoOGKKgElyGh4jsXJaUvOGwf3TajdUNMSPPf+D
 bqsLNhg3bOP14/NJ1ovUC2C5odwkFZc7TBh75kIRrmMnenQejwa4gSIRyqtBQPVmxGcg
 pi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=za+GIZQ1g+M8oIvy1mifuz9vQx1PyLnJAIldTNUuLEo=;
 b=t/EN4SUDh8vu4IpCJRYx59ubGN6oclC2oulnaLOtiqo+PAUFsB0zDjJoMYyUPq6e5L
 b97NlaFObsIp6fLCja+v8Lt4OvouiYeDu4q1rZkr8HO20jmW4u8yWjCaniWXAzdLOJtO
 dMU81cH1sJtxe4rqxUZyri+8cpVaTgccpIecl94nrQTdP8DzLlZaoDAZY0mABnc9bq3X
 TbKy1hHbDjgdUkaoQwE5vg2O5Xt+TGpXBKZV01AA/Ch5PZJNUNi0pcKZkP9eMvADdMsd
 qBJzFNpDn9KTZNNeobRBcph6zof184Z+LQfsCDm55F/FKyPR2Fw/EZE29nnpexInnCyW
 SHtA==
X-Gm-Message-State: AOAM530F0GTIepoF2PR9VwIaMIAcrcxrz1XIx7RwUT6LNeI1lYrHqkn3
 XklIyR9YJn9Fbe8TEIivRIXnJzR9IohEVg==
X-Google-Smtp-Source: ABdhPJycesf12SNqnUhdKmBILIUelXr81O9eOTgk39X0Aw3TYZI1lhuu5rjT9GzUoshr0ns5iioh1Mk6QAgjVQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:db48:b0:1ca:ab67:d75 with SMTP id
 u8-20020a17090adb4800b001caab670d75mr213769pjx.1.1649284487440; Wed, 06 Apr
 2022 15:34:47 -0700 (PDT)
Date: Wed,  6 Apr 2022 15:34:38 -0700
Message-Id: <20220406223440.2901032-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH 0/2] Define NPCM7XX PWRON bit fields
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3hxVOYggKCgQ0ylesxwlksskpi.gsquiqy-hiziprsrkry.svk@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the PWRON STRAP values in NPCM7XX boards are magic
numbers. Similar to the aspeed ones in hw/arm/aspeed.c, we
define bit fields constants for them and use these fields instead
of the magic numbers in the current implementation. The code
should behave exactly the same as the existing one.

Hao Wu (2):
  hw/misc: Add PWRON STRAP bit fields in GCR module
  hw/arm: Use bit fields for NPCM7XX PWRON STRAPs

 hw/arm/npcm7xx_boards.c       | 24 +++++++++++++++++++-----
 include/hw/misc/npcm7xx_gcr.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 5 deletions(-)

-- 
2.35.1.1094.g7c7d902a7c-goog


