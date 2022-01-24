Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4FB4992CC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:30:57 +0100 (CET)
Received: from localhost ([::1]:45534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC5zM-0000R8-3L
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:30:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lB-0006ZU-FV
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:21 -0500
Received: from [2a00:1450:4864:20::631] (port=37704
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5l9-0003B7-FY
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:17 -0500
Received: by mail-ej1-x631.google.com with SMTP id ah7so24524717ejc.4
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MxqVTrGzgqiyemTdfgm9JjWLSZqfxaRPFrHVEf6boIs=;
 b=oby9LSU50+lDew8fzT4HtI8GCFIzKQS2vxjr8z0GcSqZNiBdEYmb/CZpVZ4Xj7Fo7P
 lTK2oRtOt0hB63ulzjatYXNrvHjVQjUyAuJuFXNGV13LZ3lkbVPIR0Dg+8RdIFmHPFiT
 pIO/U7qi7AjwltUxRkP//YJOO5fDw6wM/PnXuoiEl2bDTeAYHtEyyN2yOylK3N3bxsr7
 U9YvDvm+/1BavK4OjJ3DjHtD4d+KNGAuAdyJhjriPWKpRlmG6GN6fWZsQfk+vGg+FZxl
 Y4J8MAPaemj8sRIP40z376Ye8SylTqwI45DbDRqQJgLaiAI6cuUKf5dl3Nof+bvQFRDu
 bkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MxqVTrGzgqiyemTdfgm9JjWLSZqfxaRPFrHVEf6boIs=;
 b=uzh9UlOh4nhp0r48w4pn1k/mdMHrllRRuJd1ZsMo62oNl9wGWGGqO6EbocJolD93DH
 DtoGZBe7Heqqf2BhsKgd+Hb2HT358A4LvMrik5dWWb4WYIb/B44iM5Q9YFUOzNcsWiAM
 +9pOf5l1kdoBC4aurIez82M79GQYrhOg39xU0tpQ0gXTSVEyC3iMwLIGnsPOhQGfu+wF
 rtNHRipRweBTNjrfIkJUo+cHKyhZ+hPaSBJHMDJpvhUrtorpU2F66ogZLVHUyDsGurxq
 S+8CwQ8aRAi248NbTsuRqDS/w+1vNVZUKlq2I8RI+Ed8KVNCKftVLcUjOCdAl1y1lkbp
 XtxQ==
X-Gm-Message-State: AOAM532Ogg0C5c8ck4vai6jrZRpiBrOsn5LYnO9VujmtuMISYv/ZsFDX
 NvTohBrRbkFQr/qo+UQ6Hi/KUw==
X-Google-Smtp-Source: ABdhPJwFc7gWFaslVqG/KqDtKs4mcz+Dcnq4UkADPdsuegps29iTN8wPn7a/ldX4fNajLoGhEMfsBw==
X-Received: by 2002:a17:907:6eac:: with SMTP id
 sh44mr14012245ejc.179.1643055374091; 
 Mon, 24 Jan 2022 12:16:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id gh33sm5344821ejc.17.2022.01.24.12.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:16:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6828C1FFB7;
 Mon, 24 Jan 2022 20:16:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 00/22] testing and plugin updates
Date: Mon, 24 Jan 2022 20:15:46 +0000
Message-Id: <20220124201608.604599-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Here is the usual accumulation of testing patches along with some
updates for TCG plugins. Aside from a few more tricks for some of the
plugins I've also fixed a bug and done some tidying up of the gcov
behaviour. I've included one patch to test the stxp behaviour but I'll
drop it before any PR so no need to review that one. Of the rest quite
a few could still do with some review:

 - plugins: move reset of plugin data to tb_start
 - target/i386: use CPU_LOG_INT for IRQ servicing
 - tests/plugins: add instruction matching to libinsn.so
 - tests/plugin: allow libinsn.so per-CPU counts
 - .gitignore: add .gcov pattern
 - Makefile: also remove .gcno files when cleaning
 - tests/qtest: enable more vhost-user tests by default
 - tests/Makefile.include: clean-up old code

Alex Bennée (13):
  tests/Makefile.include: clean-up old code
  tests/qtest: enable more vhost-user tests by default
  Makefile: also remove .gcno files when cleaning
  .gitignore: add .gcov pattern
  plugins: stxp test case from Aaron (!upstream)
  docs: remove references to TCG tracing
  tracing: remove TCG memory access tracing
  tracing: remove the trace-tcg includes from the build
  tracing: excise the tcg related from tracetool
  tests/plugin: allow libinsn.so per-CPU counts
  tests/plugins: add instruction matching to libinsn.so
  target/i386: use CPU_LOG_INT for IRQ servicing
  plugins: move reset of plugin data to tb_start

Ivanov Arkady (2):
  plugins: add helper functions for coverage plugins
  contrib/plugins: add a drcov plugin

Michael Tokarev (1):
  drop libxml2 checks since libxml is not actually used (for parallels)

Philippe Mathieu-Daudé (6):
  MAINTAINERS: Cover lcitool submodule with build test / automation
  gitmodules: Correct libvirt-ci submodule URL
  tests/lcitool: Include local qemu.yml when refreshing cirrus-ci files
  tests/lcitool: Refresh submodule and remove libxml2
  tests: Manually remove libxml2 on MSYS2 runners
  tests/lcitool: Install libibumad to cover RDMA on Debian based distros

 docs/about/removed-features.rst               |  13 ++
 docs/devel/tracing.rst                        |  85 ---------
 Makefile                                      |   3 +-
 meson.build                                   |  10 --
 accel/tcg/atomic_template.h                   |  12 --
 include/exec/helper-gen.h                     |   2 -
 include/exec/helper-proto.h                   |   1 -
 include/exec/helper-tcg.h                     |   1 -
 include/qemu/qemu-plugin.h                    |  34 ++++
 include/trace-tcg.h                           |   6 -
 accel/tcg/cputlb.c                            |   2 -
 accel/tcg/plugin-gen.c                        |  29 ++--
 accel/tcg/user-exec.c                         |  14 --
 contrib/plugins/drcov.c                       | 163 ++++++++++++++++++
 contrib/plugins/stxp-plugin.c                 |  50 ++++++
 plugins/api.c                                 |  46 +++++
 target/i386/tcg/sysemu/seg_helper.c           |   4 +-
 tcg/tcg-op.c                                  |   5 -
 tests/plugin/insn.c                           | 125 +++++++++++++-
 tests/qtest/vhost-user-test.c                 |  21 +--
 tests/tcg/aarch64/stxp.c                      |  28 +++
 accel/tcg/atomic_common.c.inc                 |  20 ---
 .cirrus.yml                                   |   1 -
 .gitignore                                    |   1 +
 .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
 .gitlab-ci.d/cirrus/macos-11.vars             |   2 +-
 .gitlab-ci.d/windows.yml                      |   2 -
 .gitmodules                                   |   2 +-
 MAINTAINERS                                   |   1 +
 block/meson.build                             |   3 +-
 contrib/plugins/Makefile                      |   2 +
 meson_options.txt                             |   2 -
 plugins/qemu-plugins.symbols                  |   4 +
 scripts/checkpatch.pl                         |   1 -
 .../ci/org.centos/stream/8/x86_64/configure   |   1 -
 scripts/coverity-scan/coverity-scan.docker    |   1 -
 scripts/coverity-scan/run-coverity-scan       |   2 +-
 scripts/meson-buildoptions.sh                 |   3 -
 scripts/tracetool/__init__.py                 |  41 +----
 scripts/tracetool/format/tcg_h.py             |  83 ---------
 scripts/tracetool/format/tcg_helper_c.py      |  79 ---------
 scripts/tracetool/format/tcg_helper_h.py      |  48 ------
 .../tracetool/format/tcg_helper_wrapper_h.py  |  70 --------
 scripts/tracetool/vcpu.py                     |  14 +-
 tests/Makefile.include                        |   4 -
 tests/docker/dockerfiles/alpine.docker        |   4 +-
 tests/docker/dockerfiles/centos8.docker       |   4 +-
 tests/docker/dockerfiles/fedora.docker        |   4 +-
 tests/docker/dockerfiles/opensuse-leap.docker |   3 +-
 tests/docker/dockerfiles/ubuntu1804.docker    |   4 +-
 tests/docker/dockerfiles/ubuntu2004.docker    |   4 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/projects/qemu.yml               |   2 +-
 tests/lcitool/refresh                         |   2 +-
 tests/tcg/aarch64/Makefile.target             |   3 +
 trace-events                                  |  14 --
 trace/meson.build                             |  14 --
 58 files changed, 515 insertions(+), 590 deletions(-)
 delete mode 100644 include/trace-tcg.h
 create mode 100644 contrib/plugins/drcov.c
 create mode 100644 contrib/plugins/stxp-plugin.c
 create mode 100644 tests/tcg/aarch64/stxp.c
 delete mode 100644 scripts/tracetool/format/tcg_h.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_c.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_h.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_wrapper_h.py

-- 
2.30.2


