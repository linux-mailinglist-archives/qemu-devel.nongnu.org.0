Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48118461CA0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:20:51 +0100 (CET)
Received: from localhost ([::1]:55102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkKg-0000EZ-35
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:20:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrkF1-0002Qe-T6
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:14:59 -0500
Received: from [2a00:1450:4864:20::42d] (port=39531
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrkEw-0001Ta-B4
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:14:55 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a18so38434926wrn.6
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 09:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uhhpo5yfNOPVDeE9x9mlPzmR8YX0tmaiA+JvfvZRrUo=;
 b=Hgr9aE8UrvNQt1YH/HjSxfp6eqrVZb4DlS8lI0adFX5ZGdXH8wlUx+3VOEVPUUCLfB
 rqfHnT7VcNLjBTlnYXxmxQfnVs5sEOJy4nDzDtDX+FfGo0lWm5jPKPQdBfW7YqmKeQFx
 W96YrZp5p6Y8NcLGAeqyPD9vZBdlwpj9En6gevQP+Xo1KFQWu8wE7k7J3apprbA6H95G
 dtbHfflqa717byzWNidX9luTvOYjqWIXYKLayxeiVTZ3H/n9C+PRn0YCoK/G/xEuobG4
 j++mHNmJSkYPc1Okd2g6VyT9Sr8Ybi7L1itzaBevEmQaNvWxaDn1qX6gm97ttntYt1b4
 hMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uhhpo5yfNOPVDeE9x9mlPzmR8YX0tmaiA+JvfvZRrUo=;
 b=RpREeaD55vkMNTv7BdEsO+u5HEAD7ojgep4mmRJFmu3J1xoFVt4ucLX8G/6ULK2fr6
 +Xp/Ysr/O8IKHvRrxz1WXSCnecT84crS1zlf4UBOheNe7xGmFaKoIPO3LR5HZy6W4ydt
 DzJZWJ9peK3UeMgVKFUG9RhWsWL4F5HXBaeq8fkWZexcp/gbY0Z5EKXNE+ZMmZUR6nK4
 65FsmlzABnsnODWIOEr0tZ6wGHrhdNJOf6RgitKz99I9UtL3KxfFc2M8Iu/dq1spV/uJ
 iQG4bO5kMU+Ot7Oc/vfw7c/WkL0fJsscBE//JFWmsedTHRHFjUh0q1qsCVc2Rs9zXMF4
 ecqA==
X-Gm-Message-State: AOAM533gu2E/HcLRvTJGxPN++Gg6Q9ChgMaybhsl+kWR08cYzfvpsCu+
 ZvSPcxnlgYMid0kHIbQmkLTjSg==
X-Google-Smtp-Source: ABdhPJyOvjOTDKMJ2N34CjSYP5a67MbVtFAmUsiq2rzMolv6Gz4Xaj03GufB+w2qh0qXzzjDTbr83w==
X-Received: by 2002:adf:82d3:: with SMTP id 77mr35590650wrc.377.1638206091397; 
 Mon, 29 Nov 2021 09:14:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z14sm15257327wrp.70.2021.11.29.09.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 09:14:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C9C281FF96;
 Mon, 29 Nov 2021 17:14:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	peter.maydell@linaro.org
Subject: [PULL for 6.2 0/8] more tcg, plugin, test and build fixes
Date: Mon, 29 Nov 2021 17:14:41 +0000
Message-Id: <20211129171449.4176301-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e750c10167fa8ad3fcc98236a474c46e52e7c18c:

  Merge tag 'pull-target-arm-20211129' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2021-11-29 11:56:07 +0100)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-for-6.2-291121-1

for you to fetch changes up to d5615bbf9103f01911df683cc3e4e85c49a92593:

  tests/plugin/syscall.c: fix compiler warnings (2021-11-29 15:13:22 +0000)

----------------------------------------------------------------
TCG, plugin and build fixes:

  - introduce CF_NOIRQ to avoid watchpoint race
  - fix avocado plugin test
  - fix linker issue with weird paths
  - band-aid for gdbstub race
  - updates for MAINTAINERS
  - fix some compiler warning in example plugin

----------------------------------------------------------------
Alex Bennée (5):
      accel/tcg: introduce CF_NOIRQ
      accel/tcg: suppress IRQ check for special TBs
      tests/avocado: fix tcg_plugin mem access count test
      plugins/meson.build: fix linker issue with weird paths
      gdbstub: handle a potentially racing TaskState

Juro Bystricky (1):
      tests/plugin/syscall.c: fix compiler warnings

Philippe Mathieu-Daudé (1):
      MAINTAINERS: Add section for Aarch64 GitLab custom runner

Willian Rampazzo (1):
      MAINTAINERS: Remove me as a reviewer for the build and test/avocado

 include/exec/exec-all.h      |  1 +
 include/exec/gen-icount.h    | 21 +++++++++++++++++----
 accel/tcg/cpu-exec.c         |  9 +++++++++
 accel/tcg/translate-all.c    |  4 ++--
 gdbstub.c                    |  2 +-
 softmmu/physmem.c            |  4 ++--
 tests/plugin/syscall.c       |  8 +++-----
 MAINTAINERS                  | 10 ++++++++--
 plugins/meson.build          |  4 ++--
 tests/avocado/tcg_plugins.py |  2 +-
 10 files changed, 46 insertions(+), 19 deletions(-)

-- 
2.30.2


