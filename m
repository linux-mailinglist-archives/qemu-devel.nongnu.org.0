Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC063FFCB5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:07:19 +0200 (CEST)
Received: from localhost ([::1]:38480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5AK-0000TI-IK
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM56x-0005wk-GE
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:47 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM56u-0005Tp-S6
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:46 -0400
Received: by mail-wr1-x432.google.com with SMTP id g18so7173606wrc.11
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VNXssv77lGW/gLcDBRUS1rbizfNSPc1VEJe0DYgf3K4=;
 b=obOk9DtjZ+4s/F/b1VzAbcb8/hlf0Y0AA4ivix7rFvKn9szRw/mgzAJleA3dvd1dIv
 7U8jOzuPnmh22FqP5ju7U5vAuf+bL3poq5goJP9tabdEIw1AsPjh4uo7i6oSRv9Ra6LT
 gB/cBDfs082oN4TZzRGA8ht4WTJ9VJITxEtPULxu5xKfQzA8QqAR83aRUtEAsvRdgWDf
 tpGoiZZDB72eIfTmKrYin5eO9lEO2Em6bbvQSM2V/bPXItmFzJbZSe0ahXYrNye6ltZH
 2eMEd+s9WPrebUTBU2siZuqbiq3XR+Y6v99bKoWQO+IeMHnOKdu2eZoKqZhMRbhjYQmn
 KqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VNXssv77lGW/gLcDBRUS1rbizfNSPc1VEJe0DYgf3K4=;
 b=Xc9E46DMwcPzYReJlkBGHOV7a+Bby/UwnqHH5Qabz3vPP18sW4bgBA1YWMWW+RcyYX
 uTfWfGZ/PsQwKwsJ8LhCf2ZBro+lMcVRB2ZHmsDpQlWNsCJTRaup9J7FM7Ot8DslTsur
 zK24TPMyBC8tOG4w2palRxjtO6Fr6qpN4DgSUrkgDYlV5FqI2C9/AmWwVzu+qHOMFAIt
 wo+p/dYw6lH4nkUVThondWGoRtYrn5PTrwh8xWaL+LuGXkFZJisEZEKpGiF2ed37vvAi
 R0puL0dQyrOdGKVlQwgO9GtykzULUbX09mro0FEAA/W7wsxmtjF91I6S9bkqVOtWI2VN
 D5pQ==
X-Gm-Message-State: AOAM530BH41pv6Y9VCUdNG+cTz+PsqOUUAvonTyQFEwWgKKE5sDQCYWw
 KPIZBj2FR/xXW4aQ6qELC9Rbyg==
X-Google-Smtp-Source: ABdhPJysVGijuJB8Z+GbCAMQYQYHe4IzN6+mjTiygmG6bY/+xaySdk0pEYyFeRI6makqWg/cSe27QQ==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr2811718wrn.350.1630659822019; 
 Fri, 03 Sep 2021 02:03:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 129sm3748736wmz.26.2021.09.03.02.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:03:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E3DE11FF96;
 Fri,  3 Sep 2021 10:03:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 00/22] testing and plugin updates
Date: Fri,  3 Sep 2021 10:03:17 +0100
Message-Id: <20210903090339.1074887-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

The following changes since commit 079b1252e9de384385c9da910262312ec2e574c8:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210901' into staging (2021-09-01 17:45:38 +0100)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-for-6.2-020921-1

for you to fetch changes up to a35af836d103f781d2fea437129732c16ba64b25:

  docs/devel: be consistent about example plugin names (2021-09-02 11:29:34 +0100)

----------------------------------------------------------------
Testing and plugin updates:

  - fix typo in execlog plugin
  - clean-up and document gitlab FOO_RUNNER_AVAILABLE vars
  - fix plugin build issue on OSX and modules
  - add multi-core support to cache modelling plugin
  - clean-ups for plugin arg=FOO handling

----------------------------------------------------------------
Alex Bennée (1):
      plugins: sort exported symbol list

Mahmoud Mandour (17):
      plugins/execlog: removed unintended "s" at the end of log lines.
      plugins/cache: supported multicore cache modelling
      docs/devel/tcg-plugins: added cores arg to cache plugin
      plugins: allow plugin arguments to be passed directly
      plugins/api: added a boolean parsing plugin api
      plugins/hotpages: introduce sortby arg and parsed bool args correctly
      plugins/hotblocks: Added correct boolean argument parsing
      plugins/lockstep: make socket path not positional & parse bool arg
      plugins/hwprofile: adapt to the new plugin arguments scheme
      plugins/howvec: adapting to the new argument passing scheme
      docs/tcg-plugins: new passing parameters scheme for cache docs
      tests/plugins/bb: adapt to the new arg passing scheme
      tests/plugins/insn: made arg inline not positional and parse it as bool
      tests/plugins/mem: introduce "track" arg and make args not positional
      tests/plugins/syscalls: adhere to new arg-passing scheme
      docs/deprecated: deprecate passing plugin args through `arg=`
      docs/devel: be consistent about example plugin names

Paolo Bonzini (1):
      plugins: do not limit exported symbols if modules are active

Thomas Huth (3):
      gitlab-ci: Merge "build-disabled" with "build-without-default-features"
      gitlab-ci: Remove superfluous "dnf install" statement
      gitlab-ci: Fix ..._RUNNER_AVAILABLE variables and document them

 docs/about/deprecated.rst                |  12 +++
 docs/devel/ci-jobs.rst                   |  11 ++
 docs/devel/tcg-plugins.rst               |  68 +++++++-----
 configure                                |   5 +-
 include/qemu/qemu-plugin.h               |  13 +++
 contrib/plugins/cache.c                  | 176 +++++++++++++++++++++++--------
 contrib/plugins/execlog.c                |   2 +-
 contrib/plugins/hotblocks.c              |  14 ++-
 contrib/plugins/hotpages.c               |  30 ++++--
 contrib/plugins/howvec.c                 |  27 +++--
 contrib/plugins/hwprofile.c              |  39 ++++---
 contrib/plugins/lockstep.c               |  31 ++++--
 linux-user/main.c                        |   2 +-
 plugins/api.c                            |   5 +
 plugins/loader.c                         |  24 ++++-
 tests/plugin/bb.c                        |  15 ++-
 tests/plugin/insn.c                      |  14 ++-
 tests/plugin/mem.c                       |  47 +++++----
 tests/plugin/syscall.c                   |  23 ++--
 .gitlab-ci.d/buildtest.yml               |  99 +++--------------
 .gitlab-ci.d/custom-runners.yml          |  12 +--
 plugins/meson.build                      |  14 +--
 plugins/qemu-plugins.symbols             |  49 ++++-----
 qemu-options.hx                          |   9 +-
 tests/tcg/i386/Makefile.softmmu-target   |   2 +-
 tests/tcg/i386/Makefile.target           |   2 +-
 tests/tcg/x86_64/Makefile.softmmu-target |   2 +-
 27 files changed, 467 insertions(+), 280 deletions(-)

-- 
2.30.2


