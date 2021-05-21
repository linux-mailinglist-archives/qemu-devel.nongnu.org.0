Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EDE38C8E7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 16:04:54 +0200 (CEST)
Received: from localhost ([::1]:58760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk5ll-0003wb-Vz
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 10:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lk5kr-0003IN-GI
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:03:57 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:35528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lk5kq-0001Im-0J
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:03:57 -0400
Received: by mail-lf1-x12e.google.com with SMTP id x19so29904384lfa.2
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 07:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lHwv9rrrj94Qi3gfeNI/KoVoNtRL6kWDTevIu+XGiro=;
 b=WxHzOZ9CmJfoaF3ewuzKg7JHDm+Km1okQa24NQUGfT27sn/pfk6Rqkx/DeusnxDzzS
 7+eIrjpnoHCm7AyDRIcanyhMwcPF+5wKmLw5+YWHjGqaJY1Of7PzzEkgSxxhS+tqx2R6
 a6lxbNEHnH30gPENXpzqxhnqjUM6C5sV7CsqulJep59PvMOpRP0/zPeASxNvhdlDwh+y
 6Bmuc0j1jyJSRVPIRbEyhf1Kb09IiAlqWl1fAtBXvg99zyUpCAvRlD2kkgB9ipAuabbH
 TtTLuOz+F3QeOgp4qpKLJEikor1eJUbtjJaPelQXBlS/aceqX0huq3ie+fachqZ6urri
 F3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lHwv9rrrj94Qi3gfeNI/KoVoNtRL6kWDTevIu+XGiro=;
 b=OlxF54DEM1qoLdTgR426s0zD9ffGyNlem4Q7kCDLG1L7giLE9TQySMba4CKxjfr6bc
 smHhiUaCHinEJsaSYZkW+NLZ0arftlMUEoHNB8M/+9tmIt86Zsho+OH5PvaMjs7DZySV
 jlUqRQ/JefBxKovES5jXgpoYhSjeH6IZ4EnLPsgV/YdF5HhR45TIVP/g9LnX5/rMQ0Eg
 qhnlXVGVNRX4aLN/YLxtquxSK13+LXJa4VmdJVmQ54/jmVMtYTns6RNUAAdE0B+FF01B
 WwQbSn834/ZfFwxh9wXDBL9g10tGCUV+Gnoj9w05xrwwuppanNFByYbdUulG870MUJDf
 DAqQ==
X-Gm-Message-State: AOAM530eB8eVuruUcQWTY6tFMYWzmBpNH/HedckEgqCkLVCC7Ghmhmsf
 2BNrJduorG0sPgAkQhYLpLimsDFXpvA=
X-Google-Smtp-Source: ABdhPJwPl4jf0HgoY+37TVPQok2G1WB9U0OEhCLaqZhpuYz+rlN/dCc8xsCKChYE9DJECX9IWg+O6A==
X-Received: by 2002:a05:6512:2215:: with SMTP id
 h21mr2293051lfu.375.1621605833303; 
 Fri, 21 May 2021 07:03:53 -0700 (PDT)
Received: from octofox.metropolis ([5.18.202.173])
 by smtp.gmail.com with ESMTPSA id b125sm632703lfd.196.2021.05.21.07.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 07:03:52 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] target/xtensa updates
Date: Fri, 21 May 2021 07:03:34 -0700
Message-Id: <20210521140334.16786-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

please pull the following updates for the target/xtensa.

The following changes since commit 972e848b53970d12cb2ca64687ef8ff797fb6236:

  Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210520-v2' into staging (2021-05-20 18:42:00 +0100)

are available in the Git repository at:

  git://github.com/OSLL/qemu-xtensa.git tags/20210521-xtensa

for you to fetch changes up to 583e6a5f55d4b02f04eda0cd70bf7b7701a08450:

  target/xtensa: clean up unaligned access (2021-05-20 13:02:58 -0700)

----------------------------------------------------------------
target/xtensa updates for v6.1:

- don't generate extra EXCP_DEBUG on exception
- fix l32ex access ring
- clean up unaligned access

----------------------------------------------------------------
Max Filippov (3):
      target/xtensa: don't generate extra EXCP_DEBUG on exception
      target/xtensa: fix access ring in l32ex
      target/xtensa: clean up unaligned access

 default-configs/targets/xtensa-linux-user.mak   |   1 -
 default-configs/targets/xtensa-softmmu.mak      |   1 -
 default-configs/targets/xtensaeb-linux-user.mak |   1 -
 default-configs/targets/xtensaeb-softmmu.mak    |   1 -
 target/xtensa/cpu.c                             |   1 -
 target/xtensa/cpu.h                             |   7 -
 target/xtensa/exc_helper.c                      |   5 -
 target/xtensa/helper.c                          |  13 +-
 target/xtensa/translate.c                       | 126 +++++++-------
 tests/tcg/xtensa/test_load_store.S              | 221 ++++++++++++++++++++++++
 10 files changed, 288 insertions(+), 89 deletions(-)
 create mode 100644 tests/tcg/xtensa/test_load_store.S

-- 
Thanks.
-- Max

