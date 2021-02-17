Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493A831D94A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:21:43 +0100 (CET)
Received: from localhost ([::1]:41116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCLpu-00049b-AA
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLo3-0002SQ-L2
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:19:48 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLnu-0000Jj-7h
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:19:44 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v14so17172669wro.7
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 04:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KLmIYx45Qq99mtMzxc9/FC59wrJL6MQUdIEu+lAXxVM=;
 b=SQWU5ZpNypFKXsTbmoa7mCgz4Z8yJUO9BYy+qAa0S4f99DXH2QGjKQFhDW0sk6uOwJ
 guYWZZAOKuiRn0lXjM2xC4TlC05ymPUjjgyH1ZRKgHK6iP1M+7K0AHAjeOE3KYWA/X+Q
 WLwIVK8PJE5I78xcHdm0lrBJyAXh9LXXsTtv4QnZUglUwK6dgIa7cgZL4ykyaHP5F8dr
 mXiBkYGZESuUnkB4zZUohMkD3vkLg2o8iTwHcpFrY4/now/JrS6JvIcgn8/SFL7SWWva
 eJqeG2A4P7224mRD9iC6lpqvQCXCpVEQrtxo5+KiCzFPKT6mCuWuGhZgUXGOBSsizyPs
 8t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KLmIYx45Qq99mtMzxc9/FC59wrJL6MQUdIEu+lAXxVM=;
 b=U71HD1mh2QHn/CFWBBzXrzwr7AEHSWCJqaPLJSlKbuZEY56ORkLwpRLG65WWCIGEqS
 iwXgcymdHcalElB+3B2fuxa8ucoaW29oceqW2ECs9o2q3dtAphu3UXbul7UrE0MhWX0Z
 o4RlnZMzvI10ZiglsQkvhE8ohx0/zyIFNpLHe/Uoe9cG3Xpqt+OyiRJHcRWBpoA8A66k
 vjAVIzki/r4+NrkF5tUnoCY2OYgK9aLtgxoAeyoSdULVzYM6QrRHJRpTiMAf+1CKYMeq
 f7iGIayV9Sq/n8+TsDpGcQ236djoiYQKRFXVe4XgpZMfrZl4xjHUTjHfgy/tWT1MyLgy
 lrZA==
X-Gm-Message-State: AOAM5301johss+vw/hwHM8Ceqpq94ebFMtep+MliYvT7Cu15K60vyL/x
 0qM/zjxod1B8JbZGCO1KysyanA==
X-Google-Smtp-Source: ABdhPJxB8HncECB9yzGxrpxsbzhh08OfXcWvxHGjPtYMZTB75vt5gB6dK51R6eL3E/skfvMzUjE6QQ==
X-Received: by 2002:adf:f285:: with SMTP id k5mr29115925wro.285.1613564374331; 
 Wed, 17 Feb 2021 04:19:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k15sm2701659wmj.6.2021.02.17.04.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 04:19:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7892C1FF7E;
 Wed, 17 Feb 2021 12:19:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/6] my current testing/next queue (meson/gitlab/fedora
 bump)
Date: Wed, 17 Feb 2021 12:19:26 +0000
Message-Id: <20210217121932.19986-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Currently the my queue is fairly short and mainly contains little
quality of life improvements to the testing and CI bits. I'm mainly
posting to roll-up the random patches into a series.

The only patch in need of review is:

 - tests/acceptance: allow a "graceful" failing for virtio-gpu test

but feel free to pass comment on the others if you want to ;-)


Alex Bennée (2):
  meson.build: expose TCG cross compiler information in summary
  tests/acceptance: allow a "graceful" failing for virtio-gpu test

Philippe Mathieu-Daudé (2):
  gitlab-ci: Display Avocado log content when tests timeout
  docker: Bump Fedora images to release 33

Thomas Huth (2):
  gitlab-ci.yml: Run check-tcg with TCI
  travis.yml: Limit simultaneous jobs to 3

 meson.build                                    | 18 ++++++++++++++++++
 .gitlab-ci.yml                                 |  6 +++---
 .travis.yml                                    |  4 +++-
 tests/acceptance/virtio-gpu.py                 |  7 ++++++-
 .../dockerfiles/fedora-cris-cross.docker       |  2 +-
 .../dockerfiles/fedora-i386-cross.docker       |  2 +-
 .../dockerfiles/fedora-win32-cross.docker      |  2 +-
 .../dockerfiles/fedora-win64-cross.docker      |  2 +-
 tests/docker/dockerfiles/fedora.docker         |  2 +-
 tests/tcg/configure.sh                         |  8 --------
 10 files changed, 35 insertions(+), 18 deletions(-)

-- 
2.20.1


