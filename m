Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342563E2C3D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:11:46 +0200 (CEST)
Received: from localhost ([::1]:53984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC0Zd-0006JS-8w
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mC0YI-0004rx-MV
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:10:22 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mC0YH-0008CH-2O
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:10:22 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso9069043wmg.4
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 07:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1u60/nPIwygG2AxvoD6aHQiquWr0gdbwEzIBSfgcYP0=;
 b=mZoWe5hVM1+L79nqcqM0MEsf9FekJDQ+CADQWTOCMM8HJmtAb93Ppp1S8KuXAGGX/X
 l83bDrkvDN9q1w+fTtnq2HKvMKIZzeAxz85s5TeMB7rl6PyixXyYMGGpgHceR7CgrFLu
 qqRh/ZinvFlXpZ2u+eOJZjHcrnjknOiRKA7wyMe4na+vApDVLL3a0BbN61oYYZf4UJ/Q
 btIHctvEzHv7IzVJaOhluJGMJENAd5l3KWY9ZB0RLEso7cP2iUknpid+oH1OW3kdw7wr
 roO/4LcM8KNDMacIGkznnFFeH4WQntEgbWhnjj8MwbeWDqjRNUOJl6OQOQvobdpW2gmD
 hHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1u60/nPIwygG2AxvoD6aHQiquWr0gdbwEzIBSfgcYP0=;
 b=dTle8El2KRlQC1t/8QCqRZ5Cx5edpLUeyYCgmquYd+nlN033rHZB2rsuTMikAAFnRY
 9agmqLptNOXiXznRCrkf4y32uI4buugGB1mkuWU6HGC9mL8gQY9Ia84Zb5lCl2VIXLGs
 6aQV6NGO6/1ZbVK54uihw9KZdF2TQbP+8ZQaJZzv44lJddzbDpssod2b5UX9TFwweUxt
 +gqlCkJzQ9ey2ES9FUm9e1wDUGERGgZOCMNNwv2o7cMNPzoY7H/0f8gw7m4tPIjrTSm0
 IMxFXt3aJv99q16esE24tQtV0066Czk5S8acZtl8Hiq354ypL6XX/bOXFjqIwRseQwxN
 dKDA==
X-Gm-Message-State: AOAM531zFslw/YLTsZB14LedA0IYU3l/kWHO4UIXQ8L3RIn9GOB7QEOA
 93Vm7nAOwl2mawOKC5TEh3zU9w==
X-Google-Smtp-Source: ABdhPJzB7sxjJZhiweRRyput6RJIh553LyHE/ZI3HOCuCJQdRZ2ixhykteuajV86T+cPc4a5dju2Bg==
X-Received: by 2002:a1c:9a97:: with SMTP id c145mr20589215wme.42.1628259018141; 
 Fri, 06 Aug 2021 07:10:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h4sm10071670wru.2.2021.08.06.07.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 07:10:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B53751FF96;
 Fri,  6 Aug 2021 15:10:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.1-rc3 v1 0/4] gitlab and plugins pre-PR
Date: Fri,  6 Aug 2021 15:10:11 +0100
Message-Id: <20210806141015.2487502-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

There isn't much in my queue but I figured I best post it now so I can
cut a PR from it next week. I'll be off most of August so this will
likely be the last PR for 6.1 from me.

Mahmoud Mandour (1):
  plugins/execlog: removed unintended "s" at the end of log lines.

Thomas Huth (3):
  gitlab-ci: Merge "build-disabled" with
    "build-without-default-features"
  gitlab-ci: Remove superfluous "dnf install" statement
  gitlab-ci: Fix ..._RUNNER_AVAILABLE variables and document them

 docs/devel/ci.rst               | 13 +++++
 contrib/plugins/execlog.c       |  2 +-
 .gitlab-ci.d/buildtest.yml      | 99 +++++----------------------------
 .gitlab-ci.d/custom-runners.yml | 12 ++--
 4 files changed, 33 insertions(+), 93 deletions(-)

-- 
2.30.2


