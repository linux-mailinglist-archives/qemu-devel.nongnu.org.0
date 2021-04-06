Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F3435572B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:02:41 +0200 (CEST)
Received: from localhost ([::1]:59232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnE0-0007gl-Fd
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCH-0006Nr-On
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:00:53 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:41683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCB-00050y-B9
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:00:53 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso7489383wmi.0
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wFbtZtz/aw5KFJ0MkRSOcbMUldxQPYexpN05NrNqrag=;
 b=B1+a2hUc449QH28l+t8eYMwrOMgNLgoQ6aXvnxazqQ2PqnFT4TtLZ1bWfatG7KQlcC
 0icXdsBDbR9mvG5c7CvCPTgmDjDWc/4l1YSieLYEovyga169rhWeMx03t+jrZFXLhco0
 Zi6HlGXrfcybkN2/JOG/2ABjg13D9G/GPPya9r37PC733lK86UzeDfVdDxpZeseYyxS7
 X3mn4fQjyF7YeawwvmiW1MV2VKdwAesiX/9vuEb2bc3qj9l9lcHVxJNN0QLtmAg3jRs5
 8fIRGO4Qrh/lLa2h+OkO6QemTvda/cx1mvO6PRDq2q9TH+YJk1+LW0Yx3q+Lwagplqfk
 5ZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wFbtZtz/aw5KFJ0MkRSOcbMUldxQPYexpN05NrNqrag=;
 b=NKd7taE9euUcUUunVg6VfZnfX4xgoAnhpFEJIkW7Xz6MnFV3u6HZSY89SzSnkT5jid
 Y7+lzreNliR7udTlDXDSZkv8asHgD6uxduvAf8JCWOAou8c89LN+X91NumsKjuvda/1y
 B6w1wSFxodbkhTS8qWENhGu/HBCXFIm7opmohxJ9UbQazBBeTsaHR2lC+MAhhWUolAdd
 vHquq1L+8vfh1VfpGwtA5v3JkFL2Lm9KIOao703/KCrAGma86o+9ZQj728ccEx5kRUjQ
 m8V9s1K7PoS6DbxGvK4TX76Kroa7dkM9b8SiIQABwdSe+7NhovTP5CZo9+EEqbPKyzIq
 HL9Q==
X-Gm-Message-State: AOAM532ZlmUJtigFTYE8ye1gXUwXFdiCgc5f6w3X7RydV+T8c0sYjli/
 ItHYdunE4loAjewq+bwEsKvWiQ==
X-Google-Smtp-Source: ABdhPJwoomWYLfVZt/qBF3pg7LkmiipM0fewXDOddGwrpQzLK5Wvp34dtozw+uhs9STIjtXFLcPkCQ==
X-Received: by 2002:a05:600c:4f13:: with SMTP id
 l19mr4329779wmq.89.1617721244478; 
 Tue, 06 Apr 2021 08:00:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u63sm3237636wmg.24.2021.04.06.08.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 08:00:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 03C8A1FF7E;
 Tue,  6 Apr 2021 16:00:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 00/11] rc2 fixes (check-tcg, gitlab, gdbstub)
Date: Tue,  6 Apr 2021 16:00:30 +0100
Message-Id: <20210406150041.28753-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 109918d24a3bb9ed3d05beb34ea4ac6be443c138:

  Merge remote-tracking branch 'remotes/nvme/tags/nvme-fixes-for-6.0-pull-request' into staging (2021-04-05 22:15:38 +0100)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-6.0-rc2-fixes-060421-1

for you to fetch changes up to a2e5bbf0c407a572d9b687adaecf9995f66b4cd9:

  gitlab-ci.yml: Test the dtrace backend in one of the jobs (2021-04-06 15:04:50 +0100)

----------------------------------------------------------------
Testing updates:

  - fix x86_64 cross compilers
  - don't use registry for non-x86 containers
  - add valid host types for given cross compile containers
  - clean up i386 code16 test with explicit -no-pie
  - relax sha1.py gdbstub test
  - add more gdbstub documentation
  - remove annoying warning on gitlab
  - test dtrace backend in gitlab

----------------------------------------------------------------
Alex Bennée (7):
      tests/tcg: update the defaults for x86 compilers
      tests/docker: don't set DOCKER_REGISTRY on non-x86_64
      tests/tcg: add concept of container_hosts
      tests/tcg/configure.sh: make sure we pick up x86_64 cross compilers
      tests/tcg/i386: expand .data sections for system tests
      tests/tcg/i386: force -fno-pie for test-i386
      tests/tcg: relax the next step precision of the gdb sha1 test

Peter Maydell (2):
      docs/system/gdb.rst: Add some more heading structure
      docs/system/gdb.rst: Document how to debug multicore machines

Thomas Huth (2):
      gitlab-ci.yml: Fix the filtering for the git submodules
      gitlab-ci.yml: Test the dtrace backend in one of the jobs

 docs/system/gdb.rst                     | 63 ++++++++++++++++++++++++++++++++-
 configure                               |  2 +-
 .gitlab-ci.yml                          |  4 +--
 tests/docker/Makefile.include           |  5 ++-
 tests/docker/dockerfiles/centos8.docker |  1 +
 tests/tcg/configure.sh                  | 42 +++++++++++++++++++---
 tests/tcg/i386/Makefile.target          | 16 +++++++--
 tests/tcg/i386/system/kernel.ld         |  2 +-
 tests/tcg/multiarch/gdbstub/sha1.py     |  5 ++-
 9 files changed, 126 insertions(+), 14 deletions(-)

-- 
2.20.1


