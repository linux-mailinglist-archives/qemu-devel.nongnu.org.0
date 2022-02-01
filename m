Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400A14A6719
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:33:48 +0100 (CET)
Received: from localhost ([::1]:33678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0mZ-0003Yz-AS
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:33:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmY-00086Y-Te
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:35 -0500
Received: from [2a00:1450:4864:20::62c] (port=39486
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExly-0000c8-53
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:10 -0500
Received: by mail-ej1-x62c.google.com with SMTP id j2so56120860ejk.6
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YimLP/6ozaz64kkHN71/3hY51BmuGceF74MlZBrlEC4=;
 b=ht/8iWVKja6aQD2jA0tKowxiGZT4rn+0nikVkt68q9OsySI3Oa+a6QL6Cilyd6Bfs7
 BH1hgzLrxw+X90/uzhh3g6fpM/swPEQcEOpGfa5SzYem0NeVQkXamxPucvc5+eaalrEK
 x3A9TaUSv4Oe5Z6ROwgNZexrkYTYotDCed4EY1uBD3/YW81PRp5Lu0MEBTWzf6H772jy
 Y/sHQIK5h/Wb85RBXEwicuezg6SiRW7xnaNw4T3HyqelBLgWyHw9MW+V0tWMMHj0nYOa
 BaUHKVpsGT/+po4SuKXCjhG4G0wa7v4q9B0Oghdc9NiirmKOv8tMnso/iN+R7Uh8OBfk
 4kKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YimLP/6ozaz64kkHN71/3hY51BmuGceF74MlZBrlEC4=;
 b=PqLqZKqCm76/FwRAt6zCn23puk0hNaLWtoSPKvo0LqVGY9Bb028CHK5JJEHdaRB1sQ
 C38dAHM12QGNeKh7m2Dd9aGJVZ+b1VOkjx6cGN4PiTysCMu9khfLfcGF88h2a6jWZvIF
 bO/dlfO+1E9gmtPfJwH5kKKtsjkgIJ9CknOdTN+AFafye+VBQ3Tg6dKr5Mopa/z7g6xq
 heklNMTO7vmToz9H0cn00bzt78M117XYSpy+bp1Dmh4Yl8FXt7mrxaaTDeAXjxdEBvLT
 OC6cf3meUG8vILDn4ntJX9v1bsZJonBEWQtt1/db+ZvyILI2y0yVW5yvCC39mbjogwdT
 XEWQ==
X-Gm-Message-State: AOAM530bpH3UOQ3dI0hEhmFq/ohfg0t28AwIKFotqw/BmKxgvim5xSor
 AdootvBrGkfNKT8GNAgM7NQ89Q==
X-Google-Smtp-Source: ABdhPJwhCG8RjQ8auBYbkWBrWvy7sszPBU5FtV05nqdVjqoYgUqcur/1axVoT+l12vNry/fn46aaCw==
X-Received: by 2002:a17:906:4c47:: with SMTP id
 d7mr14997052ejw.192.1643739655193; 
 Tue, 01 Feb 2022 10:20:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d23sm14470267eja.86.2022.02.01.10.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:20:51 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AAE581FFB7;
 Tue,  1 Feb 2022 18:20:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 00/25] testing and plugin updates
Date: Tue,  1 Feb 2022 18:20:25 +0000
Message-Id: <20220201182050.15087-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com, f4bug@amsat.org,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, pbonzini@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here is the usual accumulation of testing patches along with some
updates for TCG plugins. Aside from a few more tricks for some of the
plugins I've also fixed a bug and done some tidying up of the gcov
behaviour. Since v1 I've fix a build issue with FreeBSD and
incorporated some more testing patches from the list as well as
addressed comments. As usual individual updates are mentioned bellow
the --- in the individual patches.

I am seeing some failures on gitlab CI but it's hard to pin down if it
is due to gitlab stability or something in this series. I'm posting
now for review so as not to hold that up while I poke some more. I'm
also open to any ideas for how to replicate.

 - plugins: move reset of plugin data to tb_start
 - tests/plugins: add instruction matching to libinsn.so
 - tests/plugin: allow libinsn.so per-CPU counts
 - block: fix FreeBSD build failure with fallocate
 - Makefile: also remove .gcno files when cleaning
 - tests/qtest: enable more vhost-user tests by default
  
Alex Bennée (14):
  tests/Makefile.include: clean-up old code
  tests/qtest: enable more vhost-user tests by default
  Makefile: also remove .gcno files when cleaning
  .gitignore: add .gcov pattern
  docs/devel: mention our .editorconfig
  block: fix FreeBSD build failure with fallocate
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

Stefan Hajnoczi (1):
  gitlab: fall back to commit hash in qemu-setup filename

Thomas Huth (1):
  tests/lcitool: Allow lcitool-refresh in out-of-tree builds, too

 docs/about/removed-features.rst               |  13 ++
 docs/devel/style.rst                          |   4 +
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
 block/export/fuse.c                           |   2 +
 contrib/plugins/drcov.c                       | 163 ++++++++++++++++++
 plugins/api.c                                 |  46 +++++
 target/i386/tcg/sysemu/seg_helper.c           |   4 +-
 tcg/tcg-op.c                                  |   5 -
 tests/plugin/insn.c                           | 126 +++++++++++++-
 tests/qtest/vhost-user-test.c                 |  21 +--
 accel/tcg/atomic_common.c.inc                 |  20 ---
 .cirrus.yml                                   |   1 -
 .gitignore                                    |   1 +
 .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
 .gitlab-ci.d/cirrus/macos-11.vars             |   2 +-
 .gitlab-ci.d/crossbuild-template.yml          |   2 +-
 .gitlab-ci.d/windows.yml                      |   2 -
 .gitmodules                                   |   2 +-
 MAINTAINERS                                   |   1 +
 block/meson.build                             |   3 +-
 contrib/plugins/Makefile                      |   1 +
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
 tests/lcitool/Makefile.include                |   2 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/projects/qemu.yml               |   2 +-
 tests/lcitool/refresh                         |   2 +-
 trace-events                                  |  14 --
 trace/meson.build                             |  14 --
 59 files changed, 442 insertions(+), 592 deletions(-)
 delete mode 100644 include/trace-tcg.h
 create mode 100644 contrib/plugins/drcov.c
 delete mode 100644 scripts/tracetool/format/tcg_h.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_c.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_h.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_wrapper_h.py

-- 
2.30.2


