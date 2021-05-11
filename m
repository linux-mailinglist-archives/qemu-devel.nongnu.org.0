Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB29137A0DC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:33:29 +0200 (CEST)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgMtU-0006GF-Fg
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMq7-00041S-8b
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:00 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMq4-00082c-0w
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:29:58 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 a10-20020a05600c068ab029014dcda1971aso613081wmn.3
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JZQfrHvu/bBhdWEEOPOqtsYnPe1VjfiCaChsH5RgZgw=;
 b=U2oUk0W6bieoODUEcQ5ls9j5Qyg9fJTF/3IOBDeIA7qZd0rdMxIFTBQFiwDCWgUutA
 7uk3C1uVdT/y6N+BM083sjueaerLYNl4k9Dk2mt94Uz73mMfLu8ZTU4+sREx6fB8rw3t
 RyfBQwDYqV0Bypt/upMQnLBQhyzS2DaB9yXONBdkX8y+ZBKiSgI8oyfP1io9NhGzAV8H
 sHR3QjcVmkMbjz+sHn7+d847riHlj9fS/fUP0yOwo2bwhw2JQkcj1ebSL28N0rzlSdT4
 zj4ff9Iks93H6GBQx9/4oOYm5lTjb/F7ajMVlzeuqD94GkOzV+c4lJxQVTigy+93Mb9c
 K34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JZQfrHvu/bBhdWEEOPOqtsYnPe1VjfiCaChsH5RgZgw=;
 b=Y6kTvrpt5Fwy1g3IS+NyjIa+F7r07angH00IarqtUAKRFRU2XGfFo4oF+D3JfSBuRa
 xIrO4IZgVQ59BhX0LQWtdx8AeH67ldMo41mdlVqqYiNOI35HKEFloaHcuq1pr/f5GE2i
 78O5qltoqMDDe4E7eQycleznC7JmgDK+PUWS1q1UaynxTQIHmvKLxEfzmg093i8qrIWb
 sKCl1LX1XYPAK0RAqfqQLY3ssGXTNEAcJ0n7PxGsugyu1XIP3fZD+YAGATPN+g5dX+if
 P6vijBa21rH06GmXzL17HqOT2jkkMGcDh2tnYtYUXpEnLY6ggoa68jY3DI4C5UjF3MQx
 DtoA==
X-Gm-Message-State: AOAM531zzoivntFZKih5pc/D/ApL+kYZ83psV2Wh8yCqrfYCYrmvKfOY
 aNiABlgTufH6hG03gc1nuPqGTuhqzSMkxQ==
X-Google-Smtp-Source: ABdhPJx/gFf8w52x8JeW7lg7Q5ty+XcdVm26g00Y5FHEj3bp8QYxldkEJN6OBUwFIefUxg1mHbMwig==
X-Received: by 2002:a1c:c20a:: with SMTP id s10mr1608917wmf.0.1620718194586;
 Tue, 11 May 2021 00:29:54 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j13sm32139858wrd.81.2021.05.11.00.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:29:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/10] gitlab-ci: Ease forks pipeline workflow
Date: Tue, 11 May 2021 09:29:42 +0200
Message-Id: <20210511072952.2813358-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
Gitlab recommends to use job templates. To be able to re-use /=0D
include templates, they can not use YAML anchors. All current jobs=0D
has first to be converted to use the 'extends' keyworkd.=0D
This is the first part of this series (already reviewed).=0D
=0D
The second part extracts various generic jobs (which can be reused=0D
by forks) as template.=0D
=0D
Since RFC v1 [1]:=0D
- Remove dynamically generated pipelines (Daniel)=0D
- Addressed Thomas/Wainer review comments=0D
=0D
Alex Benn=C3=A9e review comments *not* addressed:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg799947.html=0D
=0D
Supersedes: <20210418233448.1267991-1-f4bug@amsat.org>=0D
Based-on: <20210503104456.1036472-1-thuth@redhat.com>=0D
https://gitlab.com/thuth/qemu.git tags/pull-request-2021-05-03=0D
(keeping moxie target)=0D
=0D
[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg799735.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (10):=0D
  gitlab-ci: Replace YAML anchors by extends (acceptance_test_job)=0D
  gitlab-ci: Rename acceptance_test_job -> integration_test_job=0D
  gitlab-ci: Extract container job template to container-template.yml=0D
  gitlab-ci: Extract crossbuild job templates to crossbuild-template.yml=0D
  gitlab-ci: Extract DCO/style check jobs to static_checks.yml=0D
  gitlab-ci: Extract build stages to stages.yml=0D
  gitlab-ci: Extract default build/test jobs templates=0D
  gitlab-ci: Extract all default build/test jobs to buildtest.yml=0D
  gitlab-ci: Extract core container jobs to container-core.yml=0D
  gitlab-ci: Move current job set to qemu-project.yml=0D
=0D
 .gitlab-ci.d/buildtest-template.yml  |  69 +++=0D
 .gitlab-ci.d/buildtest.yml           | 726 +++++++++++++++++++++++=0D
 .gitlab-ci.d/container-core.yml      |  17 +=0D
 .gitlab-ci.d/container-template.yml  |  22 +=0D
 .gitlab-ci.d/containers.yml          |  39 +-=0D
 .gitlab-ci.d/crossbuild-template.yml |  41 ++=0D
 .gitlab-ci.d/crossbuilds.yml         |  43 +-=0D
 .gitlab-ci.d/qemu-project.yml        |  11 +=0D
 .gitlab-ci.d/stages.yml              |   8 +=0D
 .gitlab-ci.d/static_checks.yml       |  24 +=0D
 .gitlab-ci.yml                       | 841 +--------------------------=0D
 11 files changed, 923 insertions(+), 918 deletions(-)=0D
 create mode 100644 .gitlab-ci.d/buildtest-template.yml=0D
 create mode 100644 .gitlab-ci.d/buildtest.yml=0D
 create mode 100644 .gitlab-ci.d/container-core.yml=0D
 create mode 100644 .gitlab-ci.d/container-template.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuild-template.yml=0D
 create mode 100644 .gitlab-ci.d/qemu-project.yml=0D
 create mode 100644 .gitlab-ci.d/stages.yml=0D
 create mode 100644 .gitlab-ci.d/static_checks.yml=0D
=0D
-- =0D
2.26.3=0D
=0D

