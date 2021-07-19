Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603713CEE8D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:50:01 +0200 (CEST)
Received: from localhost ([::1]:45638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5b9E-0007XN-Er
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5b7q-0005xG-Kv
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:48:34 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5b7p-0000ce-5j
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:48:34 -0400
Received: by mail-wr1-x429.google.com with SMTP id a13so23724442wrf.10
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FrMkITyjDzw2qZynqirGu2I6W70Yt+tOC+PpzAOekgA=;
 b=qLKc3d31+ijzfXBzs0pmNy9rKPaLhphBYxMpbL9jfgxJUSz5SsKOXR9Idy988NnLUs
 ThKzWk+mwygA7HJFQdt4QEYwErmr43ukPRlVagjyRr3hbWEIUI06EZ/1kqj4AI6Ip25p
 zS4tzrf45fRsFLApc/o5ba8I0SosXKu6qkjEwDqRDjtKwoy6cSdqvAQaWz00FqWOMyoC
 4ttBwFlToE6DwedRBDPHapLXSxGnsF7QY4jCKjEIsdACLy4t5LAQtoHyCTsHb7ycsD8B
 cISx3haZ/g3jPzvTMekyR+uEjsklKAsBMXiMuOsVD9x4akt82CWsKmcUBi2JIWttJYzI
 GvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FrMkITyjDzw2qZynqirGu2I6W70Yt+tOC+PpzAOekgA=;
 b=UkY+SV8MK0Y4L592RdHmIjhmWfprNDtA+uqHKmyXny9KffZeaayKNs15xCMSLedRfL
 SA7Qm9IbbsucD2J1ELaNiTU7Xsp+A5+MkzsSlrVZNY/d0xv3NfAjRG2NGxJcY7tQ1h8W
 +9L1rC/K5erjIpsbg/LqEbIRwLO2ja4634qE6g0GJ/Q4X6IRGQQShUFuS/2m+GwuXqKy
 QkVfBBIV/wEoPw2UEWoX/FdJD7va7F9+LlWnkq8UQuk1hQIAFq8iLPu16ukg6hiM6Eiy
 qRdBkMIb6Zx3Wx7bljDEaSv/dmKsKihmxLlP82tM8DM2Q9v0HA2ybG1NLspHTNHMxOIi
 EQsg==
X-Gm-Message-State: AOAM530HnbHoth/DVPGt36WmEVvli8Rf59yiFRPpNLXmRCadOVoMZB/z
 HZWAUJv2rUVqo1kkuqbgFd00kg==
X-Google-Smtp-Source: ABdhPJwKfy1RlTFYMwoQOiZ/wKe9mHmWdfo18z8MSRhuEB2jzn5VIKu/TLSkD8DSlGHCq3HdPlutbQ==
X-Received: by 2002:a5d:6ac4:: with SMTP id u4mr32001036wrw.166.1626731311863; 
 Mon, 19 Jul 2021 14:48:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p5sm17267035wme.2.2021.07.19.14.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:48:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9C7741FF7E;
 Mon, 19 Jul 2021 22:48:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.1 v2 0/2] tricore fixes
Date: Mon, 19 Jul 2021 22:48:23 +0100
Message-Id: <20210719214825.2264-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
so we don't miss it breaking again. New for v2: actually works and
isn't an unholy mash of two docker container definitions.

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
 .../dockerfiles/debian-tricore-cross.docker   | 40 ++++++++++++++++---
 5 files changed, 50 insertions(+), 9 deletions(-)

-- 
2.32.0.264.g75ae10bc75


