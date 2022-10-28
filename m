Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B74F610DF2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:57:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooM6v-0003EW-Ff; Fri, 28 Oct 2022 05:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooM6s-0003EF-TV
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:57:06 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooM6r-0004JM-3w
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:57:06 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so6238540wms.0
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 02:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZcQk4+4RzauPJgZw7fO2KDWQiAsO9lk4ISiCGP95neA=;
 b=Hm00jCXqRPuaeYXiF4T56BhoISb0eKH9PQInuGVfnc6U70mYunbLp4KIElm8ZI/ja6
 1bqo/Yrxq+QSkcOB3kmHAdFaJSHPxwIExnx9ynURGBHvTQfia4sjGJ35uquQuyUV3wPT
 f5e1X7cO5giJ99czgCm1auOLV8SpJjqPTRrkh9jEtE07lMuAOc7FWJ+Rq60/zlQL6Jf0
 ZLHvkVKpW2qTFA2Ps4lJfAtAKejaCtx3tHKnuHEumZKZBK+Jbvusu6F+KOp0Nyu/n78I
 xtFb+ixJ8oQWO3aWfIJ6Fq+gYigmlxoyLMf+OyEnvpDdUAcivvInt7gx13zmO0amwYj8
 3Ktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZcQk4+4RzauPJgZw7fO2KDWQiAsO9lk4ISiCGP95neA=;
 b=R+TXlJFbBfn2Tdd/tznKBalHId55h/gbmwini6ceelE7RxOz5Ryjs8veFqNySlicRU
 CnM/HkMutTFkxNvgAGX6eOZSbtcS9b2WbCh/JaeRHzE+2k6LzSLvCgDNWJssRHGFDl0Z
 xdTdCCAOwHPJdASEHTPzng8wFVZXDkQLuRroYfd9YROVjR9/yiLY0jz2yF6sEeyJfLh5
 Js1v67awKdRDsX4XYMBSnmaLaFXHULNBGisQ7+MWI8PLGJgyC3RY6/ximWqYQjVlZZYe
 W7YSCxLNP4fWKQQpzEAJSWHRDGqU6C0RcOsNxdXE999B8gGUz5Xj6JlKx3rm92u5tKWE
 K3+w==
X-Gm-Message-State: ACrzQf2ex4TjoCPbVMIk11xosE4TdvxCVvHabOAM74A3gRJ+xFRZFncq
 ScFgUYhDtqC2Eu3epMNV8eHEO06h6QmNWr5g
X-Google-Smtp-Source: AMsMyM7n5gbEUfaW0unViB124YINhiFGCsua4X7DyUxGypqIWuESR1NsUEhEqle+691fUUCow1h/Ig==
X-Received: by 2002:a05:600c:4e05:b0:3c6:f0bb:3175 with SMTP id
 b5-20020a05600c4e0500b003c6f0bb3175mr8888476wmq.135.1666951022577; 
 Fri, 28 Oct 2022 02:57:02 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d5004000000b0023655e51c33sm3249844wrt.4.2022.10.28.02.57.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 28 Oct 2022 02:57:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v5 0/3] tests/docker: update fedora-win[32|64]-cross with
 lcitool
Date: Fri, 28 Oct 2022 11:56:56 +0200
Message-Id: <20221028095659.48734-1-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Alex, in order to review carefully this patch:
https://lore.kernel.org/qemu-devel/20221027183637.2772968-2-alex.bennee@linaro.org/
I split it in 3 to convert in trivial patches to review.
(I kept your S-o-b tag).

Please consider as a replacement for your testing/next PR.

Regards,

Phil.

Alex Bennée (3):
  tests/lcitool: Rename non-Debian specific helper
  tests/lcitool: Refresh to latest libvirt-ci module
  tests/docker: update fedora-win[32|64]-cross with lcitool

 tests/docker/dockerfiles/alpine.docker        |   2 +-
 tests/docker/dockerfiles/centos8.docker       |   2 +-
 .../dockerfiles/debian-amd64-cross.docker     | 234 ++++++++---------
 tests/docker/dockerfiles/debian-amd64.docker  | 236 +++++++++---------
 .../dockerfiles/debian-arm64-cross.docker     | 232 ++++++++---------
 .../dockerfiles/debian-armel-cross.docker     | 230 ++++++++---------
 .../dockerfiles/debian-armhf-cross.docker     | 232 ++++++++---------
 .../dockerfiles/debian-mips64el-cross.docker  | 226 ++++++++---------
 .../dockerfiles/debian-mipsel-cross.docker    | 226 ++++++++---------
 .../dockerfiles/debian-ppc64el-cross.docker   | 230 ++++++++---------
 .../dockerfiles/debian-s390x-cross.docker     | 228 ++++++++---------
 .../dockerfiles/fedora-win32-cross.docker     | 139 ++++++++---
 .../dockerfiles/fedora-win64-cross.docker     | 138 +++++++---
 tests/docker/dockerfiles/fedora.docker        | 230 ++++++++---------
 tests/docker/dockerfiles/opensuse-leap.docker |   2 +-
 tests/docker/dockerfiles/ubuntu2004.docker    | 234 ++++++++---------
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |  48 ++--
 18 files changed, 1499 insertions(+), 1372 deletions(-)

-- 
2.37.3


