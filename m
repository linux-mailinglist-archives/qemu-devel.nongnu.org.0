Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585722C0483
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:29:11 +0100 (CET)
Received: from localhost ([::1]:51612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khA1u-0003rw-EJ
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh9yH-0007mn-7V
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:25:25 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh9yF-0004b8-41
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:25:24 -0500
Received: by mail-wr1-x42c.google.com with SMTP id e7so690208wrv.6
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WfUfuw/VZfNk6rZrj2BudIVJmoj83o5cwK3Oq8p5jEs=;
 b=EiOGA+9n/D+Wd2rn1Q8hQ0S7YsOrLBG1Ug1bVXOM0RV3Ujs/eSUR+jUOvQt32WYAZw
 qziN/3CVRvC6KFasb/fQRdRzk80MF6vPxlfbHDUlL31tV0Yz6zk9ckpjh16yfZ5rOYBk
 00NguIBA0j+WGwAtjfuwrZARONDmYV7db9nn4Q59T0DD1uaef5OwtbgX96oygNMb66wg
 YIVj969E2Lo1jmKkXq9A/C9dMa+29IvrpKUj34O3/OFMPLJgMIQ4KjDdbBf/+VOgDTiy
 V87HHlic8onu2HAcZQejPmaCjWKDrZ4deKmOXvnUs22Dj0UkvmviMFzypRhZFxHTqYX1
 K9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WfUfuw/VZfNk6rZrj2BudIVJmoj83o5cwK3Oq8p5jEs=;
 b=iQRQ1JSGAh2H4k2LMCYhhKfXog1bsgmcR/i7MGCU/2/TITdUTHduaUiUTABbn+ozTg
 S0aB2V4q7JocSE/7W4cO9Ky5h8JfT5T9jXdwNmDU3Cph5k+Z2OKcpqn2dGe3OqiUD6pw
 Fnu96v8suVEYfLD1Z0hjXiKy0oypZE9uJr1Mp8khS+4NPjccBLntJ8xx65cLjhLfo6lA
 ROY34R+/6OmTKDAoNEGLHNv3BH7CjUHu1R0uBwy3ui8MQjH4ZgQCNV9AFfK9/8Gb3hGQ
 1qlKsyHa/kGqWySDpDzCdoDcT0GzrlNAMb8KWFpdGFHTg5Yc739LFA/5TBU+35zHfgJc
 CcQA==
X-Gm-Message-State: AOAM531Li3ombwOQA3YdCYXkxza+pMwLSQv/WRk4o/+jlECaX9NriMw4
 UekMEN8FmbF7v2bKAn5P2ewVbw==
X-Google-Smtp-Source: ABdhPJw05++nLoL+JX5o5g/bKe1D9A7A0yEfdNa033XHKUEaLuOk28NebwwbtOPfk5ewt06vtfL8lQ==
X-Received: by 2002:adf:fc01:: with SMTP id i1mr30130332wrr.250.1606130721333; 
 Mon, 23 Nov 2020 03:25:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s25sm15719458wmh.16.2020.11.23.03.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:25:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C0BCF1FF7E;
 Mon, 23 Nov 2020 11:25:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL for 5.2-rc3 0/7] various CI cleanups (scripts, avocado, gitlab)
Date: Mon, 23 Nov 2020 11:25:11 +0000
Message-Id: <20201123112518.13425-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

The following changes since commit 8cc30eb1400fc01f2b139cdd3dc524f8b84dbe07:

  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20201122' into staging (2020-11-22 15:02:52 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-for-5.2-rc3-231120-1

for you to fetch changes up to 534f80e1dffbf520bed9bf5fd5ae98de6662e126:

  .cirrus.yml: bump timeout period for MacOS builds (2020-11-23 09:55:25 +0000)

----------------------------------------------------------------
Misc CI fixes:

  - more helpful logic for git-pipeline-status
  - fix tempdir leak in avocado
  - move remaining x86 check-tcg to gitlab
  - add tracing headers to ubuntu2004 docker
  - move tracing backend tests to gitlab
  - bump up timeouts on cirrus MacOS

----------------------------------------------------------------
Alex Bennée (5):
      scripts/ci: clean up default args logic a little
      tests: add prefixes to the bare mkdtemp calls
      tests/avocado: clean-up socket directory after run
      gitlab: move remaining x86 check-tcg targets to gitlab
      .cirrus.yml: bump timeout period for MacOS builds

Philippe Mathieu-Daudé (2):
      tests/docker: Install liblttng-ust-dev package in Ubuntu 20.04 image
      gitlab-ci: Move trace backend tests across to gitlab

 .cirrus.yml                                |  2 ++
 .gitlab-ci.yml                             | 35 +++++++++++++++++++++++
 .travis.yml                                | 45 ------------------------------
 python/qemu/machine.py                     |  3 +-
 scripts/ci/gitlab-pipeline-status          | 24 ++++++++--------
 tests/acceptance/avocado_qemu/__init__.py  |  4 ++-
 tests/docker/dockerfiles/ubuntu2004.docker |  1 +
 7 files changed, 56 insertions(+), 58 deletions(-)

-- 
2.20.1


