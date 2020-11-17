Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B8B2B6BE8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:38:37 +0100 (CET)
Received: from localhost ([::1]:52462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4w8-0003M0-B6
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:38:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4uJ-0001iC-A0
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:36:43 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4uH-0006LQ-G4
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:36:42 -0500
Received: by mail-wr1-x435.google.com with SMTP id d12so23990192wrr.13
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cORYvcJojm/q7/iRMhCj6jVk76IWQV3RoYfns1SZ8Ig=;
 b=IIfwsRnGIDE4NE7FPhrgCWIYsusJBLxSoUSJKVIGX95kBdoRWuxHZO2JoPGuDL/pwY
 VmONkGl4p3mr1EmJQTbdXNhvAPJhOkGofGZL1B3sPSyRLsrAbKhf++MGhbIsmAVFXUfw
 M4i0+An8lCHm34/e0xtf/UF3JdU3keLF0pLSrggCHcnCAjJrocpFT3zE8tWy87l0zEZ3
 OSGh234//+74qyj8npySh1kNrhhlSRqS20ZtI6zsK88TB2CA2cFpaLZ/FTleEI8pFkgC
 V+jOuKouEdyiG5vDdhA+kzVR4odkbfDzuvTSQYWRv0ku3LtHyX8URb/hcPk/6wouJ3Eq
 VNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cORYvcJojm/q7/iRMhCj6jVk76IWQV3RoYfns1SZ8Ig=;
 b=LEqAEkxxcnUsnmJnt4HYoFvSZL352NAh2LgDtEqXtEmIWrwpxMahhczw75uCpgiCli
 O31YFZe6HX8FVleINONJWqvzCKS7W3pIyRE6LOlpRFCiLlVXTB9ACUbkcoSS3exBFDfQ
 szakRdlGIu4/X9fKpzKOo8AhAByXWS/+MIXPFUGDwl3/7UWVPn+tLr/qnmjvpDK8t2QT
 Y48RuDi0zFwPe2Mf2G78Hyxnanz32ggBb4Yp6Mf7KBi07Rsc4Yxq2D3iR8tueEY7VyAl
 1RnVAF1YDOR/nHqmIzGWtc1e6Yl6w07sjXONbIAvPRzJvJaCIGQ9gFtAb6iPAj75qpxe
 sTqw==
X-Gm-Message-State: AOAM532gTEdKIQcLi+kYdb+jeWMgZGRc1sGXL124k1NTDxHCvoVdL1Ga
 KYHIo+Y+3WgGF8+wtWBSGHI7zw==
X-Google-Smtp-Source: ABdhPJx6/z47tZFuhcYemk3gv75dQmI1LPqf/QwbQwi2T3W6CeiZF286634CxiaLomQ9ZcT26cHgYQ==
X-Received: by 2002:a5d:6250:: with SMTP id m16mr660127wrv.400.1605634597175; 
 Tue, 17 Nov 2020 09:36:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j8sm24780548wrx.11.2020.11.17.09.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:36:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5B60D1FF7E;
 Tue, 17 Nov 2020 17:36:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 5.3-rc3 v1 0/6] testing fixes (avocado, gitlab)
Date: Tue, 17 Nov 2020 17:36:29 +0000
Message-Id: <20201117173635.29101-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Here are a few more minor fixes for 5.2-rc3:

  - a tweak to the gitlab status script (from last series)
  - moving check-tcg to gitlab (also in last series)
  - fix some tempdir names and left overs
  - moving some more tests to gitlab

The following need review:

  - gitlab: move remaining x86 check-tcg targets to gitlab
  - tests/avocado: clean-up socket directory after run
  - tests: add prefixes to the bare mkdtemp calls
  - scripts/ci: clean up default args logic a little

Alex Bennée (4):
  scripts/ci: clean up default args logic a little
  tests: add prefixes to the bare mkdtemp calls
  tests/avocado: clean-up socket directory after run
  gitlab: move remaining x86 check-tcg targets to gitlab

Philippe Mathieu-Daudé (2):
  tests/docker: Install liblttng-ust-dev package in Ubuntu 20.04 image
  gitlab-ci: Move trace backend tests across to gitlab

 .gitlab-ci.yml                             | 35 +++++++++++++++++
 .travis.yml                                | 45 ----------------------
 python/qemu/machine.py                     |  3 +-
 scripts/ci/gitlab-pipeline-status          | 24 ++++++------
 tests/acceptance/avocado_qemu/__init__.py  |  4 +-
 tests/docker/dockerfiles/ubuntu2004.docker |  1 +
 6 files changed, 54 insertions(+), 58 deletions(-)

-- 
2.20.1


