Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20C5392206
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:26:47 +0200 (CEST)
Received: from localhost ([::1]:54926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm139-0003XB-16
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0vN-000207-3G
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:18:45 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:47020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0vK-00088z-G4
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:18:43 -0400
Received: by mail-wr1-x42c.google.com with SMTP id g17so2314064wrs.13
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iAyyIRBjtiB2fLiwtSV1XZ3x9kuJ639aRGZgrk3biOA=;
 b=rSQgBS9bTjTxxjBjU44zUP0aiUNoBxB2uIfS82DC1tq+mghqWmQy6bE12UErK9BNBG
 QYhE51UUXENgPJQ4FVa4+r+FWI4TgR454Xaa9Cs1BtAj00SwgLhj2GHPKlZCMaPp7UMv
 9eYcCR9DyHLg1TNdmDgVgIk4LnR0GSXTDOJZnkz8ejq4bClO5YlwnRBdXuJmkCGJftOz
 7Ug+ja14OxY0b4X9NBuoR/p9eDqZc1lpyBsc3cnTcK6qP4oeUrzJi5xbt5oBvh2roGqh
 TDFBUj3mqnpCs7HNgiVXL3ZfYq450WuRwo6qjVN9WYxEDzTfh9itUskLwv6XfstujHLC
 bRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iAyyIRBjtiB2fLiwtSV1XZ3x9kuJ639aRGZgrk3biOA=;
 b=Xf1uAYbHCpAjFUHsxBjHyIBIWVMdoIH4/tBwpqM3mnSf3RGYkkKme0veOzOsVLrLRO
 6+wQhGEQn6OcjAQAo5a7Of1HOrn0eYZDSRb3uCRrzroAZ6Sr1LuyGkJnJYQIpdaiV/fe
 kL5iGFzik415kCEvCdMIaI9T/5j/lkE9/lTM2kMUL/B792Al67k+mhBidRyohv9E9nU3
 fSz2j1HTnooQT6UVxsuWQUDw/sRtXe5xpvN1Yj9cpzORSsL2DBVizMr6qB7bY4RmglHR
 qzQfk4PuoDlIDFMXEqW5STYbz5OR0y5hA+bLtMoj844nZ905LTq4NOBAZwYtiNixy2el
 0zcA==
X-Gm-Message-State: AOAM5301teMVAuC8wssKd2exHD75LozcIVR55XxiBPKGCUv2chl+1mS4
 wiavlBqVh1KbUUtlGKU7bGg64IIoJJJJJA==
X-Google-Smtp-Source: ABdhPJz3OTkF69Q5Yxw7mzOJmEGhanuum3e4VOxDADrCFLxDRAPg88kecVoi3QV7cesyusAeRQKQFw==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr34762649wre.157.1622063920691; 
 Wed, 26 May 2021 14:18:40 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id j101sm178174wrj.66.2021.05.26.14.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:18:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/19] gitlab-ci patches for 2021-05-26
Date: Wed, 26 May 2021 23:18:19 +0200
Message-Id: <20210526211838.421716-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2ab2dad01f6dc3667c0d53d2b1ba46b511031207=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kraxel/tags/input-20210526-pull-req=
uest' into staging (2021-05-26 15:27:20 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/gitlab-ci-20210526=0D
=0D
for you to fetch changes up to 740890e8935fff09023bb34c52e74ab1d539b775:=0D
=0D
  gitlab: Split gprof-gcov job (2021-05-26 23:01:47 +0200)=0D
=0D
----------------------------------------------------------------=0D
GitLab CI patches queue=0D
=0D
- Explode .gitlab-ci.yml in reusable templates=0D
- Add job to cross build/test TCI on i386 host=0D
- Remove CentOS 7 linux-user build job=0D
- Split gprof-gcov job=0D
- Temporarily set Avocado-based jobs in manual mode=0D
- Increase time to hold Avocado reports to 1 week=0D
=0D
----------------------------------------------------------------=0D
=0D
Daniel P. Berrang=C3=A9 (1):=0D
  gitlab: Drop linux user build job for CentOS 7=0D
=0D
Philippe Mathieu-Daud=C3=A9 (16):=0D
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
  gitlab: Split gprof-gcov job=0D
=0D
Richard Henderson (2):=0D
  gitlab: Rename ACCEL_CONFIGURE_OPTS to EXTRA_CONFIGURE_OPTS=0D
  gitlab: Enable cross-i386 builds of TCI=0D
=0D
 .gitlab-ci.d/buildtest-template.yml  |  81 +++=0D
 .gitlab-ci.d/buildtest.yml           | 741 ++++++++++++++++++++++=0D
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
 12 files changed, 1193 insertions(+), 1126 deletions(-)=0D
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

