Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFF93CEB74
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 21:52:05 +0200 (CEST)
Received: from localhost ([::1]:46082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZJ6-0006bN-Tz
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 15:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5ZHF-0004UI-6X
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:50:09 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:39870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5ZHC-0006dF-QK
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:50:08 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso161537wmh.4
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 12:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yTWBsWgu7X1cy2vSYGJXNuPBqG/t0meYaEzPhN5Sxsc=;
 b=U4FAs5PXie7/iu204AsCkMEu05a3WfQf/1RX5QG9ep6ZsF1PzAVB3i1l/Hh6KYC11z
 MPwvjblDm1HZzs7D9xQaITva6xRpcK4P/53s+IszYiy2SxOxN7sRSo1UieMJOMFQCzUe
 yVZIg9TtcUJ2qJ6a5a/uXvWo4/PROjyisehgQCeD4sk8T+QOqfr3NuBX97WZXr/DMO6U
 tMYg6MTO4yPzN35APcDQl5swOfgSAboT8UKo4PnhP2J//XjeXVFQG6C5Y8uPY5/JluzJ
 A76x8lWnRDCOGe8TABUKof/VNuBS5lwfK8Qf4ZXm8I24NaENfEL8ZmMmCozQvDUiEYgr
 xLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yTWBsWgu7X1cy2vSYGJXNuPBqG/t0meYaEzPhN5Sxsc=;
 b=ZiN1SXVNuRWqeDC/qchwmp0IjqhzCPkaabffMV7tOK5RPkebEoG+susWfG0/SHbGY3
 /G2bHK0PMaRcBWaopK9XcgazFe61lbG8OSd0FJdbBsPRFHk47nSTxCJ4pRSObOwfLvkj
 zFbmpF4Z9m5nyD1abcjnXXtsywj6gaXpAQEkwji0N4fcRu4QcYMG0Wc8/2CdledzW3gY
 nHNIZSYE2ysIEwtwWPJ8qdf62vPVpNcYM38KVAYpEO+aHahetX/GanE+yLjhssd+A6i9
 +3v9bgALe2jRVCcCIhKxqDg6rR4kmB5MbzaLSv0lXeeoxjnyviffEVSDtWLmfyNiGWYo
 NW0A==
X-Gm-Message-State: AOAM531+DCBk7balOmNrtpwIoOYIA4QUYxPH3wJ/QpzrNWTMmCH079r+
 /7KehT1g9diZycaEZaz2u4ri2w==
X-Google-Smtp-Source: ABdhPJx0rSwcn6teIlSKLBCC1/M1st7VyD0KpU1vidWcezSPclbDUd/9F5PKYiob6WT9Q2Q640PybA==
X-Received: by 2002:a7b:c452:: with SMTP id l18mr33407601wmi.164.1626724205269; 
 Mon, 19 Jul 2021 12:50:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d15sm21471955wri.39.2021.07.19.12.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 12:50:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 05FC71FF7E;
 Mon, 19 Jul 2021 20:50:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.1 v1 0/2] tricore fixes
Date: Mon, 19 Jul 2021 20:50:00 +0100
Message-Id: <20210719195002.6753-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

This fixes check-tcg for tricore and adds a test to the gitlab matrix
so we don't miss it breaking again.

Please review:

 - gitlab: enable a very minimal build with the tricore container
 - hw/tricore: fix inclusion of tricore_testboard


Alex Bennée (2):
  hw/tricore: fix inclusion of tricore_testboard
  gitlab: enable a very minimal build with the tricore container

 configs/devices/tricore-softmmu/default.mak   |  1 +
 .gitlab-ci.d/buildtest.yml                    | 11 +++++
 hw/tricore/Kconfig                            |  3 +-
 hw/tricore/meson.build                        |  4 +-
 .../dockerfiles/debian-tricore-cross.docker   | 48 +++++++++++++++++--
 5 files changed, 58 insertions(+), 9 deletions(-)

-- 
2.32.0.264.g75ae10bc75


