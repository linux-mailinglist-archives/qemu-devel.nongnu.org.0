Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B126450714
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:33:41 +0100 (CET)
Received: from localhost ([::1]:59968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmd3E-0007CC-EV
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:33:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmcz6-00019b-SS
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:29:24 -0500
Received: from [2a00:1450:4864:20::42d] (port=40834
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmcz1-0004Ln-Dt
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:29:24 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r8so31016182wra.7
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5Sz/zffReE5b6dS5mw2wxfm9eZkZ4Ao10I66f+PlCU=;
 b=AK1kdYqHDmSJMiLo5LmFaZkijwSza3YWICdJp0Vlrc+8x3CI85fpTItuHI3lBpj5rd
 PwTtiIduTznQQbLZlZyo1TOjno2te0qhg8yVzLD/uRKVk/0TQSDAa3pksTHBWkvyDUGc
 TUKjxYkkpsx2vqw8ZWcO5ExXiiaogCkHaZZtGtB1VhUHIDjbCM18Xy7QDQDVbvnSgEwD
 Ox1Tmbd5It1JjQaj54vcaaMymQOvHTjQ/fpzmSYYXm7ZVEw1RPiIy57bez1OsSsfHA6s
 36ilfvmpDgeCBvEL+ZmXPFMk1YUW9G3RrKp2+hDWZ44SMK8oRZs6wVdK21nWzWfp77FV
 ia3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5Sz/zffReE5b6dS5mw2wxfm9eZkZ4Ao10I66f+PlCU=;
 b=mrjEdcpYCzUJMyE6f+P66xd4Q5AsGMkELxGnvDZB5BhcZ5idTKU/XTWXANH2LIjE+E
 +KHSlwLkf4c4fJgczfgm2O4+6+oV0/YikANyZyvuR2O+kkXuBALmcQI4uut/MimFVRVW
 b/brtAbFflAYpiY4CdCQUXT5VWSnT85Q9T7/egDlHd9lJOURXF936kyIasnyG+tIUW+e
 z3Rt+dwHygLYExmKH2vJ07MEhF5Ry/nOoqc6wq+OhB2BBRdPwkbOhYDrDcFY5dmknHuS
 T0AWKjwipm+IRP3mxiwlNEN6gygTsRt+/qmB61KbUHtL1DYGGocd/9YSkkbgGUTA3TLd
 mUxQ==
X-Gm-Message-State: AOAM530V+iL9AeG/UmydvJK2p4uFpaKCeDqJDb93E3fiUIVGVyOwZdqO
 e0GV1W7mH0mndhAd5mPg1+NCAA==
X-Google-Smtp-Source: ABdhPJxb37F+py70Rsn9cPDF8GwtFgbt3J3onalss2ZYYLs8JcM2OZWNqz0sEe3/C0/lPqwk+04SKg==
X-Received: by 2002:a5d:59aa:: with SMTP id p10mr46934559wrr.210.1636986557996; 
 Mon, 15 Nov 2021 06:29:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l8sm22679368wmc.40.2021.11.15.06.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:29:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 016AD1FF96;
 Mon, 15 Nov 2021 14:29:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 v1 0/6] current state of for-6.2/misc-fixes
Date: Mon, 15 Nov 2021 14:29:09 +0000
Message-Id: <20211115142915.3797652-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Here is the current state of my for-6.2/misc fixes tree. Currently the
following are unreviewed:

 - tests/vm: don't build using TCG by default
 - tests/vm: sort the special variable list
 - tests/docker: force NOUSER=1 for base images

Alex Bennée (3):
  tests/docker: force NOUSER=1 for base images
  tests/vm: sort the special variable list
  tests/vm: don't build using TCG by default

Cleber Rosa (1):
  Jobs based on custom runners: add CentOS Stream 8

Paolo Bonzini (1):
  meson: remove useless libdl test

Philippe Mathieu-Daudé (1):
  gitlab-ci: Split custom-runners.yml in one file per runner

 docs/devel/ci-jobs.rst.inc                    |   7 +
 meson.build                                   |   8 +-
 .gitlab-ci.d/custom-runners.yml               | 239 +-----------------
 .../custom-runners/centos-stream-8-x86_64.yml |  28 ++
 .../custom-runners/ubuntu-18.04-s390x.yml     | 118 +++++++++
 .../custom-runners/ubuntu-20.04-aarch64.yml   | 118 +++++++++
 accel/tcg/meson.build                         |   2 +-
 .../org.centos/stream/8/build-environment.yml |  51 ++++
 .../ci/org.centos/stream/8/x86_64/configure   | 208 +++++++++++++++
 .../org.centos/stream/8/x86_64/test-avocado   |  70 +++++
 scripts/ci/org.centos/stream/README           |  17 ++
 scripts/ci/setup/build-environment.yml        |  38 +++
 tests/docker/Makefile.include                 |   3 +
 tests/vm/Makefile.include                     |  29 ++-
 14 files changed, 683 insertions(+), 253 deletions(-)
 create mode 100644 .gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
 create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
 create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
 create mode 100644 scripts/ci/org.centos/stream/8/build-environment.yml
 create mode 100755 scripts/ci/org.centos/stream/8/x86_64/configure
 create mode 100755 scripts/ci/org.centos/stream/8/x86_64/test-avocado
 create mode 100644 scripts/ci/org.centos/stream/README

-- 
2.30.2


