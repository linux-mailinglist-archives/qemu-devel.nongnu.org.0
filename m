Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2FC3B1817
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 12:29:32 +0200 (CEST)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw08R-0003Es-SY
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 06:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw06z-00019z-2O
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:28:01 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw06x-0001Zc-6I
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:28:00 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 j11-20020a05600c1c0bb02901e23d4c0977so3023047wms.0
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 03:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y6wXN1+Wg/vec1bYOnwoiIn8nrg5S0O2o3ovAbqGvo8=;
 b=mjZWXeS8xlCL4ca1AXkcnRjS8PVPgdIoAjC1weFLoc2AbpXZc5Wril/BomMLq+sQZ4
 ePndMQk7xu3myk18WHPcnGbo+KsfwRH4AfAEn5r6kfguvT7xzh/JDAiljV0J0TYc2ygI
 qpSmfUtRdK476BWgC6ak+7l86o4/YY+PZFCsNCJfhCNOts8reImmz2Bi3wjFeYUIs87u
 oFJoHTQxkHvF1Y8R3QZ6tMIWAIpji196qcxESIztnsNaEMhyoIXG/ljygf18dmodpgYq
 GTs6fpHKo4jIl6A7qLCM+HD9dMEtb3Gp6EbpNJRVGriXiRCTwh54CLK64lmMwMdZYt9B
 WFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y6wXN1+Wg/vec1bYOnwoiIn8nrg5S0O2o3ovAbqGvo8=;
 b=ijOl1EEF01WgUKr1toTLAHyMAK9+IwKYCOadog2AeR2jgDrcaKuvueun506AQxH8e0
 m7FeaBSkVpwi9XV9gIgccoqu+7gox5T88+PKU6cGm/PG8qqEGrQyO/9kiMEPY6Spu1JN
 6lL1R8xv2qR6cc3QApItWCLne75B3h38vSsXAqGgaUKjlg+4qxsMC88nLoiGdS50N2e1
 c8dCNVVeOcJp28rK64iqOOGik/AXCm7C0KtI5ovF+QeLMO2ivN3cXI1yf8Zk2lBF0mUo
 K722j3u0bdR2mXLZuWLOKpcosts1tBu1CqMPhTnMj0iYS2JMhWYo7agYsEtBg54Qs34J
 aCXQ==
X-Gm-Message-State: AOAM532dQwxqYd6ilfGkE2SZvlaL3ElUZTvULoLHARvLAAEpa725U/Ms
 LSbmzTqSADTMHpn1xVQkWu4Jmg==
X-Google-Smtp-Source: ABdhPJwmGtDavRtjgFLq1kANjn85qWF37whhSo2CLkEjsGy8PUasSJos2TwdwGGCfAXCgHNSfpIcpg==
X-Received: by 2002:a05:600c:4788:: with SMTP id
 k8mr9845373wmo.35.1624444074750; 
 Wed, 23 Jun 2021 03:27:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z4sm2464882wrs.56.2021.06.23.03.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 03:27:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A90521FF7E;
 Wed, 23 Jun 2021 11:27:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/8] misc fixes pre-PR (docs, plugins, tests)
Date: Wed, 23 Jun 2021 11:27:41 +0100
Message-Id: <20210623102749.25686-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is a pre-PR series which collects up some miscellaneous random
bits and pieces. This includes various documentation tweaks, a minor
plugin helper API and a temporary suppression of the signals test for
s390x/hppa to keep CI green.

I should roll the PR on Friday morning so shout now if you want to
object to anything.

The following patches are un-reviewed:

 - tests/tcg: skip the signals test for hppa/s390x for now
 - tests/acceptance: tweak the tcg/kvm tests for virt


Alex Bennée (4):
  tests/acceptance: tweak the tcg/kvm tests for virt
  scripts/checkpatch: roll diff tweaking into checkpatch itself
  tests/tcg: skip the signals test for hppa/s390x for now
  plugins/api: expose symbol lookup to plugins

John Snow (2):
  GitLab: Add "Bug" issue reporting template
  GitLab: Add "Feature Request" issue template.

Luis Pires (1):
  docs/devel: Add a single top-level header to MTTCG's doc

Stefan Weil (1):
  Update documentation to refer to new location for issues

 docs/devel/multi-thread-tcg.rst            |  5 +-
 README.rst                                 |  6 +-
 include/qemu/qemu-plugin.h                 |  9 +++
 plugins/api.c                              |  6 ++
 .github/lockdown.yml                       |  6 +-
 .gitlab-ci.d/static_checks.yml             |  3 -
 .gitlab/issue_templates/bug.md             | 64 ++++++++++++++++++++++
 .gitlab/issue_templates/feature_request.md | 32 +++++++++++
 .patchew.yml                               |  3 -
 scripts/checkpatch.pl                      |  7 ++-
 tests/acceptance/boot_linux.py             | 24 ++++----
 tests/tcg/hppa/Makefile.target             |  4 ++
 tests/tcg/s390x/Makefile.target            |  4 ++
 13 files changed, 146 insertions(+), 27 deletions(-)
 create mode 100644 .gitlab/issue_templates/bug.md
 create mode 100644 .gitlab/issue_templates/feature_request.md

-- 
2.20.1


