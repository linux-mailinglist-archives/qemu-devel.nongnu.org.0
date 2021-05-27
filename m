Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3C7393153
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:47:37 +0200 (CEST)
Received: from localhost ([::1]:38034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHIO-0007op-A4
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmHGx-0006Sp-2r
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:46:07 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmHGn-0000Zn-Pp
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:46:06 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r10so115349wrj.11
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 07:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OU3cNk4BQUz74+m48Ega2/uQplIjDVwUhfWV+uBnj1g=;
 b=AFxtZVPH+OhAgSZYpM0dkPJ5unJ0l0X7bMzUk8RYlVrc+gm3X1xksxSNZU5kpUcdv0
 EVzhnJKh76iBaDEwMfSzgbvR6fzm3DD60c8191SUJz0nq17IVty4TFNIL8P6PblxqqaZ
 iNntaiKrgI+Sir/am3xHbzQJ8MEaioeTDSUPZgnJMZ7xJCOmbfCbsrg6UaBvtuT3Ov8M
 tf2cI0N31UqtKKvloaPgPgaM+Ge9ctleDBosnzeW7J7iJdinmjMAjYkMryItG9mZqmkk
 4XXfdP1fbFD10NTMCgwaZYem4sGNxLIcf40GRFeOLpPkKiv+OWYgHMd85JBT03FoMmXP
 NBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OU3cNk4BQUz74+m48Ega2/uQplIjDVwUhfWV+uBnj1g=;
 b=ECbaLSBkI3WGV8eyenujEyUwNQu9TQbmBQqZeD4M3BQabr7intFQXE35zbEJCZ4l37
 u50AULR28sBD7knG4vrN+4uFwdbw9iOjnoWROtOHKfUth9S54RbWlB1pseGydGTNnOhf
 BWabkDd7mqe0SWWEYqpLdZPnoNeXtBWRTB2a++Xil2oJu6yg98+hXNVBby2uRsh19RSc
 Q0ldxpZhb1YEtfsIMe+2SyZE+BxjsSDOLS/cjUkYYkBgxtdJFrAb91qH4PHvWYbcejvr
 OSuvbkBqBk5QT9CRIKEncski7D1cHGcxCs/HsOEOJXGjxJ/7Zv1s4mE74Z79TFcxHaT1
 3qbQ==
X-Gm-Message-State: AOAM532hNQhxoyeTbdkoShU49FsrHyxVfF24mK8ySyNDkxt/dyRC76Bq
 IbIb3b7MZbIE+et5e1K0I1pUtUf3Hc7rbQ==
X-Google-Smtp-Source: ABdhPJzjzmt7YnKmFTeu7HhwAY7GTREqgNMUvgGpLf//87Vsb+SRtIR/mJMqpblq5qznbhH3uzaCug==
X-Received: by 2002:adf:f287:: with SMTP id k7mr3776212wro.280.1622126755857; 
 Thu, 27 May 2021 07:45:55 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id k205sm3201102wmf.13.2021.05.27.07.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 07:45:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/18] gitlab-ci patches for 2021-05-26
Date: Thu, 27 May 2021 16:45:31 +0200
Message-Id: <20210527144533.688225-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2: Rebased on top of 7cf333a3726 ("gitlab-ci: use --meson=3Dgit for CFI jo=
bs")=0D
=0D
The following changes since commit 8385235ba99c53d1187658f2fc289b953a8090b1=
:=0D
=0D
  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' i=
nto staging (2021-05-26 21:05:36 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/gitlab-ci-20210527=0D
=0D
for you to fetch changes up to 2d9e45b9cb0baa7316901238f3795a74206af457:=0D
=0D
  gitlab: Convert check-dco/check-patch jobs to the 'rules' syntax (2021-05=
-27 16:39:23 +0200)=0D
=0D
----------------------------------------------------------------=0D
GitLab CI patches queue=0D
=0D
- Explode .gitlab-ci.yml in reusable templates=0D
- Add job to cross build/test TCI on i386 host=0D
- Remove CentOS 7 linux-user build job=0D
- Temporarily set Avocado-based jobs in manual mode=0D
- Increase time to hold Avocado reports to 1 week=0D
=0D
----------------------------------------------------------------=0D
=0D
Daniel P. Berrang=C3=A9 (1):=0D
  gitlab: Drop linux user build job for CentOS 7=0D
=0D
Philippe Mathieu-Daud=C3=A9 (15):=0D
  gitlab: Replace YAML anchors by extends (acceptance_test_job)=0D
  gitlab: Extract container job template to container-template.yml=0D
  gitlab: Extract crossbuild job templates to crossbuild-template.yml=0D
  gitlab: Extract DCO/style check jobs to static_checks.yml=0D
  gitlab: Extract build stages to stages.yml=0D
  gitlab: Extract default build/test jobs templates=0D
  gitlab: Extract core container jobs to container-core.yml=0D
  gitlab: Extract all default build/test jobs to buildtest.yml=0D
  gitlab: Move current job set to qemu-project.yml=0D
  gitlab: Document how forks can use different set of jobs=0D
  gitlab: Extract cross-container jobs to container-cross.yml=0D
  gitlab: Keep Avocado reports during 1 week=0D
  gitlab: Run Avocado tests manually (except mainstream CI)=0D
  gitlab: Use $CI_DEFAULT_BRANCH instead of hardcoded 'master'=0D
  gitlab: Convert check-dco/check-patch jobs to the 'rules' syntax=0D
=0D
Richard Henderson (2):=0D
  gitlab: Rename ACCEL_CONFIGURE_OPTS to EXTRA_CONFIGURE_OPTS=0D
  gitlab: Enable cross-i386 builds of TCI=0D
=0D
 .gitlab-ci.d/buildtest-template.yml  |  81 +++=0D
 .gitlab-ci.d/buildtest.yml           | 730 ++++++++++++++++++++++=0D
 .gitlab-ci.d/container-core.yml      |  17 +=0D
 .gitlab-ci.d/container-cross.yml     | 192 ++++++=0D
 .gitlab-ci.d/container-template.yml  |  21 +=0D
 .gitlab-ci.d/containers.yml          | 232 +------=0D
 .gitlab-ci.d/crossbuild-template.yml |  41 ++=0D
 .gitlab-ci.d/crossbuilds.yml         |  60 +-=0D
 .gitlab-ci.d/qemu-project.yml        |  11 +=0D
 .gitlab-ci.d/stages.yml              |   8 +=0D
 .gitlab-ci.d/static_checks.yml       |  26 +=0D
 .gitlab-ci.yml                       | 889 ++-------------------------=0D
 12 files changed, 1182 insertions(+), 1126 deletions(-)=0D
 create mode 100644 .gitlab-ci.d/buildtest-template.yml=0D
 create mode 100644 .gitlab-ci.d/buildtest.yml=0D
 create mode 100644 .gitlab-ci.d/container-core.yml=0D
 create mode 100644 .gitlab-ci.d/container-cross.yml=0D
 create mode 100644 .gitlab-ci.d/container-template.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuild-template.yml=0D
 create mode 100644 .gitlab-ci.d/qemu-project.yml=0D
 create mode 100644 .gitlab-ci.d/stages.yml=0D
 create mode 100644 .gitlab-ci.d/static_checks.yml=0D
=0D
-- =0D
2.26.3=0D
=0D

