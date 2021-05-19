Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C5A38964F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:11:30 +0200 (CEST)
Received: from localhost ([::1]:43592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRbN-0002hm-2D
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRCe-000095-Ig
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:45:58 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRCc-00054N-6K
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:45:56 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso3782877wmc.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fFpVGZTIhYLL1gK9AxyVz2c9tJt4KtP/FZ93Sajl1VY=;
 b=fXPJnpQGSPVkeYGZ3v65XtCkwWV46er9Q6Zq5leFWAbw5Um1gB9uhMDMU6iuFly2/U
 OnqUdFPl971LiMhGXE6AXmij/cFQQ3I7zqbiM68GO3H+DXpNSA+HAwXXZrLVnLJhPMNT
 kzVB4GCdFdEtqTZeWu1021dHb7dQNwPHy3Ku7QfrKU0OnkBGDwyTrOL7AH7C0L2JcrmE
 7ddqgI+w1HBMOXv+W0SccAuWGsU2VDoEb3E0334s5AQLjue5NnkMunxDllbEx9mqJ8O6
 wQOurUPpyIIcG1ParkMFFF1BXhxBYLTkU/nR5BoBneNQIhXTQS7AEVw398aPUTeGd+Yj
 +n9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=fFpVGZTIhYLL1gK9AxyVz2c9tJt4KtP/FZ93Sajl1VY=;
 b=G4nfrHD7MoyVsp9nPhABpleGuMwMtgLzCHKI0kuAODntkzmTerByBkA3vvi5sHQxsN
 Ph3LG33+c/EmJL3X46QjJIBqww4/ZK2hYn2VrJK0JN6VfW1bOK+hTAfbCPHP+DS0QiV+
 oBiuGFUVpkyCNmatpFeeQsTVX8Viu4e+TU0NyUvh2mv7yhoADp2iA3HngDY5F5S4ibuR
 sdi2QTKaApQglITDgeGyy5EaI/7er37n6mAXkTyrExXN3LLT5RVDzBpCQZU6LSw5XlwK
 4EbH8dAhAiQvqWUNt70rqPMJFcZ3UiOtzzYJEjw/eLUmuw56hAHO2K7iF46gAlSrLMGP
 iX4A==
X-Gm-Message-State: AOAM531xmEy1YkaZa957/Kz2SERCg4+lZZN2YGFVS4SyH1uq7b/Ol7WR
 aeEbDoIqItfGiV0ymMEytD93YNsM67K1/Q==
X-Google-Smtp-Source: ABdhPJz+OG7FQndPh9+sMsb59mWKK33skvwhI/rzKHdIk7rpddI+1yFgQj9s9HPRs1GFCMpZT2G/yA==
X-Received: by 2002:a7b:cd01:: with SMTP id f1mr564644wmj.177.1621449951657;
 Wed, 19 May 2021 11:45:51 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id q13sm240767wrw.56.2021.05.19.11.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:45:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] gitlab-ci: Allow using FreeBSD runners
Date: Wed, 19 May 2021 20:45:43 +0200
Message-Id: <20210519184549.2192728-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Minor shell fixes to use FreeBSD runners.=0D
=0D
Since v2:=0D
- fixed typo (Warner)=0D
- added Warner R-b tag=0D
=0D
Since v1:=0D
- share the FreeBSD jobs, restricted with QEMU_CUSTOM_RUNNER=3Dfreebsd=0D
  so mergeable in mainstream.=0D
=0D
Jobs: https://gitlab.com/philmd/qemu/-/pipelines/301361673=0D
=0D
Based-on: <20210511072952.2813358-1-f4bug@amsat.org>=0D
gitlab-ci: Ease forks pipeline workflow=0D
which itself is based on:=0D
https://gitlab.com/thuth/qemu.git tags/pull-request-2021-05-03=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  gitlab-ci: Extract &environment_variables template=0D
  gitlab-ci: Adapt JOBS variable for FreeBSD runners=0D
  gitlab-ci: Run GNU make via the $MAKE variable=0D
  gitlab-ci: Add ccache in $PATH and display statistics=0D
  gitlab-ci: Simplify before/after script for Avocado based jobs=0D
  gitlab-ci: Add FreeBSD jobs=0D
=0D
 .gitlab-ci.d/buildtest-freebsd.yml  | 59 +++++++++++++++++++++++++++++=0D
 .gitlab-ci.d/buildtest-template.yml | 38 +++++++++++++++----=0D
 .gitlab-ci.d/qemu-project.yml       |  1 +=0D
 3 files changed, 91 insertions(+), 7 deletions(-)=0D
 create mode 100644 .gitlab-ci.d/buildtest-freebsd.yml=0D
=0D
-- =0D
2.26.3=0D
=0D

