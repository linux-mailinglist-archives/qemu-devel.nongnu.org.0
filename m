Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86532F66F1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:14:12 +0100 (CET)
Received: from localhost ([::1]:59230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06CJ-0007t2-E2
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:14:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wP-0003c8-Bz
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:45 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wE-0004uj-KZ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:38 -0500
Received: by mail-wr1-x434.google.com with SMTP id m4so6494932wrx.9
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qCfvsyxtog2oCY97/PbOxFX61m9iak5bWyn2XB1znBE=;
 b=amMmpi4y+0XqZPxmnytAUsjTMZL1mjglAV6D0y2f83q8/EPwcOrq64SBAKCudkbcr8
 Uj8LWDL5PODj8hgHapOdb/dltV/k0TxTBevFRRWLLfwz1YYjCb/wCLYiOaLVu0FGzOhR
 g9gFexeAWJnMC/TQjTlq4Op+TU9Z8IvFy7h2XpIMXM8sOA9gH2O8yLghRyu9yadmEoe6
 5TlxJYWzC/ZHnVcZAc0+24BGV6WlrUtqq/0aE7110Qpk2HDHSJ2eY/mMn3zGXpg1952R
 bBGSzuiDf6yn7inYVD6Us5/kGwfZgd9mDtRt5AaKg+YInculIWGhQ8BeEYzKwltPu7kI
 HzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qCfvsyxtog2oCY97/PbOxFX61m9iak5bWyn2XB1znBE=;
 b=ap+fcx/kw/qk8PmmTHW8ciPWsKTYYwOXNMjuDHhQ58LCfXSF/HVkKQj/GoBBMs0U9L
 8jxaeuvKQ4pHIl7R267k7AQclyQg9JRb0rcVe7Cit7kfoSBKw+Yx8Quu1ZlTnlLekKu3
 3RWGsTVTbqAtBCgCYATvlf63N1aswt9x5W7VLAORKVKrpk8HAp8TuoEcorTIvpVfs6ZB
 7PMIo1vIm4KLGPcEX8fg6oC0n43g7vVA4s8qaZNX6FWkNnM2TPYmLwDQcIEzWAgCuaYD
 o1LF4ssopY9trrr4MlS5I3HYOPHcDExkW3zk5CKi0yTydo/27iRHKGH2CfjLKkR5EVCJ
 H4eA==
X-Gm-Message-State: AOAM532g0gIPc9jIsHptAmoBYbVVUnqvJ8UfV8w9471JlTC0wlEfMcgv
 icrlo/kSXzAMyEz7NiyxHWcm/A==
X-Google-Smtp-Source: ABdhPJyVFnrmZN4RZjd91IDcm/pNOXJTTrP2Gu7MCwom6pRatKI8/O7phRV34n274Mmxu8oa6/cC7Q==
X-Received: by 2002:a5d:4704:: with SMTP id y4mr8799336wrq.358.1610643452192; 
 Thu, 14 Jan 2021 08:57:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b14sm10901789wrx.77.2021.01.14.08.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:57:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1A27B1FF7E;
 Thu, 14 Jan 2021 16:57:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 00/12] testing/next (tags!, shippable/travis deprecation,
 regression fixes, checkpatch)
Date: Thu, 14 Jan 2021 16:57:18 +0000
Message-Id: <20210114165730.31607-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

The main changes from v1:

  https://patchew.org/QEMU/20210113151408.27939-1-alex.bennee@linaro.org/

 - squeeze the size of the htags generation to fit pages
 - move one more job from Travis
 - include regression fix for yank
 - fix a problem with checkpatch and commit ids

The following need review:

 - scripts/checkpatch.pl: fix git-show invocation to include diffstat
 - gitlab: migrate the minimal tools and unit tests from Travis
 - docker: expand debian-amd64 image to include tag tools
 - Makefile: wrap cscope in quiet-command calls
 - Makefile: wrap etags in quiet-command calls
 - Makefile: wrap ctags in quiet-command calls
 - Makefile: add GNU global tags support

Alessandro Di Federico (1):
  Add newline when generating Dockerfile

Alex Bennée (8):
  Makefile: add GNU global tags support
  Makefile: wrap ctags in quiet-command calls
  Makefile: wrap etags in quiet-command calls
  Makefile: wrap cscope in quiet-command calls
  docker: expand debian-amd64 image to include tag tools
  gitlab: move docs and tools build across from Travis
  gitlab: migrate the minimal tools and unit tests from Travis
  scripts/checkpatch.pl: fix git-show invocation to include diffstat

Lukas Straub (1):
  Fix build with new yank feature by adding stubs

Philippe Mathieu-Daudé (2):
  tests/docker: Remove Debian 9 remnant lines
  shippable.yml: Remove jobs duplicated on Gitlab-CI

 Makefile                                     | 46 ++++++++++++++++----
 stubs/yank.c                                 | 29 ++++++++++++
 .gitignore                                   |  3 ++
 .gitlab-ci.yml                               | 30 ++++++++++---
 .shippable.yml                               | 14 +-----
 .travis.yml                                  | 25 -----------
 MAINTAINERS                                  |  1 +
 scripts/checkpatch.pl                        |  2 +-
 stubs/meson.build                            |  1 +
 tests/docker/Makefile.include                |  1 -
 tests/docker/docker.py                       |  4 +-
 tests/docker/dockerfiles/debian-amd64.docker |  5 ++-
 12 files changed, 104 insertions(+), 57 deletions(-)
 create mode 100644 stubs/yank.c

-- 
2.20.1


