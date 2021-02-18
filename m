Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237C831F1BB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 22:31:31 +0100 (CET)
Received: from localhost ([::1]:47236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCqtW-0005PF-4N
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 16:31:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3KdsuYAMKCqIFLGIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--dje.bounces.google.com>)
 id 1lCqnJ-0001bz-Or
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 16:25:07 -0500
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:41193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3KdsuYAMKCqIFLGIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--dje.bounces.google.com>)
 id 1lCqnF-0000tO-BN
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 16:25:05 -0500
Received: by mail-pf1-x44a.google.com with SMTP id u67so2265305pfc.8
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 13:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=hi/P8TpdmKKaXgtKNlkuqelvabgJNEYJrozUFErAwJg=;
 b=jRZytNepxhyXYOWJOAFoCdnPgpjlriQYCwVzwUFQJVOzhNyes4RrChqiIsAwRwa/9C
 AsjS+GjQgBI+rZtV5VzZ9mDd5l0F0f6RtjBIlveIw0M0osI0unOcxEhid1RcoyM+ayhV
 dnI9O6BXA2w3ae/C6PGJpyr16pM3/9Q42OcOsBb/xhUgaKJU7GwA6bKYYFK6IRLE7+cQ
 whGqbt3A0lUagfqhuCkMliV2uBzK6Nlp0m2qJwbR97MG2BD7N/ozlv/d39dm4RndUal9
 NwvC+vNW7RM/bnMEQO7SenRITlyHVHn58FbUGVXWAmSf3GvWBgG0u7SuSMKo+V2REM5n
 NZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=hi/P8TpdmKKaXgtKNlkuqelvabgJNEYJrozUFErAwJg=;
 b=CZljZvdS7XZCDiU5BZdxm1lUcVHTATrh/HORtjH9sGoGZ2n8EKgK+Zb05bt0MPNymF
 ELSrSF+gVVDNxN7CYSDTe5NFNkevUZstair7Z+vlyWU97MN7XQF+m0y5pJXZHV5zlfRA
 ZxHBpCqCZNX2Y3oYIcinPsj+Bj8GdQlh8XjrpoSH4a5tDzx6RnNIMWVrxzErVKbtphI8
 xpt99wtoKwowtY4kJSJbyBy0t331d3Dme7p4vPwsWrGvuteoeLfPQgEz3e6riyNYd8e8
 HvrgcJhjkiI1aR9WCSzq/VZ0d+3ZyULiaZ6JA6Ju6AsUjc638GvPC+pzwYH/zSzBthfe
 ZS5g==
X-Gm-Message-State: AOAM533lkbhH6cREckOBTeBvHbk9t6oA+fEfP46SWhB7OrB1dvAaUAJG
 EHdvigXckfKLKQfKCMGo25t7o+aiyV/MPDbh7huhw6YXZ7tC8Hwae5lAW+J3kg2iFznhMQvoNPS
 6O9cicJuQq3e4RsGDSbFk2wZWQcbE6g+Z/Yn3QYTaOMchAjX+g2zn
X-Google-Smtp-Source: ABdhPJx+RXCg3NDrf8W9StSaZo7WTeFq0QNsCcc5MM0Cz8cEPY2jAph8paX7TY0aZusA2xtstborbKo=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:4cc1:c5e:b49d:b16f])
 (user=dje job=sendgmr) by 2002:a17:90a:c695:: with SMTP id
 n21mr5923270pjt.207.1613683497452; Thu, 18 Feb 2021 13:24:57 -0800 (PST)
Date: Thu, 18 Feb 2021 13:24:50 -0800
Message-Id: <20210218212453.831406-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH v5 0/3] Add npcm7xx emc model
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hao Wu <wuhaotsh@google.com>, Avi Fishman <avi.fishman@nuvoton.com>, 
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3KdsuYAMKCqIFLGIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--dje.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Doug Evans <dje@google.com>
From:  Doug Evans via <qemu-devel@nongnu.org>

This is a 10/100 ethernet device that has several features.
Only the ones needed by the Linux driver have been implemented.
See npcm7xx_emc.c for a list of unimplemented features.

Doug Evans (3):
  hw/net: Add npcm7xx emc model
  hw/arm: Add npcm7xx emc model
  tests/qtests: Add npcm7xx emc model test

 docs/system/arm/nuvoton.rst    |   3 +-
 hw/arm/npcm7xx.c               |  50 +-
 hw/net/meson.build             |   1 +
 hw/net/npcm7xx_emc.c           | 857 ++++++++++++++++++++++++++++++++
 hw/net/trace-events            |  17 +
 include/hw/arm/npcm7xx.h       |   2 +
 include/hw/net/npcm7xx_emc.h   | 286 +++++++++++
 tests/qtest/meson.build        |   3 +-
 tests/qtest/npcm7xx_emc-test.c | 862 +++++++++++++++++++++++++++++++++
 9 files changed, 2077 insertions(+), 4 deletions(-)
 create mode 100644 hw/net/npcm7xx_emc.c
 create mode 100644 include/hw/net/npcm7xx_emc.h
 create mode 100644 tests/qtest/npcm7xx_emc-test.c

-- 
2.30.0.617.g56c4b15f3c-goog

Differences from v4:

1/3 hw/net: Add npcm7xx emc model
- no change

2/3 hw/arm: Add npcm7xx emc model
- no change

3/3 tests/qtests: Add npcm7xx emc model test
- handle --disable-slirp

Differences from v3:

1/3 hw/net: Add npcm7xx emc model
- no change

2/3 hw/arm: Add npcm7xx emc model
- no change

3/3 tests/qtests: Add npcm7xx emc model test
- handle big endian hosts, tested on sparc64

Differences from v2:

1/3 hw/net: Add npcm7xx emc model
- move call to qemu_set_irq
- remove use of C99 mixed decls/statements
- add use of g_autofree

2/3 hw/arm: Add npcm7xx emc model
- none, patch ok as is

3/3 tests/qtests: Add npcm7xx emc model test
- remove use of C99 mixed decls/statements

