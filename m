Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D6932E4D0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:30:54 +0100 (CET)
Received: from localhost ([::1]:44772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6nN-0007QO-SF
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gQ-00016R-IL
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:42 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gG-0004HI-SR
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:42 -0500
Received: by mail-wm1-x330.google.com with SMTP id m7so813676wmq.0
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/kna9YDcKM70OLWROlrD38n/l654WznnsIfKi+4NsvI=;
 b=Yio1LWuHPsFSD9HK5hIwapcnWgTHVPyQhcpbN+cWqovpsgevJQe9DFM79al8XMPNnQ
 g3jKQXTa9xdCLUrVmtxA+zZrwUAnBLjdmgnIYsjuIRUD9gRqaXXc8MrHgKPTXiWsrVCA
 1hXpbChB2RY2SmZq9irvTxg/3eevtrg7Rf3FAY7CPQ1eHg0ZvkaJDvANh0izxP7rP7hu
 81Xnq2M32nnVgHvJAqgs3aeZNCQfOFsIW0AyW/GrT0ZNUAw6NCwK6oGuP9c6MT6CFafl
 tqkYLP7L8ARH1EFZ0eYukJ0dtrrQAdtCuy1PmB7ud7fiKPwq2W8hCyw8TUk/zbsSscMr
 CPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/kna9YDcKM70OLWROlrD38n/l654WznnsIfKi+4NsvI=;
 b=WpH++hj1J0FXSjHGjZ1+wDjq0MI1ec/HYkEzVNpOMZ9p9WeEITtlw3pZIDekIyt18a
 ovWSRbC7m48QBmlp/w2bwhGZnHrRTaGVTb31A/LwesOD9IZsewa2qB/WXaHWGpxGRLGC
 gnXGMrSkCQWFBM3LXMmcFBI3QzGFrRX+IVjO5azuumUwoxIGxvEvdYfmq5omzCHsw75K
 KuQ0wnBSiavysRxdi0OKxFnhGWoWinC+RHoOXdM1nmlRo0qMVnUGyW1IVj/zPEnkPNV6
 CEh8beuChg7ULU1Ty1XiVeGRJ2Ax9D3XXi/uxDkvv/SnujhruUJo4JXXQypJ8MI0j9vt
 1A8Q==
X-Gm-Message-State: AOAM533Rv0chMYzJjlUqRS9wAuJQJo0RZQG2xWNCKDwMnn0veRM7oOTi
 9V8z4pfmu5soFunb0RWO9eSrrw==
X-Google-Smtp-Source: ABdhPJwiQDk71VzTqaTPs3f4Kcv2gX6vEQyoqDe3pgoGTdIWRGMJjkg/w66NTa8b9SS3hSVxhksSIQ==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr7927497wmj.149.1614936211167; 
 Fri, 05 Mar 2021 01:23:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a131sm3588031wmc.48.2021.03.05.01.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 01:23:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D610B1FF7E;
 Fri,  5 Mar 2021 09:23:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/9] testing/next (docs, hexagon, cfi, docker)
Date: Fri,  5 Mar 2021 09:23:19 +0000
Message-Id: <20210305092328.31792-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Another week another testing/next roll. The series includes a couple
of my proposed documentation tweaks (including the re-org of the devel
manual). We also enable testing for the hexagon linux-user target to
avoid bitrot. I've documented the process for manually updating the
registry at:

 https://wiki.qemu.org/Testing/DockerBuild#The_GitLab_Registry

There are also jobs for testing CFI and some other minor tweaks and
clean-ups.

The following still need review:

 - gitlab: add build-user-hexagon test
 - tests/docker: add a test-tcg for building then running check-tcg
 - docs/devel: re-organise the developers guide into sections

Alessandro Di Federico (2):
  docker: Add Hexagon image
  tests/tcg: Use Hexagon Docker image

Alex Bennée (4):
  docs/devel: re-organise the developers guide into sections
  docs/system: add a gentle prompt for the complexity to come
  tests/docker: add a test-tcg for building then running check-tcg
  gitlab: add build-user-hexagon test

Daniele Buono (2):
  gitlab-ci.yml: Allow custom # of parallel linkers
  gitlab-ci.yml: Add jobs to test CFI flags

Philippe Mathieu-Daudé (1):
  tests/docker: Use --arch-only when building Debian cross image

 docs/devel/index.rst                          |  32 +---
 docs/devel/multi-thread-tcg.rst               |   5 +-
 docs/devel/section-apis.rst                   |  16 ++
 docs/devel/section-building.rst               |  13 ++
 docs/devel/section-concepts.rst               |  21 +++
 docs/devel/section-process.rst                |  11 ++
 docs/devel/section-tcg-emulation.rst          |  19 +++
 docs/devel/section-testing.rst                |  20 +++
 docs/devel/tcg-icount.rst                     |   6 +-
 docs/devel/testing.rst                        |   6 +-
 docs/system/quickstart.rst                    |   8 +
 docs/system/targets.rst                       |   2 +
 .gitlab-ci.yml                                | 134 +++++++++++++++++
 MAINTAINERS                                   |   2 +
 tests/docker/Makefile.include                 |   2 +
 .../dockerfiles/debian-hexagon-cross.docker   |  27 ++++
 .../build-toolchain.sh                        | 141 ++++++++++++++++++
 tests/docker/dockerfiles/debian10.docker      |   2 +-
 tests/docker/test-tcg                         |  22 +++
 tests/tcg/configure.sh                        |   4 +
 20 files changed, 458 insertions(+), 35 deletions(-)
 create mode 100644 docs/devel/section-apis.rst
 create mode 100644 docs/devel/section-building.rst
 create mode 100644 docs/devel/section-concepts.rst
 create mode 100644 docs/devel/section-process.rst
 create mode 100644 docs/devel/section-tcg-emulation.rst
 create mode 100644 docs/devel/section-testing.rst
 create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross.docker
 create mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
 create mode 100755 tests/docker/test-tcg

-- 
2.20.1


