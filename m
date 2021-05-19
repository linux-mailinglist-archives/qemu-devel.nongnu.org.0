Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D970438969A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:24:43 +0200 (CEST)
Received: from localhost ([::1]:58014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRoA-0007rW-RT
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRLa-0006Ru-MC
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:10 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRLY-00024H-KR
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:10 -0400
Received: by mail-wr1-x435.google.com with SMTP id y14so13014442wrm.13
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/gz15emBfyQO0qz/swVTPOSDAivUz159vsr4Bp5YDmI=;
 b=PK9UWIhyD+X8Lkyn7yya8KSS87q5FwLbphmupDgwIuYcni/yIP7uJVhkLO4/WgjWl9
 wdZk0JsVWXXCNkeSj6GprRXiPvRCC34wP3KDRECgGoV7NjcSaqWOoI715+LdXH4nFvD5
 JxgXkMm4dBJaoQBuauGF/+QdOz4My/NpNiEzRTppEWVs986fyaou72N/M0bT62Cn7Ucv
 8ujHofByhIeECmq3JOjZaNHoODiLh2ubtzij3DEi5lKEMCrSdZZ/2zOgkViLoihLX7j/
 ZdDe1DyKl4krNfLbgGw92dHk7nFbPAC/LamzPiMauXXa4hy5cuRmRaCMXlFOwvjR4R1A
 906w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/gz15emBfyQO0qz/swVTPOSDAivUz159vsr4Bp5YDmI=;
 b=asXYL5bKLJKH2wG11h5sFGLMsmiJmWIIh7GYnqx/NXj2MMyhwTKfjKYE+o86l4E6/u
 j6Y0t7jmYkNt65dsi5Z1bG1KuKkYkMr35CVLX/Bwm0Nnu7Qo/T7WsEWzbWoATaAhlcdS
 Mjbb0SZ95N1O9u8sNmMLVVMncft1gRzA/mjDb+lHVv7HZJqWXUxJoTleSQVuc8Dh/Vsa
 +r4LSJayQJFf+Ei61lIdreLYPkJqMRWendgX+cb6bJkH7IEd7bwvZsYiEIn1cz2URilq
 b2MGXcXlizeQX/L5+CTy9t6WqeXQGjXXvW/ye6G/5J9wTnRVTDHlfQnpwJogFJZAumSZ
 NM0g==
X-Gm-Message-State: AOAM532jXBMXPiJHm1ofytK0jUIVGitb4vEBaE8Lo/On3K7aeFwNC9U7
 s/R1a1GtdJQTJlpbZ+g86qiZpB9J6/0XBA==
X-Google-Smtp-Source: ABdhPJyqF7ZWX3fVchOZQJYJknEI6yuPNSvFQUmFlB5V4ahZAniBgJS24tmf23f++i+lsIUMyMK9gg==
X-Received: by 2002:adf:fc44:: with SMTP id e4mr379129wrs.23.1621450506202;
 Wed, 19 May 2021 11:55:06 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id n15sm246784wrr.20.2021.05.19.11.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:55:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/10] gitlab-ci: Ease forks pipeline workflow
Date: Wed, 19 May 2021 20:54:54 +0200
Message-Id: <20210519185504.2198573-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

Series fully reviewed.=0D
=0D
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
Since v2:=0D
- Rebased (thuth ull-request-2021-05-03 merged)=0D
- Added Willian R-b tags=0D
=0D
Since RFC v1:=0D
- Remove dynamically generated pipelines (Daniel)=0D
- Addressed Thomas/Wainer review comments=0D
=0D
Alex Benn=C3=A9e review comments *not* addressed:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg799947.html=0D
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
 .gitlab-ci.d/buildtest.yml           | 725 +++++++++++++++++++++++=0D
 .gitlab-ci.d/container-core.yml      |  17 +=0D
 .gitlab-ci.d/container-template.yml  |  22 +=0D
 .gitlab-ci.d/containers.yml          |  39 +-=0D
 .gitlab-ci.d/crossbuild-template.yml |  41 ++=0D
 .gitlab-ci.d/crossbuilds.yml         |  43 +-=0D
 .gitlab-ci.d/qemu-project.yml        |  11 +=0D
 .gitlab-ci.d/stages.yml              |   8 +=0D
 .gitlab-ci.d/static_checks.yml       |  24 +=0D
 .gitlab-ci.yml                       | 840 +--------------------------=0D
 11 files changed, 922 insertions(+), 917 deletions(-)=0D
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

